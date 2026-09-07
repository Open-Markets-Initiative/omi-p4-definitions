// P4_16 (v1model) definition for: Aquis AquisEquities UdpHeader Amd v1.0
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Udp Headers
//   Encoding: Aquis Market Data Protocol
//   Version: 1.0
//   Date: 8/1/2025
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

header message_header_t {
    bit<8> message_count;
}

header message_header_message_t {
    bit<8> msg_type;
    bit<8> msg_length;
    bit<32> seq_no;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> message_header_message_remaining;
}

struct headers_t {
    message_header_t message_header;
    message_header_message_t message_header_message[MAX_MESSAGES];
}

parser AquisequitiesUdpheaderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        meta.message_header_message_remaining = hdr.message_header.message_count;
        transition select(meta.message_header_message_remaining) {
            8w0: accept;
            default: parse_message_header_message;
        }
    }

    state parse_message_header_message {
        packet.extract(hdr.message_header_message.next);
        meta.message_header_message_remaining = meta.message_header_message_remaining - 1;
        transition select(meta.message_header_message_remaining) {
            8w0: accept;
            default: parse_message_header_message;
        }
    }

}

control AquisequitiesUdpheaderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesUdpheaderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AquisequitiesUdpheaderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisequitiesUdpheaderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesUdpheaderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.message_header_message);
    }
}

V1Switch(
    AquisequitiesUdpheaderParser(),
    AquisequitiesUdpheaderVerifyChecksum(),
    AquisequitiesUdpheaderIngress(),
    AquisequitiesUdpheaderEgress(),
    AquisequitiesUdpheaderComputeChecksum(),
    AquisequitiesUdpheaderDeparser()
) main;
