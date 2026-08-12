// P4_16 (v1model) definition for: B3 B3Derivatives BinaryUmdf Sbe v1.6
// 
// Protocol:
//   Organization: Brasil, Bolsa, Balcão
//   Protocol: Binary Unified Market Data Feed
//   Encoding: Simple Binary Encoding
//   Version: 1.6
//   Date: 6/13/2023
//   Specification: BinaryUMDF-MessageReference-v.1.6.0-enUS.pdf
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
    bit<8> channel_id;
    bit<8> reserved;
    bit<16> sequence_version;
    bit<32> sequence_number;
    bit<64> sending_time;
    bit<16> message_length;
    bit<16> encoding_type;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header sequence_message_t {
    bit<32> next_seq_no;
}

header security_status_3_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<8> security_trading_status;
    bit<8> security_trading_event;
    bit<16> trade_date;
    bit<16> offset_14_padding_2;
    bit<64> trad_ses_open_time;
    bit<64> transact_time;
    bit<32> rpt_seq;
}

header security_group_phase_10_message_t {
    bit<24> security_group;
    bit<40> offset_3_padding_5;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> security_trading_event;
    bit<16> trade_date;
    bit<16> offset_14_padding_2;
    bit<64> trad_ses_open_time;
    bit<64> transact_time;
}

header deprecated_security_definition_message_t {
    bit<64> security_id;
    bit<32> security_exchange;
    bit<8> security_id_source;
    bit<24> security_group;
    bit<160> symbol;
    bit<8> security_update_action;
    bit<8> security_type;
    bit<16> security_sub_type;
    bit<32> tot_no_related_sym;
    bit<64> min_price_increment;
    bit<64> strike_price;
    bit<64> contract_multiplier;
    bit<64> price_divisor;
    bit<64> security_validity_timestamp;
    bit<64> no_shares_issued;
    bit<64> clearing_house_id;
    bit<64> min_order_qty;
    bit<64> max_order_qty;
    bit<64> min_lot_size;
    bit<64> min_trade_vol;
    bit<32> corporate_action_event_id;
    bit<32> issue_date;
    bit<32> maturity_date;
    bit<16> country_of_issue;
    bit<32> start_date;
    bit<32> end_date;
    bit<16> settl_type;
    bit<32> settl_date;
    bit<32> dated_date;
    bit<96> isin_number;
    bit<48> asset;
    bit<48> cfi_code;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<16> year_2;
    bit<8> month_2;
    bit<8> day_2;
    bit<8> week_2;
    bit<24> currency;
    bit<24> strike_currency;
    bit<24> settl_currency;
    bit<24> security_strategy_type;
    bit<8> lot_type;
    bit<8> tick_size_denominator;
    bit<8> product;
    bit<8> exercise_style;
    bit<8> put_or_call;
    bit<8> price_type;
    bit<8> market_segment_id;
    bit<8> governance_indicator;
    bit<8> security_match_type;
    bit<8> last_fragment;
    bit<8> multi_leg_model;
    bit<8> multi_leg_price_method;
    bit<64> min_cross_qty;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> underlying_security_id;
    bit<64> index_pct;
    bit<64> index_theoretical_qty;
    bit<160> underlying_symbol;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<64> leg_security_id;
    bit<64> leg_ratio_qty;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<160> leg_symbol;
    bit<16> block_length_3;
    bit<8> num_in_group_3;
    bit<8> instr_attrib_type;
    bit<8> instr_attrib_value;
    bit<8> security_desc_length;
    bit<8> security_desc_data;
}

header news_5_message_t {
    bit<64> security_id_optional;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> news_source;
    bit<16> language_code;
    bit<16> part_count;
    bit<16> part_number;
    bit<64> news_id;
    bit<64> orig_time;
    bit<32> total_text_length;
    bit<16> headline_length;
    bit<8> headline_data;
    bit<16> text_length;
    bit<8> text_data;
    bit<16> url_link_length;
    bit<8> url_link_data;
}

header empty_book_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<24> offset_9_padding_3;
    bit<64> md_entry_timestamp;
}

header channel_reset_11_message_t {
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<24> offset_1_padding_3;
    bit<64> md_entry_timestamp;
}

header opening_price_15_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<8> open_close_settl_flag;
    bit<8> offset_11_padding_1;
    bit<64> md_future_price;
    bit<64> net_chg_prev_day;
    bit<16> trade_date;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
    bit<16> padding_2;
}

header theoretical_opening_price_16_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<16> trade_date;
    bit<64> md_corporate_offset_price_optional;
    bit<64> md_entry_size_quantity_optional;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header closing_price_17_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> open_close_settl_flag;
    bit<16> offset_10_padding_2;
    bit<64> md_corporate_price;
    bit<16> last_trade_date;
    bit<16> trade_date;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header auction_imbalance_19_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<1> unused_imbalance_condition_0;
    bit<1> unused_imbalance_condition_1;
    bit<1> unused_imbalance_condition_2;
    bit<1> unused_imbalance_condition_3;
    bit<1> unused_imbalance_condition_4;
    bit<1> unused_imbalance_condition_5;
    bit<1> unused_imbalance_condition_6;
    bit<1> unused_imbalance_condition_7;
    bit<1> imbalance_more_buyers;
    bit<1> imbalance_more_sellers;
    bit<6> reserved_6;
    bit<64> md_entry_size_quantity_optional;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header price_band_20_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> price_band_type;
    bit<8> price_limit_type;
    bit<8> price_band_midpoint_price_type;
    bit<64> low_limit_price;
    bit<64> high_limit_price;
    bit<64> trading_reference_price;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header quantity_band_21_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<24> offset_9_padding_3;
    bit<64> avg_daily_traded_qty;
    bit<64> max_trade_vol;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header high_price_24_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<16> trade_date;
    bit<64> md_future_price;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header low_price_25_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<16> trade_date;
    bit<64> md_future_price;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header last_trade_price_27_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<1> opening_price;
    bit<1> crossed;
    bit<1> last_trade_at_the_same_price;
    bit<1> out_of_sequence;
    bit<1> unused_trade_condition_4;
    bit<1> unused_trade_condition_5;
    bit<1> trade_on_behalf;
    bit<1> unused_trade_condition_7;
    bit<1> unused_trade_condition_8;
    bit<1> unused_trade_condition_9;
    bit<1> unused_trade_condition_10;
    bit<1> unused_trade_condition_11;
    bit<1> unused_trade_condition_12;
    bit<1> regular_trade;
    bit<1> block_trade;
    bit<1> unused_trade_condition_15;
    bit<64> md_future_price;
    bit<64> md_entry_size_quantity;
    bit<32> trade_id;
    bit<32> md_entry_buyer;
    bit<32> md_entry_seller;
    bit<16> trade_date;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
    bit<16> seller_days;
    bit<64> md_entry_interest_rate;
    bit<8> trd_sub_type;
    bit<24> padding_3;
}

header snapshot_full_refresh_header_30_message_t {
    bit<64> security_id;
    bit<32> last_msg_seq_num_processed;
    bit<32> tot_num_reports;
    bit<32> tot_num_bids;
    bit<32> tot_num_offers;
    bit<16> tot_num_stats;
    bit<16> offset_26_padding_2;
    bit<32> last_rpt_seq;
}

header order_mb_o_50_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<8> md_entry_type;
    bit<8> offset_11_padding_1;
    bit<64> md_corporate_offset_price_optional;
    bit<64> md_entry_size_quantity;
    bit<32> md_entry_position_no;
    bit<32> entering_firm;
    bit<64> md_insert_timestamp;
    bit<64> secondary_order_id;
    bit<32> rpt_seq;
    bit<64> md_entry_timestamp;
}

header delete_order_mb_o_51_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> offset_9_padding_1;
    bit<8> md_entry_type;
    bit<8> offset_11_padding_1;
    bit<32> md_entry_position_no;
    bit<64> md_entry_size_quantity_optional;
    bit<64> secondary_order_id;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header mass_delete_orders_mb_o_52_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> md_update_action;
    bit<8> md_entry_type;
    bit<8> offset_11_padding_1;
    bit<32> md_entry_position_no;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header trade_53_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<1> opening_price;
    bit<1> crossed;
    bit<1> last_trade_at_the_same_price;
    bit<1> out_of_sequence;
    bit<1> unused_trade_condition_4;
    bit<1> unused_trade_condition_5;
    bit<1> trade_on_behalf;
    bit<1> unused_trade_condition_7;
    bit<1> unused_trade_condition_8;
    bit<1> unused_trade_condition_9;
    bit<1> unused_trade_condition_10;
    bit<1> unused_trade_condition_11;
    bit<1> unused_trade_condition_12;
    bit<1> regular_trade;
    bit<1> block_trade;
    bit<1> unused_trade_condition_15;
    bit<64> md_future_price;
    bit<64> md_entry_size_quantity;
    bit<32> trade_id;
    bit<32> md_entry_buyer;
    bit<32> md_entry_seller;
    bit<16> trade_date;
    bit<8> trd_sub_type;
    bit<8> offset_43_padding_1;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header forward_trade_54_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<1> opening_price;
    bit<1> crossed;
    bit<1> last_trade_at_the_same_price;
    bit<1> out_of_sequence;
    bit<1> unused_trade_condition_4;
    bit<1> unused_trade_condition_5;
    bit<1> trade_on_behalf;
    bit<1> unused_trade_condition_7;
    bit<1> unused_trade_condition_8;
    bit<1> unused_trade_condition_9;
    bit<1> unused_trade_condition_10;
    bit<1> unused_trade_condition_11;
    bit<1> unused_trade_condition_12;
    bit<1> regular_trade;
    bit<1> block_trade;
    bit<1> unused_trade_condition_15;
    bit<64> md_future_price;
    bit<64> md_entry_size_quantity;
    bit<32> trade_id;
    bit<32> md_entry_buyer;
    bit<32> md_entry_seller;
    bit<16> trade_date;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
    bit<16> seller_days;
    bit<64> md_entry_interest_rate;
    bit<8> trd_sub_type;
    bit<24> padding_3;
}

header execution_summary_55_message_t {
    bit<64> security_id;
    bit<16> offset_8_padding_2;
    bit<8> aggressor_side;
    bit<8> offset_11_padding_1;
    bit<64> last_px;
    bit<64> fill_qty;
    bit<64> traded_hidden_qty;
    bit<64> cxl_qty;
    bit<64> aggressor_time;
    bit<32> rpt_seq;
    bit<64> md_entry_timestamp;
}

header execution_statistics_56_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<16> trade_date;
    bit<64> trade_volume;
    bit<64> vwap_px;
    bit<64> net_chg_prev_day;
    bit<32> number_of_trades;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header trade_bust_57_message_t {
    bit<64> security_id;
    bit<1> last_trade_msg;
    bit<1> last_volume_msg;
    bit<1> last_quote_msg;
    bit<1> last_stats_msg;
    bit<1> last_implied_msg;
    bit<1> recovery_msg;
    bit<1> unused;
    bit<1> end_of_event;
    bit<8> trading_session_id;
    bit<16> offset_10_padding_2;
    bit<64> md_future_price;
    bit<64> md_entry_size_quantity;
    bit<32> trade_id;
    bit<16> trade_date;
    bit<16> offset_34_padding_2;
    bit<64> md_entry_timestamp;
    bit<32> rpt_seq;
}

header snapshot_full_refresh_orders_mb_o_71_message_t {
    bit<64> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> md_corporate_offset_price_optional;
    bit<64> md_entry_size_quantity;
    bit<32> md_entry_position_no;
    bit<32> entering_firm;
    bit<64> md_insert_timestamp;
    bit<64> secondary_order_id;
    bit<8> md_entry_type;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    sequence_message_t sequence_message;
    security_status_3_message_t security_status_3_message;
    security_group_phase_10_message_t security_group_phase_10_message;
    deprecated_security_definition_message_t deprecated_security_definition_message;
    news_5_message_t news_5_message;
    empty_book_message_t empty_book_message;
    channel_reset_11_message_t channel_reset_11_message;
    opening_price_15_message_t opening_price_15_message;
    theoretical_opening_price_16_message_t theoretical_opening_price_16_message;
    closing_price_17_message_t closing_price_17_message;
    auction_imbalance_19_message_t auction_imbalance_19_message;
    price_band_20_message_t price_band_20_message;
    quantity_band_21_message_t quantity_band_21_message;
    high_price_24_message_t high_price_24_message;
    low_price_25_message_t low_price_25_message;
    last_trade_price_27_message_t last_trade_price_27_message;
    snapshot_full_refresh_header_30_message_t snapshot_full_refresh_header_30_message;
    order_mb_o_50_message_t order_mb_o_50_message;
    delete_order_mb_o_51_message_t delete_order_mb_o_51_message;
    mass_delete_orders_mb_o_52_message_t mass_delete_orders_mb_o_52_message;
    trade_53_message_t trade_53_message;
    forward_trade_54_message_t forward_trade_54_message;
    execution_summary_55_message_t execution_summary_55_message;
    execution_statistics_56_message_t execution_statistics_56_message;
    trade_bust_57_message_t trade_bust_57_message;
    snapshot_full_refresh_orders_mb_o_71_message_t snapshot_full_refresh_orders_mb_o_71_message;
}

parser B3derivativesBinaryumdfParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w2: parse_sequence_message;
            16w3: parse_security_status_3_message;
            16w10: parse_security_group_phase_10_message;
            16w4: parse_deprecated_security_definition_message;
            16w5: parse_news_5_message;
            16w9: parse_empty_book_message;
            16w11: parse_channel_reset_11_message;
            16w15: parse_opening_price_15_message;
            16w16: parse_theoretical_opening_price_16_message;
            16w17: parse_closing_price_17_message;
            16w19: parse_auction_imbalance_19_message;
            16w20: parse_price_band_20_message;
            16w21: parse_quantity_band_21_message;
            16w24: parse_high_price_24_message;
            16w25: parse_low_price_25_message;
            16w27: parse_last_trade_price_27_message;
            16w30: parse_snapshot_full_refresh_header_30_message;
            16w50: parse_order_mb_o_50_message;
            16w51: parse_delete_order_mb_o_51_message;
            16w52: parse_mass_delete_orders_mb_o_52_message;
            16w53: parse_trade_53_message;
            16w54: parse_forward_trade_54_message;
            16w55: parse_execution_summary_55_message;
            16w56: parse_execution_statistics_56_message;
            16w57: parse_trade_bust_57_message;
            16w71: parse_snapshot_full_refresh_orders_mb_o_71_message;
            default: accept;
        }
    }

    state parse_sequence_message {
        packet.extract(hdr.sequence_message);
        transition accept;
    }

    state parse_security_status_3_message {
        packet.extract(hdr.security_status_3_message);
        transition accept;
    }

    state parse_security_group_phase_10_message {
        packet.extract(hdr.security_group_phase_10_message);
        transition accept;
    }

    state parse_deprecated_security_definition_message {
        packet.extract(hdr.deprecated_security_definition_message);
        transition accept;
    }

    state parse_news_5_message {
        packet.extract(hdr.news_5_message);
        transition accept;
    }

    state parse_empty_book_message {
        packet.extract(hdr.empty_book_message);
        transition accept;
    }

    state parse_channel_reset_11_message {
        packet.extract(hdr.channel_reset_11_message);
        transition accept;
    }

    state parse_opening_price_15_message {
        packet.extract(hdr.opening_price_15_message);
        transition accept;
    }

    state parse_theoretical_opening_price_16_message {
        packet.extract(hdr.theoretical_opening_price_16_message);
        transition accept;
    }

    state parse_closing_price_17_message {
        packet.extract(hdr.closing_price_17_message);
        transition accept;
    }

    state parse_auction_imbalance_19_message {
        packet.extract(hdr.auction_imbalance_19_message);
        transition accept;
    }

    state parse_price_band_20_message {
        packet.extract(hdr.price_band_20_message);
        transition accept;
    }

    state parse_quantity_band_21_message {
        packet.extract(hdr.quantity_band_21_message);
        transition accept;
    }

    state parse_high_price_24_message {
        packet.extract(hdr.high_price_24_message);
        transition accept;
    }

    state parse_low_price_25_message {
        packet.extract(hdr.low_price_25_message);
        transition accept;
    }

    state parse_last_trade_price_27_message {
        packet.extract(hdr.last_trade_price_27_message);
        transition accept;
    }

    state parse_snapshot_full_refresh_header_30_message {
        packet.extract(hdr.snapshot_full_refresh_header_30_message);
        transition accept;
    }

    state parse_order_mb_o_50_message {
        packet.extract(hdr.order_mb_o_50_message);
        transition accept;
    }

    state parse_delete_order_mb_o_51_message {
        packet.extract(hdr.delete_order_mb_o_51_message);
        transition accept;
    }

    state parse_mass_delete_orders_mb_o_52_message {
        packet.extract(hdr.mass_delete_orders_mb_o_52_message);
        transition accept;
    }

    state parse_trade_53_message {
        packet.extract(hdr.trade_53_message);
        transition accept;
    }

    state parse_forward_trade_54_message {
        packet.extract(hdr.forward_trade_54_message);
        transition accept;
    }

    state parse_execution_summary_55_message {
        packet.extract(hdr.execution_summary_55_message);
        transition accept;
    }

    state parse_execution_statistics_56_message {
        packet.extract(hdr.execution_statistics_56_message);
        transition accept;
    }

    state parse_trade_bust_57_message {
        packet.extract(hdr.trade_bust_57_message);
        transition accept;
    }

    state parse_snapshot_full_refresh_orders_mb_o_71_message {
        packet.extract(hdr.snapshot_full_refresh_orders_mb_o_71_message);
        transition accept;
    }

}

control B3derivativesBinaryumdfVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control B3derivativesBinaryumdfIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control B3derivativesBinaryumdfEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control B3derivativesBinaryumdfComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control B3derivativesBinaryumdfDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.sequence_message);
        packet.emit(hdr.security_status_3_message);
        packet.emit(hdr.security_group_phase_10_message);
        packet.emit(hdr.deprecated_security_definition_message);
        packet.emit(hdr.news_5_message);
        packet.emit(hdr.empty_book_message);
        packet.emit(hdr.channel_reset_11_message);
        packet.emit(hdr.opening_price_15_message);
        packet.emit(hdr.theoretical_opening_price_16_message);
        packet.emit(hdr.closing_price_17_message);
        packet.emit(hdr.auction_imbalance_19_message);
        packet.emit(hdr.price_band_20_message);
        packet.emit(hdr.quantity_band_21_message);
        packet.emit(hdr.high_price_24_message);
        packet.emit(hdr.low_price_25_message);
        packet.emit(hdr.last_trade_price_27_message);
        packet.emit(hdr.snapshot_full_refresh_header_30_message);
        packet.emit(hdr.order_mb_o_50_message);
        packet.emit(hdr.delete_order_mb_o_51_message);
        packet.emit(hdr.mass_delete_orders_mb_o_52_message);
        packet.emit(hdr.trade_53_message);
        packet.emit(hdr.forward_trade_54_message);
        packet.emit(hdr.execution_summary_55_message);
        packet.emit(hdr.execution_statistics_56_message);
        packet.emit(hdr.trade_bust_57_message);
        packet.emit(hdr.snapshot_full_refresh_orders_mb_o_71_message);
    }
}

V1Switch(
    B3derivativesBinaryumdfParser(),
    B3derivativesBinaryumdfVerifyChecksum(),
    B3derivativesBinaryumdfIngress(),
    B3derivativesBinaryumdfEgress(),
    B3derivativesBinaryumdfComputeChecksum(),
    B3derivativesBinaryumdfDeparser()
) main;
