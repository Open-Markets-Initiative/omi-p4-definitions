# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/texasequities/integratedfeed/texasequities_integratedfeed_v2_5_g.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "texasequities_integratedfeed_v2_5_g.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class TexasequitiesIntegratedfeedV25GTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/AddOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_deleteordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/DeleteOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_modifyordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/ModifyOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_nondisplayedtrademessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/NonDisplayedTradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutionmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/OrderExecutionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_replaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/ReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/SecurityStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sourcetimereferencemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/TexasEquities.IntegratedFeed.Pillar.v2.5.g/SourceTimeReferenceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
