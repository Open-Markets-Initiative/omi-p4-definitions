// P4_16 (v1model) definition for: Nyse NyseConsolidated Bqt Xdp v2.4.a
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: 
//   Encoding: Exchange Data Publisher
//   Version: 2.4.a
//   Date: 03/05/2026
//   Specification: NYSE_BQT_Client_Specification.pdf
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
    bit<16> market_id;
}

header security_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<8> security_status;
    bit<8> halt_condition;
    bit<16> market_id;
    bit<16> reserved_2;
    bit<32> price_1;
    bit<32> price_2;
    bit<8> ssr_triggering_exchange_id;
    bit<32> ssr_triggering_volume;
    bit<32> time;
    bit<8> ssr_state;
    bit<8> market_state;
    bit<8> session_state;
}

header retransmission_request_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
    bit<80> source_id;
    bit<8> product_id;
    bit<8> channel_id;
}

header symbol_index_mapping_request_message_t {
    bit<32> symbol_index;
    bit<80> source_id;
    bit<8> product_id;
    bit<8> channel_id;
    bit<8> retransmit_method;
}

header refresh_request_message_t {
    bit<32> symbol_index;
    bit<80> source_id;
    bit<8> product_id;
    bit<8> channel_id;
}

header message_unavailable_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
    bit<8> product_id;
    bit<8> channel_id;
}

header refresh_header_message_t {
    bit<16> current_refresh_pkt;
    bit<16> total_refresh_pkts;
    bit<32> last_seq_num;
    bit<32> last_symbol_seq_num;
}

header request_response_message_t {
    bit<32> request_seq_num;
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
    bit<80> source_id;
    bit<8> product_id;
    bit<8> channel_id;
    bit<8> status;
}

header heartbeat_response_message_t {
    bit<80> source_id;
}

header best_quotes_message_t {
    bit<32> symbol_index;
    bit<32> symbol_seq_number;
    bit<32> ask_price;
    bit<32> ask_volume;
    bit<32> bid_price;
    bit<32> bid_volume;
    bit<8> ask_quote_condition;
    bit<8> bid_quote_condition;
    bit<1> retail_interest_on_the_bid_side;
    bit<1> retail_interest_on_the_ask_side;
    bit<6> reserved;
    bit<16> market_id_of_best_ask;
    bit<16> market_id_of_best_bid;
}

header consolidated_single_sided_quote_message_t {
    bit<32> symbol_index;
    bit<32> symbol_seq_number;
    bit<8> side;
    bit<32> price;
    bit<32> volume;
    bit<8> quote_condition;
    bit<1> retail_interest_on_the_bid_side;
    bit<1> retail_interest_on_the_ask_side;
    bit<6> reserved;
    bit<16> market_id;
}

header trf_fractional_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<64> fractional_volume;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<8> trade_cond_3;
    bit<8> trade_cond_4;
    bit<32> exec_day_time;
    bit<32> exec_day_time_ns;
    bit<16> market_id;
}

header consolidated_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_number;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume;
    bit<8> trade_condition_1;
    bit<8> trade_condition_2;
    bit<8> trade_condition_3;
    bit<8> trade_condition_4;
    bit<16> market_id;
}

header consolidated_trade_cancel_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_number;
    bit<32> original_trade_id;
    bit<16> market_id;
}

header trf_fractional_trade_correction_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> original_trade_id;
    bit<32> trade_id;
    bit<32> price;
    bit<64> fractional_volume;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<8> trade_cond_3;
    bit<8> trade_cond_4;
    bit<32> exec_day_time;
    bit<32> exec_day_time_ns;
    bit<16> market_id;
}

header consolidated_trade_correction_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_number;
    bit<32> original_trade_id;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume;
    bit<8> trade_condition_1;
    bit<8> trade_condition_2;
    bit<8> trade_condition_3;
    bit<8> trade_condition_4;
    bit<16> market_id;
}

header trf_fractional_prior_day_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<64> fractional_volume;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<8> trade_cond_3;
    bit<8> trade_cond_4;
    bit<32> prior_day_time;
    bit<32> prior_day_time_ns;
}

header trf_fractional_prior_day_trade_cancel_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<64> fractional_volume;
    bit<32> prior_day_time;
    bit<32> prior_day_time_ns;
}

header consolidated_fractional_stock_summary_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> nyse_group_high_price;
    bit<32> nyse_group_low_price;
    bit<32> primary_listing_market_official_open_price;
    bit<64> fractional_nyse_group_volume;
    bit<16> nyse_group_market_id_of_high_price;
    bit<16> nyse_group_market_id_of_low_price;
    bit<16> market_id_of_open_price;
    bit<8> num_close_prices;
    bit<16> nyse_group_market_id_of_the_close;
    bit<32> primary_listing_market_official_close_price;
    bit<32> consolidated_high_price;
    bit<32> consolidated_low_price;
    bit<32> consolidated_first_price;
    bit<32> consolidated_last_price;
    bit<8> complete;
}

header consolidated_fractional_volume_message_t {
    bit<32> symbol_index;
    bit<32> symbol_seq_number;
    bit<64> fractional_consolidated_volume;
    bit<8> reason;
    bit<8> complete;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    sequence_number_reset_message_t sequence_number_reset_message;
    source_time_reference_message_t source_time_reference_message;
    symbol_index_mapping_message_t symbol_index_mapping_message;
    symbol_clear_message_t symbol_clear_message;
    security_status_message_t security_status_message;
    retransmission_request_message_t retransmission_request_message;
    symbol_index_mapping_request_message_t symbol_index_mapping_request_message;
    refresh_request_message_t refresh_request_message;
    message_unavailable_message_t message_unavailable_message;
    refresh_header_message_t refresh_header_message;
    request_response_message_t request_response_message;
    heartbeat_response_message_t heartbeat_response_message;
    best_quotes_message_t best_quotes_message;
    consolidated_single_sided_quote_message_t consolidated_single_sided_quote_message;
    trf_fractional_trade_message_t trf_fractional_trade_message;
    consolidated_trade_message_t consolidated_trade_message;
    consolidated_trade_cancel_message_t consolidated_trade_cancel_message;
    trf_fractional_trade_correction_message_t trf_fractional_trade_correction_message;
    consolidated_trade_correction_message_t consolidated_trade_correction_message;
    trf_fractional_prior_day_trade_message_t trf_fractional_prior_day_trade_message;
    trf_fractional_prior_day_trade_cancel_message_t trf_fractional_prior_day_trade_cancel_message;
    consolidated_fractional_stock_summary_message_t consolidated_fractional_stock_summary_message;
    consolidated_fractional_volume_message_t consolidated_fractional_volume_message;
}

parser NyseNyseconsolidatedBqtParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w1: parse_sequence_number_reset_message;
            16w2: parse_source_time_reference_message;
            16w3: parse_symbol_index_mapping_message;
            16w32: parse_symbol_clear_message;
            16w34: parse_security_status_message;
            16w10: parse_retransmission_request_message;
            16w13: parse_symbol_index_mapping_request_message;
            16w15: parse_refresh_request_message;
            16w31: parse_message_unavailable_message;
            16w35: parse_refresh_header_message;
            16w11: parse_request_response_message;
            16w12: parse_heartbeat_response_message;
            16w142: parse_best_quotes_message;
            16w143: parse_consolidated_single_sided_quote_message;
            16w210: parse_trf_fractional_trade_message;
            16w220: parse_consolidated_trade_message;
            16w221: parse_consolidated_trade_cancel_message;
            16w212: parse_trf_fractional_trade_correction_message;
            16w222: parse_consolidated_trade_correction_message;
            16w213: parse_trf_fractional_prior_day_trade_message;
            16w214: parse_trf_fractional_prior_day_trade_cancel_message;
            16w202: parse_consolidated_fractional_stock_summary_message;
            16w201: parse_consolidated_fractional_volume_message;
            default: accept;
        }
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message);
        transition accept;
    }

    state parse_source_time_reference_message {
        packet.extract(hdr.source_time_reference_message);
        transition accept;
    }

    state parse_symbol_index_mapping_message {
        packet.extract(hdr.symbol_index_mapping_message);
        transition accept;
    }

    state parse_symbol_clear_message {
        packet.extract(hdr.symbol_clear_message);
        transition accept;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message);
        transition accept;
    }

    state parse_retransmission_request_message {
        packet.extract(hdr.retransmission_request_message);
        transition accept;
    }

    state parse_symbol_index_mapping_request_message {
        packet.extract(hdr.symbol_index_mapping_request_message);
        transition accept;
    }

    state parse_refresh_request_message {
        packet.extract(hdr.refresh_request_message);
        transition accept;
    }

    state parse_message_unavailable_message {
        packet.extract(hdr.message_unavailable_message);
        transition accept;
    }

    state parse_refresh_header_message {
        packet.extract(hdr.refresh_header_message);
        transition accept;
    }

    state parse_request_response_message {
        packet.extract(hdr.request_response_message);
        transition accept;
    }

    state parse_heartbeat_response_message {
        packet.extract(hdr.heartbeat_response_message);
        transition accept;
    }

    state parse_best_quotes_message {
        packet.extract(hdr.best_quotes_message);
        transition accept;
    }

    state parse_consolidated_single_sided_quote_message {
        packet.extract(hdr.consolidated_single_sided_quote_message);
        transition accept;
    }

    state parse_trf_fractional_trade_message {
        packet.extract(hdr.trf_fractional_trade_message);
        transition accept;
    }

    state parse_consolidated_trade_message {
        packet.extract(hdr.consolidated_trade_message);
        transition accept;
    }

    state parse_consolidated_trade_cancel_message {
        packet.extract(hdr.consolidated_trade_cancel_message);
        transition accept;
    }

    state parse_trf_fractional_trade_correction_message {
        packet.extract(hdr.trf_fractional_trade_correction_message);
        transition accept;
    }

    state parse_consolidated_trade_correction_message {
        packet.extract(hdr.consolidated_trade_correction_message);
        transition accept;
    }

    state parse_trf_fractional_prior_day_trade_message {
        packet.extract(hdr.trf_fractional_prior_day_trade_message);
        transition accept;
    }

    state parse_trf_fractional_prior_day_trade_cancel_message {
        packet.extract(hdr.trf_fractional_prior_day_trade_cancel_message);
        transition accept;
    }

    state parse_consolidated_fractional_stock_summary_message {
        packet.extract(hdr.consolidated_fractional_stock_summary_message);
        transition accept;
    }

    state parse_consolidated_fractional_volume_message {
        packet.extract(hdr.consolidated_fractional_volume_message);
        transition accept;
    }

}

control NyseNyseconsolidatedBqtVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseNyseconsolidatedBqtIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NyseNyseconsolidatedBqtEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NyseNyseconsolidatedBqtComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseNyseconsolidatedBqtDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.sequence_number_reset_message);
        packet.emit(hdr.source_time_reference_message);
        packet.emit(hdr.symbol_index_mapping_message);
        packet.emit(hdr.symbol_clear_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.retransmission_request_message);
        packet.emit(hdr.symbol_index_mapping_request_message);
        packet.emit(hdr.refresh_request_message);
        packet.emit(hdr.message_unavailable_message);
        packet.emit(hdr.refresh_header_message);
        packet.emit(hdr.request_response_message);
        packet.emit(hdr.heartbeat_response_message);
        packet.emit(hdr.best_quotes_message);
        packet.emit(hdr.consolidated_single_sided_quote_message);
        packet.emit(hdr.trf_fractional_trade_message);
        packet.emit(hdr.consolidated_trade_message);
        packet.emit(hdr.consolidated_trade_cancel_message);
        packet.emit(hdr.trf_fractional_trade_correction_message);
        packet.emit(hdr.consolidated_trade_correction_message);
        packet.emit(hdr.trf_fractional_prior_day_trade_message);
        packet.emit(hdr.trf_fractional_prior_day_trade_cancel_message);
        packet.emit(hdr.consolidated_fractional_stock_summary_message);
        packet.emit(hdr.consolidated_fractional_volume_message);
    }
}

V1Switch(
    NyseNyseconsolidatedBqtParser(),
    NyseNyseconsolidatedBqtVerifyChecksum(),
    NyseNyseconsolidatedBqtIngress(),
    NyseNyseconsolidatedBqtEgress(),
    NyseNyseconsolidatedBqtComputeChecksum(),
    NyseNyseconsolidatedBqtDeparser()
) main;
