// P4_16 (v1model) definition for: Nasdaq NsmEquities Orders Ouch v5.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Orders
//   Encoding: Ouch
//   Version: 5.0
//   Date: 4/1/2023
//   Specification: OUCH5.0.pdf
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
    bit<32> user_ref_num;
    bit<8> side;
    bit<32> quantity;
    bit<64> symbol;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> display;
    bit<8> capacity;
    bit<8> inter_market_sweep_eligibility;
    bit<8> cross_type;
    bit<112> clordid;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> enter_order_optional_field;
}

header replace_order_message_t {
    bit<32> orig_user_ref_num;
    bit<32> user_ref_num;
    bit<32> quantity;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> display;
    bit<8> inter_market_sweep_eligibility;
    bit<112> clordid;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> replace_order_optional_field;
}

header cancel_order_message_t {
    bit<32> user_ref_num;
    bit<32> quantity;
}

header modify_order_message_t {
    bit<32> user_ref_num;
    bit<8> side;
    bit<32> quantity;
}

header account_query_message_t {
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> account_query_optional_field;
}

struct metadata_t {
}

struct headers_t {
    client_packet_header_t client_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    enter_order_message_t enter_order_message;
    replace_order_message_t replace_order_message;
    cancel_order_message_t cancel_order_message;
    modify_order_message_t modify_order_message;
    account_query_message_t account_query_message;
}

parser NsmequitiesOrdersClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            8w0x4f: parse_enter_order_message;
            8w0x55: parse_replace_order_message;
            8w0x58: parse_cancel_order_message;
            8w0x4d: parse_modify_order_message;
            8w0x51: parse_account_query_message;
            default: accept;
        }
    }

    state parse_enter_order_message {
        packet.extract(hdr.enter_order_message);
        transition accept;
    }

    state parse_replace_order_message {
        packet.extract(hdr.replace_order_message);
        transition accept;
    }

    state parse_cancel_order_message {
        packet.extract(hdr.cancel_order_message);
        transition accept;
    }

    state parse_modify_order_message {
        packet.extract(hdr.modify_order_message);
        transition accept;
    }

    state parse_account_query_message {
        packet.extract(hdr.account_query_message);
        transition accept;
    }

}

control NsmequitiesOrdersClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesOrdersClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesOrdersClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesOrdersClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesOrdersClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order_message);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.cancel_order_message);
        packet.emit(hdr.modify_order_message);
        packet.emit(hdr.account_query_message);
    }
}

V1Switch(
    NsmequitiesOrdersClientParser(),
    NsmequitiesOrdersClientVerifyChecksum(),
    NsmequitiesOrdersClientIngress(),
    NsmequitiesOrdersClientEgress(),
    NsmequitiesOrdersClientComputeChecksum(),
    NsmequitiesOrdersClientDeparser()
) main;
