# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nasdaq/nsmequities/orders/nsmequities_orders_v5_0_server.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nsmequities_orders_v5_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NsmequitiesOrdersV50Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_cancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/NsmEquities.Orders.Ouch.v5.0/CancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_canceledmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/NsmEquities.Orders.Ouch.v5.0/CanceledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_clientheartbeat(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/NsmEquities.Orders.Ouch.v5.0/ClientHeartbeatPacket.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_enterordermessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/NsmEquities.Orders.Ouch.v5.0/EnterOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderacceptedmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/NsmEquities.Orders.Ouch.v5.0/OrderAcceptedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_serverheartbeat(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/NsmEquities.Orders.Ouch.v5.0/ServerHeartbeatPacket.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
