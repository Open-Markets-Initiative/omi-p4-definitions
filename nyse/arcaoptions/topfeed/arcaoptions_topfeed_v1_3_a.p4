// P4_16 (v1model) definition for: Nyse ArcaOptions TopFeed Xdp v1.3.a
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Top Feed
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

header outright_quote_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
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

header outright_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume_4;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<16> reserved_2;
}

header outright_trade_cancel_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> original_trade_id;
}

header outright_trade_correction_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> original_trade_id;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume_4;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<16> reserved_2;
}

header outright_imbalance_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> reference_price;
    bit<16> paired_qty;
    bit<16> total_imbalance_qty;
    bit<16> market_imbalance_qty;
    bit<8> auction_type;
    bit<8> imbalance_side;
    bit<8> market_imbalance_side;
    bit<24> reserved_3;
}

header outright_crossing_rfq_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<8> side;
    bit<8> reserved_1;
    bit<16> volume_2;
    bit<32> price;
}

header outright_bold_rfq_message_t {
    bit<32> source_time;
    bit<32> source_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<8> side;
    bit<8> capacity;
    bit<16> contracts;
    bit<32> price;
    bit<32> participant;
}

header outright_summary_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> open;
    bit<32> close;
    bit<32> total_volume;
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

header refresh_outright_quote_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
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

header refresh_outright_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume_4;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<16> reserved_2;
}

header refresh_outright_imbalance_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> symbol_seq_num;
    bit<32> reference_price;
    bit<16> paired_qty;
    bit<16> total_imbalance_qty;
    bit<16> market_imbalance_qty;
    bit<8> auction_type;
    bit<8> imbalance_side;
    bit<8> market_imbalance_side;
    bit<24> reserved_3;
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
    outright_quote_message_t outright_quote_message;
    outright_trade_message_t outright_trade_message;
    outright_trade_cancel_message_t outright_trade_cancel_message;
    outright_trade_correction_message_t outright_trade_correction_message;
    outright_imbalance_message_t outright_imbalance_message;
    outright_crossing_rfq_message_t outright_crossing_rfq_message;
    outright_bold_rfq_message_t outright_bold_rfq_message;
    outright_summary_message_t outright_summary_message;
    underlying_status_message_t underlying_status_message;
    outright_series_status_message_t outright_series_status_message;
    refresh_outright_quote_message_t refresh_outright_quote_message;
    refresh_outright_trade_message_t refresh_outright_trade_message;
    refresh_outright_imbalance_message_t refresh_outright_imbalance_message;
    underlying_index_mapping_message_t underlying_index_mapping_message;
    series_index_mapping_message_t series_index_mapping_message;
    stream_id_message_t stream_id_message;
    sequence_number_reset_message_t sequence_number_reset_message;
}

parser ArcaoptionsTopfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w401: parse_outright_quote_message;
            16w407: parse_outright_trade_message;
            16w409: parse_outright_trade_cancel_message;
            16w411: parse_outright_trade_correction_message;
            16w413: parse_outright_imbalance_message;
            16w415: parse_outright_crossing_rfq_message;
            16w471: parse_outright_bold_rfq_message;
            16w417: parse_outright_summary_message;
            16w419: parse_underlying_status_message;
            16w421: parse_outright_series_status_message;
            16w501: parse_refresh_outright_quote_message;
            16w507: parse_refresh_outright_trade_message;
            16w509: parse_refresh_outright_imbalance_message;
            16w435: parse_underlying_index_mapping_message;
            16w437: parse_series_index_mapping_message;
            16w455: parse_stream_id_message;
            16w1: parse_sequence_number_reset_message;
            default: accept;
        }
    }

    state parse_outright_quote_message {
        packet.extract(hdr.outright_quote_message);
        transition accept;
    }

    state parse_outright_trade_message {
        packet.extract(hdr.outright_trade_message);
        transition accept;
    }

    state parse_outright_trade_cancel_message {
        packet.extract(hdr.outright_trade_cancel_message);
        transition accept;
    }

    state parse_outright_trade_correction_message {
        packet.extract(hdr.outright_trade_correction_message);
        transition accept;
    }

    state parse_outright_imbalance_message {
        packet.extract(hdr.outright_imbalance_message);
        transition accept;
    }

    state parse_outright_crossing_rfq_message {
        packet.extract(hdr.outright_crossing_rfq_message);
        transition accept;
    }

    state parse_outright_bold_rfq_message {
        packet.extract(hdr.outright_bold_rfq_message);
        transition accept;
    }

    state parse_outright_summary_message {
        packet.extract(hdr.outright_summary_message);
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

    state parse_refresh_outright_quote_message {
        packet.extract(hdr.refresh_outright_quote_message);
        transition accept;
    }

    state parse_refresh_outright_trade_message {
        packet.extract(hdr.refresh_outright_trade_message);
        transition accept;
    }

    state parse_refresh_outright_imbalance_message {
        packet.extract(hdr.refresh_outright_imbalance_message);
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

control ArcaoptionsTopfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaoptionsTopfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control ArcaoptionsTopfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control ArcaoptionsTopfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaoptionsTopfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.outright_quote_message);
        packet.emit(hdr.outright_trade_message);
        packet.emit(hdr.outright_trade_cancel_message);
        packet.emit(hdr.outright_trade_correction_message);
        packet.emit(hdr.outright_imbalance_message);
        packet.emit(hdr.outright_crossing_rfq_message);
        packet.emit(hdr.outright_bold_rfq_message);
        packet.emit(hdr.outright_summary_message);
        packet.emit(hdr.underlying_status_message);
        packet.emit(hdr.outright_series_status_message);
        packet.emit(hdr.refresh_outright_quote_message);
        packet.emit(hdr.refresh_outright_trade_message);
        packet.emit(hdr.refresh_outright_imbalance_message);
        packet.emit(hdr.underlying_index_mapping_message);
        packet.emit(hdr.series_index_mapping_message);
        packet.emit(hdr.stream_id_message);
        packet.emit(hdr.sequence_number_reset_message);
    }
}

V1Switch(
    ArcaoptionsTopfeedParser(),
    ArcaoptionsTopfeedVerifyChecksum(),
    ArcaoptionsTopfeedIngress(),
    ArcaoptionsTopfeedEgress(),
    ArcaoptionsTopfeedComputeChecksum(),
    ArcaoptionsTopfeedDeparser()
) main;
