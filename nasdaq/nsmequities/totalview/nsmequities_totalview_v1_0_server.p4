// P4_16 (v1model) definition for: Nasdaq NsmEquities TotalView Itch v1.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: TotalView Itch
//   Encoding: Itch
//   Version: 1.0
//   Date: 08/09/2006
//   Specification: Nasdaq TotalView ITCH (1.0).pdf
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
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<80> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<56> time_stamp;
    bit<8> message_type;
}

header system_event_message_t {
    bit<8> event_code;
}

header add_order_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<72> shares;
    bit<48> stock;
    bit<160> price;
    bit<8> display;
}

header order_executed_message_t {
    bit<72> order_reference_number;
    bit<72> executed_shares;
    bit<72> match_number;
    bit<32> contra_broker_code;
}

header order_cancel_message_t {
    bit<72> order_reference_number;
    bit<72> canceled_shares;
}

header trade_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<72> shares;
    bit<48> stock;
    bit<160> price;
    bit<72> match_number;
    bit<32> contra_broker_code;
}

header broken_trade_message_t {
    bit<72> match_number;
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
    add_order_message_t add_order_message;
    order_executed_message_t order_executed_message;
    order_cancel_message_t order_cancel_message;
    trade_message_t trade_message;
    broken_trade_message_t broken_trade_message;
}

parser NsmequitiesTotalviewServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
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
        transition select(hdr.sequenced_data_packet.message_type) {
            8w0x53: parse_system_event_message;
            8w0x41: parse_add_order_message;
            8w0x45: parse_order_executed_message;
            8w0x58: parse_order_cancel_message;
            8w0x50: parse_trade_message;
            8w0x42: parse_broken_trade_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsmequitiesTotalviewServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesTotalviewServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesTotalviewServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.broken_trade_message);
    }
}

V1Switch(
    NsmequitiesTotalviewServerParser(),
    NsmequitiesTotalviewServerVerifyChecksum(),
    NsmequitiesTotalviewServerIngress(),
    NsmequitiesTotalviewServerEgress(),
    NsmequitiesTotalviewServerComputeChecksum(),
    NsmequitiesTotalviewServerDeparser()
) main;
