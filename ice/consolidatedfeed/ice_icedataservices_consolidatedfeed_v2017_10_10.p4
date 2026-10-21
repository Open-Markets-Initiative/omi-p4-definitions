// P4_16 (v1model) definition for: Ice ConsolidatedFeed Ctf v2017.10.10
// 
// Protocol:
//   Organization: Intercontinental Exchange
//   Protocol: ConsolidatedFeed
//   Encoding: Consolidated Ticker Feed
//   Version: 2017.10.10
//   Date: 10/10/2017
//   Specification: CTF_Wire_Protocol_2017-10-10.pdf
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

header frame_header_t {
    bit<8> frame_start;
    bit<8> protocol_signature;
    bit<32> length;
    bit<8> frame_end;
}

header frame_header_payload_t {
    varbit<2048> payload;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    frame_header_t frame_header;
    frame_header_payload_t frame_header_payload;
}

parser IceIcedataservicesConsolidatedfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.frame_header);
        packet.extract(hdr.frame_header_payload, (bit<32>)hdr.frame_header.length * 8);
        transition accept;
    }

}

control IceIcedataservicesConsolidatedfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IceIcedataservicesConsolidatedfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IceIcedataservicesConsolidatedfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IceIcedataservicesConsolidatedfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IceIcedataservicesConsolidatedfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.frame_header);
        packet.emit(hdr.frame_header_payload);
    }
}

V1Switch(
    IceIcedataservicesConsolidatedfeedParser(),
    IceIcedataservicesConsolidatedfeedVerifyChecksum(),
    IceIcedataservicesConsolidatedfeedIngress(),
    IceIcedataservicesConsolidatedfeedEgress(),
    IceIcedataservicesConsolidatedfeedComputeChecksum(),
    IceIcedataservicesConsolidatedfeedDeparser()
) main;
