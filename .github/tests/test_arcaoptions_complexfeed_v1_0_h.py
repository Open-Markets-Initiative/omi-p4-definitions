# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/arcaoptions/complexfeed/arcaoptions_complexfeed_v1_0_h.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "arcaoptions_complexfeed_v1_0_h.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class ArcaoptionsComplexfeedV10HTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_complexseriesindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.ComplexFeed.Pillar.v1.0.h/ComplexSeriesIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsquotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.ComplexFeed.Pillar.v1.0.h/OptionsQuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.ComplexFeed.Pillar.v1.0.h/OptionsStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionstrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.ComplexFeed.Pillar.v1.0.h/OptionsTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sourcetimereferencemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.ComplexFeed.Pillar.v1.0.h/SourceTimeReferenceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolclearmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.ComplexFeed.Pillar.v1.0.h/SymbolClearMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
