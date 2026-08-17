// P4_16 (v1model) definition for: Cme Globex Mdp3 Sbe v1.9
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Market Data Platform 3
//   Encoding: Simple Binary Encoding
//   Version: 1.9
//   Date: 3/08/2018
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
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
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<16> appl_id;
}

header admin_login_t {
    bit<8> heart_bt_int;
}

header admin_logout_t {
    bit<1440> text;
}

header md_instrument_definition_future_legacy_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
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
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
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
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> event_type;
    bit<64> event_time;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<24> md_feed_type;
    bit<8> market_depth;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<1> electronic_match_eligible;
    bit<1> order_cross_eligible;
    bit<1> block_trade_eligible;
    bit<1> efp_eligible;
    bit<1> ebf_eligible;
    bit<1> efs_eligible;
    bit<1> efr_eligible;
    bit<1> otc_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> negative_strike_eligible;
    bit<1> negative_price_outright_eligible;
    bit<1> is_fractional;
    bit<1> volatility_quoted_option;
    bit<1> rfq_cross_eligible;
    bit<1> zero_price_outright_eligible;
    bit<1> decaying_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> implied_matching_eligibility;
    bit<1> triangulation_eligible;
    bit<1> variable_cab_eligible;
    bit<10> reserved_10;
    bit<16> block_length_4;
    bit<8> num_in_group_4;
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_spread_legacy_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
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
    bit<64> min_price_increment;
    bit<64> display_factor;
    bit<8> price_display_format;
    bit<64> price_ratio;
    bit<8> tick_rule;
    bit<240> unit_of_measure;
    bit<64> trading_reference_price;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<32> open_interest_qty;
    bit<32> cleared_volume;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<16> trading_reference_date;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> event_type;
    bit<64> event_time;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<24> md_feed_type;
    bit<8> market_depth;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<1> electronic_match_eligible;
    bit<1> order_cross_eligible;
    bit<1> block_trade_eligible;
    bit<1> efp_eligible;
    bit<1> ebf_eligible;
    bit<1> efs_eligible;
    bit<1> efr_eligible;
    bit<1> otc_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> negative_strike_eligible;
    bit<1> negative_price_outright_eligible;
    bit<1> is_fractional;
    bit<1> volatility_quoted_option;
    bit<1> rfq_cross_eligible;
    bit<1> zero_price_outright_eligible;
    bit<1> decaying_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> implied_matching_eligibility;
    bit<1> triangulation_eligible;
    bit<1> variable_cab_eligible;
    bit<10> reserved_10;
    bit<16> block_length_4;
    bit<8> num_in_group_4;
    bit<8> lot_type;
    bit<32> min_lot_size;
    bit<16> block_length_5;
    bit<8> num_in_group_5;
    bit<32> leg_security_id;
    bit<8> leg_side;
    bit<8> leg_ratio_qty;
    bit<64> leg_price;
    bit<32> leg_option_delta;
}

header security_status_t {
    bit<64> transact_time;
    bit<48> security_group;
    bit<48> asset;
    bit<32> security_id_optional;
    bit<16> trade_date;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<8> security_trading_status;
    bit<8> halt_reason;
    bit<8> security_trading_event;
}

header md_incremental_refresh_book_legacy_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px_optional;
    bit<32> md_entry_size_short_optional;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level;
    bit<8> md_update_action;
    bit<8> md_entry_type_book;
    bit<40> padding_5;
    bit<16> block_length_2;
    bit<40> padding_5_2;
    bit<8> num_in_group_2;
    bit<64> order_id;
    bit<64> md_order_priority;
    bit<32> md_display_qty_optional;
    bit<8> reference_id;
    bit<8> order_update_action;
    bit<16> padding_2_2;
}

header md_incremental_refresh_daily_statistics_legacy_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px_optional;
    bit<32> md_entry_size_short_optional;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<16> trading_reference_date;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<8> md_update_action;
    bit<8> md_entry_type_daily_statistics;
    bit<56> padding_7;
}

header md_incremental_refresh_limits_banding_legacy_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<32> security_id;
    bit<32> rpt_seq;
}

header md_incremental_refresh_session_statistics_legacy_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<8> open_close_settl_flag;
    bit<8> md_update_action;
    bit<8> md_entry_type_statistics;
    bit<32> md_entry_size_short_optional;
    bit<8> padding_1;
}

header md_incremental_refresh_volume_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<32> md_entry_size_short;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<8> md_update_action;
    bit<24> padding_3;
}

header snapshot_full_refresh_legacy_t {
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
    bit<64> md_entry_px_optional;
    bit<32> md_entry_size_short_optional;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level_optional;
    bit<16> trading_reference_date;
    bit<8> open_close_settl_flag;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<8> md_entry_type;
}

header quote_request_t {
    bit<64> transact_time;
    bit<184> quote_req_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<24> padding_3;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<160> symbol;
    bit<32> security_id;
    bit<32> order_qty;
    bit<8> quote_type;
    bit<8> side;
    bit<16> padding_2;
}

header md_instrument_definition_option_legacy_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
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
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<32> cleared_volume;
    bit<32> open_interest_qty;
    bit<64> low_limit_price;
    bit<64> high_limit_price;
    bit<8> user_defined_instrument;
    bit<16> trading_reference_date;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> event_type;
    bit<64> event_time;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<24> md_feed_type;
    bit<8> market_depth;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<1> electronic_match_eligible;
    bit<1> order_cross_eligible;
    bit<1> block_trade_eligible;
    bit<1> efp_eligible;
    bit<1> ebf_eligible;
    bit<1> efs_eligible;
    bit<1> efr_eligible;
    bit<1> otc_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> negative_strike_eligible;
    bit<1> negative_price_outright_eligible;
    bit<1> is_fractional;
    bit<1> volatility_quoted_option;
    bit<1> rfq_cross_eligible;
    bit<1> zero_price_outright_eligible;
    bit<1> decaying_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> implied_matching_eligibility;
    bit<1> triangulation_eligible;
    bit<1> variable_cab_eligible;
    bit<10> reserved_10;
    bit<16> block_length_4;
    bit<8> num_in_group_4;
    bit<8> lot_type;
    bit<32> min_lot_size;
    bit<16> block_length_5;
    bit<8> num_in_group_5;
    bit<32> underlying_security_id;
    bit<160> underlying_symbol;
    bit<16> block_length_6;
    bit<8> num_in_group_6;
    bit<32> related_security_id;
    bit<160> related_symbol;
}

header md_incremental_refresh_trade_summary_legacy_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px;
    bit<32> md_entry_size_short;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<32> number_of_orders_optional;
    bit<8> aggressor_side;
    bit<8> md_update_action;
    bit<32> md_trade_entry_id;
    bit<16> padding_2_2;
    bit<16> block_length_2;
    bit<40> padding_5;
    bit<8> num_in_group_2;
    bit<64> order_id;
    bit<32> last_qty;
    bit<32> padding_4;
}

header md_incremental_refresh_order_book_legacy_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> order_id_optional;
    bit<64> md_order_priority;
    bit<64> md_entry_px_optional;
    bit<32> md_display_qty_optional;
    bit<32> security_id;
    bit<8> md_update_action;
    bit<8> md_entry_type_book;
    bit<48> padding_6;
}

header snapshot_full_refresh_order_book_legacy_t {
    bit<32> last_msg_seq_num_processed;
    bit<32> tot_num_reports;
    bit<32> security_id;
    bit<32> no_chunks;
    bit<32> current_chunk;
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> order_id;
    bit<64> md_order_priority;
    bit<64> md_entry_px;
    bit<32> md_display_qty;
    bit<8> md_entry_type_book;
}

header md_incremental_refresh_book_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level;
    bit<8> md_update_action;
    bit<8> md_entry_type_book;
    bit<40> padding_5;
    bit<16> block_length_2;
    bit<40> padding_5_2;
    bit<8> num_in_group_2;
    bit<64> order_id;
    bit<64> md_order_priority;
    bit<32> md_display_qty_optional;
    bit<8> reference_id;
    bit<8> order_update_action;
    bit<16> padding_2_2;
}

header md_incremental_refresh_order_book_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> order_id_optional;
    bit<64> md_order_priority;
    bit<64> md_entry_px_optional_ex;
    bit<32> md_display_qty_optional;
    bit<32> security_id;
    bit<8> md_update_action;
    bit<8> md_entry_type_book;
    bit<48> padding_6;
}

header md_incremental_refresh_trade_summary_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px_ex;
    bit<32> md_entry_size_short;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<32> number_of_orders;
    bit<8> aggressor_side;
    bit<8> md_update_action;
    bit<32> md_trade_entry_id;
    bit<16> padding_2_2;
    bit<16> block_length_2;
    bit<40> padding_5;
    bit<8> num_in_group_2;
    bit<64> order_id;
    bit<32> last_qty;
    bit<32> padding_4;
}

header md_incremental_refresh_daily_statistics_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<16> trading_reference_date;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<8> md_update_action;
    bit<8> md_entry_type_daily_statistics;
    bit<56> padding_7;
}

header md_incremental_refresh_limits_banding_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> high_limit_price_ex;
    bit<64> low_limit_price_ex;
    bit<64> max_price_variation_ex;
    bit<32> security_id;
    bit<32> rpt_seq;
}

header md_incremental_refresh_session_statistics_t {
    bit<64> transact_time;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
    bit<16> padding_2;
    bit<16> block_length;
    bit<8> num_in_group;
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
    bit<64> high_limit_price_ex;
    bit<64> low_limit_price_ex;
    bit<64> max_price_variation_ex;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_entry_px_optional_ex;
    bit<32> md_entry_size_short_optional;
    bit<32> number_of_orders_optional;
    bit<8> md_price_level_optional;
    bit<16> trading_reference_date;
    bit<8> open_close_settl_flag;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
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
    bit<64> order_id;
    bit<64> md_order_priority;
    bit<64> md_entry_px_ex;
    bit<32> md_display_qty;
    bit<8> md_entry_type_book;
}

header md_instrument_definition_future_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
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
    bit<64> display_factor_ex;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<8> price_display_format;
    bit<240> unit_of_measure;
    bit<64> unit_of_measure_qty_ex;
    bit<64> trading_reference_price_ex;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<32> open_interest_qty;
    bit<32> cleared_volume;
    bit<64> high_limit_price_ex;
    bit<64> low_limit_price_ex;
    bit<64> max_price_variation_ex;
    bit<32> decay_quantity;
    bit<16> decay_start_date;
    bit<32> original_contract_size;
    bit<32> contract_multiplier;
    bit<8> contract_multiplier_unit;
    bit<8> flow_schedule_type;
    bit<64> min_price_increment_amount_ex;
    bit<8> user_defined_instrument;
    bit<16> trading_reference_date;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> event_type;
    bit<64> event_time;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<24> md_feed_type;
    bit<8> market_depth;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<1> electronic_match_eligible;
    bit<1> order_cross_eligible;
    bit<1> block_trade_eligible;
    bit<1> efp_eligible;
    bit<1> ebf_eligible;
    bit<1> efs_eligible;
    bit<1> efr_eligible;
    bit<1> otc_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> negative_strike_eligible;
    bit<1> negative_price_outright_eligible;
    bit<1> is_fractional;
    bit<1> volatility_quoted_option;
    bit<1> rfq_cross_eligible;
    bit<1> zero_price_outright_eligible;
    bit<1> decaying_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> implied_matching_eligibility;
    bit<1> triangulation_eligible;
    bit<1> variable_cab_eligible;
    bit<10> reserved_10;
    bit<16> block_length_4;
    bit<8> num_in_group_4;
    bit<8> lot_type;
    bit<32> min_lot_size;
}

header md_instrument_definition_option_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
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
    bit<64> strike_price_ex;
    bit<24> strike_currency;
    bit<24> settl_currency;
    bit<64> min_cab_price_ex;
    bit<8> match_algorithm;
    bit<32> min_trade_vol;
    bit<32> max_trade_vol;
    bit<64> min_price_increment_optional;
    bit<64> min_price_increment_amount_ex;
    bit<64> display_factor_ex;
    bit<8> tick_rule;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<8> price_display_format;
    bit<240> unit_of_measure;
    bit<64> unit_of_measure_qty_ex;
    bit<64> trading_reference_price_ex;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<32> cleared_volume;
    bit<32> open_interest_qty;
    bit<64> low_limit_price_ex;
    bit<64> high_limit_price_ex;
    bit<8> user_defined_instrument;
    bit<16> trading_reference_date;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> event_type;
    bit<64> event_time;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<24> md_feed_type;
    bit<8> market_depth;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<1> electronic_match_eligible;
    bit<1> order_cross_eligible;
    bit<1> block_trade_eligible;
    bit<1> efp_eligible;
    bit<1> ebf_eligible;
    bit<1> efs_eligible;
    bit<1> efr_eligible;
    bit<1> otc_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> negative_strike_eligible;
    bit<1> negative_price_outright_eligible;
    bit<1> is_fractional;
    bit<1> volatility_quoted_option;
    bit<1> rfq_cross_eligible;
    bit<1> zero_price_outright_eligible;
    bit<1> decaying_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> implied_matching_eligibility;
    bit<1> triangulation_eligible;
    bit<1> variable_cab_eligible;
    bit<10> reserved_10;
    bit<16> block_length_4;
    bit<8> num_in_group_4;
    bit<8> lot_type;
    bit<32> min_lot_size;
    bit<16> block_length_5;
    bit<8> num_in_group_5;
    bit<32> underlying_security_id;
    bit<160> underlying_symbol;
    bit<16> block_length_6;
    bit<8> num_in_group_6;
    bit<32> related_security_id;
    bit<160> related_symbol;
}

header md_instrument_definition_spread_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> reserved;
    bit<1> end_of_event;
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
    bit<64> display_factor_ex;
    bit<8> price_display_format;
    bit<64> price_ratio_ex;
    bit<8> tick_rule;
    bit<240> unit_of_measure;
    bit<64> trading_reference_price_ex;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<32> open_interest_qty;
    bit<32> cleared_volume;
    bit<64> high_limit_price_ex;
    bit<64> low_limit_price_ex;
    bit<64> max_price_variation_ex;
    bit<8> main_fraction;
    bit<8> sub_fraction;
    bit<16> trading_reference_date;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> event_type;
    bit<64> event_time;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<24> md_feed_type;
    bit<8> market_depth;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<1> electronic_match_eligible;
    bit<1> order_cross_eligible;
    bit<1> block_trade_eligible;
    bit<1> efp_eligible;
    bit<1> ebf_eligible;
    bit<1> efs_eligible;
    bit<1> efr_eligible;
    bit<1> otc_eligible;
    bit<1> ilink_indicative_mass_quoting_eligible;
    bit<1> negative_strike_eligible;
    bit<1> negative_price_outright_eligible;
    bit<1> is_fractional;
    bit<1> volatility_quoted_option;
    bit<1> rfq_cross_eligible;
    bit<1> zero_price_outright_eligible;
    bit<1> decaying_product_eligibility;
    bit<1> variable_product_eligibility;
    bit<1> daily_product_eligibility;
    bit<1> gt_orders_eligibility;
    bit<1> implied_matching_eligibility;
    bit<1> triangulation_eligible;
    bit<1> variable_cab_eligible;
    bit<10> reserved_10;
    bit<16> block_length_4;
    bit<8> num_in_group_4;
    bit<8> lot_type;
    bit<32> min_lot_size;
    bit<16> block_length_5;
    bit<8> num_in_group_5;
    bit<32> leg_security_id;
    bit<8> leg_side;
    bit<8> leg_ratio_qty;
    bit<64> leg_price_ex;
    bit<32> leg_option_delta;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    channel_reset_t channel_reset;
    admin_login_t admin_login;
    admin_logout_t admin_logout;
    md_instrument_definition_future_legacy_t md_instrument_definition_future_legacy;
    md_instrument_definition_spread_legacy_t md_instrument_definition_spread_legacy;
    security_status_t security_status;
    md_incremental_refresh_book_legacy_t md_incremental_refresh_book_legacy;
    md_incremental_refresh_daily_statistics_legacy_t md_incremental_refresh_daily_statistics_legacy;
    md_incremental_refresh_limits_banding_legacy_t md_incremental_refresh_limits_banding_legacy;
    md_incremental_refresh_session_statistics_legacy_t md_incremental_refresh_session_statistics_legacy;
    md_incremental_refresh_volume_t md_incremental_refresh_volume;
    snapshot_full_refresh_legacy_t snapshot_full_refresh_legacy;
    quote_request_t quote_request;
    md_instrument_definition_option_legacy_t md_instrument_definition_option_legacy;
    md_incremental_refresh_trade_summary_legacy_t md_incremental_refresh_trade_summary_legacy;
    md_incremental_refresh_order_book_legacy_t md_incremental_refresh_order_book_legacy;
    snapshot_full_refresh_order_book_legacy_t snapshot_full_refresh_order_book_legacy;
    md_incremental_refresh_book_t md_incremental_refresh_book;
    md_incremental_refresh_order_book_t md_incremental_refresh_order_book;
    md_incremental_refresh_trade_summary_t md_incremental_refresh_trade_summary;
    md_incremental_refresh_daily_statistics_t md_incremental_refresh_daily_statistics;
    md_incremental_refresh_limits_banding_t md_incremental_refresh_limits_banding;
    md_incremental_refresh_session_statistics_t md_incremental_refresh_session_statistics;
    snapshot_full_refresh_t snapshot_full_refresh;
    snapshot_full_refresh_order_book_t snapshot_full_refresh_order_book;
    md_instrument_definition_future_t md_instrument_definition_future;
    md_instrument_definition_option_t md_instrument_definition_option;
    md_instrument_definition_spread_t md_instrument_definition_spread;
}

parser CmeGlobexMdp3UdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w4: parse_channel_reset;
            16w15: parse_admin_login;
            16w16: parse_admin_logout;
            16w27: parse_md_instrument_definition_future_legacy;
            16w29: parse_md_instrument_definition_spread_legacy;
            16w30: parse_security_status;
            16w32: parse_md_incremental_refresh_book_legacy;
            16w33: parse_md_incremental_refresh_daily_statistics_legacy;
            16w34: parse_md_incremental_refresh_limits_banding_legacy;
            16w35: parse_md_incremental_refresh_session_statistics_legacy;
            16w37: parse_md_incremental_refresh_volume;
            16w38: parse_snapshot_full_refresh_legacy;
            16w39: parse_quote_request;
            16w41: parse_md_instrument_definition_option_legacy;
            16w42: parse_md_incremental_refresh_trade_summary_legacy;
            16w43: parse_md_incremental_refresh_order_book_legacy;
            16w44: parse_snapshot_full_refresh_order_book_legacy;
            16w46: parse_md_incremental_refresh_book;
            16w47: parse_md_incremental_refresh_order_book;
            16w48: parse_md_incremental_refresh_trade_summary;
            16w49: parse_md_incremental_refresh_daily_statistics;
            16w50: parse_md_incremental_refresh_limits_banding;
            16w51: parse_md_incremental_refresh_session_statistics;
            16w52: parse_snapshot_full_refresh;
            16w53: parse_snapshot_full_refresh_order_book;
            16w54: parse_md_instrument_definition_future;
            16w55: parse_md_instrument_definition_option;
            16w56: parse_md_instrument_definition_spread;
            default: accept;
        }
    }

    state parse_channel_reset {
        packet.extract(hdr.channel_reset);
        transition accept;
    }

    state parse_admin_login {
        packet.extract(hdr.admin_login);
        transition accept;
    }

    state parse_admin_logout {
        packet.extract(hdr.admin_logout);
        transition accept;
    }

    state parse_md_instrument_definition_future_legacy {
        packet.extract(hdr.md_instrument_definition_future_legacy);
        transition accept;
    }

    state parse_md_instrument_definition_spread_legacy {
        packet.extract(hdr.md_instrument_definition_spread_legacy);
        transition accept;
    }

    state parse_security_status {
        packet.extract(hdr.security_status);
        transition accept;
    }

    state parse_md_incremental_refresh_book_legacy {
        packet.extract(hdr.md_incremental_refresh_book_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_daily_statistics_legacy {
        packet.extract(hdr.md_incremental_refresh_daily_statistics_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_limits_banding_legacy {
        packet.extract(hdr.md_incremental_refresh_limits_banding_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_session_statistics_legacy {
        packet.extract(hdr.md_incremental_refresh_session_statistics_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_volume {
        packet.extract(hdr.md_incremental_refresh_volume);
        transition accept;
    }

    state parse_snapshot_full_refresh_legacy {
        packet.extract(hdr.snapshot_full_refresh_legacy);
        transition accept;
    }

    state parse_quote_request {
        packet.extract(hdr.quote_request);
        transition accept;
    }

    state parse_md_instrument_definition_option_legacy {
        packet.extract(hdr.md_instrument_definition_option_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_trade_summary_legacy {
        packet.extract(hdr.md_incremental_refresh_trade_summary_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_order_book_legacy {
        packet.extract(hdr.md_incremental_refresh_order_book_legacy);
        transition accept;
    }

    state parse_snapshot_full_refresh_order_book_legacy {
        packet.extract(hdr.snapshot_full_refresh_order_book_legacy);
        transition accept;
    }

    state parse_md_incremental_refresh_book {
        packet.extract(hdr.md_incremental_refresh_book);
        transition accept;
    }

    state parse_md_incremental_refresh_order_book {
        packet.extract(hdr.md_incremental_refresh_order_book);
        transition accept;
    }

    state parse_md_incremental_refresh_trade_summary {
        packet.extract(hdr.md_incremental_refresh_trade_summary);
        transition accept;
    }

    state parse_md_incremental_refresh_daily_statistics {
        packet.extract(hdr.md_incremental_refresh_daily_statistics);
        transition accept;
    }

    state parse_md_incremental_refresh_limits_banding {
        packet.extract(hdr.md_incremental_refresh_limits_banding);
        transition accept;
    }

    state parse_md_incremental_refresh_session_statistics {
        packet.extract(hdr.md_incremental_refresh_session_statistics);
        transition accept;
    }

    state parse_snapshot_full_refresh {
        packet.extract(hdr.snapshot_full_refresh);
        transition accept;
    }

    state parse_snapshot_full_refresh_order_book {
        packet.extract(hdr.snapshot_full_refresh_order_book);
        transition accept;
    }

    state parse_md_instrument_definition_future {
        packet.extract(hdr.md_instrument_definition_future);
        transition accept;
    }

    state parse_md_instrument_definition_option {
        packet.extract(hdr.md_instrument_definition_option);
        transition accept;
    }

    state parse_md_instrument_definition_spread {
        packet.extract(hdr.md_instrument_definition_spread);
        transition accept;
    }

}

control CmeGlobexMdp3UdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexMdp3UdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
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
        packet.emit(hdr.message_header);
        packet.emit(hdr.channel_reset);
        packet.emit(hdr.admin_login);
        packet.emit(hdr.admin_logout);
        packet.emit(hdr.md_instrument_definition_future_legacy);
        packet.emit(hdr.md_instrument_definition_spread_legacy);
        packet.emit(hdr.security_status);
        packet.emit(hdr.md_incremental_refresh_book_legacy);
        packet.emit(hdr.md_incremental_refresh_daily_statistics_legacy);
        packet.emit(hdr.md_incremental_refresh_limits_banding_legacy);
        packet.emit(hdr.md_incremental_refresh_session_statistics_legacy);
        packet.emit(hdr.md_incremental_refresh_volume);
        packet.emit(hdr.snapshot_full_refresh_legacy);
        packet.emit(hdr.quote_request);
        packet.emit(hdr.md_instrument_definition_option_legacy);
        packet.emit(hdr.md_incremental_refresh_trade_summary_legacy);
        packet.emit(hdr.md_incremental_refresh_order_book_legacy);
        packet.emit(hdr.snapshot_full_refresh_order_book_legacy);
        packet.emit(hdr.md_incremental_refresh_book);
        packet.emit(hdr.md_incremental_refresh_order_book);
        packet.emit(hdr.md_incremental_refresh_trade_summary);
        packet.emit(hdr.md_incremental_refresh_daily_statistics);
        packet.emit(hdr.md_incremental_refresh_limits_banding);
        packet.emit(hdr.md_incremental_refresh_session_statistics);
        packet.emit(hdr.snapshot_full_refresh);
        packet.emit(hdr.snapshot_full_refresh_order_book);
        packet.emit(hdr.md_instrument_definition_future);
        packet.emit(hdr.md_instrument_definition_option);
        packet.emit(hdr.md_instrument_definition_spread);
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
