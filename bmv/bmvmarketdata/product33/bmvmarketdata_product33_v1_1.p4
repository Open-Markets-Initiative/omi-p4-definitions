// P4_16 (v1model) definition for: Bmv BmvMarketData Product33 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 33
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P33_1_ENG.pdf
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

header big_picture_message_t {
    bit<8> origin;
    bit<32> trades;
    bit<64> volume;
    bit<64> traded_value;
    bit<32> market_share_amount;
    bit<32> market_share_trades;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
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

header spread_message_t {
    bit<8> origin;
    bit<32> spread_mxn;
    bit<32> spread_basis_points;
    bit<32> spread_average;
    bit<32> number_of_spreads;
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
    big_picture_message_t big_picture_message[MAX_MESSAGES];
    effective_spread_message_t effective_spread_message[MAX_MESSAGES];
    spread_quality_message_t spread_quality_message[MAX_MESSAGES];
    spread_message_t spread_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct33Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x27: parse_big_picture_message;
            8w0x3D: parse_effective_spread_message;
            8w0x7B: parse_spread_quality_message;
            8w0x3B: parse_spread_message;
            default: accept;
        }
    }

    state parse_big_picture_message {
        packet.extract(hdr.big_picture_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
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

    state parse_spread_message {
        packet.extract(hdr.spread_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct33VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct33Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct33Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct33ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct33Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.big_picture_message);
        packet.emit(hdr.effective_spread_message);
        packet.emit(hdr.spread_quality_message);
        packet.emit(hdr.spread_message);
    }
}

V1Switch(
    BmvmarketdataProduct33Parser(),
    BmvmarketdataProduct33VerifyChecksum(),
    BmvmarketdataProduct33Ingress(),
    BmvmarketdataProduct33Egress(),
    BmvmarketdataProduct33ComputeChecksum(),
    BmvmarketdataProduct33Deparser()
) main;
