# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/nyseequities/integratedfeed/nyseequities_integratedfeed_v2_3_a.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_integratedfeed_v2_3_a.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesIntegratedfeedV23ATests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addorderrefreshmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Xdp.v2.3.a/AddOrderRefreshMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_refreshheadermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Xdp.v2.3.a/RefreshHeaderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Xdp.v2.3.a/SecurityStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.IntegratedFeed.Xdp.v2.3.a/SymbolIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
