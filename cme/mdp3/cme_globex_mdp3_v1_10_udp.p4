// P4_16 (v1model) definition for: Cme Globex Mdp3 Sbe v1.10
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Market Data Platform 3
//   Encoding: Simple Binary Encoding
//   Version: 1.10
//   Date: 7/26/2019
//   Specification: Unknown
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

header binary_packet_header_t {
    bit<32> packet_sequence_number;
    bit<64> sending_time;
    bit<16> message_size;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header channel_reset_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> block_length;
    bit<8> num_in_group;
}

header channel_reset_channel_reset_group_t {
    bit<16> appl_id;
}

header admin_login_t {
    bit<8> heart_bt_int;
}

header admin_logout_t {
    bit<800> text;
}

header security_status_t {
    bit<64> transact_time;
    bit<48> security_group;
    bit<48> asset;
    bit<32> security_id_optional;
    bit<16> trade_date;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<8> security_trading_status;
    bit<8> halt_reason;
    bit<8> security_trading_event;
}

header md_incremental_refresh_volume_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_volume_incremental_refresh_volume_group_t {
    bit<32> md_entry_size_short;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<8> md_update_action;
    bit<24> padding_3;
}

header quote_request_t {
    bit<64> transact_time;
    bit<184> quote_req_id;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<24> padding_3;
    bit<16> block_length;
    bit<8> num_in_group;
}

header quote_request_related_sym_group_t {
    bit<160> symbol;
    bit<32> security_id;
    bit<32> order_qty;
    bit<8> quote_type;
    bit<8> side_optional;
    bit<16> padding_2;
}

header md_incremental_refresh_book_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_book_incremental_refresh_book_group_t {
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level;
    bit<8> md_update_action;
    bit<8> md_entry_type_book;
    bit<32> tradeable_size;
    bit<8> padding_1;
}

header md_incremental_refresh_book_incremental_refresh_book_order_id_group_header_t {
    bit<16> block_length;
    bit<40> padding_5;
    bit<8> num_in_group;
}

header md_incremental_refresh_book_incremental_refresh_book_order_id_group_t {
    bit<64> order_id;
    bit<64> md_order_priority_optional;
    bit<32> md_display_qty_optional;
    bit<8> reference_id;
    bit<8> order_update_action;
    bit<16> padding_2;
}

header md_incremental_refresh_order_book_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_order_book_incremental_refresh_order_book_group_t {
    bit<64> order_id_optional;
    bit<64> md_order_priority_optional;
    bit<64> md_entry_px_optional_ex;
    bit<32> md_display_qty_optional;
    bit<32> security_id;
    bit<8> md_update_action;
    bit<8> md_entry_type_book;
    bit<48> padding_6;
}

header md_incremental_refresh_trade_summary_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_t {
    bit<64> md_entry_px_ex;
    bit<32> md_entry_size_short;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<32> number_of_orders;
    bit<8> aggressor_side;
    bit<8> md_update_action;
    bit<32> md_trade_entry_id;
    bit<16> padding_2;
}

header md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_header_t {
    bit<16> block_length;
    bit<40> padding_5;
    bit<8> num_in_group;
}

header md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_t {
    bit<64> order_id;
    bit<32> last_qty;
    bit<32> padding_4;
}

header md_incremental_refresh_daily_statistics_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_t {
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<16> trading_reference_date;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> reserved_bits;
    bit<1> intraday;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final_daily;
    bit<8> md_update_action;
    bit<8> md_entry_type_daily_statistics;
    bit<56> padding_7;
}

header md_incremental_refresh_limits_banding_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_t {
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<32> security_id;
    bit<32> rpt_seq;
}

header md_incremental_refresh_session_statistics_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_t {
    bit<64> md_entry_px_ex;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<8> open_close_settl_flag;
    bit<8> md_update_action;
    bit<8> md_entry_type_statistics;
    bit<32> md_entry_size_short_optional;
    bit<8> padding_1;
}

header snapshot_full_refresh_t {
    bit<32> last_msg_seq_num_processed;
    bit<32> tot_num_reports;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<64> transact_time;
    bit<64> last_update_time;
    bit<16> trade_date;
    bit<8> md_security_trading_status;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<16> block_length;
    bit<8> num_in_group;
}

header snapshot_full_refresh_snapshot_full_refresh_group_t {
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level_optional;
    bit<16> trading_reference_date;
    bit<8> open_close_settl_flag;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> reserved_bits;
    bit<1> intraday;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final_daily;
    bit<8> md_entry_type;
}

header snapshot_full_refresh_order_book_t {
    bit<32> last_msg_seq_num_processed;
    bit<32> tot_num_reports;
    bit<32> security_id;
    bit<32> no_chunks;
    bit<32> current_chunk;
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
}

header snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_t {
    bit<64> order_id;
    bit<64> md_order_priority_optional;
    bit<64> md_entry_px_ex;
    bit<32> md_display_qty;
    bit<8> md_entry_type_book;
}

header md_instrument_definition_future_t {
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> tot_num_reports_optional;
    bit<8> security_update_action;
    bit<64> last_update_time;
    bit<8> md_security_trading_status;
    bit<16> appl_id;
    bit<8> market_segment_id;
    bit<8> underlying_product;
    bit<32> security_exchange;
    bit<48> security_group;
    bit<48> asset;
    bit<160> symbol;
    bit<32> security_id;
    bit<48> security_type;
    bit<48> cfi_code;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<24> currency;
    bit<24> settl_currency;
    bit<8> match_algorithm;
    bit<32> min_trade_vol;
    bit<32> max_trade_vol;
    bit<64> min_price_increment;
    bit<64> display_factor;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<8> price_display_format;
    bit<240> unit_of_measure;
    bit<64> unit_of_measure_qty;
    bit<64> trading_reference_price;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> reserved_bits;
    bit<1> intraday;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final_daily;
    bit<32> open_interest_qty;
    bit<32> cleared_volume;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<32> decay_quantity;
    bit<16> decay_start_date;
    bit<32> original_contract_size;
    bit<32> contract_multiplier;
    bit<8> contract_multiplier_unit;
    bit<8> flow_schedule_type;
    bit<64> min_price_increment_amount;
    bit<8> user_defined_instrument;
    bit<16> trading_reference_date;
    bit<64> instrument_guid;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_future_events_group_t {
    bit<8> event_type;
    bit<64> event_time;
}

header md_instrument_definition_future_feed_types_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_future_feed_types_group_t {
    bit<24> md_feed_type;
    bit<8> market_depth;
}

header md_instrument_definition_future_inst_attrib_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_future_inst_attrib_group_t {
    bit<8> reserved_8;
    bit<1> is_aon_instrument;
    bit<1> inverted_book;
    bit<1> variable_cab_eligible;
    bit<1> triangulation_eligible;
    bit<1> implied_matching_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> decaying_product_eligibility;
    bit<1> zero_price_outright_eligible;
    bit<1> rfq_cross_eligible;
    bit<1> volatility_quoted_option;
    bit<1> is_fractional;
    bit<1> negative_price_outright_eligible;
    bit<1> negative_strike_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> otc_eligible;
    bit<1> efr_eligible;
    bit<1> efs_eligible;
    bit<1> ebf_eligible;
    bit<1> efp_eligible;
    bit<1> block_trade_eligible;
    bit<1> order_cross_eligible;
    bit<1> electronic_match_eligible;
}

header md_instrument_definition_future_lot_type_rules_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_future_lot_type_rules_group_t {
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_option_t {
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> tot_num_reports_optional;
    bit<8> security_update_action;
    bit<64> last_update_time;
    bit<8> md_security_trading_status;
    bit<16> appl_id;
    bit<8> market_segment_id;
    bit<8> underlying_product;
    bit<32> security_exchange;
    bit<48> security_group;
    bit<48> asset;
    bit<160> symbol;
    bit<32> security_id;
    bit<48> security_type;
    bit<48> cfi_code;
    bit<8> put_or_call;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<24> currency;
    bit<64> strike_price;
    bit<24> strike_currency;
    bit<24> settl_currency;
    bit<64> min_cab_price;
    bit<8> match_algorithm;
    bit<32> min_trade_vol;
    bit<32> max_trade_vol;
    bit<64> min_price_increment_optional;
    bit<64> min_price_increment_amount;
    bit<64> display_factor;
    bit<8> tick_rule;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<8> price_display_format;
    bit<240> unit_of_measure;
    bit<64> unit_of_measure_qty;
    bit<64> trading_reference_price;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> reserved_bits;
    bit<1> intraday;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final_daily;
    bit<32> cleared_volume;
    bit<32> open_interest_qty;
    bit<64> low_limit_price;
    bit<64> high_limit_price;
    bit<8> user_defined_instrument;
    bit<16> trading_reference_date;
    bit<64> instrument_guid;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_option_events_group_t {
    bit<8> event_type;
    bit<64> event_time;
}

header md_instrument_definition_option_feed_types_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_option_feed_types_group_t {
    bit<24> md_feed_type;
    bit<8> market_depth;
}

header md_instrument_definition_option_inst_attrib_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_option_inst_attrib_group_t {
    bit<8> reserved_8;
    bit<1> is_aon_instrument;
    bit<1> inverted_book;
    bit<1> variable_cab_eligible;
    bit<1> triangulation_eligible;
    bit<1> implied_matching_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> decaying_product_eligibility;
    bit<1> zero_price_outright_eligible;
    bit<1> rfq_cross_eligible;
    bit<1> volatility_quoted_option;
    bit<1> is_fractional;
    bit<1> negative_price_outright_eligible;
    bit<1> negative_strike_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> otc_eligible;
    bit<1> efr_eligible;
    bit<1> efs_eligible;
    bit<1> ebf_eligible;
    bit<1> efp_eligible;
    bit<1> block_trade_eligible;
    bit<1> order_cross_eligible;
    bit<1> electronic_match_eligible;
}

header md_instrument_definition_option_lot_type_rules_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_option_lot_type_rules_group_t {
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_option_option_underlyings_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_option_option_underlyings_group_t {
    bit<32> underlying_security_id;
    bit<160> underlying_symbol;
}

header md_instrument_definition_option_option_related_instruments_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_option_option_related_instruments_group_t {
    bit<32> related_security_id;
    bit<160> related_symbol;
}

header md_instrument_definition_spread_t {
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> tot_num_reports_optional;
    bit<8> security_update_action;
    bit<64> last_update_time;
    bit<8> md_security_trading_status;
    bit<16> appl_id;
    bit<8> market_segment_id;
    bit<8> underlying_product_optional;
    bit<32> security_exchange;
    bit<48> security_group;
    bit<48> asset;
    bit<160> symbol;
    bit<32> security_id;
    bit<48> security_type;
    bit<48> cfi_code;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<24> currency;
    bit<40> security_sub_type;
    bit<8> user_defined_instrument;
    bit<8> match_algorithm;
    bit<32> min_trade_vol;
    bit<32> max_trade_vol;
    bit<64> min_price_increment_optional;
    bit<64> display_factor;
    bit<8> price_display_format;
    bit<64> price_ratio;
    bit<8> tick_rule;
    bit<240> unit_of_measure;
    bit<64> trading_reference_price;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> reserved_bits;
    bit<1> intraday;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final_daily;
    bit<32> open_interest_qty;
    bit<32> cleared_volume;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<16> trading_reference_date;
    bit<40> price_quote_method;
    bit<48> risk_set;
    bit<48> market_set;
    bit<64> instrument_guid;
    bit<280> financial_instrument_full_name;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_spread_events_group_t {
    bit<8> event_type;
    bit<64> event_time;
}

header md_instrument_definition_spread_feed_types_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_spread_feed_types_group_t {
    bit<24> md_feed_type;
    bit<8> market_depth;
}

header md_instrument_definition_spread_inst_attrib_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_spread_inst_attrib_group_t {
    bit<8> reserved_8;
    bit<1> is_aon_instrument;
    bit<1> inverted_book;
    bit<1> variable_cab_eligible;
    bit<1> triangulation_eligible;
    bit<1> implied_matching_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> decaying_product_eligibility;
    bit<1> zero_price_outright_eligible;
    bit<1> rfq_cross_eligible;
    bit<1> volatility_quoted_option;
    bit<1> is_fractional;
    bit<1> negative_price_outright_eligible;
    bit<1> negative_strike_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> otc_eligible;
    bit<1> efr_eligible;
    bit<1> efs_eligible;
    bit<1> ebf_eligible;
    bit<1> efp_eligible;
    bit<1> block_trade_eligible;
    bit<1> order_cross_eligible;
    bit<1> electronic_match_eligible;
}

header md_instrument_definition_spread_lot_type_rules_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_spread_lot_type_rules_group_t {
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_spread_legs_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_spread_legs_group_t {
    bit<32> leg_security_id;
    bit<8> leg_side;
    bit<8> leg_ratio_qty;
    bit<64> leg_price;
    bit<32> leg_option_delta;
}

header md_instrument_definition_fixed_income_t {
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> tot_num_reports_optional;
    bit<8> security_update_action;
    bit<64> last_update_time;
    bit<8> md_security_trading_status;
    bit<16> appl_id;
    bit<8> market_segment_id;
    bit<8> underlying_product;
    bit<32> security_exchange;
    bit<48> security_group;
    bit<48> asset;
    bit<160> symbol;
    bit<32> security_id;
    bit<48> security_type;
    bit<48> cfi_code;
    bit<24> currency;
    bit<24> settl_currency;
    bit<8> match_algorithm;
    bit<32> min_trade_vol;
    bit<32> max_trade_vol;
    bit<64> min_price_increment_optional;
    bit<64> display_factor;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<8> price_display_format;
    bit<240> unit_of_measure;
    bit<64> unit_of_measure_qty;
    bit<64> trading_reference_price;
    bit<16> trading_reference_date;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<64> min_price_increment_amount;
    bit<16> issue_date;
    bit<16> dated_date;
    bit<16> maturity_date;
    bit<64> coupon_rate;
    bit<64> par_value;
    bit<24> coupon_frequency_unit;
    bit<16> coupon_frequency_period;
    bit<160> coupon_day_count;
    bit<16> country_of_issue;
    bit<200> issuer;
    bit<280> financial_instrument_full_name;
    bit<96> security_alt_id;
    bit<8> security_alt_id_source;
    bit<40> price_quote_method;
    bit<40> party_role_clearing_org;
    bit<8> user_defined_instrument;
    bit<48> risk_set;
    bit<48> market_set;
    bit<64> instrument_guid;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_fixed_income_events_group_t {
    bit<8> event_type;
    bit<64> event_time;
}

header md_instrument_definition_fixed_income_feed_types_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_fixed_income_feed_types_group_t {
    bit<24> md_feed_type;
    bit<8> market_depth;
}

header md_instrument_definition_fixed_income_inst_attrib_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_fixed_income_inst_attrib_group_t {
    bit<8> reserved_8;
    bit<1> is_aon_instrument;
    bit<1> inverted_book;
    bit<1> variable_cab_eligible;
    bit<1> triangulation_eligible;
    bit<1> implied_matching_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> decaying_product_eligibility;
    bit<1> zero_price_outright_eligible;
    bit<1> rfq_cross_eligible;
    bit<1> volatility_quoted_option;
    bit<1> is_fractional;
    bit<1> negative_price_outright_eligible;
    bit<1> negative_strike_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> otc_eligible;
    bit<1> efr_eligible;
    bit<1> efs_eligible;
    bit<1> ebf_eligible;
    bit<1> efp_eligible;
    bit<1> block_trade_eligible;
    bit<1> order_cross_eligible;
    bit<1> electronic_match_eligible;
}

header md_instrument_definition_fixed_income_lot_type_rules_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_fixed_income_lot_type_rules_group_t {
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_repo_t {
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> tot_num_reports_optional;
    bit<8> security_update_action;
    bit<64> last_update_time;
    bit<8> md_security_trading_status;
    bit<16> appl_id;
    bit<8> market_segment_id;
    bit<8> underlying_product;
    bit<32> security_exchange;
    bit<48> security_group;
    bit<48> asset;
    bit<160> symbol;
    bit<32> security_id;
    bit<48> security_type;
    bit<48> cfi_code;
    bit<24> currency;
    bit<24> settl_currency;
    bit<8> match_algorithm;
    bit<32> min_trade_vol;
    bit<32> max_trade_vol;
    bit<64> min_price_increment;
    bit<64> display_factor;
    bit<240> unit_of_measure;
    bit<64> unit_of_measure_qty;
    bit<64> trading_reference_price;
    bit<16> trading_reference_date;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<280> financial_instrument_full_name;
    bit<40> party_role_clearing_org;
    bit<16> start_date;
    bit<16> end_date;
    bit<64> termination_type;
    bit<8> repo_sub_type;
    bit<8> money_or_par;
    bit<8> max_no_of_substitutions;
    bit<40> price_quote_method;
    bit<8> user_defined_instrument;
    bit<48> risk_set;
    bit<48> market_set;
    bit<64> instrument_guid;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_repo_events_group_t {
    bit<8> event_type;
    bit<64> event_time;
}

header md_instrument_definition_repo_feed_types_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_repo_feed_types_group_t {
    bit<24> md_feed_type;
    bit<8> market_depth;
}

header md_instrument_definition_repo_inst_attrib_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_repo_inst_attrib_group_t {
    bit<8> reserved_8;
    bit<1> is_aon_instrument;
    bit<1> inverted_book;
    bit<1> variable_cab_eligible;
    bit<1> triangulation_eligible;
    bit<1> implied_matching_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> decaying_product_eligibility;
    bit<1> zero_price_outright_eligible;
    bit<1> rfq_cross_eligible;
    bit<1> volatility_quoted_option;
    bit<1> is_fractional;
    bit<1> negative_price_outright_eligible;
    bit<1> negative_strike_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> otc_eligible;
    bit<1> efr_eligible;
    bit<1> efs_eligible;
    bit<1> ebf_eligible;
    bit<1> efp_eligible;
    bit<1> block_trade_eligible;
    bit<1> order_cross_eligible;
    bit<1> electronic_match_eligible;
}

header md_instrument_definition_repo_lot_type_rules_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_repo_lot_type_rules_group_t {
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_repo_repo_underlyings_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_repo_repo_underlyings_group_t {
    bit<160> underlying_symbol;
    bit<32> underlying_security_id_optional;
    bit<96> underlying_security_alt_id;
    bit<8> underlying_security_alt_id_source;
    bit<280> underlying_financial_instrument_full_name;
    bit<48> underlying_security_type;
    bit<16> underlying_country_of_issue;
    bit<200> underlying_issuer;
    bit<8> underlying_max_life_time;
    bit<16> underlying_min_days_to_maturity;
}

header md_instrument_definition_repo_repo_related_instruments_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_instrument_definition_repo_repo_related_instruments_group_t {
    bit<32> related_security_id;
    bit<160> related_symbol;
    bit<64> related_instrument_guid;
}

header snapshot_refresh_top_orders_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
}

header snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_t {
    bit<64> order_id;
    bit<64> md_order_priority;
    bit<64> md_entry_px_ex;
    bit<32> md_display_qty;
    bit<8> md_entry_type_book;
}

header security_status_workup_t {
    bit<64> transact_time;
    bit<64> md_entry_px_optional_ex;
    bit<32> security_id;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> trade_date;
    bit<32> trade_link_id;
    bit<8> workup_trading_status;
    bit<8> halt_reason;
    bit<8> security_trading_event;
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_status_workup_security_status_workup_group_t {
    bit<64> order_id;
    bit<8> side;
    bit<8> aggressor_indicator;
}

header snapshot_full_refresh_tcp_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<32> security_id;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<16> block_length;
    bit<8> num_in_group;
}

header snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_t {
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> tradeable_size;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level_optional;
    bit<8> open_close_settl_flag;
    bit<8> md_entry_type;
    bit<16> trading_reference_date;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> reserved_bits;
    bit<1> intraday;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final_daily;
}

header negotiate_t {
    bit<256> hmac_signature;
    bit<160> access_key_id;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<40> session;
    bit<40> firm;
}

header negotiation_reject_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<8> error_codes;
    bit<40> padding_5;
}

header negotiation_response_t {
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<16> secret_key_secure_id_expiration;
    bit<32> padding_4;
}

header terminate_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<8> error_codes;
    bit<40> padding_5;
}

header market_data_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header market_data_request_market_data_request_security_group_t {
    bit<48> security_group;
}

header market_data_request_market_data_request_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header market_data_request_market_data_request_related_symbol_group_t {
    bit<32> security_id;
}

header request_ack_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<8> md_req_id_status;
    bit<16> block_length;
    bit<8> num_in_group;
}

header request_ack_request_ack_security_group_t {
    bit<48> security_group;
}

header request_ack_request_ack_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header request_ack_request_ack_related_symbol_group_t {
    bit<32> security_id;
}

header request_reject_t {
    bit<32> md_req_id_optional;
    bit<8> md_req_rej_reason;
    bit<800> text;
}

header security_list_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_list_request_security_list_request_security_group_t {
    bit<48> security_group;
}

header security_list_request_security_list_request_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_list_request_security_list_request_related_symbol_group_t {
    bit<32> security_id;
}

header security_status_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_status_request_security_status_request_security_group_t {
    bit<48> security_group;
}

header security_status_request_security_status_request_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_status_request_security_status_request_related_symbol_group_t {
    bit<32> security_id;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> channel_reset_channel_reset_group_remaining;
    bit<8> md_incremental_refresh_volume_incremental_refresh_volume_group_remaining;
    bit<8> quote_request_related_sym_group_remaining;
    bit<8> md_incremental_refresh_book_incremental_refresh_book_group_remaining;
    bit<8> md_incremental_refresh_book_incremental_refresh_book_order_id_group_remaining;
    bit<8> md_incremental_refresh_order_book_incremental_refresh_order_book_group_remaining;
    bit<8> md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_remaining;
    bit<8> md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_remaining;
    bit<8> md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_remaining;
    bit<8> md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_remaining;
    bit<8> md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_remaining;
    bit<8> snapshot_full_refresh_snapshot_full_refresh_group_remaining;
    bit<8> snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_remaining;
    bit<8> md_instrument_definition_future_events_group_remaining;
    bit<8> md_instrument_definition_future_feed_types_group_remaining;
    bit<8> md_instrument_definition_future_inst_attrib_group_remaining;
    bit<8> md_instrument_definition_future_lot_type_rules_group_remaining;
    bit<8> md_instrument_definition_option_events_group_remaining;
    bit<8> md_instrument_definition_option_feed_types_group_remaining;
    bit<8> md_instrument_definition_option_inst_attrib_group_remaining;
    bit<8> md_instrument_definition_option_lot_type_rules_group_remaining;
    bit<8> md_instrument_definition_option_option_underlyings_group_remaining;
    bit<8> md_instrument_definition_option_option_related_instruments_group_remaining;
    bit<8> md_instrument_definition_spread_events_group_remaining;
    bit<8> md_instrument_definition_spread_feed_types_group_remaining;
    bit<8> md_instrument_definition_spread_inst_attrib_group_remaining;
    bit<8> md_instrument_definition_spread_lot_type_rules_group_remaining;
    bit<8> md_instrument_definition_spread_legs_group_remaining;
    bit<8> md_instrument_definition_fixed_income_events_group_remaining;
    bit<8> md_instrument_definition_fixed_income_feed_types_group_remaining;
    bit<8> md_instrument_definition_fixed_income_inst_attrib_group_remaining;
    bit<8> md_instrument_definition_fixed_income_lot_type_rules_group_remaining;
    bit<8> md_instrument_definition_repo_events_group_remaining;
    bit<8> md_instrument_definition_repo_feed_types_group_remaining;
    bit<8> md_instrument_definition_repo_inst_attrib_group_remaining;
    bit<8> md_instrument_definition_repo_lot_type_rules_group_remaining;
    bit<8> md_instrument_definition_repo_repo_underlyings_group_remaining;
    bit<8> md_instrument_definition_repo_repo_related_instruments_group_remaining;
    bit<8> snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_remaining;
    bit<8> security_status_workup_security_status_workup_group_remaining;
    bit<8> snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_remaining;
    bit<8> market_data_request_market_data_request_security_group_remaining;
    bit<8> market_data_request_market_data_request_related_symbol_group_remaining;
    bit<8> request_ack_request_ack_security_group_remaining;
    bit<8> request_ack_request_ack_related_symbol_group_remaining;
    bit<8> security_list_request_security_list_request_security_group_remaining;
    bit<8> security_list_request_security_list_request_related_symbol_group_remaining;
    bit<8> security_status_request_security_status_request_security_group_remaining;
    bit<8> security_status_request_security_status_request_related_symbol_group_remaining;
}

struct headers_t {
    binary_packet_header_t binary_packet_header;
    channel_reset_t channel_reset;
    channel_reset_channel_reset_group_t channel_reset_channel_reset_group[MAX_MESSAGES];
    admin_login_t admin_login;
    admin_logout_t admin_logout;
    security_status_t security_status;
    md_incremental_refresh_volume_t md_incremental_refresh_volume;
    md_incremental_refresh_volume_incremental_refresh_volume_group_t md_incremental_refresh_volume_incremental_refresh_volume_group[MAX_MESSAGES];
    quote_request_t quote_request;
    quote_request_related_sym_group_t quote_request_related_sym_group[MAX_MESSAGES];
    md_incremental_refresh_book_t md_incremental_refresh_book;
    md_incremental_refresh_book_incremental_refresh_book_group_t md_incremental_refresh_book_incremental_refresh_book_group[MAX_MESSAGES];
    md_incremental_refresh_book_incremental_refresh_book_order_id_group_header_t md_incremental_refresh_book_incremental_refresh_book_order_id_group_header;
    md_incremental_refresh_book_incremental_refresh_book_order_id_group_t md_incremental_refresh_book_incremental_refresh_book_order_id_group[MAX_MESSAGES];
    md_incremental_refresh_order_book_t md_incremental_refresh_order_book;
    md_incremental_refresh_order_book_incremental_refresh_order_book_group_t md_incremental_refresh_order_book_incremental_refresh_order_book_group[MAX_MESSAGES];
    md_incremental_refresh_trade_summary_t md_incremental_refresh_trade_summary;
    md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_t md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group[MAX_MESSAGES];
    md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_header_t md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_header;
    md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_t md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group[MAX_MESSAGES];
    md_incremental_refresh_daily_statistics_t md_incremental_refresh_daily_statistics;
    md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_t md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group[MAX_MESSAGES];
    md_incremental_refresh_limits_banding_t md_incremental_refresh_limits_banding;
    md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_t md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group[MAX_MESSAGES];
    md_incremental_refresh_session_statistics_t md_incremental_refresh_session_statistics;
    md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_t md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group[MAX_MESSAGES];
    snapshot_full_refresh_t snapshot_full_refresh;
    snapshot_full_refresh_snapshot_full_refresh_group_t snapshot_full_refresh_snapshot_full_refresh_group[MAX_MESSAGES];
    snapshot_full_refresh_order_book_t snapshot_full_refresh_order_book;
    snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_t snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group[MAX_MESSAGES];
    md_instrument_definition_future_t md_instrument_definition_future;
    md_instrument_definition_future_events_group_t md_instrument_definition_future_events_group[MAX_MESSAGES];
    md_instrument_definition_future_feed_types_group_header_t md_instrument_definition_future_feed_types_group_header;
    md_instrument_definition_future_feed_types_group_t md_instrument_definition_future_feed_types_group[MAX_MESSAGES];
    md_instrument_definition_future_inst_attrib_group_header_t md_instrument_definition_future_inst_attrib_group_header;
    md_instrument_definition_future_inst_attrib_group_t md_instrument_definition_future_inst_attrib_group[MAX_MESSAGES];
    md_instrument_definition_future_lot_type_rules_group_header_t md_instrument_definition_future_lot_type_rules_group_header;
    md_instrument_definition_future_lot_type_rules_group_t md_instrument_definition_future_lot_type_rules_group[MAX_MESSAGES];
    md_instrument_definition_option_t md_instrument_definition_option;
    md_instrument_definition_option_events_group_t md_instrument_definition_option_events_group[MAX_MESSAGES];
    md_instrument_definition_option_feed_types_group_header_t md_instrument_definition_option_feed_types_group_header;
    md_instrument_definition_option_feed_types_group_t md_instrument_definition_option_feed_types_group[MAX_MESSAGES];
    md_instrument_definition_option_inst_attrib_group_header_t md_instrument_definition_option_inst_attrib_group_header;
    md_instrument_definition_option_inst_attrib_group_t md_instrument_definition_option_inst_attrib_group[MAX_MESSAGES];
    md_instrument_definition_option_lot_type_rules_group_header_t md_instrument_definition_option_lot_type_rules_group_header;
    md_instrument_definition_option_lot_type_rules_group_t md_instrument_definition_option_lot_type_rules_group[MAX_MESSAGES];
    md_instrument_definition_option_option_underlyings_group_header_t md_instrument_definition_option_option_underlyings_group_header;
    md_instrument_definition_option_option_underlyings_group_t md_instrument_definition_option_option_underlyings_group[MAX_MESSAGES];
    md_instrument_definition_option_option_related_instruments_group_header_t md_instrument_definition_option_option_related_instruments_group_header;
    md_instrument_definition_option_option_related_instruments_group_t md_instrument_definition_option_option_related_instruments_group[MAX_MESSAGES];
    md_instrument_definition_spread_t md_instrument_definition_spread;
    md_instrument_definition_spread_events_group_t md_instrument_definition_spread_events_group[MAX_MESSAGES];
    md_instrument_definition_spread_feed_types_group_header_t md_instrument_definition_spread_feed_types_group_header;
    md_instrument_definition_spread_feed_types_group_t md_instrument_definition_spread_feed_types_group[MAX_MESSAGES];
    md_instrument_definition_spread_inst_attrib_group_header_t md_instrument_definition_spread_inst_attrib_group_header;
    md_instrument_definition_spread_inst_attrib_group_t md_instrument_definition_spread_inst_attrib_group[MAX_MESSAGES];
    md_instrument_definition_spread_lot_type_rules_group_header_t md_instrument_definition_spread_lot_type_rules_group_header;
    md_instrument_definition_spread_lot_type_rules_group_t md_instrument_definition_spread_lot_type_rules_group[MAX_MESSAGES];
    md_instrument_definition_spread_legs_group_header_t md_instrument_definition_spread_legs_group_header;
    md_instrument_definition_spread_legs_group_t md_instrument_definition_spread_legs_group[MAX_MESSAGES];
    md_instrument_definition_fixed_income_t md_instrument_definition_fixed_income;
    md_instrument_definition_fixed_income_events_group_t md_instrument_definition_fixed_income_events_group[MAX_MESSAGES];
    md_instrument_definition_fixed_income_feed_types_group_header_t md_instrument_definition_fixed_income_feed_types_group_header;
    md_instrument_definition_fixed_income_feed_types_group_t md_instrument_definition_fixed_income_feed_types_group[MAX_MESSAGES];
    md_instrument_definition_fixed_income_inst_attrib_group_header_t md_instrument_definition_fixed_income_inst_attrib_group_header;
    md_instrument_definition_fixed_income_inst_attrib_group_t md_instrument_definition_fixed_income_inst_attrib_group[MAX_MESSAGES];
    md_instrument_definition_fixed_income_lot_type_rules_group_header_t md_instrument_definition_fixed_income_lot_type_rules_group_header;
    md_instrument_definition_fixed_income_lot_type_rules_group_t md_instrument_definition_fixed_income_lot_type_rules_group[MAX_MESSAGES];
    md_instrument_definition_repo_t md_instrument_definition_repo;
    md_instrument_definition_repo_events_group_t md_instrument_definition_repo_events_group[MAX_MESSAGES];
    md_instrument_definition_repo_feed_types_group_header_t md_instrument_definition_repo_feed_types_group_header;
    md_instrument_definition_repo_feed_types_group_t md_instrument_definition_repo_feed_types_group[MAX_MESSAGES];
    md_instrument_definition_repo_inst_attrib_group_header_t md_instrument_definition_repo_inst_attrib_group_header;
    md_instrument_definition_repo_inst_attrib_group_t md_instrument_definition_repo_inst_attrib_group[MAX_MESSAGES];
    md_instrument_definition_repo_lot_type_rules_group_header_t md_instrument_definition_repo_lot_type_rules_group_header;
    md_instrument_definition_repo_lot_type_rules_group_t md_instrument_definition_repo_lot_type_rules_group[MAX_MESSAGES];
    md_instrument_definition_repo_repo_underlyings_group_header_t md_instrument_definition_repo_repo_underlyings_group_header;
    md_instrument_definition_repo_repo_underlyings_group_t md_instrument_definition_repo_repo_underlyings_group[MAX_MESSAGES];
    md_instrument_definition_repo_repo_related_instruments_group_header_t md_instrument_definition_repo_repo_related_instruments_group_header;
    md_instrument_definition_repo_repo_related_instruments_group_t md_instrument_definition_repo_repo_related_instruments_group[MAX_MESSAGES];
    snapshot_refresh_top_orders_t snapshot_refresh_top_orders;
    snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_t snapshot_refresh_top_orders_snapshot_refresh_top_orders_group[MAX_MESSAGES];
    security_status_workup_t security_status_workup;
    security_status_workup_security_status_workup_group_t security_status_workup_security_status_workup_group[MAX_MESSAGES];
    snapshot_full_refresh_tcp_t snapshot_full_refresh_tcp;
    snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_t snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group[MAX_MESSAGES];
    negotiate_t negotiate;
    negotiation_reject_t negotiation_reject;
    negotiation_response_t negotiation_response;
    terminate_t terminate;
    market_data_request_t market_data_request;
    market_data_request_market_data_request_security_group_t market_data_request_market_data_request_security_group[MAX_MESSAGES];
    market_data_request_market_data_request_related_symbol_group_header_t market_data_request_market_data_request_related_symbol_group_header;
    market_data_request_market_data_request_related_symbol_group_t market_data_request_market_data_request_related_symbol_group[MAX_MESSAGES];
    request_ack_t request_ack;
    request_ack_request_ack_security_group_t request_ack_request_ack_security_group[MAX_MESSAGES];
    request_ack_request_ack_related_symbol_group_header_t request_ack_request_ack_related_symbol_group_header;
    request_ack_request_ack_related_symbol_group_t request_ack_request_ack_related_symbol_group[MAX_MESSAGES];
    request_reject_t request_reject;
    security_list_request_t security_list_request;
    security_list_request_security_list_request_security_group_t security_list_request_security_list_request_security_group[MAX_MESSAGES];
    security_list_request_security_list_request_related_symbol_group_header_t security_list_request_security_list_request_related_symbol_group_header;
    security_list_request_security_list_request_related_symbol_group_t security_list_request_security_list_request_related_symbol_group[MAX_MESSAGES];
    security_status_request_t security_status_request;
    security_status_request_security_status_request_security_group_t security_status_request_security_status_request_security_group[MAX_MESSAGES];
    security_status_request_security_status_request_related_symbol_group_header_t security_status_request_security_status_request_related_symbol_group_header;
    security_status_request_security_status_request_related_symbol_group_t security_status_request_security_status_request_related_symbol_group[MAX_MESSAGES];
}

parser CmeGlobexMdp3UdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.binary_packet_header);
        transition select(hdr.binary_packet_header.template_id) {
            16w0x400: parse_channel_reset;
            16w0xc00: parse_admin_heartbeat;
            16w0xf00: parse_admin_login;
            16w0x1000: parse_admin_logout;
            16w0x1e00: parse_security_status;
            16w0x2500: parse_md_incremental_refresh_volume;
            16w0x2700: parse_quote_request;
            16w0x2e00: parse_md_incremental_refresh_book;
            16w0x2f00: parse_md_incremental_refresh_order_book;
            16w0x3000: parse_md_incremental_refresh_trade_summary;
            16w0x3100: parse_md_incremental_refresh_daily_statistics;
            16w0x3200: parse_md_incremental_refresh_limits_banding;
            16w0x3300: parse_md_incremental_refresh_session_statistics;
            16w0x3400: parse_snapshot_full_refresh;
            16w0x3500: parse_snapshot_full_refresh_order_book;
            16w0x3600: parse_md_instrument_definition_future;
            16w0x3700: parse_md_instrument_definition_option;
            16w0x3800: parse_md_instrument_definition_spread;
            16w0x3900: parse_md_instrument_definition_fixed_income;
            16w0x3a00: parse_md_instrument_definition_repo;
            16w0x3b00: parse_snapshot_refresh_top_orders;
            16w0x3c00: parse_security_status_workup;
            16w0x3d00: parse_snapshot_full_refresh_tcp;
            16w0xc800: parse_negotiate;
            16w0xc900: parse_negotiation_reject;
            16w0xca00: parse_negotiation_response;
            16w0xcb00: parse_terminate;
            16w0xcd00: parse_market_data_request;
            16w0xce00: parse_request_ack;
            16w0xcf00: parse_request_reject;
            16w0xd000: parse_security_list_request;
            16w0xd100: parse_security_status_request;
            16w0xd200: parse_subscriber_heartbeat;
            default: accept;
        }
    }

    state parse_channel_reset {
        packet.extract(hdr.channel_reset);
        meta.dispatched = 1;
        meta.channel_reset_channel_reset_group_remaining = hdr.channel_reset.num_in_group;
        transition select(meta.channel_reset_channel_reset_group_remaining) {
            8w0: accept;
            default: parse_channel_reset_channel_reset_group;
        }
    }

    state parse_channel_reset_channel_reset_group {
        packet.extract(hdr.channel_reset_channel_reset_group.next);
        meta.channel_reset_channel_reset_group_remaining = meta.channel_reset_channel_reset_group_remaining - 1;
        transition select(meta.channel_reset_channel_reset_group_remaining) {
            8w0: accept;
            default: parse_channel_reset_channel_reset_group;
        }
    }

    state parse_admin_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_admin_login {
        packet.extract(hdr.admin_login);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_admin_logout {
        packet.extract(hdr.admin_logout);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_status {
        packet.extract(hdr.security_status);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_md_incremental_refresh_volume {
        packet.extract(hdr.md_incremental_refresh_volume);
        meta.dispatched = 1;
        meta.md_incremental_refresh_volume_incremental_refresh_volume_group_remaining = hdr.md_incremental_refresh_volume.num_in_group;
        transition select(meta.md_incremental_refresh_volume_incremental_refresh_volume_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_volume_incremental_refresh_volume_group;
        }
    }

    state parse_md_incremental_refresh_volume_incremental_refresh_volume_group {
        packet.extract(hdr.md_incremental_refresh_volume_incremental_refresh_volume_group.next);
        meta.md_incremental_refresh_volume_incremental_refresh_volume_group_remaining = meta.md_incremental_refresh_volume_incremental_refresh_volume_group_remaining - 1;
        transition select(meta.md_incremental_refresh_volume_incremental_refresh_volume_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_volume_incremental_refresh_volume_group;
        }
    }

    state parse_quote_request {
        packet.extract(hdr.quote_request);
        meta.dispatched = 1;
        meta.quote_request_related_sym_group_remaining = hdr.quote_request.num_in_group;
        transition select(meta.quote_request_related_sym_group_remaining) {
            8w0: accept;
            default: parse_quote_request_related_sym_group;
        }
    }

    state parse_quote_request_related_sym_group {
        packet.extract(hdr.quote_request_related_sym_group.next);
        meta.quote_request_related_sym_group_remaining = meta.quote_request_related_sym_group_remaining - 1;
        transition select(meta.quote_request_related_sym_group_remaining) {
            8w0: accept;
            default: parse_quote_request_related_sym_group;
        }
    }

    state parse_md_incremental_refresh_book {
        packet.extract(hdr.md_incremental_refresh_book);
        meta.dispatched = 1;
        meta.md_incremental_refresh_book_incremental_refresh_book_group_remaining = hdr.md_incremental_refresh_book.num_in_group;
        transition select(meta.md_incremental_refresh_book_incremental_refresh_book_group_remaining) {
            8w0: read_md_incremental_refresh_book_incremental_refresh_book_order_id_group;
            default: parse_md_incremental_refresh_book_incremental_refresh_book_group;
        }
    }

    state parse_md_incremental_refresh_book_incremental_refresh_book_group {
        packet.extract(hdr.md_incremental_refresh_book_incremental_refresh_book_group.next);
        meta.md_incremental_refresh_book_incremental_refresh_book_group_remaining = meta.md_incremental_refresh_book_incremental_refresh_book_group_remaining - 1;
        transition select(meta.md_incremental_refresh_book_incremental_refresh_book_group_remaining) {
            8w0: read_md_incremental_refresh_book_incremental_refresh_book_order_id_group;
            default: parse_md_incremental_refresh_book_incremental_refresh_book_group;
        }
    }

    state read_md_incremental_refresh_book_incremental_refresh_book_order_id_group {
        packet.extract(hdr.md_incremental_refresh_book_incremental_refresh_book_order_id_group_header);
        meta.md_incremental_refresh_book_incremental_refresh_book_order_id_group_remaining = hdr.md_incremental_refresh_book_incremental_refresh_book_order_id_group_header.num_in_group;
        transition select(meta.md_incremental_refresh_book_incremental_refresh_book_order_id_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_book_incremental_refresh_book_order_id_group;
        }
    }

    state parse_md_incremental_refresh_book_incremental_refresh_book_order_id_group {
        packet.extract(hdr.md_incremental_refresh_book_incremental_refresh_book_order_id_group.next);
        meta.md_incremental_refresh_book_incremental_refresh_book_order_id_group_remaining = meta.md_incremental_refresh_book_incremental_refresh_book_order_id_group_remaining - 1;
        transition select(meta.md_incremental_refresh_book_incremental_refresh_book_order_id_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_book_incremental_refresh_book_order_id_group;
        }
    }

    state parse_md_incremental_refresh_order_book {
        packet.extract(hdr.md_incremental_refresh_order_book);
        meta.dispatched = 1;
        meta.md_incremental_refresh_order_book_incremental_refresh_order_book_group_remaining = hdr.md_incremental_refresh_order_book.num_in_group;
        transition select(meta.md_incremental_refresh_order_book_incremental_refresh_order_book_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_order_book_incremental_refresh_order_book_group;
        }
    }

    state parse_md_incremental_refresh_order_book_incremental_refresh_order_book_group {
        packet.extract(hdr.md_incremental_refresh_order_book_incremental_refresh_order_book_group.next);
        meta.md_incremental_refresh_order_book_incremental_refresh_order_book_group_remaining = meta.md_incremental_refresh_order_book_incremental_refresh_order_book_group_remaining - 1;
        transition select(meta.md_incremental_refresh_order_book_incremental_refresh_order_book_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_order_book_incremental_refresh_order_book_group;
        }
    }

    state parse_md_incremental_refresh_trade_summary {
        packet.extract(hdr.md_incremental_refresh_trade_summary);
        meta.dispatched = 1;
        meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_remaining = hdr.md_incremental_refresh_trade_summary.num_in_group;
        transition select(meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_remaining) {
            8w0: read_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group;
            default: parse_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group;
        }
    }

    state parse_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group {
        packet.extract(hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group.next);
        meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_remaining = meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_remaining - 1;
        transition select(meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group_remaining) {
            8w0: read_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group;
            default: parse_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group;
        }
    }

    state read_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group {
        packet.extract(hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_header);
        meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_remaining = hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_header.num_in_group;
        transition select(meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group;
        }
    }

    state parse_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group {
        packet.extract(hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group.next);
        meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_remaining = meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_remaining - 1;
        transition select(meta.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group;
        }
    }

    state parse_md_incremental_refresh_daily_statistics {
        packet.extract(hdr.md_incremental_refresh_daily_statistics);
        meta.dispatched = 1;
        meta.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_remaining = hdr.md_incremental_refresh_daily_statistics.num_in_group;
        transition select(meta.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group;
        }
    }

    state parse_md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group {
        packet.extract(hdr.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group.next);
        meta.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_remaining = meta.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_remaining - 1;
        transition select(meta.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group;
        }
    }

    state parse_md_incremental_refresh_limits_banding {
        packet.extract(hdr.md_incremental_refresh_limits_banding);
        meta.dispatched = 1;
        meta.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_remaining = hdr.md_incremental_refresh_limits_banding.num_in_group;
        transition select(meta.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group;
        }
    }

    state parse_md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group {
        packet.extract(hdr.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group.next);
        meta.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_remaining = meta.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_remaining - 1;
        transition select(meta.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group;
        }
    }

    state parse_md_incremental_refresh_session_statistics {
        packet.extract(hdr.md_incremental_refresh_session_statistics);
        meta.dispatched = 1;
        meta.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_remaining = hdr.md_incremental_refresh_session_statistics.num_in_group;
        transition select(meta.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group;
        }
    }

    state parse_md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group {
        packet.extract(hdr.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group.next);
        meta.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_remaining = meta.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_remaining - 1;
        transition select(meta.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group;
        }
    }

    state parse_snapshot_full_refresh {
        packet.extract(hdr.snapshot_full_refresh);
        meta.dispatched = 1;
        meta.snapshot_full_refresh_snapshot_full_refresh_group_remaining = hdr.snapshot_full_refresh.num_in_group;
        transition select(meta.snapshot_full_refresh_snapshot_full_refresh_group_remaining) {
            8w0: accept;
            default: parse_snapshot_full_refresh_snapshot_full_refresh_group;
        }
    }

    state parse_snapshot_full_refresh_snapshot_full_refresh_group {
        packet.extract(hdr.snapshot_full_refresh_snapshot_full_refresh_group.next);
        meta.snapshot_full_refresh_snapshot_full_refresh_group_remaining = meta.snapshot_full_refresh_snapshot_full_refresh_group_remaining - 1;
        transition select(meta.snapshot_full_refresh_snapshot_full_refresh_group_remaining) {
            8w0: accept;
            default: parse_snapshot_full_refresh_snapshot_full_refresh_group;
        }
    }

    state parse_snapshot_full_refresh_order_book {
        packet.extract(hdr.snapshot_full_refresh_order_book);
        meta.dispatched = 1;
        meta.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_remaining = hdr.snapshot_full_refresh_order_book.num_in_group;
        transition select(meta.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_remaining) {
            8w0: accept;
            default: parse_snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group;
        }
    }

    state parse_snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group {
        packet.extract(hdr.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group.next);
        meta.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_remaining = meta.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_remaining - 1;
        transition select(meta.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group_remaining) {
            8w0: accept;
            default: parse_snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group;
        }
    }

    state parse_md_instrument_definition_future {
        packet.extract(hdr.md_instrument_definition_future);
        meta.dispatched = 1;
        meta.md_instrument_definition_future_events_group_remaining = hdr.md_instrument_definition_future.num_in_group;
        transition select(meta.md_instrument_definition_future_events_group_remaining) {
            8w0: read_md_instrument_definition_future_feed_types_group;
            default: parse_md_instrument_definition_future_events_group;
        }
    }

    state parse_md_instrument_definition_future_events_group {
        packet.extract(hdr.md_instrument_definition_future_events_group.next);
        meta.md_instrument_definition_future_events_group_remaining = meta.md_instrument_definition_future_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_future_events_group_remaining) {
            8w0: read_md_instrument_definition_future_feed_types_group;
            default: parse_md_instrument_definition_future_events_group;
        }
    }

    state read_md_instrument_definition_future_feed_types_group {
        packet.extract(hdr.md_instrument_definition_future_feed_types_group_header);
        meta.md_instrument_definition_future_feed_types_group_remaining = hdr.md_instrument_definition_future_feed_types_group_header.num_in_group;
        transition select(meta.md_instrument_definition_future_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_future_inst_attrib_group;
            default: parse_md_instrument_definition_future_feed_types_group;
        }
    }

    state parse_md_instrument_definition_future_feed_types_group {
        packet.extract(hdr.md_instrument_definition_future_feed_types_group.next);
        meta.md_instrument_definition_future_feed_types_group_remaining = meta.md_instrument_definition_future_feed_types_group_remaining - 1;
        transition select(meta.md_instrument_definition_future_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_future_inst_attrib_group;
            default: parse_md_instrument_definition_future_feed_types_group;
        }
    }

    state read_md_instrument_definition_future_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_future_inst_attrib_group_header);
        meta.md_instrument_definition_future_inst_attrib_group_remaining = hdr.md_instrument_definition_future_inst_attrib_group_header.num_in_group;
        transition select(meta.md_instrument_definition_future_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_future_lot_type_rules_group;
            default: parse_md_instrument_definition_future_inst_attrib_group;
        }
    }

    state parse_md_instrument_definition_future_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_future_inst_attrib_group.next);
        meta.md_instrument_definition_future_inst_attrib_group_remaining = meta.md_instrument_definition_future_inst_attrib_group_remaining - 1;
        transition select(meta.md_instrument_definition_future_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_future_lot_type_rules_group;
            default: parse_md_instrument_definition_future_inst_attrib_group;
        }
    }

    state read_md_instrument_definition_future_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_future_lot_type_rules_group_header);
        meta.md_instrument_definition_future_lot_type_rules_group_remaining = hdr.md_instrument_definition_future_lot_type_rules_group_header.num_in_group;
        transition select(meta.md_instrument_definition_future_lot_type_rules_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_future_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_future_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_future_lot_type_rules_group.next);
        meta.md_instrument_definition_future_lot_type_rules_group_remaining = meta.md_instrument_definition_future_lot_type_rules_group_remaining - 1;
        transition select(meta.md_instrument_definition_future_lot_type_rules_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_future_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_option {
        packet.extract(hdr.md_instrument_definition_option);
        meta.dispatched = 1;
        meta.md_instrument_definition_option_events_group_remaining = hdr.md_instrument_definition_option.num_in_group;
        transition select(meta.md_instrument_definition_option_events_group_remaining) {
            8w0: read_md_instrument_definition_option_feed_types_group;
            default: parse_md_instrument_definition_option_events_group;
        }
    }

    state parse_md_instrument_definition_option_events_group {
        packet.extract(hdr.md_instrument_definition_option_events_group.next);
        meta.md_instrument_definition_option_events_group_remaining = meta.md_instrument_definition_option_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_option_events_group_remaining) {
            8w0: read_md_instrument_definition_option_feed_types_group;
            default: parse_md_instrument_definition_option_events_group;
        }
    }

    state read_md_instrument_definition_option_feed_types_group {
        packet.extract(hdr.md_instrument_definition_option_feed_types_group_header);
        meta.md_instrument_definition_option_feed_types_group_remaining = hdr.md_instrument_definition_option_feed_types_group_header.num_in_group;
        transition select(meta.md_instrument_definition_option_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_option_inst_attrib_group;
            default: parse_md_instrument_definition_option_feed_types_group;
        }
    }

    state parse_md_instrument_definition_option_feed_types_group {
        packet.extract(hdr.md_instrument_definition_option_feed_types_group.next);
        meta.md_instrument_definition_option_feed_types_group_remaining = meta.md_instrument_definition_option_feed_types_group_remaining - 1;
        transition select(meta.md_instrument_definition_option_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_option_inst_attrib_group;
            default: parse_md_instrument_definition_option_feed_types_group;
        }
    }

    state read_md_instrument_definition_option_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_option_inst_attrib_group_header);
        meta.md_instrument_definition_option_inst_attrib_group_remaining = hdr.md_instrument_definition_option_inst_attrib_group_header.num_in_group;
        transition select(meta.md_instrument_definition_option_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_option_lot_type_rules_group;
            default: parse_md_instrument_definition_option_inst_attrib_group;
        }
    }

    state parse_md_instrument_definition_option_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_option_inst_attrib_group.next);
        meta.md_instrument_definition_option_inst_attrib_group_remaining = meta.md_instrument_definition_option_inst_attrib_group_remaining - 1;
        transition select(meta.md_instrument_definition_option_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_option_lot_type_rules_group;
            default: parse_md_instrument_definition_option_inst_attrib_group;
        }
    }

    state read_md_instrument_definition_option_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_option_lot_type_rules_group_header);
        meta.md_instrument_definition_option_lot_type_rules_group_remaining = hdr.md_instrument_definition_option_lot_type_rules_group_header.num_in_group;
        transition select(meta.md_instrument_definition_option_lot_type_rules_group_remaining) {
            8w0: read_md_instrument_definition_option_option_underlyings_group;
            default: parse_md_instrument_definition_option_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_option_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_option_lot_type_rules_group.next);
        meta.md_instrument_definition_option_lot_type_rules_group_remaining = meta.md_instrument_definition_option_lot_type_rules_group_remaining - 1;
        transition select(meta.md_instrument_definition_option_lot_type_rules_group_remaining) {
            8w0: read_md_instrument_definition_option_option_underlyings_group;
            default: parse_md_instrument_definition_option_lot_type_rules_group;
        }
    }

    state read_md_instrument_definition_option_option_underlyings_group {
        packet.extract(hdr.md_instrument_definition_option_option_underlyings_group_header);
        meta.md_instrument_definition_option_option_underlyings_group_remaining = hdr.md_instrument_definition_option_option_underlyings_group_header.num_in_group;
        transition select(meta.md_instrument_definition_option_option_underlyings_group_remaining) {
            8w0: read_md_instrument_definition_option_option_related_instruments_group;
            default: parse_md_instrument_definition_option_option_underlyings_group;
        }
    }

    state parse_md_instrument_definition_option_option_underlyings_group {
        packet.extract(hdr.md_instrument_definition_option_option_underlyings_group.next);
        meta.md_instrument_definition_option_option_underlyings_group_remaining = meta.md_instrument_definition_option_option_underlyings_group_remaining - 1;
        transition select(meta.md_instrument_definition_option_option_underlyings_group_remaining) {
            8w0: read_md_instrument_definition_option_option_related_instruments_group;
            default: parse_md_instrument_definition_option_option_underlyings_group;
        }
    }

    state read_md_instrument_definition_option_option_related_instruments_group {
        packet.extract(hdr.md_instrument_definition_option_option_related_instruments_group_header);
        meta.md_instrument_definition_option_option_related_instruments_group_remaining = hdr.md_instrument_definition_option_option_related_instruments_group_header.num_in_group;
        transition select(meta.md_instrument_definition_option_option_related_instruments_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_option_option_related_instruments_group;
        }
    }

    state parse_md_instrument_definition_option_option_related_instruments_group {
        packet.extract(hdr.md_instrument_definition_option_option_related_instruments_group.next);
        meta.md_instrument_definition_option_option_related_instruments_group_remaining = meta.md_instrument_definition_option_option_related_instruments_group_remaining - 1;
        transition select(meta.md_instrument_definition_option_option_related_instruments_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_option_option_related_instruments_group;
        }
    }

    state parse_md_instrument_definition_spread {
        packet.extract(hdr.md_instrument_definition_spread);
        meta.dispatched = 1;
        meta.md_instrument_definition_spread_events_group_remaining = hdr.md_instrument_definition_spread.num_in_group;
        transition select(meta.md_instrument_definition_spread_events_group_remaining) {
            8w0: read_md_instrument_definition_spread_feed_types_group;
            default: parse_md_instrument_definition_spread_events_group;
        }
    }

    state parse_md_instrument_definition_spread_events_group {
        packet.extract(hdr.md_instrument_definition_spread_events_group.next);
        meta.md_instrument_definition_spread_events_group_remaining = meta.md_instrument_definition_spread_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_spread_events_group_remaining) {
            8w0: read_md_instrument_definition_spread_feed_types_group;
            default: parse_md_instrument_definition_spread_events_group;
        }
    }

    state read_md_instrument_definition_spread_feed_types_group {
        packet.extract(hdr.md_instrument_definition_spread_feed_types_group_header);
        meta.md_instrument_definition_spread_feed_types_group_remaining = hdr.md_instrument_definition_spread_feed_types_group_header.num_in_group;
        transition select(meta.md_instrument_definition_spread_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_spread_inst_attrib_group;
            default: parse_md_instrument_definition_spread_feed_types_group;
        }
    }

    state parse_md_instrument_definition_spread_feed_types_group {
        packet.extract(hdr.md_instrument_definition_spread_feed_types_group.next);
        meta.md_instrument_definition_spread_feed_types_group_remaining = meta.md_instrument_definition_spread_feed_types_group_remaining - 1;
        transition select(meta.md_instrument_definition_spread_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_spread_inst_attrib_group;
            default: parse_md_instrument_definition_spread_feed_types_group;
        }
    }

    state read_md_instrument_definition_spread_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_spread_inst_attrib_group_header);
        meta.md_instrument_definition_spread_inst_attrib_group_remaining = hdr.md_instrument_definition_spread_inst_attrib_group_header.num_in_group;
        transition select(meta.md_instrument_definition_spread_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_spread_lot_type_rules_group;
            default: parse_md_instrument_definition_spread_inst_attrib_group;
        }
    }

    state parse_md_instrument_definition_spread_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_spread_inst_attrib_group.next);
        meta.md_instrument_definition_spread_inst_attrib_group_remaining = meta.md_instrument_definition_spread_inst_attrib_group_remaining - 1;
        transition select(meta.md_instrument_definition_spread_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_spread_lot_type_rules_group;
            default: parse_md_instrument_definition_spread_inst_attrib_group;
        }
    }

    state read_md_instrument_definition_spread_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_spread_lot_type_rules_group_header);
        meta.md_instrument_definition_spread_lot_type_rules_group_remaining = hdr.md_instrument_definition_spread_lot_type_rules_group_header.num_in_group;
        transition select(meta.md_instrument_definition_spread_lot_type_rules_group_remaining) {
            8w0: read_md_instrument_definition_spread_legs_group;
            default: parse_md_instrument_definition_spread_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_spread_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_spread_lot_type_rules_group.next);
        meta.md_instrument_definition_spread_lot_type_rules_group_remaining = meta.md_instrument_definition_spread_lot_type_rules_group_remaining - 1;
        transition select(meta.md_instrument_definition_spread_lot_type_rules_group_remaining) {
            8w0: read_md_instrument_definition_spread_legs_group;
            default: parse_md_instrument_definition_spread_lot_type_rules_group;
        }
    }

    state read_md_instrument_definition_spread_legs_group {
        packet.extract(hdr.md_instrument_definition_spread_legs_group_header);
        meta.md_instrument_definition_spread_legs_group_remaining = hdr.md_instrument_definition_spread_legs_group_header.num_in_group;
        transition select(meta.md_instrument_definition_spread_legs_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_spread_legs_group;
        }
    }

    state parse_md_instrument_definition_spread_legs_group {
        packet.extract(hdr.md_instrument_definition_spread_legs_group.next);
        meta.md_instrument_definition_spread_legs_group_remaining = meta.md_instrument_definition_spread_legs_group_remaining - 1;
        transition select(meta.md_instrument_definition_spread_legs_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_spread_legs_group;
        }
    }

    state parse_md_instrument_definition_fixed_income {
        packet.extract(hdr.md_instrument_definition_fixed_income);
        meta.dispatched = 1;
        meta.md_instrument_definition_fixed_income_events_group_remaining = hdr.md_instrument_definition_fixed_income.num_in_group;
        transition select(meta.md_instrument_definition_fixed_income_events_group_remaining) {
            8w0: read_md_instrument_definition_fixed_income_feed_types_group;
            default: parse_md_instrument_definition_fixed_income_events_group;
        }
    }

    state parse_md_instrument_definition_fixed_income_events_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_events_group.next);
        meta.md_instrument_definition_fixed_income_events_group_remaining = meta.md_instrument_definition_fixed_income_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_fixed_income_events_group_remaining) {
            8w0: read_md_instrument_definition_fixed_income_feed_types_group;
            default: parse_md_instrument_definition_fixed_income_events_group;
        }
    }

    state read_md_instrument_definition_fixed_income_feed_types_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_feed_types_group_header);
        meta.md_instrument_definition_fixed_income_feed_types_group_remaining = hdr.md_instrument_definition_fixed_income_feed_types_group_header.num_in_group;
        transition select(meta.md_instrument_definition_fixed_income_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_fixed_income_inst_attrib_group;
            default: parse_md_instrument_definition_fixed_income_feed_types_group;
        }
    }

    state parse_md_instrument_definition_fixed_income_feed_types_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_feed_types_group.next);
        meta.md_instrument_definition_fixed_income_feed_types_group_remaining = meta.md_instrument_definition_fixed_income_feed_types_group_remaining - 1;
        transition select(meta.md_instrument_definition_fixed_income_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_fixed_income_inst_attrib_group;
            default: parse_md_instrument_definition_fixed_income_feed_types_group;
        }
    }

    state read_md_instrument_definition_fixed_income_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_inst_attrib_group_header);
        meta.md_instrument_definition_fixed_income_inst_attrib_group_remaining = hdr.md_instrument_definition_fixed_income_inst_attrib_group_header.num_in_group;
        transition select(meta.md_instrument_definition_fixed_income_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_fixed_income_lot_type_rules_group;
            default: parse_md_instrument_definition_fixed_income_inst_attrib_group;
        }
    }

    state parse_md_instrument_definition_fixed_income_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_inst_attrib_group.next);
        meta.md_instrument_definition_fixed_income_inst_attrib_group_remaining = meta.md_instrument_definition_fixed_income_inst_attrib_group_remaining - 1;
        transition select(meta.md_instrument_definition_fixed_income_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_fixed_income_lot_type_rules_group;
            default: parse_md_instrument_definition_fixed_income_inst_attrib_group;
        }
    }

    state read_md_instrument_definition_fixed_income_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_lot_type_rules_group_header);
        meta.md_instrument_definition_fixed_income_lot_type_rules_group_remaining = hdr.md_instrument_definition_fixed_income_lot_type_rules_group_header.num_in_group;
        transition select(meta.md_instrument_definition_fixed_income_lot_type_rules_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_fixed_income_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_fixed_income_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_fixed_income_lot_type_rules_group.next);
        meta.md_instrument_definition_fixed_income_lot_type_rules_group_remaining = meta.md_instrument_definition_fixed_income_lot_type_rules_group_remaining - 1;
        transition select(meta.md_instrument_definition_fixed_income_lot_type_rules_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_fixed_income_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_repo {
        packet.extract(hdr.md_instrument_definition_repo);
        meta.dispatched = 1;
        meta.md_instrument_definition_repo_events_group_remaining = hdr.md_instrument_definition_repo.num_in_group;
        transition select(meta.md_instrument_definition_repo_events_group_remaining) {
            8w0: read_md_instrument_definition_repo_feed_types_group;
            default: parse_md_instrument_definition_repo_events_group;
        }
    }

    state parse_md_instrument_definition_repo_events_group {
        packet.extract(hdr.md_instrument_definition_repo_events_group.next);
        meta.md_instrument_definition_repo_events_group_remaining = meta.md_instrument_definition_repo_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_repo_events_group_remaining) {
            8w0: read_md_instrument_definition_repo_feed_types_group;
            default: parse_md_instrument_definition_repo_events_group;
        }
    }

    state read_md_instrument_definition_repo_feed_types_group {
        packet.extract(hdr.md_instrument_definition_repo_feed_types_group_header);
        meta.md_instrument_definition_repo_feed_types_group_remaining = hdr.md_instrument_definition_repo_feed_types_group_header.num_in_group;
        transition select(meta.md_instrument_definition_repo_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_repo_inst_attrib_group;
            default: parse_md_instrument_definition_repo_feed_types_group;
        }
    }

    state parse_md_instrument_definition_repo_feed_types_group {
        packet.extract(hdr.md_instrument_definition_repo_feed_types_group.next);
        meta.md_instrument_definition_repo_feed_types_group_remaining = meta.md_instrument_definition_repo_feed_types_group_remaining - 1;
        transition select(meta.md_instrument_definition_repo_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_repo_inst_attrib_group;
            default: parse_md_instrument_definition_repo_feed_types_group;
        }
    }

    state read_md_instrument_definition_repo_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_repo_inst_attrib_group_header);
        meta.md_instrument_definition_repo_inst_attrib_group_remaining = hdr.md_instrument_definition_repo_inst_attrib_group_header.num_in_group;
        transition select(meta.md_instrument_definition_repo_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_repo_lot_type_rules_group;
            default: parse_md_instrument_definition_repo_inst_attrib_group;
        }
    }

    state parse_md_instrument_definition_repo_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_repo_inst_attrib_group.next);
        meta.md_instrument_definition_repo_inst_attrib_group_remaining = meta.md_instrument_definition_repo_inst_attrib_group_remaining - 1;
        transition select(meta.md_instrument_definition_repo_inst_attrib_group_remaining) {
            8w0: read_md_instrument_definition_repo_lot_type_rules_group;
            default: parse_md_instrument_definition_repo_inst_attrib_group;
        }
    }

    state read_md_instrument_definition_repo_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_repo_lot_type_rules_group_header);
        meta.md_instrument_definition_repo_lot_type_rules_group_remaining = hdr.md_instrument_definition_repo_lot_type_rules_group_header.num_in_group;
        transition select(meta.md_instrument_definition_repo_lot_type_rules_group_remaining) {
            8w0: read_md_instrument_definition_repo_repo_underlyings_group;
            default: parse_md_instrument_definition_repo_lot_type_rules_group;
        }
    }

    state parse_md_instrument_definition_repo_lot_type_rules_group {
        packet.extract(hdr.md_instrument_definition_repo_lot_type_rules_group.next);
        meta.md_instrument_definition_repo_lot_type_rules_group_remaining = meta.md_instrument_definition_repo_lot_type_rules_group_remaining - 1;
        transition select(meta.md_instrument_definition_repo_lot_type_rules_group_remaining) {
            8w0: read_md_instrument_definition_repo_repo_underlyings_group;
            default: parse_md_instrument_definition_repo_lot_type_rules_group;
        }
    }

    state read_md_instrument_definition_repo_repo_underlyings_group {
        packet.extract(hdr.md_instrument_definition_repo_repo_underlyings_group_header);
        meta.md_instrument_definition_repo_repo_underlyings_group_remaining = hdr.md_instrument_definition_repo_repo_underlyings_group_header.num_in_group;
        transition select(meta.md_instrument_definition_repo_repo_underlyings_group_remaining) {
            8w0: read_md_instrument_definition_repo_repo_related_instruments_group;
            default: parse_md_instrument_definition_repo_repo_underlyings_group;
        }
    }

    state parse_md_instrument_definition_repo_repo_underlyings_group {
        packet.extract(hdr.md_instrument_definition_repo_repo_underlyings_group.next);
        meta.md_instrument_definition_repo_repo_underlyings_group_remaining = meta.md_instrument_definition_repo_repo_underlyings_group_remaining - 1;
        transition select(meta.md_instrument_definition_repo_repo_underlyings_group_remaining) {
            8w0: read_md_instrument_definition_repo_repo_related_instruments_group;
            default: parse_md_instrument_definition_repo_repo_underlyings_group;
        }
    }

    state read_md_instrument_definition_repo_repo_related_instruments_group {
        packet.extract(hdr.md_instrument_definition_repo_repo_related_instruments_group_header);
        meta.md_instrument_definition_repo_repo_related_instruments_group_remaining = hdr.md_instrument_definition_repo_repo_related_instruments_group_header.num_in_group;
        transition select(meta.md_instrument_definition_repo_repo_related_instruments_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_repo_repo_related_instruments_group;
        }
    }

    state parse_md_instrument_definition_repo_repo_related_instruments_group {
        packet.extract(hdr.md_instrument_definition_repo_repo_related_instruments_group.next);
        meta.md_instrument_definition_repo_repo_related_instruments_group_remaining = meta.md_instrument_definition_repo_repo_related_instruments_group_remaining - 1;
        transition select(meta.md_instrument_definition_repo_repo_related_instruments_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_repo_repo_related_instruments_group;
        }
    }

    state parse_snapshot_refresh_top_orders {
        packet.extract(hdr.snapshot_refresh_top_orders);
        meta.dispatched = 1;
        meta.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_remaining = hdr.snapshot_refresh_top_orders.num_in_group;
        transition select(meta.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_remaining) {
            8w0: accept;
            default: parse_snapshot_refresh_top_orders_snapshot_refresh_top_orders_group;
        }
    }

    state parse_snapshot_refresh_top_orders_snapshot_refresh_top_orders_group {
        packet.extract(hdr.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group.next);
        meta.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_remaining = meta.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_remaining - 1;
        transition select(meta.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group_remaining) {
            8w0: accept;
            default: parse_snapshot_refresh_top_orders_snapshot_refresh_top_orders_group;
        }
    }

    state parse_security_status_workup {
        packet.extract(hdr.security_status_workup);
        meta.dispatched = 1;
        meta.security_status_workup_security_status_workup_group_remaining = hdr.security_status_workup.num_in_group;
        transition select(meta.security_status_workup_security_status_workup_group_remaining) {
            8w0: accept;
            default: parse_security_status_workup_security_status_workup_group;
        }
    }

    state parse_security_status_workup_security_status_workup_group {
        packet.extract(hdr.security_status_workup_security_status_workup_group.next);
        meta.security_status_workup_security_status_workup_group_remaining = meta.security_status_workup_security_status_workup_group_remaining - 1;
        transition select(meta.security_status_workup_security_status_workup_group_remaining) {
            8w0: accept;
            default: parse_security_status_workup_security_status_workup_group;
        }
    }

    state parse_snapshot_full_refresh_tcp {
        packet.extract(hdr.snapshot_full_refresh_tcp);
        meta.dispatched = 1;
        meta.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_remaining = hdr.snapshot_full_refresh_tcp.num_in_group;
        transition select(meta.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_remaining) {
            8w0: accept;
            default: parse_snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group;
        }
    }

    state parse_snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group {
        packet.extract(hdr.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group.next);
        meta.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_remaining = meta.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_remaining - 1;
        transition select(meta.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group_remaining) {
            8w0: accept;
            default: parse_snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group;
        }
    }

    state parse_negotiate {
        packet.extract(hdr.negotiate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_negotiation_reject {
        packet.extract(hdr.negotiation_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_negotiation_response {
        packet.extract(hdr.negotiation_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_terminate {
        packet.extract(hdr.terminate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_data_request {
        packet.extract(hdr.market_data_request);
        meta.dispatched = 1;
        meta.market_data_request_market_data_request_security_group_remaining = hdr.market_data_request.num_in_group;
        transition select(meta.market_data_request_market_data_request_security_group_remaining) {
            8w0: read_market_data_request_market_data_request_related_symbol_group;
            default: parse_market_data_request_market_data_request_security_group;
        }
    }

    state parse_market_data_request_market_data_request_security_group {
        packet.extract(hdr.market_data_request_market_data_request_security_group.next);
        meta.market_data_request_market_data_request_security_group_remaining = meta.market_data_request_market_data_request_security_group_remaining - 1;
        transition select(meta.market_data_request_market_data_request_security_group_remaining) {
            8w0: read_market_data_request_market_data_request_related_symbol_group;
            default: parse_market_data_request_market_data_request_security_group;
        }
    }

    state read_market_data_request_market_data_request_related_symbol_group {
        packet.extract(hdr.market_data_request_market_data_request_related_symbol_group_header);
        meta.market_data_request_market_data_request_related_symbol_group_remaining = hdr.market_data_request_market_data_request_related_symbol_group_header.num_in_group;
        transition select(meta.market_data_request_market_data_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_market_data_request_market_data_request_related_symbol_group;
        }
    }

    state parse_market_data_request_market_data_request_related_symbol_group {
        packet.extract(hdr.market_data_request_market_data_request_related_symbol_group.next);
        meta.market_data_request_market_data_request_related_symbol_group_remaining = meta.market_data_request_market_data_request_related_symbol_group_remaining - 1;
        transition select(meta.market_data_request_market_data_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_market_data_request_market_data_request_related_symbol_group;
        }
    }

    state parse_request_ack {
        packet.extract(hdr.request_ack);
        meta.dispatched = 1;
        meta.request_ack_request_ack_security_group_remaining = hdr.request_ack.num_in_group;
        transition select(meta.request_ack_request_ack_security_group_remaining) {
            8w0: read_request_ack_request_ack_related_symbol_group;
            default: parse_request_ack_request_ack_security_group;
        }
    }

    state parse_request_ack_request_ack_security_group {
        packet.extract(hdr.request_ack_request_ack_security_group.next);
        meta.request_ack_request_ack_security_group_remaining = meta.request_ack_request_ack_security_group_remaining - 1;
        transition select(meta.request_ack_request_ack_security_group_remaining) {
            8w0: read_request_ack_request_ack_related_symbol_group;
            default: parse_request_ack_request_ack_security_group;
        }
    }

    state read_request_ack_request_ack_related_symbol_group {
        packet.extract(hdr.request_ack_request_ack_related_symbol_group_header);
        meta.request_ack_request_ack_related_symbol_group_remaining = hdr.request_ack_request_ack_related_symbol_group_header.num_in_group;
        transition select(meta.request_ack_request_ack_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_request_ack_request_ack_related_symbol_group;
        }
    }

    state parse_request_ack_request_ack_related_symbol_group {
        packet.extract(hdr.request_ack_request_ack_related_symbol_group.next);
        meta.request_ack_request_ack_related_symbol_group_remaining = meta.request_ack_request_ack_related_symbol_group_remaining - 1;
        transition select(meta.request_ack_request_ack_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_request_ack_request_ack_related_symbol_group;
        }
    }

    state parse_request_reject {
        packet.extract(hdr.request_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_list_request {
        packet.extract(hdr.security_list_request);
        meta.dispatched = 1;
        meta.security_list_request_security_list_request_security_group_remaining = hdr.security_list_request.num_in_group;
        transition select(meta.security_list_request_security_list_request_security_group_remaining) {
            8w0: read_security_list_request_security_list_request_related_symbol_group;
            default: parse_security_list_request_security_list_request_security_group;
        }
    }

    state parse_security_list_request_security_list_request_security_group {
        packet.extract(hdr.security_list_request_security_list_request_security_group.next);
        meta.security_list_request_security_list_request_security_group_remaining = meta.security_list_request_security_list_request_security_group_remaining - 1;
        transition select(meta.security_list_request_security_list_request_security_group_remaining) {
            8w0: read_security_list_request_security_list_request_related_symbol_group;
            default: parse_security_list_request_security_list_request_security_group;
        }
    }

    state read_security_list_request_security_list_request_related_symbol_group {
        packet.extract(hdr.security_list_request_security_list_request_related_symbol_group_header);
        meta.security_list_request_security_list_request_related_symbol_group_remaining = hdr.security_list_request_security_list_request_related_symbol_group_header.num_in_group;
        transition select(meta.security_list_request_security_list_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_list_request_security_list_request_related_symbol_group;
        }
    }

    state parse_security_list_request_security_list_request_related_symbol_group {
        packet.extract(hdr.security_list_request_security_list_request_related_symbol_group.next);
        meta.security_list_request_security_list_request_related_symbol_group_remaining = meta.security_list_request_security_list_request_related_symbol_group_remaining - 1;
        transition select(meta.security_list_request_security_list_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_list_request_security_list_request_related_symbol_group;
        }
    }

    state parse_security_status_request {
        packet.extract(hdr.security_status_request);
        meta.dispatched = 1;
        meta.security_status_request_security_status_request_security_group_remaining = hdr.security_status_request.num_in_group;
        transition select(meta.security_status_request_security_status_request_security_group_remaining) {
            8w0: read_security_status_request_security_status_request_related_symbol_group;
            default: parse_security_status_request_security_status_request_security_group;
        }
    }

    state parse_security_status_request_security_status_request_security_group {
        packet.extract(hdr.security_status_request_security_status_request_security_group.next);
        meta.security_status_request_security_status_request_security_group_remaining = meta.security_status_request_security_status_request_security_group_remaining - 1;
        transition select(meta.security_status_request_security_status_request_security_group_remaining) {
            8w0: read_security_status_request_security_status_request_related_symbol_group;
            default: parse_security_status_request_security_status_request_security_group;
        }
    }

    state read_security_status_request_security_status_request_related_symbol_group {
        packet.extract(hdr.security_status_request_security_status_request_related_symbol_group_header);
        meta.security_status_request_security_status_request_related_symbol_group_remaining = hdr.security_status_request_security_status_request_related_symbol_group_header.num_in_group;
        transition select(meta.security_status_request_security_status_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_status_request_security_status_request_related_symbol_group;
        }
    }

    state parse_security_status_request_security_status_request_related_symbol_group {
        packet.extract(hdr.security_status_request_security_status_request_related_symbol_group.next);
        meta.security_status_request_security_status_request_related_symbol_group_remaining = meta.security_status_request_security_status_request_related_symbol_group_remaining - 1;
        transition select(meta.security_status_request_security_status_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_status_request_security_status_request_related_symbol_group;
        }
    }

    state parse_subscriber_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

}

control CmeGlobexMdp3UdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexMdp3UdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control CmeGlobexMdp3UdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexMdp3UdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexMdp3UdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.binary_packet_header);
        packet.emit(hdr.channel_reset);
        packet.emit(hdr.channel_reset_channel_reset_group);
        packet.emit(hdr.admin_login);
        packet.emit(hdr.admin_logout);
        packet.emit(hdr.security_status);
        packet.emit(hdr.md_incremental_refresh_volume);
        packet.emit(hdr.md_incremental_refresh_volume_incremental_refresh_volume_group);
        packet.emit(hdr.quote_request);
        packet.emit(hdr.quote_request_related_sym_group);
        packet.emit(hdr.md_incremental_refresh_book);
        packet.emit(hdr.md_incremental_refresh_book_incremental_refresh_book_group);
        packet.emit(hdr.md_incremental_refresh_book_incremental_refresh_book_order_id_group_header);
        packet.emit(hdr.md_incremental_refresh_book_incremental_refresh_book_order_id_group);
        packet.emit(hdr.md_incremental_refresh_order_book);
        packet.emit(hdr.md_incremental_refresh_order_book_incremental_refresh_order_book_group);
        packet.emit(hdr.md_incremental_refresh_trade_summary);
        packet.emit(hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_group);
        packet.emit(hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group_header);
        packet.emit(hdr.md_incremental_refresh_trade_summary_incremental_refresh_trade_summary_order_id_group);
        packet.emit(hdr.md_incremental_refresh_daily_statistics);
        packet.emit(hdr.md_incremental_refresh_daily_statistics_incremental_refresh_daily_statistics_group);
        packet.emit(hdr.md_incremental_refresh_limits_banding);
        packet.emit(hdr.md_incremental_refresh_limits_banding_incremental_refresh_limits_banding_group);
        packet.emit(hdr.md_incremental_refresh_session_statistics);
        packet.emit(hdr.md_incremental_refresh_session_statistics_incremental_refresh_session_statistics_group);
        packet.emit(hdr.snapshot_full_refresh);
        packet.emit(hdr.snapshot_full_refresh_snapshot_full_refresh_group);
        packet.emit(hdr.snapshot_full_refresh_order_book);
        packet.emit(hdr.snapshot_full_refresh_order_book_snapshot_full_refresh_order_book_group);
        packet.emit(hdr.md_instrument_definition_future);
        packet.emit(hdr.md_instrument_definition_future_events_group);
        packet.emit(hdr.md_instrument_definition_future_feed_types_group_header);
        packet.emit(hdr.md_instrument_definition_future_feed_types_group);
        packet.emit(hdr.md_instrument_definition_future_inst_attrib_group_header);
        packet.emit(hdr.md_instrument_definition_future_inst_attrib_group);
        packet.emit(hdr.md_instrument_definition_future_lot_type_rules_group_header);
        packet.emit(hdr.md_instrument_definition_future_lot_type_rules_group);
        packet.emit(hdr.md_instrument_definition_option);
        packet.emit(hdr.md_instrument_definition_option_events_group);
        packet.emit(hdr.md_instrument_definition_option_feed_types_group_header);
        packet.emit(hdr.md_instrument_definition_option_feed_types_group);
        packet.emit(hdr.md_instrument_definition_option_inst_attrib_group_header);
        packet.emit(hdr.md_instrument_definition_option_inst_attrib_group);
        packet.emit(hdr.md_instrument_definition_option_lot_type_rules_group_header);
        packet.emit(hdr.md_instrument_definition_option_lot_type_rules_group);
        packet.emit(hdr.md_instrument_definition_option_option_underlyings_group_header);
        packet.emit(hdr.md_instrument_definition_option_option_underlyings_group);
        packet.emit(hdr.md_instrument_definition_option_option_related_instruments_group_header);
        packet.emit(hdr.md_instrument_definition_option_option_related_instruments_group);
        packet.emit(hdr.md_instrument_definition_spread);
        packet.emit(hdr.md_instrument_definition_spread_events_group);
        packet.emit(hdr.md_instrument_definition_spread_feed_types_group_header);
        packet.emit(hdr.md_instrument_definition_spread_feed_types_group);
        packet.emit(hdr.md_instrument_definition_spread_inst_attrib_group_header);
        packet.emit(hdr.md_instrument_definition_spread_inst_attrib_group);
        packet.emit(hdr.md_instrument_definition_spread_lot_type_rules_group_header);
        packet.emit(hdr.md_instrument_definition_spread_lot_type_rules_group);
        packet.emit(hdr.md_instrument_definition_spread_legs_group_header);
        packet.emit(hdr.md_instrument_definition_spread_legs_group);
        packet.emit(hdr.md_instrument_definition_fixed_income);
        packet.emit(hdr.md_instrument_definition_fixed_income_events_group);
        packet.emit(hdr.md_instrument_definition_fixed_income_feed_types_group_header);
        packet.emit(hdr.md_instrument_definition_fixed_income_feed_types_group);
        packet.emit(hdr.md_instrument_definition_fixed_income_inst_attrib_group_header);
        packet.emit(hdr.md_instrument_definition_fixed_income_inst_attrib_group);
        packet.emit(hdr.md_instrument_definition_fixed_income_lot_type_rules_group_header);
        packet.emit(hdr.md_instrument_definition_fixed_income_lot_type_rules_group);
        packet.emit(hdr.md_instrument_definition_repo);
        packet.emit(hdr.md_instrument_definition_repo_events_group);
        packet.emit(hdr.md_instrument_definition_repo_feed_types_group_header);
        packet.emit(hdr.md_instrument_definition_repo_feed_types_group);
        packet.emit(hdr.md_instrument_definition_repo_inst_attrib_group_header);
        packet.emit(hdr.md_instrument_definition_repo_inst_attrib_group);
        packet.emit(hdr.md_instrument_definition_repo_lot_type_rules_group_header);
        packet.emit(hdr.md_instrument_definition_repo_lot_type_rules_group);
        packet.emit(hdr.md_instrument_definition_repo_repo_underlyings_group_header);
        packet.emit(hdr.md_instrument_definition_repo_repo_underlyings_group);
        packet.emit(hdr.md_instrument_definition_repo_repo_related_instruments_group_header);
        packet.emit(hdr.md_instrument_definition_repo_repo_related_instruments_group);
        packet.emit(hdr.snapshot_refresh_top_orders);
        packet.emit(hdr.snapshot_refresh_top_orders_snapshot_refresh_top_orders_group);
        packet.emit(hdr.security_status_workup);
        packet.emit(hdr.security_status_workup_security_status_workup_group);
        packet.emit(hdr.snapshot_full_refresh_tcp);
        packet.emit(hdr.snapshot_full_refresh_tcp_snapshot_full_refresh_tcp_group);
        packet.emit(hdr.negotiate);
        packet.emit(hdr.negotiation_reject);
        packet.emit(hdr.negotiation_response);
        packet.emit(hdr.terminate);
        packet.emit(hdr.market_data_request);
        packet.emit(hdr.market_data_request_market_data_request_security_group);
        packet.emit(hdr.market_data_request_market_data_request_related_symbol_group_header);
        packet.emit(hdr.market_data_request_market_data_request_related_symbol_group);
        packet.emit(hdr.request_ack);
        packet.emit(hdr.request_ack_request_ack_security_group);
        packet.emit(hdr.request_ack_request_ack_related_symbol_group_header);
        packet.emit(hdr.request_ack_request_ack_related_symbol_group);
        packet.emit(hdr.request_reject);
        packet.emit(hdr.security_list_request);
        packet.emit(hdr.security_list_request_security_list_request_security_group);
        packet.emit(hdr.security_list_request_security_list_request_related_symbol_group_header);
        packet.emit(hdr.security_list_request_security_list_request_related_symbol_group);
        packet.emit(hdr.security_status_request);
        packet.emit(hdr.security_status_request_security_status_request_security_group);
        packet.emit(hdr.security_status_request_security_status_request_related_symbol_group_header);
        packet.emit(hdr.security_status_request_security_status_request_related_symbol_group);
    }
}

V1Switch(
    CmeGlobexMdp3UdpParser(),
    CmeGlobexMdp3UdpVerifyChecksum(),
    CmeGlobexMdp3UdpIngress(),
    CmeGlobexMdp3UdpEgress(),
    CmeGlobexMdp3UdpComputeChecksum(),
    CmeGlobexMdp3UdpDeparser()
) main;
