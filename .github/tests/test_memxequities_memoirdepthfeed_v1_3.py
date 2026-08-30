# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "memx/memxequities/memoirdepthfeed/memxequities_memoirdepthfeed_v1_3.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "memxequities_memoirdepthfeed_v1_3.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class MemxequitiesMemoirdepthfeedV13Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_orderaddedmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/OrderAddedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderdeletedmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/OrderDeletedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderreducedmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/OrderReducedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_regshowrestrictionmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/RegShowRestrictionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitytradingstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/SecurityTradingStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradingsessionstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/TradingSessionStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_multiplemessages(self):
        for payload in payloads.of("omi-data-packets/Memx/MemxEquities.MemoirDepthFeed.Sbe.v1.3/MultipleMessages.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
