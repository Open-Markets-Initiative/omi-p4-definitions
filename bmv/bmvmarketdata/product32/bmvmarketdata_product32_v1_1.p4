// P4_16 (v1model) definition for: Bmv BmvMarketData Product32 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 32
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P32_1_ENG.pdf
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

header effective_spread_message_t {
    bit<8> origin;
    bit<32> es_mxn;
    bit<32> es_basis_points;
    bit<32> es_mxn_bid;
    bit<32> es_basis_points_bid;
    bit<32> es_mxn_ask;
    bit<32> es_basis_points_ask;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

header spread_quality_message_t {
    bit<8> origin;
    bit<32> time_best_spread;
    bit<32> time_tie_best_spread;
    bit<32> time_without_best_spread;
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

header quotes_quality_message_t {
    bit<8> origin;
    bit<16> instruments;
    bit<32> time;
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
    effective_spread_message_t effective_spread_message[MAX_MESSAGES];
    spread_quality_message_t spread_quality_message[MAX_MESSAGES];
    price_leaderboard_message_t price_leaderboard_message[MAX_MESSAGES];
    quotes_quality_message_t quotes_quality_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct32Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x3D: parse_effective_spread_message;
            8w0x7B: parse_spread_quality_message;
            8w0x40: parse_price_leaderboard_message;
            8w0x7C: parse_quotes_quality_message;
            default: accept;
        }
    }

    state parse_effective_spread_message {
        packet.extract(hdr.effective_spread_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_spread_quality_message {
        packet.extract(hdr.spread_quality_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_price_leaderboard_message {
        packet.extract(hdr.price_leaderboard_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_quotes_quality_message {
        packet.extract(hdr.quotes_quality_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct32VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct32Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct32Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct32ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct32Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.effective_spread_message);
        packet.emit(hdr.spread_quality_message);
        packet.emit(hdr.price_leaderboard_message);
        packet.emit(hdr.quotes_quality_message);
    }
}

V1Switch(
    BmvmarketdataProduct32Parser(),
    BmvmarketdataProduct32VerifyChecksum(),
    BmvmarketdataProduct32Ingress(),
    BmvmarketdataProduct32Egress(),
    BmvmarketdataProduct32ComputeChecksum(),
    BmvmarketdataProduct32Deparser()
) main;
