// P4_16 (v1model) definition for: Nse NseCm Recovery Binary v7.1
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Mtbt Tick Data Recovery
//   Encoding: Binary
//   Version: 7.1
//   Date: 9/1/2026
//   Specification: MTBT_CM_NNF_PROTOCOL_7.1_20260902170834.pdf
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
    bit<8> client_message_type;
}

header tick_data_recovery_request_message_t {
    bit<16> stream_id;
    bit<32> start_sequence_number;
    bit<32> end_sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    tick_data_recovery_request_message_t tick_data_recovery_request_message;
}

parser NsecmRecoveryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.client_message_type) {
            8w0x52: parse_tick_data_recovery_request_message;
            default: accept;
        }
    }

    state parse_tick_data_recovery_request_message {
        packet.extract(hdr.tick_data_recovery_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmRecoveryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmRecoveryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmRecoveryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmRecoveryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmRecoveryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.tick_data_recovery_request_message);
    }
}

V1Switch(
    NsecmRecoveryClientParser(),
    NsecmRecoveryClientVerifyChecksum(),
    NsecmRecoveryClientIngress(),
    NsecmRecoveryClientEgress(),
    NsecmRecoveryClientComputeChecksum(),
    NsecmRecoveryClientDeparser()
) main;
