// P4_16 (v1model) definition for: Bmv BmvMarketData Product3 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 3
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P3_1_ENG.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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

header intra_multicast_header_t {
    bit<16> length;
    bit<8> total_messages;
    bit<8> market_data_group;
    bit<8> session;
    bit<32> sequence_number;
    bit<64> datetime;
}

header intra_multicast_header_message_block_t {
    bit<16> message_length;
    bit<8> message_type;
}

header events_system_message_t {
    bit<32> instrument_number;
    bit<8> event_code;
    bit<8> market;
    bit<64> sending_time;
    bit<64> ending_time;
}

header trade_cancellation_message_t {
    bit<32> instrument_number;
    bit<32> trade_number;
}

header status_changes_message_t {
    bit<32> instrument_number;
    bit<8> instrument_status;
}

header weighted_average_price_settlement_prices_message_t {
    bit<32> instrument_number;
    bit<64> weighted_average_price;
    bit<64> volatility;
}

header capital_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_time;
    bit<32> volume;
    bit<64> price;
    bit<8> concertation_type;
    bit<32> trade_number;
    bit<8> price_setter;
    bit<8> operation_type;
    bit<64> amount;
    bit<40> buy;
    bit<40> sell;
    bit<8> settlement;
    bit<8> auction_indicator;
}

header probable_allocation_price_message_t {
    bit<32> instrument_number;
    bit<64> probable_allocation_price;
    bit<32> volume;
}

header continuous_auctions_beginning_message_t {
    bit<32> instrument_number;
    bit<64> beginning_time_of_auction;
    bit<64> end_auction_time;
}

header middle_price_existing_quotes_message_t {
    bit<32> instrument_number;
    bit<8> existing_postures;
}

header registry_operations_message_t {
    bit<32> instrument_number;
    bit<8> offer_type;
    bit<8> income;
    bit<32> value_type;
    bit<56> issuer;
    bit<48> series;
    bit<64> maximum_volume;
    bit<64> registered_volume;
    bit<64> price_rate;
    bit<64> settlement_date;
    bit<40> firm;
    bit<8> movement;
}

header mutual_fund_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_date;
    bit<64> price;
    bit<64> book_value;
    bit<32> number_of_sales_transactions;
    bit<64> sales_volume;
    bit<32> number_of_buy_transactions;
    bit<64> buy_volume;
}

header tradability_message_t {
    bit<32> instrument_number;
    bit<32> number_of_operations;
    bit<64> volume_long;
    bit<64> amount;
    bit<64> opening_price;
    bit<64> maximum;
    bit<64> minimum;
    bit<64> average;
    bit<64> last;
}

header virtual_trades_message_t {
    bit<32> instrument_number;
    bit<8> virtual_trades_status;
    bit<8> operation_type;
    bit<32> number;
    bit<32> volume;
    bit<8> concertation;
    bit<40> buy;
    bit<40> sell;
}

header depth_message_t {
    bit<32> instrument_number;
    bit<8> side;
    bit<8> purchase_or_sale_levels;
}

header depth_message_price_level_t {
    bit<64> price;
    bit<16> number_of_orders;
    bit<32> volume;
}

header best_offer_message_t {
    bit<32> instrument_number;
    bit<32> volume;
    bit<64> price_rate;
    bit<8> offer_direction;
    bit<8> operation_type;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> depth_message_price_level_remaining;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    events_system_message_t events_system_message[MAX_MESSAGES];
    trade_cancellation_message_t trade_cancellation_message[MAX_MESSAGES];
    status_changes_message_t status_changes_message[MAX_MESSAGES];
    weighted_average_price_settlement_prices_message_t weighted_average_price_settlement_prices_message[MAX_MESSAGES];
    capital_trades_message_t capital_trades_message[MAX_MESSAGES];
    probable_allocation_price_message_t probable_allocation_price_message[MAX_MESSAGES];
    continuous_auctions_beginning_message_t continuous_auctions_beginning_message[MAX_MESSAGES];
    middle_price_existing_quotes_message_t middle_price_existing_quotes_message[MAX_MESSAGES];
    registry_operations_message_t registry_operations_message[MAX_MESSAGES];
    mutual_fund_trades_message_t mutual_fund_trades_message[MAX_MESSAGES];
    tradability_message_t tradability_message[MAX_MESSAGES];
    virtual_trades_message_t virtual_trades_message[MAX_MESSAGES];
    depth_message_t depth_message[MAX_MESSAGES];
    depth_message_price_level_t depth_message_price_level[MAX_MESSAGES];
    best_offer_message_t best_offer_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct3Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.intra_multicast_header);
        transition select(hdr.intra_multicast_header.total_messages) {
            8w0: parse_intra_multicast_header_message_block_empty;
            default: parse_intra_multicast_header_message_block;
        }
    }

    state parse_intra_multicast_header_message_block {
        packet.extract(hdr.intra_multicast_header_message_block.next);
        transition select(hdr.intra_multicast_header_message_block.last.message_type) {
            8w0x53: parse_events_system_message;
            8w0x48: parse_trade_cancellation_message;
            8w0x34: parse_status_changes_message;
            8w0x4D: parse_weighted_average_price_settlement_prices_message;
            8w0x50: parse_capital_trades_message;
            8w0x32: parse_probable_allocation_price_message;
            8w0x33: parse_continuous_auctions_beginning_message;
            8w0x35: parse_middle_price_existing_quotes_message;
            8w0x5A: parse_registry_operations_message;
            8w0x59: parse_mutual_fund_trades_message;
            8w0x45: parse_tradability_message;
            8w0x56: parse_virtual_trades_message;
            8w0x31: parse_depth_message;
            8w0x4F: parse_best_offer_message;
            default: accept;
        }
    }

    state parse_events_system_message {
        packet.extract(hdr.events_system_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_trade_cancellation_message {
        packet.extract(hdr.trade_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_status_changes_message {
        packet.extract(hdr.status_changes_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_weighted_average_price_settlement_prices_message {
        packet.extract(hdr.weighted_average_price_settlement_prices_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_capital_trades_message {
        packet.extract(hdr.capital_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_probable_allocation_price_message {
        packet.extract(hdr.probable_allocation_price_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_continuous_auctions_beginning_message {
        packet.extract(hdr.continuous_auctions_beginning_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_middle_price_existing_quotes_message {
        packet.extract(hdr.middle_price_existing_quotes_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_registry_operations_message {
        packet.extract(hdr.registry_operations_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_mutual_fund_trades_message {
        packet.extract(hdr.mutual_fund_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_tradability_message {
        packet.extract(hdr.tradability_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_virtual_trades_message {
        packet.extract(hdr.virtual_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_depth_message {
        packet.extract(hdr.depth_message.next);
        meta.dispatched = 1;
        meta.depth_message_price_level_remaining = hdr.depth_message.last.purchase_or_sale_levels;
        transition select(meta.depth_message_price_level_remaining) {
            8w0: parse_intra_multicast_header_message_block;
            default: parse_depth_message_price_level;
        }
    }

    state parse_depth_message_price_level {
        packet.extract(hdr.depth_message_price_level.next);
        meta.depth_message_price_level_remaining = meta.depth_message_price_level_remaining - 1;
        transition select(meta.depth_message_price_level_remaining) {
            8w0: parse_intra_multicast_header_message_block;
            default: parse_depth_message_price_level;
        }
    }

    state parse_best_offer_message {
        packet.extract(hdr.best_offer_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct3VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct3Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct3Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct3ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct3Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.events_system_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.status_changes_message);
        packet.emit(hdr.weighted_average_price_settlement_prices_message);
        packet.emit(hdr.capital_trades_message);
        packet.emit(hdr.probable_allocation_price_message);
        packet.emit(hdr.continuous_auctions_beginning_message);
        packet.emit(hdr.middle_price_existing_quotes_message);
        packet.emit(hdr.registry_operations_message);
        packet.emit(hdr.mutual_fund_trades_message);
        packet.emit(hdr.tradability_message);
        packet.emit(hdr.virtual_trades_message);
        packet.emit(hdr.depth_message);
        packet.emit(hdr.depth_message_price_level);
        packet.emit(hdr.best_offer_message);
    }
}

V1Switch(
    BmvmarketdataProduct3Parser(),
    BmvmarketdataProduct3VerifyChecksum(),
    BmvmarketdataProduct3Ingress(),
    BmvmarketdataProduct3Egress(),
    BmvmarketdataProduct3ComputeChecksum(),
    BmvmarketdataProduct3Deparser()
) main;
