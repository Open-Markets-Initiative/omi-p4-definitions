# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/amexoptions/complexfeed/amexoptions_complexfeed_v1_3_a.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "amexoptions_complexfeed_v1_3_a.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class AmexoptionsComplexfeedV13ATests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_complexcrossingrfqmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/ComplexCrossingRfqMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complexquotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/ComplexQuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complexstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/ComplexStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complexsymboldefinitionmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/ComplexSymbolDefinitionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complextrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/ComplexTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshcomplexquotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/RefreshComplexQuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshcomplextrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/RefreshComplexTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_streamidmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.ComplexFeed.Xdp.v1.3.a/StreamIdMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
