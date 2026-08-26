# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "eurex/eobi/eurex_t7_eobi_v6_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "eurex_t7_eobi_v6_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class EurexT7EobiV60Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_executionsummary(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/ExecutionSummary.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_fullorderexecution(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/FullOrderExecution.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_instrumentsummary(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/InstrumentSummary.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderadd(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/OrderAdd.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordermodify(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/OrderModify.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_partialorderexecution(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/PartialOrderExecution.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_productsummary(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/ProductSummary.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_snapshotorder(self):
        for payload in payloads.of("omi-data-packets/Eurex/T7.Eobi.v6.0/SnapshotOrder.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
