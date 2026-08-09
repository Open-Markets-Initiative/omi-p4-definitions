// P4_16 (v1model) definition for: Nasdaq IseOptions TradeFeed Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Trade Feed
//   Encoding: Itch
//   Version: 2.1
//   Date: 02/13/2026
//   Specification: Options_Trade_Feed_2.1.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
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

header trade_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> cross_id;
    bit<8> trade_condition;
    bit<32> price;
    bit<32> volume;
    bit<128> reserved_16;
}

header broken_trade_report_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> original_cross_id;
    bit<32> original_price;
    bit<32> original_volume;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    derivative_directory_message_t derivative_directory_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    broken_trade_report_message_t broken_trade_report_message[MAX_MESSAGES];
}

parser IseoptionsTradefeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x6d: parse_derivative_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x52: parse_trade_message;
            8w0x58: parse_broken_trade_report_message;
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

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        transition parse_message;
    }

    state parse_broken_trade_report_message {
        packet.extract(hdr.broken_trade_report_message.next);
        transition parse_message;
    }

}

control IseoptionsTradefeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsTradefeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IseoptionsTradefeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IseoptionsTradefeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsTradefeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.derivative_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.broken_trade_report_message);
    }
}

V1Switch(
    IseoptionsTradefeedParser(),
    IseoptionsTradefeedVerifyChecksum(),
    IseoptionsTradefeedIngress(),
    IseoptionsTradefeedEgress(),
    IseoptionsTradefeedComputeChecksum(),
    IseoptionsTradefeedDeparser()
) main;
