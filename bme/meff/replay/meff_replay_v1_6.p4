// P4_16 (v1model) definition for: Bme Meff Replay BmeGate v1.6
// 
// Protocol:
//   Organization: Bolsas y Mercados Españoles
//   Protocol: MEFF Replay
//   Encoding: BMEGate Binary Interface
//   Version: 1.6
//   Date: 06/13/2025
//   Specification: BMEGate binary protocol B1.6.pdf
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
    bit<16> message_size;
    bit<8> message_type;
}

header logon_response_message_t {
    bit<32> sequence_number;
    bit<8> heart_bt_int;
    bit<48> protocol_version;
    bit<8> test_production_ind;
    bit<16> environment_code;
    bit<32> session_date;
    bit<32> expected_sequence_number;
    bit<32> sequence_number_to;
}

header logout_response_message_t {
    bit<32> sequence_number;
    bit<8> logout_reason;
}

header heartbeat_message_t {
    bit<32> sequence_number;
}

header network_status_message_t {
    bit<32> sequence_number;
    bit<8> network_status_value;
}

header logon_message_t {
    bit<56> username;
    bit<80> password;
    bit<200> software_name;
    bit<32> expected_sequence_number;
    bit<8> subscriptions;
    bit<48> protocol_version;
}

header reject_message_t {
    bit<32> sequence_number;
    bit<8> session_reject_reason;
    bit<464> text;
    bit<56> msg_rejected_reference;
}

header replay_request_message_t {
    bit<32> sequence_number_from;
    bit<32> sequence_number_to;
    bit<32> request_id;
}

header replay_request_ack_nack_message_t {
    bit<32> sequence_number;
    bit<32> sequence_number_from;
    bit<32> sequence_number_to;
    bit<32> request_id;
    bit<8> status;
}

header trading_session_status_message_t {
    bit<32> sequence_number;
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> trad_ses_status;
    bit<64> transaction_date_and_time;
}

header news_message_t {
    bit<32> sequence_number;
    bit<624> news_text;
}

header security_list_cancellation_report_message_t {
    bit<32> sequence_number;
    bit<32> market_id;
    bit<32> market_segment_id;
    bit<32> security_code;
    bit<176> symbol;
    bit<96> symbol_isin;
}

header statistics_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<8> data_count;
}

header statistics_message_statistics_repeating_group_t {
    bit<8> data_code;
    bit<64> data_value;
}

header security_list_message_t {
    bit<32> sequence_number;
    bit<32> market_id;
    bit<32> market_segment_id;
    bit<32> security_code;
    bit<176> symbol;
    bit<96> symbol_isin;
    bit<280> fisn;
    bit<160> issuer_lei;
    bit<16> security_group;
    bit<40> family_code;
    bit<48> cfi_code;
    bit<16> security_type;
    bit<32> maturity_date;
    bit<32> issue_date;
    bit<64> contract_multiplier;
    bit<64> li_spre;
    bit<64> sst_ipre;
    bit<64> li_spost;
    bit<64> sst_ipost;
    bit<8> liquid_instrument;
    bit<8> admission_requested_by_issuer;
    bit<32> min_trade_vol;
    bit<32> round_lot;
    bit<24> currency;
    bit<32> modality_mask_b_4;
    bit<640> security_description;
    bit<8> trading_obligation;
    bit<160> sec_description;
    bit<176> underlying_asset;
    bit<96> security_sub_type;
    bit<64> maturity_month_year;
    bit<64> strike_price;
    bit<64> strike_value;
    bit<8> opt_attribute;
    bit<64> min_price_increment;
    bit<160> unit_of_measure;
    bit<8> settl_method;
    bit<8> exercise_style;
    bit<8> put_or_call;
    bit<8> flexible_indicator;
    bit<32> last_trading_day;
    bit<8> number_of_decimals;
    bit<8> order_number_of_decimals;
    bit<8> adjustments_rule;
    bit<64> maximum_order_size;
    bit<8> self_match_prevention;
    bit<8> commodity_derivative_indicator;
    bit<176> stock_when_underlying_is_dividend;
    bit<32> base_product;
    bit<32> sub_product;
    bit<32> further_sub_product;
    bit<24> base_currency;
    bit<24> quoted_currency;
    bit<8> maturity_month_year_increment_units;
    bit<64> start_maturity_month_year;
    bit<64> end_maturity_month_year;
    bit<8> maturity_month_year_increment;
    bit<176> underlying_symbol;
    bit<96> underlying_isin;
    bit<24> underlying_currency;
    bit<160> underlying_security_issuer_lei;
    bit<8> x_rolling_closing_type;
    bit<8> x_rolling_reference_buyer_rate;
    bit<64> x_rolling_buyer_markup;
    bit<8> x_rolling_reference_seller_rate;
    bit<64> x_rolling_seller_markup;
    bit<64> x_rolling_dividend_percentage;
    bit<16> x_rolling_dividend_pay_date_diff;
    bit<176> leg_symbol_1;
    bit<32> leg_ratio_qty_1;
    bit<8> leg_side_1;
    bit<64> leg_price_1;
    bit<176> leg_symbol_2;
    bit<32> leg_ratio_qty_2;
    bit<8> leg_side_2;
    bit<64> leg_price_2;
    bit<176> leg_symbol_3;
    bit<32> leg_ratio_qty_3;
    bit<8> leg_side_3;
    bit<64> leg_price_3;
    bit<176> leg_symbol_4;
    bit<32> leg_ratio_qty_4;
    bit<8> leg_side_4;
    bit<64> leg_price_4;
    bit<176> leg_symbol_5;
    bit<32> leg_ratio_qty_5;
    bit<8> leg_side_5;
    bit<64> leg_price_5;
}

header security_list_update_report_message_t {
    bit<32> sequence_number;
    bit<32> market_id;
    bit<32> market_segment_id;
    bit<32> security_code;
    bit<176> symbol;
    bit<96> symbol_isin;
    bit<280> fisn;
    bit<160> issuer_lei;
    bit<16> security_group;
    bit<40> family_code;
    bit<48> cfi_code;
    bit<16> security_type;
    bit<32> maturity_date;
    bit<32> issue_date;
    bit<64> contract_multiplier;
    bit<64> li_spre;
    bit<64> sst_ipre;
    bit<64> li_spost;
    bit<64> sst_ipost;
    bit<8> liquid_instrument;
    bit<8> admission_requested_by_issuer;
    bit<32> min_trade_vol;
    bit<32> round_lot;
    bit<24> currency;
    bit<32> modality_mask_b_4;
    bit<640> security_description;
    bit<8> trading_obligation;
    bit<160> sec_description;
    bit<176> underlying_asset;
    bit<96> security_sub_type;
    bit<64> maturity_month_year;
    bit<64> strike_price;
    bit<64> strike_value;
    bit<8> opt_attribute;
    bit<64> min_price_increment;
    bit<160> unit_of_measure;
    bit<8> settl_method;
    bit<8> exercise_style;
    bit<8> put_or_call;
    bit<8> flexible_indicator;
    bit<32> last_trading_day;
    bit<8> number_of_decimals;
    bit<8> order_number_of_decimals;
    bit<8> adjustments_rule;
    bit<64> maximum_order_size;
    bit<8> self_match_prevention;
    bit<8> commodity_derivative_indicator;
    bit<176> stock_when_underlying_is_dividend;
    bit<32> base_product;
    bit<32> sub_product;
    bit<32> further_sub_product;
    bit<24> base_currency;
    bit<24> quoted_currency;
    bit<8> maturity_month_year_increment_units;
    bit<64> start_maturity_month_year;
    bit<64> end_maturity_month_year;
    bit<8> maturity_month_year_increment;
    bit<176> underlying_symbol;
    bit<96> underlying_isin;
    bit<24> underlying_currency;
    bit<160> underlying_security_issuer_lei;
    bit<8> x_rolling_closing_type;
    bit<8> x_rolling_reference_buyer_rate;
    bit<64> x_rolling_buyer_markup;
    bit<8> x_rolling_reference_seller_rate;
    bit<64> x_rolling_seller_markup;
    bit<64> x_rolling_dividend_percentage;
    bit<16> x_rolling_dividend_pay_date_diff;
    bit<176> leg_symbol_1;
    bit<32> leg_ratio_qty_1;
    bit<8> leg_side_1;
    bit<64> leg_price_1;
    bit<176> leg_symbol_2;
    bit<32> leg_ratio_qty_2;
    bit<8> leg_side_2;
    bit<64> leg_price_2;
    bit<176> leg_symbol_3;
    bit<32> leg_ratio_qty_3;
    bit<8> leg_side_3;
    bit<64> leg_price_3;
    bit<176> leg_symbol_4;
    bit<32> leg_ratio_qty_4;
    bit<8> leg_side_4;
    bit<64> leg_price_4;
    bit<176> leg_symbol_5;
    bit<32> leg_ratio_qty_5;
    bit<8> leg_side_5;
    bit<64> leg_price_5;
}

header security_status_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<8> security_trading_status;
    bit<8> non_availability_reason;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
}

header family_status_message_t {
    bit<32> sequence_number;
    bit<16> security_group;
    bit<40> family_code;
    bit<64> transaction_date_and_time;
    bit<8> security_trading_status;
    bit<8> non_availability_reason;
}

header order_book_clear_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
}

header order_market_pre_transparency_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<8> side;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<8> retail_cl_flag;
}

header quote_market_pre_transparency_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> secondary_order_id_2;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
}

header order_cancellation_market_member_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> entry_date;
}

header quote_cancellation_market_member_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> secondary_order_id_2;
}

header trade_market_post_transparency_information_topofbook_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<8> transaction_category;
    bit<32> strategy_trd_match_id;
}

header trade_trade_amendment_or_cancellation_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<8> transaction_category;
    bit<32> strategy_trd_match_id;
    bit<8> last_change_flag;
    bit<8> bencrfpt_flag;
    bit<8> trade_price_condition;
    bit<8> pre_trade_transparency_waiver;
    bit<8> deferral_waiver;
    bit<8> post_deferral_publication_type;
    bit<64> publish_date_and_time;
    bit<64> trade_date;
    bit<32> trade_session_date;
    bit<8> amended_trade_type;
    bit<32> exec_ref_id;
    bit<32> amended_trade_date;
}

header trade_market_post_transparency_information_full_depth_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<8> transaction_category;
    bit<32> strategy_trd_match_id;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<8> retail_cl_flag;
    bit<32> secondary_order_id_2;
    bit<32> entry_date_2;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<8> retail_cl_flag_2;
}

header indication_of_interest_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> ioiid;
    bit<8> ioi_trans_type;
    bit<8> side;
    bit<32> ioi_qty;
    bit<64> ioi_price;
    bit<8> ioi_qlty_ind;
    bit<8> trading_session_id;
}

header rfq_market_pre_transparency_information_message_t {
    bit<32> sequence_number;
    bit<32> rfqid;
    bit<8> trading_session_id;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<64> mid_buy_price;
    bit<32> mid_buy_volume;
    bit<16> buy_rf_qs_number;
    bit<64> mid_sell_price;
    bit<32> mid_sell_volume;
    bit<16> sell_rf_qs_number;
    bit<16> bid_orders_1;
    bit<32> bid_size_1;
    bit<64> bid_px_1;
    bit<16> ask_orders_1;
    bit<32> ask_size_1;
    bit<64> ask_px_1;
    bit<16> bid_orders_2;
    bit<32> bid_size_2;
    bit<64> bid_px_2;
    bit<16> ask_orders_2;
    bit<32> ask_size_2;
    bit<64> ask_px_2;
    bit<16> bid_orders_3;
    bit<32> bid_size_3;
    bit<64> bid_px_3;
    bit<16> ask_orders_3;
    bit<32> ask_size_3;
    bit<64> ask_px_3;
    bit<16> bid_orders_4;
    bit<32> bid_size_4;
    bit<64> bid_px_4;
    bit<16> ask_orders_4;
    bit<32> ask_size_4;
    bit<64> ask_px_4;
    bit<16> bid_orders_5;
    bit<32> bid_size_5;
    bit<64> bid_px_5;
    bit<16> ask_orders_5;
    bit<32> ask_size_5;
    bit<64> ask_px_5;
}

header topofbook_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<16> bid_orders_1;
    bit<32> bid_size_1;
    bit<64> bid_px_1;
    bit<8> retail_cl_bid_flag_1;
    bit<16> ask_orders_1;
    bit<32> ask_size_1;
    bit<64> ask_px_1;
    bit<8> retail_cl_ask_flag_1;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> statistics_message_statistics_repeating_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    logon_response_message_t logon_response_message;
    logout_response_message_t logout_response_message;
    heartbeat_message_t heartbeat_message;
    network_status_message_t network_status_message;
    logon_message_t logon_message;
    reject_message_t reject_message;
    replay_request_message_t replay_request_message;
    replay_request_ack_nack_message_t replay_request_ack_nack_message;
    trading_session_status_message_t trading_session_status_message;
    news_message_t news_message;
    security_list_cancellation_report_message_t security_list_cancellation_report_message;
    statistics_message_t statistics_message;
    statistics_message_statistics_repeating_group_t statistics_message_statistics_repeating_group[MAX_MESSAGES];
    security_list_message_t security_list_message;
    security_list_update_report_message_t security_list_update_report_message;
    security_status_message_t security_status_message;
    family_status_message_t family_status_message;
    order_book_clear_message_t order_book_clear_message;
    order_market_pre_transparency_information_message_t order_market_pre_transparency_information_message;
    quote_market_pre_transparency_information_message_t quote_market_pre_transparency_information_message;
    order_cancellation_market_member_message_t order_cancellation_market_member_message;
    quote_cancellation_market_member_message_t quote_cancellation_market_member_message;
    trade_market_post_transparency_information_topofbook_message_t trade_market_post_transparency_information_topofbook_message;
    trade_trade_amendment_or_cancellation_message_t trade_trade_amendment_or_cancellation_message;
    trade_market_post_transparency_information_full_depth_message_t trade_market_post_transparency_information_full_depth_message;
    indication_of_interest_message_t indication_of_interest_message;
    rfq_market_pre_transparency_information_message_t rfq_market_pre_transparency_information_message;
    topofbook_message_t topofbook_message;
}

parser MeffReplayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x08: parse_logon_response_message;
            8w0x0B: parse_logout_response_message;
            8w0x30: parse_heartbeat_message;
            8w0x0A: parse_network_status_message;
            8w0x41: parse_logon_message;
            8w0x35: parse_logout_message;
            8w0x0D: parse_reject_message;
            8w0x09: parse_replay_request_message;
            8w0x0C: parse_replay_request_ack_nack_message;
            8w0x68: parse_trading_session_status_message;
            8w0x42: parse_news_message;
            8w0x78: parse_security_list_cancellation_report_message;
            8w0x84: parse_statistics_message;
            8w0x79: parse_security_list_message;
            8w0x80: parse_security_list_update_report_message;
            8w0x66: parse_security_status_message;
            8w0x89: parse_family_status_message;
            8w0x81: parse_order_book_clear_message;
            8w0x03: parse_order_market_pre_transparency_information_message;
            8w0x07: parse_quote_market_pre_transparency_information_message;
            8w0x01: parse_order_cancellation_market_member_message;
            8w0x05: parse_quote_cancellation_market_member_message;
            8w0x10: parse_trade_market_post_transparency_information_topofbook_message;
            8w0x18: parse_trade_trade_amendment_or_cancellation_message;
            8w0x11: parse_trade_market_post_transparency_information_full_depth_message;
            8w0x36: parse_indication_of_interest_message;
            8w0x85: parse_rfq_market_pre_transparency_information_message;
            8w0x82: parse_topofbook_message;
            default: accept;
        }
    }

    state parse_logon_response_message {
        packet.extract(hdr.logon_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_response_message {
        packet.extract(hdr.logout_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_network_status_message {
        packet.extract(hdr.network_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_request_ack_nack_message {
        packet.extract(hdr.replay_request_ack_nack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_news_message {
        packet.extract(hdr.news_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_list_cancellation_report_message {
        packet.extract(hdr.security_list_cancellation_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_statistics_message {
        packet.extract(hdr.statistics_message);
        meta.dispatched = 1;
        meta.statistics_message_statistics_repeating_group_remaining = hdr.statistics_message.data_count;
        transition select(meta.statistics_message_statistics_repeating_group_remaining) {
            8w0: accept;
            default: parse_statistics_message_statistics_repeating_group;
        }
    }

    state parse_statistics_message_statistics_repeating_group {
        packet.extract(hdr.statistics_message_statistics_repeating_group.next);
        meta.statistics_message_statistics_repeating_group_remaining = meta.statistics_message_statistics_repeating_group_remaining - 1;
        transition select(meta.statistics_message_statistics_repeating_group_remaining) {
            8w0: accept;
            default: parse_statistics_message_statistics_repeating_group;
        }
    }

    state parse_security_list_message {
        packet.extract(hdr.security_list_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_list_update_report_message {
        packet.extract(hdr.security_list_update_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_family_status_message {
        packet.extract(hdr.family_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_clear_message {
        packet.extract(hdr.order_book_clear_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_market_pre_transparency_information_message {
        packet.extract(hdr.order_market_pre_transparency_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_market_pre_transparency_information_message {
        packet.extract(hdr.quote_market_pre_transparency_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_market_member_message {
        packet.extract(hdr.order_cancellation_market_member_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_cancellation_market_member_message {
        packet.extract(hdr.quote_cancellation_market_member_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_market_post_transparency_information_topofbook_message {
        packet.extract(hdr.trade_market_post_transparency_information_topofbook_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_trade_amendment_or_cancellation_message {
        packet.extract(hdr.trade_trade_amendment_or_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_market_post_transparency_information_full_depth_message {
        packet.extract(hdr.trade_market_post_transparency_information_full_depth_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indication_of_interest_message {
        packet.extract(hdr.indication_of_interest_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_market_pre_transparency_information_message {
        packet.extract(hdr.rfq_market_pre_transparency_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_topofbook_message {
        packet.extract(hdr.topofbook_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control MeffReplayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MeffReplayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control MeffReplayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MeffReplayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MeffReplayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.logon_response_message);
        packet.emit(hdr.logout_response_message);
        packet.emit(hdr.heartbeat_message);
        packet.emit(hdr.network_status_message);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_request_ack_nack_message);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.news_message);
        packet.emit(hdr.security_list_cancellation_report_message);
        packet.emit(hdr.statistics_message);
        packet.emit(hdr.statistics_message_statistics_repeating_group);
        packet.emit(hdr.security_list_message);
        packet.emit(hdr.security_list_update_report_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.family_status_message);
        packet.emit(hdr.order_book_clear_message);
        packet.emit(hdr.order_market_pre_transparency_information_message);
        packet.emit(hdr.quote_market_pre_transparency_information_message);
        packet.emit(hdr.order_cancellation_market_member_message);
        packet.emit(hdr.quote_cancellation_market_member_message);
        packet.emit(hdr.trade_market_post_transparency_information_topofbook_message);
        packet.emit(hdr.trade_trade_amendment_or_cancellation_message);
        packet.emit(hdr.trade_market_post_transparency_information_full_depth_message);
        packet.emit(hdr.indication_of_interest_message);
        packet.emit(hdr.rfq_market_pre_transparency_information_message);
        packet.emit(hdr.topofbook_message);
    }
}

V1Switch(
    MeffReplayParser(),
    MeffReplayVerifyChecksum(),
    MeffReplayIngress(),
    MeffReplayEgress(),
    MeffReplayComputeChecksum(),
    MeffReplayDeparser()
) main;
