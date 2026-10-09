// P4_16 (v1model) definition for: 24X Memo Sbe v1.13
// 
// Protocol:
//   Organization: 24 National Exchange
//   Protocol: Members Orders
//   Encoding: Simple Binary Encoding
//   Version: 1.13
//   Date: 9/1/2025
//   Specification: memo-sbe-us-equities-v1.13a
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
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> order_capacity;
    bit<8> cust_order_capacity_optional;
    bit<13> reserved_13;
    bit<1> external_routing_not_allowed;
    bit<1> intermarket_sweep;
    bit<1> participate_do_not_initiate;
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
    bit<32> link_id_optional;
    bit<32> locate_broker_optional;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header new_order_single_message_parties_group_t {
    bit<128> party_id_new_order_single_party_id;
    bit<8> party_id_source;
    bit<8> party_role;
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
    bit<32> link_id_optional;
    bit<32> locate_broker_optional;
}

header order_cancel_request_message_t {
    bit<128> origclordid_optional;
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
    bit<1> dispatched;
    bit<8> new_order_single_message_parties_group_remaining;
}

struct headers_t {
    common_header_t common_header;
    login_request_message_t login_request_message;
    replay_request_message_t replay_request_message;
    replay_all_request_message_t replay_all_request_message;
    stream_request_message_t stream_request_message;
    unsequenced_message_t unsequenced_message;
    new_order_single_message_t new_order_single_message;
    new_order_single_message_parties_group_t new_order_single_message_parties_group[MAX_MESSAGES];
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    mass_cancel_request_message_t mass_cancel_request_message;
}

parser N24x24XequitiesMemoClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_all_request_message {
        packet.extract(hdr.replay_all_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stream_request_message {
        packet.extract(hdr.stream_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_message {
        packet.extract(hdr.unsequenced_message);
        meta.dispatched = 1;
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
        meta.dispatched = 1;
        meta.new_order_single_message_parties_group_remaining = hdr.new_order_single_message.num_in_group;
        transition select(meta.new_order_single_message_parties_group_remaining) {
            8w0: accept;
            default: parse_new_order_single_message_parties_group;
        }
    }

    state parse_new_order_single_message_parties_group {
        packet.extract(hdr.new_order_single_message_parties_group.next);
        meta.new_order_single_message_parties_group_remaining = meta.new_order_single_message_parties_group_remaining - 1;
        transition select(meta.new_order_single_message_parties_group_remaining) {
            8w0: accept;
            default: parse_new_order_single_message_parties_group;
        }
    }

    state parse_order_cancel_replace_request_message {
        packet.extract(hdr.order_cancel_replace_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_request_message {
        packet.extract(hdr.mass_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control N24x24XequitiesMemoClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control N24x24XequitiesMemoClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control N24x24XequitiesMemoClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control N24x24XequitiesMemoClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control N24x24XequitiesMemoClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.unsequenced_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.new_order_single_message_parties_group);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.mass_cancel_request_message);
    }
}

V1Switch(
    N24x24XequitiesMemoClientParser(),
    N24x24XequitiesMemoClientVerifyChecksum(),
    N24x24XequitiesMemoClientIngress(),
    N24x24XequitiesMemoClientEgress(),
    N24x24XequitiesMemoClientComputeChecksum(),
    N24x24XequitiesMemoClientDeparser()
) main;
