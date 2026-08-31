# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "iex/iexequities/deepplus/iexequities_deepplus_v1_01.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "iexequities_deepplus_v1_01.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class IexequitiesDeepplusV101Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_tradebreakmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/B_TradeBreak.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securitydirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/D_SecurityDirectory.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_securityevent(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/E_SecurityEvent.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradingstatus(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/H_TradingStatus.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_retailliquidityindicator(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/I_RetailLiquidityIndicator.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/L_OrderExecuted.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordermodifymessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/M_OrderModify.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_operationalhaltstatus(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/O_OperationalHaltStatus.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_shortsalepriceteststatus(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/P_ShortSalePriceTestStatus.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderdeletemessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/R_OrderDelete.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_systemevent(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/S_SystemEvent.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_trademessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/T_Trade.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_addordermessage(self):
        for payload in payloads.of("omi-data-packets/Iex/IexEquities.DeepPlus.IexTp.v1.0.2/a_AddOrder.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
