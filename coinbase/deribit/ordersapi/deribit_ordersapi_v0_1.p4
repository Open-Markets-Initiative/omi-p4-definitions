// P4_16 (v1model) definition for: Coinbase Deribit OrdersApi Sbe v0.1
// 
// Protocol:
//   Organization: Coinbase
//   Protocol: Orders Api
//   Encoding: Simple Binary Encoding
//   Version: 0.1
//   Date: 9/5/2025
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
    bit<1> is_resend;
    bit<7> reserved_bits;
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
    bit<8> reason_data;
}

header logged_out_message_t {
    bit<8> reason_length;
    bit<8> reason_data;
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
    bit<8> details_data;
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
    bit<1> unused_order_flags_0;
    bit<1> post_only;
    bit<1> post_only_reject;
    bit<1> market_limit;
    bit<1> mmp;
    bit<1> reset_mmp;
    bit<10> reserved_10;
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
    bit<1> unused_replace_order_flags_0;
    bit<1> post_only;
    bit<1> post_only_reject;
    bit<13> reserved_13;
}

header cancel_order_request_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> instrument_id;
}

header mass_quote_request_message_t {
    bit<64> quote_id;
    bit<64> correlation_id;
    bit<64> mmp_group_id;
    bit<64> self_match_prevention_id;
    bit<1> reset_mmp;
    bit<7> reserved_7;
    bit<16> block_length;
    bit<16> num_in_group;
    bit<64> instrument_id;
    bit<64> bid_price_optional;
    bit<64> ask_price_optional;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<1> unused_order_flags_0;
    bit<1> post_only;
    bit<1> post_only_reject;
    bit<1> market_limit;
    bit<1> mmp;
    bit<1> reset_mmp_2;
    bit<10> reserved_10;
    bit<1> unused_order_flags_0_2;
    bit<1> post_only_2;
    bit<1> post_only_reject_2;
    bit<1> market_limit_2;
    bit<1> mmp_2;
    bit<1> reset_mmp_3;
    bit<10> reserved_10_2;
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
    bit<64> match_id;
    bit<64> fill_price;
    bit<64> mantissa_4;
    bit<8> exponent_4;
    bit<16> block_length_2;
    bit<16> num_in_group_2;
    bit<64> match_id_2;
    bit<64> fill_id;
    bit<64> fill_price_2;
    bit<64> mantissa_5;
    bit<8> exponent_5;
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
    bit<8> details_data;
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
    bit<64> match_id;
    bit<64> fill_price;
    bit<64> mantissa_4;
    bit<8> exponent_4;
    bit<16> block_length_2;
    bit<16> num_in_group_2;
    bit<64> match_id_2;
    bit<64> fill_id;
    bit<64> fill_price_2;
    bit<64> mantissa_5;
    bit<8> exponent_5;
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
    bit<8> details_data;
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
    bit<8> details_data;
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
    bit<16> block_length_2;
    bit<16> num_in_group_2;
    bit<64> match_id;
    bit<64> instrument_id_2;
    bit<64> fill_price;
    bit<64> mantissa_5;
    bit<8> exponent_5;
    bit<16> block_length_3;
    bit<16> num_in_group_3;
    bit<64> match_id_2;
    bit<64> instrument_id_3;
    bit<64> fill_price_2;
    bit<64> mantissa_6;
    bit<8> exponent_6;
    bit<16> block_length_4;
    bit<16> num_in_group_4;
    bit<64> match_id_3;
    bit<64> fill_id;
    bit<64> fill_price_3;
    bit<64> mantissa_7;
    bit<8> exponent_7;
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
    bit<8> details_data;
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
    bit<8> details_data;
}

header order_filled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<16> block_length;
    bit<16> num_in_group;
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
    bit<1> is_quote;
    bit<1> is_fully_filled;
    bit<6> reserved_6;
    bit<16> block_length_2;
    bit<16> num_in_group_2;
    bit<64> match_id_2;
    bit<64> fill_id;
    bit<64> price_2;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<8> leg_side;
}

header orders_canceled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<1> is_last_message;
    bit<7> reserved_7;
    bit<16> block_length;
    bit<16> num_in_group;
    bit<64> client_order_id;
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> mantissa;
    bit<8> exponent;
    bit<8> cancel_reason;
    bit<1> is_quote;
    bit<7> reserved_7_2;
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
    bit<16> block_length;
    bit<16> num_in_group;
    bit<64> match_id;
    bit<64> fill_price;
    bit<64> mantissa_4;
    bit<8> exponent_4;
    bit<16> block_length_2;
    bit<16> num_in_group_2;
    bit<64> match_id_2;
    bit<64> fill_id;
    bit<64> fill_price_2;
    bit<64> mantissa_5;
    bit<8> exponent_5;
    bit<8> leg_side;
}

header mass_quote_orders_placed_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> mmp_group_id;
    bit<16> block_length;
    bit<16> num_in_group;
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
    bit<16> block_length_2;
    bit<16> num_in_group_2;
    bit<64> match_id;
    bit<64> order_id_fill_id;
    bit<64> fill_price;
    bit<64> mantissa_4;
    bit<8> exponent_4;
    bit<16> block_length_3;
    bit<16> num_in_group_3;
    bit<64> match_id_2;
    bit<64> fill_id;
    bit<64> fill_price_2;
    bit<64> mantissa_5;
    bit<8> exponent_5;
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
    mass_quote_request_message_t mass_quote_request_message;
    mass_cancel_request_message_t mass_cancel_request_message;
    mass_quote_cancel_request_message_t mass_quote_cancel_request_message;
    new_order_response_message_t new_order_response_message;
    new_order_reject_message_t new_order_reject_message;
    amend_order_response_message_t amend_order_response_message;
    amend_order_reject_message_t amend_order_reject_message;
    cancel_order_response_message_t cancel_order_response_message;
    cancel_order_reject_message_t cancel_order_reject_message;
    mass_quote_response_message_t mass_quote_response_message;
    mass_quote_reject_message_t mass_quote_reject_message;
    mass_cancel_response_message_t mass_cancel_response_message;
    mass_cancel_reject_message_t mass_cancel_reject_message;
    order_filled_message_t order_filled_message;
    orders_canceled_message_t orders_canceled_message;
    order_placed_message_t order_placed_message;
    mass_quote_orders_placed_message_t mass_quote_orders_placed_message;
    mass_quote_mmp_triggered_message_t mass_quote_mmp_triggered_message;
    orders_mmp_triggered_message_t orders_mmp_triggered_message;
    mass_quote_mmp_unfrozen_message_t mass_quote_mmp_unfrozen_message;
    orders_mmp_unfrozen_message_t orders_mmp_unfrozen_message;
}

parser DeribitOrdersapiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.session_flags);
        transition select(hdr.session_flags.template_id) {
            16w1: parse_logon_message;
            16w2: parse_logon_conf_message;
            16w4: parse_logout_message;
            16w5: parse_logged_out_message;
            16w10: parse_heartbeat_message;
            16w11: parse_test_request_message;
            16w20: parse_resend_request_message;
            16w21: parse_gap_fill_message;
            16w30: parse_reject_message;
            16w100: parse_new_order_request_message;
            16w110: parse_amend_order_request_message;
            16w120: parse_cancel_order_request_message;
            16w130: parse_mass_quote_request_message;
            16w140: parse_mass_cancel_request_message;
            16w145: parse_mass_quote_cancel_request_message;
            16w200: parse_new_order_response_message;
            16w202: parse_new_order_reject_message;
            16w210: parse_amend_order_response_message;
            16w212: parse_amend_order_reject_message;
            16w220: parse_cancel_order_response_message;
            16w222: parse_cancel_order_reject_message;
            16w230: parse_mass_quote_response_message;
            16w232: parse_mass_quote_reject_message;
            16w240: parse_mass_cancel_response_message;
            16w242: parse_mass_cancel_reject_message;
            16w300: parse_order_filled_message;
            16w310: parse_orders_canceled_message;
            16w312: parse_order_placed_message;
            16w314: parse_mass_quote_orders_placed_message;
            16w320: parse_mass_quote_mmp_triggered_message;
            16w322: parse_orders_mmp_triggered_message;
            16w324: parse_mass_quote_mmp_unfrozen_message;
            16w326: parse_orders_mmp_unfrozen_message;
            default: accept;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        transition accept;
    }

    state parse_logon_conf_message {
        packet.extract(hdr.logon_conf_message);
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        transition accept;
    }

    state parse_logged_out_message {
        packet.extract(hdr.logged_out_message);
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        transition accept;
    }

    state parse_test_request_message {
        packet.extract(hdr.test_request_message);
        transition accept;
    }

    state parse_resend_request_message {
        packet.extract(hdr.resend_request_message);
        transition accept;
    }

    state parse_gap_fill_message {
        packet.extract(hdr.gap_fill_message);
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        transition accept;
    }

    state parse_new_order_request_message {
        packet.extract(hdr.new_order_request_message);
        transition accept;
    }

    state parse_amend_order_request_message {
        packet.extract(hdr.amend_order_request_message);
        transition accept;
    }

    state parse_cancel_order_request_message {
        packet.extract(hdr.cancel_order_request_message);
        transition accept;
    }

    state parse_mass_quote_request_message {
        packet.extract(hdr.mass_quote_request_message);
        transition accept;
    }

    state parse_mass_cancel_request_message {
        packet.extract(hdr.mass_cancel_request_message);
        transition accept;
    }

    state parse_mass_quote_cancel_request_message {
        packet.extract(hdr.mass_quote_cancel_request_message);
        transition accept;
    }

    state parse_new_order_response_message {
        packet.extract(hdr.new_order_response_message);
        transition accept;
    }

    state parse_new_order_reject_message {
        packet.extract(hdr.new_order_reject_message);
        transition accept;
    }

    state parse_amend_order_response_message {
        packet.extract(hdr.amend_order_response_message);
        transition accept;
    }

    state parse_amend_order_reject_message {
        packet.extract(hdr.amend_order_reject_message);
        transition accept;
    }

    state parse_cancel_order_response_message {
        packet.extract(hdr.cancel_order_response_message);
        transition accept;
    }

    state parse_cancel_order_reject_message {
        packet.extract(hdr.cancel_order_reject_message);
        transition accept;
    }

    state parse_mass_quote_response_message {
        packet.extract(hdr.mass_quote_response_message);
        transition accept;
    }

    state parse_mass_quote_reject_message {
        packet.extract(hdr.mass_quote_reject_message);
        transition accept;
    }

    state parse_mass_cancel_response_message {
        packet.extract(hdr.mass_cancel_response_message);
        transition accept;
    }

    state parse_mass_cancel_reject_message {
        packet.extract(hdr.mass_cancel_reject_message);
        transition accept;
    }

    state parse_order_filled_message {
        packet.extract(hdr.order_filled_message);
        transition accept;
    }

    state parse_orders_canceled_message {
        packet.extract(hdr.orders_canceled_message);
        transition accept;
    }

    state parse_order_placed_message {
        packet.extract(hdr.order_placed_message);
        transition accept;
    }

    state parse_mass_quote_orders_placed_message {
        packet.extract(hdr.mass_quote_orders_placed_message);
        transition accept;
    }

    state parse_mass_quote_mmp_triggered_message {
        packet.extract(hdr.mass_quote_mmp_triggered_message);
        transition accept;
    }

    state parse_orders_mmp_triggered_message {
        packet.extract(hdr.orders_mmp_triggered_message);
        transition accept;
    }

    state parse_mass_quote_mmp_unfrozen_message {
        packet.extract(hdr.mass_quote_mmp_unfrozen_message);
        transition accept;
    }

    state parse_orders_mmp_unfrozen_message {
        packet.extract(hdr.orders_mmp_unfrozen_message);
        transition accept;
    }

}

control DeribitOrdersapiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DeribitOrdersapiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
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
        packet.emit(hdr.mass_quote_request_message);
        packet.emit(hdr.mass_cancel_request_message);
        packet.emit(hdr.mass_quote_cancel_request_message);
        packet.emit(hdr.new_order_response_message);
        packet.emit(hdr.new_order_reject_message);
        packet.emit(hdr.amend_order_response_message);
        packet.emit(hdr.amend_order_reject_message);
        packet.emit(hdr.cancel_order_response_message);
        packet.emit(hdr.cancel_order_reject_message);
        packet.emit(hdr.mass_quote_response_message);
        packet.emit(hdr.mass_quote_reject_message);
        packet.emit(hdr.mass_cancel_response_message);
        packet.emit(hdr.mass_cancel_reject_message);
        packet.emit(hdr.order_filled_message);
        packet.emit(hdr.orders_canceled_message);
        packet.emit(hdr.order_placed_message);
        packet.emit(hdr.mass_quote_orders_placed_message);
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
