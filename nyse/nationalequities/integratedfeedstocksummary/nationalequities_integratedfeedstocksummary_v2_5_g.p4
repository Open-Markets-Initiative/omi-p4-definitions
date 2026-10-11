// P4_16 (v1model) definition for: Nyse NationalEquities IntegratedFeedStockSummary Pillar v2.5.g
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Integrated Feed Stock Summary
//   Encoding: Pillar
//   Version: 2.5.g
//   Date: 10/23/2025
//   Specification: NYSE_Pillar_Integrated_Feed_Client_Specification.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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
    bit<16> pkt_size;
    bit<8> delivery_flag;
    bit<8> number_msgs;
    bit<32> seq_num;
    bit<32> seconds;
    bit<32> nanoseconds;
}

header message_t {
    bit<16> message_size;
    bit<16> message_type;
}

header sequence_number_reset_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<8> product_id;
    bit<8> channel_id;
}

header source_time_reference_message_t {
    bit<32> id;
    bit<32> symbol_seq_num;
    bit<32> source_time;
}

header symbol_index_mapping_message_t {
    bit<32> symbol_index;
    bit<88> symbol;
    bit<8> reserved_1;
    bit<16> market_id;
    bit<8> system_id;
    bit<8> exchange_code;
    bit<8> price_scale_code;
    bit<8> security_type;
    bit<16> lot_size;
    bit<32> prev_close_price;
    bit<32> prev_close_volume;
    bit<8> price_resolution;
    bit<8> round_lot;
    bit<16> mpv;
    bit<16> unit_of_trade;
    bit<16> reserved_2;
}

header symbol_clear_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> next_source_seq_num;
}

header security_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<8> security_status;
    bit<8> halt_condition;
    bit<32> reserved_4;
    bit<32> price_1;
    bit<32> price_2;
    bit<8> ssr_triggering_exchange_id;
    bit<32> ssr_triggering_volume;
    bit<32> time;
    bit<8> ssr_state;
    bit<8> market_state;
    bit<8> session_state;
}

header stock_summary_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> open;
    bit<32> close;
    bit<32> total_volume;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    sequence_number_reset_message_t sequence_number_reset_message[MAX_MESSAGES];
    source_time_reference_message_t source_time_reference_message[MAX_MESSAGES];
    symbol_index_mapping_message_t symbol_index_mapping_message[MAX_MESSAGES];
    symbol_clear_message_t symbol_clear_message[MAX_MESSAGES];
    security_status_message_t security_status_message[MAX_MESSAGES];
    stock_summary_message_t stock_summary_message[MAX_MESSAGES];
}

parser NationalequitiesIntegratedfeedstocksummaryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.delivery_flag) {
            8w1: parse_heartbeat;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            16w0x100: parse_sequence_number_reset_message;
            16w0x200: parse_source_time_reference_message;
            16w0x300: parse_symbol_index_mapping_message;
            16w0x2000: parse_symbol_clear_message;
            16w0x2200: parse_security_status_message;
            16w0xdf00: parse_stock_summary_message;
            default: accept;
        }
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_source_time_reference_message {
        packet.extract(hdr.source_time_reference_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_symbol_index_mapping_message {
        packet.extract(hdr.symbol_index_mapping_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_symbol_clear_message {
        packet.extract(hdr.symbol_clear_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_summary_message {
        packet.extract(hdr.stock_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NationalequitiesIntegratedfeedstocksummaryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NationalequitiesIntegratedfeedstocksummaryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NationalequitiesIntegratedfeedstocksummaryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NationalequitiesIntegratedfeedstocksummaryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NationalequitiesIntegratedfeedstocksummaryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.sequence_number_reset_message);
        packet.emit(hdr.source_time_reference_message);
        packet.emit(hdr.symbol_index_mapping_message);
        packet.emit(hdr.symbol_clear_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.stock_summary_message);
    }
}

V1Switch(
    NationalequitiesIntegratedfeedstocksummaryParser(),
    NationalequitiesIntegratedfeedstocksummaryVerifyChecksum(),
    NationalequitiesIntegratedfeedstocksummaryIngress(),
    NationalequitiesIntegratedfeedstocksummaryEgress(),
    NationalequitiesIntegratedfeedstocksummaryComputeChecksum(),
    NationalequitiesIntegratedfeedstocksummaryDeparser()
) main;
