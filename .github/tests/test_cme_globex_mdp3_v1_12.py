# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "cme/mdp3/cme_globex_mdp3_v1_12_udp.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "cme_globex_mdp3_v1_12.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CmeGlobexMdp3V112Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_mdincrementalrefreshbooklongqty(self):
        for payload in payloads.of("omi-data-packets/Cme/Mdp3.Sbe.v1.12/MdIncrementalRefreshBookLongQty.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_mdincrementalrefreshtradesummarylongqty(self):
        for payload in payloads.of("omi-data-packets/Cme/Mdp3.Sbe.v1.12/MdIncrementalRefreshTradeSummaryLongQty.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
