// P4_16 (v1model) definition for: Iex IexEquities Tops IexTp v1.56
// 
// Protocol:
//   Organization: Investors Exchange
//   Protocol: Top Of Book
//   Encoding: Investors Exchange Transport Protocol
//   Version: 1.56
//   Date: 9/23/2016
//   Specification: IEX TOPS Specification.pdf
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

header iextp_header_t {
    bit<8> version;
    bit<8> reserved;
    bit<16> message_protocol_id;
    bit<32> channel_id;
    bit<32> session_id;
    bit<16> payload_length;
    bit<16> message_count;
    bit<64> stream_offset;
    bit<64> first_message_sequence_number;
    bit<64> send_time;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header quote_update_message_t {
    bit<1> symbol_availability;
    bit<1> market_session;
    bit<6> unused_6;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> bid_size;
    bit<64> bid_price;
    bit<64> ask_price;
    bit<32> ask_size;
}

header trade_report_message_t {
    bit<1> intermarket_sweep;
    bit<1> extended_hours;
    bit<1> odd_lot;
    bit<1> trade_through_exempt;
    bit<4> unused_4;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> size;
    bit<64> price;
    bit<64> trade_id;
    bit<32> reserved_4;
}

header trade_break_message_t {
    bit<1> intermarket_sweep;
    bit<1> extended_hours;
    bit<1> odd_lot;
    bit<1> trade_through_exempt;
    bit<4> unused_4;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> size;
    bit<64> price;
    bit<64> trade_id;
    bit<32> reserved_4;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    iextp_header_t iextp_header;
    message_t message[MAX_MESSAGES];
    quote_update_message_t quote_update_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    trade_break_message_t trade_break_message[MAX_MESSAGES];
}

parser IexequitiesTopsParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.iextp_header);
        transition select(hdr.iextp_header.message_count) {
            16w0x0: parse_heartbeat;
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
            8w0x51: parse_quote_update_message;
            8w0x54: parse_trade_report_message;
            8w0x42: parse_trade_break_message;
            default: accept;
        }
    }

    state parse_quote_update_message {
        packet.extract(hdr.quote_update_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_break_message {
        packet.extract(hdr.trade_break_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control IexequitiesTopsVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexequitiesTopsIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IexequitiesTopsEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IexequitiesTopsComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexequitiesTopsDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.iextp_header);
        packet.emit(hdr.message);
        packet.emit(hdr.quote_update_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_break_message);
    }
}

V1Switch(
    IexequitiesTopsParser(),
    IexequitiesTopsVerifyChecksum(),
    IexequitiesTopsIngress(),
    IexequitiesTopsEgress(),
    IexequitiesTopsComputeChecksum(),
    IexequitiesTopsDeparser()
) main;
