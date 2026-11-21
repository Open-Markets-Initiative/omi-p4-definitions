// P4_16 (v1model) definition for: Bmv BmvMarketData Product29 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 29
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P29_1_ENG.pdf
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

header last_quote_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> volume;
    bit<64> price_rate;
    bit<8> direction_of_the_bid;
    bit<8> type_of_trading;
}

header benchmark_trade_message_t {
    bit<8> origin;
    bit<64> average_volume;
    bit<64> average_traded_value;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

header price_leaderboard_message_t {
    bit<8> origin;
    bit<32> t_best_bid;
    bit<32> t_tie_best_bid;
    bit<32> t_without_best_bid;
    bit<32> t_best_ask;
    bit<32> t_tie_best_ask;
    bit<32> t_without_best_ask;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

header trading_sniper_message_t {
    bit<8> origin;
    bit<64> depth_bid;
    bit<64> depth_ask;
    bit<64> depth_bid_10_l;
    bit<64> depth_ask_10_l;
    bit<64> vwp_bid_10_l;
    bit<64> vwp_ask_10_l;
    bit<64> vwp_bid;
    bit<64> vwp_ask;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

header depth_at_best_prices_message_t {
    bit<8> origin;
    bit<16> instruments_bb;
    bit<16> instruments_gv_bb;
    bit<32> ratio_v_at_bb;
    bit<16> instruments_ba;
    bit<16> instruments_gv_ba;
    bit<32> ratio_v_at_ba;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    last_quote_message_t last_quote_message[MAX_MESSAGES];
    benchmark_trade_message_t benchmark_trade_message[MAX_MESSAGES];
    price_leaderboard_message_t price_leaderboard_message[MAX_MESSAGES];
    trading_sniper_message_t trading_sniper_message[MAX_MESSAGES];
    depth_at_best_prices_message_t depth_at_best_prices_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct29Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x6D: parse_last_quote_message;
            8w0x3A: parse_benchmark_trade_message;
            8w0x40: parse_price_leaderboard_message;
            8w0x3C: parse_trading_sniper_message;
            8w0x5E: parse_depth_at_best_prices_message;
            default: accept;
        }
    }

    state parse_last_quote_message {
        packet.extract(hdr.last_quote_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_benchmark_trade_message {
        packet.extract(hdr.benchmark_trade_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_price_leaderboard_message {
        packet.extract(hdr.price_leaderboard_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_trading_sniper_message {
        packet.extract(hdr.trading_sniper_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_depth_at_best_prices_message {
        packet.extract(hdr.depth_at_best_prices_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct29VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct29Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct29Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct29ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct29Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.last_quote_message);
        packet.emit(hdr.benchmark_trade_message);
        packet.emit(hdr.price_leaderboard_message);
        packet.emit(hdr.trading_sniper_message);
        packet.emit(hdr.depth_at_best_prices_message);
    }
}

V1Switch(
    BmvmarketdataProduct29Parser(),
    BmvmarketdataProduct29VerifyChecksum(),
    BmvmarketdataProduct29Ingress(),
    BmvmarketdataProduct29Egress(),
    BmvmarketdataProduct29ComputeChecksum(),
    BmvmarketdataProduct29Deparser()
) main;
