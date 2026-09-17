# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "ice/icefutures/mdf/icefutures_mdf_v1_1_33.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "icefutures_mdf_v1_1_33.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class IcefuturesMdfV1133Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addormodifymessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/AddOrModifyMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_deleteordermessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/DeleteOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_marketsnapshotmessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/MarketSnapShotMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_marketsnapshotordermessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/MarketSnapshotOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_marketstatisticsmessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/MarketStatisticsMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_messagebundlemarker(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/MessageBundleMarker.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_newoptionsstrategydefinintionmessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/NewOptionsStrategyDefinintionMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_specialfieldmessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/SpecialFieldMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_trademessage(self):
        for payload in payloads.of("omi-data-packets/Ice/IceFutures.Mdf.iMpact.v1.1.33/TradeMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
