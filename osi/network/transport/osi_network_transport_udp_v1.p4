// P4_16 (v1model) definition for: Osi Network Transport Udp v1
// 
// Protocol:
//   Organization: Open Systems Interconnection
//   Protocol: Transport
//   Encoding: User Datagram Protocol
//   Version: 1
//   Date: 10/5/2026
//   Specification: Unknown
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: Public/GPLv3
//   Authors: Omi Developers
// 
// Copyright (c) 2026 Scaled Sources LLC.  https://www.scaledsources.com
// 
// The protocol compiler technologies used to produce this file are the subject of
// patents owned by Scaled Sources LLC.  Those patent rights are retained and are
// not transferred by this contribution:
//   https://patents.google.com/patent/US20240129382A1/en
//   https://patents.google.com/patent/US20240419416A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header udp_datagram_t {
    bit<16> udp_source_port;
    bit<16> udp_destination_port;
    bit<16> udp_length;
    bit<16> udp_checksum;
}

header udp_datagram_udp_payload_t {
    varbit<2048> udp_payload;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    udp_datagram_t udp_datagram;
    udp_datagram_udp_payload_t udp_datagram_udp_payload;
}

parser OsiNetworkTransportParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.udp_datagram);
        packet.extract(hdr.udp_datagram_udp_payload, (bit<32>)hdr.udp_datagram.udp_length * 8);
        transition accept;
    }

}

control OsiNetworkTransportVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkTransportIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control OsiNetworkTransportEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsiNetworkTransportComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkTransportDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.udp_datagram);
        packet.emit(hdr.udp_datagram_udp_payload);
    }
}

V1Switch(
    OsiNetworkTransportParser(),
    OsiNetworkTransportVerifyChecksum(),
    OsiNetworkTransportIngress(),
    OsiNetworkTransportEgress(),
    OsiNetworkTransportComputeChecksum(),
    OsiNetworkTransportDeparser()
) main;
