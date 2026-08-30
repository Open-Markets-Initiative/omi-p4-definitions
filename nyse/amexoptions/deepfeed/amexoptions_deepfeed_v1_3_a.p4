// P4_16 (v1model) definition for: Nyse AmexOptions DeepFeed Xdp v1.3.a
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Deep Feed
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

header outright_market_depth_buy_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> first_level_price;
    bit<32> second_level_price;
    bit<32> third_level_price;
    bit<16> first_level_volume;
    bit<16> second_level_volume;
    bit<16> third_level_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<16> first_level_customer_volume;
    bit<16> second_level_customer_volume;
    bit<16> third_level_customer_volume;
    bit<16> reserved_2;
}

header outright_market_depth_sell_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> first_level_price;
    bit<32> second_level_price;
    bit<32> third_level_price;
    bit<16> first_volume;
    bit<16> second_volume;
    bit<16> third_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<16> first_level_customer_volume;
    bit<16> second_level_customer_volume;
    bit<16> third_level_customer_volume;
    bit<16> reserved_2;
}

header underlying_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> underlying_index;
    bit<32> underlying_seq_num;
    bit<8> security_status;
    bit<8> halt_condition;
    bit<16> reserved_2;
}

header outright_series_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<8> security_status;
    bit<8> halt_condition;
    bit<16> reserved_2;
}

header refresh_outright_market_depth_buy_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> first_level_price;
    bit<32> second_level_price;
    bit<32> third_level_price;
    bit<16> first_volume;
    bit<16> second_volume;
    bit<16> third_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<16> first_level_customer_volume;
    bit<16> second_level_customer_volume;
    bit<16> third_level_customer_volume;
    bit<16> reserved_2;
}

header refresh_outright_market_depth_sell_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> first_level_price;
    bit<32> second_level_price;
    bit<32> third_level_price;
    bit<16> first_volume;
    bit<16> second_volume;
    bit<16> third_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<16> first_level_customer_volume;
    bit<16> second_level_customer_volume;
    bit<16> third_level_customer_volume;
    bit<16> reserved_2;
}

header underlying_index_mapping_message_t {
    bit<32> underlying_index;
    bit<88> underlying_symbol;
    bit<8> channel_id;
    bit<16> market_id;
    bit<8> system_id;
    bit<8> exchange_code;
    bit<8> price_scale_code;
    bit<8> security_type;
    bit<8> price_resolution;
    bit<8> reserved_1;
}

header series_index_mapping_message_t {
    bit<32> series_index;
    bit<8> channel_id;
    bit<8> reserved_a_1;
    bit<16> market_id;
    bit<8> system_id;
    bit<8> reserved_b_1;
    bit<16> stream_id;
    bit<32> underlying_index;
    bit<16> contract_multiplier;
    bit<48> maturity_date;
    bit<8> put_or_call;
    bit<80> strike_price;
    bit<8> price_scale_code;
    bit<88> underlying_symbol;
    bit<40> option_symbol_root;
    bit<32> group_id;
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
    outright_market_depth_buy_message_t outright_market_depth_buy_message;
    outright_market_depth_sell_message_t outright_market_depth_sell_message;
    underlying_status_message_t underlying_status_message;
    outright_series_status_message_t outright_series_status_message;
    refresh_outright_market_depth_buy_message_t refresh_outright_market_depth_buy_message;
    refresh_outright_market_depth_sell_message_t refresh_outright_market_depth_sell_message;
    underlying_index_mapping_message_t underlying_index_mapping_message;
    series_index_mapping_message_t series_index_mapping_message;
    stream_id_message_t stream_id_message;
    sequence_number_reset_message_t sequence_number_reset_message;
}

parser AmexoptionsDeepfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w403: parse_outright_market_depth_buy_message;
            16w405: parse_outright_market_depth_sell_message;
            16w419: parse_underlying_status_message;
            16w421: parse_outright_series_status_message;
            16w503: parse_refresh_outright_market_depth_buy_message;
            16w505: parse_refresh_outright_market_depth_sell_message;
            16w435: parse_underlying_index_mapping_message;
            16w437: parse_series_index_mapping_message;
            16w455: parse_stream_id_message;
            16w1: parse_sequence_number_reset_message;
            default: accept;
        }
    }

    state parse_outright_market_depth_buy_message {
        packet.extract(hdr.outright_market_depth_buy_message);
        transition accept;
    }

    state parse_outright_market_depth_sell_message {
        packet.extract(hdr.outright_market_depth_sell_message);
        transition accept;
    }

    state parse_underlying_status_message {
        packet.extract(hdr.underlying_status_message);
        transition accept;
    }

    state parse_outright_series_status_message {
        packet.extract(hdr.outright_series_status_message);
        transition accept;
    }

    state parse_refresh_outright_market_depth_buy_message {
        packet.extract(hdr.refresh_outright_market_depth_buy_message);
        transition accept;
    }

    state parse_refresh_outright_market_depth_sell_message {
        packet.extract(hdr.refresh_outright_market_depth_sell_message);
        transition accept;
    }

    state parse_underlying_index_mapping_message {
        packet.extract(hdr.underlying_index_mapping_message);
        transition accept;
    }

    state parse_series_index_mapping_message {
        packet.extract(hdr.series_index_mapping_message);
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

control AmexoptionsDeepfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexoptionsDeepfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AmexoptionsDeepfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AmexoptionsDeepfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexoptionsDeepfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.outright_market_depth_buy_message);
        packet.emit(hdr.outright_market_depth_sell_message);
        packet.emit(hdr.underlying_status_message);
        packet.emit(hdr.outright_series_status_message);
        packet.emit(hdr.refresh_outright_market_depth_buy_message);
        packet.emit(hdr.refresh_outright_market_depth_sell_message);
        packet.emit(hdr.underlying_index_mapping_message);
        packet.emit(hdr.series_index_mapping_message);
        packet.emit(hdr.stream_id_message);
        packet.emit(hdr.sequence_number_reset_message);
    }
}

V1Switch(
    AmexoptionsDeepfeedParser(),
    AmexoptionsDeepfeedVerifyChecksum(),
    AmexoptionsDeepfeedIngress(),
    AmexoptionsDeepfeedEgress(),
    AmexoptionsDeepfeedComputeChecksum(),
    AmexoptionsDeepfeedDeparser()
) main;
