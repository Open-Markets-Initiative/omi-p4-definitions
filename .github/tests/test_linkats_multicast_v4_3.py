# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "otcmarkets/linkats/multicast/linkats_multicast_v4_3.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "linkats_multicast_v4_3.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class LinkatsMulticastV43Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_endofspin12(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/EndOfSpin.12.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_marketclose14(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/MarketClose.14.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_marketopen13(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/MarketOpen.13.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quote1(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/Quote.1.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quoteupdate2(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/QuoteUpdate.2.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_security9(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/Security.9.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_startofspin11(self):
        for payload in payloads.of("omi-data-packets/OtcMarkets/LinkAts.Multicast.Link.v4.3/StartOfSpin.11.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
