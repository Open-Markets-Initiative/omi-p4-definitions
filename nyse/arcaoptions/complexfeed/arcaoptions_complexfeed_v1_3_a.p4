// P4_16 (v1model) definition for: Nyse ArcaOptions ComplexFeed Xdp v1.3.a
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Complex Feed
//   Encoding: Exchange Data Publisher
//   Version: 1.3.a
//   Date: 02/28/2018
//   Specification: XDP_Options_Client_Specification_v1.3a.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<16> packet_size;
    bit<8> delivery_flag;
    bit<8> message_count;
    bit<32> sequence_number;
    bit<32> timestamp;
    bit<32> nanoseconds;
    bit<16> message_size;
    bit<16> message_type;
}

header complex_quote_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<32> ask_price;
    bit<32> bid_price;
    bit<16> ask_volume;
    bit<16> bid_volume;
    bit<16> ask_customer_volume;
    bit<16> bid_customer_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<16> reserved_2;
}

header complex_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume_4;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<16> reserved_2;
}

header complex_crossing_rfq_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<8> side;
    bit<8> reserved_1;
    bit<16> volume_2;
    bit<32> price;
}

header complex_cube_rfq_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<8> side;
    bit<8> reserved_1;
    bit<16> volume_2;
    bit<32> price;
}

header complex_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<8> security_status;
    bit<8> halt_condition;
    bit<16> reserved_2;
}

header refresh_complex_quote_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<32> ask_price;
    bit<32> bid_price;
    bit<16> ask_volume;
    bit<16> bid_volume;
    bit<16> ask_customer_volume;
    bit<16> bid_customer_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<16> reserved_2;
}

header refresh_complex_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> complex_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume_4;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<16> reserved_2;
}

header complex_symbol_definition_message_t {
    bit<32> complex_index;
    bit<168> complex_symbol;
    bit<8> channel_id;
    bit<16> market_id;
    bit<8> system_id;
    bit<8> reserved_1;
    bit<16> stream_id;
    bit<16> no_of_legs;
    bit<16> reserved_2;
    bit<32> symbol_index;
    bit<16> leg_ratio_qty;
    bit<8> side;
    bit<8> leg_security_type;
}

header stream_id_message_t {
    bit<16> stream_id;
    bit<16> reserved_2;
}

header sequence_number_reset_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<8> product_id;
    bit<8> channel_id;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    complex_quote_message_t complex_quote_message;
    complex_trade_message_t complex_trade_message;
    complex_crossing_rfq_message_t complex_crossing_rfq_message;
    complex_cube_rfq_message_t complex_cube_rfq_message;
    complex_status_message_t complex_status_message;
    refresh_complex_quote_message_t refresh_complex_quote_message;
    refresh_complex_trade_message_t refresh_complex_trade_message;
    complex_symbol_definition_message_t complex_symbol_definition_message;
    stream_id_message_t stream_id_message;
    sequence_number_reset_message_t sequence_number_reset_message;
}

parser ArcaoptionsComplexfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w423: parse_complex_quote_message;
            16w425: parse_complex_trade_message;
            16w429: parse_complex_crossing_rfq_message;
            16w472: parse_complex_cube_rfq_message;
            16w433: parse_complex_status_message;
            16w511: parse_refresh_complex_quote_message;
            16w513: parse_refresh_complex_trade_message;
            16w439: parse_complex_symbol_definition_message;
            16w455: parse_stream_id_message;
            16w1: parse_sequence_number_reset_message;
            default: accept;
        }
    }

    state parse_complex_quote_message {
        packet.extract(hdr.complex_quote_message);
        transition accept;
    }

    state parse_complex_trade_message {
        packet.extract(hdr.complex_trade_message);
        transition accept;
    }

    state parse_complex_crossing_rfq_message {
        packet.extract(hdr.complex_crossing_rfq_message);
        transition accept;
    }

    state parse_complex_cube_rfq_message {
        packet.extract(hdr.complex_cube_rfq_message);
        transition accept;
    }

    state parse_complex_status_message {
        packet.extract(hdr.complex_status_message);
        transition accept;
    }

    state parse_refresh_complex_quote_message {
        packet.extract(hdr.refresh_complex_quote_message);
        transition accept;
    }

    state parse_refresh_complex_trade_message {
        packet.extract(hdr.refresh_complex_trade_message);
        transition accept;
    }

    state parse_complex_symbol_definition_message {
        packet.extract(hdr.complex_symbol_definition_message);
        transition accept;
    }

    state parse_stream_id_message {
        packet.extract(hdr.stream_id_message);
        transition accept;
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message);
        transition accept;
    }

}

control ArcaoptionsComplexfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaoptionsComplexfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control ArcaoptionsComplexfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control ArcaoptionsComplexfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaoptionsComplexfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.complex_quote_message);
        packet.emit(hdr.complex_trade_message);
        packet.emit(hdr.complex_crossing_rfq_message);
        packet.emit(hdr.complex_cube_rfq_message);
        packet.emit(hdr.complex_status_message);
        packet.emit(hdr.refresh_complex_quote_message);
        packet.emit(hdr.refresh_complex_trade_message);
        packet.emit(hdr.complex_symbol_definition_message);
        packet.emit(hdr.stream_id_message);
        packet.emit(hdr.sequence_number_reset_message);
    }
}

V1Switch(
    ArcaoptionsComplexfeedParser(),
    ArcaoptionsComplexfeedVerifyChecksum(),
    ArcaoptionsComplexfeedIngress(),
    ArcaoptionsComplexfeedEgress(),
    ArcaoptionsComplexfeedComputeChecksum(),
    ArcaoptionsComplexfeedDeparser()
) main;
