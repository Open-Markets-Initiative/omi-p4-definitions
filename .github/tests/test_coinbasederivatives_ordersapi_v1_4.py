# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "coinbase/coinbasederivatives/ordersapi/coinbasederivatives_ordersapi_v1_4.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "coinbasederivatives_ordersapi_v1_4.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class CoinbasederivativesOrdersapiV14Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_cancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/CancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_cancelorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/CancelOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_instrumentinfomessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/InstrumentInfoMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_instrumentinforequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/InstrumentInfoRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_lastexecidmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/LastExecIdMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_lastexecidrequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/LastExecIdRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_loggedoutmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/LoggedOutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logonconfmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/LogonConfMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logonmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/LogonMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_logoutmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/LogoutMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelorderackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/MassCancelOrderAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/MassCancelOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_masscancelorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/MassCancelOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_newordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/NewOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_ordercanceledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/OrderCanceledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderenteredmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/OrderEnteredMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderfilledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/OrderFilledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/OrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderreplacedmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/OrderReplacedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_pingmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/PingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_pongmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/PongMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_replaceordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/ReplaceOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_setaccountmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/SetAccountMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_setackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/SetAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_settradermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/SetTraderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_streamordermessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/StreamOrderMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_unlocktradingackmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/UnlockTradingAckMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_unlocktradingmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/CoinbaseDerivatives.OrdersApi.Sbe.v1.4/UnlockTradingMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
