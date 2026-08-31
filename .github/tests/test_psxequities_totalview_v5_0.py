# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nasdaq/psxequities/totalview/psxequities_totalview_v5_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "psxequities_totalview_v5_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class PsxequitiesTotalviewV50Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordernompidattributionmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/AddOrderNoMpidAttributionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_addorderwithmpidattributionmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/AddOrderWithMpidAttributionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordercancelmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/OrderCancelMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderdeletemessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/OrderDeleteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedwithpricemessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/OrderExecutedWithPriceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderreplacemessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/OrderReplaceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_regshoshortsalepricetestrestrictedindicatormessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/RegShoShortSalePriceTestRestrictedIndicatorMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_stocktradingactionmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/StockTradingActionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_systemeventmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/SystemEventMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_trademessagenoncross(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/PsxEquities.TotalView.Itch.v5.0.20230822/TradeMessageNon-cross.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
