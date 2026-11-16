# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/arcaoptions/deepfeed/arcaoptions_deepfeed_v1_2_m.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "arcaoptions_deepfeed_v1_2_m.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class ArcaoptionsDeepfeedV12MTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_optionsaddordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsAddOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionscrosstrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsCrossTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsdeleteordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsDeleteOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsimbalancemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsImbalanceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsmodifyordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsModifyOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsnondisplayedtrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsNonDisplayedTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsorderexecutionmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsOrderExecutionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsreplaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionsstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OptionsStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_outrightseriesindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/OutrightSeriesIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/SecurityStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sourcetimereferencemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/SourceTimeReferenceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolclearmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/SymbolClearMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaOptions.DeepFeed.Pillar.v1.2.m/SymbolIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
