// P4_16 (v1model) definition for: A2X TcpHeader Atp v1
// 
// Protocol:
//   Organization: A2X Markets
//   Protocol: Tcp Headers
//   Encoding: Aquis Trading Protocol
//   Version: 1
//   Date: 8/1/2017
//   Specification: Unknown
// 
// Byte order: little (P4 extracts in network/big-endian order)
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

header message_t {
    bit<16> length;
    bit<8> msg_type;
    bit<32> msg_seq_no;
}

header message_payload_t {
    varbit<2048> payload;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_t message;
    message_payload_t message_payload;
}

parser A2xequitiesTcpheaderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message);
        packet.extract(hdr.message_payload, (bit<32>)hdr.message.length * 8);
        transition accept;
    }

}

control A2xequitiesTcpheaderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xequitiesTcpheaderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control A2xequitiesTcpheaderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control A2xequitiesTcpheaderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xequitiesTcpheaderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message);
        packet.emit(hdr.message_payload);
    }
}

V1Switch(
    A2xequitiesTcpheaderParser(),
    A2xequitiesTcpheaderVerifyChecksum(),
    A2xequitiesTcpheaderIngress(),
    A2xequitiesTcpheaderEgress(),
    A2xequitiesTcpheaderComputeChecksum(),
    A2xequitiesTcpheaderDeparser()
) main;
