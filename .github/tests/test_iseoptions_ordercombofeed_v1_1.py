# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nasdaq/iseoptions/ordercombofeed/iseoptions_ordercombofeed_v1_1.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "iseoptions_ordercombofeed_v1_1.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class IseoptionsOrdercombofeedV11Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_complexstrategyauctionmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.OrderComboFeed.Itch.v1.1/ComplexStrategyAuctionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complexstrategydirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.OrderComboFeed.Itch.v1.1/ComplexStrategyDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_complexstrategyorderonbookmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.OrderComboFeed.Itch.v1.1/ComplexStrategyOrderOnBookMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.OrderComboFeed.Itch.v1.1/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategyopenclosedmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.OrderComboFeed.Itch.v1.1/StrategyOpenClosedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_strategytradingactionmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/IseOptions.OrderComboFeed.Itch.v1.1/StrategyTradingActionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
