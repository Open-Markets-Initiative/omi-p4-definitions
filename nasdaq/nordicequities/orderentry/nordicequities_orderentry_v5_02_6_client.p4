// P4_16 (v1model) definition for: Nasdaq NordicEquities OrderEntry Ouch v5.02.6
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nordic Ouch 5 Order Entry
//   Encoding: Ouch
//   Version: 5.02.6
//   Date: 11/12/2025
//   Specification: Nasdaq Nordic INET OUCH5 PureStream (5.02.6).pdf
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
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> order_book;
    bit<32> price;
    bit<48> user;
    bit<32> execution_within_firm;
    bit<32> investment_decision_within_firm_short_code;
    bit<32> client_identifier;
    bit<2> reserved_78;
    bit<2> execution_decision_within_firm;
    bit<2> investment_decision_within_firm;
    bit<2> client_identification;
    bit<8> capacity;
    bit<8> algo_indicator;
    bit<16> appendage_length;
    bit<8> length;
    bit<8> tag;
}

header clearing_account_t {
    bit<96> clearing_account_value;
}

header clearing_account_type_t {
    bit<8> clearing_account_type_value;
}

header clearing_firm_t {
    bit<32> clearing_firm_value;
}

header client_reference_t {
    bit<120> client_reference_value;
}

header cross_type_t {
    bit<8> cross_type_value;
}

header dea_indicator_t {
    bit<8> dea_indicator_value;
}

header display_t {
    bit<8> display_value;
}

header display_price_t {
    bit<32> display_price_value;
}

header display_quantity_t {
    bit<32> display_quantity_value;
}

header expire_time_t {
    bit<16> expire_time_value;
}

header firm_t {
    bit<32> firm_value;
}

header liquidity_provision_indicator_t {
    bit<8> liquidity_provision_indicator_value;
}

header max_floor_t {
    bit<32> max_floor_value;
}

header minimum_quantity_t {
    bit<32> minimum_quantity_value;
}

header order_reference_t {
    bit<80> order_reference_value;
}

header original_order_entry_date_t {
    bit<32> original_order_entry_date_value;
}

header original_order_reference_number_t {
    bit<64> original_order_reference_number_value;
}

header peg_difference_t {
    bit<32> peg_difference_value;
}

header peg_type_t {
    bit<8> peg_type_value;
}

header random_reserve_t {
    bit<32> random_reserve_value;
}

header secondary_order_reference_number_t {
    bit<64> secondary_order_reference_number_value;
}

header stp_action_t {
    bit<8> stp_action_value;
}

header stp_level_t {
    bit<8> stp_level_value;
}

header stp_trader_group_t {
    bit<16> stp_trader_group_value;
}

header time_in_force_t {
    bit<8> time_in_force_value;
}

header trading_at_closing_price_t {
    bit<8> trading_at_closing_price_value;
}

header order_condition_t {
    bit<8> order_condition_value;
}

header cumulative_quantity_t {
    bit<32> cumulative_quantity_value;
}

header customer_order_capacity_t {
    bit<8> customer_order_capacity_value;
}

header target_strategy_t {
    bit<8> target_strategy_value;
}

header min_rate_t {
    bit<16> min_rate_value;
}

header max_rate_t {
    bit<16> max_rate_value;
}

header conditional_type_t {
    bit<8> conditional_type_value;
}

header firm_up_id_t {
    bit<32> firm_up_id_value;
}

header replace_order_message_t {
    bit<32> orig_user_ref_num;
    bit<32> new_user_ref_num;
    bit<32> quantity;
    bit<32> price;
    bit<48> user;
    bit<16> appendage_length;
    bit<8> length;
    bit<8> tag;
}

header cancel_order_message_t {
    bit<32> user_ref_num;
    bit<32> quantity;
    bit<48> user;
}

header mmi_notification_request_message_t {
    bit<32> user_ref_num;
    bit<32> order_book;
    bit<8> instruction;
    bit<8> add_or_remove;
    bit<32> firm_value;
    bit<48> user;
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
    clearing_account_t clearing_account;
    clearing_account_type_t clearing_account_type;
    clearing_firm_t clearing_firm;
    client_reference_t client_reference;
    cross_type_t cross_type;
    dea_indicator_t dea_indicator;
    display_t display;
    display_price_t display_price;
    display_quantity_t display_quantity;
    expire_time_t expire_time;
    firm_t firm;
    liquidity_provision_indicator_t liquidity_provision_indicator;
    max_floor_t max_floor;
    minimum_quantity_t minimum_quantity;
    order_reference_t order_reference;
    original_order_entry_date_t original_order_entry_date;
    original_order_reference_number_t original_order_reference_number;
    peg_difference_t peg_difference;
    peg_type_t peg_type;
    random_reserve_t random_reserve;
    secondary_order_reference_number_t secondary_order_reference_number;
    stp_action_t stp_action;
    stp_level_t stp_level;
    stp_trader_group_t stp_trader_group;
    time_in_force_t time_in_force;
    trading_at_closing_price_t trading_at_closing_price;
    order_condition_t order_condition;
    cumulative_quantity_t cumulative_quantity;
    customer_order_capacity_t customer_order_capacity;
    target_strategy_t target_strategy;
    min_rate_t min_rate;
    max_rate_t max_rate;
    conditional_type_t conditional_type;
    firm_up_id_t firm_up_id;
    replace_order_message_t replace_order_message;
    cancel_order_message_t cancel_order_message;
    mmi_notification_request_message_t mmi_notification_request_message;
}

parser NordicequitiesOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x51: parse_account_query_message;
            8w0x4d: parse_mmi_notification_request_message;
            default: accept;
        }
    }

    state parse_enter_order_message {
        packet.extract(hdr.enter_order_message);
        meta.dispatched = 1;
        transition select(hdr.enter_order_message.tag) {
            8w1: parse_clearing_account;
            8w2: parse_clearing_account_type;
            8w3: parse_clearing_firm;
            8w4: parse_client_reference;
            8w5: parse_cross_type;
            8w6: parse_dea_indicator;
            8w7: parse_display;
            8w8: parse_display_price;
            8w9: parse_display_quantity;
            8w10: parse_expire_time;
            8w11: parse_firm;
            8w12: parse_liquidity_provision_indicator;
            8w13: parse_max_floor;
            8w14: parse_minimum_quantity;
            8w15: parse_order_reference;
            8w16: parse_original_order_entry_date;
            8w17: parse_original_order_reference_number;
            8w18: parse_peg_difference;
            8w19: parse_peg_type;
            8w20: parse_random_reserve;
            8w21: parse_secondary_order_reference_number;
            8w22: parse_stp_action;
            8w23: parse_stp_level;
            8w24: parse_stp_trader_group;
            8w25: parse_time_in_force;
            8w26: parse_trading_at_closing_price;
            8w27: parse_order_condition;
            8w28: parse_cumulative_quantity;
            8w29: parse_customer_order_capacity;
            8w30: parse_target_strategy;
            8w31: parse_min_rate;
            8w32: parse_max_rate;
            8w33: parse_conditional_type;
            8w34: parse_firm_up_id;
            default: accept;
        }
    }

    state parse_clearing_account {
        packet.extract(hdr.clearing_account);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_clearing_account_type {
        packet.extract(hdr.clearing_account_type);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_clearing_firm {
        packet.extract(hdr.clearing_firm);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_reference {
        packet.extract(hdr.client_reference);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cross_type {
        packet.extract(hdr.cross_type);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dea_indicator {
        packet.extract(hdr.dea_indicator);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_display {
        packet.extract(hdr.display);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_display_price {
        packet.extract(hdr.display_price);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_display_quantity {
        packet.extract(hdr.display_quantity);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_expire_time {
        packet.extract(hdr.expire_time);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_firm {
        packet.extract(hdr.firm);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_liquidity_provision_indicator {
        packet.extract(hdr.liquidity_provision_indicator);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_max_floor {
        packet.extract(hdr.max_floor);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_minimum_quantity {
        packet.extract(hdr.minimum_quantity);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_reference {
        packet.extract(hdr.order_reference);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_original_order_entry_date {
        packet.extract(hdr.original_order_entry_date);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_original_order_reference_number {
        packet.extract(hdr.original_order_reference_number);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_peg_difference {
        packet.extract(hdr.peg_difference);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_peg_type {
        packet.extract(hdr.peg_type);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_random_reserve {
        packet.extract(hdr.random_reserve);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secondary_order_reference_number {
        packet.extract(hdr.secondary_order_reference_number);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stp_action {
        packet.extract(hdr.stp_action);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stp_level {
        packet.extract(hdr.stp_level);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stp_trader_group {
        packet.extract(hdr.stp_trader_group);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_time_in_force {
        packet.extract(hdr.time_in_force);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_at_closing_price {
        packet.extract(hdr.trading_at_closing_price);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_condition {
        packet.extract(hdr.order_condition);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cumulative_quantity {
        packet.extract(hdr.cumulative_quantity);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_customer_order_capacity {
        packet.extract(hdr.customer_order_capacity);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_target_strategy {
        packet.extract(hdr.target_strategy);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_min_rate {
        packet.extract(hdr.min_rate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_max_rate {
        packet.extract(hdr.max_rate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_conditional_type {
        packet.extract(hdr.conditional_type);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_firm_up_id {
        packet.extract(hdr.firm_up_id);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replace_order_message {
        packet.extract(hdr.replace_order_message);
        meta.dispatched = 1;
        transition select(hdr.replace_order_message.tag) {
            8w1: parse_clearing_account;
            8w2: parse_clearing_account_type;
            8w3: parse_clearing_firm;
            8w4: parse_client_reference;
            8w5: parse_cross_type;
            8w6: parse_dea_indicator;
            8w7: parse_display;
            8w8: parse_display_price;
            8w9: parse_display_quantity;
            8w10: parse_expire_time;
            8w11: parse_firm;
            8w12: parse_liquidity_provision_indicator;
            8w13: parse_max_floor;
            8w14: parse_minimum_quantity;
            8w15: parse_order_reference;
            8w16: parse_original_order_entry_date;
            8w17: parse_original_order_reference_number;
            8w18: parse_peg_difference;
            8w19: parse_peg_type;
            8w20: parse_random_reserve;
            8w21: parse_secondary_order_reference_number;
            8w22: parse_stp_action;
            8w23: parse_stp_level;
            8w24: parse_stp_trader_group;
            8w25: parse_time_in_force;
            8w26: parse_trading_at_closing_price;
            8w27: parse_order_condition;
            8w28: parse_cumulative_quantity;
            8w29: parse_customer_order_capacity;
            8w30: parse_target_strategy;
            8w31: parse_min_rate;
            8w32: parse_max_rate;
            8w33: parse_conditional_type;
            8w34: parse_firm_up_id;
            default: accept;
        }
    }

    state parse_cancel_order_message {
        packet.extract(hdr.cancel_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_account_query_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mmi_notification_request_message {
        packet.extract(hdr.mmi_notification_request_message);
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

control NordicequitiesOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicequitiesOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicequitiesOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order_message);
        packet.emit(hdr.clearing_account);
        packet.emit(hdr.clearing_account_type);
        packet.emit(hdr.clearing_firm);
        packet.emit(hdr.client_reference);
        packet.emit(hdr.cross_type);
        packet.emit(hdr.dea_indicator);
        packet.emit(hdr.display);
        packet.emit(hdr.display_price);
        packet.emit(hdr.display_quantity);
        packet.emit(hdr.expire_time);
        packet.emit(hdr.firm);
        packet.emit(hdr.liquidity_provision_indicator);
        packet.emit(hdr.max_floor);
        packet.emit(hdr.minimum_quantity);
        packet.emit(hdr.order_reference);
        packet.emit(hdr.original_order_entry_date);
        packet.emit(hdr.original_order_reference_number);
        packet.emit(hdr.peg_difference);
        packet.emit(hdr.peg_type);
        packet.emit(hdr.random_reserve);
        packet.emit(hdr.secondary_order_reference_number);
        packet.emit(hdr.stp_action);
        packet.emit(hdr.stp_level);
        packet.emit(hdr.stp_trader_group);
        packet.emit(hdr.time_in_force);
        packet.emit(hdr.trading_at_closing_price);
        packet.emit(hdr.order_condition);
        packet.emit(hdr.cumulative_quantity);
        packet.emit(hdr.customer_order_capacity);
        packet.emit(hdr.target_strategy);
        packet.emit(hdr.min_rate);
        packet.emit(hdr.max_rate);
        packet.emit(hdr.conditional_type);
        packet.emit(hdr.firm_up_id);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.cancel_order_message);
        packet.emit(hdr.mmi_notification_request_message);
    }
}

V1Switch(
    NordicequitiesOrderentryClientParser(),
    NordicequitiesOrderentryClientVerifyChecksum(),
    NordicequitiesOrderentryClientIngress(),
    NordicequitiesOrderentryClientEgress(),
    NordicequitiesOrderentryClientComputeChecksum(),
    NordicequitiesOrderentryClientDeparser()
) main;
