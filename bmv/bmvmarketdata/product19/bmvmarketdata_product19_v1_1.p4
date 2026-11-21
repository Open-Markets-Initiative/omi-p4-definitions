// P4_16 (v1model) definition for: Bmv BmvMarketData Product19 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 19
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P19_1_ENG.pdf
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
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
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

header open_interest_message_t {
    bit<32> instrument_number;
    bit<32> open_interest;
}

header derivatives_market_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_time;
    bit<32> volume;
    bit<64> price_rate;
    bit<8> concertation_type;
    bit<32> trade_number;
    bit<8> operation_type;
    bit<64> amount;
    bit<32> parent_trade_number;
    bit<8> leg_type;
}

header statistics_of_instruments_message_t {
    bit<32> instrument_number;
    bit<64> previous_settlement_price;
    bit<64> opening_price;
    bit<64> max_price_of_the_day;
    bit<64> lower_price_of_the_day;
    bit<64> last_price_of_the_day;
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
    depth_message_t depth_message[MAX_MESSAGES];
    depth_message_price_level_t depth_message_price_level[MAX_MESSAGES];
    open_interest_message_t open_interest_message[MAX_MESSAGES];
    derivatives_market_trades_message_t derivatives_market_trades_message[MAX_MESSAGES];
    statistics_of_instruments_message_t statistics_of_instruments_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct19Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x31: parse_depth_message;
            8w0x49: parse_open_interest_message;
            8w0x51: parse_derivatives_market_trades_message;
            8w0x52: parse_statistics_of_instruments_message;
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

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_derivatives_market_trades_message {
        packet.extract(hdr.derivatives_market_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_statistics_of_instruments_message {
        packet.extract(hdr.statistics_of_instruments_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct19VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct19Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct19Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct19ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct19Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.events_system_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.status_changes_message);
        packet.emit(hdr.weighted_average_price_settlement_prices_message);
        packet.emit(hdr.depth_message);
        packet.emit(hdr.depth_message_price_level);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.derivatives_market_trades_message);
        packet.emit(hdr.statistics_of_instruments_message);
    }
}

V1Switch(
    BmvmarketdataProduct19Parser(),
    BmvmarketdataProduct19VerifyChecksum(),
    BmvmarketdataProduct19Ingress(),
    BmvmarketdataProduct19Egress(),
    BmvmarketdataProduct19ComputeChecksum(),
    BmvmarketdataProduct19Deparser()
) main;
