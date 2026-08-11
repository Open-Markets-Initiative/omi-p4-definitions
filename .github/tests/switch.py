# Generated bmv2 harness: replays raw protocol payloads through a compiled program on veth pairs.
# Standard library only (no scapy): AF_PACKET raw sockets inject on the ingress veth and receive
# on the egress veth, so it runs in the p4lang/p4c container without installing anything.

import socket
import subprocess
import time

# port 0 receives on veth1 (peer veth0); port 1 forwards on veth3 (peer veth2)
INGRESS = "veth0"
EGRESS = "veth2"
SWITCH = "simple_switch"


def _veth(left, right):
    subprocess.run(["ip", "link", "delete", left], stderr=subprocess.DEVNULL)
    subprocess.run(["ip", "link", "add", left, "type", "veth", "peer", "name", right], check=True)
    for interface in (left, right):
        subprocess.run(["ip", "link", "set", interface, "up"], check=True)
        subprocess.run(["sysctl", "-w", f"net.ipv6.conf.{interface}.disable_ipv6=1"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


class Switch:

    def __init__(self, program):
        self.program = program
        self.process = None
        self.tx = None
        self.rx = None

    def start(self):
        _veth("veth0", "veth1")
        _veth("veth2", "veth3")
        self.process = subprocess.Popen(
            [SWITCH, "-i", "0@veth1", "-i", "1@veth3", self.program],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        time.sleep(3)
        self.tx = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(3))
        self.tx.bind((INGRESS, 0))
        self.rx = socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(3))
        self.rx.bind((EGRESS, 0))
        self.rx.settimeout(1.5)

    def stop(self):
        if self.process is not None:
            self.process.terminate()
            self.process.wait()
        for interface in ("veth0", "veth2"):
            subprocess.run(["ip", "link", "delete", interface], stderr=subprocess.DEVNULL)

    def accepts(self, payload):
        # The parser dictates acceptance: parsed packets are forwarded to port 1, rejects are dropped.
        # Ethernet requires a 60 byte minimum frame, so short payloads are zero padded.
        frame = payload if len(payload) >= 60 else payload + b"\x00" * (60 - len(payload))
        try:
            self.tx.send(frame)
        except OSError:
            return False
        try:
            return bool(self.rx.recv(65535))
        except socket.timeout:
            return False
