// P4_16 (v1model) definition for: Nasdaq NsmEquities TotalView Itch v2.0.a
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: TotalView Itch
//   Encoding: Itch
//   Version: 2.0.a
//   Date: 02/15/2007
//   Specification: Nasdaq TotalView ITCH (2.0a).pdf
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
    bit<32> sequence;
    bit<16> count;
}

header message_t {
    bit<16> length;
    bit<64> timestamp;
    bit<8> message_type;
}

header system_event_message_t {
    bit<8> event_code;
}

header add_order_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<48> shares;
    bit<48> stock;
    bit<80> price;
    bit<8> display;
    bit<32> mmid;
}

header order_executed_message_t {
    bit<72> order_reference_number;
    bit<48> executed_shares;
    bit<72> match_number;
}

header order_cancel_message_t {
    bit<72> order_reference_number;
    bit<48> canceled_shares;
}

header trade_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<48> shares;
    bit<48> stock;
    bit<80> price;
    bit<72> match_number;
}

header broken_trade_message_t {
    bit<72> match_number;
}

header stock_halt_status_message_t {
    bit<48> stock;
    bit<8> stock_halted;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_cancel_message_t order_cancel_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    stock_halt_status_message_t stock_halt_status_message[MAX_MESSAGES];
}

parser NsmequitiesTotalviewUdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.count) {
            16w0x0: parse_heartbeat;
            16w0xffff: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x41: parse_add_order_message;
            8w0x45: parse_order_executed_message;
            8w0x58: parse_order_cancel_message;
            8w0x50: parse_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x48: parse_stock_halt_status_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_halt_status_message {
        packet.extract(hdr.stock_halt_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NsmequitiesTotalviewUdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewUdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesTotalviewUdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesTotalviewUdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewUdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.stock_halt_status_message);
    }
}

V1Switch(
    NsmequitiesTotalviewUdpParser(),
    NsmequitiesTotalviewUdpVerifyChecksum(),
    NsmequitiesTotalviewUdpIngress(),
    NsmequitiesTotalviewUdpEgress(),
    NsmequitiesTotalviewUdpComputeChecksum(),
    NsmequitiesTotalviewUdpDeparser()
) main;
