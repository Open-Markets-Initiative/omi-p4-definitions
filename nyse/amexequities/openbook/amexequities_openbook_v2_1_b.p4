// P4_16 (v1model) definition for: Nyse AmexEquities OpenBook Ultra v2.1.b
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Open Book
//   Encoding: Openbook Ultra
//   Version: 2.1.b
//   Date: 03/9/2018
//   Specification: OpenBook_Ultra_Client_Spec_v2.1b.pdf
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
    bit<16> packet_size;
    bit<16> message_type;
    bit<32> sequence_number;
    bit<32> timestamp;
    bit<8> product_id;
    bit<8> retransmission_flag;
    bit<8> message_count;
    bit<8> link_flag;
}

header full_update_messages_t {
    bit<16> update_size;
    bit<32> symbol_index;
    bit<32> source_time;
    bit<16> source_time_micro_secs;
    bit<32> symbol_seq_num;
    bit<8> source_session_id;
    bit<88> symbol;
    bit<8> price_scale_code;
    bit<8> quote_condition;
    bit<8> trading_status;
    bit<8> reserved_1;
    bit<16> mpv;
    bit<32> price_numerator;
    bit<32> volume;
    bit<16> num_orders;
    bit<8> side;
    bit<8> reserved_1_2;
}

header delta_update_messages_t {
    bit<16> delta_size;
    bit<32> symbol_index;
    bit<32> source_time;
    bit<16> source_time_micro_secs;
    bit<32> source_seq_num;
    bit<8> source_session_id;
    bit<8> quote_condition;
    bit<8> trading_status;
    bit<8> price_scale_code;
    bit<32> price_numerator;
    bit<32> volume;
    bit<32> chg_qty;
    bit<16> num_orders;
    bit<8> side;
    bit<8> reason_code;
    bit<32> link_id_1;
    bit<32> link_id_2;
    bit<32> link_id_3;
}

header sequence_number_reset_message_t {
    bit<32> next_sequence_number;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    full_update_messages_t full_update_messages;
    delta_update_messages_t delta_update_messages;
    sequence_number_reset_message_t sequence_number_reset_message;
}

parser AmexequitiesOpenbookParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_type) {
            16w230: parse_full_update_messages;
            16w231: parse_delta_update_messages;
            16w1: parse_sequence_number_reset_message;
            default: accept;
        }
    }

    state parse_full_update_messages {
        packet.extract(hdr.full_update_messages);
        transition accept;
    }

    state parse_delta_update_messages {
        packet.extract(hdr.delta_update_messages);
        transition accept;
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message);
        transition accept;
    }

}

control AmexequitiesOpenbookVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexequitiesOpenbookIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AmexequitiesOpenbookEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AmexequitiesOpenbookComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexequitiesOpenbookDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.full_update_messages);
        packet.emit(hdr.delta_update_messages);
        packet.emit(hdr.sequence_number_reset_message);
    }
}

V1Switch(
    AmexequitiesOpenbookParser(),
    AmexequitiesOpenbookVerifyChecksum(),
    AmexequitiesOpenbookIngress(),
    AmexequitiesOpenbookEgress(),
    AmexequitiesOpenbookComputeChecksum(),
    AmexequitiesOpenbookDeparser()
) main;
