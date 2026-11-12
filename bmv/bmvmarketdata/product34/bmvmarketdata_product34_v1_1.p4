// P4_16 (v1model) definition for: Bmv BmvMarketData Product34 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 34
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P34_1_ENG.pdf
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

header benchmark_trade_message_t {
    bit<8> origin;
    bit<64> average_volume;
    bit<64> average_traded_value;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

header hour_tracker_message_t {
    bit<8> origin;
    bit<32> trades;
    bit<64> volume;
    bit<64> traded_value;
    bit<32> spread_mxn;
    bit<32> spread_basis_points;
    bit<64> average_volume;
    bit<64> average_traded_value;
    bit<8> market;
    bit<8> sector;
    bit<32> instrument_number;
    bit<16> indices;
}

header message_ratio_message_t {
    bit<8> origin;
    bit<32> messages;
    bit<32> messages_bid;
    bit<32> messages_ask;
    bit<32> messages_modified;
    bit<32> messages_canceled;
    bit<32> trades;
    bit<32> ratio;
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
    benchmark_trade_message_t benchmark_trade_message[MAX_MESSAGES];
    hour_tracker_message_t hour_tracker_message[MAX_MESSAGES];
    message_ratio_message_t message_ratio_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct34Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x3A: parse_benchmark_trade_message;
            8w0x2F: parse_hour_tracker_message;
            8w0x7D: parse_message_ratio_message;
            default: accept;
        }
    }

    state parse_big_picture_message {
        packet.extract(hdr.big_picture_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_benchmark_trade_message {
        packet.extract(hdr.benchmark_trade_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_hour_tracker_message {
        packet.extract(hdr.hour_tracker_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_message_ratio_message {
        packet.extract(hdr.message_ratio_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct34VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct34Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct34Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct34ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct34Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.big_picture_message);
        packet.emit(hdr.benchmark_trade_message);
        packet.emit(hdr.hour_tracker_message);
        packet.emit(hdr.message_ratio_message);
    }
}

V1Switch(
    BmvmarketdataProduct34Parser(),
    BmvmarketdataProduct34VerifyChecksum(),
    BmvmarketdataProduct34Ingress(),
    BmvmarketdataProduct34Egress(),
    BmvmarketdataProduct34ComputeChecksum(),
    BmvmarketdataProduct34Deparser()
) main;
