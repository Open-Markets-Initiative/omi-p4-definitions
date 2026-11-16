# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "moex/spectra/orderslogsnapshot/spectra_orderslogsnapshot_v8_0_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "spectra_orderslogsnapshot_v8_0_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class SpectraOrderslogsnapshotV800Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_orderbooksnapshotmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OrdersLogSnapshot.Simba.v8.0.0/OrderBookSnapshotMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_sequenceresetmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OrdersLogSnapshot.Simba.v8.0.0/SequenceResetMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
