// P4_16 (v1model) definition for: Jnx JnxEquities Pts Ouch v2.01
// 
// Protocol:
//   Organization: Japannext Securities
//   Protocol: 
//   Encoding: Ouch
//   Version: 2.01
//   Date: 1/16/2026
//   Specification: JNX_OUCH_Trading_Specification_Equities_2.01.pdf
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
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<160> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<64> timestamp;
    bit<8> system_event;
}

header order_accepted_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<80> client_reference;
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> orderbook_id;
    bit<32> group;
    bit<32> price;
    bit<32> time_in_force;
    bit<32> firm_id;
    bit<8> display;
    bit<8> capacity;
    bit<64> order_number;
    bit<32> minimum_quantity;
    bit<8> order_state;
    bit<8> order_classification;
    bit<8> cash_margin_type;
}

header order_replaced_message_t {
    bit<64> timestamp;
    bit<32> replacement_order_token;
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> orderbook_id;
    bit<32> group;
    bit<32> price;
    bit<32> time_in_force;
    bit<8> display;
    bit<64> order_number;
    bit<32> minimum_quantity;
    bit<8> order_state;
    bit<32> previous_order_token;
}

header order_canceled_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<32> decrement_quantity;
    bit<8> order_canceled_reason;
}

header order_aiq_canceled_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<32> decrement_quantity;
    bit<8> order_canceled_reason;
    bit<32> quantity_prevented_from_trading;
    bit<32> execution_price;
    bit<8> liquidity_indicator;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<32> executed_quantity;
    bit<32> execution_price;
    bit<8> liquidity_indicator;
    bit<64> match_number;
}

header order_rejected_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<8> order_rejected_reason;
}

struct metadata_t {
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    order_accepted_message_t order_accepted_message;
    order_replaced_message_t order_replaced_message;
    order_canceled_message_t order_canceled_message;
    order_aiq_canceled_message_t order_aiq_canceled_message;
    order_executed_message_t order_executed_message;
    order_rejected_message_t order_rejected_message;
}

parser JnxequitiesPtsServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x41: parse_order_accepted_message;
            8w0x55: parse_order_replaced_message;
            8w0x43: parse_order_canceled_message;
            8w0x44: parse_order_aiq_canceled_message;
            8w0x45: parse_order_executed_message;
            8w0x4a: parse_order_rejected_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_order_accepted_message {
        packet.extract(hdr.order_accepted_message);
        transition accept;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        transition accept;
    }

    state parse_order_canceled_message {
        packet.extract(hdr.order_canceled_message);
        transition accept;
    }

    state parse_order_aiq_canceled_message {
        packet.extract(hdr.order_aiq_canceled_message);
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        transition accept;
    }

    state parse_order_rejected_message {
        packet.extract(hdr.order_rejected_message);
        transition accept;
    }

}

control JnxequitiesPtsServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JnxequitiesPtsServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control JnxequitiesPtsServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control JnxequitiesPtsServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JnxequitiesPtsServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_accepted_message);
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.order_canceled_message);
        packet.emit(hdr.order_aiq_canceled_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_rejected_message);
    }
}

V1Switch(
    JnxequitiesPtsServerParser(),
    JnxequitiesPtsServerVerifyChecksum(),
    JnxequitiesPtsServerIngress(),
    JnxequitiesPtsServerEgress(),
    JnxequitiesPtsServerComputeChecksum(),
    JnxequitiesPtsServerDeparser()
) main;
