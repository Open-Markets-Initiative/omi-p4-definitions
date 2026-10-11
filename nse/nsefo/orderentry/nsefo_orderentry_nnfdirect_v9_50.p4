// P4_16 (v1model) definition for: Nse NseFo OrderEntry NnfDirect v9.50
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End Direct Interface
//   Version: 9.50
//   Date: 7/27/2026
//   Specification: TP_FO_Trimmed_NNF_PROTOCOL_9.50_20260820170606.pdf
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

header direct_packet_t {
    bit<16> packet_length;
    bit<32> packet_sequence_number;
    bit<128> checksum;
    bit<16> transaction_code;
    bit<32> log_time;
    bit<16> alpha_char;
    bit<32> trader_id;
    bit<16> error_code;
    bit<64> header_timestamp;
    bit<64> time_stamp_1;
    bit<64> time_stamp_2;
    bit<16> message_length;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    direct_packet_t direct_packet;
}

parser NsefoOrderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.direct_packet);
        transition accept;
    }

}

control NsefoOrderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoOrderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsefoOrderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsefoOrderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoOrderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.direct_packet);
    }
}

V1Switch(
    NsefoOrderentryParser(),
    NsefoOrderentryVerifyChecksum(),
    NsefoOrderentryIngress(),
    NsefoOrderentryEgress(),
    NsefoOrderentryComputeChecksum(),
    NsefoOrderentryDeparser()
) main;
