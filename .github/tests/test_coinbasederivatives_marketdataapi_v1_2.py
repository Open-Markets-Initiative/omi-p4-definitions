# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "coinbase/coinbasederivatives/marketdataapi/coinbasederivatives_marketdataapi_v1_2.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "coinbasederivatives_marketdataapi_v1_2.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CoinbasederivativesMarketdataapiV12Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_orderdeletemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.MarketDataApi.Sbe.v1.2/OrderDeleteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderputmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.MarketDataApi.Sbe.v1.2/OrderPutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordersnapshotmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.MarketDataApi.Sbe.v1.2/OrderSnapshotMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_startofoutrightinstrumentsnapshotmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.MarketDataApi.Sbe.v1.2/StartOfOutrightInstrumentSnapshotMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_startofspreadinstrumentsnapshotmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.MarketDataApi.Sbe.v1.2/StartOfSpreadInstrumentSnapshotMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
