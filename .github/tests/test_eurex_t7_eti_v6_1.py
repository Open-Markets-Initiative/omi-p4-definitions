# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "eurex/eti/eurex_t7_eti_v6_1_client.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "eurex_t7_eti_v6_1.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class EurexT7EtiV61Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eti.Fbe.v6.1/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_retransmitmemessagerequest(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eti.Fbe.v6.1/RetransmitMeMessageRequest.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_userloginresponse(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eti.Fbe.v6.1/UserLoginResponse.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
