// P4_16 (v1model) definition for: Binance BinanceSpot MarketData Sbe v1.0
// 
// Protocol:
//   Organization: Binance
//   Protocol: Market Data
//   Encoding: Simple Binary Encoding
//   Version: 1.0
//   Date: 2026-09-18
//   Specification: Unknown
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
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header trades_stream_event_message_t {
    bit<64> event_time;
    bit<64> transact_time;
    bit<8> price_exponent;
    bit<8> qty_exponent;
    bit<16> block_length;
    bit<32> num_in_group_uint_32;
}

header trades_stream_event_message_trades_stream_event_message_trades_group_t {
    bit<64> id;
    bit<64> price;
    bit<64> qty;
    bit<8> is_buyer_maker;
}

header best_bid_ask_stream_event_message_t {
    bit<64> event_time;
    bit<64> book_update_id;
    bit<8> price_exponent;
    bit<8> qty_exponent;
    bit<64> bid_price;
    bit<64> bid_qty;
    bit<64> ask_price;
    bit<64> ask_qty;
    bit<8> symbol_length;
}

header depth_snapshot_stream_event_message_t {
    bit<64> event_time;
    bit<64> book_update_id;
    bit<8> price_exponent;
    bit<8> qty_exponent;
    bit<16> block_length;
    bit<16> num_in_group_uint_16;
}

header depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_t {
    bit<64> price;
    bit<64> qty;
}

header depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group_uint_16;
}

header depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_t {
    bit<64> price;
    bit<64> qty;
}

header depth_diff_stream_event_message_t {
    bit<64> event_time;
    bit<64> first_book_update_id;
    bit<64> last_book_update_id;
    bit<8> price_exponent;
    bit<8> qty_exponent;
    bit<16> block_length;
    bit<16> num_in_group_uint_16;
}

header depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_t {
    bit<64> price;
    bit<64> qty;
}

header depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group_uint_16;
}

header depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_t {
    bit<64> price;
    bit<64> qty;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> trades_stream_event_message_trades_stream_event_message_trades_group_remaining;
    bit<16> depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_remaining;
    bit<16> depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_remaining;
    bit<16> depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_remaining;
    bit<16> depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    trades_stream_event_message_t trades_stream_event_message;
    trades_stream_event_message_trades_stream_event_message_trades_group_t trades_stream_event_message_trades_stream_event_message_trades_group[MAX_MESSAGES];
    best_bid_ask_stream_event_message_t best_bid_ask_stream_event_message;
    depth_snapshot_stream_event_message_t depth_snapshot_stream_event_message;
    depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_t depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group[MAX_MESSAGES];
    depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_header_t depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_header;
    depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_t depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group[MAX_MESSAGES];
    depth_diff_stream_event_message_t depth_diff_stream_event_message;
    depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_t depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group[MAX_MESSAGES];
    depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_header_t depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_header;
    depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_t depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group[MAX_MESSAGES];
}

parser BinancespotMarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x1027: parse_trades_stream_event_message;
            16w0x1127: parse_best_bid_ask_stream_event_message;
            16w0x1227: parse_depth_snapshot_stream_event_message;
            16w0x1327: parse_depth_diff_stream_event_message;
            default: accept;
        }
    }

    state parse_trades_stream_event_message {
        packet.extract(hdr.trades_stream_event_message);
        meta.dispatched = 1;
        meta.trades_stream_event_message_trades_stream_event_message_trades_group_remaining = hdr.trades_stream_event_message.num_in_group_uint_32;
        transition select(meta.trades_stream_event_message_trades_stream_event_message_trades_group_remaining) {
            32w0: accept;
            default: parse_trades_stream_event_message_trades_stream_event_message_trades_group;
        }
    }

    state parse_trades_stream_event_message_trades_stream_event_message_trades_group {
        packet.extract(hdr.trades_stream_event_message_trades_stream_event_message_trades_group.next);
        meta.trades_stream_event_message_trades_stream_event_message_trades_group_remaining = meta.trades_stream_event_message_trades_stream_event_message_trades_group_remaining - 1;
        transition select(meta.trades_stream_event_message_trades_stream_event_message_trades_group_remaining) {
            32w0: accept;
            default: parse_trades_stream_event_message_trades_stream_event_message_trades_group;
        }
    }

    state parse_best_bid_ask_stream_event_message {
        packet.extract(hdr.best_bid_ask_stream_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_depth_snapshot_stream_event_message {
        packet.extract(hdr.depth_snapshot_stream_event_message);
        meta.dispatched = 1;
        meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_remaining = hdr.depth_snapshot_stream_event_message.num_in_group_uint_16;
        transition select(meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_remaining) {
            16w0: read_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group;
            default: parse_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group;
        }
    }

    state parse_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group {
        packet.extract(hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group.next);
        meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_remaining = meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_remaining - 1;
        transition select(meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group_remaining) {
            16w0: read_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group;
            default: parse_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group;
        }
    }

    state read_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group {
        packet.extract(hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_header);
        meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_remaining = hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_header.num_in_group_uint_16;
        transition select(meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_remaining) {
            16w0: accept;
            default: parse_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group;
        }
    }

    state parse_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group {
        packet.extract(hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group.next);
        meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_remaining = meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_remaining - 1;
        transition select(meta.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_remaining) {
            16w0: accept;
            default: parse_depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group;
        }
    }

    state parse_depth_diff_stream_event_message {
        packet.extract(hdr.depth_diff_stream_event_message);
        meta.dispatched = 1;
        meta.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_remaining = hdr.depth_diff_stream_event_message.num_in_group_uint_16;
        transition select(meta.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_remaining) {
            16w0: read_depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group;
            default: parse_depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group;
        }
    }

    state parse_depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group {
        packet.extract(hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group.next);
        meta.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_remaining = meta.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_remaining - 1;
        transition select(meta.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group_remaining) {
            16w0: read_depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group;
            default: parse_depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group;
        }
    }

    state read_depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group {
        packet.extract(hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_header);
        meta.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_remaining = hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_header.num_in_group_uint_16;
        transition select(meta.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_remaining) {
            16w0: accept;
            default: parse_depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group;
        }
    }

    state parse_depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group {
        packet.extract(hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group.next);
        meta.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_remaining = meta.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_remaining - 1;
        transition select(meta.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_remaining) {
            16w0: accept;
            default: parse_depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group;
        }
    }

}

control BinancespotMarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BinancespotMarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BinancespotMarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BinancespotMarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BinancespotMarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.trades_stream_event_message);
        packet.emit(hdr.trades_stream_event_message_trades_stream_event_message_trades_group);
        packet.emit(hdr.best_bid_ask_stream_event_message);
        packet.emit(hdr.depth_snapshot_stream_event_message);
        packet.emit(hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_bids_group);
        packet.emit(hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group_header);
        packet.emit(hdr.depth_snapshot_stream_event_message_depth_snapshot_stream_event_message_asks_group);
        packet.emit(hdr.depth_diff_stream_event_message);
        packet.emit(hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_bids_group);
        packet.emit(hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group_header);
        packet.emit(hdr.depth_diff_stream_event_message_depth_diff_stream_event_message_asks_group);
    }
}

V1Switch(
    BinancespotMarketdataParser(),
    BinancespotMarketdataVerifyChecksum(),
    BinancespotMarketdataIngress(),
    BinancespotMarketdataEgress(),
    BinancespotMarketdataComputeChecksum(),
    BinancespotMarketdataDeparser()
) main;
