// P4_16 (v1model) definition for: Biva BivaEquities OrderEntry Ouch v1.05
// 
// Protocol:
//   Organization: Bolsa Institucional de Valores
//   Protocol: Order Entry
//   Encoding: Ouch
//   Version: 1.05
//   Date: 1/1/2016
//   Specification: BIVA_External_OUCH_Specification_v1.05.pdf
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_t {
    bit<8> unsequenced_message_type;
}

header enter_order_message_t {
    bit<32> order_token;
    bit<8> account_type;
    bit<32> account_id;
    bit<8> order_verb;
    bit<64> quantity;
    bit<32> orderbook;
    bit<32> price;
    bit<32> time_in_force;
    bit<32> client_id;
    bit<64> minimum_quantity;
}

header replace_order_message_t {
    bit<32> existing_order_token;
    bit<32> replacement_order_token;
    bit<64> quantity;
    bit<32> price;
}

header cancel_order_message_t {
    bit<32> order_token;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    enter_order_message_t enter_order_message;
    replace_order_message_t replace_order_message;
    cancel_order_message_t cancel_order_message;
}

parser BivaequitiesOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat;
            8w0x4f: parse_logout_request;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            8w0x4f: parse_enter_order_message;
            8w0x55: parse_replace_order_message;
            8w0x58: parse_cancel_order_message;
            default: accept;
        }
    }

    state parse_enter_order_message {
        packet.extract(hdr.enter_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replace_order_message {
        packet.extract(hdr.replace_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_message {
        packet.extract(hdr.cancel_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        meta.dispatched = 1;
        transition accept;
    }

}

control BivaequitiesOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BivaequitiesOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BivaequitiesOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order_message);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.cancel_order_message);
    }
}

V1Switch(
    BivaequitiesOrderentryClientParser(),
    BivaequitiesOrderentryClientVerifyChecksum(),
    BivaequitiesOrderentryClientIngress(),
    BivaequitiesOrderentryClientEgress(),
    BivaequitiesOrderentryClientComputeChecksum(),
    BivaequitiesOrderentryClientDeparser()
) main;
