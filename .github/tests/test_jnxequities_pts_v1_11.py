# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM_TCP = "jnx/jnxequities/pts/jnxequities_pts_v1_11_server.p4"
JSON_TCP = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "jnxequities_pts_v1_11_tcp.json")
PROGRAM_TCP = "jnx/jnxequities/pts/jnxequities_pts_v1_11_client.p4"
JSON_TCP = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "jnxequities_pts_v1_11_tcp.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class JnxequitiesPtsV111TcpTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_TCP, "-o", JSON_TCP], check=True)
        cls.switch = switch.Switch(JSON_TCP)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_cancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/CancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordercanceledmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/OrderCanceledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderrejectedmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/OrderRejectedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


class JnxequitiesPtsV111TcpTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_TCP, "-o", JSON_TCP], check=True)
        cls.switch = switch.Switch(JSON_TCP)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_enterordermessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/EnterOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_loginacceptedpacket(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/LoginAcceptedPacket.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_loginrequestpacket(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/LoginRequestPacket.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderacceptedmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/OrderAcceptedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_replaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Ouch.v1.11/ReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
