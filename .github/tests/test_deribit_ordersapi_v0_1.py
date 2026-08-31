# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "coinbase/deribit/ordersapi/deribit_ordersapi_v0_1.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "deribit_ordersapi_v0_1.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class DeribitOrdersapiV01Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_amendorderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/AmendOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_amendorderrequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/AmendOrderRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_amendorderresponsemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/AmendOrderResponseMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_cancelorderrequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/CancelOrderRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_cancelorderresponsemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/CancelOrderResponseMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_massquoterejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/MassQuoteRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_massquoterequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/MassQuoteRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_massquoteresponsemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/MassQuoteResponseMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_neworderrejectmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/NewOrderRejectMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_neworderrequestmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/NewOrderRequestMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_neworderresponsemessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/NewOrderResponseMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderfilledmessage(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/OrderFilledMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_starbaseorderentry(self):
        for payload in payloads.of("omi-data-packets/Coinbase/Deribit.OrdersApi.Sbe.v0.1/StarbaseOrderEntry.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
