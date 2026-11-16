# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "nyse/arcaequities/arcabook/arcaequities_arcabook_v1_9_a.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "arcaequities_arcabook_v1_9_a.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class ArcaequitiesArcabookV19ATests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.ArcaBook.Xdp.v1.9.a/AddOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_deleteordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.ArcaBook.Xdp.v1.9.a/DeleteOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_executionmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.ArcaBook.Xdp.v1.9.a/ExecutionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_imbalancemessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.ArcaBook.Xdp.v1.9.a/ImbalanceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_modifyordermessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/ArcaEquities.ArcaBook.Xdp.v1.9.a/ModifyOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
