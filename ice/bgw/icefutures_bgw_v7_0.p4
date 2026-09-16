// P4_16 (v1model) definition for: Ice IceFutures Bgw Sbe v7.0
// 
// Protocol:
//   Organization: Intercontinental Exchange
//   Protocol: Binary Order Gateway
//   Encoding: Simple Binary Encoding
//   Version: 7.0
//   Date: 10/24/2025
//   Specification: ICE Binary Order and Utility Service API Message Specification - Version 2.6.3 - Final - 10.24.2025.pdf
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

header header_flags_t {
    bit<16> message_length;
    bit<16> encoding_type;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
    bit<32> sequence_id;
    bit<64> send_time;
    bit<6> reserved_bits;
    bit<1> poss_resend;
    bit<1> poss_dupe;
}

header simple_open_framing_header_message_t {
    bit<16> message_length;
    bit<16> encoding_type;
}

header logon_request_message_t {
    bit<160> user_id;
    bit<32> client_id;
    bit<16> heart_beat_interval;
    bit<240> application_name;
    bit<400> application_version;
    bit<240> application_vendor;
    bit<400> raw_data;
    bit<400> ip_session_token;
}

header logon_report_message_t {
    bit<160> user_id;
    bit<16> heart_beat_interval;
    bit<8> severity_level;
    bit<32> exchange_code;
    bit<800> text;
}

header logout_request_message_t {
    bit<160> user_id;
}

header logout_report_message_t {
    bit<160> user_id;
    bit<32> exchange_code;
    bit<800> text;
}

header error_message_t {
    bit<32> ref_sequence_id;
    bit<8> severity_level;
    bit<160> supported_schema_version;
    bit<32> exchange_code;
    bit<800> text;
}

header news_message_t {
    bit<160> user_id;
    bit<32> exchange_code;
    bit<16> text_length;
}

header security_definition_report_strategy_message_t {
    bit<32> security_req_id;
    bit<8> security_response_type;
    bit<32> security_response_id;
    bit<32> market_type_i_d_int_32;
    bit<32> no_rpts;
    bit<32> list_seq_no;
    bit<32> symbol_int_32;
    bit<32> underlying_strategy_symbol;
    bit<16> maturity_date;
    bit<8> security_trading_status;
    bit<16> security_sub_type_int_16;
    bit<8> exchange_silo;
    bit<64> transact_time_utc_timestamp;
    bit<8> leg_deals_suppressed;
    bit<64> increment_price;
    bit<64> increment_qty;
    bit<64> min_price;
    bit<64> max_price;
    bit<8> num_of_decimal_price;
    bit<8> num_of_decimal_qty;
    bit<32> product_i_d_int_32;
    bit<32> base_num_lots;
    bit<32> denominator;
    bit<8> implied_type;
    bit<64> off_exchange_increment_price_decimal_9_null;
    bit<64> off_exchange_increment_qty_decimal_9_null;
    bit<8> num_of_decimal_strike_price;
    bit<16> num_of_cycles_int_16_null;
    bit<64> lot_size_multiplier_decimal_9_null;
    bit<8> block_only;
    bit<8> flex_allowed;
    bit<8> gt_allowed;
    bit<8> mifid_regulated_market_boolean_enum;
    bit<16> strip_type;
    bit<32> hub_id;
    bit<8> override_block_min;
    bit<8> test_market_indicator_boolean_enum;
    bit<64> screen_tick_value;
    bit<64> block_tick_value;
    bit<16> block_length;
    bit<16> num_in_group;
}

header security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_t {
    bit<8> block_details_block_type;
    bit<24> block_details_trade_type;
    bit<64> block_details_min_qty;
}

header security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_t {
    bit<240> security_alt_id;
    bit<24> security_alt_id_source;
}

header security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_t {
    bit<32> leg_symbol_int_32;
    bit<8> leg_security_type;
    bit<16> leg_security_sub_type;
    bit<8> leg_side;
    bit<64> leg_price;
    bit<32> leg_option_delta;
    bit<16> leg_ratio_qty_denominator_int_16;
    bit<16> leg_ratio_qty_numerator_int_16;
    bit<16> leg_ratio_price_denominator;
    bit<16> leg_ratio_price_numerator;
}

header security_definition_report_message_t {
    bit<32> security_req_id;
    bit<8> security_response_type;
    bit<32> security_response_id;
    bit<32> market_type_i_d_int_32;
    bit<32> symbol_int_32;
    bit<8> exchange_silo;
    bit<32> no_rpts;
    bit<32> list_seq_no;
    bit<32> underlying_symbol_int_32;
    bit<96> cfi_code;
    bit<16> security_sub_type_int_16_null;
    bit<16> maturity_date;
    bit<16> screen_last_trade_date;
    bit<32> contract_multiplier;
    bit<16> start_date;
    bit<16> end_date;
    bit<8> put_or_call;
    bit<64> strike_price;
    bit<8> security_trading_status;
    bit<96> currency;
    bit<8> settl_method;
    bit<8> strike_exercise_style;
    bit<64> increment_qty;
    bit<64> increment_price;
    bit<64> min_price;
    bit<64> max_price;
    bit<64> off_exchange_increment_price_decimal_9;
    bit<64> off_exchange_increment_qty_decimal_9;
    bit<64> screen_tick_value;
    bit<64> block_tick_value;
    bit<32> lot_size;
    bit<32> contract_size;
    bit<8> num_of_decimal_price;
    bit<8> num_of_decimal_qty;
    bit<96> granularity;
    bit<32> base_num_lots;
    bit<64> tick_value;
    bit<32> product_i_d_int_32;
    bit<8> clearable;
    bit<32> hedge_product_id;
    bit<32> hedge_market_id;
    bit<8> hedge_only;
    bit<8> is_dividend_adjusted;
    bit<32> denominator;
    bit<32> initial_margin;
    bit<8> implied_type;
    bit<8> num_of_decimal_strike_price;
    bit<16> num_of_cycles_int_16;
    bit<64> lot_size_multiplier_decimal_9;
    bit<16> strip_type;
    bit<32> strip_id;
    bit<8> block_only;
    bit<8> flex_allowed;
    bit<8> gt_allowed;
    bit<8> aon_allowed;
    bit<8> mifid_regulated_market_boolean_enum_null;
    bit<8> flex_strike_allowed;
    bit<32> hub_id;
    bit<8> override_block_min;
    bit<8> test_market_indicator_boolean_enum_null;
    bit<32> ref_sprd_product_id;
    bit<8> market_transparency_type;
    bit<8> non_commoditized_market;
    bit<16> block_length;
    bit<16> num_in_group;
}

header security_definition_report_message_security_definition_report_message_no_block_details_group_t {
    bit<8> block_details_block_type;
    bit<24> block_details_trade_type;
    bit<64> block_details_min_qty;
}

header security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_t {
    bit<240> security_alt_id;
    bit<24> security_alt_id_source;
}

header security_definition_reject_message_t {
    bit<32> security_req_id;
    bit<8> security_response_type;
    bit<8> security_request_type;
    bit<32> market_type_i_d_int_32;
    bit<8> security_type_security_type_enum_null;
    bit<32> exchange_code;
    bit<800> text;
}

header security_definition_request_message_t {
    bit<32> security_req_id;
    bit<8> security_request_type;
    bit<32> market_type_i_d_int_32;
}

header security_definition_report_product_message_t {
    bit<32> security_req_id;
    bit<8> security_response_type;
    bit<32> security_response_id;
    bit<32> market_type_i_d_int_32;
    bit<32> no_rpts;
    bit<32> list_seq_no;
    bit<32> product_i_d_int_32;
    bit<96> product_type;
    bit<8> mifid_regulated_market_boolean_enum;
    bit<8> test_market_indicator_boolean_enum;
    bit<8> stops_allowed;
    bit<8> options_allowed;
    bit<8> uds_options_allowed;
    bit<8> uds_futures_allowed;
    bit<8> mass_quotes_allowed;
    bit<8> rfq_futures_allowed;
    bit<8> rfq_options_allowed;
    bit<8> crossing_order_futures_allowed;
    bit<8> crossing_order_options_allowed;
    bit<8> self_block_allowed;
    bit<16> product_name_length;
    bit<16> product_desc_length;
    bit<16> product_group_length;
}

header ip_request_message_t {
    bit<32> client_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header ip_request_message_i_p_request_message_no_users_group_t {
    bit<160> user_id;
}

header ip_report_message_t {
    bit<32> exchange_code;
    bit<800> text;
    bit<16> block_length;
    bit<16> num_in_group;
}

header ip_report_message_i_p_report_message_no_users_group_t {
    bit<160> user_id;
    bit<8> success;
    bit<120> ip_address;
    bit<16> port;
    bit<400> ip_session_token;
}

header trader_logon_request_message_t {
    bit<160> originator_user_id;
    bit<8> direct_electronic_access;
    bit<8> trading_capacity;
    bit<8> liquidity_provision;
    bit<8> commodity_deriv_indicator;
    bit<64> investment_decision;
    bit<64> execution_decision;
    bit<64> client_id_code;
    bit<64> mifid_id;
    bit<400> raw_data;
}

header trader_logon_report_message_t {
    bit<160> originator_user_id;
    bit<32> client_id;
    bit<32> exchange_code;
    bit<800> text;
}

header trader_logout_request_message_t {
    bit<160> originator_user_id;
}

header trader_logout_report_message_t {
    bit<160> originator_user_id;
    bit<32> exchange_code;
    bit<800> text;
}

header new_order_request_message_t {
    bit<64> price_decimal_9_null;
    bit<64> order_qty_decimal_9;
    bit<32> symbol_int_32;
    bit<8> time_in_force_time_in_force_enum;
    bit<8> side_side_enum;
    bit<160> originator_user_id;
    bit<8> ord_type_order_type_enum;
    bit<8> manual_order_indicator;
    bit<64> cl_ord_id;
    bit<64> max_show;
    bit<64> stop_px;
    bit<32> give_up_clearing_firm;
    bit<32> clearing_firm_int_32;
    bit<64> self_match_prevention_id;
    bit<16> expire_date;
    bit<8> self_match_prevention_instruction;
    bit<8> exec_inst;
    bit<8> direct_electronic_access;
    bit<8> trading_capacity;
    bit<8> liquidity_provision;
    bit<8> commodity_deriv_indicator;
    bit<64> investment_decision;
    bit<64> execution_decision;
    bit<64> client_id_code;
    bit<64> mifid_id;
    bit<8> cust_order_handling_inst;
    bit<8> position_effect;
    bit<8> alloc_handl_inst;
    bit<8> price_type;
    bit<112> clearing_account_string_14;
    bit<96> customer_account_ref_id;
    bit<240> memo;
    bit<160> allocation_account;
    bit<328> on_behalf_of_comp_id;
    bit<328> on_behalf_of_sub_i_d_string_41;
    bit<328> on_behalf_of_location_i_d_string_41;
}

header cancel_replace_request_message_t {
    bit<64> price_decimal_9_null;
    bit<64> order_qty_decimal_9;
    bit<32> symbol_int_32;
    bit<8> time_in_force_time_in_force_enum;
    bit<8> side_side_enum;
    bit<160> originator_user_id;
    bit<8> ord_type_order_type_enum;
    bit<8> manual_order_indicator;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_i_d_int_64;
    bit<64> max_show;
    bit<64> stop_px;
    bit<32> give_up_clearing_firm;
    bit<32> clearing_firm_int_32;
    bit<64> self_match_prevention_id;
    bit<16> expire_date;
    bit<8> self_match_prevention_instruction;
    bit<8> exec_inst;
    bit<8> direct_electronic_access;
    bit<8> trading_capacity;
    bit<8> liquidity_provision;
    bit<8> commodity_deriv_indicator;
    bit<64> investment_decision;
    bit<64> execution_decision;
    bit<64> client_id_code;
    bit<64> mifid_id;
    bit<8> alloc_handl_inst;
    bit<8> price_type;
    bit<112> clearing_account_string_14;
    bit<96> customer_account_ref_id;
    bit<240> memo;
    bit<160> allocation_account;
    bit<328> on_behalf_of_comp_id;
    bit<328> on_behalf_of_sub_i_d_string_41;
    bit<328> on_behalf_of_location_i_d_string_41;
}

header cancel_request_message_t {
    bit<32> symbol_int_32;
    bit<160> originator_user_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_i_d_int_64;
    bit<8> side_side_enum;
}

header quote_request_message_t {
    bit<160> originator_user_id;
    bit<8> side_side_enum_null;
    bit<64> order_qty_decimal_9_null;
    bit<64> rfq_req_id;
    bit<32> symbol_int_32;
    bit<32> clearing_firm_int_32_null;
    bit<112> clearing_account_string_14_null;
    bit<328> on_behalf_of_comp_id;
    bit<328> on_behalf_of_sub_i_d_string_41;
    bit<328> on_behalf_of_location_i_d_string_41;
}

header new_order_cross_request_message_t {
    bit<64> price_decimal_9;
    bit<64> order_qty_decimal_9;
    bit<32> symbol_int_32;
    bit<160> originator_user_id;
    bit<8> ord_type_order_type_enum;
    bit<64> cross_i_d_int_64;
    bit<8> cross_type_cross_type_enum;
    bit<24> trade_type;
    bit<8> exec_inst;
    bit<8> price_type;
    bit<8> bypass_mqr;
    bit<8> hedge_only;
    bit<64> benchmark_price;
    bit<8> bench_mark_price_type;
    bit<8> time_in_force_time_in_force_enum;
    bit<800> transact_details;
    bit<64> transact_time_utc_timestamp;
    bit<16> block_length;
    bit<16> num_in_group;
}

header new_order_cross_request_message_new_order_cross_request_message_no_sides_group_t {
    bit<8> side_side_enum;
    bit<64> cl_ord_id;
    bit<32> give_up_clearing_firm;
    bit<32> clearing_firm_int_32;
    bit<8> direct_electronic_access;
    bit<8> trading_capacity;
    bit<8> liquidity_provision;
    bit<8> commodity_deriv_indicator;
    bit<64> investment_decision;
    bit<64> execution_decision;
    bit<64> client_id_code;
    bit<64> mifid_id;
    bit<64> self_match_prevention_id;
    bit<8> self_match_prevention_instruction;
    bit<8> manual_order_indicator;
    bit<8> cust_order_handling_inst;
    bit<8> position_effect;
    bit<8> alloc_handl_inst;
    bit<112> clearing_account_string_14;
    bit<96> customer_account_ref_id;
    bit<240> memo;
    bit<160> allocation_account;
    bit<328> on_behalf_of_comp_id;
    bit<328> on_behalf_of_sub_i_d_string_41;
    bit<328> on_behalf_of_location_i_d_string_41;
}

header new_order_cross_request_message_new_order_cross_request_message_no_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header new_order_cross_request_message_new_order_cross_request_message_no_legs_group_t {
    bit<32> leg_symbol_int_32_null;
    bit<8> leg_security_id_source;
    bit<32> leg_opt_attribute;
    bit<64> leg_qty;
    bit<64> leg_price;
    bit<8> leg_security_type;
    bit<96> leg_memo_field;
    bit<600> leg_security_id;
}

header order_mass_cancel_request_message_t {
    bit<160> originator_user_id;
    bit<8> ord_type_order_type_enum_null;
    bit<8> side_side_enum_null;
    bit<32> symbol_int_32_null;
    bit<64> cl_ord_id;
    bit<32> market_type_i_d_int_32_null;
    bit<64> price_decimal_9_null;
    bit<8> mass_cancel_request_type;
    bit<8> time_in_force_time_in_force_enum_null;
    bit<328> on_behalf_of_sub_i_d_string_41_null;
}

header mass_quote_request_message_t {
    bit<64> quote_id;
    bit<8> risk_protection_reset;
    bit<64> self_match_prevention_id;
    bit<8> self_match_prevention_instruction;
    bit<160> originator_user_id;
    bit<8> direct_electronic_access;
    bit<8> trading_capacity;
    bit<8> liquidity_provision;
    bit<8> commodity_deriv_indicator;
    bit<64> investment_decision;
    bit<64> execution_decision;
    bit<64> client_id_code;
    bit<64> mifid_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_t {
    bit<32> quote_set_id;
    bit<32> underlying_symbol_int_32;
    bit<32> quote_entry_id;
    bit<32> symbol_int_32;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> bid_sz;
    bit<64> offer_sz;
}

header quote_cancel_request_message_t {
    bit<64> quote_id;
    bit<8> quote_cancel_type;
    bit<160> originator_user_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_t {
    bit<32> underlying_symbol_int_32_null;
    bit<32> underlying_security_id;
    bit<32> underlying_product;
}

header security_definition_request_create_strategy_message_t {
    bit<32> security_req_id;
    bit<8> security_request_type;
    bit<32> market_type_i_d_int_32;
    bit<16> security_sub_type_int_16_null;
    bit<32> product_i_d_int_32_null;
    bit<16> start_date;
    bit<16> end_date;
    bit<8> security_type_security_type_enum;
    bit<16> block_length;
    bit<16> num_in_group;
}

header security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_t {
    bit<32> leg_symbol_int_32;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<16> leg_ratio_qty_denominator_int_16_null;
    bit<16> leg_ratio_qty_numerator_int_16_null;
    bit<64> leg_price;
    bit<32> leg_option_delta;
}

header security_definition_request_create_flex_message_t {
    bit<32> security_req_id;
    bit<8> security_request_type;
    bit<32> market_type_i_d_int_32;
    bit<8> security_type_security_type_enum;
    bit<16> maturity_date;
    bit<32> product_i_d_int_32_null;
    bit<32> symbol_int_32_null;
    bit<64> strike_price;
}

header execution_report_new_message_t {
    bit<160> originator_user_id;
    bit<64> system_id;
    bit<32> system_sequence_id;
    bit<64> transact_time_utc_timestamp;
    bit<64> cl_ord_id;
    bit<32> symbol_int_32;
    bit<8> ord_type_order_type_enum;
    bit<8> side_side_enum;
    bit<64> original_system_id;
    bit<64> original_creation_timestamp;
    bit<64> leaves_qty;
    bit<64> price_decimal_9_null;
    bit<64> me_acceptance_time_utc_timestamp;
    bit<64> time_priority;
    bit<8> order_status;
    bit<240> memo;
}

header execution_report_modify_message_t {
    bit<160> originator_user_id;
    bit<64> system_id;
    bit<32> system_sequence_id;
    bit<64> transact_time_utc_timestamp;
    bit<64> cl_ord_id;
    bit<32> symbol_int_32;
    bit<8> ord_type_order_type_enum;
    bit<8> side_side_enum;
    bit<64> original_system_id;
    bit<64> original_creation_timestamp;
    bit<64> orig_cl_ord_i_d_int_64_null;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> price_decimal_9_null;
    bit<64> me_acceptance_time_utc_timestamp;
    bit<64> time_priority;
    bit<8> exec_type;
    bit<8> order_status;
    bit<8> order_state;
    bit<8> exec_restatement_reason;
    bit<1> order_flags_reserved_7;
    bit<1> order_flags_reserved_6;
    bit<1> order_flags_reserved_5;
    bit<1> order_flags_reserved_4;
    bit<1> order_flags_reserved_3;
    bit<1> order_flags_reserved_2;
    bit<1> stop_elected;
    bit<1> stop_limit_price_changed;
    bit<240> memo;
}

header execution_report_cancel_message_t {
    bit<160> originator_user_id;
    bit<64> system_id;
    bit<32> system_sequence_id;
    bit<64> transact_time_utc_timestamp;
    bit<64> cl_ord_id;
    bit<32> symbol_int_32;
    bit<8> ord_type_order_type_enum;
    bit<8> side_side_enum;
    bit<64> original_system_id;
    bit<64> original_creation_timestamp;
    bit<64> orig_cl_ord_i_d_int_64_null;
    bit<64> me_acceptance_time_utc_timestamp;
    bit<32> exchange_code;
    bit<8> cancel_reason;
    bit<64> cross_i_d_int_64_null;
    bit<800> text;
}

header execution_report_reject_message_t {
    bit<160> originator_user_id;
    bit<64> system_id;
    bit<32> system_sequence_id;
    bit<64> transact_time_utc_timestamp;
    bit<64> cl_ord_id;
    bit<32> symbol_int_32;
    bit<8> ord_type_order_type_enum_null;
    bit<8> side_side_enum;
    bit<64> original_system_id;
    bit<64> original_creation_timestamp;
    bit<64> orig_cl_ord_i_d_int_64_null;
    bit<8> order_status;
    bit<8> reject_response_to;
    bit<8> reject_reason;
    bit<32> exchange_code;
    bit<240> memo;
    bit<800> text;
}

header execution_report_snapshot_message_t {
    bit<160> originator_user_id;
    bit<64> system_id;
    bit<32> system_sequence_id;
    bit<64> transact_time_utc_timestamp;
    bit<64> cl_ord_id;
    bit<32> symbol_int_32;
    bit<8> ord_type_order_type_enum;
    bit<8> side_side_enum;
    bit<64> original_system_id;
    bit<64> original_creation_timestamp;
    bit<64> max_show;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> price_decimal_9_null;
    bit<64> stop_px;
    bit<16> expire_date;
    bit<64> time_priority;
    bit<8> time_in_force_time_in_force_enum;
    bit<8> order_status;
    bit<8> order_state;
    bit<32> give_up_clearing_firm;
    bit<32> clearing_firm_int_32_null;
    bit<8> direct_electronic_access;
    bit<8> trading_capacity;
    bit<8> liquidity_provision;
    bit<8> commodity_deriv_indicator;
    bit<64> investment_decision;
    bit<64> execution_decision;
    bit<64> client_id_code;
    bit<64> mifid_id;
    bit<64> self_match_prevention_id;
    bit<8> self_match_prevention_instruction;
    bit<8> manual_order_indicator;
    bit<8> exec_inst;
    bit<8> cust_order_handling_inst;
    bit<8> position_effect;
    bit<8> alloc_handl_inst;
    bit<112> clearing_account_string_14_null;
    bit<96> customer_account_ref_id;
    bit<240> memo;
    bit<160> allocation_account;
    bit<328> on_behalf_of_comp_id;
    bit<328> on_behalf_of_sub_i_d_string_41_null;
    bit<328> on_behalf_of_location_i_d_string_41_null;
}

header execution_report_trade_message_t {
    bit<160> originator_user_id;
    bit<64> exec_i_d_int_64;
    bit<64> cl_ord_id;
    bit<32> symbol_int_32;
    bit<8> ord_type_order_type_enum;
    bit<8> side_side_enum;
    bit<64> order_id;
    bit<64> original_system_id;
    bit<64> original_creation_timestamp;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> last_px;
    bit<64> last_shares;
    bit<64> transact_time_utc_timestamp;
    bit<64> num_of_lots;
    bit<8> exec_type;
    bit<1> trade_flags_reserved_7;
    bit<1> trade_flags_reserved_6;
    bit<1> trade_flags_reserved_5;
    bit<1> trade_flags_reserved_4;
    bit<1> trade_flags_reserved_3;
    bit<1> trade_flags_reserved_2;
    bit<1> deal_adjust_indicator;
    bit<1> liquidity_indicator;
    bit<32> clearing_firm_int_32_null;
    bit<112> clearing_account_string_14_null;
    bit<240> memo;
    bit<64> exec_ref_id;
    bit<16> no_leg_executions;
    bit<64> secondary_exec_id;
    bit<64> link_exec_id;
    bit<64> last_par_px;
    bit<64> delivery_start_date;
    bit<64> delivery_end_date;
    bit<64> cross_i_d_int_64_null;
    bit<8> cross_type_cross_type_enum_null;
    bit<8> waiver_indicator;
    bit<24> trade_type;
}

header quote_report_message_t {
    bit<160> originator_user_id;
    bit<8> side_side_enum_null;
    bit<32> symbol_int_32;
    bit<64> rfq_req_id;
    bit<64> rfq_system_id;
    bit<64> transact_time_utc_timestamp;
    bit<64> order_qty_decimal_9_null;
    bit<16> quote_ack_status;
    bit<8> quote_reject_reason;
}

header new_order_cross_report_message_t {
    bit<160> originator_user_id;
    bit<32> symbol_int_32;
    bit<64> cross_i_d_int_64;
    bit<64> transact_time_utc_timestamp;
    bit<8> rfc_status;
    bit<32> exchange_code;
    bit<800> text;
}

header order_mass_cancel_report_message_t {
    bit<160> originator_user_id;
    bit<32> symbol_int_32_null;
    bit<64> cl_ord_id;
    bit<64> transact_time_utc_timestamp;
    bit<32> market_type_i_d_int_32_null;
    bit<8> mass_cancel_request_type;
    bit<8> mass_cancel_response;
    bit<8> mass_cancel_reject_reason;
    bit<32> exchange_code;
    bit<800> text;
}

header mass_quote_report_message_t {
    bit<64> quote_id;
    bit<160> originator_user_id;
    bit<8> risk_protection_reset;
    bit<16> quote_ack_status;
    bit<8> quote_reject_reason;
    bit<64> transact_time_utc_timestamp_null;
    bit<64> me_acceptance_time_utc_timestamp_null;
    bit<32> exchange_code;
    bit<800> text;
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_t {
    bit<32> quote_set_id;
    bit<32> underlying_symbol_int_32;
    bit<32> quote_entry_id;
    bit<32> symbol_int_32;
    bit<8> quote_entry_reject_reason;
    bit<32> quote_entry_exchange_code;
    bit<800> quote_entry_reject_reason_text;
}

header resend_request_message_t {
    bit<32> begin_seq_no;
    bit<32> end_seq_no;
}

header resend_report_message_t {
    bit<32> begin_seq_no;
    bit<32> end_seq_no;
    bit<8> status;
    bit<32> exchange_code;
    bit<800> text;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
    bit<8> gap_fill_flag;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_remaining;
    bit<16> security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_remaining;
    bit<16> security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_remaining;
    bit<16> security_definition_report_message_security_definition_report_message_no_block_details_group_remaining;
    bit<16> security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_remaining;
    bit<16> ip_request_message_i_p_request_message_no_users_group_remaining;
    bit<16> ip_report_message_i_p_report_message_no_users_group_remaining;
    bit<16> new_order_cross_request_message_new_order_cross_request_message_no_sides_group_remaining;
    bit<16> new_order_cross_request_message_new_order_cross_request_message_no_legs_group_remaining;
    bit<16> mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_remaining;
    bit<16> quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_remaining;
    bit<16> security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_remaining;
    bit<16> mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_remaining;
}

struct headers_t {
    header_flags_t header_flags;
    simple_open_framing_header_message_t simple_open_framing_header_message;
    logon_request_message_t logon_request_message;
    logon_report_message_t logon_report_message;
    logout_request_message_t logout_request_message;
    logout_report_message_t logout_report_message;
    error_message_t error_message;
    news_message_t news_message;
    security_definition_report_strategy_message_t security_definition_report_strategy_message;
    security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_t security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group[MAX_MESSAGES];
    security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_header_t security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_header;
    security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_t security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group[MAX_MESSAGES];
    security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_header_t security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_header;
    security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_t security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group[MAX_MESSAGES];
    security_definition_report_message_t security_definition_report_message;
    security_definition_report_message_security_definition_report_message_no_block_details_group_t security_definition_report_message_security_definition_report_message_no_block_details_group[MAX_MESSAGES];
    security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_header_t security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_header;
    security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_t security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group[MAX_MESSAGES];
    security_definition_reject_message_t security_definition_reject_message;
    security_definition_request_message_t security_definition_request_message;
    security_definition_report_product_message_t security_definition_report_product_message;
    ip_request_message_t ip_request_message;
    ip_request_message_i_p_request_message_no_users_group_t ip_request_message_i_p_request_message_no_users_group[MAX_MESSAGES];
    ip_report_message_t ip_report_message;
    ip_report_message_i_p_report_message_no_users_group_t ip_report_message_i_p_report_message_no_users_group[MAX_MESSAGES];
    trader_logon_request_message_t trader_logon_request_message;
    trader_logon_report_message_t trader_logon_report_message;
    trader_logout_request_message_t trader_logout_request_message;
    trader_logout_report_message_t trader_logout_report_message;
    new_order_request_message_t new_order_request_message;
    cancel_replace_request_message_t cancel_replace_request_message;
    cancel_request_message_t cancel_request_message;
    quote_request_message_t quote_request_message;
    new_order_cross_request_message_t new_order_cross_request_message;
    new_order_cross_request_message_new_order_cross_request_message_no_sides_group_t new_order_cross_request_message_new_order_cross_request_message_no_sides_group[MAX_MESSAGES];
    new_order_cross_request_message_new_order_cross_request_message_no_legs_group_header_t new_order_cross_request_message_new_order_cross_request_message_no_legs_group_header;
    new_order_cross_request_message_new_order_cross_request_message_no_legs_group_t new_order_cross_request_message_new_order_cross_request_message_no_legs_group[MAX_MESSAGES];
    order_mass_cancel_request_message_t order_mass_cancel_request_message;
    mass_quote_request_message_t mass_quote_request_message;
    mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_t mass_quote_request_message_mass_quote_request_message_no_quote_sets_group[MAX_MESSAGES];
    quote_cancel_request_message_t quote_cancel_request_message;
    quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_t quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group[MAX_MESSAGES];
    security_definition_request_create_strategy_message_t security_definition_request_create_strategy_message;
    security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_t security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group[MAX_MESSAGES];
    security_definition_request_create_flex_message_t security_definition_request_create_flex_message;
    execution_report_new_message_t execution_report_new_message;
    execution_report_modify_message_t execution_report_modify_message;
    execution_report_cancel_message_t execution_report_cancel_message;
    execution_report_reject_message_t execution_report_reject_message;
    execution_report_snapshot_message_t execution_report_snapshot_message;
    execution_report_trade_message_t execution_report_trade_message;
    quote_report_message_t quote_report_message;
    new_order_cross_report_message_t new_order_cross_report_message;
    order_mass_cancel_report_message_t order_mass_cancel_report_message;
    mass_quote_report_message_t mass_quote_report_message;
    mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_t mass_quote_report_message_mass_quote_report_message_no_quote_sets_group[MAX_MESSAGES];
    resend_request_message_t resend_request_message;
    resend_report_message_t resend_report_message;
    sequence_reset_message_t sequence_reset_message;
}

parser IcefuturesBgwParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.header_flags);
        transition select(hdr.header_flags.template_id) {
            16w0x0: parse_simple_open_framing_header_message;
            16w0x100: parse_logon_request_message;
            16w0x6500: parse_logon_report_message;
            16w0xd00: parse_logout_request_message;
            16w0x7100: parse_logout_report_message;
            16w0x3300: parse_heart_beat_message;
            16w0x7200: parse_error_message;
            16w0x7400: parse_news_message;
            16w0x7000: parse_security_definition_report_strategy_message;
            16w0x7300: parse_security_definition_report_message;
            16w0x9b00: parse_security_definition_reject_message;
            16w0xf00: parse_security_definition_request_message;
            16w0x9a00: parse_security_definition_report_product_message;
            16w0xd107: parse_ip_request_message;
            16w0xd207: parse_ip_report_message;
            16w0x200: parse_trader_logon_request_message;
            16w0x6600: parse_trader_logon_report_message;
            16w0x300: parse_trader_logout_request_message;
            16w0x6700: parse_trader_logout_report_message;
            16w0x400: parse_new_order_request_message;
            16w0x500: parse_cancel_replace_request_message;
            16w0x600: parse_cancel_request_message;
            16w0x700: parse_quote_request_message;
            16w0x800: parse_new_order_cross_request_message;
            16w0x900: parse_order_mass_cancel_request_message;
            16w0xa00: parse_mass_quote_request_message;
            16w0xb00: parse_quote_cancel_request_message;
            16w0xc00: parse_security_definition_request_create_strategy_message;
            16w0xe00: parse_security_definition_request_create_flex_message;
            16w0x6800: parse_execution_report_new_message;
            16w0x6900: parse_execution_report_modify_message;
            16w0x6a00: parse_execution_report_cancel_message;
            16w0x9700: parse_execution_report_reject_message;
            16w0x9800: parse_execution_report_snapshot_message;
            16w0x9900: parse_execution_report_trade_message;
            16w0x6b00: parse_quote_report_message;
            16w0x6c00: parse_new_order_cross_report_message;
            16w0x6d00: parse_order_mass_cancel_report_message;
            16w0x6e00: parse_mass_quote_report_message;
            16w0x1000: parse_resend_request_message;
            16w0x7500: parse_resend_report_message;
            16w0x6f00: parse_sequence_reset_message;
            default: accept;
        }
    }

    state parse_simple_open_framing_header_message {
        packet.extract(hdr.simple_open_framing_header_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_request_message {
        packet.extract(hdr.logon_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_report_message {
        packet.extract(hdr.logon_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request_message {
        packet.extract(hdr.logout_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_report_message {
        packet.extract(hdr.logout_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heart_beat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_error_message {
        packet.extract(hdr.error_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_news_message {
        packet.extract(hdr.news_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_definition_report_strategy_message {
        packet.extract(hdr.security_definition_report_strategy_message);
        meta.dispatched = 1;
        meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_remaining = hdr.security_definition_report_strategy_message.num_in_group;
        transition select(meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_remaining) {
            16w0: read_security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group;
            default: parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group;
        }
    }

    state parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group {
        packet.extract(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group.next);
        meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_remaining = meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_remaining - 1;
        transition select(meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group_remaining) {
            16w0: read_security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group;
            default: parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group;
        }
    }

    state read_security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group {
        packet.extract(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_header);
        meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_remaining = hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_header.num_in_group;
        transition select(meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_remaining) {
            16w0: read_security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group;
            default: parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group;
        }
    }

    state parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group {
        packet.extract(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group.next);
        meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_remaining = meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_remaining - 1;
        transition select(meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_remaining) {
            16w0: read_security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group;
            default: parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group;
        }
    }

    state read_security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group {
        packet.extract(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_header);
        meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_remaining = hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_header.num_in_group;
        transition select(meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_remaining) {
            16w0: accept;
            default: parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group;
        }
    }

    state parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group {
        packet.extract(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group.next);
        meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_remaining = meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_remaining - 1;
        transition select(meta.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_remaining) {
            16w0: accept;
            default: parse_security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group;
        }
    }

    state parse_security_definition_report_message {
        packet.extract(hdr.security_definition_report_message);
        meta.dispatched = 1;
        meta.security_definition_report_message_security_definition_report_message_no_block_details_group_remaining = hdr.security_definition_report_message.num_in_group;
        transition select(meta.security_definition_report_message_security_definition_report_message_no_block_details_group_remaining) {
            16w0: read_security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group;
            default: parse_security_definition_report_message_security_definition_report_message_no_block_details_group;
        }
    }

    state parse_security_definition_report_message_security_definition_report_message_no_block_details_group {
        packet.extract(hdr.security_definition_report_message_security_definition_report_message_no_block_details_group.next);
        meta.security_definition_report_message_security_definition_report_message_no_block_details_group_remaining = meta.security_definition_report_message_security_definition_report_message_no_block_details_group_remaining - 1;
        transition select(meta.security_definition_report_message_security_definition_report_message_no_block_details_group_remaining) {
            16w0: read_security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group;
            default: parse_security_definition_report_message_security_definition_report_message_no_block_details_group;
        }
    }

    state read_security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group {
        packet.extract(hdr.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_header);
        meta.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_remaining = hdr.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_header.num_in_group;
        transition select(meta.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_remaining) {
            16w0: accept;
            default: parse_security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group;
        }
    }

    state parse_security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group {
        packet.extract(hdr.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group.next);
        meta.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_remaining = meta.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_remaining - 1;
        transition select(meta.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_remaining) {
            16w0: accept;
            default: parse_security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group;
        }
    }

    state parse_security_definition_reject_message {
        packet.extract(hdr.security_definition_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_definition_request_message {
        packet.extract(hdr.security_definition_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_definition_report_product_message {
        packet.extract(hdr.security_definition_report_product_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ip_request_message {
        packet.extract(hdr.ip_request_message);
        meta.dispatched = 1;
        meta.ip_request_message_i_p_request_message_no_users_group_remaining = hdr.ip_request_message.num_in_group;
        transition select(meta.ip_request_message_i_p_request_message_no_users_group_remaining) {
            16w0: accept;
            default: parse_ip_request_message_i_p_request_message_no_users_group;
        }
    }

    state parse_ip_request_message_i_p_request_message_no_users_group {
        packet.extract(hdr.ip_request_message_i_p_request_message_no_users_group.next);
        meta.ip_request_message_i_p_request_message_no_users_group_remaining = meta.ip_request_message_i_p_request_message_no_users_group_remaining - 1;
        transition select(meta.ip_request_message_i_p_request_message_no_users_group_remaining) {
            16w0: accept;
            default: parse_ip_request_message_i_p_request_message_no_users_group;
        }
    }

    state parse_ip_report_message {
        packet.extract(hdr.ip_report_message);
        meta.dispatched = 1;
        meta.ip_report_message_i_p_report_message_no_users_group_remaining = hdr.ip_report_message.num_in_group;
        transition select(meta.ip_report_message_i_p_report_message_no_users_group_remaining) {
            16w0: accept;
            default: parse_ip_report_message_i_p_report_message_no_users_group;
        }
    }

    state parse_ip_report_message_i_p_report_message_no_users_group {
        packet.extract(hdr.ip_report_message_i_p_report_message_no_users_group.next);
        meta.ip_report_message_i_p_report_message_no_users_group_remaining = meta.ip_report_message_i_p_report_message_no_users_group_remaining - 1;
        transition select(meta.ip_report_message_i_p_report_message_no_users_group_remaining) {
            16w0: accept;
            default: parse_ip_report_message_i_p_report_message_no_users_group;
        }
    }

    state parse_trader_logon_request_message {
        packet.extract(hdr.trader_logon_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trader_logon_report_message {
        packet.extract(hdr.trader_logon_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trader_logout_request_message {
        packet.extract(hdr.trader_logout_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trader_logout_report_message {
        packet.extract(hdr.trader_logout_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_request_message {
        packet.extract(hdr.new_order_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_replace_request_message {
        packet.extract(hdr.cancel_replace_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_request_message {
        packet.extract(hdr.cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_cross_request_message {
        packet.extract(hdr.new_order_cross_request_message);
        meta.dispatched = 1;
        meta.new_order_cross_request_message_new_order_cross_request_message_no_sides_group_remaining = hdr.new_order_cross_request_message.num_in_group;
        transition select(meta.new_order_cross_request_message_new_order_cross_request_message_no_sides_group_remaining) {
            16w0: read_new_order_cross_request_message_new_order_cross_request_message_no_legs_group;
            default: parse_new_order_cross_request_message_new_order_cross_request_message_no_sides_group;
        }
    }

    state parse_new_order_cross_request_message_new_order_cross_request_message_no_sides_group {
        packet.extract(hdr.new_order_cross_request_message_new_order_cross_request_message_no_sides_group.next);
        meta.new_order_cross_request_message_new_order_cross_request_message_no_sides_group_remaining = meta.new_order_cross_request_message_new_order_cross_request_message_no_sides_group_remaining - 1;
        transition select(meta.new_order_cross_request_message_new_order_cross_request_message_no_sides_group_remaining) {
            16w0: read_new_order_cross_request_message_new_order_cross_request_message_no_legs_group;
            default: parse_new_order_cross_request_message_new_order_cross_request_message_no_sides_group;
        }
    }

    state read_new_order_cross_request_message_new_order_cross_request_message_no_legs_group {
        packet.extract(hdr.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_header);
        meta.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_remaining = hdr.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_header.num_in_group;
        transition select(meta.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_remaining) {
            16w0: accept;
            default: parse_new_order_cross_request_message_new_order_cross_request_message_no_legs_group;
        }
    }

    state parse_new_order_cross_request_message_new_order_cross_request_message_no_legs_group {
        packet.extract(hdr.new_order_cross_request_message_new_order_cross_request_message_no_legs_group.next);
        meta.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_remaining = meta.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_remaining - 1;
        transition select(meta.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_remaining) {
            16w0: accept;
            default: parse_new_order_cross_request_message_new_order_cross_request_message_no_legs_group;
        }
    }

    state parse_order_mass_cancel_request_message {
        packet.extract(hdr.order_mass_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_request_message {
        packet.extract(hdr.mass_quote_request_message);
        meta.dispatched = 1;
        meta.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_remaining = hdr.mass_quote_request_message.num_in_group;
        transition select(meta.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_request_message_mass_quote_request_message_no_quote_sets_group;
        }
    }

    state parse_mass_quote_request_message_mass_quote_request_message_no_quote_sets_group {
        packet.extract(hdr.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group.next);
        meta.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_remaining = meta.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_remaining - 1;
        transition select(meta.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_request_message_mass_quote_request_message_no_quote_sets_group;
        }
    }

    state parse_quote_cancel_request_message {
        packet.extract(hdr.quote_cancel_request_message);
        meta.dispatched = 1;
        meta.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_remaining = hdr.quote_cancel_request_message.num_in_group;
        transition select(meta.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_remaining) {
            16w0: accept;
            default: parse_quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group;
        }
    }

    state parse_quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group {
        packet.extract(hdr.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group.next);
        meta.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_remaining = meta.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_remaining - 1;
        transition select(meta.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group_remaining) {
            16w0: accept;
            default: parse_quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group;
        }
    }

    state parse_security_definition_request_create_strategy_message {
        packet.extract(hdr.security_definition_request_create_strategy_message);
        meta.dispatched = 1;
        meta.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_remaining = hdr.security_definition_request_create_strategy_message.num_in_group;
        transition select(meta.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_remaining) {
            16w0: accept;
            default: parse_security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group;
        }
    }

    state parse_security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group {
        packet.extract(hdr.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group.next);
        meta.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_remaining = meta.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_remaining - 1;
        transition select(meta.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group_remaining) {
            16w0: accept;
            default: parse_security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group;
        }
    }

    state parse_security_definition_request_create_flex_message {
        packet.extract(hdr.security_definition_request_create_flex_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_new_message {
        packet.extract(hdr.execution_report_new_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_modify_message {
        packet.extract(hdr.execution_report_modify_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_cancel_message {
        packet.extract(hdr.execution_report_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_reject_message {
        packet.extract(hdr.execution_report_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_snapshot_message {
        packet.extract(hdr.execution_report_snapshot_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_trade_message {
        packet.extract(hdr.execution_report_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_report_message {
        packet.extract(hdr.quote_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_cross_report_message {
        packet.extract(hdr.new_order_cross_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_cancel_report_message {
        packet.extract(hdr.order_mass_cancel_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_report_message {
        packet.extract(hdr.mass_quote_report_message);
        meta.dispatched = 1;
        meta.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_remaining = hdr.mass_quote_report_message.num_in_group;
        transition select(meta.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_report_message_mass_quote_report_message_no_quote_sets_group;
        }
    }

    state parse_mass_quote_report_message_mass_quote_report_message_no_quote_sets_group {
        packet.extract(hdr.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group.next);
        meta.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_remaining = meta.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_remaining - 1;
        transition select(meta.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_report_message_mass_quote_report_message_no_quote_sets_group;
        }
    }

    state parse_resend_request_message {
        packet.extract(hdr.resend_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_resend_report_message {
        packet.extract(hdr.resend_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control IcefuturesBgwVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IcefuturesBgwIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IcefuturesBgwEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IcefuturesBgwComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IcefuturesBgwDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.header_flags);
        packet.emit(hdr.simple_open_framing_header_message);
        packet.emit(hdr.logon_request_message);
        packet.emit(hdr.logon_report_message);
        packet.emit(hdr.logout_request_message);
        packet.emit(hdr.logout_report_message);
        packet.emit(hdr.error_message);
        packet.emit(hdr.news_message);
        packet.emit(hdr.security_definition_report_strategy_message);
        packet.emit(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_block_details_group);
        packet.emit(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group_header);
        packet.emit(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_security_alt_i_d_group);
        packet.emit(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group_header);
        packet.emit(hdr.security_definition_report_strategy_message_security_definition_report_strategy_message_no_legs_group);
        packet.emit(hdr.security_definition_report_message);
        packet.emit(hdr.security_definition_report_message_security_definition_report_message_no_block_details_group);
        packet.emit(hdr.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group_header);
        packet.emit(hdr.security_definition_report_message_security_definition_report_message_no_security_alt_i_d_group);
        packet.emit(hdr.security_definition_reject_message);
        packet.emit(hdr.security_definition_request_message);
        packet.emit(hdr.security_definition_report_product_message);
        packet.emit(hdr.ip_request_message);
        packet.emit(hdr.ip_request_message_i_p_request_message_no_users_group);
        packet.emit(hdr.ip_report_message);
        packet.emit(hdr.ip_report_message_i_p_report_message_no_users_group);
        packet.emit(hdr.trader_logon_request_message);
        packet.emit(hdr.trader_logon_report_message);
        packet.emit(hdr.trader_logout_request_message);
        packet.emit(hdr.trader_logout_report_message);
        packet.emit(hdr.new_order_request_message);
        packet.emit(hdr.cancel_replace_request_message);
        packet.emit(hdr.cancel_request_message);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.new_order_cross_request_message);
        packet.emit(hdr.new_order_cross_request_message_new_order_cross_request_message_no_sides_group);
        packet.emit(hdr.new_order_cross_request_message_new_order_cross_request_message_no_legs_group_header);
        packet.emit(hdr.new_order_cross_request_message_new_order_cross_request_message_no_legs_group);
        packet.emit(hdr.order_mass_cancel_request_message);
        packet.emit(hdr.mass_quote_request_message);
        packet.emit(hdr.mass_quote_request_message_mass_quote_request_message_no_quote_sets_group);
        packet.emit(hdr.quote_cancel_request_message);
        packet.emit(hdr.quote_cancel_request_message_quote_cancel_request_message_no_quote_entries_group);
        packet.emit(hdr.security_definition_request_create_strategy_message);
        packet.emit(hdr.security_definition_request_create_strategy_message_security_definition_request_create_strategy_message_no_legs_group);
        packet.emit(hdr.security_definition_request_create_flex_message);
        packet.emit(hdr.execution_report_new_message);
        packet.emit(hdr.execution_report_modify_message);
        packet.emit(hdr.execution_report_cancel_message);
        packet.emit(hdr.execution_report_reject_message);
        packet.emit(hdr.execution_report_snapshot_message);
        packet.emit(hdr.execution_report_trade_message);
        packet.emit(hdr.quote_report_message);
        packet.emit(hdr.new_order_cross_report_message);
        packet.emit(hdr.order_mass_cancel_report_message);
        packet.emit(hdr.mass_quote_report_message);
        packet.emit(hdr.mass_quote_report_message_mass_quote_report_message_no_quote_sets_group);
        packet.emit(hdr.resend_request_message);
        packet.emit(hdr.resend_report_message);
        packet.emit(hdr.sequence_reset_message);
    }
}

V1Switch(
    IcefuturesBgwParser(),
    IcefuturesBgwVerifyChecksum(),
    IcefuturesBgwIngress(),
    IcefuturesBgwEgress(),
    IcefuturesBgwComputeChecksum(),
    IcefuturesBgwDeparser()
) main;
