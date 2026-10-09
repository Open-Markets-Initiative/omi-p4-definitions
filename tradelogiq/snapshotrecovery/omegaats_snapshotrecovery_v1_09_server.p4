// P4_16 (v1model) definition for: Tradelogiq SnapshotRecovery Itch v1.09
// 
// Protocol:
//   Organization: Tradelogiq Markets Inc.
//   Protocol: Omega Snapshot Recovery
//   Encoding: Itch
//   Version: 1.09
//   Date: 06/05/2025
//   Specification: Tradelogiq-SnapshotRecovery-Specifications-v1.09.pdf
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

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> message_type;
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

header stock_trading_action_message_t {
    bit<8> trading_state;
    bit<16> instrument_id;
    bit<64> timestamp;
    bit<32> reason;
}

header add_order_message_t {
    bit<8> buy_sell_indicator;
    bit<16> instrument_id;
    bit<64> timestamp;
    bit<32> order_reference_number;
    bit<32> shares;
    bit<32> price;
    bit<16> exec_broker_id;
    bit<16> reserved_2;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    stock_directory_message_t stock_directory_message;
    extended_stock_directory_message_t extended_stock_directory_message;
    stock_trading_action_message_t stock_trading_action_message;
    add_order_message_t add_order_message;
}

parser OmegaatsSnapshotrecoveryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x48: parse_server_heartbeat;
            8w0x53: parse_sequenced_data_packet;
            default: accept;
        }
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

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x72: parse_extended_stock_directory_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x41: parse_add_order_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_extended_stock_directory_message {
        packet.extract(hdr.extended_stock_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stock_trading_action_message {
        packet.extract(hdr.stock_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control OmegaatsSnapshotrecoveryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OmegaatsSnapshotrecoveryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control OmegaatsSnapshotrecoveryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OmegaatsSnapshotrecoveryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OmegaatsSnapshotrecoveryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.extended_stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.add_order_message);
    }
}

V1Switch(
    OmegaatsSnapshotrecoveryServerParser(),
    OmegaatsSnapshotrecoveryServerVerifyChecksum(),
    OmegaatsSnapshotrecoveryServerIngress(),
    OmegaatsSnapshotrecoveryServerEgress(),
    OmegaatsSnapshotrecoveryServerComputeChecksum(),
    OmegaatsSnapshotrecoveryServerDeparser()
) main;
