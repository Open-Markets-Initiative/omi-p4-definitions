// P4_16 (v1model) definition for: Nse NseCd DropCopy NnfDirect v1.7
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Drop Copy
//   Encoding: Non-Neat Front End Direct Interface
//   Version: 1.7
//   Date: 9/1/2022
//   Specification: DC_CUR_Normal_DROPCOPY_PROTOCOL_1.7_1.pdf
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

header message_header_t {
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

header signon_in_message_t {
    bit<32> user_id;
    bit<64> reserved_8;
    bit<96> password;
    bit<32> reserved_4;
    bit<304> reserved_38;
    bit<40> broker_id;
    bit<952> reserved_119;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header dc_download_request_message_t {
    bit<64> sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    signon_in_message_t signon_in_message;
    dc_download_request_message_t dc_download_request_message;
}

parser NsecdDropcopyClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w2300: parse_signon_in_message;
            16w23506: parse_heartbeat_message;
            16w8000: parse_dc_download_request_message;
            default: accept;
        }
    }

    state parse_signon_in_message {
        packet.extract(hdr.signon_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_download_request_message {
        packet.extract(hdr.dc_download_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecdDropcopyClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecdDropcopyClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecdDropcopyClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecdDropcopyClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecdDropcopyClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.signon_in_message);
        packet.emit(hdr.dc_download_request_message);
    }
}

V1Switch(
    NsecdDropcopyClientParser(),
    NsecdDropcopyClientVerifyChecksum(),
    NsecdDropcopyClientIngress(),
    NsecdDropcopyClientEgress(),
    NsecdDropcopyClientComputeChecksum(),
    NsecdDropcopyClientDeparser()
) main;
