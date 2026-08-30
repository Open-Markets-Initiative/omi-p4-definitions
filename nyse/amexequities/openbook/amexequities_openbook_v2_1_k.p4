// P4_16 (v1model) definition for: Nyse AmexEquities OpenBook Ultra v2.1.k
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Open Book
//   Encoding: Openbook Ultra
//   Version: 2.1.k
//   Date: 02/22/2024
//   Specification: OpenBook_Ultra_Client_Specification.pdf
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

header sequence_number_reset_message_t {
    bit<32> next_seq_number;
}

header unavailable_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
}

header request_response_message_t {
    bit<32> source_seq_num;
    bit<160> source_id;
    bit<8> status;
    bit<8> reject_reason;
    bit<16> filler_2;
}

header retransmission_request_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
    bit<160> source_id;
}

header book_refresh_request_message_t {
    bit<128> symbol_16;
    bit<160> source_id;
}

header heartbeat_response_message_t {
    bit<160> source_id;
}

header extended_book_refresh_request_message_t {
    bit<160> source_id;
    bit<32> symbol_index;
    bit<16> msg_type;
}

header symbol_index_mapping_request_message_t {
    bit<160> source_id;
    bit<32> symbol_index;
}

header symbol_index_mapping_response_message_t {
    bit<88> symbol_11;
    bit<8> filler_1;
    bit<32> symbol_index;
}

header full_update_message_t {
    bit<16> update_size;
    bit<32> symbol_index;
    bit<32> source_time;
    bit<16> source_time_micro_secs;
    bit<32> symbol_seq_num;
    bit<8> source_session_id;
    bit<88> symbol_11;
    bit<8> price_scale_code;
    bit<8> quote_condition;
    bit<8> trading_status;
    bit<8> filler_1;
    bit<16> mpv;
    bit<32> price_numerator;
    bit<32> volume;
    bit<16> num_orders;
    bit<8> side;
    bit<8> filler_1_2;
}

header delta_update_message_t {
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

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    sequence_number_reset_message_t sequence_number_reset_message;
    unavailable_message_t unavailable_message;
    request_response_message_t request_response_message;
    retransmission_request_message_t retransmission_request_message;
    book_refresh_request_message_t book_refresh_request_message;
    heartbeat_response_message_t heartbeat_response_message;
    extended_book_refresh_request_message_t extended_book_refresh_request_message;
    symbol_index_mapping_request_message_t symbol_index_mapping_request_message;
    symbol_index_mapping_response_message_t symbol_index_mapping_response_message;
    full_update_message_t full_update_message;
    delta_update_message_t delta_update_message;
}

parser AmexequitiesOpenbookParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_type) {
            16w1: parse_sequence_number_reset_message;
            16w5: parse_unavailable_message;
            16w10: parse_request_response_message;
            16w20: parse_retransmission_request_message;
            16w22: parse_book_refresh_request_message;
            16w24: parse_heartbeat_response_message;
            16w27: parse_extended_book_refresh_request_message;
            16w34: parse_symbol_index_mapping_request_message;
            16w35: parse_symbol_index_mapping_response_message;
            16w230: parse_full_update_message;
            16w231: parse_delta_update_message;
            default: accept;
        }
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message);
        transition accept;
    }

    state parse_unavailable_message {
        packet.extract(hdr.unavailable_message);
        transition accept;
    }

    state parse_request_response_message {
        packet.extract(hdr.request_response_message);
        transition accept;
    }

    state parse_retransmission_request_message {
        packet.extract(hdr.retransmission_request_message);
        transition accept;
    }

    state parse_book_refresh_request_message {
        packet.extract(hdr.book_refresh_request_message);
        transition accept;
    }

    state parse_heartbeat_response_message {
        packet.extract(hdr.heartbeat_response_message);
        transition accept;
    }

    state parse_extended_book_refresh_request_message {
        packet.extract(hdr.extended_book_refresh_request_message);
        transition accept;
    }

    state parse_symbol_index_mapping_request_message {
        packet.extract(hdr.symbol_index_mapping_request_message);
        transition accept;
    }

    state parse_symbol_index_mapping_response_message {
        packet.extract(hdr.symbol_index_mapping_response_message);
        transition accept;
    }

    state parse_full_update_message {
        packet.extract(hdr.full_update_message);
        transition accept;
    }

    state parse_delta_update_message {
        packet.extract(hdr.delta_update_message);
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
        packet.emit(hdr.sequence_number_reset_message);
        packet.emit(hdr.unavailable_message);
        packet.emit(hdr.request_response_message);
        packet.emit(hdr.retransmission_request_message);
        packet.emit(hdr.book_refresh_request_message);
        packet.emit(hdr.heartbeat_response_message);
        packet.emit(hdr.extended_book_refresh_request_message);
        packet.emit(hdr.symbol_index_mapping_request_message);
        packet.emit(hdr.symbol_index_mapping_response_message);
        packet.emit(hdr.full_update_message);
        packet.emit(hdr.delta_update_message);
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
