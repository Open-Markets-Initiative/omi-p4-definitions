// P4_16 (v1model) definition for: Nasdaq NordicEquities OrderEntry Ouch v5.01.14
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nordic Ouch 5 Order Entry
//   Encoding: Ouch
//   Version: 5.01.14
//   Date: 11/12/2025
//   Specification: OUCH5-for-Nasdaq-Nordic-5.01.14.pdf
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
    bit<32> price;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> order_book;
    bit<32> quantity;
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
}

header order_accepted_message_tagvalue_t {
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

header order_replaced_message_t {
    bit<64> timestamp;
    bit<32> orig_user_ref_num;
    bit<32> new_user_ref_num;
    bit<32> price;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> order_book;
    bit<32> quantity;
    bit<48> user;
    bit<16> appendage_length;
}

header order_replaced_message_tagvalue_t {
    bit<8> length;
    bit<8> tag;
}

header cancelled_order_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> decrement_quantity;
    bit<8> cancel_reason;
}

header cancel_pending_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<8> cancel_pending_reason;
}

header replace_pending_message_t {
    bit<64> timestamp;
    bit<32> orig_user_ref_num;
    bit<32> user_ref_num;
    bit<8> replace_pending_reason;
}

header executed_order_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> executed_quantity;
    bit<32> execution_price;
    bit<8> liquidity_flag;
    bit<32> match_number;
    bit<32> contra_firm;
    bit<8> trading_mode;
    bit<8> transaction_category;
    bit<8> transaction_type_algo_indicator;
    bit<1> liquidity_self_trade;
    bit<1> liquidity_top_of_book;
    bit<1> liquidity_internalized;
    bit<2> liquidity_indicator;
    bit<3> reserved_13;
    bit<8> last_market;
}

header broken_trade_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> match_number;
    bit<8> broken_trade_reason;
    bit<8> trading_mode;
    bit<8> transaction_category;
    bit<8> transaction_type_algo_indicator;
}

header rejected_order_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<16> rejected_order_reason;
}

header cancel_rejected_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<16> cancel_rejected_reason;
}

header order_restated_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<8> restate_reason;
    bit<16> appendage_length;
}

header order_restated_message_tagvalue_t {
    bit<8> length;
    bit<8> tag;
}

header mmo_refresh_request_message_t {
    bit<64> timestamp;
    bit<32> firm_value;
    bit<32> order_book;
    bit<8> mmo_refresh_reason;
}

header account_query_response_message_t {
    bit<64> timestamp;
    bit<32> next_user_ref_num;
}

header gtc_cancelled_message_t {
    bit<64> timestamp;
    bit<32> original_order_entry_date_value;
    bit<64> original_order_reference_number_value;
    bit<16> reason;
}

header response_to_mmi_notification_message_t {
    bit<64> timestamp;
    bit<32> user_ref_num;
    bit<32> order_book;
    bit<8> instruction;
    bit<8> add_or_remove;
    bit<32> firm_value;
    bit<48> user;
    bit<8> instruction_status;
}

header debug_packet_debug_text_t {
    varbit<2048> debug_text;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    order_accepted_message_t order_accepted_message;
    order_accepted_message_tagvalue_t order_accepted_message_tagvalue[MAX_MESSAGES];
    clearing_account_t clearing_account[MAX_MESSAGES];
    clearing_account_type_t clearing_account_type[MAX_MESSAGES];
    clearing_firm_t clearing_firm[MAX_MESSAGES];
    client_reference_t client_reference[MAX_MESSAGES];
    cross_type_t cross_type[MAX_MESSAGES];
    dea_indicator_t dea_indicator[MAX_MESSAGES];
    display_t display[MAX_MESSAGES];
    display_price_t display_price[MAX_MESSAGES];
    display_quantity_t display_quantity[MAX_MESSAGES];
    expire_time_t expire_time[MAX_MESSAGES];
    firm_t firm[MAX_MESSAGES];
    liquidity_provision_indicator_t liquidity_provision_indicator[MAX_MESSAGES];
    max_floor_t max_floor[MAX_MESSAGES];
    minimum_quantity_t minimum_quantity[MAX_MESSAGES];
    order_reference_t order_reference[MAX_MESSAGES];
    original_order_entry_date_t original_order_entry_date[MAX_MESSAGES];
    original_order_reference_number_t original_order_reference_number[MAX_MESSAGES];
    peg_difference_t peg_difference[MAX_MESSAGES];
    peg_type_t peg_type[MAX_MESSAGES];
    random_reserve_t random_reserve[MAX_MESSAGES];
    secondary_order_reference_number_t secondary_order_reference_number[MAX_MESSAGES];
    stp_action_t stp_action[MAX_MESSAGES];
    stp_level_t stp_level[MAX_MESSAGES];
    stp_trader_group_t stp_trader_group[MAX_MESSAGES];
    time_in_force_t time_in_force[MAX_MESSAGES];
    trading_at_closing_price_t trading_at_closing_price[MAX_MESSAGES];
    order_condition_t order_condition[MAX_MESSAGES];
    cumulative_quantity_t cumulative_quantity[MAX_MESSAGES];
    customer_order_capacity_t customer_order_capacity[MAX_MESSAGES];
    order_replaced_message_t order_replaced_message;
    order_replaced_message_tagvalue_t order_replaced_message_tagvalue[MAX_MESSAGES];
    cancelled_order_message_t cancelled_order_message;
    cancel_pending_message_t cancel_pending_message;
    replace_pending_message_t replace_pending_message;
    executed_order_message_t executed_order_message;
    broken_trade_message_t broken_trade_message;
    rejected_order_message_t rejected_order_message;
    cancel_rejected_message_t cancel_rejected_message;
    order_restated_message_t order_restated_message;
    order_restated_message_tagvalue_t order_restated_message_tagvalue[MAX_MESSAGES];
    mmo_refresh_request_message_t mmo_refresh_request_message;
    account_query_response_message_t account_query_response_message;
    gtc_cancelled_message_t gtc_cancelled_message;
    response_to_mmi_notification_message_t response_to_mmi_notification_message;
    debug_packet_debug_text_t debug_packet_debug_text;
}

parser NordicequitiesOrderentryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
        meta.dispatched = 1;
        packet.extract(hdr.debug_packet_debug_text, (bit<32>)hdr.server_packet_header.packet_length * 8);
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
            8w0x43: parse_cancelled_order_message;
            8w0x50: parse_cancel_pending_message;
            8w0x4e: parse_replace_pending_message;
            8w0x45: parse_executed_order_message;
            8w0x42: parse_broken_trade_message;
            8w0x4a: parse_rejected_order_message;
            8w0x49: parse_cancel_rejected_message;
            8w0x54: parse_order_restated_message;
            8w0x57: parse_mmo_refresh_request_message;
            8w0x51: parse_account_query_response_message;
            8w0x47: parse_gtc_cancelled_message;
            8w0x52: parse_response_to_mmi_notification_message;
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
        transition select(hdr.order_accepted_message.appendage_length) {
            16w0: accept;
            default: parse_order_accepted_message_tagvalue;
        }
    }

    state parse_order_accepted_message_tagvalue {
        packet.extract(hdr.order_accepted_message_tagvalue.next);
        transition select(hdr.order_accepted_message_tagvalue.last.tag) {
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
            default: accept;
        }
    }

    state parse_clearing_account {
        packet.extract(hdr.clearing_account.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_clearing_account_type {
        packet.extract(hdr.clearing_account_type.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_clearing_firm {
        packet.extract(hdr.clearing_firm.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_client_reference {
        packet.extract(hdr.client_reference.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_cross_type {
        packet.extract(hdr.cross_type.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_dea_indicator {
        packet.extract(hdr.dea_indicator.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_display {
        packet.extract(hdr.display.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_display_price {
        packet.extract(hdr.display_price.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_display_quantity {
        packet.extract(hdr.display_quantity.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_expire_time {
        packet.extract(hdr.expire_time.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_firm {
        packet.extract(hdr.firm.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_liquidity_provision_indicator {
        packet.extract(hdr.liquidity_provision_indicator.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_max_floor {
        packet.extract(hdr.max_floor.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_minimum_quantity {
        packet.extract(hdr.minimum_quantity.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_order_reference {
        packet.extract(hdr.order_reference.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_original_order_entry_date {
        packet.extract(hdr.original_order_entry_date.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_original_order_reference_number {
        packet.extract(hdr.original_order_reference_number.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_peg_difference {
        packet.extract(hdr.peg_difference.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_peg_type {
        packet.extract(hdr.peg_type.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_random_reserve {
        packet.extract(hdr.random_reserve.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_secondary_order_reference_number {
        packet.extract(hdr.secondary_order_reference_number.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_stp_action {
        packet.extract(hdr.stp_action.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_stp_level {
        packet.extract(hdr.stp_level.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_stp_trader_group {
        packet.extract(hdr.stp_trader_group.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_time_in_force {
        packet.extract(hdr.time_in_force.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_trading_at_closing_price {
        packet.extract(hdr.trading_at_closing_price.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_order_condition {
        packet.extract(hdr.order_condition.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_cumulative_quantity {
        packet.extract(hdr.cumulative_quantity.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_customer_order_capacity {
        packet.extract(hdr.customer_order_capacity.next);
        meta.dispatched = 1;
        transition parse_order_accepted_message_tagvalue;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        meta.dispatched = 1;
        transition select(hdr.order_replaced_message.appendage_length) {
            16w0: accept;
            default: parse_order_replaced_message_tagvalue;
        }
    }

    state parse_order_replaced_message_tagvalue {
        packet.extract(hdr.order_replaced_message_tagvalue.next);
        transition select(hdr.order_replaced_message_tagvalue.last.tag) {
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
            default: accept;
        }
    }

    state parse_cancelled_order_message {
        packet.extract(hdr.cancelled_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_pending_message {
        packet.extract(hdr.cancel_pending_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replace_pending_message {
        packet.extract(hdr.replace_pending_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_executed_order_message {
        packet.extract(hdr.executed_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rejected_order_message {
        packet.extract(hdr.rejected_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_rejected_message {
        packet.extract(hdr.cancel_rejected_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_restated_message {
        packet.extract(hdr.order_restated_message);
        meta.dispatched = 1;
        transition select(hdr.order_restated_message.appendage_length) {
            16w0: accept;
            default: parse_order_restated_message_tagvalue;
        }
    }

    state parse_order_restated_message_tagvalue {
        packet.extract(hdr.order_restated_message_tagvalue.next);
        transition select(hdr.order_restated_message_tagvalue.last.tag) {
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
            default: accept;
        }
    }

    state parse_mmo_refresh_request_message {
        packet.extract(hdr.mmo_refresh_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_account_query_response_message {
        packet.extract(hdr.account_query_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gtc_cancelled_message {
        packet.extract(hdr.gtc_cancelled_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_response_to_mmi_notification_message {
        packet.extract(hdr.response_to_mmi_notification_message);
        meta.dispatched = 1;
        transition accept;
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

control NordicequitiesOrderentryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesOrderentryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicequitiesOrderentryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicequitiesOrderentryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesOrderentryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet_debug_text);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_accepted_message);
        packet.emit(hdr.order_accepted_message_tagvalue);
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
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.order_replaced_message_tagvalue);
        packet.emit(hdr.cancelled_order_message);
        packet.emit(hdr.cancel_pending_message);
        packet.emit(hdr.replace_pending_message);
        packet.emit(hdr.executed_order_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.rejected_order_message);
        packet.emit(hdr.cancel_rejected_message);
        packet.emit(hdr.order_restated_message);
        packet.emit(hdr.order_restated_message_tagvalue);
        packet.emit(hdr.mmo_refresh_request_message);
        packet.emit(hdr.account_query_response_message);
        packet.emit(hdr.gtc_cancelled_message);
        packet.emit(hdr.response_to_mmi_notification_message);
    }
}

V1Switch(
    NordicequitiesOrderentryServerParser(),
    NordicequitiesOrderentryServerVerifyChecksum(),
    NordicequitiesOrderentryServerIngress(),
    NordicequitiesOrderentryServerEgress(),
    NordicequitiesOrderentryServerComputeChecksum(),
    NordicequitiesOrderentryServerDeparser()
) main;
