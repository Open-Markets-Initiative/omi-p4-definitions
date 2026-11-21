// P4_16 (v1model) definition for: Nse NseIx DropCopy NnfDirect v1.6
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Drop Copy
//   Encoding: Non-Neat Front End Direct Interface
//   Version: 1.6
//   Date: 10/1/2025
//   Specification: NSEIFSC_DROP_COPY_PROTOCOL_v1_6_20260324141958.pdf
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
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<16> packet_length;
    bit<32> packet_sequence_number;
}

header client_registration_packet_t {
    bit<128> registration_checksum;
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
    bit<64> password;
    bit<64> reserved_8;
    bit<240> reserved_30;
    bit<40> broker_id;
    bit<952> reserved_119;
}

header dc_download_request_message_t {
    bit<64> sequence_number;
}

header dc_order_request_message_t {
    bit<64> order_sequence_number;
}

header dc_ord_trd_request_message_t {
    bit<64> order_trade_sequence_number;
}

header client_session_packet_t {
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
    packet_header_t packet_header;
    client_registration_packet_t client_registration_packet;
    signon_in_message_t signon_in_message;
    dc_download_request_message_t dc_download_request_message;
    dc_order_request_message_t dc_order_request_message;
    dc_ord_trd_request_message_t dc_ord_trd_request_message;
    client_session_packet_t client_session_packet;
}

parser NseixDropcopyClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(packet.lookahead<bit<144>>()[15:0]) {
            16w23008: parse_client_registration_packet;
            default: parse_client_session_packet;
        }
    }

    state parse_client_registration_packet {
        packet.extract(hdr.client_registration_packet);
        meta.dispatched = 1;
        transition select(hdr.client_registration_packet.transaction_code) {
            16w2300: parse_signon_in_message;
            16w23506: parse_heartbeat_message;
            16w8000: parse_dc_download_request_message;
            16w8400: parse_dc_order_request_message;
            16w8500: parse_dc_ord_trd_request_message;
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

    state parse_dc_order_request_message {
        packet.extract(hdr.dc_order_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_ord_trd_request_message {
        packet.extract(hdr.dc_ord_trd_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_session_packet {
        packet.extract(hdr.client_session_packet);
        transition select(hdr.client_session_packet.transaction_code) {
            16w2300: parse_signon_in_message;
            16w23506: parse_heartbeat_message;
            16w8000: parse_dc_download_request_message;
            16w8400: parse_dc_order_request_message;
            16w8500: parse_dc_ord_trd_request_message;
            default: accept;
        }
    }

}

control NseixDropcopyClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseixDropcopyClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NseixDropcopyClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NseixDropcopyClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseixDropcopyClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.client_registration_packet);
        packet.emit(hdr.signon_in_message);
        packet.emit(hdr.dc_download_request_message);
        packet.emit(hdr.dc_order_request_message);
        packet.emit(hdr.dc_ord_trd_request_message);
        packet.emit(hdr.client_session_packet);
    }
}

V1Switch(
    NseixDropcopyClientParser(),
    NseixDropcopyClientVerifyChecksum(),
    NseixDropcopyClientIngress(),
    NseixDropcopyClientEgress(),
    NseixDropcopyClientComputeChecksum(),
    NseixDropcopyClientDeparser()
) main;
