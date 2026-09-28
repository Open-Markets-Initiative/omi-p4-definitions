// P4_16 (v1model) definition for: Nasdaq NordicDerivatives MarketData GeniumAmd v2.28.7
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Genium INET Auxiliary Market Data
//   Encoding: Genium INET Auxiliary Market Data
//   Version: 2.28.7
//   Date: 10/31/2017
//   Specification: Nasdaq Nordic Genium INET AMD Protocol Specification (a2.28.7).pdf
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

header order_book_directory_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> isin;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> number_of_decimals_in_price;
    bit<16> number_of_decimals_in_nominal_value;
    bit<32> odd_lot_size;
    bit<32> round_lot_size;
    bit<32> block_lot_size;
    bit<64> nominal_value;
    bit<8> number_of_legs;
    bit<32> underlying_order_book_id;
    bit<32> strike_price;
    bit<32> expiration_date;
    bit<16> number_of_decimals_in_strike_price;
    bit<8> put_or_call;
    bit<32> notation_date;
    bit<64> first_trading_date_and_time;
    bit<64> last_trading_date_and_time;
    bit<8> country_id;
    bit<8> market_id;
    bit<8> physical_delivery;
    bit<16> option_style;
}

header market_directory_t {
    bit<32> timestamp_nanoseconds;
    bit<8> country_id;
    bit<8> market_id;
    bit<256> market_name;
}

header combination_order_book_leg_directory_t {
    bit<32> timestamp_nanoseconds;
    bit<32> combination_order_book_id;
    bit<32> leg_order_book_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header tick_size_table_entry_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> tick_size;
    bit<32> price_from;
    bit<32> price_to;
}

header system_event_message_t {
    bit<32> timestamp_nanoseconds;
    bit<8> event_code;
}

header reported_trade_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> traded_quantity;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<64> time_of_trade_execution;
    bit<64> time_of_trade_agreement;
    bit<64> time_of_trade_dissemination;
    bit<32> trade_price;
    bit<16> trade_type;
    bit<56> reserved_alpha_7;
    bit<56> second_reserved;
}

header broken_trade_message_t {
    bit<32> timestamp_nanoseconds;
    bit<64> match_id;
}

header quote_request_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<56> reserved_alpha_7;
    bit<40> reserved_alpha_5;
    bit<8> reserved_alpha_1;
    bit<8> side;
    bit<64> quantity;
}

header open_interest_messsage_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> open_interest;
    bit<32> previous_trading_date;
}

header price_message_t {
    bit<32> timestamp_nanoseconds;
    bit<8> price_type;
    bit<32> order_book_id;
    bit<32> price_price_4;
    bit<8> price_source;
}

header market_by_level_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<8> last_message;
    bit<8> level_update_action;
    bit<16> max_depth;
    bit<16> level_update;
    bit<8> entry_type;
    bit<32> market_by_level_price;
    bit<64> quantity;
}

header underlying_price_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> underlying_order_book_id;
    bit<32> bid_price;
    bit<32> ask_price;
    bit<32> closing_price;
    bit<32> opening_price;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> last_price;
    bit<64> turnover;
    bit<64> best_bid_volume;
    bit<64> best_ask_volume;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    order_book_directory_t order_book_directory[MAX_MESSAGES];
    market_directory_t market_directory[MAX_MESSAGES];
    combination_order_book_leg_directory_t combination_order_book_leg_directory[MAX_MESSAGES];
    tick_size_table_entry_t tick_size_table_entry[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    reported_trade_t reported_trade[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    quote_request_message_t quote_request_message[MAX_MESSAGES];
    open_interest_messsage_t open_interest_messsage[MAX_MESSAGES];
    price_message_t price_message[MAX_MESSAGES];
    market_by_level_message_t market_by_level_message[MAX_MESSAGES];
    underlying_price_message_t underlying_price_message[MAX_MESSAGES];
}

parser NordicderivativesMarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            16w65535: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_seconds_message;
            8w0x52: parse_order_book_directory;
            8w0x56: parse_market_directory;
            8w0x4d: parse_combination_order_book_leg_directory;
            8w0x4c: parse_tick_size_table_entry;
            8w0x53: parse_system_event_message;
            8w0x72: parse_reported_trade;
            8w0x42: parse_broken_trade_message;
            8w0x71: parse_quote_request_message;
            8w0x6f: parse_open_interest_messsage;
            8w0x70: parse_price_message;
            8w0x57: parse_market_by_level_message;
            8w0x55: parse_underlying_price_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_directory {
        packet.extract(hdr.order_book_directory.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_market_directory {
        packet.extract(hdr.market_directory.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_combination_order_book_leg_directory {
        packet.extract(hdr.combination_order_book_leg_directory.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_tick_size_table_entry {
        packet.extract(hdr.tick_size_table_entry.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_reported_trade {
        packet.extract(hdr.reported_trade.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_open_interest_messsage {
        packet.extract(hdr.open_interest_messsage.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_price_message {
        packet.extract(hdr.price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_market_by_level_message {
        packet.extract(hdr.market_by_level_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_underlying_price_message {
        packet.extract(hdr.underlying_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NordicderivativesMarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicderivativesMarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicderivativesMarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicderivativesMarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicderivativesMarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory);
        packet.emit(hdr.market_directory);
        packet.emit(hdr.combination_order_book_leg_directory);
        packet.emit(hdr.tick_size_table_entry);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.reported_trade);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.open_interest_messsage);
        packet.emit(hdr.price_message);
        packet.emit(hdr.market_by_level_message);
        packet.emit(hdr.underlying_price_message);
    }
}

V1Switch(
    NordicderivativesMarketdataParser(),
    NordicderivativesMarketdataVerifyChecksum(),
    NordicderivativesMarketdataIngress(),
    NordicderivativesMarketdataEgress(),
    NordicderivativesMarketdataComputeChecksum(),
    NordicderivativesMarketdataDeparser()
) main;
