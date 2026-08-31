# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "blueoceanats/blueequities/memoirlastsale/blueequities_memoirlastsale_v1_3.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "blueequities_memoirlastsale_v1_3.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class BlueequitiesMemoirlastsaleV13Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_instrumentdirectorymessage(self):
        for payload in payloads.of("omi-data-packets/BlueOceanAts/BlueEquities.MemoirLastSale.Sbe.v1.3/InstrumentDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitytradingstatusmessage(self):
        for payload in payloads.of("omi-data-packets/BlueOceanAts/BlueEquities.MemoirLastSale.Sbe.v1.3/SecurityTradingStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradereportmessage(self):
        for payload in payloads.of("omi-data-packets/BlueOceanAts/BlueEquities.MemoirLastSale.Sbe.v1.3/TradeReportMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradingsessionstatusmessage(self):
        for payload in payloads.of("omi-data-packets/BlueOceanAts/BlueEquities.MemoirLastSale.Sbe.v1.3/TradingSessionStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
