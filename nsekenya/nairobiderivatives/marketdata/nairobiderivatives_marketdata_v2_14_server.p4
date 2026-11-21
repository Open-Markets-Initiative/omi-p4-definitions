// P4_16 (v1model) definition for: NseKenya NairobiDerivatives MarketData Mits v2.14
// 
// Protocol:
//   Organization: Nairobi Securities Exchange
//   Protocol: Nairobi Derivatives Market Data
//   Encoding: MITS Exchange System
//   Version: 2.14
//   Date: 08/21/2019
//   Specification: Bonds-and-Derrivatives-MITS-Market-Data-API.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
//   Authors: Omi Developers
// 
// Copyright (c) 2026 Scaled Sources LLC.  https://www.scaledsources.com
// 
// The protocol compiler technologies used to produce this file are the subject of
// patents owned by Scaled Sources LLC.  Those patent rights are retained and are
// not transferred by this contribution:
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header time_t {
    bit<8> start_byte;
    bit<16> message_length;
    bit<8> length_check;
    bit<32> sequence_number;
    bit<8> user_name_length_byte;
    bit<120> user_name_characters;
    bit<32> user_number;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<8> server_message_type;
}

header successful_log_in_response_message_t {
    bit<96> unused_12;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> country_code_length_byte;
    bit<24> country_code_characters;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> unused_1;
    bit<32> number_of_unique_members;
    bit<8> is_successful;
    bit<8> text_p_50_length_byte;
    bit<392> text_p_50_characters;
}

header successful_log_in_response_message_pair_member_codes_with_unique_number_t {
    bit<8> member_code_p_6_length_byte;
    bit<40> member_code_p_6_characters;
    bit<32> unique_member_number;
}

header session_key_challenge_message_t {
    bit<1944> challenge;
}

header download_data_response_message_t {
    bit<8> data_type;
    bit<8> unused_1;
    bit<8> last_piece_of_chunk;
    bit<8> another_set_to_come;
    bit<32> action_;
    bit<32> specific_record;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<32> uncompressed_length;
}

header market_display_data_t {
    bit<32> display_sequence;
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
    bit<64> open_price;
    bit<32> instrument_sequence;
    bit<32> date_sequence;
    bit<32> strike_sequence;
    bit<32> second_instrument_sequence;
    bit<32> second_date_sequence;
}

header instruments_data_t {
    bit<32> instrument_sequence;
    bit<32> trading_session_sequence;
    bit<32> unused_4;
    bit<32> instrument_group_sequence;
    bit<32> future_fee_sequence;
    bit<32> option_fee_sequence;
    bit<32> delivery_fee_sequence;
    bit<8> market_number_c_1;
    bit<8> market_shard_number_c_1;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<8> instrument_type_number_c_1;
    bit<8> isin_code_length_byte;
    bit<96> isin_code_characters;
    bit<8> description_p_62_length_byte;
    bit<488> description_p_62_characters;
    bit<8> on_screen;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<32> second_unused_4;
    bit<32> nominal_divisor;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> linked_to_floating_rate;
    bit<8> unused_1;
    bit<32> underlying;
    bit<8> options_exercise_is_percentage;
    bit<64> options_exercise_cost;
    bit<64> group_margin;
    bit<8> vat;
    bit<64> settlement_margin;
    bit<8> physical_settlement;
    bit<8> group_description_length_byte;
    bit<472> group_description_characters;
    bit<32> third_unused_4;
    bit<64> reference_inflation_rate;
    bit<64> minimum_initiation_fee;
    bit<8> first_trade_reference_length_byte;
    bit<72> first_trade_reference_characters;
    bit<40> unused_5;
    bit<8> country_code_length_byte;
    bit<24> country_code_characters;
    bit<8> display_name_length_byte;
    bit<232> display_name_characters;
    bit<32> number_of_days_in_a_year;
    bit<32> bond_formula_decimal_places;
    bit<64> coupon_rate;
    bit<8> classification_length_byte;
    bit<232> classification_characters;
    bit<32> settlement_days;
    bit<8> validated_at_csd;
    bit<8> proprietary_trading_allowed;
    bit<8> vetting_agent_name_length_byte;
    bit<232> vetting_agent_name_characters;
    bit<8> vetting_agent_contact_length_byte;
    bit<232> vetting_agent_contact_characters;
    bit<64> share_holding_percentage_limit;
    bit<8> sector_length_byte;
    bit<232> sector_characters;
    bit<8> security_type_length_byte;
    bit<232> security_type_characters;
}

header contract_dates_t {
    bit<32> instrument_sequence;
    bit<32> contract_date_sequence;
    bit<32> trading_session_sequence;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<64> nominal;
    bit<64> strike_interval;
    bit<64> strike_interval_off_screen;
    bit<64> spread_margin;
    bit<32> lot_size;
    bit<32> option_lot_size;
    bit<8> big_depth;
    bit<8> price_rate;
    bit<64> max_change;
    bit<64> max_days_move;
    bit<64> max_gap;
    bit<8> unused_1;
    bit<8> options_allowed;
    bit<8> deltas_allowed;
    bit<8> spreads_allowed;
    bit<64> initial_margin;
    bit<32> quote_format_decimal_places;
    bit<32> price_format_decimal_places;
    bit<32> option_premium_format_decimal_places;
    bit<16> price_multiplier;
    bit<32> year_3;
    bit<32> month_3;
    bit<32> day_3;
    bit<64> vsr;
    bit<64> rpve;
    bit<32> volatility_rounding_places;
    bit<8> can_trade_options_onscreen;
    bit<8> can_trade_options_report_only;
    bit<8> can_trade_onscreen;
    bit<8> can_trade_report_only;
    bit<64> price_interval;
    bit<32> minimum_valid_bid_volume_on_screen;
    bit<32> minimum_valid_bid_volume_off_screen;
    bit<32> minimum_valid_bid_volume_on_screen_options;
    bit<32> minimum_valid_bid_volume_off_screen_options;
    bit<8> all_or_nothing_allowed;
    bit<8> at_best_orders_allowed;
    bit<8> stop_orders_allowed;
    bit<8> ice_berg_orders_allowed;
    bit<8> hold_over_orders_allowed;
    bit<8> at_close_orders_allowed;
    bit<8> future_anonymous;
    bit<8> option_anonymous;
    bit<136> unused_17;
    bit<8> rfq_allowed;
    bit<32> quantity_tick_size;
    bit<64> unused_8;
    bit<64> minimum_all_or_nothing_quantity;
    bit<64> minimum_iceberg_quantity;
    bit<8> good_till_cancelled_allowed;
}

header strike_data_t {
    bit<32> strike_sequence_number;
    bit<32> contract_date_sequence;
    bit<64> strike;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> deltas;
    bit<8> call_or_put;
}

header member_data_t {
    bit<32> member_sequence;
    bit<32> master_member_sequence;
    bit<32> clearing_member_sequence;
    bit<8> member_code_p_5_length_byte;
    bit<32> member_code_p_5_characters;
    bit<8> description_p_50_length_byte;
    bit<392> description_p_50_characters;
    bit<32> unused_4;
    bit<8> sor_account_length_byte;
    bit<128> sor_account_characters;
    bit<64> unused_8;
}

header mtm_data_t {
    bit<32> instrument_sequence;
    bit<32> date_sequence;
    bit<32> strike_sequence;
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
    bit<64> days_closing_price;
    bit<64> days_closing_rate;
    bit<64> open_interest;
    bit<32> year_3;
    bit<32> month_3;
    bit<32> day_3;
    bit<64> spot_price;
    bit<64> volatility;
    bit<64> high_price;
    bit<64> low_price;
    bit<64> days_volume_d_8;
    bit<64> shares_in_issue;
    bit<64> open_price;
    bit<64> previous_close_price;
}

header holiday_data_t {
    bit<32> holiday_sequence;
    bit<8> country_code_length_byte;
    bit<24> country_code_characters;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> reminder_only;
    bit<8> is_early_close;
    bit<8> is_futures_close_out;
}

header instrument_types_t {
    bit<32> instrument_type_sequence;
    bit<32> unused_4;
    bit<32> instrument_type_number_i_4;
    bit<8> identifier_prefix_c_1;
    bit<8> instrument_type_code_length_byte;
    bit<72> instrument_type_code_characters;
    bit<8> instrument_type_name_length_byte;
    bit<192> instrument_type_name_characters;
}

header clearing_member_data_t {
    bit<32> clearing_member_sequence;
    bit<8> clearing_member_code_length_byte;
    bit<40> clearing_member_code_characters;
    bit<8> clearing_member_description_length_byte;
    bit<392> clearing_member_description_characters;
}

header exchange_announcements_t {
    bit<32> id_market;
    bit<32> announcement_sequence;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<8> announcement_length_byte;
    bit<2032> announcement_characters;
}

header news_service_t {
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<16> message_category_type;
    bit<8> message_category_value_length_byte;
    bit<392> message_category_value_characters;
    bit<16> news_number;
    bit<16> total_number_of_segments;
    bit<16> segment_number;
    bit<8> message_p_255_length_byte;
    bit<2032> message_p_255_characters;
}

header coupon_information_t {
    bit<32> coupon_sequence;
    bit<32> instrument_sequence;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<64> coupon_rate;
    bit<64> redemption_value;
}

header trading_sessions_t {
    bit<32> trading_session_sequence;
    bit<8> trading_session_name_length_byte;
    bit<440> trading_session_name_characters;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<8> hours_2;
    bit<8> minutes_2;
    bit<8> seconds_2;
    bit<8> unused_1_2;
    bit<8> hours_3;
    bit<8> minutes_3;
    bit<8> seconds_3;
    bit<8> unused_1_3;
    bit<8> hours_4;
    bit<8> minutes_4;
    bit<8> seconds_4;
    bit<8> unused_1_4;
    bit<8> hours_5;
    bit<8> minutes_5;
    bit<8> seconds_5;
    bit<8> unused_1_5;
    bit<8> hours_6;
    bit<8> minutes_6;
    bit<8> seconds_6;
    bit<8> unused_1_6;
    bit<8> hours_7;
    bit<8> minutes_7;
    bit<8> seconds_7;
    bit<8> unused_1_7;
    bit<8> hours_8;
    bit<8> minutes_8;
    bit<8> seconds_8;
    bit<8> unused_1_8;
    bit<8> hours_9;
    bit<8> minutes_9;
    bit<8> seconds_9;
    bit<8> unused_1_9;
    bit<8> hours_10;
    bit<8> minutes_10;
    bit<8> seconds_10;
    bit<8> unused_1_10;
    bit<8> hours_11;
    bit<8> minutes_11;
    bit<8> seconds_11;
    bit<8> unused_1_11;
    bit<8> hours_12;
    bit<8> minutes_12;
    bit<8> seconds_12;
    bit<8> unused_1_12;
    bit<8> hours_13;
    bit<8> minutes_13;
    bit<8> seconds_13;
    bit<8> unused_1_13;
    bit<8> hours_14;
    bit<8> minutes_14;
    bit<8> seconds_14;
    bit<8> unused_1_14;
    bit<8> hours_15;
    bit<8> minutes_15;
    bit<8> seconds_15;
    bit<8> unused_1_15;
    bit<64> unused_8;
    bit<8> hours_16;
    bit<8> minutes_16;
    bit<8> seconds_16;
    bit<8> unused_1_16;
    bit<8> hours_17;
    bit<8> minutes_17;
    bit<8> seconds_17;
    bit<8> unused_1_17;
    bit<64> second_unused_8;
}

header indices_price_data_t {
    bit<32> indices_sequence;
    bit<64> opening_price;
    bit<64> index_price;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<64> market_capitalisation;
}

header indices_data_t {
    bit<32> indices_sequence;
    bit<8> indices_code_length_byte;
    bit<152> indices_code_characters;
    bit<8> indices_description_length_byte;
    bit<392> indices_description_characters;
    bit<8> classification_length_byte;
    bit<232> classification_characters;
}

header shares_in_issue_data_t {
    bit<32> shares_in_issue_sequence;
    bit<32> instrument_sequence;
    bit<64> balance;
    bit<64> current_value;
    bit<64> previous_balance;
    bit<64> previous_value;
}

header index_data_t {
    bit<32> index_data_sequence;
    bit<32> indices_sequence;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<64> index_value;
    bit<64> market_capitalization;
}

header index_constituents_data_t {
    bit<32> index_instrument_sequence;
    bit<32> indices_sequence;
    bit<32> instrument_sequence;
}

header completed_trade_message_t {
    bit<32> identifier_prefix_b_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<40> instrument_name_b_5;
    bit<64> strike;
    bit<8> call_put_b_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<40> secondary_instrument_name_b_5;
    bit<8> is_delta_option;
    bit<32> sequence_number;
    bit<64> price;
    bit<64> quantity_d_8;
    bit<64> open_price;
    bit<64> previous_closing_price;
    bit<64> closing_price;
    bit<64> change;
    bit<64> open_interest;
    bit<64> low;
    bit<64> high;
    bit<64> day_volume;
    bit<64> vwap;
    bit<32> trade_type;
    bit<32> year_3;
    bit<32> month_3;
    bit<32> day_3;
}

header display_update_message_t {
    bit<8> last_chunk;
    bit<8> trading_anonymous;
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
    bit<64> mid_price;
    bit<64> last_dealt_price;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<64> deal_volume;
    bit<64> high_price;
    bit<64> low_price;
    bit<64> days_volume_i_8;
    bit<32> last_order_qty;
    bit<8> last_order_buy_sell;
    bit<64> last_order_price;
    bit<8> number_of_depth;
    bit<64> open_interest;
    bit<64> change;
    bit<8> auction;
    bit<8> contract_status;
    bit<8> odd_lot;
    bit<64> last_traded_quantity;
    bit<32> date_sequence;
    bit<32> secondary_contract_date_sequence;
    bit<32> strike_sequence;
    bit<32> market_shard_global_sequence_number;
    bit<32> stack_sequence_number;
    bit<168> unused_21;
    bit<8> hours_2;
    bit<8> minutes_2;
    bit<8> seconds_2;
    bit<8> unused_1_2;
    bit<64> vwap;
    bit<64> closing_price;
    bit<8> reserved_1;
}

header display_update_message_depth_data_t {
    bit<8> buy_side_phantom;
}

header buy_who_member_t {
    bit<8> buy_who_length_byte;
    bit<40> buy_who_characters;
}

header indices_message_t {
    bit<8> index_sequence_number_length_byte;
    bit<24> index_sequence_number_characters;
    bit<64> opening_price;
    bit<64> index_price;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<64> market_capitalisation;
}

header daily_trend_reply_message_t {
    bit<32> uncompressed_length;
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
    bit<64> price;
    bit<64> quantity_i_8;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
}

header price_update_message_t {
    bit<8> last_chunk;
    bit<32> uncompressed_length;
    bit<8> trading_anonymous;
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
    bit<64> mid_price;
    bit<64> last_dealt_price;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<64> deal_volume;
    bit<64> high_price;
    bit<64> low_price;
    bit<64> days_volume_i_8;
    bit<32> last_order_qty;
    bit<8> last_order_buy_sell;
    bit<64> last_order_price;
    bit<8> number_of_depth;
    bit<64> open_interest;
    bit<64> change;
    bit<8> auction;
    bit<8> contract_status;
    bit<8> odd_lot;
    bit<64> last_traded_quantity;
    bit<32> date_sequence;
    bit<32> secondary_contract_date_sequence;
    bit<32> strike_sequence;
    bit<32> market_shard_global_sequence_number;
    bit<32> stack_sequence_number;
    bit<168> unused_21;
    bit<8> hours_2;
    bit<8> minutes_2;
    bit<8> seconds_2;
    bit<8> unused_1_2;
    bit<64> vwap;
    bit<64> closing_price;
    bit<8> reserved_1;
}

header price_update_message_depth_data_t {
    bit<8> buy_side_phantom;
}

header data_update_message_t {
    bit<8> data_type;
    bit<8> unused_1;
    bit<8> last_piece_of_chunk;
    bit<8> another_set_to_come;
    bit<32> action_;
    bit<32> specific_record;
    bit<32> year;
    bit<32> month;
    bit<32> day;
}

header exchange_announcements_message_t {
    bit<32> market_number_i_4;
    bit<32> market_shard_number_i_4;
    bit<32> error_number;
    bit<8> information_or_error_indicator;
    bit<8> message_p_250_length_byte;
    bit<1992> message_p_250_characters;
}

header notification_of_failure_message_t {
    bit<32> failure_notice_identifier;
    bit<32> market_number_i_4;
    bit<32> market_shard_number_i_4;
}

header business_message_reject_message_t {
    bit<32> reference_sequence_number;
    bit<8> reference_message_type_length_byte;
    bit<16> reference_message_type_characters;
    bit<8> text_p_250_length_byte;
    bit<1992> text_p_250_characters;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> successful_log_in_response_message_pair_member_codes_with_unique_number_remaining;
}

struct headers_t {
    time_t time;
    successful_log_in_response_message_t successful_log_in_response_message;
    successful_log_in_response_message_pair_member_codes_with_unique_number_t successful_log_in_response_message_pair_member_codes_with_unique_number[MAX_MESSAGES];
    session_key_challenge_message_t session_key_challenge_message;
    download_data_response_message_t download_data_response_message;
    market_display_data_t market_display_data;
    instruments_data_t instruments_data;
    contract_dates_t contract_dates;
    strike_data_t strike_data;
    member_data_t member_data;
    mtm_data_t mtm_data;
    holiday_data_t holiday_data;
    instrument_types_t instrument_types;
    clearing_member_data_t clearing_member_data;
    exchange_announcements_t exchange_announcements;
    news_service_t news_service;
    coupon_information_t coupon_information;
    trading_sessions_t trading_sessions;
    indices_price_data_t indices_price_data;
    indices_data_t indices_data;
    shares_in_issue_data_t shares_in_issue_data;
    index_data_t index_data;
    index_constituents_data_t index_constituents_data;
    completed_trade_message_t completed_trade_message;
    display_update_message_t display_update_message;
    display_update_message_depth_data_t display_update_message_depth_data[MAX_MESSAGES];
    buy_who_member_t buy_who_member[MAX_MESSAGES];
    indices_message_t indices_message;
    daily_trend_reply_message_t daily_trend_reply_message;
    price_update_message_t price_update_message;
    price_update_message_depth_data_t price_update_message_depth_data[MAX_MESSAGES];
    data_update_message_t data_update_message;
    exchange_announcements_message_t exchange_announcements_message;
    notification_of_failure_message_t notification_of_failure_message;
    business_message_reject_message_t business_message_reject_message;
}

parser NairobiderivativesMarketdataServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.time);
        transition select(hdr.time.server_message_type) {
            8w1: parse_successful_log_in_response_message;
            8w10: parse_heart_beat_message;
            8w16: parse_session_key_challenge_message;
            8w36: parse_download_data_response_message;
            8w37: parse_download_data_response_message;
            8w58: parse_completed_trade_message;
            8w59: parse_display_update_message;
            8w60: parse_indices_message;
            8w61: parse_daily_trend_reply_message;
            8w99: parse_price_update_message;
            8w123: parse_data_update_message;
            8w125: parse_exchange_announcements_message;
            8w127: parse_notification_of_failure_message;
            8w132: parse_business_message_reject_message;
            default: accept;
        }
    }

    state parse_successful_log_in_response_message {
        packet.extract(hdr.successful_log_in_response_message);
        meta.dispatched = 1;
        meta.successful_log_in_response_message_pair_member_codes_with_unique_number_remaining = hdr.successful_log_in_response_message.number_of_unique_members;
        transition select(meta.successful_log_in_response_message_pair_member_codes_with_unique_number_remaining) {
            32w0: accept;
            default: parse_successful_log_in_response_message_pair_member_codes_with_unique_number;
        }
    }

    state parse_successful_log_in_response_message_pair_member_codes_with_unique_number {
        packet.extract(hdr.successful_log_in_response_message_pair_member_codes_with_unique_number.next);
        meta.successful_log_in_response_message_pair_member_codes_with_unique_number_remaining = meta.successful_log_in_response_message_pair_member_codes_with_unique_number_remaining - 1;
        transition select(meta.successful_log_in_response_message_pair_member_codes_with_unique_number_remaining) {
            32w0: accept;
            default: parse_successful_log_in_response_message_pair_member_codes_with_unique_number;
        }
    }

    state parse_heart_beat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_key_challenge_message {
        packet.extract(hdr.session_key_challenge_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_download_data_response_message {
        packet.extract(hdr.download_data_response_message);
        meta.dispatched = 1;
        transition select(hdr.download_data_response_message.data_type) {
            8w1: parse_market_display_data;
            8w2: parse_instruments_data;
            8w3: parse_contract_dates;
            8w4: parse_strike_data;
            8w15: parse_member_data;
            8w16: parse_mtm_data;
            8w18: parse_holiday_data;
            8w39: parse_instrument_types;
            8w65: parse_clearing_member_data;
            8w89: parse_exchange_announcements;
            8w129: parse_news_service;
            8w131: parse_coupon_information;
            8w136: parse_trading_sessions;
            8w137: parse_indices_price_data;
            8w138: parse_indices_data;
            8w141: parse_shares_in_issue_data;
            8w146: parse_index_data;
            8w147: parse_index_constituents_data;
            default: accept;
        }
    }

    state parse_market_display_data {
        packet.extract(hdr.market_display_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instruments_data {
        packet.extract(hdr.instruments_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_contract_dates {
        packet.extract(hdr.contract_dates);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_strike_data {
        packet.extract(hdr.strike_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_member_data {
        packet.extract(hdr.member_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mtm_data {
        packet.extract(hdr.mtm_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_holiday_data {
        packet.extract(hdr.holiday_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_types {
        packet.extract(hdr.instrument_types);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_clearing_member_data {
        packet.extract(hdr.clearing_member_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_exchange_announcements {
        packet.extract(hdr.exchange_announcements);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_news_service {
        packet.extract(hdr.news_service);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_coupon_information {
        packet.extract(hdr.coupon_information);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_sessions {
        packet.extract(hdr.trading_sessions);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indices_price_data {
        packet.extract(hdr.indices_price_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indices_data {
        packet.extract(hdr.indices_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_shares_in_issue_data {
        packet.extract(hdr.shares_in_issue_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_index_data {
        packet.extract(hdr.index_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_index_constituents_data {
        packet.extract(hdr.index_constituents_data);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_completed_trade_message {
        packet.extract(hdr.completed_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_display_update_message {
        packet.extract(hdr.display_update_message);
        meta.dispatched = 1;
        transition select(hdr.display_update_message.number_of_depth) {
            8w0: accept;
            default: parse_display_update_message_depth_data;
        }
    }

    state parse_display_update_message_depth_data {
        packet.extract(hdr.display_update_message_depth_data.next);
        transition select(hdr.display_update_message.trading_anonymous) {
            8w0: parse_buy_who_member;
            default: accept;
        }
    }

    state parse_buy_who_member {
        packet.extract(hdr.buy_who_member.next);
        meta.dispatched = 1;
        transition parse_display_update_message_depth_data;
    }

    state parse_indices_message {
        packet.extract(hdr.indices_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_daily_trend_reply_message {
        packet.extract(hdr.daily_trend_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_update_message {
        packet.extract(hdr.price_update_message);
        meta.dispatched = 1;
        transition select(hdr.price_update_message.number_of_depth) {
            8w0: accept;
            default: parse_price_update_message_depth_data;
        }
    }

    state parse_price_update_message_depth_data {
        packet.extract(hdr.price_update_message_depth_data.next);
        transition select(hdr.price_update_message.trading_anonymous) {
            8w0: parse_buy_who_member;
            default: accept;
        }
    }

    state parse_data_update_message {
        packet.extract(hdr.data_update_message);
        meta.dispatched = 1;
        transition select(hdr.data_update_message.data_type) {
            8w1: parse_market_display_data;
            8w2: parse_instruments_data;
            8w3: parse_contract_dates;
            8w4: parse_strike_data;
            8w15: parse_member_data;
            8w16: parse_mtm_data;
            8w18: parse_holiday_data;
            8w39: parse_instrument_types;
            8w65: parse_clearing_member_data;
            8w89: parse_exchange_announcements;
            8w129: parse_news_service;
            8w131: parse_coupon_information;
            8w136: parse_trading_sessions;
            8w137: parse_indices_price_data;
            8w138: parse_indices_data;
            8w141: parse_shares_in_issue_data;
            8w146: parse_index_data;
            8w147: parse_index_constituents_data;
            default: accept;
        }
    }

    state parse_exchange_announcements_message {
        packet.extract(hdr.exchange_announcements_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_notification_of_failure_message {
        packet.extract(hdr.notification_of_failure_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_business_message_reject_message {
        packet.extract(hdr.business_message_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NairobiderivativesMarketdataServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NairobiderivativesMarketdataServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NairobiderivativesMarketdataServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NairobiderivativesMarketdataServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NairobiderivativesMarketdataServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.time);
        packet.emit(hdr.successful_log_in_response_message);
        packet.emit(hdr.successful_log_in_response_message_pair_member_codes_with_unique_number);
        packet.emit(hdr.session_key_challenge_message);
        packet.emit(hdr.download_data_response_message);
        packet.emit(hdr.market_display_data);
        packet.emit(hdr.instruments_data);
        packet.emit(hdr.contract_dates);
        packet.emit(hdr.strike_data);
        packet.emit(hdr.member_data);
        packet.emit(hdr.mtm_data);
        packet.emit(hdr.holiday_data);
        packet.emit(hdr.instrument_types);
        packet.emit(hdr.clearing_member_data);
        packet.emit(hdr.exchange_announcements);
        packet.emit(hdr.news_service);
        packet.emit(hdr.coupon_information);
        packet.emit(hdr.trading_sessions);
        packet.emit(hdr.indices_price_data);
        packet.emit(hdr.indices_data);
        packet.emit(hdr.shares_in_issue_data);
        packet.emit(hdr.index_data);
        packet.emit(hdr.index_constituents_data);
        packet.emit(hdr.completed_trade_message);
        packet.emit(hdr.display_update_message);
        packet.emit(hdr.display_update_message_depth_data);
        packet.emit(hdr.buy_who_member);
        packet.emit(hdr.indices_message);
        packet.emit(hdr.daily_trend_reply_message);
        packet.emit(hdr.price_update_message);
        packet.emit(hdr.price_update_message_depth_data);
        packet.emit(hdr.data_update_message);
        packet.emit(hdr.exchange_announcements_message);
        packet.emit(hdr.notification_of_failure_message);
        packet.emit(hdr.business_message_reject_message);
    }
}

V1Switch(
    NairobiderivativesMarketdataServerParser(),
    NairobiderivativesMarketdataServerVerifyChecksum(),
    NairobiderivativesMarketdataServerIngress(),
    NairobiderivativesMarketdataServerEgress(),
    NairobiderivativesMarketdataServerComputeChecksum(),
    NairobiderivativesMarketdataServerDeparser()
) main;
