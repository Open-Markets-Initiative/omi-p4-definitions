# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/bqt/nyseequities_bqt_v2_1_a.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_bqt_v2_1_a.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesBqtV21ATests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_consolidatedstocksummarymessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.Bqt.Xdp.v2.1.a/ConsolidatedStockSummaryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.Bqt.Xdp.v2.1.a/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
