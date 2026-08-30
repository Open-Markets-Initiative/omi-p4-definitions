// P4_16 (v1model) definition for: Asx AsxDerivatives Ntp Itch v1.05
// 
// Protocol:
//   Organization: Australian Securities Exchange
//   Protocol: New Trading Platform
//   Encoding: Itch
//   Version: 1.05
//   Date: 12/01/2017
//   Specification: asx-market-data-protocol-specification.pdf
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
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header seconds_message_t {
    bit<32> second;
}

header end_of_business_trade_date_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<8> event_code;
}

header future_symbol_directory_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<256> symbol_name;
    bit<480> long_name;
    bit<96> isin;
    bit<48> exchange;
    bit<48> instrument;
    bit<48> cfi_code;
    bit<16> expiry_year;
    bit<8> expiry_month;
    bit<8> price_display_decimals;
    bit<32> price_fractional_denominator;
    bit<32> price_minimum_tick;
    bit<32> last_trading_date;
    bit<64> prior_day_settlement;
    bit<24> currency;
    bit<64> lot_size_or_face_value;
    bit<8> maturity_value;
    bit<16> coupon_rate;
    bit<8> payments_per_year;
    bit<32> block_lot_size;
    bit<32> expiry_date;
}

header options_symbol_directory_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<256> symbol_name;
    bit<480> long_name;
    bit<96> isin;
    bit<48> exchange;
    bit<48> instrument;
    bit<48> cfi_code;
    bit<16> expiry_year;
    bit<8> expiry_month;
    bit<8> option_type;
    bit<64> strike;
    bit<32> underlying_tradeable_instrument_id;
    bit<8> price_display_decimals;
    bit<32> price_fractional_denominator;
    bit<32> price_minimum_tick;
    bit<8> strike_price_decimal_position;
    bit<32> strike_price_fractional_denominator;
    bit<32> strike_price_minimum_tick;
    bit<32> last_trading_date;
    bit<64> prior_day_settlement;
    bit<64> volatility;
    bit<24> currency;
    bit<64> lot_size_or_face_value;
    bit<8> maturity_value;
    bit<16> coupon_rate;
    bit<8> payments_per_year;
    bit<32> block_lot_size;
    bit<32> expiry_date;
    bit<80> basis_of_quotation;
}

header combination_symbol_directory_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<256> symbol_name;
    bit<480> long_name;
    bit<48> cfi_code;
    bit<8> price_method;
    bit<8> price_display_decimals;
    bit<32> price_fractional_denominator;
    bit<32> price_minimum_tick;
    bit<8> legs;
    bit<32> tradeable_instrument_id_leg;
    bit<8> side_leg;
    bit<32> ratio_leg;
    bit<64> price_leg;
}

header bundles_symbol_directory_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<256> symbol_name;
    bit<480> long_name;
    bit<48> cfi_code;
    bit<8> price_method;
    bit<8> price_display_decimals;
    bit<32> price_fractional_denominator;
    bit<32> price_minimum_tick;
    bit<8> legs;
    bit<32> tradeable_instrument_id_leg;
    bit<8> side_leg;
    bit<32> ratio_leg;
    bit<64> price_leg;
}

header order_book_state_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> session_state;
}

header add_order_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<64> order_book_priority;
    bit<32> quantity;
    bit<64> price;
}

header order_volume_cancelled_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<32> quantity;
}

header order_deleted_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
}

header order_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<32> quantity_remaining;
    bit<8> trade_type;
    bit<64> trade_id;
    bit<32> executed_quantity;
    bit<64> trade_price;
    bit<64> combination_trade_id;
    bit<24> counter_party_id;
}

header auction_order_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<32> quantity_remaining;
    bit<8> trade_type;
    bit<64> trade_id;
    bit<32> executed_quantity;
    bit<64> trade_price;
    bit<64> opposite_order_id;
}

header combination_order_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<32> quantity_remaining;
    bit<8> trade_type;
    bit<64> trade_id;
    bit<32> executed_quantity;
    bit<64> trade_price;
    bit<32> opposite_tradeable_instrument_id;
    bit<8> opposite_side;
    bit<64> opposite_order_id;
    bit<64> combination_trade_id;
}

header implied_order_added_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<64> order_book_priority;
    bit<32> quantity;
    bit<64> price;
}

header implied_order_replaced_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<64> order_book_priority;
    bit<32> quantity;
    bit<64> price;
}

header implied_order_deleted_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> side;
    bit<64> order_id;
}

header trade_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> trade_type;
    bit<64> trade_id;
    bit<32> executed_quantity;
    bit<64> trade_price;
    bit<64> combination_trade_id;
    bit<24> participant_id_buyer;
    bit<24> participant_id_seller;
}

header combination_trade_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> trade_type;
    bit<64> trade_id;
    bit<32> executed_quantity;
    bit<64> trade_price;
    bit<32> buyer_tradeable_instrument_id;
    bit<8> buyer_side;
    bit<64> buyer_order_id;
    bit<64> buyer_combination_trade_id;
    bit<24> buyer_participant_id;
    bit<32> seller_tradeable_instrument_id;
    bit<8> seller_side;
    bit<64> seller_order_id;
    bit<64> seller_combination_trade_id;
    bit<24> seller_participant_id;
}

header trade_cancellation_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<64> trade_id;
}

header equilibrium_price_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<64> equilibrium_price;
    bit<64> matched_quantity;
    bit<64> bid_quantity;
    bit<64> ask_quantity;
}

header open_high_low_last_trade_adjustment_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<64> opening_trade;
    bit<64> highest_trade;
    bit<64> lowest_trade;
    bit<64> last_trade;
    bit<32> last_volume;
    bit<64> total_traded_volume;
}

header market_settlement_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<64> opening_trade;
    bit<64> highest_trade;
    bit<64> lowest_trade;
    bit<64> last_trade;
    bit<32> last_volume;
    bit<64> total_traded_volume;
}

header text_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<48> source_id;
    bit<800> text;
}

header request_for_quote_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<8> rfq_side;
    bit<32> quantity;
}

header anomalous_order_threshold_publish_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<64> aot_price;
    bit<64> aot_upper_price;
    bit<64> aot_lower_price;
    bit<64> etr_price;
    bit<64> etr_upper_price;
    bit<64> etr_lower_price;
}

header volume_and_open_interest_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> tradeable_instrument_id;
    bit<64> cumulative_volume;
    bit<64> open_interest;
    bit<16> voi_trade_date;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    end_of_business_trade_date_message_t end_of_business_trade_date_message[MAX_MESSAGES];
    future_symbol_directory_message_t future_symbol_directory_message[MAX_MESSAGES];
    options_symbol_directory_message_t options_symbol_directory_message[MAX_MESSAGES];
    combination_symbol_directory_message_t combination_symbol_directory_message[MAX_MESSAGES];
    bundles_symbol_directory_t bundles_symbol_directory[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    order_volume_cancelled_message_t order_volume_cancelled_message[MAX_MESSAGES];
    order_deleted_message_t order_deleted_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    auction_order_executed_message_t auction_order_executed_message[MAX_MESSAGES];
    combination_order_executed_message_t combination_order_executed_message[MAX_MESSAGES];
    implied_order_added_message_t implied_order_added_message[MAX_MESSAGES];
    implied_order_replaced_message_t implied_order_replaced_message[MAX_MESSAGES];
    implied_order_deleted_message_t implied_order_deleted_message[MAX_MESSAGES];
    trade_executed_message_t trade_executed_message[MAX_MESSAGES];
    combination_trade_executed_message_t combination_trade_executed_message[MAX_MESSAGES];
    trade_cancellation_message_t trade_cancellation_message[MAX_MESSAGES];
    equilibrium_price_message_t equilibrium_price_message[MAX_MESSAGES];
    open_high_low_last_trade_adjustment_message_t open_high_low_last_trade_adjustment_message[MAX_MESSAGES];
    market_settlement_message_t market_settlement_message[MAX_MESSAGES];
    text_message_t text_message[MAX_MESSAGES];
    request_for_quote_message_t request_for_quote_message[MAX_MESSAGES];
    anomalous_order_threshold_publish_message_t anomalous_order_threshold_publish_message[MAX_MESSAGES];
    volume_and_open_interest_message_t volume_and_open_interest_message[MAX_MESSAGES];
}

parser AsxderivativesNtpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_seconds_message;
            8w0x53: parse_end_of_business_trade_date_message;
            8w0x66: parse_future_symbol_directory_message;
            8w0x68: parse_options_symbol_directory_message;
            8w0x4d: parse_combination_symbol_directory_message;
            8w0x6d: parse_bundles_symbol_directory;
            8w0x4f: parse_order_book_state_message;
            8w0x41: parse_add_order_message;
            8w0x58: parse_order_volume_cancelled_message;
            8w0x44: parse_order_deleted_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_auction_order_executed_message;
            8w0x65: parse_combination_order_executed_message;
            8w0x6a: parse_implied_order_added_message;
            8w0x6c: parse_implied_order_replaced_message;
            8w0x6b: parse_implied_order_deleted_message;
            8w0x50: parse_trade_executed_message;
            8w0x70: parse_combination_trade_executed_message;
            8w0x42: parse_trade_cancellation_message;
            8w0x5a: parse_equilibrium_price_message;
            8w0x74: parse_open_high_low_last_trade_adjustment_message;
            8w0x59: parse_market_settlement_message;
            8w0x78: parse_text_message;
            8w0x71: parse_request_for_quote_message;
            8w0x57: parse_anomalous_order_threshold_publish_message;
            8w0x56: parse_volume_and_open_interest_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        transition parse_message;
    }

    state parse_end_of_business_trade_date_message {
        packet.extract(hdr.end_of_business_trade_date_message.next);
        transition parse_message;
    }

    state parse_future_symbol_directory_message {
        packet.extract(hdr.future_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_options_symbol_directory_message {
        packet.extract(hdr.options_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_combination_symbol_directory_message {
        packet.extract(hdr.combination_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_bundles_symbol_directory {
        packet.extract(hdr.bundles_symbol_directory.next);
        transition parse_message;
    }

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message.next);
        transition parse_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        transition parse_message;
    }

    state parse_order_volume_cancelled_message {
        packet.extract(hdr.order_volume_cancelled_message.next);
        transition parse_message;
    }

    state parse_order_deleted_message {
        packet.extract(hdr.order_deleted_message.next);
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        transition parse_message;
    }

    state parse_auction_order_executed_message {
        packet.extract(hdr.auction_order_executed_message.next);
        transition parse_message;
    }

    state parse_combination_order_executed_message {
        packet.extract(hdr.combination_order_executed_message.next);
        transition parse_message;
    }

    state parse_implied_order_added_message {
        packet.extract(hdr.implied_order_added_message.next);
        transition parse_message;
    }

    state parse_implied_order_replaced_message {
        packet.extract(hdr.implied_order_replaced_message.next);
        transition parse_message;
    }

    state parse_implied_order_deleted_message {
        packet.extract(hdr.implied_order_deleted_message.next);
        transition parse_message;
    }

    state parse_trade_executed_message {
        packet.extract(hdr.trade_executed_message.next);
        transition parse_message;
    }

    state parse_combination_trade_executed_message {
        packet.extract(hdr.combination_trade_executed_message.next);
        transition parse_message;
    }

    state parse_trade_cancellation_message {
        packet.extract(hdr.trade_cancellation_message.next);
        transition parse_message;
    }

    state parse_equilibrium_price_message {
        packet.extract(hdr.equilibrium_price_message.next);
        transition parse_message;
    }

    state parse_open_high_low_last_trade_adjustment_message {
        packet.extract(hdr.open_high_low_last_trade_adjustment_message.next);
        transition parse_message;
    }

    state parse_market_settlement_message {
        packet.extract(hdr.market_settlement_message.next);
        transition parse_message;
    }

    state parse_text_message {
        packet.extract(hdr.text_message.next);
        transition parse_message;
    }

    state parse_request_for_quote_message {
        packet.extract(hdr.request_for_quote_message.next);
        transition parse_message;
    }

    state parse_anomalous_order_threshold_publish_message {
        packet.extract(hdr.anomalous_order_threshold_publish_message.next);
        transition parse_message;
    }

    state parse_volume_and_open_interest_message {
        packet.extract(hdr.volume_and_open_interest_message.next);
        transition parse_message;
    }

}

control AsxderivativesNtpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxderivativesNtpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AsxderivativesNtpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsxderivativesNtpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxderivativesNtpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.end_of_business_trade_date_message);
        packet.emit(hdr.future_symbol_directory_message);
        packet.emit(hdr.options_symbol_directory_message);
        packet.emit(hdr.combination_symbol_directory_message);
        packet.emit(hdr.bundles_symbol_directory);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.order_volume_cancelled_message);
        packet.emit(hdr.order_deleted_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.auction_order_executed_message);
        packet.emit(hdr.combination_order_executed_message);
        packet.emit(hdr.implied_order_added_message);
        packet.emit(hdr.implied_order_replaced_message);
        packet.emit(hdr.implied_order_deleted_message);
        packet.emit(hdr.trade_executed_message);
        packet.emit(hdr.combination_trade_executed_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.equilibrium_price_message);
        packet.emit(hdr.open_high_low_last_trade_adjustment_message);
        packet.emit(hdr.market_settlement_message);
        packet.emit(hdr.text_message);
        packet.emit(hdr.request_for_quote_message);
        packet.emit(hdr.anomalous_order_threshold_publish_message);
        packet.emit(hdr.volume_and_open_interest_message);
    }
}

V1Switch(
    AsxderivativesNtpParser(),
    AsxderivativesNtpVerifyChecksum(),
    AsxderivativesNtpIngress(),
    AsxderivativesNtpEgress(),
    AsxderivativesNtpComputeChecksum(),
    AsxderivativesNtpDeparser()
) main;
