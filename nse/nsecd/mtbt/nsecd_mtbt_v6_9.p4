// P4_16 (v1model) definition for: Nse NseCd Mtbt Binary v6.9
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Multicast Tick By Tick
//   Encoding: Binary
//   Version: 6.9
//   Date: 4/1/2026
//   Specification: MTBT_CUR_NNF_PROTOCOL_6_9_20260717161109.pdf
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

header stream_header_t {
    bit<16> message_length;
    bit<16> stream_id;
    bit<32> sequence_number;
    bit<8> message_type;
}

header new_order_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header order_modification_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header order_cancellation_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header trade_message_t {
    bit<64> timestamp;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<32> token;
    bit<32> trade_price;
    bit<32> trade_quantity;
}

header new_spread_order_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header spread_order_modification_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header spread_order_cancellation_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header spread_trade_message_t {
    bit<64> timestamp;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<32> token;
    bit<32> trade_price;
    bit<32> quantity;
}

header trade_cancel_message_t {
    bit<64> timestamp;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<32> token;
    bit<32> trade_price;
    bit<32> trade_quantity;
}

header heartbeat_message_t {
    bit<32> last_sequence_no;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    stream_header_t stream_header;
    new_order_message_t new_order_message;
    order_modification_message_t order_modification_message;
    order_cancellation_message_t order_cancellation_message;
    trade_message_t trade_message;
    new_spread_order_message_t new_spread_order_message;
    spread_order_modification_message_t spread_order_modification_message;
    spread_order_cancellation_message_t spread_order_cancellation_message;
    spread_trade_message_t spread_trade_message;
    trade_cancel_message_t trade_cancel_message;
    heartbeat_message_t heartbeat_message;
}

parser NsecdMtbtParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.stream_header);
        transition select(hdr.stream_header.message_type) {
            8w0x4e: parse_new_order_message;
            8w0x4d: parse_order_modification_message;
            8w0x58: parse_order_cancellation_message;
            8w0x54: parse_trade_message;
            8w0x47: parse_new_spread_order_message;
            8w0x48: parse_spread_order_modification_message;
            8w0x4a: parse_spread_order_cancellation_message;
            8w0x4b: parse_spread_trade_message;
            8w0x43: parse_trade_cancel_message;
            8w0x5a: parse_heartbeat_message;
            default: accept;
        }
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_message {
        packet.extract(hdr.order_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_message {
        packet.extract(hdr.order_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_spread_order_message {
        packet.extract(hdr.new_spread_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_order_modification_message {
        packet.extract(hdr.spread_order_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_order_cancellation_message {
        packet.extract(hdr.spread_order_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_trade_message {
        packet.extract(hdr.spread_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancel_message {
        packet.extract(hdr.trade_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecdMtbtVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecdMtbtIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecdMtbtEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecdMtbtComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecdMtbtDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.stream_header);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.order_modification_message);
        packet.emit(hdr.order_cancellation_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.new_spread_order_message);
        packet.emit(hdr.spread_order_modification_message);
        packet.emit(hdr.spread_order_cancellation_message);
        packet.emit(hdr.spread_trade_message);
        packet.emit(hdr.trade_cancel_message);
        packet.emit(hdr.heartbeat_message);
    }
}

V1Switch(
    NsecdMtbtParser(),
    NsecdMtbtVerifyChecksum(),
    NsecdMtbtIngress(),
    NsecdMtbtEgress(),
    NsecdMtbtComputeChecksum(),
    NsecdMtbtDeparser()
) main;
