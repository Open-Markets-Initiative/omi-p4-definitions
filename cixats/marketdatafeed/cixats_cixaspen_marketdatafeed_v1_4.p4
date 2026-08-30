// P4_16 (v1model) definition for: CixAts CixAspen MarketDataFeed Aspen v1.4
// 
// Protocol:
//   Organization: CIX Trading Inc.
//   Protocol: CIX Market Data Feed
//   Encoding: Aspen
//   Version: 1.4
//   Date: 4/9/2026
//   Specification: Market Data Feed Specification-1.4.pdf
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
    bit<72> market_day_identifier;
    bit<8> feed_identifier;
    bit<64> sequence;
    bit<16> count;
    bit<16> length;
    bit<8> message_type;
}

header market_event_message_t {
    bit<16> reserved_2;
    bit<64> timestamp;
    bit<8> event;
}

header symbol_information_message_t {
    bit<64> timestamp;
    bit<16> symbol_id;
    bit<88> symbol;
    bit<8> listing_market;
    bit<32> board_lot_size;
}

header symbol_state_message_t {
    bit<64> timestamp;
    bit<16> symbol_id;
    bit<88> symbol;
    bit<8> state_;
    bit<8> reserved_1;
    bit<32> info;
}

header new_order_add_message_t {
    bit<64> timestamp;
    bit<16> symbol_id;
    bit<64> order_id;
    bit<8> side;
    bit<64> quantity;
    bit<88> symbol;
    bit<64> price;
    bit<24> broker;
    bit<8> reserved_1;
}

header order_partial_cancel_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<64> quantity_canceled;
}

header order_cancel_all_message_t {
    bit<64> timestamp;
    bit<64> order_id;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<64> quantity;
    bit<64> execution_id;
    bit<8> side;
    bit<64> price;
    bit<24> broker;
    bit<24> contra_broker;
}

header trade_message_t {
    bit<16> symbol_id;
    bit<64> timestamp;
    bit<64> reserved_8;
    bit<8> side;
    bit<64> shares;
    bit<88> symbol;
    bit<64> price;
    bit<64> execution_id;
    bit<24> broker;
    bit<24> contra_broker;
}

header trade_cancel_message_t {
    bit<16> symbol_id;
    bit<64> timestamp;
    bit<64> reserved_8;
    bit<8> reserved_1;
    bit<64> shares;
    bit<88> symbol;
    bit<64> price;
    bit<64> execution_id;
    bit<24> broker;
    bit<24> contra_broker;
}

header trade_correct_message_t {
    bit<16> symbol_id;
    bit<64> timestamp;
    bit<64> reserved_8;
    bit<8> reserved_1;
    bit<88> symbol;
    bit<64> execution_id;
    bit<24> broker;
    bit<24> contra_broker;
    bit<64> original_execution_id;
    bit<64> original_trade_price;
    bit<64> original_trade_quantity;
    bit<64> corrected_trade_price;
    bit<64> corrected_trade_quantity;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    market_event_message_t market_event_message;
    symbol_information_message_t symbol_information_message;
    symbol_state_message_t symbol_state_message;
    new_order_add_message_t new_order_add_message;
    order_partial_cancel_message_t order_partial_cancel_message;
    order_cancel_all_message_t order_cancel_all_message;
    order_executed_message_t order_executed_message;
    trade_message_t trade_message;
    trade_cancel_message_t trade_cancel_message;
    trade_correct_message_t trade_correct_message;
}

parser CixatsCixaspenMarketdatafeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x41: parse_market_event_message;
            8w0x42: parse_symbol_information_message;
            8w0x43: parse_symbol_state_message;
            8w0x44: parse_new_order_add_message;
            8w0x46: parse_order_partial_cancel_message;
            8w0x47: parse_order_cancel_all_message;
            8w0x4a: parse_order_executed_message;
            8w0x4b: parse_trade_message;
            8w0x4c: parse_trade_cancel_message;
            8w0x4d: parse_trade_correct_message;
            default: accept;
        }
    }

    state parse_market_event_message {
        packet.extract(hdr.market_event_message);
        transition accept;
    }

    state parse_symbol_information_message {
        packet.extract(hdr.symbol_information_message);
        transition accept;
    }

    state parse_symbol_state_message {
        packet.extract(hdr.symbol_state_message);
        transition accept;
    }

    state parse_new_order_add_message {
        packet.extract(hdr.new_order_add_message);
        transition accept;
    }

    state parse_order_partial_cancel_message {
        packet.extract(hdr.order_partial_cancel_message);
        transition accept;
    }

    state parse_order_cancel_all_message {
        packet.extract(hdr.order_cancel_all_message);
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_trade_cancel_message {
        packet.extract(hdr.trade_cancel_message);
        transition accept;
    }

    state parse_trade_correct_message {
        packet.extract(hdr.trade_correct_message);
        transition accept;
    }

}

control CixatsCixaspenMarketdatafeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CixatsCixaspenMarketdatafeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CixatsCixaspenMarketdatafeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CixatsCixaspenMarketdatafeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CixatsCixaspenMarketdatafeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.market_event_message);
        packet.emit(hdr.symbol_information_message);
        packet.emit(hdr.symbol_state_message);
        packet.emit(hdr.new_order_add_message);
        packet.emit(hdr.order_partial_cancel_message);
        packet.emit(hdr.order_cancel_all_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_cancel_message);
        packet.emit(hdr.trade_correct_message);
    }
}

V1Switch(
    CixatsCixaspenMarketdatafeedParser(),
    CixatsCixaspenMarketdatafeedVerifyChecksum(),
    CixatsCixaspenMarketdatafeedIngress(),
    CixatsCixaspenMarketdatafeedEgress(),
    CixatsCixaspenMarketdatafeedComputeChecksum(),
    CixatsCixaspenMarketdatafeedDeparser()
) main;
