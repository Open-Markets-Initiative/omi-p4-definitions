// P4_16 (v1model) definition for: Cme Globex Streamlined Sbe v5.8
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Streamlined Market Data
//   Encoding: Simple Binary Encoding
//   Version: 5.8
//   Date: 6/02/2017
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

header technical_header_t {
    bit<16> encoding_type;
    bit<32> message_sequence_number;
    bit<64> tcp_sending_time;
    bit<16> tcp_message_size;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header admin_login_t {
    bit<8> heart_bt_int;
}

header admin_logout_t {
    bit<1440> text;
}

header md_incremental_refresh_eris_reference_data_and_daily_statistics_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages_optional;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_t {
    bit<8> md_update_action_char;
    bit<8> md_entry_type;
    bit<32> rpt_seq;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> open_close_settl_flag;
    bit<1> null_value;
    bit<1> unused_settl_price_type_6;
    bit<1> unused_settl_price_type_5;
    bit<1> unused_settl_price_type_4;
    bit<1> reserved_bits;
    bit<1> rounded;
    bit<1> actual;
    bit<1> final;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<400> reference_id_50;
    bit<64> md_entry_size_optional;
    bit<400> symbol;
    bit<208> security_group_26;
    bit<8> product_optional;
    bit<72> security_type;
    bit<32> security_exchange;
    bit<16> maturity_date;
    bit<32> mantissa_32;
    bit<8> exponent_3;
    bit<16> trade_date;
    bit<64> mantissa_3;
    bit<8> exponent_4;
    bit<64> mantissa_4;
    bit<8> exponent_5;
    bit<64> mantissa_5;
    bit<8> exponent_6;
    bit<64> mantissa_6;
    bit<8> exponent_7;
    bit<64> mantissa_7;
    bit<8> exponent_8;
    bit<64> mantissa_8;
    bit<8> exponent_9;
    bit<64> mantissa_9;
    bit<8> exponent_10;
    bit<64> mantissa_10;
    bit<8> exponent_11;
    bit<64> mantissa_11;
    bit<8> exponent_12;
    bit<64> mantissa_12;
    bit<8> exponent_13;
    bit<64> mantissa_13;
    bit<8> exponent_14;
    bit<64> mantissa_14;
    bit<8> exponent_15;
    bit<16> next_fixed_payment_date;
    bit<64> mantissa_15;
    bit<8> exponent_16;
    bit<64> mantissa_16;
    bit<8> exponent_17;
    bit<16> trading_reference_date;
    bit<64> mantissa_17;
    bit<8> exponent_18;
    bit<16> fed_funds_date;
    bit<32> accrual_days;
    bit<64> nominal;
    bit<48> leg_credit_rating;
    bit<64> mantissa_18;
    bit<8> exponent_19;
    bit<16> next_floating_payment_date;
    bit<64> mantissa_19;
    bit<8> exponent_20;
    bit<64> mantissa_20;
    bit<8> exponent_21;
    bit<64> mantissa_21;
    bit<8> exponent_22;
    bit<64> mantissa_22;
    bit<8> exponent_23;
    bit<240> security_description;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_news_indices_t {
    bit<400> headline;
    bit<64> orig_time;
    bit<16> md_feed_type;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_news_indices_news_indices_related_sym_group_t {
    bit<400> symbol;
}

header md_news_indices_lines_of_text_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_news_indices_lines_of_text_group_t {
    bit<2048> text_500_chunk0;
    bit<1952> text_500_chunk1;
}

header md_incremental_refresh_trade_blocks_340_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_t {
    bit<8> md_update_action;
    bit<64> security_id;
    bit<32> rpt_seq;
    bit<64> md_entry_px_optional;
    bit<64> md_entry_size_optional;
    bit<32> number_of_orders;
    bit<32> trade_id;
    bit<8> aggressor_side;
    bit<400> symbol;
    bit<96> security_group_12;
    bit<72> security_type;
    bit<16> security_sub_type;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<32> security_exchange_4;
    bit<16> maturity_date;
    bit<40> unit_of_measure;
    bit<24> unit_of_measure_currency_3;
    bit<64> unit_of_measure_qty_optional;
    bit<32> coupon_rate;
    bit<16> price_type;
    bit<8> trd_type;
    bit<208> md_entry_id;
    bit<8> put_or_call;
    bit<64> strike_price;
    bit<16> restructuring_type;
    bit<16> seniority;
    bit<800> reference_id_100;
    bit<208> strategy_link_id;
    bit<136> leg_ref_id;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header quote_request_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<208> quote_req_id;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header quote_request_quote_request_related_sym_group_t {
    bit<400> symbol;
    bit<32> coupon_rate;
    bit<64> order_qty;
    bit<32> security_exchange;
    bit<8> product_optional;
    bit<208> security_group_26;
    bit<16> maturity_date;
    bit<32> security_type_4;
    bit<8> quote_type;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_indices_t {
    bit<400> symbol;
    bit<8> product;
    bit<32> security_exchange;
    bit<24> currency;
    bit<8> security_update_action;
    bit<16> md_feed_type;
    bit<16> appl_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header md_instrument_definition_indices_inst_attrib_group_t {
    bit<8> inst_attrib_type;
    bit<800> inst_attrib_value;
}

header md_instrument_definition_indices_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_indices_events_group_t {
    bit<8> event_type_optional;
    bit<64> event_time_optional;
}

header md_incremental_refresh_indices_t {
    bit<64> transact_time;
    bit<16> md_feed_type;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages_optional;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_indices_incremental_refresh_indices_group_t {
    bit<8> md_entry_type_indices;
    bit<32> rpt_seq;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> md_entry_size_optional;
    bit<400> symbol;
    bit<8> open_close_settl_flag;
    bit<64> yield_type;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<64> mantissa_4;
    bit<8> exponent_4;
    bit<64> mantissa_5;
    bit<8> exponent_5;
    bit<8> md_entry_code;
    bit<32> md_entry_date;
    bit<32> md_entry_time;
    bit<400> reference_id_50;
}

header md_incremental_refresh_trade_blocks_349_t {
    bit<64> transact_time_optional;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages;
    bit<16> trade_date;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_t {
    bit<8> md_update_action;
    bit<64> security_id;
    bit<32> rpt_seq;
    bit<64> md_entry_px_optional;
    bit<64> mantissa;
    bit<8> exponent;
    bit<32> number_of_orders;
    bit<32> trade_id;
    bit<8> aggressor_side;
    bit<400> symbol;
    bit<96> security_group_12;
    bit<72> security_type;
    bit<16> security_sub_type;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<32> security_exchange_4;
    bit<16> maturity_date;
    bit<40> unit_of_measure;
    bit<24> unit_of_measure_currency_3;
    bit<64> unit_of_measure_qty_optional;
    bit<32> coupon_rate;
    bit<16> price_type;
    bit<8> trd_type;
    bit<208> md_entry_id;
    bit<8> put_or_call;
    bit<64> strike_price;
    bit<16> restructuring_type;
    bit<16> seniority;
    bit<800> reference_id_100;
    bit<208> strategy_link_id;
    bit<136> leg_ref_id;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_eris_351_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages_optional;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_eris_351_eris_original_group_t {
    bit<8> md_update_action_char;
    bit<8> md_entry_type;
    bit<32> rpt_seq;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> md_entry_size_optional;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<32> md_entry_position_no;
    bit<32> number_of_orders;
    bit<32> trade_id;
    bit<8> aggressor_side;
    bit<400> symbol;
    bit<208> security_group_26;
    bit<72> security_type;
    bit<32> security_exchange;
    bit<8> product_optional;
    bit<16> maturity_date;
    bit<400> reference_id_50;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_eris_353_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages_optional;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_eris_353_eris_group_t {
    bit<8> md_update_action_char;
    bit<8> md_entry_type;
    bit<32> rpt_seq;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> md_entry_size_optional;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<32> md_entry_position_no;
    bit<32> number_of_orders;
    bit<32> trade_id;
    bit<8> aggressor_side;
    bit<400> symbol;
    bit<208> security_group_26;
    bit<72> security_type;
    bit<32> security_exchange;
    bit<8> product_optional;
    bit<16> maturity_date;
    bit<400> reference_id_50;
    bit<8> md_quote_type;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_otc_t {
    bit<64> transact_time;
    bit<16> trade_date;
    bit<1> end_of_event;
    bit<1> reserved;
    bit<1> recovery_msg;
    bit<1> last_implied_msg;
    bit<1> last_stats_msg;
    bit<1> last_quote_msg;
    bit<1> last_volume_msg;
    bit<1> last_trade_msg;
    bit<16> batch_total_messages_optional;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_incremental_refresh_otc_otc_original_group_t {
    bit<8> md_entry_type;
    bit<32> rpt_seq;
    bit<64> md_entry_px_optional;
    bit<64> mantissa;
    bit<8> exponent;
    bit<400> symbol;
    bit<96> security_group_12;
    bit<72> security_type;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<32> security_exchange;
    bit<8> product_optional;
    bit<16> maturity_date;
    bit<32> coupon_rate;
    bit<16> restructuring_type;
    bit<16> seniority;
    bit<32> notional_percentage_outstanding;
    bit<8> put_or_call;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<40> unit_of_measure;
    bit<24> unit_of_measure_currency;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<32> md_entry_date;
    bit<8> open_close_settl_flag;
    bit<16> price_type;
    bit<16> settl_date;
    bit<8> quote_condition;
    bit<208> market_sector;
    bit<16> sector_group;
    bit<208> sector_sub_group;
    bit<208> product_complex;
    bit<16> security_sub_type;
    bit<16> vol_type;
    bit<800> reference_id_100;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_eris_t {
    bit<96> security_group_12;
    bit<400> symbol;
    bit<32> security_type_4;
    bit<8> product_optional;
    bit<32> security_exchange;
    bit<16> maturity_date;
    bit<24> currency;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> security_update_action;
    bit<16> rate_type;
    bit<32> coupon_rate;
    bit<8> user_defined_instrument;
    bit<16> appl_id;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_eris_eris_feed_types_group_t {
    bit<24> md_feed_type_3;
    bit<8> market_depth;
}

header md_instrument_definition_eris_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_eris_events_group_t {
    bit<8> event_type_optional;
    bit<64> event_time_optional;
}

header md_instrument_definition_eris_eris_security_alt_id_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_eris_eris_security_alt_id_group_t {
    bit<208> security_alt_id_50;
    bit<8> security_alt_id_source_optional;
}

header md_instrument_definition_eris_eris_legs_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_8;
}

header md_instrument_definition_eris_eris_legs_group_t {
    bit<40> leg_benchmark_curve_name;
    bit<64> rate_descriptor;
    bit<16> previous_fixing_date;
    bit<24> leg_pay_frequencey;
    bit<64> mantissa;
    bit<8> exponent;
    bit<400> leg_symbol;
    bit<32> leg_ratio_qty_int_32_null;
    bit<8> leg_side;
    bit<24> leg_currency;
    bit<64> leg_security_type_4;
    bit<96> leg_security_group;
    bit<8> leg_date_offset;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<16> block_length;
    bit<8> num_in_group_8;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_remaining;
    bit<8> md_news_indices_news_indices_related_sym_group_remaining;
    bit<8> md_news_indices_lines_of_text_group_remaining;
    bit<8> md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_remaining;
    bit<8> quote_request_quote_request_related_sym_group_remaining;
    bit<16> md_instrument_definition_indices_inst_attrib_group_remaining;
    bit<8> md_instrument_definition_indices_events_group_remaining;
    bit<8> md_incremental_refresh_indices_incremental_refresh_indices_group_remaining;
    bit<8> md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_remaining;
    bit<8> md_incremental_refresh_eris_351_eris_original_group_remaining;
    bit<8> md_incremental_refresh_eris_353_eris_group_remaining;
    bit<8> md_incremental_refresh_otc_otc_original_group_remaining;
    bit<8> md_instrument_definition_eris_eris_feed_types_group_remaining;
    bit<8> md_instrument_definition_eris_events_group_remaining;
    bit<8> md_instrument_definition_eris_eris_security_alt_id_group_remaining;
    bit<8> md_instrument_definition_eris_eris_legs_group_remaining;
}

struct headers_t {
    technical_header_t technical_header;
    admin_login_t admin_login;
    admin_logout_t admin_logout;
    md_incremental_refresh_eris_reference_data_and_daily_statistics_t md_incremental_refresh_eris_reference_data_and_daily_statistics;
    md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_t md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group[MAX_MESSAGES];
    md_news_indices_t md_news_indices;
    md_news_indices_news_indices_related_sym_group_t md_news_indices_news_indices_related_sym_group[MAX_MESSAGES];
    md_news_indices_lines_of_text_group_header_t md_news_indices_lines_of_text_group_header;
    md_news_indices_lines_of_text_group_t md_news_indices_lines_of_text_group[MAX_MESSAGES];
    md_incremental_refresh_trade_blocks_340_t md_incremental_refresh_trade_blocks_340;
    md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_t md_incremental_refresh_trade_blocks_340_trade_blocks_original_group[MAX_MESSAGES];
    quote_request_t quote_request;
    quote_request_quote_request_related_sym_group_t quote_request_quote_request_related_sym_group[MAX_MESSAGES];
    md_instrument_definition_indices_t md_instrument_definition_indices;
    md_instrument_definition_indices_inst_attrib_group_t md_instrument_definition_indices_inst_attrib_group[MAX_MESSAGES];
    md_instrument_definition_indices_events_group_header_t md_instrument_definition_indices_events_group_header;
    md_instrument_definition_indices_events_group_t md_instrument_definition_indices_events_group[MAX_MESSAGES];
    md_incremental_refresh_indices_t md_incremental_refresh_indices;
    md_incremental_refresh_indices_incremental_refresh_indices_group_t md_incremental_refresh_indices_incremental_refresh_indices_group[MAX_MESSAGES];
    md_incremental_refresh_trade_blocks_349_t md_incremental_refresh_trade_blocks_349;
    md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_t md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group[MAX_MESSAGES];
    md_incremental_refresh_eris_351_t md_incremental_refresh_eris_351;
    md_incremental_refresh_eris_351_eris_original_group_t md_incremental_refresh_eris_351_eris_original_group[MAX_MESSAGES];
    md_incremental_refresh_eris_353_t md_incremental_refresh_eris_353;
    md_incremental_refresh_eris_353_eris_group_t md_incremental_refresh_eris_353_eris_group[MAX_MESSAGES];
    md_incremental_refresh_otc_t md_incremental_refresh_otc;
    md_incremental_refresh_otc_otc_original_group_t md_incremental_refresh_otc_otc_original_group[MAX_MESSAGES];
    md_instrument_definition_eris_t md_instrument_definition_eris;
    md_instrument_definition_eris_eris_feed_types_group_t md_instrument_definition_eris_eris_feed_types_group[MAX_MESSAGES];
    md_instrument_definition_eris_events_group_header_t md_instrument_definition_eris_events_group_header;
    md_instrument_definition_eris_events_group_t md_instrument_definition_eris_events_group[MAX_MESSAGES];
    md_instrument_definition_eris_eris_security_alt_id_group_header_t md_instrument_definition_eris_eris_security_alt_id_group_header;
    md_instrument_definition_eris_eris_security_alt_id_group_t md_instrument_definition_eris_eris_security_alt_id_group[MAX_MESSAGES];
    md_instrument_definition_eris_eris_legs_group_header_t md_instrument_definition_eris_eris_legs_group_header;
    md_instrument_definition_eris_eris_legs_group_t md_instrument_definition_eris_eris_legs_group[MAX_MESSAGES];
}

parser CmeGlobexStreamlinedTcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.technical_header);
        transition select(hdr.technical_header.template_id) {
            16w0x3801: parse_admin_heartbeat;
            16w0x3b01: parse_admin_login;
            16w0x3c01: parse_admin_logout;
            16w0x4d01: parse_md_incremental_refresh_eris_reference_data_and_daily_statistics;
            16w0x5301: parse_md_news_indices;
            16w0x5401: parse_md_incremental_refresh_trade_blocks_340;
            16w0x5901: parse_quote_request;
            16w0x5b01: parse_md_instrument_definition_indices;
            16w0x5c01: parse_md_incremental_refresh_indices;
            16w0x5d01: parse_md_incremental_refresh_trade_blocks_349;
            16w0x5f01: parse_md_incremental_refresh_eris_351;
            16w0x6101: parse_md_incremental_refresh_eris_353;
            16w0x6401: parse_md_incremental_refresh_otc;
            16w0x6b01: parse_md_instrument_definition_eris;
            default: accept;
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

    state parse_md_incremental_refresh_eris_reference_data_and_daily_statistics {
        packet.extract(hdr.md_incremental_refresh_eris_reference_data_and_daily_statistics);
        meta.dispatched = 1;
        meta.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_remaining = hdr.md_incremental_refresh_eris_reference_data_and_daily_statistics.num_in_group_8;
        transition select(meta.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group;
        }
    }

    state parse_md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group {
        packet.extract(hdr.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group.next);
        meta.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_remaining = meta.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_remaining - 1;
        transition select(meta.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group;
        }
    }

    state parse_md_news_indices {
        packet.extract(hdr.md_news_indices);
        meta.dispatched = 1;
        meta.md_news_indices_news_indices_related_sym_group_remaining = hdr.md_news_indices.num_in_group_8;
        transition select(meta.md_news_indices_news_indices_related_sym_group_remaining) {
            8w0: read_md_news_indices_lines_of_text_group;
            default: parse_md_news_indices_news_indices_related_sym_group;
        }
    }

    state parse_md_news_indices_news_indices_related_sym_group {
        packet.extract(hdr.md_news_indices_news_indices_related_sym_group.next);
        meta.md_news_indices_news_indices_related_sym_group_remaining = meta.md_news_indices_news_indices_related_sym_group_remaining - 1;
        transition select(meta.md_news_indices_news_indices_related_sym_group_remaining) {
            8w0: read_md_news_indices_lines_of_text_group;
            default: parse_md_news_indices_news_indices_related_sym_group;
        }
    }

    state read_md_news_indices_lines_of_text_group {
        packet.extract(hdr.md_news_indices_lines_of_text_group_header);
        meta.md_news_indices_lines_of_text_group_remaining = hdr.md_news_indices_lines_of_text_group_header.num_in_group_8;
        transition select(meta.md_news_indices_lines_of_text_group_remaining) {
            8w0: accept;
            default: parse_md_news_indices_lines_of_text_group;
        }
    }

    state parse_md_news_indices_lines_of_text_group {
        packet.extract(hdr.md_news_indices_lines_of_text_group.next);
        meta.md_news_indices_lines_of_text_group_remaining = meta.md_news_indices_lines_of_text_group_remaining - 1;
        transition select(meta.md_news_indices_lines_of_text_group_remaining) {
            8w0: accept;
            default: parse_md_news_indices_lines_of_text_group;
        }
    }

    state parse_md_incremental_refresh_trade_blocks_340 {
        packet.extract(hdr.md_incremental_refresh_trade_blocks_340);
        meta.dispatched = 1;
        meta.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_remaining = hdr.md_incremental_refresh_trade_blocks_340.num_in_group_8;
        transition select(meta.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_trade_blocks_340_trade_blocks_original_group;
        }
    }

    state parse_md_incremental_refresh_trade_blocks_340_trade_blocks_original_group {
        packet.extract(hdr.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group.next);
        meta.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_remaining = meta.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_remaining - 1;
        transition select(meta.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_trade_blocks_340_trade_blocks_original_group;
        }
    }

    state parse_quote_request {
        packet.extract(hdr.quote_request);
        meta.dispatched = 1;
        meta.quote_request_quote_request_related_sym_group_remaining = hdr.quote_request.num_in_group_8;
        transition select(meta.quote_request_quote_request_related_sym_group_remaining) {
            8w0: accept;
            default: parse_quote_request_quote_request_related_sym_group;
        }
    }

    state parse_quote_request_quote_request_related_sym_group {
        packet.extract(hdr.quote_request_quote_request_related_sym_group.next);
        meta.quote_request_quote_request_related_sym_group_remaining = meta.quote_request_quote_request_related_sym_group_remaining - 1;
        transition select(meta.quote_request_quote_request_related_sym_group_remaining) {
            8w0: accept;
            default: parse_quote_request_quote_request_related_sym_group;
        }
    }

    state parse_md_instrument_definition_indices {
        packet.extract(hdr.md_instrument_definition_indices);
        meta.dispatched = 1;
        meta.md_instrument_definition_indices_inst_attrib_group_remaining = hdr.md_instrument_definition_indices.num_in_group;
        transition select(meta.md_instrument_definition_indices_inst_attrib_group_remaining) {
            16w0: read_md_instrument_definition_indices_events_group;
            default: parse_md_instrument_definition_indices_inst_attrib_group;
        }
    }

    state parse_md_instrument_definition_indices_inst_attrib_group {
        packet.extract(hdr.md_instrument_definition_indices_inst_attrib_group.next);
        meta.md_instrument_definition_indices_inst_attrib_group_remaining = meta.md_instrument_definition_indices_inst_attrib_group_remaining - 1;
        transition select(meta.md_instrument_definition_indices_inst_attrib_group_remaining) {
            16w0: read_md_instrument_definition_indices_events_group;
            default: parse_md_instrument_definition_indices_inst_attrib_group;
        }
    }

    state read_md_instrument_definition_indices_events_group {
        packet.extract(hdr.md_instrument_definition_indices_events_group_header);
        meta.md_instrument_definition_indices_events_group_remaining = hdr.md_instrument_definition_indices_events_group_header.num_in_group_8;
        transition select(meta.md_instrument_definition_indices_events_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_indices_events_group;
        }
    }

    state parse_md_instrument_definition_indices_events_group {
        packet.extract(hdr.md_instrument_definition_indices_events_group.next);
        meta.md_instrument_definition_indices_events_group_remaining = meta.md_instrument_definition_indices_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_indices_events_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_indices_events_group;
        }
    }

    state parse_md_incremental_refresh_indices {
        packet.extract(hdr.md_incremental_refresh_indices);
        meta.dispatched = 1;
        meta.md_incremental_refresh_indices_incremental_refresh_indices_group_remaining = hdr.md_incremental_refresh_indices.num_in_group_8;
        transition select(meta.md_incremental_refresh_indices_incremental_refresh_indices_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_indices_incremental_refresh_indices_group;
        }
    }

    state parse_md_incremental_refresh_indices_incremental_refresh_indices_group {
        packet.extract(hdr.md_incremental_refresh_indices_incremental_refresh_indices_group.next);
        meta.md_incremental_refresh_indices_incremental_refresh_indices_group_remaining = meta.md_incremental_refresh_indices_incremental_refresh_indices_group_remaining - 1;
        transition select(meta.md_incremental_refresh_indices_incremental_refresh_indices_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_indices_incremental_refresh_indices_group;
        }
    }

    state parse_md_incremental_refresh_trade_blocks_349 {
        packet.extract(hdr.md_incremental_refresh_trade_blocks_349);
        meta.dispatched = 1;
        meta.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_remaining = hdr.md_incremental_refresh_trade_blocks_349.num_in_group_8;
        transition select(meta.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group;
        }
    }

    state parse_md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group {
        packet.extract(hdr.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group.next);
        meta.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_remaining = meta.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_remaining - 1;
        transition select(meta.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group;
        }
    }

    state parse_md_incremental_refresh_eris_351 {
        packet.extract(hdr.md_incremental_refresh_eris_351);
        meta.dispatched = 1;
        meta.md_incremental_refresh_eris_351_eris_original_group_remaining = hdr.md_incremental_refresh_eris_351.num_in_group_8;
        transition select(meta.md_incremental_refresh_eris_351_eris_original_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_eris_351_eris_original_group;
        }
    }

    state parse_md_incremental_refresh_eris_351_eris_original_group {
        packet.extract(hdr.md_incremental_refresh_eris_351_eris_original_group.next);
        meta.md_incremental_refresh_eris_351_eris_original_group_remaining = meta.md_incremental_refresh_eris_351_eris_original_group_remaining - 1;
        transition select(meta.md_incremental_refresh_eris_351_eris_original_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_eris_351_eris_original_group;
        }
    }

    state parse_md_incremental_refresh_eris_353 {
        packet.extract(hdr.md_incremental_refresh_eris_353);
        meta.dispatched = 1;
        meta.md_incremental_refresh_eris_353_eris_group_remaining = hdr.md_incremental_refresh_eris_353.num_in_group_8;
        transition select(meta.md_incremental_refresh_eris_353_eris_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_eris_353_eris_group;
        }
    }

    state parse_md_incremental_refresh_eris_353_eris_group {
        packet.extract(hdr.md_incremental_refresh_eris_353_eris_group.next);
        meta.md_incremental_refresh_eris_353_eris_group_remaining = meta.md_incremental_refresh_eris_353_eris_group_remaining - 1;
        transition select(meta.md_incremental_refresh_eris_353_eris_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_eris_353_eris_group;
        }
    }

    state parse_md_incremental_refresh_otc {
        packet.extract(hdr.md_incremental_refresh_otc);
        meta.dispatched = 1;
        meta.md_incremental_refresh_otc_otc_original_group_remaining = hdr.md_incremental_refresh_otc.num_in_group_8;
        transition select(meta.md_incremental_refresh_otc_otc_original_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_otc_otc_original_group;
        }
    }

    state parse_md_incremental_refresh_otc_otc_original_group {
        packet.extract(hdr.md_incremental_refresh_otc_otc_original_group.next);
        meta.md_incremental_refresh_otc_otc_original_group_remaining = meta.md_incremental_refresh_otc_otc_original_group_remaining - 1;
        transition select(meta.md_incremental_refresh_otc_otc_original_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_otc_otc_original_group;
        }
    }

    state parse_md_instrument_definition_eris {
        packet.extract(hdr.md_instrument_definition_eris);
        meta.dispatched = 1;
        meta.md_instrument_definition_eris_eris_feed_types_group_remaining = hdr.md_instrument_definition_eris.num_in_group_8;
        transition select(meta.md_instrument_definition_eris_eris_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_eris_events_group;
            default: parse_md_instrument_definition_eris_eris_feed_types_group;
        }
    }

    state parse_md_instrument_definition_eris_eris_feed_types_group {
        packet.extract(hdr.md_instrument_definition_eris_eris_feed_types_group.next);
        meta.md_instrument_definition_eris_eris_feed_types_group_remaining = meta.md_instrument_definition_eris_eris_feed_types_group_remaining - 1;
        transition select(meta.md_instrument_definition_eris_eris_feed_types_group_remaining) {
            8w0: read_md_instrument_definition_eris_events_group;
            default: parse_md_instrument_definition_eris_eris_feed_types_group;
        }
    }

    state read_md_instrument_definition_eris_events_group {
        packet.extract(hdr.md_instrument_definition_eris_events_group_header);
        meta.md_instrument_definition_eris_events_group_remaining = hdr.md_instrument_definition_eris_events_group_header.num_in_group_8;
        transition select(meta.md_instrument_definition_eris_events_group_remaining) {
            8w0: read_md_instrument_definition_eris_eris_security_alt_id_group;
            default: parse_md_instrument_definition_eris_events_group;
        }
    }

    state parse_md_instrument_definition_eris_events_group {
        packet.extract(hdr.md_instrument_definition_eris_events_group.next);
        meta.md_instrument_definition_eris_events_group_remaining = meta.md_instrument_definition_eris_events_group_remaining - 1;
        transition select(meta.md_instrument_definition_eris_events_group_remaining) {
            8w0: read_md_instrument_definition_eris_eris_security_alt_id_group;
            default: parse_md_instrument_definition_eris_events_group;
        }
    }

    state read_md_instrument_definition_eris_eris_security_alt_id_group {
        packet.extract(hdr.md_instrument_definition_eris_eris_security_alt_id_group_header);
        meta.md_instrument_definition_eris_eris_security_alt_id_group_remaining = hdr.md_instrument_definition_eris_eris_security_alt_id_group_header.num_in_group_8;
        transition select(meta.md_instrument_definition_eris_eris_security_alt_id_group_remaining) {
            8w0: read_md_instrument_definition_eris_eris_legs_group;
            default: parse_md_instrument_definition_eris_eris_security_alt_id_group;
        }
    }

    state parse_md_instrument_definition_eris_eris_security_alt_id_group {
        packet.extract(hdr.md_instrument_definition_eris_eris_security_alt_id_group.next);
        meta.md_instrument_definition_eris_eris_security_alt_id_group_remaining = meta.md_instrument_definition_eris_eris_security_alt_id_group_remaining - 1;
        transition select(meta.md_instrument_definition_eris_eris_security_alt_id_group_remaining) {
            8w0: read_md_instrument_definition_eris_eris_legs_group;
            default: parse_md_instrument_definition_eris_eris_security_alt_id_group;
        }
    }

    state read_md_instrument_definition_eris_eris_legs_group {
        packet.extract(hdr.md_instrument_definition_eris_eris_legs_group_header);
        meta.md_instrument_definition_eris_eris_legs_group_remaining = hdr.md_instrument_definition_eris_eris_legs_group_header.num_in_group_8;
        transition select(meta.md_instrument_definition_eris_eris_legs_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_eris_eris_legs_group;
        }
    }

    state parse_md_instrument_definition_eris_eris_legs_group {
        packet.extract(hdr.md_instrument_definition_eris_eris_legs_group.next);
        meta.md_instrument_definition_eris_eris_legs_group_remaining = meta.md_instrument_definition_eris_eris_legs_group_remaining - 1;
        transition select(meta.md_instrument_definition_eris_eris_legs_group_remaining) {
            8w0: accept;
            default: parse_md_instrument_definition_eris_eris_legs_group;
        }
    }

}

control CmeGlobexStreamlinedTcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexStreamlinedTcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control CmeGlobexStreamlinedTcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexStreamlinedTcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexStreamlinedTcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.technical_header);
        packet.emit(hdr.admin_login);
        packet.emit(hdr.admin_logout);
        packet.emit(hdr.md_incremental_refresh_eris_reference_data_and_daily_statistics);
        packet.emit(hdr.md_incremental_refresh_eris_reference_data_and_daily_statistics_eris_reference_data_group);
        packet.emit(hdr.md_news_indices);
        packet.emit(hdr.md_news_indices_news_indices_related_sym_group);
        packet.emit(hdr.md_news_indices_lines_of_text_group_header);
        packet.emit(hdr.md_news_indices_lines_of_text_group);
        packet.emit(hdr.md_incremental_refresh_trade_blocks_340);
        packet.emit(hdr.md_incremental_refresh_trade_blocks_340_trade_blocks_original_group);
        packet.emit(hdr.quote_request);
        packet.emit(hdr.quote_request_quote_request_related_sym_group);
        packet.emit(hdr.md_instrument_definition_indices);
        packet.emit(hdr.md_instrument_definition_indices_inst_attrib_group);
        packet.emit(hdr.md_instrument_definition_indices_events_group_header);
        packet.emit(hdr.md_instrument_definition_indices_events_group);
        packet.emit(hdr.md_incremental_refresh_indices);
        packet.emit(hdr.md_incremental_refresh_indices_incremental_refresh_indices_group);
        packet.emit(hdr.md_incremental_refresh_trade_blocks_349);
        packet.emit(hdr.md_incremental_refresh_trade_blocks_349_trade_blocks_legacy_group);
        packet.emit(hdr.md_incremental_refresh_eris_351);
        packet.emit(hdr.md_incremental_refresh_eris_351_eris_original_group);
        packet.emit(hdr.md_incremental_refresh_eris_353);
        packet.emit(hdr.md_incremental_refresh_eris_353_eris_group);
        packet.emit(hdr.md_incremental_refresh_otc);
        packet.emit(hdr.md_incremental_refresh_otc_otc_original_group);
        packet.emit(hdr.md_instrument_definition_eris);
        packet.emit(hdr.md_instrument_definition_eris_eris_feed_types_group);
        packet.emit(hdr.md_instrument_definition_eris_events_group_header);
        packet.emit(hdr.md_instrument_definition_eris_events_group);
        packet.emit(hdr.md_instrument_definition_eris_eris_security_alt_id_group_header);
        packet.emit(hdr.md_instrument_definition_eris_eris_security_alt_id_group);
        packet.emit(hdr.md_instrument_definition_eris_eris_legs_group_header);
        packet.emit(hdr.md_instrument_definition_eris_eris_legs_group);
    }
}

V1Switch(
    CmeGlobexStreamlinedTcpParser(),
    CmeGlobexStreamlinedTcpVerifyChecksum(),
    CmeGlobexStreamlinedTcpIngress(),
    CmeGlobexStreamlinedTcpEgress(),
    CmeGlobexStreamlinedTcpComputeChecksum(),
    CmeGlobexStreamlinedTcpDeparser()
) main;
