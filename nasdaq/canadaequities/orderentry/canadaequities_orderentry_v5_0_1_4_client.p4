// P4_16 (v1model) definition for: Nasdaq CanadaEquities OrderEntry Ouch v5.0.1.4
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nasdaq Canada Order Entry
//   Encoding: Ouch
//   Version: 5.0.1.4
//   Date: 09/02/2026
//   Specification: nasdaq-canada-ouch.pdf
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
    bit<8> debug_text;
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
    bit<32> order_qty;
    bit<64> price;
    bit<8> side;
    bit<80> symbol;
    bit<8> time_in_force;
    bit<8> ex_destination;
    bit<16> umir_account_type;
    bit<64> umir_user_id;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> enter_order_optional_field;
}

header replace_order_request_message_t {
    bit<32> orig_user_ref_num;
    bit<32> user_ref_num;
    bit<32> order_qty;
    bit<64> price;
    bit<8> side;
    bit<8> time_in_force;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> replace_order_request_optional_field;
}

header cancel_order_request_message_t {
    bit<32> user_ref_num;
    bit<32> order_qty;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> cancel_order_request_optional_field;
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
    replace_order_request_message_t replace_order_request_message;
    cancel_order_request_message_t cancel_order_request_message;
}

parser CanadaequitiesOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x55: parse_replace_order_request_message;
            8w0x58: parse_cancel_order_request_message;
            8w0x51: parse_account_query_request_message;
            default: accept;
        }
    }

    state parse_enter_order_message {
        packet.extract(hdr.enter_order_message);
        meta.dispatched = 1;
        transition select(hdr.enter_order_message.enter_order_optional_field) {
            8w37: parse_user_ref_idx;
            8w1: parse_account;
            8w2: parse_peg_type;
            8w3: parse_min_qty_type;
            8w4: parse_min_qty;
            8w5: parse_max_floor;
            8w6: parse_expire_time;
            8w7: parse_peg_offset;
            8w8: parse_target_strategy;
            8w9: parse_order_origination;
            8w10: parse_routing_arrangement_indicator;
            8w11: parse_basket_trade;
            8w12: parse_program_trade;
            8w14: parse_jitney;
            8w15: parse_gef_eligible;
            8w16: parse_anonymous;
            8w17: parse_umir_regulation_id;
            8w18: parse_bypass;
            8w19: parse_tsxncib;
            8w20: parse_no_trade_feat;
            8w21: parse_no_trade_key;
            8w22: parse_short_marking_exempt;
            8w23: parse_po_comment;
            8w24: parse_display_range;
            8w25: parse_customer_account;
            8w26: parse_algorithm_id;
            8w27: parse_customer_lei;
            8w28: parse_broker_lei;
            8w29: parse_conditional_order;
            8w30: parse_allow_conditional;
            8w31: parse_firm_up_id;
            8w32: parse_cxd_connect;
            8w33: parse_pure_stream_connect;
            8w34: parse_min_rate;
            8w35: parse_max_rate;
            8w39: parse_routing_strategy;
            8w43: parse_handl_inst;
            default: accept;
        }
    }

    state parse_user_ref_idx {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_account {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_peg_type {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_min_qty_type {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_min_qty {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_max_floor {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_expire_time {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_peg_offset {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_target_strategy {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_origination {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_routing_arrangement_indicator {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_basket_trade {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_program_trade {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_jitney {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gef_eligible {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_anonymous {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_umir_regulation_id {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bypass {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tsxncib {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_no_trade_feat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_no_trade_key {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_short_marking_exempt {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_po_comment {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_display_range {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_customer_account {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_algorithm_id {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_customer_lei {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broker_lei {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_conditional_order {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_allow_conditional {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_firm_up_id {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cxd_connect {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_pure_stream_connect {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_min_rate {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_max_rate {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_routing_strategy {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_handl_inst {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replace_order_request_message {
        packet.extract(hdr.replace_order_request_message);
        meta.dispatched = 1;
        transition select(hdr.replace_order_request_message.replace_order_request_optional_field) {
            8w37: parse_user_ref_idx;
            8w3: parse_min_qty_type;
            8w2: parse_peg_type;
            8w4: parse_min_qty;
            8w5: parse_max_floor;
            8w6: parse_expire_time;
            8w7: parse_peg_offset;
            8w8: parse_target_strategy;
            8w9: parse_order_origination;
            8w10: parse_routing_arrangement_indicator;
            8w17: parse_umir_regulation_id;
            8w16: parse_anonymous;
            8w24: parse_display_range;
            8w25: parse_customer_account;
            8w26: parse_algorithm_id;
            8w27: parse_customer_lei;
            8w28: parse_broker_lei;
            8w30: parse_allow_conditional;
            8w32: parse_cxd_connect;
            8w33: parse_pure_stream_connect;
            8w34: parse_min_rate;
            8w35: parse_max_rate;
            8w43: parse_handl_inst;
            default: accept;
        }
    }

    state parse_cancel_order_request_message {
        packet.extract(hdr.cancel_order_request_message);
        meta.dispatched = 1;
        transition select(hdr.cancel_order_request_message.cancel_order_request_optional_field) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_account_query_request_message {
        meta.dispatched = 1;
        transition select(packet.lookahead<bit<8>>()) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
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

control CanadaequitiesOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CanadaequitiesOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control CanadaequitiesOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CanadaequitiesOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CanadaequitiesOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order_message);
        packet.emit(hdr.replace_order_request_message);
        packet.emit(hdr.cancel_order_request_message);
    }
}

V1Switch(
    CanadaequitiesOrderentryClientParser(),
    CanadaequitiesOrderentryClientVerifyChecksum(),
    CanadaequitiesOrderentryClientIngress(),
    CanadaequitiesOrderentryClientEgress(),
    CanadaequitiesOrderentryClientComputeChecksum(),
    CanadaequitiesOrderentryClientDeparser()
) main;
