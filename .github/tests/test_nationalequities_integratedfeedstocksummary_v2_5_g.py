# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nationalequities/integratedfeedstocksummary/nationalequities_integratedfeedstocksummary_v2_5_g.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nationalequities_integratedfeedstocksummary_v2_5_g.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NationalequitiesIntegratedfeedstocksummaryV25GTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_stocksummarymessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NationalEquities.IntegratedFeedStockSummary.Pillar.v2.5.g/StockSummaryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
