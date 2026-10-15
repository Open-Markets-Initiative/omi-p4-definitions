// P4_16 (v1model) definition for: Gpw BondSpot OrderBook Xdp v6.8
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: BondSpot Order Book
//   Encoding: Exchange Data Publisher
//   Version: 6.8
//   Date: 02/11/2020
//   Specification: WSE_CDE_XDP_Message_Specifications_v_68.pdf
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
    bit<16> packet_length;
    bit<16> packet_type;
    bit<32> packet_sequence_number;
    bit<32> send_time;
    bit<16> service_id;
    bit<8> delivery_flag;
    bit<8> number_msg_entries;
}

header packet_header_message_t {
    bit<16> message_size;
    bit<16> message_type;
}

header order_update_market_sheet_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> price;
    bit<32> aggregated_volume;
    bit<32> volume;
    bit<32> link_id;
    bit<32> order_id;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> number_orders;
    bit<8> side;
    bit<8> order_type;
    bit<8> action_type;
    bit<8> price_scale_code;
    bit<32> order_date;
    bit<32> order_priority_date;
    bit<32> order_priority_time;
    bit<16> order_priority_micro_secs;
    bit<8> order_origin;
    bit<8> reserved_1;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    order_update_market_sheet_message_t order_update_market_sheet_message[MAX_MESSAGES];
}

parser BondspotOrderbookParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.number_msg_entries) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.message_type) {
            16w230: parse_order_update_market_sheet_message;
            default: accept;
        }
    }

    state parse_order_update_market_sheet_message {
        packet.extract(hdr.order_update_market_sheet_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BondspotOrderbookVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BondspotOrderbookIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BondspotOrderbookEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BondspotOrderbookComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BondspotOrderbookDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.order_update_market_sheet_message);
    }
}

V1Switch(
    BondspotOrderbookParser(),
    BondspotOrderbookVerifyChecksum(),
    BondspotOrderbookIngress(),
    BondspotOrderbookEgress(),
    BondspotOrderbookComputeChecksum(),
    BondspotOrderbookDeparser()
) main;
