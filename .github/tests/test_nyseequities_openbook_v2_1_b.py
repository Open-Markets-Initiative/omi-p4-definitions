# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/openbook/nyseequities_openbook_v2_1_b.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_openbook_v2_1_b.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesOpenbookV21BTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_deltaupdatemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.OpenBook.Ultra.v2.1.b/DeltaUpdateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_fullupdatemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.OpenBook.Ultra.v2.1.b/FullUpdateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeatmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.OpenBook.Ultra.v2.1.b/HeartbeatMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.OpenBook.Ultra.v2.1.b/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
