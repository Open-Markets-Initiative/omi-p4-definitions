# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM_UDP = "cme/mdp3/cme_globex_mdp3_v1_12_udp.p4"
JSON_UDP = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "cme_globex_mdp3_v1_12_udp.json")
PROGRAM_TCP = "cme/mdp3/cme_globex_mdp3_v1_12_tcp.p4"
JSON_TCP = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "cme_globex_mdp3_v1_12_tcp.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CmeGlobexMdp3V112UdpTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_UDP, "-o", JSON_UDP], check=True)
        cls.switch = switch.Switch(JSON_UDP)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_mdincrementalrefreshbooklongqty(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/MdIncrementalRefreshBookLongQty.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_mdincrementalrefreshtradesummarylongqty(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/MdIncrementalRefreshTradeSummaryLongQty.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


class CmeGlobexMdp3V112TcpTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_TCP, "-o", JSON_TCP], check=True)
        cls.switch = switch.Switch(JSON_TCP)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_marketdatarequest(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/MarketDataRequest.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_requestack(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/RequestAck.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitylistrequest(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/SecurityListRequest.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatusrequest(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/SecurityStatusRequest.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitystatus(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/SecurityStatus.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_mdinstrumentdefinitionfx(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/MdInstrumentDefinitionFx.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_snapshotfullrefreshtcplongqty(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/SnapshotFullRefreshTcpLongQty.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_subscriberheartbeat(self):
        for payload in payloads.of("omi-data-packets/Cme/Globex.Mdp3.v1.12/SubscriberHeartbeat.Tcp.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
