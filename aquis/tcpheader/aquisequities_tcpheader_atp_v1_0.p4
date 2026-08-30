// P4_16 (v1model) definition for: Aquis AquisEquities TcpHeader Atp v1.0
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Tcp Headers
//   Encoding: Aquis Trading Protocol
//   Version: 1.0
//   Date: 8/1/2025
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

header message_header_t {
    bit<16> msg_length;
    bit<8> msg_type;
    bit<32> msg_seq_no;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
}

parser AquisequitiesTcpheaderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition accept;
    }

}

control AquisequitiesTcpheaderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesTcpheaderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AquisequitiesTcpheaderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisequitiesTcpheaderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesTcpheaderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
    }
}

V1Switch(
    AquisequitiesTcpheaderParser(),
    AquisequitiesTcpheaderVerifyChecksum(),
    AquisequitiesTcpheaderIngress(),
    AquisequitiesTcpheaderEgress(),
    AquisequitiesTcpheaderComputeChecksum(),
    AquisequitiesTcpheaderDeparser()
) main;
