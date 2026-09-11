// P4_16 (v1model) definition for: Biva BivaEquities OrderEntry Ouch v1.05
// 
// Protocol:
//   Organization: Bolsa Institucional de Valores
//   Protocol: Order Entry
//   Encoding: Ouch
//   Version: 1.05
//   Date: 1/1/2016
//   Specification: BIVA_External_OUCH_Specification_v1.05.pdf
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
    bit<8> event_code;
}

header accepted_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<8> account_type;
    bit<32> account_id;
    bit<8> order_verb;
    bit<64> quantity;
    bit<32> orderbook;
    bit<32> price;
    bit<32> time_in_force;
    bit<32> client_id;
    bit<64> order_reference_number;
    bit<64> minimum_quantity;
    bit<8> order_state;
}

header replaced_message_t {
    bit<64> timestamp;
    bit<32> replacement_order_token;
    bit<8> order_verb;
    bit<64> quantity;
    bit<32> orderbook;
    bit<32> price;
    bit<64> order_reference_number;
    bit<8> order_state;
    bit<32> previous_order_token;
}

header canceled_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<64> quantity;
    bit<8> canceled_reason;
}

header executed_order_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<64> executed_quantity;
    bit<32> executed_price;
    bit<8> liquidity_flag;
    bit<64> match_number;
    bit<32> counter_party_id;
}

header broken_trade_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<64> match_number;
    bit<8> broken_trade_reason;
}

header rejected_order_message_t {
    bit<64> timestamp;
    bit<32> order_token;
    bit<8> rejected_reason;
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
    accepted_message_t accepted_message;
    replaced_message_t replaced_message;
    canceled_message_t canceled_message;
    executed_order_message_t executed_order_message;
    broken_trade_message_t broken_trade_message;
    rejected_order_message_t rejected_order_message;
}

parser BivaequitiesOrderentryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x41: parse_accepted_message;
            8w0x55: parse_replaced_message;
            8w0x43: parse_canceled_message;
            8w0x45: parse_executed_order_message;
            8w0x42: parse_broken_trade_message;
            8w0x4a: parse_rejected_order_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_accepted_message {
        packet.extract(hdr.accepted_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replaced_message {
        packet.extract(hdr.replaced_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_canceled_message {
        packet.extract(hdr.canceled_message);
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

    state parse_rejected_order_message {
        packet.extract(hdr.rejected_order_message);
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

control BivaequitiesOrderentryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesOrderentryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BivaequitiesOrderentryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BivaequitiesOrderentryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesOrderentryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.accepted_message);
        packet.emit(hdr.replaced_message);
        packet.emit(hdr.canceled_message);
        packet.emit(hdr.executed_order_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.rejected_order_message);
    }
}

V1Switch(
    BivaequitiesOrderentryServerParser(),
    BivaequitiesOrderentryServerVerifyChecksum(),
    BivaequitiesOrderentryServerIngress(),
    BivaequitiesOrderentryServerEgress(),
    BivaequitiesOrderentryServerComputeChecksum(),
    BivaequitiesOrderentryServerDeparser()
) main;
