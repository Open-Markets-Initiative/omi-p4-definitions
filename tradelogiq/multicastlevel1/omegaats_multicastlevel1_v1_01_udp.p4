// P4_16 (v1model) definition for: Tradelogiq MulticastLevel1 Itch v1.01
// 
// Protocol:
//   Organization: Tradelogiq Markets Inc.
//   Protocol: Omega Multicast Level 1
//   Encoding: Itch
//   Version: 1.01
//   Date: 01/30/2022
//   Specification: TradelogiQ-Level-1-ITCH-5.0-Specification-v1.01.pdf
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

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header quote_message_t {
    bit<8> reserved_1;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<64> best_bid_price;
    bit<32> best_bid_size;
    bit<64> best_ask_price;
    bit<32> best_ask_size;
}

header trade_report_message_t {
    bit<40> conditions;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<32> trade_id;
    bit<64> trade_price;
    bit<32> trade_size;
    bit<16> buy_broker;
    bit<16> sell_broker;
}

header trade_bust_message_t {
    bit<8> reserved_1;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<32> trade_id;
}

header trade_correction_message_t {
    bit<8> reserved_1;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<32> original_trade_id;
    bit<64> original_trade_price;
    bit<32> original_trade_size;
    bit<64> corrected_trade_price;
    bit<32> corrected_trade_size;
}

header system_event_message_t {
    bit<8> event_code;
    bit<16> reserved_2;
    bit<64> timestamp;
}

header stock_directory_message_t {
    bit<8> market;
    bit<80> stock;
    bit<64> timestamp;
    bit<32> board_lot_size;
    bit<16> instrument_id;
    bit<8> shortable;
    bit<8> dividend_indicator;
    bit<72> reserved_9;
    bit<24> currency;
}

header extended_stock_directory_message_t {
    bit<8> market;
    bit<80> stock;
    bit<64> timestamp;
    bit<32> board_lot_size;
    bit<16> instrument_id;
    bit<8> shortable;
    bit<8> frequency;
    bit<72> reserved_9;
    bit<24> currency;
    bit<8> security_type;
    bit<64> expiry_date;
    bit<160> description;
    bit<24> reserved_3;
}

header stock_status_message_t {
    bit<8> trading_state;
    bit<80> stock;
    bit<64> timestamp;
    bit<32> reason;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    quote_message_t quote_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    trade_bust_message_t trade_bust_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    extended_stock_directory_message_t extended_stock_directory_message[MAX_MESSAGES];
    stock_status_message_t stock_status_message[MAX_MESSAGES];
}

parser OmegaatsMulticastlevel1UdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x57: parse_quote_message;
            8w0x54: parse_trade_report_message;
            8w0x4e: parse_trade_bust_message;
            8w0x4d: parse_trade_correction_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x72: parse_extended_stock_directory_message;
            8w0x48: parse_stock_status_message;
            default: accept;
        }
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_extended_stock_directory_message {
        packet.extract(hdr.extended_stock_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_status_message {
        packet.extract(hdr.stock_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control OmegaatsMulticastlevel1UdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OmegaatsMulticastlevel1UdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control OmegaatsMulticastlevel1UdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OmegaatsMulticastlevel1UdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OmegaatsMulticastlevel1UdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_bust_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.extended_stock_directory_message);
        packet.emit(hdr.stock_status_message);
    }
}

V1Switch(
    OmegaatsMulticastlevel1UdpParser(),
    OmegaatsMulticastlevel1UdpVerifyChecksum(),
    OmegaatsMulticastlevel1UdpIngress(),
    OmegaatsMulticastlevel1UdpEgress(),
    OmegaatsMulticastlevel1UdpComputeChecksum(),
    OmegaatsMulticastlevel1UdpDeparser()
) main;
