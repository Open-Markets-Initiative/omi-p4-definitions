// P4_16 (v1model) definition for: Nasdaq NsmEquities Orders Ouch v4.2
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Orders
//   Encoding: Ouch
//   Version: 4.2
//   Date: 7/8/2019
//   Specification: OUCH4.2.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
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
    bit<112> order_token;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
    bit<32> time_in_force;
    bit<32> firm;
    bit<8> display;
    bit<8> capacity;
    bit<8> intermarket_sweep_eligibility;
    bit<32> minimum_quantity;
    bit<8> cross_type;
    bit<8> customer_type;
}

header replace_order_message_t {
    bit<112> existing_order_token;
    bit<112> replacement_order_token_token_14;
    bit<32> shares;
    bit<32> price;
    bit<32> time_in_force;
    bit<8> display;
    bit<8> intermarket_sweep_eligibility;
    bit<32> minimum_quantity;
}

header cancel_order_message_t {
    bit<112> order_token;
    bit<32> shares;
}

header modify_order_message_t {
    bit<112> order_token;
    bit<8> buy_sell_indicator;
    bit<32> shares;
}

header trade_now_message_t {
    bit<112> order_token;
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
    trade_now_message_t trade_now_message;
}

parser NsmequitiesOrdersTcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x4e: parse_trade_now_message;
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

    state parse_trade_now_message {
        packet.extract(hdr.trade_now_message);
        transition accept;
    }

}

control NsmequitiesOrdersTcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesOrdersTcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesOrdersTcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesOrdersTcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesOrdersTcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order_message);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.cancel_order_message);
        packet.emit(hdr.modify_order_message);
        packet.emit(hdr.trade_now_message);
    }
}

V1Switch(
    NsmequitiesOrdersTcpParser(),
    NsmequitiesOrdersTcpVerifyChecksum(),
    NsmequitiesOrdersTcpIngress(),
    NsmequitiesOrdersTcpEgress(),
    NsmequitiesOrdersTcpComputeChecksum(),
    NsmequitiesOrdersTcpDeparser()
) main;
