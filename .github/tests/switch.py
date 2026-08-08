# Generated bmv2 harness: replays raw protocol payloads through a compiled program on veth pairs

import subprocess
import time

from scapy.all import Raw, sendp, AsyncSniffer

# port 0 receives on veth1 (peer veth0); port 1 forwards on veth3 (peer veth2)
INGRESS = "veth0"
EGRESS = "veth2"
SWITCH = "simple_switch"


def _veth(left, right):
    subprocess.run(["ip", "link", "delete", left], stderr=subprocess.DEVNULL)
    subprocess.run(["ip", "link", "add", left, "type", "veth", "peer", "name", right], check=True)
    for interface in (left, right):
        subprocess.run(["ip", "link", "set", interface, "up"], check=True)
        subprocess.run(["sysctl", "-w", f"net.ipv6.conf.{interface}.disable_ipv6=1"], stdout=subprocess.DEVNULL)


class Switch:

    def __init__(self, program):
        self.program = program
        self.process = None

    def start(self):
        _veth("veth0", "veth1")
        _veth("veth2", "veth3")
        self.process = subprocess.Popen(
            [SWITCH, "--log-console", "-i", "0@veth1", "-i", "1@veth3", self.program],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        time.sleep(2)

    def stop(self):
        if self.process is not None:
            self.process.terminate()
            self.process.wait()
        for interface in ("veth0", "veth2"):
            subprocess.run(["ip", "link", "delete", interface], stderr=subprocess.DEVNULL)

    def accepts(self, payload):
        # The parser dictates acceptance: parsed packets are forwarded to port 1, rejects are dropped
        sniffer = AsyncSniffer(iface=EGRESS, count=1, store=True)
        sniffer.start()
        time.sleep(0.1)
        sendp(Raw(load=payload), iface=INGRESS, verbose=False)
        sniffer.join(timeout=2)
        results = sniffer.stop() or []
        return len(results) > 0
