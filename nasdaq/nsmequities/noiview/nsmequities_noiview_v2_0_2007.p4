// P4_16 (v1model) definition for: Nasdaq NsmEquities NoiView Itch v2.0.2007
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Net Order Imbalance View
//   Encoding: Itch
//   Version: 2.0.2007
//   Date: 06/27/2007
//   Specification: noiview-v2spec.pdf
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

header stock_directory_message_t {
    bit<48> stock;
    bit<8> market_category;
    bit<8> financial_status_indicator;
    bit<48> round_lot_size;
    bit<8> round_lots_only;
}

header stock_trading_action_message_t {
    bit<48> stock;
    bit<8> current_trading_state;
    bit<32> reason;
}

header noii_message_t {
    bit<72> paired_shares;
    bit<72> imbalance_shares;
    bit<8> imbalance_direction;
    bit<48> stock;
    bit<80> far_price;
    bit<80> near_price;
    bit<80> current_reference_price;
    bit<8> cross_type;
    bit<8> price_variation_indicator;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    stock_trading_action_message_t stock_trading_action_message[MAX_MESSAGES];
    noii_message_t noii_message[MAX_MESSAGES];
}

parser NsmequitiesNoiviewParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x52: parse_stock_directory_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x49: parse_noii_message;
            default: accept;
        }
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

    state parse_stock_trading_action_message {
        packet.extract(hdr.stock_trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_noii_message {
        packet.extract(hdr.noii_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NsmequitiesNoiviewVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNoiviewIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesNoiviewEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesNoiviewComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNoiviewDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.noii_message);
    }
}

V1Switch(
    NsmequitiesNoiviewParser(),
    NsmequitiesNoiviewVerifyChecksum(),
    NsmequitiesNoiviewIngress(),
    NsmequitiesNoiviewEgress(),
    NsmequitiesNoiviewComputeChecksum(),
    NsmequitiesNoiviewDeparser()
) main;
