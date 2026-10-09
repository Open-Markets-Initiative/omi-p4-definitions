// P4_16 (v1model) definition for: Tradelogiq MulticastLevel2 Itch v2.01
// 
// Protocol:
//   Organization: Tradelogiq Markets Inc.
//   Protocol: Lynx Multicast Level 2
//   Encoding: Itch
//   Version: 2.01
//   Date: 01/13/2026
//   Specification: TMI-Level-2-ITCH-5.0-Specification-v2.01.pdf
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

header request_packet_t {
    bit<80> request_session;
    bit<64> request_sequence_number;
    bit<16> requested_message_count;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    request_packet_t request_packet;
}

parser LynxatsMulticastlevel2RequestParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.request_packet);
        transition accept;
    }

}

control LynxatsMulticastlevel2RequestVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LynxatsMulticastlevel2RequestIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LynxatsMulticastlevel2RequestEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LynxatsMulticastlevel2RequestComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LynxatsMulticastlevel2RequestDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.request_packet);
    }
}

V1Switch(
    LynxatsMulticastlevel2RequestParser(),
    LynxatsMulticastlevel2RequestVerifyChecksum(),
    LynxatsMulticastlevel2RequestIngress(),
    LynxatsMulticastlevel2RequestEgress(),
    LynxatsMulticastlevel2RequestComputeChecksum(),
    LynxatsMulticastlevel2RequestDeparser()
) main;
