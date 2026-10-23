# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nysebonds/depthofbook/nysebonds_depthofbook_v4_01_b_server.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nysebonds_depthofbook_v4_01_b.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NysebondsDepthofbookV401BTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseBonds.DepthOfBook.Abp.v4.01.b/AddOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_deleteordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseBonds.DepthOfBook.Abp.v4.01.b/DeleteOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
