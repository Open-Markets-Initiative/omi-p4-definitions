// P4_16 (v1model) definition for: Coinbase Deribit OrdersApi Sbe v1.3
// 
// Protocol:
//   Organization: Coinbase
//   Protocol: Orders Api
//   Encoding: Simple Binary Encoding
//   Version: 1.3
//   Date: 6/8/2026
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

header session_flags_t {
    bit<8> protocol_id;
    bit<7> reserved_bits;
    bit<1> is_resend;
    bit<16> message_length;
    bit<16> template_id;
    bit<16> schema_version;
    bit<64> sequence_number;
    bit<64> last_processed_seq_no;
    bit<64> send_time_ns;
}

header logon_message_t {
    bit<128> client_id;
    bit<384> secret;
    bit<8> reset_seq_num;
}

header logon_conf_message_t {
    bit<32> heartbeat_interval_seconds;
}

header logout_message_t {
    bit<8> reason_length;
}

header logged_out_message_t {
    bit<8> reason_length;
}

header heartbeat_message_t {
    bit<64> correlation_id;
}

header test_request_message_t {
    bit<64> correlation_id;
}

header resend_request_message_t {
    bit<64> from_sequence_number;
    bit<64> to_sequence_number;
}

header gap_fill_message_t {
    bit<64> new_sequence_number;
}

header reject_message_t {
    bit<64> ref_sequence_number;
    bit<8> reason_reject_reason;
    bit<8> details_length;
}

header new_order_request_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> instrument_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> self_match_prevention_id;
    bit<8> side;
    bit<8> time_in_force;
    bit<10> reserved_10;
    bit<1> reset_mmp;
    bit<1> mmp;
    bit<1> market_limit;
    bit<1> post_only_reject;
    bit<1> post_only;
    bit<1> cancel_on_disconnect;
    bit<8> self_trading_mode;
}

header amend_order_request_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> instrument_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<13> reserved_13;
    bit<1> post_only_reject;
    bit<1> post_only;
    bit<1> unused_replace_order_flags_0;
}

header cancel_order_request_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> instrument_id;
}

header cancel_order_by_id_request_message_t {
    bit<64> order_id;
    bit<64> correlation_id;
    bit<64> instrument_id;
}

header mass_quote_request_message_t {
    bit<64> quote_id;
    bit<64> correlation_id;
    bit<64> mmp_group_id;
    bit<64> self_match_prevention_id;
    bit<7> reserved_7;
    bit<1> reset_mmp;
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_request_message_mass_quote_request_message_quotes_group_t {
    bit<64> instrument_id;
    bit<64> bid_price_optional;
    bit<64> ask_price_optional;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<10> reserved_10;
    bit<1> reset_mmp;
    bit<1> mmp;
    bit<1> market_limit;
    bit<1> post_only_reject;
    bit<1> post_only;
    bit<1> cancel_on_disconnect;
    bit<10> reserved_10_2;
    bit<1> reset_mmp_2;
    bit<1> mmp_2;
    bit<1> market_limit_2;
    bit<1> post_only_reject_2;
    bit<1> post_only_2;
    bit<1> cancel_on_disconnect_2;
}

header mass_cancel_request_message_t {
    bit<64> correlation_id;
    bit<64> currency_pair_id;
    bit<64> instrument_id_optional;
    bit<8> product_type;
    bit<8> side;
}

header mass_quote_cancel_request_message_t {
    bit<64> correlation_id;
    bit<64> mmp_group_id;
    bit<8> side;
}

header get_mass_quote_mmp_status_request_message_t {
    bit<64> correlation_id;
    bit<64> mmp_group_id;
}

header get_orders_mmp_status_request_message_t {
    bit<64> correlation_id;
    bit<64> currency_pair_id;
}

header new_order_response_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<64> receive_time;
    bit<8> side;
    bit<8> status;
    bit<8> cancel_reason;
    bit<16> block_length;
    bit<16> num_in_group;
}

header new_order_response_message_new_order_response_message_fills_group_t {
    bit<64> match_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
}

header new_order_response_message_new_order_response_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header new_order_response_message_new_order_response_message_legs_group_t {
    bit<64> match_id;
    bit<64> fill_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> leg_side;
}

header new_order_reject_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<8> reason_order_reject_reason;
    bit<8> details_length;
}

header amend_order_response_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<64> receive_time;
    bit<8> status;
    bit<8> cancel_reason;
    bit<16> block_length;
    bit<16> num_in_group;
}

header amend_order_response_message_amend_order_response_message_fills_group_t {
    bit<64> match_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
}

header amend_order_response_message_amend_order_response_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header amend_order_response_message_amend_order_response_message_legs_group_t {
    bit<64> match_id;
    bit<64> fill_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> leg_side;
}

header amend_order_reject_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<8> reason_order_reject_reason;
    bit<8> details_length;
}

header cancel_order_response_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> receive_time;
}

header cancel_order_reject_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id_optional;
    bit<64> instrument_id;
    bit<8> reason_cancel_order_reject_reason;
    bit<8> details_length;
}

header mass_quote_response_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> quote_id;
    bit<64> correlation_id;
    bit<64> mmp_group_id;
    bit<64> receive_time;
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_response_message_mass_quote_response_message_quotes_group_t {
    bit<64> instrument_id;
    bit<64> bid_order_id;
    bit<64> ask_order_id;
    bit<64> bid_price;
    bit<64> ask_price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<64> mantissa_4;
    bit<8> exponent_4;
    bit<8> bid_status;
    bit<8> ask_status;
    bit<8> bid_reject_reason;
    bit<8> ask_reject_reason;
}

header mass_quote_response_message_mass_quote_response_message_bid_fills_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_response_message_mass_quote_response_message_bid_fills_group_t {
    bit<64> match_id;
    bit<64> instrument_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
}

header mass_quote_response_message_mass_quote_response_message_ask_fills_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_response_message_mass_quote_response_message_ask_fills_group_t {
    bit<64> match_id;
    bit<64> instrument_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
}

header mass_quote_response_message_mass_quote_response_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_response_message_mass_quote_response_message_legs_group_t {
    bit<64> match_id;
    bit<64> fill_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> leg_side;
}

header mass_quote_reject_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> quote_id;
    bit<64> correlation_id;
    bit<64> mmp_group_id;
    bit<8> reason_mass_quote_reject_reason;
    bit<8> details_length;
}

header mass_cancel_response_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> correlation_id;
    bit<64> receive_time;
    bit<32> total_order_count;
}

header mass_cancel_reject_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> correlation_id;
    bit<8> reason_mass_cancel_reject_reason;
    bit<8> details_length;
}

header get_mass_quote_mmp_status_response_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<64> mmp_group_id;
    bit<64> frozen_until_time;
}

header get_mass_quote_mmp_status_reject_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<8> reason_mmp_status_reject_reason;
}

header get_orders_mmp_status_response_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<64> currency_pair_id;
    bit<64> frozen_until_time;
}

header get_orders_mmp_status_reject_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<8> reason_mmp_status_reject_reason;
}

header order_filled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header order_filled_message_order_filled_message_fills_group_t {
    bit<64> client_order_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> match_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<8> side;
    bit<6> reserved_6;
    bit<1> is_fully_filled;
    bit<1> is_quote;
}

header order_filled_message_order_filled_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header order_filled_message_order_filled_message_legs_group_t {
    bit<64> match_id;
    bit<64> fill_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> leg_side;
}

header orders_canceled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<7> reserved_7;
    bit<1> is_last_message;
    bit<16> block_length;
    bit<16> num_in_group;
}

header orders_canceled_message_orders_canceled_message_orders_group_t {
    bit<64> client_order_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> cancel_reason;
    bit<7> reserved_7;
    bit<1> is_quote;
}

header order_placed_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<8> status;
    bit<8> cancel_reason;
    bit<24> padding_3;
    bit<64> correlation_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header order_placed_message_order_placed_message_fills_group_t {
    bit<64> match_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
}

header order_placed_message_order_placed_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header order_placed_message_order_placed_message_legs_group_t {
    bit<64> match_id;
    bit<64> fill_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> leg_side;
}

header mass_quote_orders_placed_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> mmp_group_id;
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_t {
    bit<64> client_order_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<8> side;
    bit<8> status;
    bit<8> cancel_reason;
}

header mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_t {
    bit<64> match_id;
    bit<64> order_id_fill_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
}

header mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_t {
    bit<64> match_id;
    bit<64> fill_id;
    bit<64> fill_price;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> leg_side;
}

header mass_quote_mmp_triggered_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> mmp_group_id;
    bit<64> frozen_until;
    bit<64> quantity_level;
    bit<64> vega_level;
    bit<64> delta_level;
    bit<8> trigger;
}

header orders_mmp_triggered_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> currency_pair_id;
    bit<64> frozen_until;
    bit<64> quantity_level;
    bit<64> vega_level;
    bit<64> delta_level;
    bit<8> trigger;
}

header mass_quote_mmp_unfrozen_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> mmp_group_id;
    bit<64> correlation_id_optional;
}

header orders_mmp_unfrozen_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> currency_pair_id;
    bit<64> correlation_id_optional;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> mass_quote_request_message_mass_quote_request_message_quotes_group_remaining;
    bit<16> new_order_response_message_new_order_response_message_fills_group_remaining;
    bit<16> new_order_response_message_new_order_response_message_legs_group_remaining;
    bit<16> amend_order_response_message_amend_order_response_message_fills_group_remaining;
    bit<16> amend_order_response_message_amend_order_response_message_legs_group_remaining;
    bit<16> mass_quote_response_message_mass_quote_response_message_quotes_group_remaining;
    bit<16> mass_quote_response_message_mass_quote_response_message_bid_fills_group_remaining;
    bit<16> mass_quote_response_message_mass_quote_response_message_ask_fills_group_remaining;
    bit<16> mass_quote_response_message_mass_quote_response_message_legs_group_remaining;
    bit<16> order_filled_message_order_filled_message_fills_group_remaining;
    bit<16> order_filled_message_order_filled_message_legs_group_remaining;
    bit<16> orders_canceled_message_orders_canceled_message_orders_group_remaining;
    bit<16> order_placed_message_order_placed_message_fills_group_remaining;
    bit<16> order_placed_message_order_placed_message_legs_group_remaining;
    bit<16> mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_remaining;
    bit<16> mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_remaining;
    bit<16> mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_remaining;
}

struct headers_t {
    session_flags_t session_flags;
    logon_message_t logon_message;
    logon_conf_message_t logon_conf_message;
    logout_message_t logout_message;
    logged_out_message_t logged_out_message;
    heartbeat_message_t heartbeat_message;
    test_request_message_t test_request_message;
    resend_request_message_t resend_request_message;
    gap_fill_message_t gap_fill_message;
    reject_message_t reject_message;
    new_order_request_message_t new_order_request_message;
    amend_order_request_message_t amend_order_request_message;
    cancel_order_request_message_t cancel_order_request_message;
    cancel_order_by_id_request_message_t cancel_order_by_id_request_message;
    mass_quote_request_message_t mass_quote_request_message;
    mass_quote_request_message_mass_quote_request_message_quotes_group_t mass_quote_request_message_mass_quote_request_message_quotes_group[MAX_MESSAGES];
    mass_cancel_request_message_t mass_cancel_request_message;
    mass_quote_cancel_request_message_t mass_quote_cancel_request_message;
    get_mass_quote_mmp_status_request_message_t get_mass_quote_mmp_status_request_message;
    get_orders_mmp_status_request_message_t get_orders_mmp_status_request_message;
    new_order_response_message_t new_order_response_message;
    new_order_response_message_new_order_response_message_fills_group_t new_order_response_message_new_order_response_message_fills_group[MAX_MESSAGES];
    new_order_response_message_new_order_response_message_legs_group_header_t new_order_response_message_new_order_response_message_legs_group_header;
    new_order_response_message_new_order_response_message_legs_group_t new_order_response_message_new_order_response_message_legs_group[MAX_MESSAGES];
    new_order_reject_message_t new_order_reject_message;
    amend_order_response_message_t amend_order_response_message;
    amend_order_response_message_amend_order_response_message_fills_group_t amend_order_response_message_amend_order_response_message_fills_group[MAX_MESSAGES];
    amend_order_response_message_amend_order_response_message_legs_group_header_t amend_order_response_message_amend_order_response_message_legs_group_header;
    amend_order_response_message_amend_order_response_message_legs_group_t amend_order_response_message_amend_order_response_message_legs_group[MAX_MESSAGES];
    amend_order_reject_message_t amend_order_reject_message;
    cancel_order_response_message_t cancel_order_response_message;
    cancel_order_reject_message_t cancel_order_reject_message;
    mass_quote_response_message_t mass_quote_response_message;
    mass_quote_response_message_mass_quote_response_message_quotes_group_t mass_quote_response_message_mass_quote_response_message_quotes_group[MAX_MESSAGES];
    mass_quote_response_message_mass_quote_response_message_bid_fills_group_header_t mass_quote_response_message_mass_quote_response_message_bid_fills_group_header;
    mass_quote_response_message_mass_quote_response_message_bid_fills_group_t mass_quote_response_message_mass_quote_response_message_bid_fills_group[MAX_MESSAGES];
    mass_quote_response_message_mass_quote_response_message_ask_fills_group_header_t mass_quote_response_message_mass_quote_response_message_ask_fills_group_header;
    mass_quote_response_message_mass_quote_response_message_ask_fills_group_t mass_quote_response_message_mass_quote_response_message_ask_fills_group[MAX_MESSAGES];
    mass_quote_response_message_mass_quote_response_message_legs_group_header_t mass_quote_response_message_mass_quote_response_message_legs_group_header;
    mass_quote_response_message_mass_quote_response_message_legs_group_t mass_quote_response_message_mass_quote_response_message_legs_group[MAX_MESSAGES];
    mass_quote_reject_message_t mass_quote_reject_message;
    mass_cancel_response_message_t mass_cancel_response_message;
    mass_cancel_reject_message_t mass_cancel_reject_message;
    get_mass_quote_mmp_status_response_message_t get_mass_quote_mmp_status_response_message;
    get_mass_quote_mmp_status_reject_message_t get_mass_quote_mmp_status_reject_message;
    get_orders_mmp_status_response_message_t get_orders_mmp_status_response_message;
    get_orders_mmp_status_reject_message_t get_orders_mmp_status_reject_message;
    order_filled_message_t order_filled_message;
    order_filled_message_order_filled_message_fills_group_t order_filled_message_order_filled_message_fills_group[MAX_MESSAGES];
    order_filled_message_order_filled_message_legs_group_header_t order_filled_message_order_filled_message_legs_group_header;
    order_filled_message_order_filled_message_legs_group_t order_filled_message_order_filled_message_legs_group[MAX_MESSAGES];
    orders_canceled_message_t orders_canceled_message;
    orders_canceled_message_orders_canceled_message_orders_group_t orders_canceled_message_orders_canceled_message_orders_group[MAX_MESSAGES];
    order_placed_message_t order_placed_message;
    order_placed_message_order_placed_message_fills_group_t order_placed_message_order_placed_message_fills_group[MAX_MESSAGES];
    order_placed_message_order_placed_message_legs_group_header_t order_placed_message_order_placed_message_legs_group_header;
    order_placed_message_order_placed_message_legs_group_t order_placed_message_order_placed_message_legs_group[MAX_MESSAGES];
    mass_quote_orders_placed_message_t mass_quote_orders_placed_message;
    mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_t mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group[MAX_MESSAGES];
    mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_header_t mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_header;
    mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_t mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group[MAX_MESSAGES];
    mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_header_t mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_header;
    mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_t mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group[MAX_MESSAGES];
    mass_quote_mmp_triggered_message_t mass_quote_mmp_triggered_message;
    orders_mmp_triggered_message_t orders_mmp_triggered_message;
    mass_quote_mmp_unfrozen_message_t mass_quote_mmp_unfrozen_message;
    orders_mmp_unfrozen_message_t orders_mmp_unfrozen_message;
}

parser DeribitOrdersapiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.session_flags);
        transition select(hdr.session_flags.template_id) {
            16w0x100: parse_logon_message;
            16w0x200: parse_logon_conf_message;
            16w0x400: parse_logout_message;
            16w0x500: parse_logged_out_message;
            16w0xa00: parse_heartbeat_message;
            16w0xb00: parse_test_request_message;
            16w0x1400: parse_resend_request_message;
            16w0x1500: parse_gap_fill_message;
            16w0x1e00: parse_reject_message;
            16w0x6400: parse_new_order_request_message;
            16w0x6e00: parse_amend_order_request_message;
            16w0x7800: parse_cancel_order_request_message;
            16w0x7d00: parse_cancel_order_by_id_request_message;
            16w0x8200: parse_mass_quote_request_message;
            16w0x8c00: parse_mass_cancel_request_message;
            16w0x9100: parse_mass_quote_cancel_request_message;
            16w0x9b00: parse_get_mass_quote_mmp_status_request_message;
            16w0x9c00: parse_get_orders_mmp_status_request_message;
            16w0xc800: parse_new_order_response_message;
            16w0xca00: parse_new_order_reject_message;
            16w0xd200: parse_amend_order_response_message;
            16w0xd400: parse_amend_order_reject_message;
            16w0xdc00: parse_cancel_order_response_message;
            16w0xde00: parse_cancel_order_reject_message;
            16w0xe600: parse_mass_quote_response_message;
            16w0xe800: parse_mass_quote_reject_message;
            16w0xf000: parse_mass_cancel_response_message;
            16w0xf200: parse_mass_cancel_reject_message;
            16w0x1801: parse_get_mass_quote_mmp_status_response_message;
            16w0x1901: parse_get_mass_quote_mmp_status_reject_message;
            16w0x1a01: parse_get_orders_mmp_status_response_message;
            16w0x1b01: parse_get_orders_mmp_status_reject_message;
            16w0x2c01: parse_order_filled_message;
            16w0x3601: parse_orders_canceled_message;
            16w0x3801: parse_order_placed_message;
            16w0x3a01: parse_mass_quote_orders_placed_message;
            16w0x4001: parse_mass_quote_mmp_triggered_message;
            16w0x4201: parse_orders_mmp_triggered_message;
            16w0x4401: parse_mass_quote_mmp_unfrozen_message;
            16w0x4601: parse_orders_mmp_unfrozen_message;
            default: accept;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_conf_message {
        packet.extract(hdr.logon_conf_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logged_out_message {
        packet.extract(hdr.logged_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test_request_message {
        packet.extract(hdr.test_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_resend_request_message {
        packet.extract(hdr.resend_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gap_fill_message {
        packet.extract(hdr.gap_fill_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_request_message {
        packet.extract(hdr.new_order_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_amend_order_request_message {
        packet.extract(hdr.amend_order_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_request_message {
        packet.extract(hdr.cancel_order_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_by_id_request_message {
        packet.extract(hdr.cancel_order_by_id_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_request_message {
        packet.extract(hdr.mass_quote_request_message);
        meta.dispatched = 1;
        meta.mass_quote_request_message_mass_quote_request_message_quotes_group_remaining = hdr.mass_quote_request_message.num_in_group;
        transition select(meta.mass_quote_request_message_mass_quote_request_message_quotes_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_request_message_mass_quote_request_message_quotes_group;
        }
    }

    state parse_mass_quote_request_message_mass_quote_request_message_quotes_group {
        packet.extract(hdr.mass_quote_request_message_mass_quote_request_message_quotes_group.next);
        meta.mass_quote_request_message_mass_quote_request_message_quotes_group_remaining = meta.mass_quote_request_message_mass_quote_request_message_quotes_group_remaining - 1;
        transition select(meta.mass_quote_request_message_mass_quote_request_message_quotes_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_request_message_mass_quote_request_message_quotes_group;
        }
    }

    state parse_mass_cancel_request_message {
        packet.extract(hdr.mass_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_cancel_request_message {
        packet.extract(hdr.mass_quote_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_get_mass_quote_mmp_status_request_message {
        packet.extract(hdr.get_mass_quote_mmp_status_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_get_orders_mmp_status_request_message {
        packet.extract(hdr.get_orders_mmp_status_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_response_message {
        packet.extract(hdr.new_order_response_message);
        meta.dispatched = 1;
        meta.new_order_response_message_new_order_response_message_fills_group_remaining = hdr.new_order_response_message.num_in_group;
        transition select(meta.new_order_response_message_new_order_response_message_fills_group_remaining) {
            16w0: read_new_order_response_message_new_order_response_message_legs_group;
            default: parse_new_order_response_message_new_order_response_message_fills_group;
        }
    }

    state parse_new_order_response_message_new_order_response_message_fills_group {
        packet.extract(hdr.new_order_response_message_new_order_response_message_fills_group.next);
        meta.new_order_response_message_new_order_response_message_fills_group_remaining = meta.new_order_response_message_new_order_response_message_fills_group_remaining - 1;
        transition select(meta.new_order_response_message_new_order_response_message_fills_group_remaining) {
            16w0: read_new_order_response_message_new_order_response_message_legs_group;
            default: parse_new_order_response_message_new_order_response_message_fills_group;
        }
    }

    state read_new_order_response_message_new_order_response_message_legs_group {
        packet.extract(hdr.new_order_response_message_new_order_response_message_legs_group_header);
        meta.new_order_response_message_new_order_response_message_legs_group_remaining = hdr.new_order_response_message_new_order_response_message_legs_group_header.num_in_group;
        transition select(meta.new_order_response_message_new_order_response_message_legs_group_remaining) {
            16w0: accept;
            default: parse_new_order_response_message_new_order_response_message_legs_group;
        }
    }

    state parse_new_order_response_message_new_order_response_message_legs_group {
        packet.extract(hdr.new_order_response_message_new_order_response_message_legs_group.next);
        meta.new_order_response_message_new_order_response_message_legs_group_remaining = meta.new_order_response_message_new_order_response_message_legs_group_remaining - 1;
        transition select(meta.new_order_response_message_new_order_response_message_legs_group_remaining) {
            16w0: accept;
            default: parse_new_order_response_message_new_order_response_message_legs_group;
        }
    }

    state parse_new_order_reject_message {
        packet.extract(hdr.new_order_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_amend_order_response_message {
        packet.extract(hdr.amend_order_response_message);
        meta.dispatched = 1;
        meta.amend_order_response_message_amend_order_response_message_fills_group_remaining = hdr.amend_order_response_message.num_in_group;
        transition select(meta.amend_order_response_message_amend_order_response_message_fills_group_remaining) {
            16w0: read_amend_order_response_message_amend_order_response_message_legs_group;
            default: parse_amend_order_response_message_amend_order_response_message_fills_group;
        }
    }

    state parse_amend_order_response_message_amend_order_response_message_fills_group {
        packet.extract(hdr.amend_order_response_message_amend_order_response_message_fills_group.next);
        meta.amend_order_response_message_amend_order_response_message_fills_group_remaining = meta.amend_order_response_message_amend_order_response_message_fills_group_remaining - 1;
        transition select(meta.amend_order_response_message_amend_order_response_message_fills_group_remaining) {
            16w0: read_amend_order_response_message_amend_order_response_message_legs_group;
            default: parse_amend_order_response_message_amend_order_response_message_fills_group;
        }
    }

    state read_amend_order_response_message_amend_order_response_message_legs_group {
        packet.extract(hdr.amend_order_response_message_amend_order_response_message_legs_group_header);
        meta.amend_order_response_message_amend_order_response_message_legs_group_remaining = hdr.amend_order_response_message_amend_order_response_message_legs_group_header.num_in_group;
        transition select(meta.amend_order_response_message_amend_order_response_message_legs_group_remaining) {
            16w0: accept;
            default: parse_amend_order_response_message_amend_order_response_message_legs_group;
        }
    }

    state parse_amend_order_response_message_amend_order_response_message_legs_group {
        packet.extract(hdr.amend_order_response_message_amend_order_response_message_legs_group.next);
        meta.amend_order_response_message_amend_order_response_message_legs_group_remaining = meta.amend_order_response_message_amend_order_response_message_legs_group_remaining - 1;
        transition select(meta.amend_order_response_message_amend_order_response_message_legs_group_remaining) {
            16w0: accept;
            default: parse_amend_order_response_message_amend_order_response_message_legs_group;
        }
    }

    state parse_amend_order_reject_message {
        packet.extract(hdr.amend_order_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_response_message {
        packet.extract(hdr.cancel_order_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_reject_message {
        packet.extract(hdr.cancel_order_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_response_message {
        packet.extract(hdr.mass_quote_response_message);
        meta.dispatched = 1;
        meta.mass_quote_response_message_mass_quote_response_message_quotes_group_remaining = hdr.mass_quote_response_message.num_in_group;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_quotes_group_remaining) {
            16w0: read_mass_quote_response_message_mass_quote_response_message_bid_fills_group;
            default: parse_mass_quote_response_message_mass_quote_response_message_quotes_group;
        }
    }

    state parse_mass_quote_response_message_mass_quote_response_message_quotes_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_quotes_group.next);
        meta.mass_quote_response_message_mass_quote_response_message_quotes_group_remaining = meta.mass_quote_response_message_mass_quote_response_message_quotes_group_remaining - 1;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_quotes_group_remaining) {
            16w0: read_mass_quote_response_message_mass_quote_response_message_bid_fills_group;
            default: parse_mass_quote_response_message_mass_quote_response_message_quotes_group;
        }
    }

    state read_mass_quote_response_message_mass_quote_response_message_bid_fills_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_bid_fills_group_header);
        meta.mass_quote_response_message_mass_quote_response_message_bid_fills_group_remaining = hdr.mass_quote_response_message_mass_quote_response_message_bid_fills_group_header.num_in_group;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_bid_fills_group_remaining) {
            16w0: read_mass_quote_response_message_mass_quote_response_message_ask_fills_group;
            default: parse_mass_quote_response_message_mass_quote_response_message_bid_fills_group;
        }
    }

    state parse_mass_quote_response_message_mass_quote_response_message_bid_fills_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_bid_fills_group.next);
        meta.mass_quote_response_message_mass_quote_response_message_bid_fills_group_remaining = meta.mass_quote_response_message_mass_quote_response_message_bid_fills_group_remaining - 1;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_bid_fills_group_remaining) {
            16w0: read_mass_quote_response_message_mass_quote_response_message_ask_fills_group;
            default: parse_mass_quote_response_message_mass_quote_response_message_bid_fills_group;
        }
    }

    state read_mass_quote_response_message_mass_quote_response_message_ask_fills_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_ask_fills_group_header);
        meta.mass_quote_response_message_mass_quote_response_message_ask_fills_group_remaining = hdr.mass_quote_response_message_mass_quote_response_message_ask_fills_group_header.num_in_group;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_ask_fills_group_remaining) {
            16w0: read_mass_quote_response_message_mass_quote_response_message_legs_group;
            default: parse_mass_quote_response_message_mass_quote_response_message_ask_fills_group;
        }
    }

    state parse_mass_quote_response_message_mass_quote_response_message_ask_fills_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_ask_fills_group.next);
        meta.mass_quote_response_message_mass_quote_response_message_ask_fills_group_remaining = meta.mass_quote_response_message_mass_quote_response_message_ask_fills_group_remaining - 1;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_ask_fills_group_remaining) {
            16w0: read_mass_quote_response_message_mass_quote_response_message_legs_group;
            default: parse_mass_quote_response_message_mass_quote_response_message_ask_fills_group;
        }
    }

    state read_mass_quote_response_message_mass_quote_response_message_legs_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_legs_group_header);
        meta.mass_quote_response_message_mass_quote_response_message_legs_group_remaining = hdr.mass_quote_response_message_mass_quote_response_message_legs_group_header.num_in_group;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_legs_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_response_message_mass_quote_response_message_legs_group;
        }
    }

    state parse_mass_quote_response_message_mass_quote_response_message_legs_group {
        packet.extract(hdr.mass_quote_response_message_mass_quote_response_message_legs_group.next);
        meta.mass_quote_response_message_mass_quote_response_message_legs_group_remaining = meta.mass_quote_response_message_mass_quote_response_message_legs_group_remaining - 1;
        transition select(meta.mass_quote_response_message_mass_quote_response_message_legs_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_response_message_mass_quote_response_message_legs_group;
        }
    }

    state parse_mass_quote_reject_message {
        packet.extract(hdr.mass_quote_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_response_message {
        packet.extract(hdr.mass_cancel_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_reject_message {
        packet.extract(hdr.mass_cancel_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_get_mass_quote_mmp_status_response_message {
        packet.extract(hdr.get_mass_quote_mmp_status_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_get_mass_quote_mmp_status_reject_message {
        packet.extract(hdr.get_mass_quote_mmp_status_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_get_orders_mmp_status_response_message {
        packet.extract(hdr.get_orders_mmp_status_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_get_orders_mmp_status_reject_message {
        packet.extract(hdr.get_orders_mmp_status_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_filled_message {
        packet.extract(hdr.order_filled_message);
        meta.dispatched = 1;
        meta.order_filled_message_order_filled_message_fills_group_remaining = hdr.order_filled_message.num_in_group;
        transition select(meta.order_filled_message_order_filled_message_fills_group_remaining) {
            16w0: read_order_filled_message_order_filled_message_legs_group;
            default: parse_order_filled_message_order_filled_message_fills_group;
        }
    }

    state parse_order_filled_message_order_filled_message_fills_group {
        packet.extract(hdr.order_filled_message_order_filled_message_fills_group.next);
        meta.order_filled_message_order_filled_message_fills_group_remaining = meta.order_filled_message_order_filled_message_fills_group_remaining - 1;
        transition select(meta.order_filled_message_order_filled_message_fills_group_remaining) {
            16w0: read_order_filled_message_order_filled_message_legs_group;
            default: parse_order_filled_message_order_filled_message_fills_group;
        }
    }

    state read_order_filled_message_order_filled_message_legs_group {
        packet.extract(hdr.order_filled_message_order_filled_message_legs_group_header);
        meta.order_filled_message_order_filled_message_legs_group_remaining = hdr.order_filled_message_order_filled_message_legs_group_header.num_in_group;
        transition select(meta.order_filled_message_order_filled_message_legs_group_remaining) {
            16w0: accept;
            default: parse_order_filled_message_order_filled_message_legs_group;
        }
    }

    state parse_order_filled_message_order_filled_message_legs_group {
        packet.extract(hdr.order_filled_message_order_filled_message_legs_group.next);
        meta.order_filled_message_order_filled_message_legs_group_remaining = meta.order_filled_message_order_filled_message_legs_group_remaining - 1;
        transition select(meta.order_filled_message_order_filled_message_legs_group_remaining) {
            16w0: accept;
            default: parse_order_filled_message_order_filled_message_legs_group;
        }
    }

    state parse_orders_canceled_message {
        packet.extract(hdr.orders_canceled_message);
        meta.dispatched = 1;
        meta.orders_canceled_message_orders_canceled_message_orders_group_remaining = hdr.orders_canceled_message.num_in_group;
        transition select(meta.orders_canceled_message_orders_canceled_message_orders_group_remaining) {
            16w0: accept;
            default: parse_orders_canceled_message_orders_canceled_message_orders_group;
        }
    }

    state parse_orders_canceled_message_orders_canceled_message_orders_group {
        packet.extract(hdr.orders_canceled_message_orders_canceled_message_orders_group.next);
        meta.orders_canceled_message_orders_canceled_message_orders_group_remaining = meta.orders_canceled_message_orders_canceled_message_orders_group_remaining - 1;
        transition select(meta.orders_canceled_message_orders_canceled_message_orders_group_remaining) {
            16w0: accept;
            default: parse_orders_canceled_message_orders_canceled_message_orders_group;
        }
    }

    state parse_order_placed_message {
        packet.extract(hdr.order_placed_message);
        meta.dispatched = 1;
        meta.order_placed_message_order_placed_message_fills_group_remaining = hdr.order_placed_message.num_in_group;
        transition select(meta.order_placed_message_order_placed_message_fills_group_remaining) {
            16w0: read_order_placed_message_order_placed_message_legs_group;
            default: parse_order_placed_message_order_placed_message_fills_group;
        }
    }

    state parse_order_placed_message_order_placed_message_fills_group {
        packet.extract(hdr.order_placed_message_order_placed_message_fills_group.next);
        meta.order_placed_message_order_placed_message_fills_group_remaining = meta.order_placed_message_order_placed_message_fills_group_remaining - 1;
        transition select(meta.order_placed_message_order_placed_message_fills_group_remaining) {
            16w0: read_order_placed_message_order_placed_message_legs_group;
            default: parse_order_placed_message_order_placed_message_fills_group;
        }
    }

    state read_order_placed_message_order_placed_message_legs_group {
        packet.extract(hdr.order_placed_message_order_placed_message_legs_group_header);
        meta.order_placed_message_order_placed_message_legs_group_remaining = hdr.order_placed_message_order_placed_message_legs_group_header.num_in_group;
        transition select(meta.order_placed_message_order_placed_message_legs_group_remaining) {
            16w0: accept;
            default: parse_order_placed_message_order_placed_message_legs_group;
        }
    }

    state parse_order_placed_message_order_placed_message_legs_group {
        packet.extract(hdr.order_placed_message_order_placed_message_legs_group.next);
        meta.order_placed_message_order_placed_message_legs_group_remaining = meta.order_placed_message_order_placed_message_legs_group_remaining - 1;
        transition select(meta.order_placed_message_order_placed_message_legs_group_remaining) {
            16w0: accept;
            default: parse_order_placed_message_order_placed_message_legs_group;
        }
    }

    state parse_mass_quote_orders_placed_message {
        packet.extract(hdr.mass_quote_orders_placed_message);
        meta.dispatched = 1;
        meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_remaining = hdr.mass_quote_orders_placed_message.num_in_group;
        transition select(meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_remaining) {
            16w0: read_mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group;
            default: parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group;
        }
    }

    state parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group {
        packet.extract(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group.next);
        meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_remaining = meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_remaining - 1;
        transition select(meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group_remaining) {
            16w0: read_mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group;
            default: parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group;
        }
    }

    state read_mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group {
        packet.extract(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_header);
        meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_remaining = hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_header.num_in_group;
        transition select(meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_remaining) {
            16w0: read_mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group;
            default: parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group;
        }
    }

    state parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group {
        packet.extract(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group.next);
        meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_remaining = meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_remaining - 1;
        transition select(meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_remaining) {
            16w0: read_mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group;
            default: parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group;
        }
    }

    state read_mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group {
        packet.extract(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_header);
        meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_remaining = hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_header.num_in_group;
        transition select(meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group;
        }
    }

    state parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group {
        packet.extract(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group.next);
        meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_remaining = meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_remaining - 1;
        transition select(meta.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_remaining) {
            16w0: accept;
            default: parse_mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group;
        }
    }

    state parse_mass_quote_mmp_triggered_message {
        packet.extract(hdr.mass_quote_mmp_triggered_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_orders_mmp_triggered_message {
        packet.extract(hdr.orders_mmp_triggered_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_mmp_unfrozen_message {
        packet.extract(hdr.mass_quote_mmp_unfrozen_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_orders_mmp_unfrozen_message {
        packet.extract(hdr.orders_mmp_unfrozen_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control DeribitOrdersapiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DeribitOrdersapiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control DeribitOrdersapiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control DeribitOrdersapiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DeribitOrdersapiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.session_flags);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logon_conf_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.logged_out_message);
        packet.emit(hdr.heartbeat_message);
        packet.emit(hdr.test_request_message);
        packet.emit(hdr.resend_request_message);
        packet.emit(hdr.gap_fill_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.new_order_request_message);
        packet.emit(hdr.amend_order_request_message);
        packet.emit(hdr.cancel_order_request_message);
        packet.emit(hdr.cancel_order_by_id_request_message);
        packet.emit(hdr.mass_quote_request_message);
        packet.emit(hdr.mass_quote_request_message_mass_quote_request_message_quotes_group);
        packet.emit(hdr.mass_cancel_request_message);
        packet.emit(hdr.mass_quote_cancel_request_message);
        packet.emit(hdr.get_mass_quote_mmp_status_request_message);
        packet.emit(hdr.get_orders_mmp_status_request_message);
        packet.emit(hdr.new_order_response_message);
        packet.emit(hdr.new_order_response_message_new_order_response_message_fills_group);
        packet.emit(hdr.new_order_response_message_new_order_response_message_legs_group_header);
        packet.emit(hdr.new_order_response_message_new_order_response_message_legs_group);
        packet.emit(hdr.new_order_reject_message);
        packet.emit(hdr.amend_order_response_message);
        packet.emit(hdr.amend_order_response_message_amend_order_response_message_fills_group);
        packet.emit(hdr.amend_order_response_message_amend_order_response_message_legs_group_header);
        packet.emit(hdr.amend_order_response_message_amend_order_response_message_legs_group);
        packet.emit(hdr.amend_order_reject_message);
        packet.emit(hdr.cancel_order_response_message);
        packet.emit(hdr.cancel_order_reject_message);
        packet.emit(hdr.mass_quote_response_message);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_quotes_group);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_bid_fills_group_header);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_bid_fills_group);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_ask_fills_group_header);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_ask_fills_group);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_legs_group_header);
        packet.emit(hdr.mass_quote_response_message_mass_quote_response_message_legs_group);
        packet.emit(hdr.mass_quote_reject_message);
        packet.emit(hdr.mass_cancel_response_message);
        packet.emit(hdr.mass_cancel_reject_message);
        packet.emit(hdr.get_mass_quote_mmp_status_response_message);
        packet.emit(hdr.get_mass_quote_mmp_status_reject_message);
        packet.emit(hdr.get_orders_mmp_status_response_message);
        packet.emit(hdr.get_orders_mmp_status_reject_message);
        packet.emit(hdr.order_filled_message);
        packet.emit(hdr.order_filled_message_order_filled_message_fills_group);
        packet.emit(hdr.order_filled_message_order_filled_message_legs_group_header);
        packet.emit(hdr.order_filled_message_order_filled_message_legs_group);
        packet.emit(hdr.orders_canceled_message);
        packet.emit(hdr.orders_canceled_message_orders_canceled_message_orders_group);
        packet.emit(hdr.order_placed_message);
        packet.emit(hdr.order_placed_message_order_placed_message_fills_group);
        packet.emit(hdr.order_placed_message_order_placed_message_legs_group_header);
        packet.emit(hdr.order_placed_message_order_placed_message_legs_group);
        packet.emit(hdr.mass_quote_orders_placed_message);
        packet.emit(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_orders_group);
        packet.emit(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group_header);
        packet.emit(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_fills_group);
        packet.emit(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group_header);
        packet.emit(hdr.mass_quote_orders_placed_message_mass_quote_orders_placed_message_legs_group);
        packet.emit(hdr.mass_quote_mmp_triggered_message);
        packet.emit(hdr.orders_mmp_triggered_message);
        packet.emit(hdr.mass_quote_mmp_unfrozen_message);
        packet.emit(hdr.orders_mmp_unfrozen_message);
    }
}

V1Switch(
    DeribitOrdersapiParser(),
    DeribitOrdersapiVerifyChecksum(),
    DeribitOrdersapiIngress(),
    DeribitOrdersapiEgress(),
    DeribitOrdersapiComputeChecksum(),
    DeribitOrdersapiDeparser()
) main;
