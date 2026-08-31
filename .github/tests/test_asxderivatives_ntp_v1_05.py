# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "asx/asxderivatives/ntp/asxderivatives_ntp_v1_05.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "asxderivatives_ntp_v1_05.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class AsxderivativesNtpV105Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordermessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/AddOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_anomalousorderthresholdpublishmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/AnomalousOrderThresholdPublishMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_auctionorderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/AuctionOrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_combinationorderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/CombinationOrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_combinationsymboldirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/CombinationSymbolDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_combinationtradeexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/CombinationTradeExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_equilibriumpricemessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/EquilibriumPriceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_futuresymboldirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/FutureSymbolDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_heartbeat(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/Heartbeat.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_impliedorderaddedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/ImpliedOrderAddedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_impliedorderdeletedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/ImpliedOrderDeletedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_impliedorderreplacedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/ImpliedOrderReplacedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_openhighlowlasttradeadjustmentmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/OpenHighLowLastTradeAdjustmentMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_optionssymboldirectorymessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/OptionsSymbolDirectoryMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderbookstatemessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/OrderBookStateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderdeletedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/OrderDeletedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordervolumecancelledmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/OrderVolumeCancelledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_seconds(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/Seconds.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_textmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/TextMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_tradeexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Asx/AsxDerivatives.Ntp.Itch.v1.05/TradeExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
