# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "moex/spectra/orderslogincremental/spectra_orderslogincremental_v8_0_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "spectra_orderslogincremental_v8_0_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class SpectraOrderslogincrementalV800Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_bestpricesmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OrdersLogIncremental.Simba.v8.0.0/BestPricesMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutionmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OrdersLogIncremental.Simba.v8.0.0/OrderExecutionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderupdatemessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OrdersLogIncremental.Simba.v8.0.0/OrderUpdateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
