# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/amexoptions/topfeed/amexoptions_topfeed_v1_3_a.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "amexoptions_topfeed_v1_3_a.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class AmexoptionsTopfeedV13ATests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_outrightboldrfqmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/OutrightBoldRfqMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrightcrossingrfqmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/OutrightCrossingRfqMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrightquotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/OutrightQuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrightseriesstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/OutrightSeriesStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrighttrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/OutrightTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshoutrightquotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/RefreshOutrightQuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshoutrighttrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/RefreshOutrightTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_streamidmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Xdp.v1.3.a/StreamIdMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
