# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "b3/binaryentrypoint/b3derivatives_binaryentrypoint_v8_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "b3derivatives_binaryentrypoint_v8_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class B3derivativesBinaryentrypointV80Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_negotiaterejectmessage(self):
        for payload in payloads.of("omi-data-packets/B3/B3Derivatives.BinaryEntryPoint.v8.0/NegotiateRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_terminatemessage(self):
        for payload in payloads.of("omi-data-packets/B3/B3Derivatives.BinaryEntryPoint.v8.0/TerminateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
