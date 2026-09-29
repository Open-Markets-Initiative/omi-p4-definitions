// P4_16 (v1model) definition for: Nasdaq NasdaqCanada OrderEntry Ouch v5.0.1.4
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

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<64> timestamp;
    bit<8> event_code;
}

header order_accepted_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> order_qty;
    bit<64> price;
    bit<8> side;
    bit<80> symbol;
    bit<8> time_in_force;
    bit<8> ex_destination;
    bit<16> umir_account_type;
    bit<64> umir_user_id;
    bit<64> order_reference_number;
    bit<8> order_state;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> order_accepted_optional_field;
}

header order_replaced_message_t {
    bit<64> timestamp;
    bit<32> orig_user_ref_num;
    bit<32> user_ref_num;
    bit<32> order_qty;
    bit<64> price;
    bit<8> side;
    bit<8> time_in_force;
    bit<64> order_reference_number;
    bit<8> order_state;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> order_replaced_optional_field;
}

header order_canceled_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> order_qty;
    bit<32> cancel_reason;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> order_canceled_optional_field;
}

header stp_canceled_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> decrement_shares;
    bit<32> cancel_reason;
    bit<32> quantity_prevented_from_trading;
    bit<64> price;
    bit<8> liquidity_flag;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> stp_canceled_optional_field;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> quantity;
    bit<64> price;
    bit<8> liquidity_flag;
    bit<64> match_number;
    bit<8> exec_broker;
    bit<32> contra_broker;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> order_executed_optional_field;
}

header corrected_trade_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<64> match_number;
    bit<32> quantity;
    bit<64> price;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> corrected_trade_optional_field;
}

header rejected_order_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> reject_reason;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> rejected_order_optional_field;
}

header cancel_reject_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> reject_reason;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> cancel_reject_optional_field;
}

header order_restated_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<8> restate_reason;
    bit<16> appendage_length;
    bit<8> optional_field_length;
    bit<8> order_restated_optional_field;
}

header account_query_response_message_t {
    bit<64> timestamp;
    bit<32> next_user_ref_num;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    order_accepted_message_t order_accepted_message;
    order_replaced_message_t order_replaced_message;
    order_canceled_message_t order_canceled_message;
    stp_canceled_message_t stp_canceled_message;
    order_executed_message_t order_executed_message;
    corrected_trade_message_t corrected_trade_message;
    rejected_order_message_t rejected_order_message;
    cancel_reject_message_t cancel_reject_message;
    order_restated_message_t order_restated_message;
    account_query_response_message_t account_query_response_message;
}

parser NasdaqcanadaOrderentryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat;
            8w0x5a: parse_end_of_session;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x41: parse_order_accepted_message;
            8w0x55: parse_order_replaced_message;
            8w0x43: parse_order_canceled_message;
            8w0x44: parse_stp_canceled_message;
            8w0x45: parse_order_executed_message;
            8w0x42: parse_corrected_trade_message;
            8w0x4a: parse_rejected_order_message;
            8w0x49: parse_cancel_reject_message;
            8w0x52: parse_order_restated_message;
            8w0x51: parse_account_query_response_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_accepted_message {
        packet.extract(hdr.order_accepted_message);
        meta.dispatched = 1;
        transition select(hdr.order_accepted_message.order_accepted_optional_field) {
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
            8w44: parse_reprice_reason;
            8w45: parse_nbbo_setter;
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

    state parse_reprice_reason {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_nbbo_setter {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        meta.dispatched = 1;
        transition select(hdr.order_replaced_message.order_replaced_optional_field) {
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
            8w44: parse_reprice_reason;
            8w45: parse_nbbo_setter;
            default: accept;
        }
    }

    state parse_order_canceled_message {
        packet.extract(hdr.order_canceled_message);
        meta.dispatched = 1;
        transition select(hdr.order_canceled_message.order_canceled_optional_field) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_stp_canceled_message {
        packet.extract(hdr.stp_canceled_message);
        meta.dispatched = 1;
        transition select(hdr.stp_canceled_message.stp_canceled_optional_field) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        meta.dispatched = 1;
        transition select(hdr.order_executed_message.order_executed_optional_field) {
            8w37: parse_user_ref_idx;
            8w38: parse_execute_match;
            8w40: parse_secondary_order_id;
            8w42: parse_broker_pref;
            8w13: parse_principal_trade;
            8w41: parse_wash_trade;
            8w36: parse_cum_rate;
            default: accept;
        }
    }

    state parse_execute_match {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secondary_order_id {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broker_pref {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_principal_trade {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_wash_trade {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cum_rate {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_corrected_trade_message {
        packet.extract(hdr.corrected_trade_message);
        meta.dispatched = 1;
        transition select(hdr.corrected_trade_message.corrected_trade_optional_field) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_rejected_order_message {
        packet.extract(hdr.rejected_order_message);
        meta.dispatched = 1;
        transition select(hdr.rejected_order_message.rejected_order_optional_field) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_cancel_reject_message {
        packet.extract(hdr.cancel_reject_message);
        meta.dispatched = 1;
        transition select(hdr.cancel_reject_message.cancel_reject_optional_field) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_order_restated_message {
        packet.extract(hdr.order_restated_message);
        meta.dispatched = 1;
        transition select(hdr.order_restated_message.order_restated_optional_field) {
            8w37: parse_user_ref_idx;
            8w31: parse_firm_up_id;
            default: accept;
        }
    }

    state parse_account_query_response_message {
        packet.extract(hdr.account_query_response_message);
        meta.dispatched = 1;
        transition select(packet.lookahead<bit<8>>()) {
            8w37: parse_user_ref_idx;
            default: accept;
        }
    }

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

}

control NasdaqcanadaOrderentryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqcanadaOrderentryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NasdaqcanadaOrderentryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqcanadaOrderentryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqcanadaOrderentryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_accepted_message);
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.order_canceled_message);
        packet.emit(hdr.stp_canceled_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.corrected_trade_message);
        packet.emit(hdr.rejected_order_message);
        packet.emit(hdr.cancel_reject_message);
        packet.emit(hdr.order_restated_message);
        packet.emit(hdr.account_query_response_message);
    }
}

V1Switch(
    NasdaqcanadaOrderentryServerParser(),
    NasdaqcanadaOrderentryServerVerifyChecksum(),
    NasdaqcanadaOrderentryServerIngress(),
    NasdaqcanadaOrderentryServerEgress(),
    NasdaqcanadaOrderentryServerComputeChecksum(),
    NasdaqcanadaOrderentryServerDeparser()
) main;
