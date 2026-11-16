# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/amexoptions/topfeed/amexoptions_topfeed_v1_2_k.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "amexoptions_topfeed_v1_2_k.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class AmexoptionsTopfeedV12KTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_optionsquotemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/OptionsQuoteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/OptionsStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrightseriesindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/OutrightSeriesIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/SecurityStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sourcetimereferencemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/SourceTimeReferenceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolclearmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/SymbolClearMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexOptions.TopFeed.Pillar.v1.2.k/SymbolIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
