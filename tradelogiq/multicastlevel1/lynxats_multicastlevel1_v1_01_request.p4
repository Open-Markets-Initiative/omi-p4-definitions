// P4_16 (v1model) definition for: Tradelogiq MulticastLevel1 Itch v1.01
// 
// Protocol:
//   Organization: Tradelogiq Markets Inc.
//   Protocol: Lynx Multicast Level 1
//   Encoding: Itch
//   Version: 1.01
//   Date: 01/30/2022
//   Specification: TradelogiQ-Level-1-ITCH-5.0-Specification-v1.01.pdf
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

parser LynxatsMulticastlevel1RequestParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.request_packet);
        transition accept;
    }

}

control LynxatsMulticastlevel1RequestVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LynxatsMulticastlevel1RequestIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LynxatsMulticastlevel1RequestEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LynxatsMulticastlevel1RequestComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LynxatsMulticastlevel1RequestDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.request_packet);
    }
}

V1Switch(
    LynxatsMulticastlevel1RequestParser(),
    LynxatsMulticastlevel1RequestVerifyChecksum(),
    LynxatsMulticastlevel1RequestIngress(),
    LynxatsMulticastlevel1RequestEgress(),
    LynxatsMulticastlevel1RequestComputeChecksum(),
    LynxatsMulticastlevel1RequestDeparser()
) main;
