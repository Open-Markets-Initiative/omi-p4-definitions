// P4_16 (v1model) definition for: Nasdaq NtxEquities Rash AsciiRash v1.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Rash
//   Encoding: Ascii Rash
//   Version: 1.1
//   Date: 06/01/2026
//   Specification: NQBXRASHsb.pdf
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

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<64> timestamp;
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<8> event_code;
}

header accepted_order_message_t {
    bit<112> order_token_client_order_id;
    bit<8> side;
    bit<48> shares_order_qty;
    bit<64> stock_symbol;
    bit<80> price;
    bit<40> time_in_force;
    bit<32> firm_client_id;
    bit<8> display;
    bit<72> order_reference_number;
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
}

header accepted_order_message_with_cross_functionality_t {
    bit<112> order_token_client_order_id;
    bit<8> side;
    bit<48> shares_order_qty;
    bit<64> stock_symbol;
    bit<80> price;
    bit<40> time_in_force;
    bit<32> firm_client_id;
    bit<8> display;
    bit<72> order_reference_number;
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
}

header canceled_order_message_t {
    bit<112> order_token_client_order_id;
    bit<48> shares;
    bit<8> cancel_reason;
}

header rejected_order_message_t {
    bit<112> order_token_client_order_id;
    bit<8> reject_reason;
}

header executed_order_message_t {
    bit<112> order_token_client_order_id;
    bit<48> shares;
    bit<80> price;
    bit<8> liquidity;
    bit<72> match_number;
}

header broken_trade_message_t {
    bit<112> order_token;
    bit<72> match_number;
    bit<8> broken_trade_reason;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    accepted_order_message_t accepted_order_message;
    accepted_order_message_with_cross_functionality_t accepted_order_message_with_cross_functionality;
    canceled_order_message_t canceled_order_message;
    rejected_order_message_t rejected_order_message;
    executed_order_message_t executed_order_message;
    broken_trade_message_t broken_trade_message;
}

parser NtxequitiesRashServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat;
            8w0x5a: parse_end_of_session;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x41: parse_accepted_order_message;
            8w0x52: parse_accepted_order_message_with_cross_functionality;
            8w0x43: parse_canceled_order_message;
            8w0x4a: parse_rejected_order_message;
            8w0x45: parse_executed_order_message;
            8w0x42: parse_broken_trade_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_accepted_order_message {
        packet.extract(hdr.accepted_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_accepted_order_message_with_cross_functionality {
        packet.extract(hdr.accepted_order_message_with_cross_functionality);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_canceled_order_message {
        packet.extract(hdr.canceled_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rejected_order_message {
        packet.extract(hdr.rejected_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_executed_order_message {
        packet.extract(hdr.executed_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

}

control NtxequitiesRashServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxequitiesRashServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NtxequitiesRashServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NtxequitiesRashServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxequitiesRashServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.accepted_order_message);
        packet.emit(hdr.accepted_order_message_with_cross_functionality);
        packet.emit(hdr.canceled_order_message);
        packet.emit(hdr.rejected_order_message);
        packet.emit(hdr.executed_order_message);
        packet.emit(hdr.broken_trade_message);
    }
}

V1Switch(
    NtxequitiesRashServerParser(),
    NtxequitiesRashServerVerifyChecksum(),
    NtxequitiesRashServerIngress(),
    NtxequitiesRashServerEgress(),
    NtxequitiesRashServerComputeChecksum(),
    NtxequitiesRashServerDeparser()
) main;
