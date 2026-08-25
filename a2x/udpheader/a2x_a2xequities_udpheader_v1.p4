// P4_16 (v1model) definition for: A2X A2XEquities UdpHeader Amd v1
// 
// Protocol:
//   Organization: A2X Markets
//   Protocol: Udp Headers
//   Encoding: Aquis Market Data Protocol
//   Version: 1
//   Date: 9/1/2017
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<8> message_count;
    bit<8> msg_type;
    bit<8> msg_length;
    bit<32> seq_no;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
}

parser A2xA2xequitiesUdpheaderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition accept;
    }

}

control A2xA2xequitiesUdpheaderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xA2xequitiesUdpheaderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control A2xA2xequitiesUdpheaderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control A2xA2xequitiesUdpheaderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xA2xequitiesUdpheaderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
    }
}

V1Switch(
    A2xA2xequitiesUdpheaderParser(),
    A2xA2xequitiesUdpheaderVerifyChecksum(),
    A2xA2xequitiesUdpheaderIngress(),
    A2xA2xequitiesUdpheaderEgress(),
    A2xA2xequitiesUdpheaderComputeChecksum(),
    A2xA2xequitiesUdpheaderDeparser()
) main;
