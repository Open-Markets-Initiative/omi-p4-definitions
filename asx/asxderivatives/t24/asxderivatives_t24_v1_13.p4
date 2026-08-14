// P4_16 (v1model) definition for: Asx AsxDerivatives T24 Itch v1.13
// 
// Protocol:
//   Organization: Australian Securities Exchange
//   Protocol: 24 Itch
//   Encoding: Itch
//   Version: 1.13
//   Date: 07/15/2014
//   Specification: T24ITCH_External_Message_Specification_V1.13.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header session_t {
    bit<24> protocol_version;
    bit<16> session_year;
    bit<16> session_week;
    bit<24> trading_service;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header time_message_t {
    bit<32> second;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<8> event_code;
}

header future_symbol_directory_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<48> exchange;
    bit<48> instrument;
    bit<8> contract_type;
    bit<16> expiry_year;
    bit<8> expiry_month;
    bit<8> price_decimal_position;
    bit<32> price_fractional_denominator;
    bit<16> price_minimum_tick;
    bit<32> last_trading_date;
    bit<32> prior_day_settlement;
    bit<8> financial_type;
    bit<24> currency;
    bit<32> lot_size_or_face_value;
    bit<8> maturity_value;
    bit<16> coupon_rate;
    bit<8> payments_per_year;
}

header spread_symbol_directory_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<48> exchange;
    bit<8> contract_type;
    bit<32> first_leg_contract_number;
    bit<32> second_leg_contract_number;
    bit<8> primary_ratio;
    bit<8> secondary_ratio;
    bit<8> price_decimal_position;
    bit<32> price_fractional_denominator;
    bit<16> price_minimum_tick;
}

header option_symbol_directory_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<48> exchange;
    bit<48> instrument;
    bit<8> contract_type;
    bit<16> expiry_year;
    bit<8> expiry_month;
    bit<8> option_type;
    bit<32> strike;
    bit<32> underlying_contract_number;
    bit<8> price_decimal_position;
    bit<32> price_fractional_denominator;
    bit<16> price_minimum_tick;
    bit<8> strike_price_decimal_position;
    bit<32> strike_price_fractional_denominator;
    bit<16> strike_price_minimum_tick;
    bit<32> last_trading_date;
    bit<32> prior_day_settlement;
    bit<32> volatility;
    bit<8> financial_type;
    bit<24> currency;
    bit<32> lot_size_or_face_value;
    bit<8> maturity_value;
    bit<16> coupon_rate;
    bit<8> payments_per_year;
    bit<8> activated;
}

header order_book_state_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> trading_status;
}

header order_added_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> order_book_priority;
    bit<32> quantity;
    bit<32> price;
}

header order_replaced_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> order_book_priority;
    bit<32> quantity;
    bit<32> price;
}

header order_volume_cancelled_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> quantity;
}

header order_deleted_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
}

header implied_order_added_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> order_book_priority;
    bit<32> quantity;
    bit<32> price;
}

header implied_order_replaced_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> order_book_priority;
    bit<32> quantity;
    bit<32> price;
}

header implied_order_deleted_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
}

header custom_market_order_added_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<64> order_number;
    bit<32> order_book_priority;
    bit<32> quantity;
    bit<8> legs;
    bit<32> contract_number;
    bit<8> side;
    bit<16> ratio;
    bit<32> price;
}

header custom_market_order_replaced_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<64> order_number;
    bit<32> order_book_priority;
    bit<32> quantity;
}

header custom_market_order_deleted_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<64> order_number;
}

header order_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> quantity_remaining;
    bit<8> trade_type;
    bit<32> match_number;
    bit<32> executed_quantity;
    bit<32> trade_price;
}

header order_executed_with_price_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<64> buying_order_number;
    bit<32> buyer_quantity_remaining;
    bit<64> selling_order_number;
    bit<32> seller_quantity_remaining;
    bit<8> trade_type;
    bit<32> match_number;
    bit<32> executed_quantity;
    bit<32> trade_price;
}

header spread_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> quantity_remaining;
    bit<8> trade_type;
    bit<32> match_number;
    bit<32> executed_quantity;
    bit<32> trade_price;
    bit<32> traded_contract_number;
    bit<32> spread_trade_price;
    bit<8> trade_side_of_leg;
    bit<8> printable;
}

header trade_spread_execution_chain_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> buyer;
    bit<8> side_of_buyer;
    bit<64> buyer_order_number;
    bit<32> buyer_quantity_remaining;
    bit<32> seller_contract_number;
    bit<8> side_of_seller;
    bit<64> selling_order_number;
    bit<32> seller_quantity_remaining;
    bit<8> trade_type;
    bit<32> match_number;
    bit<32> executed_quantity;
    bit<32> trade_price;
    bit<32> traded_contract_number;
    bit<32> spread_trade_price;
    bit<8> printable;
}

header custom_market_executed_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<64> order_number;
    bit<32> quantity_remaining;
    bit<8> trade_type;
    bit<32> match_number;
    bit<32> executed_quantity;
    bit<32> trade_price;
    bit<32> traded_contract_number;
    bit<8> trade_side_of_leg;
    bit<8> printable;
}

header custom_market_trade_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<8> side;
    bit<64> order_number;
    bit<32> quantity_remaining;
    bit<64> custom_market_order_number;
    bit<32> custom_market_quantity_remaining;
    bit<8> trade_type;
    bit<32> match_number;
    bit<32> executed_quantity;
    bit<32> trade_price;
    bit<32> traded_contract_number;
    bit<8> trade_side_of_non_custom_order;
    bit<8> printable;
}

header trade_cancellation_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> match_number;
}

header equilibrium_price_auction_info_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<32> equilibrium_price;
    bit<32> best_bid_price;
    bit<32> best_ask_price;
    bit<32> best_bid_quantity;
    bit<32> best_ask_quantity;
}

header open_high_low_last_trade_adjustment_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<32> opening_trade;
    bit<32> highest_trade;
    bit<32> lowest_trade;
    bit<32> last_trade;
    bit<32> last_volume;
    bit<32> total_traded_volume;
    bit<32> total_trades;
    bit<1> opening_trade_price;
    bit<1> highest_traded_price;
    bit<1> lowest_traded_price;
    bit<1> total_traded_volume_and_total_trades;
    bit<1> last_traded_price;
    bit<1> last_traded_volume;
    bit<2> all_fields;
}

header market_settlement_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<32> settlement_price;
    bit<32> volatility;
    bit<8> settlement_type;
}

header ad_hoc_text_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<48> source_id;
    bit<800> text_message;
}

header request_for_quote_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<32> price;
    bit<32> quantity;
}

header anomalous_order_threshold_publish_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<32> aot_price;
    bit<32> aot_upper_price;
    bit<32> aot_lower_price;
    bit<32> etr_price;
    bit<32> etr_upper_price;
    bit<32> etr_lower_price;
}

header volume_and_open_interest_message_t {
    bit<32> nanoseconds;
    bit<16> trade_date;
    bit<32> contract_number;
    bit<32> cumulative_volume;
    bit<32> open_interest;
    bit<16> voi_trade_date;
}

struct metadata_t {
}

struct headers_t {
    session_t session;
    message_t message[MAX_MESSAGES];
    time_message_t time_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    future_symbol_directory_message_t future_symbol_directory_message[MAX_MESSAGES];
    spread_symbol_directory_message_t spread_symbol_directory_message[MAX_MESSAGES];
    option_symbol_directory_message_t option_symbol_directory_message[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    order_added_message_t order_added_message[MAX_MESSAGES];
    order_replaced_message_t order_replaced_message[MAX_MESSAGES];
    order_volume_cancelled_message_t order_volume_cancelled_message[MAX_MESSAGES];
    order_deleted_message_t order_deleted_message[MAX_MESSAGES];
    implied_order_added_message_t implied_order_added_message[MAX_MESSAGES];
    implied_order_replaced_message_t implied_order_replaced_message[MAX_MESSAGES];
    implied_order_deleted_message_t implied_order_deleted_message[MAX_MESSAGES];
    custom_market_order_added_message_t custom_market_order_added_message[MAX_MESSAGES];
    custom_market_order_replaced_message_t custom_market_order_replaced_message[MAX_MESSAGES];
    custom_market_order_deleted_message_t custom_market_order_deleted_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    spread_executed_message_t spread_executed_message[MAX_MESSAGES];
    trade_spread_execution_chain_message_t trade_spread_execution_chain_message[MAX_MESSAGES];
    custom_market_executed_message_t custom_market_executed_message[MAX_MESSAGES];
    custom_market_trade_message_t custom_market_trade_message[MAX_MESSAGES];
    trade_cancellation_message_t trade_cancellation_message[MAX_MESSAGES];
    equilibrium_price_auction_info_message_t equilibrium_price_auction_info_message[MAX_MESSAGES];
    open_high_low_last_trade_adjustment_message_t open_high_low_last_trade_adjustment_message[MAX_MESSAGES];
    market_settlement_message_t market_settlement_message[MAX_MESSAGES];
    ad_hoc_text_message_t ad_hoc_text_message[MAX_MESSAGES];
    request_for_quote_message_t request_for_quote_message[MAX_MESSAGES];
    anomalous_order_threshold_publish_message_t anomalous_order_threshold_publish_message[MAX_MESSAGES];
    volume_and_open_interest_message_t volume_and_open_interest_message[MAX_MESSAGES];
}

parser AsxderivativesT24Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.session);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_time_message;
            8w0x53: parse_system_event_message;
            8w0x66: parse_future_symbol_directory_message;
            8w0x67: parse_spread_symbol_directory_message;
            8w0x68: parse_option_symbol_directory_message;
            8w0x4f: parse_order_book_state_message;
            8w0x41: parse_order_added_message;
            8w0x55: parse_order_replaced_message;
            8w0x58: parse_order_volume_cancelled_message;
            8w0x44: parse_order_deleted_message;
            8w0x6a: parse_implied_order_added_message;
            8w0x6c: parse_implied_order_replaced_message;
            8w0x6b: parse_implied_order_deleted_message;
            8w0x6d: parse_custom_market_order_added_message;
            8w0x6e: parse_custom_market_order_replaced_message;
            8w0x72: parse_custom_market_order_deleted_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x65: parse_spread_executed_message;
            8w0x50: parse_trade_spread_execution_chain_message;
            8w0x75: parse_custom_market_executed_message;
            8w0x70: parse_custom_market_trade_message;
            8w0x42: parse_trade_cancellation_message;
            8w0x5a: parse_equilibrium_price_auction_info_message;
            8w0x74: parse_open_high_low_last_trade_adjustment_message;
            8w0x59: parse_market_settlement_message;
            8w0x78: parse_ad_hoc_text_message;
            8w0x71: parse_request_for_quote_message;
            8w0x57: parse_anomalous_order_threshold_publish_message;
            8w0x56: parse_volume_and_open_interest_message;
            default: accept;
        }
    }

    state parse_time_message {
        packet.extract(hdr.time_message.next);
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_future_symbol_directory_message {
        packet.extract(hdr.future_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_spread_symbol_directory_message {
        packet.extract(hdr.spread_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_option_symbol_directory_message {
        packet.extract(hdr.option_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message.next);
        transition parse_message;
    }

    state parse_order_added_message {
        packet.extract(hdr.order_added_message.next);
        transition parse_message;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message.next);
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

    state parse_custom_market_order_added_message {
        packet.extract(hdr.custom_market_order_added_message.next);
        transition parse_message;
    }

    state parse_custom_market_order_replaced_message {
        packet.extract(hdr.custom_market_order_replaced_message.next);
        transition parse_message;
    }

    state parse_custom_market_order_deleted_message {
        packet.extract(hdr.custom_market_order_deleted_message.next);
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        transition parse_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        transition parse_message;
    }

    state parse_spread_executed_message {
        packet.extract(hdr.spread_executed_message.next);
        transition parse_message;
    }

    state parse_trade_spread_execution_chain_message {
        packet.extract(hdr.trade_spread_execution_chain_message.next);
        transition parse_message;
    }

    state parse_custom_market_executed_message {
        packet.extract(hdr.custom_market_executed_message.next);
        transition parse_message;
    }

    state parse_custom_market_trade_message {
        packet.extract(hdr.custom_market_trade_message.next);
        transition parse_message;
    }

    state parse_trade_cancellation_message {
        packet.extract(hdr.trade_cancellation_message.next);
        transition parse_message;
    }

    state parse_equilibrium_price_auction_info_message {
        packet.extract(hdr.equilibrium_price_auction_info_message.next);
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

    state parse_ad_hoc_text_message {
        packet.extract(hdr.ad_hoc_text_message.next);
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

control AsxderivativesT24VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxderivativesT24Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AsxderivativesT24Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsxderivativesT24ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxderivativesT24Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.session);
        packet.emit(hdr.message);
        packet.emit(hdr.time_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.future_symbol_directory_message);
        packet.emit(hdr.spread_symbol_directory_message);
        packet.emit(hdr.option_symbol_directory_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.order_added_message);
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.order_volume_cancelled_message);
        packet.emit(hdr.order_deleted_message);
        packet.emit(hdr.implied_order_added_message);
        packet.emit(hdr.implied_order_replaced_message);
        packet.emit(hdr.implied_order_deleted_message);
        packet.emit(hdr.custom_market_order_added_message);
        packet.emit(hdr.custom_market_order_replaced_message);
        packet.emit(hdr.custom_market_order_deleted_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.spread_executed_message);
        packet.emit(hdr.trade_spread_execution_chain_message);
        packet.emit(hdr.custom_market_executed_message);
        packet.emit(hdr.custom_market_trade_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.equilibrium_price_auction_info_message);
        packet.emit(hdr.open_high_low_last_trade_adjustment_message);
        packet.emit(hdr.market_settlement_message);
        packet.emit(hdr.ad_hoc_text_message);
        packet.emit(hdr.request_for_quote_message);
        packet.emit(hdr.anomalous_order_threshold_publish_message);
        packet.emit(hdr.volume_and_open_interest_message);
    }
}

V1Switch(
    AsxderivativesT24Parser(),
    AsxderivativesT24VerifyChecksum(),
    AsxderivativesT24Ingress(),
    AsxderivativesT24Egress(),
    AsxderivativesT24ComputeChecksum(),
    AsxderivativesT24Deparser()
) main;
