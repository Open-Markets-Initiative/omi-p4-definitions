# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "iex/iexequities/tops/iexequities_tops_v1_56.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "iexequities_tops_v1_56.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class IexequitiesTopsV156Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_auctioninformationmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/AuctionInformationMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_officialpricemessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/OfficialPriceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_operationalhaltstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/OperationalHaltStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quoteupdatemessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/QuoteUpdateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitydirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/SecurityDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_shortsalepriceteststatusmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/ShortSalePriceTestStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_systemeventmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/SystemEventMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradereportmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/TradeReportMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradingstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.Tops.v1.5/TradingStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
