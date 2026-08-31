# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/bbo/nyseequities_bbo_v2_5_b.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_bbo_v2_5_b.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesBboV25BTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_quotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.Bbo.Pillar.v2.5.b/QuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshheadermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.Bbo.Pillar.v2.5.b/RefreshHeaderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.Bbo.Pillar.v2.5.b/SecurityStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sourcetimereferencemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.Bbo.Pillar.v2.5.b/SourceTimeReferenceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
