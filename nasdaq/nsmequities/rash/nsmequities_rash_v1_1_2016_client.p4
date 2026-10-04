// P4_16 (v1model) definition for: Nasdaq NsmEquities Rash AsciiRash v1.1.2016
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Rash
//   Encoding: Ascii Rash
//   Version: 1.1.2016
//   Date: 02/05/2016
//   Specification: rash_sb_v1.1_NextShares.pdf
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_t {
    bit<8> unsequenced_message_type;
}

header enter_order_message_t {
    bit<112> order_token_client_order_id;
    bit<8> side;
    bit<48> shares_order_qty;
    bit<64> stock_symbol;
    bit<80> price;
    bit<40> time_in_force;
    bit<32> firm_client_id;
    bit<8> display;
    bit<48> min_qty;
    bit<48> max_floor;
    bit<8> peg_type;
    bit<8> peg_difference_sign;
    bit<80> peg_difference;
    bit<80> discretion_price;
    bit<8> discretion_peg_type;
    bit<8> discretion_peg_difference_sign;
    bit<80> discretion_peg_difference;
    bit<8> capacity_rule_80_a_indicator;
    bit<48> random_reserve;
    bit<32> route_dest_exec_broker;
    bit<256> cust_terminal_id_sender_sub_id;
    bit<8> customer_type;
}

header enter_order_message_with_cross_functionality_t {
    bit<112> order_token_client_order_id;
    bit<8> side;
    bit<48> shares_order_qty;
    bit<64> stock_symbol;
    bit<80> price;
    bit<40> time_in_force;
    bit<32> firm_client_id;
    bit<8> display;
    bit<48> min_qty;
    bit<48> max_floor;
    bit<8> peg_type;
    bit<8> peg_difference_sign;
    bit<80> peg_difference;
    bit<80> discretion_price;
    bit<8> discretion_peg_type;
    bit<8> discretion_peg_difference_sign;
    bit<80> discretion_peg_difference;
    bit<8> capacity_rule_80_a_indicator;
    bit<48> random_reserve;
    bit<32> route_dest_exec_broker;
    bit<256> cust_terminal_id_sender_sub_id;
    bit<8> intermarket_sweep_eligibility;
    bit<8> cross_type;
    bit<8> customer_type;
}

header cancel_order_message_t {
    bit<112> order_token_client_order_id;
    bit<48> shares;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    enter_order_message_t enter_order_message;
    enter_order_message_with_cross_functionality_t enter_order_message_with_cross_functionality;
    cancel_order_message_t cancel_order_message;
}

parser NsmequitiesRashClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat;
            8w0x4f: parse_logout_request;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            8w0x4f: parse_enter_order_message;
            8w0x51: parse_enter_order_message_with_cross_functionality;
            8w0x58: parse_cancel_order_message;
            default: accept;
        }
    }

    state parse_enter_order_message {
        packet.extract(hdr.enter_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_enter_order_message_with_cross_functionality {
        packet.extract(hdr.enter_order_message_with_cross_functionality);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_message {
        packet.extract(hdr.cancel_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        meta.dispatched = 1;
        transition accept;
    }

}

control NsmequitiesRashClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesRashClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesRashClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesRashClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesRashClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order_message);
        packet.emit(hdr.enter_order_message_with_cross_functionality);
        packet.emit(hdr.cancel_order_message);
    }
}

V1Switch(
    NsmequitiesRashClientParser(),
    NsmequitiesRashClientVerifyChecksum(),
    NsmequitiesRashClientIngress(),
    NsmequitiesRashClientEgress(),
    NsmequitiesRashClientComputeChecksum(),
    NsmequitiesRashClientDeparser()
) main;
