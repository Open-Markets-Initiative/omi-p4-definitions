# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/amexequities/openbook.aggregated/amexequities_openbook.aggregated_v2_1_d.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "amexequities_openbook_aggregated_v2_1_d.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class AmexequitiesOpenbookAggregatedV21DTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_orderbookdeltaupdatemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexEquities.OpenBook.Aggregated.Xdp.v2.1.d/OrderbookDeltaUpdateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderbooksnapshotmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexEquities.OpenBook.Aggregated.Xdp.v2.1.d/OrderbookSnapshotMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequencenumberresetmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexEquities.OpenBook.Aggregated.Xdp.v2.1.d/SequenceNumberResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_symbolindexmappingmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/AmexEquities.OpenBook.Aggregated.Xdp.v2.1.d/SymbolIndexMappingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
