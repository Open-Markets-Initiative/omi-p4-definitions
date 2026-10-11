// P4_16 (v1model) definition for: Nyse NyseBonds Quote Pdp v1.2.a
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Quote
//   Encoding: Pdp
//   Version: 1.2.a
//   Date: 03/12/2015
//   Specification: NYSE_Bonds_Quote_Client_Spec.pdf
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

header message_header_t {
    bit<16> msg_size;
    bit<16> msg_type;
    bit<32> msg_seq_num;
    bit<32> send_time;
    bit<8> product_id;
    bit<8> retrans_flag;
    bit<8> num_body_entries;
    bit<8> filler;
}

header sequence_number_reset_message_t {
    bit<32> next_seq_number;
}

header message_unavailable_message_t {
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
}

header refresh_quote_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> quote_link_id;
    bit<32> ask_price_numerator;
    bit<32> ask_size;
    bit<32> bid_price_numerator;
    bit<32> bid_size;
    bit<8> price_scale_code;
    bit<8> exchange_id;
    bit<8> security_type;
    bit<8> quote_condition;
    bit<8> flat_pricing;
    bit<8> trading_action;
    bit<16> filler_ascii_2;
    bit<176> symbol;
    bit<112> cusip;
}

header symbol_index_mapping_message_t {
    bit<32> symbol_index;
    bit<176> symbol;
    bit<112> cusip;
    bit<32> filler_ascii_4;
}

header quote_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> quote_link_id;
    bit<32> ask_price_numerator;
    bit<32> ask_size;
    bit<32> bid_price_numerator;
    bit<32> bid_size;
    bit<8> price_scale_code;
    bit<8> exchange_id;
    bit<8> security_type;
    bit<8> quote_condition;
    bit<8> flat_pricing;
    bit<8> trading_action;
    bit<16> filler_ascii_2;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    sequence_number_reset_message_t sequence_number_reset_message;
    message_unavailable_message_t message_unavailable_message;
    refresh_quote_message_t refresh_quote_message;
    symbol_index_mapping_message_t symbol_index_mapping_message;
    quote_message_t quote_message;
}

parser NysebondsQuoteParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            16w1: parse_sequence_number_reset_message;
            16w2: parse_heartbeat_message;
            16w5: parse_message_unavailable_message;
            16w23: parse_refresh_quote_message;
            16w26: parse_symbol_index_mapping_message;
            16w141: parse_quote_message;
            default: accept;
        }
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_unavailable_message {
        packet.extract(hdr.message_unavailable_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refresh_quote_message {
        packet.extract(hdr.refresh_quote_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symbol_index_mapping_message {
        packet.extract(hdr.symbol_index_mapping_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NysebondsQuoteVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsQuoteIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NysebondsQuoteEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NysebondsQuoteComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsQuoteDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.sequence_number_reset_message);
        packet.emit(hdr.message_unavailable_message);
        packet.emit(hdr.refresh_quote_message);
        packet.emit(hdr.symbol_index_mapping_message);
        packet.emit(hdr.quote_message);
    }
}

V1Switch(
    NysebondsQuoteParser(),
    NysebondsQuoteVerifyChecksum(),
    NysebondsQuoteIngress(),
    NysebondsQuoteEgress(),
    NysebondsQuoteComputeChecksum(),
    NysebondsQuoteDeparser()
) main;
