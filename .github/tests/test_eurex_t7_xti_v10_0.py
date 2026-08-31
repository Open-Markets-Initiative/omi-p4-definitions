# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "eurex/xti/eurex_t7_xti_v10_0_server.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "eurex_t7_xti_v10_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class EurexT7XtiV100Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_orderexecresponse(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Xti.Fbe.v10.0/OrderExecResponse.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
