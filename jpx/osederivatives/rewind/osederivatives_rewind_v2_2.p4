// P4_16 (v1model) definition for: Jpx OseDerivatives Rewind Itch v2.2
// 
// Protocol:
//   Organization: Japan Exchange Group
//   Protocol: Rewind
//   Encoding: Itch
//   Version: 2.2
//   Date: 10/31/2025
//   Specification: J-GATE3.0_ITCH_Connectivity_Manual_V2.2.pdf
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

header rewind_request_packet_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> requested_message_count;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    rewind_request_packet_t rewind_request_packet;
}

parser OsederivativesRewindParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.rewind_request_packet);
        transition accept;
    }

}

control OsederivativesRewindVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesRewindIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control OsederivativesRewindEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsederivativesRewindComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesRewindDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.rewind_request_packet);
    }
}

V1Switch(
    OsederivativesRewindParser(),
    OsederivativesRewindVerifyChecksum(),
    OsederivativesRewindIngress(),
    OsederivativesRewindEgress(),
    OsederivativesRewindComputeChecksum(),
    OsederivativesRewindDeparser()
) main;
