// P4_16 (v1model) definition for: Nse NseCm DropCopy NnfDc v3.0
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Drop Copy
//   Encoding: Non-Neat Front End Drop Copy
//   Version: 3.0
//   Date: 9/1/2025
//   Specification: DC_CM_Normal_DROPCOPY_PROTOCOL_3.0_0.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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

header request_message_header_t {
    bit<16> packet_length;
    bit<32> packet_sequence_number;
    bit<128> checksum;
    bit<16> transaction_code;
    bit<32> trader_id;
    bit<64> request_sequence_number;
    bit<48> partition_id;
    bit<16> concurrent_login_id;
    bit<8> func_indc;
    bit<8> reserve;
}

header dc_signon_in_message_t {
    bit<64> password;
    bit<64> session_key;
}

header dc_trd_subscription_request_message_t {
    bit<64> sequence_number;
}

header dc_ont_subscription_request_message_t {
    bit<64> sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    request_message_header_t request_message_header;
    dc_signon_in_message_t dc_signon_in_message;
    dc_trd_subscription_request_message_t dc_trd_subscription_request_message;
    dc_ont_subscription_request_message_t dc_ont_subscription_request_message;
}

parser NsecmDropcopyClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.request_message_header);
        transition select(hdr.request_message_header.transaction_code) {
            16w2400: parse_gr_request_message;
            16w23008: parse_gr_secure_user_registration_request_message;
            16w23506: parse_heartbeat_message;
            16w2500: parse_dc_signon_in_message;
            16w8000: parse_dc_trd_subscription_request_message;
            16w9000: parse_dc_ont_subscription_request_message;
            default: accept;
        }
    }

    state parse_gr_request_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gr_secure_user_registration_request_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_signon_in_message {
        packet.extract(hdr.dc_signon_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_trd_subscription_request_message {
        packet.extract(hdr.dc_trd_subscription_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_ont_subscription_request_message {
        packet.extract(hdr.dc_ont_subscription_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmDropcopyClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmDropcopyClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmDropcopyClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmDropcopyClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmDropcopyClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.request_message_header);
        packet.emit(hdr.dc_signon_in_message);
        packet.emit(hdr.dc_trd_subscription_request_message);
        packet.emit(hdr.dc_ont_subscription_request_message);
    }
}

V1Switch(
    NsecmDropcopyClientParser(),
    NsecmDropcopyClientVerifyChecksum(),
    NsecmDropcopyClientIngress(),
    NsecmDropcopyClientEgress(),
    NsecmDropcopyClientComputeChecksum(),
    NsecmDropcopyClientDeparser()
) main;
