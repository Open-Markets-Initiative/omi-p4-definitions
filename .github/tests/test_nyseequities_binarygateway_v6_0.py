# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM_CLIENTPILLARMESSAGE = "nyse/nyseequities/binarygateway/nyseequities_binarygateway_v6_0_clientpillarmessage.p4"
JSON_CLIENTPILLARMESSAGE = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_binarygateway_v6_0_clientpillarmessage.json")
PROGRAM_SERVERPILLARMESSAGE = "nyse/nyseequities/binarygateway/nyseequities_binarygateway_v6_0_serverpillarmessage.p4"
JSON_SERVERPILLARMESSAGE = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "nyseequities_binarygateway_v6_0_serverpillarmessage.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class NyseequitiesBinarygatewayV60ClientPillarMessageTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_CLIENTPILLARMESSAGE, "-o", JSON_CLIENTPILLARMESSAGE], check=True)
        cls.switch = switch.Switch(JSON_CLIENTPILLARMESSAGE)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_loginmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/LoginMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_newordersingleandcancelreplacerequestmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/NewOrderSingleAndCancelReplaceRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_open(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/Open.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


class NyseequitiesBinarygatewayV60ServerPillarMessageTests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM_SERVERPILLARMESSAGE, "-o", JSON_SERVERPILLARMESSAGE], check=True)
        cls.switch = switch.Switch(JSON_SERVERPILLARMESSAGE)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_closeresponse(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/CloseResponse.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_equitiessymbolreferencedatamessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/EquitiesSymbolReferenceDataMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_executionreportmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/ExecutionReportMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_loginresponse(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/LoginResponse.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_openresponse(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/OpenResponse.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderandcancelreplaceacknowledgementmessage(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/OrderAndCancelReplaceAcknowledgementMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_streamavail(self):
        for payload in payloads.of("omi-data-packets/Nyse/NyseEquities.BinaryGateway.PillarStream.v6.0/StreamAvail.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
