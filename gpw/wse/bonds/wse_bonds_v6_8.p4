// P4_16 (v1model) definition for: Gpw Wse Bonds Xdp v6.8
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: Warsaw Stock Exchange Bonds
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

header accrued_interest_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> system_id;
    bit<16> number_days;
    bit<16> source_time_micro_secs;
    bit<8> accrued_interest_scale_code;
    bit<24> reserved_3;
}

header accrued_interest_message_accrued_interest_group_t {
    bit<32> date;
    bit<32> accrued_interest;
}

header interest_for_settlement_day_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> system_id;
    bit<32> date;
    bit<64> settlement_date;
    bit<32> interest;
    bit<16> source_time_micro_secs;
    bit<24> currency;
    bit<8> interest_scale_code;
    bit<16> reserved_2;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> accrued_interest_message_accrued_interest_group_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    accrued_interest_message_t accrued_interest_message[MAX_MESSAGES];
    accrued_interest_message_accrued_interest_group_t accrued_interest_message_accrued_interest_group[MAX_MESSAGES];
    interest_for_settlement_day_message_t interest_for_settlement_day_message[MAX_MESSAGES];
}

parser WseBondsParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w601: parse_accrued_interest_message;
            16w602: parse_interest_for_settlement_day_message;
            default: accept;
        }
    }

    state parse_accrued_interest_message {
        packet.extract(hdr.accrued_interest_message.next);
        meta.dispatched = 1;
        meta.accrued_interest_message_accrued_interest_group_remaining = 16w31;
        transition parse_accrued_interest_message_accrued_interest_group;
    }

    state parse_accrued_interest_message_accrued_interest_group {
        packet.extract(hdr.accrued_interest_message_accrued_interest_group.next);
        meta.accrued_interest_message_accrued_interest_group_remaining = meta.accrued_interest_message_accrued_interest_group_remaining - 1;
        transition select(meta.accrued_interest_message_accrued_interest_group_remaining) {
            16w0: parse_packet_header_message;
            default: parse_accrued_interest_message_accrued_interest_group;
        }
    }

    state parse_interest_for_settlement_day_message {
        packet.extract(hdr.interest_for_settlement_day_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control WseBondsVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseBondsIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control WseBondsEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control WseBondsComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseBondsDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.accrued_interest_message);
        packet.emit(hdr.accrued_interest_message_accrued_interest_group);
        packet.emit(hdr.interest_for_settlement_day_message);
    }
}

V1Switch(
    WseBondsParser(),
    WseBondsVerifyChecksum(),
    WseBondsIngress(),
    WseBondsEgress(),
    WseBondsComputeChecksum(),
    WseBondsDeparser()
) main;
