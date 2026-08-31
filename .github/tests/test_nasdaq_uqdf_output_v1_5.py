# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nasdaq/uqdf/output/nasdaq_uqdf_output_v1_5.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nasdaq_uqdf_output_v1_5.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NasdaqUqdfOutputV15Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_limituplimitdownpricebandmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/Uqdf.Output.Utp.v1.5/LimitUpLimitDownPriceBandMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quotelongformmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/Uqdf.Output.Utp.v1.5/QuoteLongFormMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_quoteshortformmessage(self):
        for payload in payloads.of("omi-data-packets/Nasdaq/Uqdf.Output.Utp.v1.5/QuoteShortFormMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
