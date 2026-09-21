// P4_16 (v1model) definition for: Ice IceFutures Mdf iMpact v1.1.43
// 
// Protocol:
//   Organization: Intercontinental Exchange
//   Protocol: Multicast Data Feed
//   Encoding: Ice iMpact Binary Encoding
//   Version: 1.1.43
//   Date: 11/18/2020
//   Specification: ICE_iMpact_Multicast_Feed_Message_Spec_1.1.43.pdf
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

header packet_header_t {
    bit<16> session;
    bit<32> sequence;
    bit<16> number_of_msgs;
    bit<64> sent_date_time;
}

header packet_header_message_t {
    bit<8> message_type;
    bit<16> length;
}

header market_snapshot_message_t {
    bit<32> market_id;
    bit<16> market_type;
    bit<8> trading_status;
    bit<32> volume;
    bit<32> block_volume;
    bit<32> efs_volume;
    bit<32> efp_volume;
    bit<32> open_interest;
    bit<64> opening_price;
    bit<64> settlement_price_with_deal_price_precision;
    bit<64> high;
    bit<64> low;
    bit<64> vwap;
    bit<32> num_of_book_entries;
    bit<64> last_trade_price;
    bit<32> last_trade_quantity;
    bit<64> last_trade_date_time;
    bit<64> settle_price_date_time;
    bit<32> last_message_sequence_id;
    bit<16> reserved_2;
    bit<80> open_interest_date;
    bit<8> is_settle_price_official;
    bit<64> settlement_price;
    bit<8> has_previous_day_settlement_price;
    bit<64> previous_day_settlement_price;
}

header trade_message_t {
    bit<32> market_id;
    bit<64> trade_id;
    bit<8> is_system_priced_leg;
    bit<64> price;
    bit<32> quantity;
    bit<8> old_off_market_trade_type;
    bit<64> transact_date_time;
    bit<8> system_priced_leg_type;
    bit<8> is_implied_spread_at_market_open;
    bit<8> is_adjusted_trade;
    bit<8> aggressor_side;
    bit<4> unused_4;
    bit<1> is_vertical_split;
    bit<1> is_implied_order;
    bit<1> is_leg_deal_outside_ipl;
    bit<1> is_rfc_crossing;
    bit<24> off_market_trade_type;
    bit<32> sequence_within_millis;
    bit<64> request_trading_engine_received_timestamp;
}

header spot_market_trade_message_t {
    bit<32> market_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> quantity;
    bit<64> transact_date_time;
    bit<8> extra_flags;
    bit<64> delivery_begin_date_time;
    bit<64> delivery_end_date_time;
    bit<8> is_system_priced_leg;
}

header investigated_trade_message_t {
    bit<32> market_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> quantity;
    bit<8> off_market_trade_indicator;
    bit<64> message_date_time;
    bit<8> investigation_status;
    bit<24> off_market_trade_type;
}

header cancelled_trade_message_t {
    bit<32> market_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> quantity;
    bit<8> old_off_market_trade_type;
    bit<64> message_date_time;
    bit<24> off_market_trade_type;
}

header market_statistics_message_t {
    bit<32> market_id;
    bit<32> volume;
    bit<32> block_volume;
    bit<32> efs_volume;
    bit<32> efp_volume;
    bit<64> high;
    bit<64> low;
    bit<64> vwap;
    bit<64> message_date_time;
}

header market_state_change_message_t {
    bit<32> market_id;
    bit<8> trading_status;
    bit<64> message_date_time;
}

header system_text_message_t {
    bit<1600> text_message;
    bit<64> message_date_time;
    bit<2048> text_message_extra_fld_chunk0;
    bit<2048> text_message_extra_fld_chunk1;
    bit<2048> text_message_extra_fld_chunk2;
    bit<256> text_message_extra_fld_chunk3;
}

header open_interest_message_t {
    bit<32> market_id;
    bit<32> open_interest;
    bit<32> open_interest_change;
    bit<64> message_date_time;
    bit<80> open_interest_date;
}

header open_price_message_t {
    bit<32> market_id;
    bit<64> open_price;
    bit<64> message_date_time;
}

header close_price_message_t {
    bit<32> market_id;
    bit<64> close_price;
    bit<64> message_date_time;
}

header settlement_price_message_t {
    bit<32> market_id;
    bit<64> settlement_price_with_deal_price_precision;
    bit<64> message_date_time;
    bit<8> is_official;
    bit<64> valuation_date_time;
    bit<64> settlement_price;
}

header index_prices_message_t {
    bit<32> market_id;
    bit<64> price;
    bit<240> short_name;
    bit<64> published_date_time;
    bit<80> valuation_date_applying_date;
    bit<8> status;
    bit<16> reserved_2;
    bit<8> index_price_denominator;
}

header end_of_day_market_summary_message_t {
    bit<32> market_id;
    bit<32> volume;
    bit<32> block_volume;
    bit<32> efs_volume;
    bit<32> efp_volume;
    bit<64> opening_price;
    bit<64> high;
    bit<64> low;
    bit<64> vwap;
    bit<64> settlement_price_with_deal_price_precision;
    bit<32> open_interest;
    bit<64> message_date_time;
    bit<64> settlement_price;
}

header market_event_message_t {
    bit<32> market_id;
    bit<8> event_type;
    bit<64> message_date_time;
}

header pre_open_price_indicator_message_t {
    bit<32> market_id;
    bit<64> pre_open_price;
    bit<64> message_date_time;
    bit<8> has_pre_open_volume;
    bit<32> pre_open_volume;
}

header strip_info_message_t {
    bit<16> old_strip_id;
    bit<160> strip_type;
    bit<16> begin_year;
    bit<16> begin_month;
    bit<16> begin_day;
    bit<16> end_year;
    bit<16> end_month;
    bit<16> end_day;
    bit<400> strip_info;
    bit<32> strip_id;
}

header interval_price_limit_notification_message_t {
    bit<32> market_id;
    bit<8> ipl_hold_type;
    bit<64> notification_date_time;
    bit<8> is_up;
    bit<32> ipl_hold_duration;
    bit<64> ipl_up;
    bit<64> ipl_down;
}

header new_futures_strategy_definition_message_t {
    bit<32> market_id;
    bit<560> futures_contract_symbol;
    bit<8> trading_status;
    bit<8> order_price_denominator;
    bit<32> increment_price;
    bit<32> increment_qty;
    bit<32> min_qty;
    bit<8> number_of_leg_definitions;
}

header new_futures_strategy_definition_message_leg_definition_t {
    bit<8> leg_body_length;
    bit<32> leg_market_id;
    bit<16> leg_ratio_obsolete;
    bit<8> leg_side;
    bit<16> leg_strategy_code;
    bit<32> leg_ratio_qty_numerator;
    bit<32> leg_ratio_qty_denominator;
    bit<32> leg_ratio_price_numerator;
    bit<32> leg_ratio_price_denominator;
}

header new_futures_strategy_definition_message_extra_leg_definition_header_t {
    bit<16> security_sub_type;
    bit<8> is_block_only;
    bit<144> strategy_symbol;
    bit<8> gt_allowed;
    bit<32> reserved_4;
    bit<8> mifid_regulated_market;
    bit<960> market_desc;
    bit<16> maturity_year;
    bit<16> maturity_month;
    bit<16> maturity_day;
    bit<8> deal_price_denominator;
    bit<32> unit_quantity;
    bit<8> num_decimals_options_price;
    bit<8> allow_options;
    bit<120> cleared_alias;
    bit<8> allows_implied;
    bit<64> min_price;
    bit<64> max_price;
    bit<496> product_name;
    bit<640> hub_alias;
    bit<312> strip_name;
    bit<8> is_tradable;
    bit<8> settle_price_denominator;
    bit<32> mic_code;
    bit<8> unit_qty_denominator;
    bit<8> hedge_only;
    bit<8> exchange_silo;
    bit<8> off_exchange_increment_qty_denominator;
    bit<32> off_exchange_increment_qty;
    bit<32> off_exchange_increment_price;
    bit<32> off_exchange_increment_option_price;
    bit<32> product_id;
    bit<32> hub_id;
    bit<32> strip_id;
    bit<96> underlying_isin;
    bit<8> test_market_indicator;
    bit<8> leg_deal_suppressed;
    bit<16> old_num_of_cycles;
    bit<16> market_type_id;
    bit<8> override_block_min;
    bit<8> number_of_extra_leg_definitions;
}

header new_futures_strategy_definition_message_extra_leg_definition_t {
    bit<8> leg_body_length;
    bit<32> leg_market_id;
    bit<16> reserved_2;
    bit<8> leg_side;
    bit<16> leg_strategy_code;
    bit<32> leg_ratio_qty_numerator;
    bit<32> leg_ratio_qty_denominator;
    bit<32> leg_ratio_price_numerator;
    bit<32> leg_ratio_price_denominator;
}

header new_expiry_message_t {
    bit<32> market_id;
    bit<16> market_type_id;
    bit<8> order_price_denominator;
    bit<32> increment_price;
    bit<32> increment_qty;
    bit<32> lot_size;
    bit<960> market_desc;
    bit<16> maturity_year;
    bit<16> maturity_month;
    bit<16> maturity_day;
    bit<8> deal_price_denominator;
    bit<32> min_qty;
    bit<32> unit_quantity;
    bit<160> currency;
    bit<120> cleared_alias;
    bit<64> min_price;
    bit<64> max_price;
    bit<32> product_id;
    bit<496> product_name;
    bit<32> hub_id;
    bit<640> hub_alias;
    bit<32> strip_id;
    bit<312> strip_name;
    bit<8> settle_price_denominator;
    bit<32> mic_code;
    bit<8> unit_qty_denominator;
    bit<8> off_exchange_increment_qty_denominator;
    bit<32> off_exchange_increment_qty;
    bit<32> off_exchange_increment_price;
    bit<32> off_exchange_increment_option_price;
    bit<280> contract_symbol;
    bit<96> isin;
    bit<8> num_decimals_options_price;
    bit<32> hedge_market_id;
    bit<8> settlement_type;
    bit<8> gt_allowed;
    bit<8> cross_order_supported;
    bit<240> unit_of_measure;
    bit<8> mifid_regulated_market;
    bit<16> screen_last_trade_year;
    bit<16> screen_last_trade_month;
    bit<16> screen_last_trade_day;
    bit<16> old_num_of_cycles;
    bit<32> num_of_cycles;
}

header special_field_message_t {
    bit<8> number_of_special_fields;
}

header special_field_message_special_field_t {
    bit<8> special_field_id;
    bit<16> special_field_length;
}

header fragment_wrapper_message_t {
    bit<16> total_length;
    bit<16> fragment_offset;
    bit<16> fragment_length;
    bit<72> fragment_bytes;
}

header market_snapshot_order_message_t {
    bit<32> market_id;
    bit<64> order_id;
    bit<16> order_sequence_id;
    bit<8> side;
    bit<64> price;
    bit<32> quantity;
    bit<8> is_implied;
    bit<8> is_rfq;
    bit<64> order_entry_date_time;
    bit<32> sequence_within_millis;
}

header add_or_modify_order_message_t {
    bit<32> market_id;
    bit<64> order_id;
    bit<16> order_sequence_id;
    bit<8> side;
    bit<64> price;
    bit<32> quantity;
    bit<8> is_implied;
    bit<8> is_rfq;
    bit<64> order_entry_date_time;
    bit<8> extra_flags;
    bit<32> sequence_within_millis;
    bit<64> modification_timestamp;
    bit<64> request_trading_engine_received_timestamp;
}

header delete_order_message_t {
    bit<32> market_id;
    bit<64> order_id;
    bit<64> message_date_time;
    bit<32> sequence_within_millis;
    bit<64> request_trading_engine_received_timestamp;
}

header message_bundle_marker_t {
    bit<8> start_or_end;
    bit<64> trade_transaction_id;
    bit<8> is_transaction_end;
}

header fixing_transition_message_t {
    bit<32> market_id;
    bit<8> fixing_status;
    bit<64> auction_end_time;
    bit<32> threshold_imbalance_qty;
    bit<64> message_date_time;
}

header fixing_lockdown_message_t {
    bit<32> market_id;
    bit<80> auction_date;
    bit<64> message_date_time;
    bit<160> description;
    bit<16> round;
    bit<32> agg_bid_qty;
    bit<32> agg_offer_qty;
    bit<64> usd_price;
    bit<8> is_balanced;
    bit<8> is_final;
    bit<64> gbp_price;
    bit<64> eur_price;
}

header fixing_indicative_price_message_t {
    bit<32> market_id;
    bit<24> iba_currency;
    bit<64> price;
    bit<64> price_in_gram;
    bit<8> num_decimals_price;
    bit<8> num_decimals_price_in_gram;
}

header market_snapshot_price_level_message_t {
    bit<32> market_id;
    bit<8> side;
    bit<8> price_level_position;
    bit<64> price;
    bit<32> quantity;
    bit<16> order_count;
    bit<32> implied_quantity;
    bit<16> implied_order_count;
}

header add_price_level_message_t {
    bit<32> market_id;
    bit<8> side;
    bit<8> price_level_position;
    bit<64> price;
    bit<32> quantity;
    bit<16> order_count;
    bit<32> implied_quantity;
    bit<16> implied_order_count;
    bit<64> timestamp;
}

header change_price_level_message_t {
    bit<32> market_id;
    bit<8> side;
    bit<8> price_level_position;
    bit<64> price;
    bit<32> quantity;
    bit<16> order_count;
    bit<32> implied_quantity;
    bit<16> implied_order_count;
    bit<64> timestamp;
}

header delete_price_level_message_t {
    bit<32> market_id;
    bit<8> side;
    bit<8> price_level_position;
    bit<64> timestamp;
}

header new_options_strategy_definition_message_t {
    bit<32> market_id;
    bit<32> underlying_market_id;
    bit<280> contract_symbol;
    bit<8> trading_status;
    bit<8> order_price_denominator;
    bit<32> increment_price;
    bit<32> increment_qty;
    bit<32> min_qty;
    bit<8> number_of_strategy_leg_definitions;
}

header new_options_strategy_definition_message_strategy_leg_definition_t {
    bit<8> leg_body_length;
    bit<32> leg_market_id;
    bit<32> leg_underlying_market_id;
    bit<16> leg_ratio_obsolete;
    bit<8> leg_side;
    bit<16> leg_strategy_code;
    bit<32> leg_ratio_qty_numerator;
    bit<32> leg_ratio_qty_denominator;
    bit<32> leg_ratio_price_numerator;
    bit<32> leg_ratio_price_denominator;
}

header new_options_strategy_definition_message_hedge_definition_header_t {
    bit<8> number_of_hedge_definitions;
}

header new_options_strategy_definition_message_hedge_definition_t {
    bit<8> hedge_body_length;
    bit<32> hedge_market_id;
    bit<8> hedge_security_type;
    bit<8> hedge_side;
    bit<64> hedge_price;
    bit<8> hedge_price_denominator;
    bit<16> hedge_delta_obsolete;
    bit<16> hedge_strategy_code;
    bit<32> hedge_delta;
}

header new_options_strategy_definition_message_extra_strategy_leg_definition_header_t {
    bit<16> security_sub_type;
    bit<8> is_block_only;
    bit<144> strategy_symbol;
    bit<8> gt_allowed;
    bit<8> mifid_regulated_market;
    bit<8> deal_price_denominator;
    bit<8> settle_price_denominator;
    bit<8> unit_qty_denominator;
    bit<8> test_market_indicator;
    bit<280> contract_symbol_extra;
    bit<8> leg_deal_suppressed;
    bit<8> is_tradable;
    bit<16> old_num_of_cycles;
    bit<16> options_expiration_year;
    bit<16> options_expiration_month;
    bit<16> options_expiration_day;
    bit<16> market_type_id;
    bit<8> override_block_min;
    bit<8> number_of_extra_strategy_leg_definitions;
}

header new_options_strategy_definition_message_extra_strategy_leg_definition_t {
    bit<8> leg_body_length;
    bit<32> leg_market_id;
    bit<32> leg_underlying_market_id;
    bit<16> reserved_2;
    bit<8> leg_side;
    bit<16> leg_strategy_code;
    bit<32> leg_ratio_qty_numerator;
    bit<32> leg_ratio_qty_denominator;
    bit<32> leg_ratio_price_numerator;
    bit<32> leg_ratio_price_denominator;
}

header new_options_market_definition_message_t {
    bit<32> market_id;
    bit<32> underlying_market_id;
    bit<560> futures_contract_symbol;
    bit<8> trading_status;
    bit<8> order_price_denominator;
    bit<32> increment_qty;
    bit<32> lot_size;
    bit<960> market_desc;
    bit<8> option_type;
    bit<64> strike_price;
    bit<8> deal_price_denominator;
    bit<32> min_qty;
    bit<160> currency;
    bit<8> num_decimals_strike_price;
    bit<64> min_options_price;
    bit<64> max_options_price;
    bit<32> increment_premium_price;
    bit<16> options_expiration_year;
    bit<16> options_expiration_month;
    bit<16> options_expiration_day;
    bit<8> options_style;
    bit<8> options_expiration_type;
    bit<32> hedge_market_id;
    bit<8> settle_price_denominator;
    bit<8> unit_qty_denominator;
    bit<64> tick_value;
    bit<8> flex_allowed;
    bit<8> settlement_type;
    bit<8> is_block_only;
    bit<8> gt_allowed;
    bit<8> cross_order_supported;
    bit<8> guaranteed_cross_supported;
    bit<240> unit_of_measure;
    bit<8> mifid_regulated_market;
    bit<16> screen_last_trade_year;
    bit<16> screen_last_trade_month;
    bit<16> screen_last_trade_day;
    bit<8> is_tradable;
    bit<16> old_num_of_cycles;
    bit<16> market_type_id;
    bit<32> num_of_cycles;
}

header rfq_message_t {
    bit<32> market_id;
    bit<64> message_timestamp;
    bit<64> rfq_system_id;
    bit<16> market_type_id;
    bit<32> underlying_market_id;
    bit<32> quantity;
    bit<8> side;
}

header option_open_interest_message_t {
    bit<32> market_id;
    bit<32> open_interest;
    bit<64> message_date_time;
    bit<80> open_interest_date;
}

header option_settlement_price_message_t {
    bit<32> market_id;
    bit<64> settlement_price_with_deal_price_precision;
    bit<64> message_date_time;
    bit<8> is_official;
    bit<64> valuation_date_time;
    bit<64> volatility;
    bit<64> settlement_price;
    bit<64> delta;
}

header old_style_options_trade_and_market_stats_message_t {
    bit<32> underlying_market_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> quantity;
    bit<8> old_off_market_trade_type;
    bit<64> transact_date_time;
    bit<8> option_type;
    bit<64> strike_price;
    bit<8> event_code;
    bit<32> total_volume;
    bit<32> block_volume;
    bit<32> efs_volume;
    bit<32> efp_volume;
    bit<64> high;
    bit<64> low;
    bit<64> vwap;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> new_futures_strategy_definition_message_leg_definition_remaining;
    bit<8> new_futures_strategy_definition_message_extra_leg_definition_remaining;
    bit<8> new_options_strategy_definition_message_strategy_leg_definition_remaining;
    bit<8> new_options_strategy_definition_message_hedge_definition_remaining;
    bit<8> new_options_strategy_definition_message_extra_strategy_leg_definition_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    market_snapshot_message_t market_snapshot_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    spot_market_trade_message_t spot_market_trade_message[MAX_MESSAGES];
    investigated_trade_message_t investigated_trade_message[MAX_MESSAGES];
    cancelled_trade_message_t cancelled_trade_message[MAX_MESSAGES];
    market_statistics_message_t market_statistics_message[MAX_MESSAGES];
    market_state_change_message_t market_state_change_message[MAX_MESSAGES];
    system_text_message_t system_text_message[MAX_MESSAGES];
    open_interest_message_t open_interest_message[MAX_MESSAGES];
    open_price_message_t open_price_message[MAX_MESSAGES];
    close_price_message_t close_price_message[MAX_MESSAGES];
    settlement_price_message_t settlement_price_message[MAX_MESSAGES];
    index_prices_message_t index_prices_message[MAX_MESSAGES];
    end_of_day_market_summary_message_t end_of_day_market_summary_message[MAX_MESSAGES];
    market_event_message_t market_event_message[MAX_MESSAGES];
    pre_open_price_indicator_message_t pre_open_price_indicator_message[MAX_MESSAGES];
    strip_info_message_t strip_info_message[MAX_MESSAGES];
    interval_price_limit_notification_message_t interval_price_limit_notification_message[MAX_MESSAGES];
    new_futures_strategy_definition_message_t new_futures_strategy_definition_message[MAX_MESSAGES];
    new_futures_strategy_definition_message_leg_definition_t new_futures_strategy_definition_message_leg_definition[MAX_MESSAGES];
    new_futures_strategy_definition_message_extra_leg_definition_header_t new_futures_strategy_definition_message_extra_leg_definition_header;
    new_futures_strategy_definition_message_extra_leg_definition_t new_futures_strategy_definition_message_extra_leg_definition[MAX_MESSAGES];
    new_expiry_message_t new_expiry_message[MAX_MESSAGES];
    special_field_message_t special_field_message[MAX_MESSAGES];
    special_field_message_special_field_t special_field_message_special_field[MAX_MESSAGES];
    fragment_wrapper_message_t fragment_wrapper_message[MAX_MESSAGES];
    market_snapshot_order_message_t market_snapshot_order_message[MAX_MESSAGES];
    add_or_modify_order_message_t add_or_modify_order_message[MAX_MESSAGES];
    delete_order_message_t delete_order_message[MAX_MESSAGES];
    message_bundle_marker_t message_bundle_marker[MAX_MESSAGES];
    fixing_transition_message_t fixing_transition_message[MAX_MESSAGES];
    fixing_lockdown_message_t fixing_lockdown_message[MAX_MESSAGES];
    fixing_indicative_price_message_t fixing_indicative_price_message[MAX_MESSAGES];
    market_snapshot_price_level_message_t market_snapshot_price_level_message[MAX_MESSAGES];
    add_price_level_message_t add_price_level_message[MAX_MESSAGES];
    change_price_level_message_t change_price_level_message[MAX_MESSAGES];
    delete_price_level_message_t delete_price_level_message[MAX_MESSAGES];
    new_options_strategy_definition_message_t new_options_strategy_definition_message[MAX_MESSAGES];
    new_options_strategy_definition_message_strategy_leg_definition_t new_options_strategy_definition_message_strategy_leg_definition[MAX_MESSAGES];
    new_options_strategy_definition_message_hedge_definition_header_t new_options_strategy_definition_message_hedge_definition_header;
    new_options_strategy_definition_message_hedge_definition_t new_options_strategy_definition_message_hedge_definition[MAX_MESSAGES];
    new_options_strategy_definition_message_extra_strategy_leg_definition_header_t new_options_strategy_definition_message_extra_strategy_leg_definition_header;
    new_options_strategy_definition_message_extra_strategy_leg_definition_t new_options_strategy_definition_message_extra_strategy_leg_definition[MAX_MESSAGES];
    new_options_market_definition_message_t new_options_market_definition_message[MAX_MESSAGES];
    rfq_message_t rfq_message[MAX_MESSAGES];
    option_open_interest_message_t option_open_interest_message[MAX_MESSAGES];
    option_settlement_price_message_t option_settlement_price_message[MAX_MESSAGES];
    old_style_options_trade_and_market_stats_message_t old_style_options_trade_and_market_stats_message[MAX_MESSAGES];
}

parser IcefuturesMdfParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.number_of_msgs) {
            16w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.message_type) {
            8w0x43: parse_market_snapshot_message;
            8w0x47: parse_trade_message;
            8w0x59: parse_spot_market_trade_message;
            8w0x48: parse_investigated_trade_message;
            8w0x49: parse_cancelled_trade_message;
            8w0x4a: parse_market_statistics_message;
            8w0x4b: parse_market_state_change_message;
            8w0x4c: parse_system_text_message;
            8w0x4d: parse_open_interest_message;
            8w0x4e: parse_open_price_message;
            8w0x63: parse_close_price_message;
            8w0x4f: parse_settlement_price_message;
            8w0x7a: parse_index_prices_message;
            8w0x75: parse_end_of_day_market_summary_message;
            8w0x66: parse_market_event_message;
            8w0x67: parse_pre_open_price_indicator_message;
            8w0x69: parse_strip_info_message;
            8w0x56: parse_interval_price_limit_notification_message;
            8w0x39: parse_new_futures_strategy_definition_message;
            8w0x52: parse_new_expiry_message;
            8w0x62: parse_special_field_message;
            8w0x5a: parse_fragment_wrapper_message;
            8w0x44: parse_market_snapshot_order_message;
            8w0x45: parse_add_or_modify_order_message;
            8w0x46: parse_delete_order_message;
            8w0x54: parse_message_bundle_marker;
            8w0x33: parse_fixing_transition_message;
            8w0x34: parse_fixing_lockdown_message;
            8w0x30: parse_fixing_indicative_price_message;
            8w0x6d: parse_market_snapshot_price_level_message;
            8w0x74: parse_add_price_level_message;
            8w0x73: parse_change_price_level_message;
            8w0x72: parse_delete_price_level_message;
            8w0x55: parse_new_options_strategy_definition_message;
            8w0x6c: parse_new_options_market_definition_message;
            8w0x6b: parse_rfq_message;
            8w0x76: parse_option_open_interest_message;
            8w0x77: parse_option_settlement_price_message;
            8w0x57: parse_old_style_options_trade_and_market_stats_message;
            default: accept;
        }
    }

    state parse_market_snapshot_message {
        packet.extract(hdr.market_snapshot_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_spot_market_trade_message {
        packet.extract(hdr.spot_market_trade_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_investigated_trade_message {
        packet.extract(hdr.investigated_trade_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_cancelled_trade_message {
        packet.extract(hdr.cancelled_trade_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_statistics_message {
        packet.extract(hdr.market_statistics_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_state_change_message {
        packet.extract(hdr.market_state_change_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_system_text_message {
        packet.extract(hdr.system_text_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_open_price_message {
        packet.extract(hdr.open_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_close_price_message {
        packet.extract(hdr.close_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_settlement_price_message {
        packet.extract(hdr.settlement_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_index_prices_message {
        packet.extract(hdr.index_prices_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_end_of_day_market_summary_message {
        packet.extract(hdr.end_of_day_market_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_event_message {
        packet.extract(hdr.market_event_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_pre_open_price_indicator_message {
        packet.extract(hdr.pre_open_price_indicator_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_strip_info_message {
        packet.extract(hdr.strip_info_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_interval_price_limit_notification_message {
        packet.extract(hdr.interval_price_limit_notification_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_new_futures_strategy_definition_message {
        packet.extract(hdr.new_futures_strategy_definition_message.next);
        meta.dispatched = 1;
        meta.new_futures_strategy_definition_message_leg_definition_remaining = hdr.new_futures_strategy_definition_message.last.number_of_leg_definitions;
        transition select(meta.new_futures_strategy_definition_message_leg_definition_remaining) {
            8w0: read_new_futures_strategy_definition_message_extra_leg_definition;
            default: parse_new_futures_strategy_definition_message_leg_definition;
        }
    }

    state parse_new_futures_strategy_definition_message_leg_definition {
        packet.extract(hdr.new_futures_strategy_definition_message_leg_definition.next);
        meta.new_futures_strategy_definition_message_leg_definition_remaining = meta.new_futures_strategy_definition_message_leg_definition_remaining - 1;
        transition select(meta.new_futures_strategy_definition_message_leg_definition_remaining) {
            8w0: read_new_futures_strategy_definition_message_extra_leg_definition;
            default: parse_new_futures_strategy_definition_message_leg_definition;
        }
    }

    state read_new_futures_strategy_definition_message_extra_leg_definition {
        packet.extract(hdr.new_futures_strategy_definition_message_extra_leg_definition_header);
        meta.new_futures_strategy_definition_message_extra_leg_definition_remaining = hdr.new_futures_strategy_definition_message_extra_leg_definition_header.number_of_extra_leg_definitions;
        transition select(meta.new_futures_strategy_definition_message_extra_leg_definition_remaining) {
            8w0: parse_packet_header_message;
            default: parse_new_futures_strategy_definition_message_extra_leg_definition;
        }
    }

    state parse_new_futures_strategy_definition_message_extra_leg_definition {
        packet.extract(hdr.new_futures_strategy_definition_message_extra_leg_definition.next);
        meta.new_futures_strategy_definition_message_extra_leg_definition_remaining = meta.new_futures_strategy_definition_message_extra_leg_definition_remaining - 1;
        transition select(meta.new_futures_strategy_definition_message_extra_leg_definition_remaining) {
            8w0: parse_packet_header_message;
            default: parse_new_futures_strategy_definition_message_extra_leg_definition;
        }
    }

    state parse_new_expiry_message {
        packet.extract(hdr.new_expiry_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_special_field_message {
        packet.extract(hdr.special_field_message.next);
        meta.dispatched = 1;
        transition select(hdr.special_field_message.last.number_of_special_fields) {
            8w0: parse_packet_header_message;
            default: parse_special_field_message_special_field;
        }
    }

    state parse_special_field_message_special_field {
        packet.extract(hdr.special_field_message_special_field.next);
        transition select(hdr.special_field_message_special_field.last.special_field_id) {
            8w1: parse_alt_price;
            8w2: parse_alt_high_price;
            8w3: parse_alt_low_price;
            8w4: parse_alt_vwap;
            8w5: parse_alt_last_trade_price;
            8w6: parse_aon;
            default: parse_packet_header_message;
        }
    }

    state parse_alt_price {
        meta.dispatched = 1;
        transition parse_special_field_message_special_field;
    }

    state parse_alt_high_price {
        meta.dispatched = 1;
        transition parse_special_field_message_special_field;
    }

    state parse_alt_low_price {
        meta.dispatched = 1;
        transition parse_special_field_message_special_field;
    }

    state parse_alt_vwap {
        meta.dispatched = 1;
        transition parse_special_field_message_special_field;
    }

    state parse_alt_last_trade_price {
        meta.dispatched = 1;
        transition parse_special_field_message_special_field;
    }

    state parse_aon {
        meta.dispatched = 1;
        transition parse_special_field_message_special_field;
    }

    state parse_fragment_wrapper_message {
        packet.extract(hdr.fragment_wrapper_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_snapshot_order_message {
        packet.extract(hdr.market_snapshot_order_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_add_or_modify_order_message {
        packet.extract(hdr.add_or_modify_order_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_delete_order_message {
        packet.extract(hdr.delete_order_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_message_bundle_marker {
        packet.extract(hdr.message_bundle_marker.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_fixing_transition_message {
        packet.extract(hdr.fixing_transition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_fixing_lockdown_message {
        packet.extract(hdr.fixing_lockdown_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_fixing_indicative_price_message {
        packet.extract(hdr.fixing_indicative_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_snapshot_price_level_message {
        packet.extract(hdr.market_snapshot_price_level_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_add_price_level_message {
        packet.extract(hdr.add_price_level_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_change_price_level_message {
        packet.extract(hdr.change_price_level_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_delete_price_level_message {
        packet.extract(hdr.delete_price_level_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_new_options_strategy_definition_message {
        packet.extract(hdr.new_options_strategy_definition_message.next);
        meta.dispatched = 1;
        meta.new_options_strategy_definition_message_strategy_leg_definition_remaining = hdr.new_options_strategy_definition_message.last.number_of_strategy_leg_definitions;
        transition select(meta.new_options_strategy_definition_message_strategy_leg_definition_remaining) {
            8w0: read_new_options_strategy_definition_message_hedge_definition;
            default: parse_new_options_strategy_definition_message_strategy_leg_definition;
        }
    }

    state parse_new_options_strategy_definition_message_strategy_leg_definition {
        packet.extract(hdr.new_options_strategy_definition_message_strategy_leg_definition.next);
        meta.new_options_strategy_definition_message_strategy_leg_definition_remaining = meta.new_options_strategy_definition_message_strategy_leg_definition_remaining - 1;
        transition select(meta.new_options_strategy_definition_message_strategy_leg_definition_remaining) {
            8w0: read_new_options_strategy_definition_message_hedge_definition;
            default: parse_new_options_strategy_definition_message_strategy_leg_definition;
        }
    }

    state read_new_options_strategy_definition_message_hedge_definition {
        packet.extract(hdr.new_options_strategy_definition_message_hedge_definition_header);
        meta.new_options_strategy_definition_message_hedge_definition_remaining = hdr.new_options_strategy_definition_message_hedge_definition_header.number_of_hedge_definitions;
        transition select(meta.new_options_strategy_definition_message_hedge_definition_remaining) {
            8w0: read_new_options_strategy_definition_message_extra_strategy_leg_definition;
            default: parse_new_options_strategy_definition_message_hedge_definition;
        }
    }

    state parse_new_options_strategy_definition_message_hedge_definition {
        packet.extract(hdr.new_options_strategy_definition_message_hedge_definition.next);
        meta.new_options_strategy_definition_message_hedge_definition_remaining = meta.new_options_strategy_definition_message_hedge_definition_remaining - 1;
        transition select(meta.new_options_strategy_definition_message_hedge_definition_remaining) {
            8w0: read_new_options_strategy_definition_message_extra_strategy_leg_definition;
            default: parse_new_options_strategy_definition_message_hedge_definition;
        }
    }

    state read_new_options_strategy_definition_message_extra_strategy_leg_definition {
        packet.extract(hdr.new_options_strategy_definition_message_extra_strategy_leg_definition_header);
        meta.new_options_strategy_definition_message_extra_strategy_leg_definition_remaining = hdr.new_options_strategy_definition_message_extra_strategy_leg_definition_header.number_of_extra_strategy_leg_definitions;
        transition select(meta.new_options_strategy_definition_message_extra_strategy_leg_definition_remaining) {
            8w0: parse_packet_header_message;
            default: parse_new_options_strategy_definition_message_extra_strategy_leg_definition;
        }
    }

    state parse_new_options_strategy_definition_message_extra_strategy_leg_definition {
        packet.extract(hdr.new_options_strategy_definition_message_extra_strategy_leg_definition.next);
        meta.new_options_strategy_definition_message_extra_strategy_leg_definition_remaining = meta.new_options_strategy_definition_message_extra_strategy_leg_definition_remaining - 1;
        transition select(meta.new_options_strategy_definition_message_extra_strategy_leg_definition_remaining) {
            8w0: parse_packet_header_message;
            default: parse_new_options_strategy_definition_message_extra_strategy_leg_definition;
        }
    }

    state parse_new_options_market_definition_message {
        packet.extract(hdr.new_options_market_definition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_rfq_message {
        packet.extract(hdr.rfq_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_option_open_interest_message {
        packet.extract(hdr.option_open_interest_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_option_settlement_price_message {
        packet.extract(hdr.option_settlement_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_old_style_options_trade_and_market_stats_message {
        packet.extract(hdr.old_style_options_trade_and_market_stats_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control IcefuturesMdfVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IcefuturesMdfIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IcefuturesMdfEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IcefuturesMdfComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IcefuturesMdfDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.market_snapshot_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.spot_market_trade_message);
        packet.emit(hdr.investigated_trade_message);
        packet.emit(hdr.cancelled_trade_message);
        packet.emit(hdr.market_statistics_message);
        packet.emit(hdr.market_state_change_message);
        packet.emit(hdr.system_text_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.open_price_message);
        packet.emit(hdr.close_price_message);
        packet.emit(hdr.settlement_price_message);
        packet.emit(hdr.index_prices_message);
        packet.emit(hdr.end_of_day_market_summary_message);
        packet.emit(hdr.market_event_message);
        packet.emit(hdr.pre_open_price_indicator_message);
        packet.emit(hdr.strip_info_message);
        packet.emit(hdr.interval_price_limit_notification_message);
        packet.emit(hdr.new_futures_strategy_definition_message);
        packet.emit(hdr.new_futures_strategy_definition_message_leg_definition);
        packet.emit(hdr.new_futures_strategy_definition_message_extra_leg_definition_header);
        packet.emit(hdr.new_futures_strategy_definition_message_extra_leg_definition);
        packet.emit(hdr.new_expiry_message);
        packet.emit(hdr.special_field_message);
        packet.emit(hdr.special_field_message_special_field);
        packet.emit(hdr.fragment_wrapper_message);
        packet.emit(hdr.market_snapshot_order_message);
        packet.emit(hdr.add_or_modify_order_message);
        packet.emit(hdr.delete_order_message);
        packet.emit(hdr.message_bundle_marker);
        packet.emit(hdr.fixing_transition_message);
        packet.emit(hdr.fixing_lockdown_message);
        packet.emit(hdr.fixing_indicative_price_message);
        packet.emit(hdr.market_snapshot_price_level_message);
        packet.emit(hdr.add_price_level_message);
        packet.emit(hdr.change_price_level_message);
        packet.emit(hdr.delete_price_level_message);
        packet.emit(hdr.new_options_strategy_definition_message);
        packet.emit(hdr.new_options_strategy_definition_message_strategy_leg_definition);
        packet.emit(hdr.new_options_strategy_definition_message_hedge_definition_header);
        packet.emit(hdr.new_options_strategy_definition_message_hedge_definition);
        packet.emit(hdr.new_options_strategy_definition_message_extra_strategy_leg_definition_header);
        packet.emit(hdr.new_options_strategy_definition_message_extra_strategy_leg_definition);
        packet.emit(hdr.new_options_market_definition_message);
        packet.emit(hdr.rfq_message);
        packet.emit(hdr.option_open_interest_message);
        packet.emit(hdr.option_settlement_price_message);
        packet.emit(hdr.old_style_options_trade_and_market_stats_message);
    }
}

V1Switch(
    IcefuturesMdfParser(),
    IcefuturesMdfVerifyChecksum(),
    IcefuturesMdfIngress(),
    IcefuturesMdfEgress(),
    IcefuturesMdfComputeChecksum(),
    IcefuturesMdfDeparser()
) main;
