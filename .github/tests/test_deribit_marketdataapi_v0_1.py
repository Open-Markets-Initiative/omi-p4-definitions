# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "coinbase/deribit/marketdataapi/deribit_marketdataapi_v0_1.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "deribit_marketdataapi_v0_1.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class DeribitMarketdataapiV01Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_askdeletemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/AskDeleteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_askputmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/AskPutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_askqtyreducedmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/AskQtyReducedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_biddeletemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/BidDeleteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_bidputmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/BidPutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_bidqtyreducedmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/BidQtyReducedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_endofcyclemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/EndOfCycleMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_instrumentmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/InstrumentMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_snapshottrailermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/SnapshotTrailerMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_starbasemarketdata(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.MarketDataApi.Sbe.v0.1/StarbaseMarketData.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
