# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "cme/ilink3/cme_globex_ilink3_v8_5_server.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "cme_globex_ilink3_v8_5.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CmeGlobexIlink3V85Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_executionreportstatus(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.iLink3.Sbe.v8.5/ExecutionReportStatus.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quotecancel(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.iLink3.Sbe.v8.5/QuoteCancel.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quotecancelack(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.iLink3.Sbe.v8.5/QuoteCancelAck.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequence(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.iLink3.Sbe.v8.5/Sequence.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
