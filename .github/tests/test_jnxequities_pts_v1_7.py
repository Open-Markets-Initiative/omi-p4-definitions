# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "jnx/jnxequities/pts/jnxequities_pts_v1_7_moldudp64.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "jnxequities_pts_v1_7.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class JnxequitiesPtsV17Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_orderaddedwithoutattributesmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/OrderAddedWithoutAttributesMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderdeletedmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/OrderDeletedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderreplacedmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/OrderReplacedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_secondsmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/SecondsMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_shortsellingpricerestrictionstatemessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/ShortSellingPriceRestrictionStateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_systemeventmessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/SystemEventMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradingstatemessage(self):
        for payload in payloads.of("omi-data-packets/Jnx/JnxEquities.Pts.Itch.v1.7/TradingStateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
