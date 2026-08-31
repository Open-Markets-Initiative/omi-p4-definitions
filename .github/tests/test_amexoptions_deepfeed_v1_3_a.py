# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/amexoptions/deepfeed/amexoptions_deepfeed_v1_3_a.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "amexoptions_deepfeed_v1_3_a.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class AmexoptionsDeepfeedV13ATests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_outrightmarketdepthbuymessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.DeepFeed.Xdp.v1.3.a/OutrightMarketDepthBuyMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrightmarketdepthsellmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.DeepFeed.Xdp.v1.3.a/OutrightMarketDepthSellMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshoutrightmarketdepthbuymessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.DeepFeed.Xdp.v1.3.a/RefreshOutrightMarketDepthBuyMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshoutrightmarketdepthsellmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.DeepFeed.Xdp.v1.3.a/RefreshOutrightMarketDepthSellMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_streamidmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.DeepFeed.Xdp.v1.3.a/StreamIdMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
