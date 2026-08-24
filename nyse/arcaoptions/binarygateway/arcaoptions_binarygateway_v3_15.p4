// P4_16 (v1model) definition for: Nyse ArcaOptions BinaryGateway PillarStream v3.15
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Binary Gateway
//   Encoding: Pillar Stream Protocol
//   Version: 3.15
//   Date: 5/8/2023
//   Specification: NYSE_Pillar_Options_Gateway_Binary_Protocol_Specification.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<128> username;
    bit<256> password;
    bit<32> mic;
    bit<160> version;
    bit<16> msg_type_2;
    bit<16> msg_length_2;
    bit<128> username_2;
    bit<8> status;
    bit<16> msg_type_3;
    bit<16> msg_length_3;
    bit<32> sess;
    bit<32> user;
    bit<64> next_seq;
    bit<8> access;
    bit<16> msg_type_4;
    bit<16> msg_length_4;
    bit<16> msg_type_5;
    bit<16> msg_length_5;
    bit<32> sess_2;
    bit<32> user_2;
    bit<64> start_seq;
    bit<64> end_seq;
    bit<8> access_2;
    bit<8> mode;
    bit<16> msg_type_6;
    bit<16> msg_length_6;
    bit<32> sess_3;
    bit<32> user_3;
    bit<8> status_2;
    bit<8> access_3;
    bit<16> msg_type_7;
    bit<16> msg_length_7;
    bit<32> sess_4;
    bit<32> user_4;
    bit<16> msg_type_8;
    bit<16> msg_length_8;
    bit<32> sess_5;
    bit<32> user_5;
    bit<8> status_3;
    bit<16> msg_type_9;
    bit<16> msg_length_9;
    bit<32> sess_6;
    bit<32> user_6;
    bit<64> seq;
    bit<32> reserved_4;
    bit<64> timestamp;
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
}

header session_configuration_request_message_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<128> username;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header sequenced_filler_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
}

header order_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<34> reserved_bits_34;
    bit<5> security_type;
    bit<5> capacity;
    bit<8> open_close;
    bit<5> sub_id_indicator;
    bit<5> special_ord_type;
    bit<8> locate_reqd;
    bit<5> retail_indicator;
    bit<5> attributed_quote;
    bit<5> order_capacity;
    bit<5> interest_type;
    bit<5> trading_session_id;
    bit<5> time_in_force;
    bit<5> proactive_if_locked;
    bit<8> self_trade_type;
    bit<5> cancel_instead_of_reprice;
    bit<5> routing_inst;
    bit<5> extended_exec_inst;
    bit<5> exec_inst;
    bit<5> ord_type;
    bit<5> side_bit_5;
    bit<64> price_price_8;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<80> user_data;
    bit<64> leg_open_close;
    bit<64> auction_id;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header order_cancel_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
}

header order_modify_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<32> order_qty;
    bit<8> side_u_81;
    bit<8> locate_reqd;
}

header new_bulk_quote_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> sub_id;
    bit<64> cl_ord_id;
    bit<8> self_trade_type;
    bit<32> group_id;
    bit<64> mm_sent_time;
    bit<32> series_index;
    bit<8> bit_field_quote_inst;
    bit<64> price_price_8;
    bit<32> order_qty;
}

header new_order_cross_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> cross_id;
    bit<8> allocation_pct;
    bit<40> clearing_firm_exposed;
    bit<40> clearing_account_exposed;
    bit<40> clearing_firm_covered;
    bit<40> clearing_account_covered;
    bit<128> reserved_16;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<34> reserved_bits_34;
    bit<5> security_type;
    bit<5> capacity;
    bit<8> open_close;
    bit<5> sub_id_indicator;
    bit<5> special_ord_type;
    bit<8> locate_reqd;
    bit<5> retail_indicator;
    bit<5> attributed_quote;
    bit<5> order_capacity;
    bit<5> interest_type;
    bit<5> trading_session_id;
    bit<5> time_in_force;
    bit<5> proactive_if_locked;
    bit<8> self_trade_type;
    bit<5> cancel_instead_of_reprice;
    bit<5> routing_inst;
    bit<5> extended_exec_inst;
    bit<5> exec_inst;
    bit<5> ord_type;
    bit<5> side_bit_5;
    bit<64> price_price_8;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<80> user_data;
    bit<64> leg_open_close;
    bit<64> auction_id;
    bit<16> sub_msg_type_2;
    bit<16> sub_msg_length_2;
    bit<32> symbol_id_2;
    bit<32> mpid_2;
    bit<80> market_maker_2;
    bit<32> mp_sub_id_2;
    bit<64> cl_ord_id_2;
    bit<64> orig_cl_ord_id_2;
    bit<34> reserved_bits_34_2;
    bit<5> security_type_2;
    bit<5> capacity_2;
    bit<8> open_close_2;
    bit<5> sub_id_indicator_2;
    bit<5> special_ord_type_2;
    bit<8> locate_reqd_2;
    bit<5> retail_indicator_2;
    bit<5> attributed_quote_2;
    bit<5> order_capacity_2;
    bit<5> interest_type_2;
    bit<5> trading_session_id_2;
    bit<5> time_in_force_2;
    bit<5> proactive_if_locked_2;
    bit<8> self_trade_type_2;
    bit<5> cancel_instead_of_reprice_2;
    bit<5> routing_inst_2;
    bit<5> extended_exec_inst_2;
    bit<5> exec_inst_2;
    bit<5> ord_type_2;
    bit<5> side_bit_5_2;
    bit<64> price_price_8_2;
    bit<32> order_qty_2;
    bit<32> min_qty_2;
    bit<80> user_data_2;
    bit<64> leg_open_close_2;
    bit<64> auction_id_2;
    bit<16> sub_msg_type_3;
    bit<16> sub_msg_length_3;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header bulk_cancel_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<64> cl_ord_id;
    bit<64> mm_sent_time;
    bit<8> side_u_81;
    bit<32> group_id;
    bit<128> target_cancel_username;
    bit<8> bulk_action;
    bit<8> cancel_scope;
    bit<32> target_cancel_mpid;
}

header risk_limit_update_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> floor_broker_firm_crd;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_request;
    bit<8> ioc_attribution;
    bit<1600> reserved_200;
}

header risk_action_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> floor_broker_firm_crd;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_action_type;
    bit<1600> reserved_200;
}

header new_complex_series_request_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> cl_ord_id;
    bit<32> mpid;
    bit<32> leg_symbol_id;
    bit<16> leg_ratio_qty;
    bit<8> leg_side;
}

header underlying_symbol_reference_data_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<192> nyse_symbol;
    bit<32> listed_mic;
    bit<8> underlying_type;
    bit<64> max_order_price;
    bit<16> mpv_class_id;
    bit<8> test_symbol_indicator;
    bit<8> channel_id;
    bit<8> legal_width_multiplier;
}

header series_reference_data_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> series_index;
    bit<32> symbol_id;
    bit<192> occ_symbol_root;
    bit<8> put_or_call;
    bit<64> strike_price;
    bit<64> maturity_date;
    bit<32> contract_multiplier;
    bit<8> series_type;
    bit<8> closing_only_indicator;
}

header minimum_price_variant_class_reference_data_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<160> mpv_class_name;
    bit<16> mpv_class_id;
    bit<64> rpimpv;
    bit<64> luldmpv;
}

header minimum_price_variant_level_reference_data_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<192> mpv_level_name;
    bit<64> price_u_price_8;
    bit<64> quoting_mpv;
    bit<64> trading_mpv;
    bit<16> mpv_class_id;
}

header mpid_configuration_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<8> mpid_status;
    bit<32> mpid;
    bit<128> username;
    bit<400> reserved_50;
}

header options_market_maker_symbol_appointment_reference_data_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<192> nyse_symbol;
    bit<80> market_maker;
    bit<32> mpid;
    bit<8> mm_type;
    bit<8> appointment_status;
    bit<400> reserved_50;
}

header session_configuration_acknowledgement_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<8> user_session_type;
    bit<8> user_session_status;
    bit<128> username;
    bit<32> mic;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<16> throttle_window;
    bit<16> throttle_threshold;
    bit<8> symbol_eligibility;
    bit<32> max_order_quantity;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> ack_status;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header order_acknowledgement_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<34> reserved_bits_34;
    bit<5> security_type;
    bit<5> capacity;
    bit<8> open_close;
    bit<5> sub_id_indicator;
    bit<5> special_ord_type;
    bit<8> locate_reqd;
    bit<5> retail_indicator;
    bit<5> attributed_quote;
    bit<5> order_capacity;
    bit<5> interest_type;
    bit<5> trading_session_id;
    bit<5> time_in_force;
    bit<5> proactive_if_locked;
    bit<8> self_trade_type;
    bit<5> cancel_instead_of_reprice;
    bit<5> routing_inst;
    bit<5> extended_exec_inst;
    bit<5> exec_inst;
    bit<5> ord_type;
    bit<5> side_bit_5;
    bit<64> price_price_8;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<80> user_data;
    bit<64> transact_time;
    bit<64> order_id;
    bit<32> leaves_qty;
    bit<64> working_price;
    bit<8> working_away_from_display;
    bit<32> pre_liquidity_indicator;
    bit<16> reason_code;
    bit<8> ack_type;
    bit<8> flow_indicator;
    bit<64> leg_open_close;
    bit<64> auction_id;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header bulk_quote_acknowledgment_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> sub_id;
    bit<64> cl_ord_id;
    bit<8> flow_indicator;
    bit<8> self_trade_type;
    bit<32> group_id;
    bit<8> repeating_groups;
    bit<32> series_index;
    bit<8> side_u_81;
    bit<8> ack_type;
    bit<64> price_price_8;
    bit<32> quantity;
    bit<16> reason_code;
    bit<8> working_away_from_display;
}

header order_request_acknowledgment_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> ref_cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price_price_8;
    bit<32> order_qty;
    bit<32> leaves_qty;
    bit<8> side_u_81;
    bit<8> locate_reqd;
    bit<16> reason_code;
    bit<8> ack_type;
    bit<8> flow_indicator;
    bit<80> user_data;
    bit<32> group_id;
    bit<80> market_maker;
    bit<128> target_cancel_username;
    bit<32> target_cancel_mpid;
    bit<8> bulk_action;
    bit<8> cancel_scope;
}

header order_priority_update_acknowledgment_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> working_price;
    bit<32> order_qty;
    bit<8> working_away_from_display;
    bit<32> pre_liquidity_indicator;
    bit<8> ack_type;
    bit<80> user_data;
}

header execution_report_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> deal_id;
    bit<64> last_px;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> last_qty;
    bit<32> liquidity_indicator;
    bit<8> multileg_reporting_type;
    bit<8> reserved_1;
    bit<16> reserved_2;
    bit<8> locate_reqd;
    bit<8> participant_type;
    bit<16> reason_code;
    bit<80> user_data;
    bit<8> side_u_81;
    bit<80> market_maker;
    bit<80> contra_market_maker;
    bit<40> contra_clearing_firm;
    bit<32> contra_mpid;
    bit<8> contra_open_close;
    bit<8> contra_customer_or_firm;
    bit<40> contra_clearing_account;
    bit<16> contra_cross_type;
    bit<8> contra_covered_or_uncovered;
    bit<8> covered_or_uncovered;
    bit<64> cross_id;
    bit<8> open_close;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header trade_bust_or_correct_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<32> sess;
    bit<32> user;
    bit<64> seq;
    bit<64> deal_id;
    bit<64> last_px;
    bit<32> last_qty;
    bit<16> reason_code;
    bit<80> user_data;
    bit<8> bust_correct_indicator;
}

header application_layer_reject_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<16> reason_code;
    bit<8> reject_type;
    bit<80> user_data;
    bit<32> reserved_4;
}

header risk_control_acknowledgement_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> floor_broker_firm_crd;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<8> risk_ack_type;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<8> risk_action_type;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_response;
    bit<8> ioc_attribution;
    bit<64> usd_calculation_1;
    bit<64> usd_calculation_2;
    bit<64> usd_calculation_3;
    bit<64> usd_calculation_4;
    bit<32> count_calculation;
    bit<8> blocked_by_breach_indicator;
    bit<8> blocked_by_kill_switch_indicator;
    bit<8> reinstatement_requiredby_self;
    bit<8> reinstatement_requiredby_other;
    bit<1600> reserved_200;
}

header risk_control_alert_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> floor_broker_firm_crd;
    bit<40> clearing_number;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_response;
    bit<8> ioc_attribution;
    bit<64> usd_calculation_1;
    bit<64> usd_calculation_2;
    bit<64> usd_calculation_3;
    bit<64> usd_calculation_4;
    bit<32> count_calculation;
    bit<8> risk_action_type;
    bit<8> threshold_breach_level;
    bit<8> blocked_by_breach_indicator;
    bit<8> blocked_by_kill_switch_indicator;
    bit<8> reinstatement_requiredby_self;
    bit<8> reinstatement_requiredby_other;
    bit<1600> reserved_200;
}

header complex_series_request_acknowledgement_t {
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<64> transact_time;
    bit<64> cl_ord_id;
    bit<16> reason_code;
    bit<32> symbol_id;
    bit<8> side_u_81;
    bit<8> repeating_groups;
    bit<32> leg_symbol_id;
    bit<16> leg_ratio_qty;
    bit<8> leg_side;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    session_configuration_request_message_t session_configuration_request_message;
    sequenced_filler_t sequenced_filler;
    order_request_t order_request;
    order_cancel_request_t order_cancel_request;
    order_modify_request_t order_modify_request;
    new_bulk_quote_t new_bulk_quote;
    new_order_cross_t new_order_cross;
    bulk_cancel_request_t bulk_cancel_request;
    risk_limit_update_request_t risk_limit_update_request;
    risk_action_request_t risk_action_request;
    new_complex_series_request_t new_complex_series_request;
    underlying_symbol_reference_data_t underlying_symbol_reference_data;
    series_reference_data_t series_reference_data;
    minimum_price_variant_class_reference_data_t minimum_price_variant_class_reference_data;
    minimum_price_variant_level_reference_data_t minimum_price_variant_level_reference_data;
    mpid_configuration_t mpid_configuration;
    options_market_maker_symbol_appointment_reference_data_t options_market_maker_symbol_appointment_reference_data;
    session_configuration_acknowledgement_t session_configuration_acknowledgement;
    order_acknowledgement_t order_acknowledgement;
    bulk_quote_acknowledgment_t bulk_quote_acknowledgment;
    order_request_acknowledgment_t order_request_acknowledgment;
    order_priority_update_acknowledgment_t order_priority_update_acknowledgment;
    execution_report_t execution_report;
    trade_bust_or_correct_t trade_bust_or_correct;
    application_layer_reject_t application_layer_reject;
    risk_control_acknowledgement_t risk_control_acknowledgement;
    risk_control_alert_t risk_control_alert;
    complex_series_request_acknowledgement_t complex_series_request_acknowledgement;
}

parser ArcaoptionsBinarygatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.seq_msg_type) {
            16w0x0220: parse_session_configuration_request_message;
            16w0x0282: parse_sequenced_filler;
            16w0x0248: parse_order_request;
            16w0x0250: parse_order_cancel_request;
            16w0x0251: parse_order_modify_request;
            16w0x0243: parse_new_bulk_quote;
            16w0x0222: parse_new_order_cross;
            16w0x0223: parse_bulk_cancel_request;
            16w0x0330: parse_risk_limit_update_request;
            16w0x0331: parse_risk_action_request;
            16w0x0357: parse_new_complex_series_request;
            16w0x0233: parse_underlying_symbol_reference_data;
            16w0X0234: parse_series_reference_data;
            16w0x0230: parse_minimum_price_variant_class_reference_data;
            16w0x0231: parse_minimum_price_variant_level_reference_data;
            16w0x0272: parse_mpid_configuration;
            16w0x0833: parse_options_market_maker_symbol_appointment_reference_data;
            16w0x0221: parse_session_configuration_acknowledgement;
            16w0x026: parse_order_acknowledgement;
            16w0x0294: parse_bulk_quote_acknowledgment;
            16w0x0278: parse_order_request_acknowledgment;
            16w0x0268: parse_order_priority_update_acknowledgment;
            16w0x0295: parse_execution_report;
            16w0x0293: parse_trade_bust_or_correct;
            16w0x0267: parse_application_layer_reject;
            16w0x0332: parse_risk_control_acknowledgement;
            16w0x0333: parse_risk_control_alert;
            16w0x0358: parse_complex_series_request_acknowledgement;
            default: accept;
        }
    }

    state parse_session_configuration_request_message {
        packet.extract(hdr.session_configuration_request_message);
        transition accept;
    }

    state parse_sequenced_filler {
        packet.extract(hdr.sequenced_filler);
        transition accept;
    }

    state parse_order_request {
        packet.extract(hdr.order_request);
        transition accept;
    }

    state parse_order_cancel_request {
        packet.extract(hdr.order_cancel_request);
        transition accept;
    }

    state parse_order_modify_request {
        packet.extract(hdr.order_modify_request);
        transition accept;
    }

    state parse_new_bulk_quote {
        packet.extract(hdr.new_bulk_quote);
        transition accept;
    }

    state parse_new_order_cross {
        packet.extract(hdr.new_order_cross);
        transition accept;
    }

    state parse_bulk_cancel_request {
        packet.extract(hdr.bulk_cancel_request);
        transition accept;
    }

    state parse_risk_limit_update_request {
        packet.extract(hdr.risk_limit_update_request);
        transition accept;
    }

    state parse_risk_action_request {
        packet.extract(hdr.risk_action_request);
        transition accept;
    }

    state parse_new_complex_series_request {
        packet.extract(hdr.new_complex_series_request);
        transition accept;
    }

    state parse_underlying_symbol_reference_data {
        packet.extract(hdr.underlying_symbol_reference_data);
        transition accept;
    }

    state parse_series_reference_data {
        packet.extract(hdr.series_reference_data);
        transition accept;
    }

    state parse_minimum_price_variant_class_reference_data {
        packet.extract(hdr.minimum_price_variant_class_reference_data);
        transition accept;
    }

    state parse_minimum_price_variant_level_reference_data {
        packet.extract(hdr.minimum_price_variant_level_reference_data);
        transition accept;
    }

    state parse_mpid_configuration {
        packet.extract(hdr.mpid_configuration);
        transition accept;
    }

    state parse_options_market_maker_symbol_appointment_reference_data {
        packet.extract(hdr.options_market_maker_symbol_appointment_reference_data);
        transition accept;
    }

    state parse_session_configuration_acknowledgement {
        packet.extract(hdr.session_configuration_acknowledgement);
        transition accept;
    }

    state parse_order_acknowledgement {
        packet.extract(hdr.order_acknowledgement);
        transition accept;
    }

    state parse_bulk_quote_acknowledgment {
        packet.extract(hdr.bulk_quote_acknowledgment);
        transition accept;
    }

    state parse_order_request_acknowledgment {
        packet.extract(hdr.order_request_acknowledgment);
        transition accept;
    }

    state parse_order_priority_update_acknowledgment {
        packet.extract(hdr.order_priority_update_acknowledgment);
        transition accept;
    }

    state parse_execution_report {
        packet.extract(hdr.execution_report);
        transition accept;
    }

    state parse_trade_bust_or_correct {
        packet.extract(hdr.trade_bust_or_correct);
        transition accept;
    }

    state parse_application_layer_reject {
        packet.extract(hdr.application_layer_reject);
        transition accept;
    }

    state parse_risk_control_acknowledgement {
        packet.extract(hdr.risk_control_acknowledgement);
        transition accept;
    }

    state parse_risk_control_alert {
        packet.extract(hdr.risk_control_alert);
        transition accept;
    }

    state parse_complex_series_request_acknowledgement {
        packet.extract(hdr.complex_series_request_acknowledgement);
        transition accept;
    }

}

control ArcaoptionsBinarygatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaoptionsBinarygatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control ArcaoptionsBinarygatewayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control ArcaoptionsBinarygatewayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaoptionsBinarygatewayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.session_configuration_request_message);
        packet.emit(hdr.sequenced_filler);
        packet.emit(hdr.order_request);
        packet.emit(hdr.order_cancel_request);
        packet.emit(hdr.order_modify_request);
        packet.emit(hdr.new_bulk_quote);
        packet.emit(hdr.new_order_cross);
        packet.emit(hdr.bulk_cancel_request);
        packet.emit(hdr.risk_limit_update_request);
        packet.emit(hdr.risk_action_request);
        packet.emit(hdr.new_complex_series_request);
        packet.emit(hdr.underlying_symbol_reference_data);
        packet.emit(hdr.series_reference_data);
        packet.emit(hdr.minimum_price_variant_class_reference_data);
        packet.emit(hdr.minimum_price_variant_level_reference_data);
        packet.emit(hdr.mpid_configuration);
        packet.emit(hdr.options_market_maker_symbol_appointment_reference_data);
        packet.emit(hdr.session_configuration_acknowledgement);
        packet.emit(hdr.order_acknowledgement);
        packet.emit(hdr.bulk_quote_acknowledgment);
        packet.emit(hdr.order_request_acknowledgment);
        packet.emit(hdr.order_priority_update_acknowledgment);
        packet.emit(hdr.execution_report);
        packet.emit(hdr.trade_bust_or_correct);
        packet.emit(hdr.application_layer_reject);
        packet.emit(hdr.risk_control_acknowledgement);
        packet.emit(hdr.risk_control_alert);
        packet.emit(hdr.complex_series_request_acknowledgement);
    }
}

V1Switch(
    ArcaoptionsBinarygatewayParser(),
    ArcaoptionsBinarygatewayVerifyChecksum(),
    ArcaoptionsBinarygatewayIngress(),
    ArcaoptionsBinarygatewayEgress(),
    ArcaoptionsBinarygatewayComputeChecksum(),
    ArcaoptionsBinarygatewayDeparser()
) main;
