# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "coinbase/coinbasederivatives/ordersapi/coinbasederivatives_ordersapi_v1_3.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "coinbasederivatives_ordersapi_v1_3.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CoinbasederivativesOrdersapiV13Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_cancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/CancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_cancelorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/CancelOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_lastexecidmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/LastExecIdMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_lastexecidrequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/LastExecIdRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_loggedoutmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/LoggedOutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logonconfmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/LogonConfMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logonmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/LogonMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logoutmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/LogoutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelorderackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/MassCancelOrderAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/MassCancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/MassCancelOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_newordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/NewOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordercanceledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/OrderCanceledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderenteredmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/OrderEnteredMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderfilledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/OrderFilledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/OrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderreplacedmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/OrderReplacedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_pingmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/PingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_pongmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/PongMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_replaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/ReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_setaccountmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/SetAccountMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_setackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/SetAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_settradermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/SetTraderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_streamordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/StreamOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_unlocktradingackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/UnlockTradingAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_unlocktradingmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.3/UnlockTradingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
