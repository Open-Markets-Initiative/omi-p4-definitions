// P4_16 (v1model) definition for: Nasdaq NtxEquities Orders Ouch v4.2
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: BX Orders
//   Encoding: Ouch
//   Version: 4.2
//   Date: 7/8/2019
//   Specification: NQBXOUCH42.pdf
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
    bit<112> order_token;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
    bit<32> time_in_force;
    bit<32> firm;
    bit<8> display;
    bit<64> order_reference_number;
    bit<8> capacity;
    bit<8> intermarket_sweep_eligibility;
    bit<32> minimum_quantity;
    bit<8> cross_type;
    bit<8> order_state;
    bit<8> bbo_weight_indicator;
}

header replaced_message_t {
    bit<64> timestamp;
    bit<112> replacement_order_token;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
    bit<32> time_in_force;
    bit<32> firm;
    bit<8> display;
    bit<64> order_reference_number;
    bit<8> capacity;
    bit<8> intermarket_sweep_eligibility;
    bit<32> minimum_quantity;
    bit<8> cross_type;
    bit<8> order_state;
    bit<112> previous_order_token;
    bit<8> bbo_weight_indicator;
}

header canceled_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<32> decrement_shares;
    bit<8> canceled_reason;
}

header aiq_canceled_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<32> decrement_shares;
    bit<8> aiq_canceled_reason;
    bit<32> quantity_prevented_from_trading;
    bit<32> execution_price;
    bit<8> liquidity_flag;
}

header executed_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<32> executed_shares;
    bit<32> execution_price;
    bit<8> liquidity_flag;
    bit<64> match_number;
}

header broken_trade_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<64> match_number;
    bit<8> broken_trade_reason;
}

header rejected_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<8> rejected_reason;
}

header cancel_pending_message_t {
    bit<64> timestamp;
    bit<112> order_token;
}

header cancel_reject_message_t {
    bit<64> timestamp;
    bit<112> order_token;
}

header order_priority_update_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<32> price;
    bit<8> display;
    bit<64> order_reference_number;
}

header order_modified_message_t {
    bit<64> timestamp;
    bit<112> order_token;
    bit<8> buy_sell_indicator;
    bit<32> shares;
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
    accepted_message_t accepted_message;
    replaced_message_t replaced_message;
    canceled_message_t canceled_message;
    aiq_canceled_message_t aiq_canceled_message;
    executed_message_t executed_message;
    broken_trade_message_t broken_trade_message;
    rejected_message_t rejected_message;
    cancel_pending_message_t cancel_pending_message;
    cancel_reject_message_t cancel_reject_message;
    order_priority_update_message_t order_priority_update_message;
    order_modified_message_t order_modified_message;
}

parser NtxequitiesOrdersServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x41: parse_accepted_message;
            8w0x55: parse_replaced_message;
            8w0x43: parse_canceled_message;
            8w0x44: parse_aiq_canceled_message;
            8w0x45: parse_executed_message;
            8w0x42: parse_broken_trade_message;
            8w0x4a: parse_rejected_message;
            8w0x50: parse_cancel_pending_message;
            8w0x49: parse_cancel_reject_message;
            8w0x54: parse_order_priority_update_message;
            8w0x4d: parse_order_modified_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_accepted_message {
        packet.extract(hdr.accepted_message);
        transition accept;
    }

    state parse_replaced_message {
        packet.extract(hdr.replaced_message);
        transition accept;
    }

    state parse_canceled_message {
        packet.extract(hdr.canceled_message);
        transition accept;
    }

    state parse_aiq_canceled_message {
        packet.extract(hdr.aiq_canceled_message);
        transition accept;
    }

    state parse_executed_message {
        packet.extract(hdr.executed_message);
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        transition accept;
    }

    state parse_rejected_message {
        packet.extract(hdr.rejected_message);
        transition accept;
    }

    state parse_cancel_pending_message {
        packet.extract(hdr.cancel_pending_message);
        transition accept;
    }

    state parse_cancel_reject_message {
        packet.extract(hdr.cancel_reject_message);
        transition accept;
    }

    state parse_order_priority_update_message {
        packet.extract(hdr.order_priority_update_message);
        transition accept;
    }

    state parse_order_modified_message {
        packet.extract(hdr.order_modified_message);
        transition accept;
    }

}

control NtxequitiesOrdersServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxequitiesOrdersServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NtxequitiesOrdersServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NtxequitiesOrdersServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxequitiesOrdersServerDeparser(packet_out packet, in headers_t hdr) {
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
        packet.emit(hdr.aiq_canceled_message);
        packet.emit(hdr.executed_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.rejected_message);
        packet.emit(hdr.cancel_pending_message);
        packet.emit(hdr.cancel_reject_message);
        packet.emit(hdr.order_priority_update_message);
        packet.emit(hdr.order_modified_message);
    }
}

V1Switch(
    NtxequitiesOrdersServerParser(),
    NtxequitiesOrdersServerVerifyChecksum(),
    NtxequitiesOrdersServerIngress(),
    NtxequitiesOrdersServerEgress(),
    NtxequitiesOrdersServerComputeChecksum(),
    NtxequitiesOrdersServerDeparser()
) main;
