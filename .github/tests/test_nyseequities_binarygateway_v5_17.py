# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/binarygateway/nyseequities_binarygateway_v5_17.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_binarygateway_v5_17.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesBinarygatewayV517Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_newordersingleandcancelreplacerequestmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v5.17/NewOrderSingleAndCancelReplaceRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
