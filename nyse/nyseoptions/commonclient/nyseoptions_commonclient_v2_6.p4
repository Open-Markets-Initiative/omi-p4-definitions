// P4_16 (v1model) definition for: Nyse NyseOptions CommonClient Pillar v2.6
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Common Client
//   Encoding: Pillar
//   Version: 2.6
//   Date: 8/3/2022
//   Specification: Pillar_Options_Common_Client_Specification.pdf
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

header packet_header_t {
    bit<16> pkt_size;
    bit<8> delivery_flag;
    bit<8> number_msgs;
    bit<32> seq_num;
    bit<32> seconds;
    bit<32> nanoseconds;
}

header message_t {
    bit<16> message_size;
    bit<16> message_type;
}

header message_payload_t {
    varbit<2048> payload;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    message_payload_t message_payload;
}

parser NyseoptionsCommonclientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.delivery_flag) {
            8w1: parse_heartbeat;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        packet.extract(hdr.message_payload, (bit<32>)hdr.message.last.message_size * 8);
        transition parse_message;
    }

}

control NyseoptionsCommonclientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseoptionsCommonclientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NyseoptionsCommonclientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NyseoptionsCommonclientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseoptionsCommonclientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.message_payload);
    }
}

V1Switch(
    NyseoptionsCommonclientParser(),
    NyseoptionsCommonclientVerifyChecksum(),
    NyseoptionsCommonclientIngress(),
    NyseoptionsCommonclientEgress(),
    NyseoptionsCommonclientComputeChecksum(),
    NyseoptionsCommonclientDeparser()
) main;
