# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM_CLIENT = "eurex/eti/eurex_t7_eti_v6_1_client.p4"
JSON_CLIENT = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "eurex_t7_eti_v6_1_client.json")
PROGRAM_SERVER = "eurex/eti/eurex_t7_eti_v6_1_server.p4"
JSON_SERVER = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "eurex_t7_eti_v6_1_server.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class EurexT7EtiV61ClientTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_CLIENT, "-o", JSON_CLIENT], check=True)
        cls.switch = switch.Switch(JSON_CLIENT)
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


class EurexT7EtiV61ServerTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_SERVER, "-o", JSON_SERVER], check=True)
        cls.switch = switch.Switch(JSON_SERVER)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_userloginresponse(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eti.Fbe.v6.1/UserLoginResponse.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
