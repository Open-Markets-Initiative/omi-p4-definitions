# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nasdaq/iseoptions/topcomboquotefeed/iseoptions_topcomboquotefeed_v1_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "iseoptions_topcomboquotefeed_v1_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class IseoptionsTopcomboquotefeedV10Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_complexstrategydirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/ComplexStrategyDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complexstrategytickermessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/ComplexStrategyTickerMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategybestaskupdate(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/StrategyBestAskUpdate.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategybestbidandaskupdate(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/StrategyBestBidAndAskUpdate.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategybestbidupdate(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/StrategyBestBidUpdate.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategyopenclosedmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/StrategyOpenClosedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategytradingactionmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.TopComboQuoteFeed.Itch.v1.0/StrategyTradingActionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
