# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "cixats/marketdatafeed/cixats_cixaspen_marketdatafeed_v1_4.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "cixats_cixaspen_marketdatafeed_v1_4.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CixatsCixaspenMarketdatafeedV14Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_marketeventmessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/MarketEventMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_neworderaddmessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/NewOrderAddMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordercancelallmessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/OrderCancelAllMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderpartialcancelmessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/OrderPartialCancelMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolinformationmessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/SymbolInformationMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolstatemessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/SymbolStateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_trademessage(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/TradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_multiplemessages(self):
        for payload in payloads.of("omi-data-packets/CixAts/CixAspen.MarketDataFeed.Aspen.v1.4/MultipleMessages.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
