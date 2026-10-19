// P4_16 (v1model) definition for: Gpw Wse OrderEntry Wats v1.7.6.20
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: Warsaw Stock Exchange Native Order Gateway
//   Encoding: Warsaw Automated Trading System
//   Version: 1.7.6.20
//   Date: 10/05/2026
//   Specification: GPW_WATS_2.01_Native_Order_Gateway_Specification_v1.7.6.20.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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

header message_header_t {
    bit<16> message_length;
    bit<16> message_type;
    bit<32> sequence_number;
    bit<64> timestamp;
    bit<64> source_timestamp;
}

header login_t {
    bit<16> version;
    bit<64> token;
    bit<16> connection_id;
    bit<32> next_expected_seq_num;
    bit<32> last_sent_seq_num;
}

header login_response_t {
    bit<8> result_login_result;
    bit<32> next_expected_seq_num;
    bit<32> last_replay_seq_num;
    bit<16> session_id;
}

header connection_close_t {
    bit<8> reason_connection_close_reason;
}

header reject_t {
    bit<32> ref_seq_num;
    bit<8> reject_reason;
}

header test_t {
    bit<64> target_timestamp;
}

header test_event_t {
    bit<1600> scenario_name;
    bit<8> event_type;
}

header trading_session_status_t {
    bit<32> market_id;
    bit<32> date;
    bit<8> trading_session_event;
}

header order_add_t {
    bit<8> stp_id;
    bit<32> instrument_id;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> side;
    bit<64> price;
    bit<64> trigger_price;
    bit<64> quantity;
    bit<64> display_qty;
    bit<8> capacity;
    bit<128> account;
    bit<8> account_type;
    bit<5> reserved_3_to_7;
    bit<1> market_maker_or_specialist;
    bit<1> direct_or_sponsored_access;
    bit<1> liquidity_provision_activity;
    bit<32> short_code;
    bit<8> qualifier;
    bit<32> short_code_2;
    bit<8> qualifier_2;
    bit<32> short_code_3;
    bit<8> qualifier_3;
    bit<64> expire;
    bit<144> memo;
    bit<160> client_order_id;
    bit<160> clearing_member_code;
    bit<8> clearing_member_clearing_identifier;
    bit<7> reserved_1_to_7;
    bit<1> cancel_on_connection_loss;
    bit<8> fee_structure_id;
    bit<64> interested_party;
}

header order_add_response_t {
    bit<64> order_id;
    bit<64> public_order_id;
    bit<64> display_qty;
    bit<64> filled;
    bit<8> status_order_status;
    bit<16> reason_order_rejection_reason;
    bit<8> exec_type_reason;
    bit<160> client_order_id;
}

header order_cancel_t {
    bit<64> order_id;
    bit<32> short_code;
    bit<8> qualifier;
    bit<32> short_code_2;
    bit<8> qualifier_2;
    bit<32> short_code_3;
    bit<8> qualifier_3;
    bit<160> client_order_id;
}

header order_cancel_response_t {
    bit<64> order_id;
    bit<8> status_order_status;
    bit<16> reason_order_rejection_reason;
    bit<8> exec_type_reason;
    bit<160> client_order_id;
}

header order_modify_t {
    bit<64> order_id;
    bit<64> price;
    bit<64> trigger_price;
    bit<64> quantity;
    bit<64> display_qty;
    bit<64> expire;
    bit<32> short_code;
    bit<8> qualifier;
    bit<32> short_code_2;
    bit<8> qualifier_2;
    bit<32> short_code_3;
    bit<8> qualifier_3;
    bit<160> client_order_id;
}

header order_modify_response_t {
    bit<64> order_id;
    bit<64> filled;
    bit<8> status_order_status;
    bit<8> priority_flag;
    bit<16> reason_order_rejection_reason;
    bit<160> client_order_id;
}

header order_mass_cancel_t {
    bit<8> mass_cancel_request_type;
    bit<8> target_party_role;
    bit<32> target_party_id;
    bit<32> market_segment_id;
    bit<32> instrument_id;
    bit<32> short_code;
    bit<8> qualifier;
    bit<160> client_order_id;
}

header order_mass_cancel_response_t {
    bit<64> total_affected_orders;
    bit<8> mass_cancel_request_type;
    bit<64> mass_cancel_id;
    bit<8> target_party_role;
    bit<32> target_party_id;
    bit<32> market_segment_id;
    bit<16> reason_mass_cancel_rejection_reason;
    bit<160> client_order_id;
}

header order_execute_t {
    bit<32> instrument_id;
    bit<64> order_id;
    bit<32> trade_id;
    bit<64> price;
    bit<64> quantity;
    bit<64> leaves_qty;
    bit<8> liquidity_indicator;
    bit<16> currency;
    bit<8> side;
    bit<160> client_order_id;
}

header mass_quote_t {
    bit<8> stp_id;
    bit<8> capacity;
    bit<128> account;
    bit<8> account_type;
    bit<5> reserved_3_to_7;
    bit<1> market_maker_or_specialist;
    bit<1> direct_or_sponsored_access;
    bit<1> liquidity_provision_activity;
    bit<32> short_code;
    bit<8> qualifier;
    bit<32> short_code_2;
    bit<8> qualifier_2;
    bit<32> short_code_3;
    bit<8> qualifier_3;
    bit<144> memo;
    bit<160> clearing_member_code;
    bit<8> clearing_member_clearing_identifier;
    bit<8> count;
}

header mass_quote_items_quotes_array_t {
    bit<32> instrument_id;
    bit<64> price;
    bit<64> quantity;
    bit<64> price_2;
    bit<64> quantity_2;
}

header mass_quote_response_t {
    bit<64> mass_quote_id;
    bit<8> count;
}

header mass_quote_response_items_quote_order_response_array_t {
    bit<32> instrument_id;
    bit<64> bid_order_id;
    bit<64> ask_order_id;
    bit<8> status_order_status;
    bit<16> reason_order_rejection_reason;
}

header market_maker_command_t {
    bit<32> instrument_id;
    bit<8> action_;
}

header market_maker_command_response_t {
    bit<32> ref_id;
    bit<8> result_command_result;
    bit<16> rejection_code;
}

header request_for_execution_t {
    bit<32> instrument_id;
    bit<8> reason_request_for_execution_reason;
}

header bid_offer_update_t {
    bit<32> instrument_id;
    bit<8> update_type;
    bit<64> total_bid_size;
    bit<64> total_offer_size;
    bit<32> bid_orders;
    bit<32> offer_orders;
}

header trade_capture_report_single_t {
    bit<32> instrument_id;
    bit<168> trade_report_id;
    bit<64> secondary_trade_report_id;
    bit<32> trade_id;
    bit<8> trade_report_trans_type;
    bit<8> trade_report_type;
    bit<8> trade_type;
    bit<8> algorithmic_trade_indicator;
    bit<8> exec_type;
    bit<168> trade_report_ref_id;
    bit<64> last_qty;
    bit<64> last_px;
    bit<32> settlement_date;
    bit<8> side;
    bit<128> counterparty_code;
    bit<5> reserved_3_to_7;
    bit<1> market_maker_or_specialist;
    bit<1> direct_or_sponsored_access;
    bit<1> liquidity_provision_activity;
    bit<32> short_code;
    bit<8> qualifier;
    bit<32> short_code_2;
    bit<8> qualifier_2;
    bit<32> short_code_3;
    bit<8> qualifier_3;
    bit<160> clearing_member_code;
    bit<8> clearing_member_clearing_identifier;
    bit<128> account;
    bit<8> account_type;
    bit<8> order_capacity;
    bit<8> fee_structure_id;
    bit<64> interested_party;
    bit<144> memo;
}

header trade_capture_report_dual_t {
    bit<32> instrument_id;
    bit<168> trade_report_id;
    bit<64> secondary_trade_report_id;
    bit<32> trade_id;
    bit<8> trade_report_trans_type;
    bit<8> trade_report_type;
    bit<8> trade_type;
    bit<8> algorithmic_trade_indicator;
    bit<8> exec_type;
    bit<168> trade_report_ref_id;
    bit<64> last_qty;
    bit<64> last_px;
    bit<32> settlement_date;
    bit<5> reserved_3_to_7;
    bit<1> market_maker_or_specialist;
    bit<1> direct_or_sponsored_access;
    bit<1> liquidity_provision_activity;
    bit<32> short_code;
    bit<8> qualifier;
    bit<32> short_code_2;
    bit<8> qualifier_2;
    bit<32> short_code_3;
    bit<8> qualifier_3;
    bit<160> clearing_member_code;
    bit<8> clearing_member_clearing_identifier;
    bit<128> account;
    bit<8> account_type;
    bit<8> order_capacity;
    bit<8> fee_structure_id;
    bit<64> interested_party;
    bit<144> memo;
    bit<5> reserved_3_to_7_2;
    bit<1> market_maker_or_specialist_2;
    bit<1> direct_or_sponsored_access_2;
    bit<1> liquidity_provision_activity_2;
    bit<32> short_code_4;
    bit<8> qualifier_4;
    bit<32> short_code_5;
    bit<8> qualifier_5;
    bit<32> short_code_6;
    bit<8> qualifier_6;
    bit<160> clearing_member_code_2;
    bit<8> clearing_member_clearing_identifier_2;
    bit<128> account_2;
    bit<8> account_type_2;
    bit<8> order_capacity_2;
    bit<8> fee_structure_id_2;
    bit<64> interested_party_2;
    bit<144> memo_2;
}

header trade_capture_report_response_t {
    bit<32> instrument_id;
    bit<32> trade_id;
    bit<168> trade_report_id;
    bit<64> secondary_trade_report_id;
    bit<8> status_tcr_status;
    bit<16> reason_tcr_rejection_reason;
}

header trade_bust_t {
    bit<32> trade_id;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> mass_quote_items_quotes_array_remaining;
    bit<16> mass_quote_response_items_quote_order_response_array_remaining;
}

struct headers_t {
    message_header_t message_header;
    login_t login;
    login_response_t login_response;
    connection_close_t connection_close;
    reject_t reject;
    test_t test;
    test_event_t test_event;
    trading_session_status_t trading_session_status;
    order_add_t order_add;
    order_add_response_t order_add_response;
    order_cancel_t order_cancel;
    order_cancel_response_t order_cancel_response;
    order_modify_t order_modify;
    order_modify_response_t order_modify_response;
    order_mass_cancel_t order_mass_cancel;
    order_mass_cancel_response_t order_mass_cancel_response;
    order_execute_t order_execute;
    mass_quote_t mass_quote;
    mass_quote_items_quotes_array_t mass_quote_items_quotes_array[MAX_MESSAGES];
    mass_quote_response_t mass_quote_response;
    mass_quote_response_items_quote_order_response_array_t mass_quote_response_items_quote_order_response_array[MAX_MESSAGES];
    market_maker_command_t market_maker_command;
    market_maker_command_response_t market_maker_command_response;
    request_for_execution_t request_for_execution;
    bid_offer_update_t bid_offer_update;
    trade_capture_report_single_t trade_capture_report_single;
    trade_capture_report_dual_t trade_capture_report_dual;
    trade_capture_report_response_t trade_capture_report_response;
    trade_bust_t trade_bust;
}

parser WseOrderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w0x200: parse_login;
            16w0x300: parse_login_response;
            16w0xb00: parse_logout;
            16w0xe00: parse_logout_response;
            16w0xc00: parse_connection_close;
            16w0xd00: parse_heartbeat;
            16w0xf00: parse_reject;
            16w0x2200: parse_gap_fill;
            16w0x100: parse_test;
            16w0xff00: parse_test_event;
            16w0x2300: parse_trading_session_status;
            16w0x400: parse_order_add;
            16w0x500: parse_order_add_response;
            16w0x600: parse_order_cancel;
            16w0x700: parse_order_cancel_response;
            16w0x800: parse_order_modify;
            16w0x900: parse_order_modify_response;
            16w0x1d00: parse_order_mass_cancel;
            16w0x1e00: parse_order_mass_cancel_response;
            16w0xa00: parse_order_execute;
            16w0x1800: parse_mass_quote;
            16w0x1900: parse_mass_quote_response;
            16w0x2000: parse_market_maker_command;
            16w0x2100: parse_market_maker_command_response;
            16w0x1c00: parse_request_for_execution;
            16w0x1f00: parse_bid_offer_update;
            16w0x1200: parse_trade_capture_report_single;
            16w0x1300: parse_trade_capture_report_dual;
            16w0x1400: parse_trade_capture_report_response;
            16w0x1700: parse_trade_bust;
            default: accept;
        }
    }

    state parse_login {
        packet.extract(hdr.login);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_response {
        packet.extract(hdr.login_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_response {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_connection_close {
        packet.extract(hdr.connection_close);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject {
        packet.extract(hdr.reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gap_fill {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test {
        packet.extract(hdr.test);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test_event {
        packet.extract(hdr.test_event);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_session_status {
        packet.extract(hdr.trading_session_status);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_add {
        packet.extract(hdr.order_add);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_add_response {
        packet.extract(hdr.order_add_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel {
        packet.extract(hdr.order_cancel);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_response {
        packet.extract(hdr.order_cancel_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify {
        packet.extract(hdr.order_modify);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_response {
        packet.extract(hdr.order_modify_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_cancel {
        packet.extract(hdr.order_mass_cancel);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_cancel_response {
        packet.extract(hdr.order_mass_cancel_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_execute {
        packet.extract(hdr.order_execute);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote {
        packet.extract(hdr.mass_quote);
        meta.dispatched = 1;
        meta.mass_quote_items_quotes_array_remaining = 16w30;
        transition parse_mass_quote_items_quotes_array;
    }

    state parse_mass_quote_items_quotes_array {
        packet.extract(hdr.mass_quote_items_quotes_array.next);
        meta.mass_quote_items_quotes_array_remaining = meta.mass_quote_items_quotes_array_remaining - 1;
        transition select(meta.mass_quote_items_quotes_array_remaining) {
            16w0: accept;
            default: parse_mass_quote_items_quotes_array;
        }
    }

    state parse_mass_quote_response {
        packet.extract(hdr.mass_quote_response);
        meta.dispatched = 1;
        meta.mass_quote_response_items_quote_order_response_array_remaining = 16w30;
        transition parse_mass_quote_response_items_quote_order_response_array;
    }

    state parse_mass_quote_response_items_quote_order_response_array {
        packet.extract(hdr.mass_quote_response_items_quote_order_response_array.next);
        meta.mass_quote_response_items_quote_order_response_array_remaining = meta.mass_quote_response_items_quote_order_response_array_remaining - 1;
        transition select(meta.mass_quote_response_items_quote_order_response_array_remaining) {
            16w0: accept;
            default: parse_mass_quote_response_items_quote_order_response_array;
        }
    }

    state parse_market_maker_command {
        packet.extract(hdr.market_maker_command);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_maker_command_response {
        packet.extract(hdr.market_maker_command_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_request_for_execution {
        packet.extract(hdr.request_for_execution);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bid_offer_update {
        packet.extract(hdr.bid_offer_update);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_capture_report_single {
        packet.extract(hdr.trade_capture_report_single);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_capture_report_dual {
        packet.extract(hdr.trade_capture_report_dual);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_capture_report_response {
        packet.extract(hdr.trade_capture_report_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_bust {
        packet.extract(hdr.trade_bust);
        meta.dispatched = 1;
        transition accept;
    }

}

control WseOrderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseOrderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control WseOrderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control WseOrderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseOrderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login);
        packet.emit(hdr.login_response);
        packet.emit(hdr.connection_close);
        packet.emit(hdr.reject);
        packet.emit(hdr.test);
        packet.emit(hdr.test_event);
        packet.emit(hdr.trading_session_status);
        packet.emit(hdr.order_add);
        packet.emit(hdr.order_add_response);
        packet.emit(hdr.order_cancel);
        packet.emit(hdr.order_cancel_response);
        packet.emit(hdr.order_modify);
        packet.emit(hdr.order_modify_response);
        packet.emit(hdr.order_mass_cancel);
        packet.emit(hdr.order_mass_cancel_response);
        packet.emit(hdr.order_execute);
        packet.emit(hdr.mass_quote);
        packet.emit(hdr.mass_quote_items_quotes_array);
        packet.emit(hdr.mass_quote_response);
        packet.emit(hdr.mass_quote_response_items_quote_order_response_array);
        packet.emit(hdr.market_maker_command);
        packet.emit(hdr.market_maker_command_response);
        packet.emit(hdr.request_for_execution);
        packet.emit(hdr.bid_offer_update);
        packet.emit(hdr.trade_capture_report_single);
        packet.emit(hdr.trade_capture_report_dual);
        packet.emit(hdr.trade_capture_report_response);
        packet.emit(hdr.trade_bust);
    }
}

V1Switch(
    WseOrderentryParser(),
    WseOrderentryVerifyChecksum(),
    WseOrderentryIngress(),
    WseOrderentryEgress(),
    WseOrderentryComputeChecksum(),
    WseOrderentryDeparser()
) main;
