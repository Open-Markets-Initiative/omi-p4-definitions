// P4_16 (v1model) definition for: Nasdaq NsmEquities Nois Itch v2.2
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Net Order Imbalance Snapshot
//   Encoding: Itch
//   Version: 2.2
//   Date: 6/23/2025
//   Specification: NOIS_v2.2.pdf
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
    bit<32> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<64> timestamp;
    bit<8> message_type;
}

header system_event_message_t {
    bit<8> event_code;
}

header stock_directory_t {
    bit<64> symbol;
    bit<8> market_category;
    bit<8> rfu;
    bit<48> round_lot_size;
    bit<8> round_lots_only;
    bit<8> issue_classification;
    bit<16> issue_sub_type;
}

header stock_trading_action_t {
    bit<64> symbol;
    bit<8> trading_state;
    bit<8> reason;
}

header nois_message_t {
    bit<72> imbalance_shares;
    bit<8> imbalance_direction;
    bit<64> symbol;
    bit<80> near_price;
    bit<80> current_reference_price;
    bit<8> cross_type;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_t stock_directory[MAX_MESSAGES];
    stock_trading_action_t stock_trading_action[MAX_MESSAGES];
    nois_message_t nois_message[MAX_MESSAGES];
}

parser NsmequitiesNoisParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory;
            8w0x48: parse_stock_trading_action;
            8w0x49: parse_nois_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_stock_directory {
        packet.extract(hdr.stock_directory.next);
        transition parse_message;
    }

    state parse_stock_trading_action {
        packet.extract(hdr.stock_trading_action.next);
        transition parse_message;
    }

    state parse_nois_message {
        packet.extract(hdr.nois_message.next);
        transition parse_message;
    }

}

control NsmequitiesNoisVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNoisIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesNoisEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesNoisComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNoisDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory);
        packet.emit(hdr.stock_trading_action);
        packet.emit(hdr.nois_message);
    }
}

V1Switch(
    NsmequitiesNoisParser(),
    NsmequitiesNoisVerifyChecksum(),
    NsmequitiesNoisIngress(),
    NsmequitiesNoisEgress(),
    NsmequitiesNoisComputeChecksum(),
    NsmequitiesNoisDeparser()
) main;
