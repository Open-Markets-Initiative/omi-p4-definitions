// P4_16 (v1model) definition for: Nasdaq PhlxOptions Orders Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: PHLX Orders
//   Encoding: Itch
//   Version: 2.1
//   Date: 02/13/2026
//   Specification: Options_Order_Feed_2.1.pdf
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

header udp_packet_header_t {
    bit<80> udp_session;
    bit<64> udp_sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header system_event_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<8> event_code;
}

header derivative_directory_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<104> underlying_symbol;
    bit<8> closing_type;
    bit<8> tradable;
    bit<8> mpv;
    bit<128> reserved_16;
}

header trading_action_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> current_trading_state;
}

header add_order_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<8> side;
    bit<32> original_order_volume;
    bit<32> executable_order_volume;
    bit<8> order_status;
    bit<8> order_type;
    bit<8> order_qualifier;
    bit<32> limit_price;
    bit<8> all_or_none;
    bit<8> time_in_force;
    bit<8> order_capacity;
    bit<8> open_close_indicator;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
}

header auction_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> auction_duration;
    bit<8> auction_event;
    bit<32> quantity;
    bit<8> side;
    bit<32> price;
    bit<32> imbalance_volume;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
    bit<128> reserved_16;
}

struct metadata_t {
}

struct headers_t {
    udp_packet_header_t udp_packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    derivative_directory_message_t derivative_directory_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    auction_message_t auction_message[MAX_MESSAGES];
}

parser PhlxoptionsOrdersMoldudp64Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.udp_packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x6d: parse_derivative_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x4f: parse_add_order_message;
            8w0x4a: parse_auction_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_derivative_directory_message {
        packet.extract(hdr.derivative_directory_message.next);
        transition parse_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        transition parse_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        transition parse_message;
    }

    state parse_auction_message {
        packet.extract(hdr.auction_message.next);
        transition parse_message;
    }

}

control PhlxoptionsOrdersMoldudp64VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsOrdersMoldudp64Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PhlxoptionsOrdersMoldudp64Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsOrdersMoldudp64ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsOrdersMoldudp64Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.udp_packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.derivative_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.auction_message);
    }
}

V1Switch(
    PhlxoptionsOrdersMoldudp64Parser(),
    PhlxoptionsOrdersMoldudp64VerifyChecksum(),
    PhlxoptionsOrdersMoldudp64Ingress(),
    PhlxoptionsOrdersMoldudp64Egress(),
    PhlxoptionsOrdersMoldudp64ComputeChecksum(),
    PhlxoptionsOrdersMoldudp64Deparser()
) main;
