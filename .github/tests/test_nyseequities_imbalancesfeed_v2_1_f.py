# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/imbalancesfeed/nyseequities_imbalancesfeed_v2_1_f.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_imbalancesfeed_v2_1_f.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesImbalancesfeedV21FTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_imbalancemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.ImbalancesFeed.Xdp.v2.1.f/ImbalanceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_message(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.ImbalancesFeed.Xdp.v2.1.f/SequenceResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
