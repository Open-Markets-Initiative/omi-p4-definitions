# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/arcaequities/bbo/arcaequities_bbo_v2_4_c.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "arcaequities_bbo_v2_4_c.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class ArcaequitiesBboV24CTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_quotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.Bbo.Xdp.v2.4.c/QuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.Bbo.Xdp.v2.4.c/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.Bbo.Xdp.v2.4.c/SymbolIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
