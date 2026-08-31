# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/integratedfeed/nyseequities_integratedfeed_v2_5_g.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_integratedfeed_v2_5_g.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesIntegratedfeedV25GTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/AddOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_crosstrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/CrossTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_deleteordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/DeleteOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_imbalancemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/ImbalanceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_modifyordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/ModifyOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_nondisplayedtrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/NonDisplayedTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutionmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/OrderExecutionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_replaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/ReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_retailpriceimprovementmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/RetailPriceImprovementMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/SecurityStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sourcetimereferencemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/SourceTimeReferenceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolclearmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/SymbolClearMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Pillar.v2.5.g/SymbolIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
