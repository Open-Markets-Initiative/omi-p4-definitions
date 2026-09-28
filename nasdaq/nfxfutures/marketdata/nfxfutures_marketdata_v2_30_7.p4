// P4_16 (v1model) definition for: Nasdaq NfxFutures MarketData GeniumAmd v2.30.7
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Genium INET Auxiliary Market Data
//   Encoding: Genium INET Auxiliary Market Data
//   Version: 2.30.7
//   Date: 11/17/2017
//   Specification: Nasdaq AMD Market Data (2017-11).pdf
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
    bit<16> market_id;
    bit<8> strategy_subtype;
    bit<32> minimum_quantity_and_multiple;
}

header combination_order_book_leg_t {
    bit<32> timestamp_nanoseconds;
    bit<32> combination_order_book_id;
    bit<32> leg_order_book_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
    bit<32> leg_price_future;
    bit<32> leg_delta;
    bit<32> leg_quantity_future;
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

header order_book_state_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<160> state_name;
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
    bit<56> reserved;
    bit<56> second_reserved;
}

header broken_trade_message_t {
    bit<32> timestamp_nanoseconds;
    bit<64> match_id;
}

header open_interest_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> open_interest;
}

header price_message_t {
    bit<32> timestamp_nanoseconds;
    bit<8> price_type;
    bit<32> order_book_id;
    bit<32> price;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    order_book_directory_t order_book_directory[MAX_MESSAGES];
    combination_order_book_leg_t combination_order_book_leg[MAX_MESSAGES];
    tick_size_table_entry_t tick_size_table_entry[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    reported_trade_t reported_trade[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    open_interest_message_t open_interest_message[MAX_MESSAGES];
    price_message_t price_message[MAX_MESSAGES];
}

parser NfxfuturesMarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x4d: parse_combination_order_book_leg;
            8w0x4c: parse_tick_size_table_entry;
            8w0x53: parse_system_event_message;
            8w0x4f: parse_order_book_state_message;
            8w0x72: parse_reported_trade;
            8w0x42: parse_broken_trade_message;
            8w0x6f: parse_open_interest_message;
            8w0x70: parse_price_message;
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

    state parse_combination_order_book_leg {
        packet.extract(hdr.combination_order_book_leg.next);
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

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message.next);
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

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_price_message {
        packet.extract(hdr.price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NfxfuturesMarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NfxfuturesMarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NfxfuturesMarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NfxfuturesMarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NfxfuturesMarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory);
        packet.emit(hdr.combination_order_book_leg);
        packet.emit(hdr.tick_size_table_entry);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.reported_trade);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.price_message);
    }
}

V1Switch(
    NfxfuturesMarketdataParser(),
    NfxfuturesMarketdataVerifyChecksum(),
    NfxfuturesMarketdataIngress(),
    NfxfuturesMarketdataEgress(),
    NfxfuturesMarketdataComputeChecksum(),
    NfxfuturesMarketdataDeparser()
) main;
