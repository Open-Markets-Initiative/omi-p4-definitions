// P4_16 (v1model) definition for: Memx MemxEquities Memo Sbe v1.9
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Members Orders
//   Encoding: Simple Binary Encoding
//   Version: 1.9
//   Date: 5/25/22
//   Specification: MEMO SBE-v1_9.pdf
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

header common_header_t {
    bit<8> message_type;
    bit<16> message_length;
}

header login_request_message_t {
    bit<8> token_type;
    bit<8> token;
}

header replay_request_message_t {
    bit<64> session_id;
    bit<64> next_sequence_number;
    bit<32> count;
}

header replay_all_request_message_t {
    bit<64> session_id;
}

header stream_request_message_t {
    bit<64> session_id;
    bit<64> next_sequence_number;
}

header unsequenced_message_t {
    bit<16> block_length;
    bit<8> template_id;
    bit<8> schema_id;
    bit<16> version;
}

header new_order_single_message_t {
    bit<128> clordid;
    bit<32> mpid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> order_capacity;
    bit<8> cust_order_capacity;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<64> peg_offset_value;
    bit<8> peg_price_type;
    bit<64> expire_time;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<8> display_method;
    bit<8> reserve_replenish_timing;
    bit<32> display_min_incr;
    bit<8> locate_reqd;
    bit<8> reprice_frequency;
    bit<8> reprice_behavior;
    bit<16> cancel_group_id;
    bit<16> stp_group_id;
    bit<8> self_trade_prevention;
    bit<16> risk_group_id;
    bit<32> link_id;
}

header order_cancel_replace_request_message_t {
    bit<128> origclordid;
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<32> display_qty;
    bit<8> locate_reqd;
    bit<32> link_id;
}

header order_cancel_request_message_t {
    bit<128> origclordid;
    bit<64> order_id_optional;
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
}

header mass_cancel_request_message_t {
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side_optional;
    bit<64> lower_than_price;
    bit<64> higher_than_price;
    bit<16> cancel_group_id;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    login_request_message_t login_request_message;
    replay_request_message_t replay_request_message;
    replay_all_request_message_t replay_all_request_message;
    stream_request_message_t stream_request_message;
    unsequenced_message_t unsequenced_message;
    new_order_single_message_t new_order_single_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    mass_cancel_request_message_t mass_cancel_request_message;
}

parser MemxequitiesMemoClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w100: parse_login_request_message;
            8w101: parse_replay_request_message;
            8w102: parse_replay_all_request_message;
            8w103: parse_stream_request_message;
            8w104: parse_unsequenced_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        transition accept;
    }

    state parse_replay_all_request_message {
        packet.extract(hdr.replay_all_request_message);
        transition accept;
    }

    state parse_stream_request_message {
        packet.extract(hdr.stream_request_message);
        transition accept;
    }

    state parse_unsequenced_message {
        packet.extract(hdr.unsequenced_message);
        transition select(hdr.unsequenced_message.template_id) {
            8w1: parse_new_order_single_message;
            8w2: parse_order_cancel_replace_request_message;
            8w3: parse_order_cancel_request_message;
            8w4: parse_mass_cancel_request_message;
            default: accept;
        }
    }

    state parse_new_order_single_message {
        packet.extract(hdr.new_order_single_message);
        transition accept;
    }

    state parse_order_cancel_replace_request_message {
        packet.extract(hdr.order_cancel_replace_request_message);
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        transition accept;
    }

    state parse_mass_cancel_request_message {
        packet.extract(hdr.mass_cancel_request_message);
        transition accept;
    }

}

control MemxequitiesMemoClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesMemoClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxequitiesMemoClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxequitiesMemoClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesMemoClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.unsequenced_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.mass_cancel_request_message);
    }
}

V1Switch(
    MemxequitiesMemoClientParser(),
    MemxequitiesMemoClientVerifyChecksum(),
    MemxequitiesMemoClientIngress(),
    MemxequitiesMemoClientEgress(),
    MemxequitiesMemoClientComputeChecksum(),
    MemxequitiesMemoClientDeparser()
) main;
