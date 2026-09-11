// P4_16 (v1model) definition for: Nyse AmexOptions ComplexFeed Pillar v1.0.h
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Complex Feed
//   Encoding: Pillar
//   Version: 1.0.h
//   Date: 11/18/2025
//   Specification: PILLAR_COMPLEX_Client_Specification.pdf
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
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
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

header outright_series_index_mapping_message_t {
    bit<32> series_index;
    bit<8> series_type;
    bit<16> market_id;
    bit<8> system_id;
    bit<48> option_symbol_root;
    bit<88> underlying_symbol;
    bit<32> underlying_index;
    bit<8> price_scale_code;
    bit<16> contract_multiplier;
    bit<48> maturity_date;
    bit<8> put_or_call;
    bit<80> strike_price;
    bit<8> closing_only_indicator;
    bit<8> reserved_1;
}

header options_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> series_seq_num;
    bit<8> series_status;
    bit<8> market_state;
    bit<8> options_status_halt_condition;
}

header complex_series_index_mapping_message_t {
    bit<32> series_index;
    bit<16> market_id;
    bit<8> system_id;
    bit<16> no_of_legs;
}

header complex_series_index_mapping_message_complex_series_index_mapping_leg_t {
    bit<32> symbol_index;
    bit<16> leg_ratio_qty;
    bit<8> leg_side;
    bit<8> leg_security_type;
}

header retransmission_request_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
    bit<80> source_id;
    bit<8> product_id;
    bit<8> channel_id;
}

header refresh_header_message_t {
    bit<16> current_refresh_pkt;
    bit<16> total_refresh_pkts;
    bit<32> last_seq_num;
    bit<32> last_symbol_seq_num;
}

header refresh_request_message_t {
    bit<32> symbol_index;
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

header message_unavailable_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
    bit<8> product_id;
    bit<8> channel_id;
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

header options_quote_message_t {
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> series_seq_num;
    bit<32> ask_price;
    bit<32> ask_volume;
    bit<32> bid_price;
    bit<32> bid_volume;
    bit<8> quote_condition;
    bit<8> reserved_1;
    bit<32> ask_customer_volume;
    bit<32> bid_customer_volume;
}

header options_trade_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> series_seq_num;
    bit<32> trade_id;
    bit<32> trade_price;
    bit<32> volume;
    bit<8> trade_cond_1;
    bit<8> reserved_1;
    bit<8> second_reserved_1;
    bit<8> third_reserved_1;
}

header series_rfq_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> series_index;
    bit<32> series_seq_num;
    bit<8> side;
    bit<8> type_;
    bit<8> capacity;
    bit<32> total_quantity;
    bit<32> working_price;
    bit<32> participant;
    bit<64> auction_id;
    bit<8> rfq_status;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> complex_series_index_mapping_message_complex_series_index_mapping_leg_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    sequence_number_reset_message_t sequence_number_reset_message[MAX_MESSAGES];
    source_time_reference_message_t source_time_reference_message[MAX_MESSAGES];
    symbol_index_mapping_message_t symbol_index_mapping_message[MAX_MESSAGES];
    symbol_clear_message_t symbol_clear_message[MAX_MESSAGES];
    security_status_message_t security_status_message[MAX_MESSAGES];
    outright_series_index_mapping_message_t outright_series_index_mapping_message[MAX_MESSAGES];
    options_status_message_t options_status_message[MAX_MESSAGES];
    complex_series_index_mapping_message_t complex_series_index_mapping_message[MAX_MESSAGES];
    complex_series_index_mapping_message_complex_series_index_mapping_leg_t complex_series_index_mapping_message_complex_series_index_mapping_leg[MAX_MESSAGES];
    retransmission_request_message_t retransmission_request_message[MAX_MESSAGES];
    refresh_header_message_t refresh_header_message[MAX_MESSAGES];
    refresh_request_message_t refresh_request_message[MAX_MESSAGES];
    symbol_index_mapping_request_message_t symbol_index_mapping_request_message[MAX_MESSAGES];
    message_unavailable_message_t message_unavailable_message[MAX_MESSAGES];
    request_response_message_t request_response_message[MAX_MESSAGES];
    heartbeat_response_message_t heartbeat_response_message[MAX_MESSAGES];
    options_quote_message_t options_quote_message[MAX_MESSAGES];
    options_trade_message_t options_trade_message[MAX_MESSAGES];
    series_rfq_message_t series_rfq_message[MAX_MESSAGES];
}

parser AmexoptionsComplexfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x3200: parse_outright_series_index_mapping_message;
            16w0x3300: parse_options_status_message;
            16w0x3c00: parse_complex_series_index_mapping_message;
            16w0xa00: parse_retransmission_request_message;
            16w0x2300: parse_refresh_header_message;
            16w0xf00: parse_refresh_request_message;
            16w0xd00: parse_symbol_index_mapping_request_message;
            16w0x1f00: parse_message_unavailable_message;
            16w0xb00: parse_request_response_message;
            16w0xc00: parse_heartbeat_response_message;
            16w0x5401: parse_options_quote_message;
            16w0x4001: parse_options_trade_message;
            16w0x3301: parse_series_rfq_message;
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

    state parse_outright_series_index_mapping_message {
        packet.extract(hdr.outright_series_index_mapping_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_options_status_message {
        packet.extract(hdr.options_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_complex_series_index_mapping_message {
        packet.extract(hdr.complex_series_index_mapping_message.next);
        meta.dispatched = 1;
        meta.complex_series_index_mapping_message_complex_series_index_mapping_leg_remaining = hdr.complex_series_index_mapping_message.last.no_of_legs;
        transition select(meta.complex_series_index_mapping_message_complex_series_index_mapping_leg_remaining) {
            16w0: parse_message;
            default: parse_complex_series_index_mapping_message_complex_series_index_mapping_leg;
        }
    }

    state parse_complex_series_index_mapping_message_complex_series_index_mapping_leg {
        packet.extract(hdr.complex_series_index_mapping_message_complex_series_index_mapping_leg.next);
        meta.complex_series_index_mapping_message_complex_series_index_mapping_leg_remaining = meta.complex_series_index_mapping_message_complex_series_index_mapping_leg_remaining - 1;
        transition select(meta.complex_series_index_mapping_message_complex_series_index_mapping_leg_remaining) {
            16w0: parse_message;
            default: parse_complex_series_index_mapping_message_complex_series_index_mapping_leg;
        }
    }

    state parse_retransmission_request_message {
        packet.extract(hdr.retransmission_request_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_refresh_header_message {
        packet.extract(hdr.refresh_header_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_refresh_request_message {
        packet.extract(hdr.refresh_request_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_symbol_index_mapping_request_message {
        packet.extract(hdr.symbol_index_mapping_request_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_message_unavailable_message {
        packet.extract(hdr.message_unavailable_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_request_response_message {
        packet.extract(hdr.request_response_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_heartbeat_response_message {
        packet.extract(hdr.heartbeat_response_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_options_quote_message {
        packet.extract(hdr.options_quote_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_options_trade_message {
        packet.extract(hdr.options_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_series_rfq_message {
        packet.extract(hdr.series_rfq_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control AmexoptionsComplexfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexoptionsComplexfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AmexoptionsComplexfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AmexoptionsComplexfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexoptionsComplexfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.sequence_number_reset_message);
        packet.emit(hdr.source_time_reference_message);
        packet.emit(hdr.symbol_index_mapping_message);
        packet.emit(hdr.symbol_clear_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.outright_series_index_mapping_message);
        packet.emit(hdr.options_status_message);
        packet.emit(hdr.complex_series_index_mapping_message);
        packet.emit(hdr.complex_series_index_mapping_message_complex_series_index_mapping_leg);
        packet.emit(hdr.retransmission_request_message);
        packet.emit(hdr.refresh_header_message);
        packet.emit(hdr.refresh_request_message);
        packet.emit(hdr.symbol_index_mapping_request_message);
        packet.emit(hdr.message_unavailable_message);
        packet.emit(hdr.request_response_message);
        packet.emit(hdr.heartbeat_response_message);
        packet.emit(hdr.options_quote_message);
        packet.emit(hdr.options_trade_message);
        packet.emit(hdr.series_rfq_message);
    }
}

V1Switch(
    AmexoptionsComplexfeedParser(),
    AmexoptionsComplexfeedVerifyChecksum(),
    AmexoptionsComplexfeedIngress(),
    AmexoptionsComplexfeedEgress(),
    AmexoptionsComplexfeedComputeChecksum(),
    AmexoptionsComplexfeedDeparser()
) main;
