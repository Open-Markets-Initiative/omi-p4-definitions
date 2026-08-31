# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "coinbase/coinbasederivatives/ordersapi/coinbasederivatives_ordersapi_v1_8.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "coinbasederivatives_ordersapi_v1_8.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CoinbasederivativesOrdersapiV18Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_cancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/CancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_cancelorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/CancelOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_lastexecidmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/LastExecIdMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_lastexecidrequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/LastExecIdRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_loggedoutmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/LoggedOutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logonconfmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/LogonConfMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logonmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/LogonMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logoutmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/LogoutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelorderackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/MassCancelOrderAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/MassCancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/MassCancelOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_newordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/NewOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordercanceledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/OrderCanceledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderenteredmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/OrderEnteredMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderfilledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/OrderFilledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/OrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderreplacedmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/OrderReplacedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_pingmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/PingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_pongmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/PongMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_replaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/ReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_setaccountmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/SetAccountMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_setackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/SetAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_settradermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/SetTraderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_unlocktradingackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/UnlockTradingAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_unlocktradingmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.8/UnlockTradingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
