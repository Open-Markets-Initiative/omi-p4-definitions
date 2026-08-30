// P4_16 (v1model) definition for: OtcMarkets LinkAts Headers Link v1
// 
// Protocol:
//   Organization: OTC Markets Group
//   Protocol: 
//   Encoding: Otc Link
//   Version: 1
//   Date: 12/11/2019
//   Specification: OTC Markets Multicast Data Feeds -v4.3.pdf
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
    bit<16> packet_size;
    bit<32> seq_num;
    bit<1> heartbeat;
    bit<1> seq_num_reset;
    bit<4> reserved_4;
    bit<1> replay;
    bit<1> test;
    bit<8> messages;
    bit<32> packet_milli;
    bit<16> message_size;
    bit<8> message_type;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
}

parser LinkatsHeadersParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition accept;
    }

}

control LinkatsHeadersVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsHeadersIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LinkatsHeadersEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LinkatsHeadersComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsHeadersDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
    }
}

V1Switch(
    LinkatsHeadersParser(),
    LinkatsHeadersVerifyChecksum(),
    LinkatsHeadersIngress(),
    LinkatsHeadersEgress(),
    LinkatsHeadersComputeChecksum(),
    LinkatsHeadersDeparser()
) main;
