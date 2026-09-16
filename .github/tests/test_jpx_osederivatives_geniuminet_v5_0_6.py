# Generated P4 definition tests: p4c compiles the program, bmv2 replays captures through it

import os
import subprocess
import sys
import unittest

sys.path.insert(0, ".github/tests")

import payloads
import switch

PROGRAM = "jpx/osederivatives/geniuminet/jpx_osederivatives_geniuminet_v5_0_6.p4"
JSON = os.path.join(os.environ.get("RUNNER_TEMP", "/tmp"), "jpx_osederivatives_geniuminet_v5_0_6.json")
P4C = os.environ.get("P4C", "p4c-bm2-ss")


class JpxOsederivativesGeniuminetV506Tests(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        subprocess.run([P4C, PROGRAM, "-o", JSON], check=True)
        cls.switch = switch.Switch(JSON)
        cls.switch.start()

    @classmethod
    def tearDownClass(cls):
        cls.switch.stop()

    def test_addordernompid(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/AddOrderNoMpid.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_equilibriumpriceupdate(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/EquilibriumPriceUpdate.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderbookstatemessage(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/OrderBookStateMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderdeletemessage(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/OrderDeleteMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedmessage(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/OrderExecutedMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_orderexecutedwithpricemessage(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/OrderExecutedWithPriceMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")

    def test_secondsmessage(self):
        for payload in payloads.of("omi-data-packets/Jpx/OseDerivatives.GeniumInet.Itch.v5.0.6/SecondsMessage.pcap"):
            self.assertTrue(self.switch.accepts(payload), "bmv2 parser rejected a captured packet")


if __name__ == "__main__":
    unittest.main()
