# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "moex/spectra/optinfoincremental/spectra_optinfoincremental_v8_0_0.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "spectra_optinfoincremental_v8_0_0.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class SpectraOptinfoincrementalV800Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_heartbeatmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OptInfoIncremental.Simba.v8.0.0/HeartbeatMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitydefinitionupdatereportmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OptInfoIncremental.Simba.v8.0.0/SecurityDefinitionUpdateReportMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitygroupstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OptInfoIncremental.Simba.v8.0.0/SecurityGroupStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitymassstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OptInfoIncremental.Simba.v8.0.0/SecurityMassStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradingsessionstatusmessage(self):
        for payload in payloads.of("omi-data-packets/Moex/Spectra.OptInfoIncremental.Simba.v8.0.0/TradingSessionStatusMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
