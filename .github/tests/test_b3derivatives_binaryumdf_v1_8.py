# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "b3/binaryumdf/b3derivatives_binaryumdf_v1_8.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "b3derivatives_binaryumdf_v1_8.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class B3derivativesBinaryumdfV18Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_securitydefinitionmessage(self):
        for payload in payloads.of("omi-data-packets/B3/BinaryUmdf.v1.8/SecurityDefinitionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequence(self):
        for payload in payloads.of("omi-data-packets/B3/BinaryUmdf.v1.8/Sequence.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
