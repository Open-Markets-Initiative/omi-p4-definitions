// P4_16 (v1model) definition for: Lme LmeSelect ReferencePrices LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource ReferencePrices
//   Encoding: LMEsource
//   Version: 4.18
//   Date: 08/18/2026
//   Specification: LMEsource Client Interface Specification v4 18.pdf
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
    bit<8> msg_count;
    bit<8> filler;
    bit<32> seq_num;
    bit<64> send_time;
}

header packet_header_messages_t {
    bit<16> msg_size;
    bit<16> msg_type;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header reference_price_message_t {
    bit<64> time_of_event;
    bit<8> reference_price_category;
    bit<256> reference_price_type;
    bit<96> price_status;
    bit<32> business_date;
    bit<64> instrument_id;
    bit<16> product_code;
    bit<24> currency_code;
    bit<64> bid;
    bit<64> price;
    bit<64> ask;
}

header reference_forward_curve_price_message_t {
    bit<64> time_of_event;
    bit<32> business_date;
    bit<16> product_code;
    bit<96> price_status;
    bit<24> currency_code;
    bit<16> remaining_records;
    bit<16> record_count;
}

header reference_forward_curve_price_message_curve_prices_t {
    bit<64> price;
    bit<32> prompt_date_1;
    bit<48> prompt_date_label_1;
    bit<32> prompt_date_2;
    bit<48> prompt_date_label_2;
}

header reference_fx_rate_message_t {
    bit<8> fx_rate_category;
    bit<16> fx_rate_type;
    bit<32> business_date;
    bit<32> maturity_date;
    bit<24> base_currency_code;
    bit<24> target_currency_code;
    bit<64> conversion_rate;
}

header reference_volatility_price_message_t {
    bit<64> time_of_event;
    bit<32> business_date;
    bit<96> contract_code;
    bit<32> expiry_date;
    bit<16> remaining_records;
    bit<16> record_count;
}

header reference_volatility_price_message_volatility_points_t {
    bit<8> surface_domain;
    bit<64> delta;
    bit<64> strike_price;
    bit<8> atm;
    bit<64> call_volatility;
    bit<64> put_volatility;
    bit<64> call_premium;
    bit<64> put_premium;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> reference_forward_curve_price_message_curve_prices_remaining;
    bit<16> reference_volatility_price_message_volatility_points_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_messages_t packet_header_messages[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    reference_price_message_t reference_price_message[MAX_MESSAGES];
    reference_forward_curve_price_message_t reference_forward_curve_price_message[MAX_MESSAGES];
    reference_forward_curve_price_message_curve_prices_t reference_forward_curve_price_message_curve_prices[MAX_MESSAGES];
    reference_fx_rate_message_t reference_fx_rate_message[MAX_MESSAGES];
    reference_volatility_price_message_t reference_volatility_price_message[MAX_MESSAGES];
    reference_volatility_price_message_volatility_points_t reference_volatility_price_message_volatility_points[MAX_MESSAGES];
}

parser LmeselectReferencepricesParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.msg_count) {
            8w0: parse_packet_header_messages_empty;
            default: parse_packet_header_messages;
        }
    }

    state parse_packet_header_messages {
        packet.extract(hdr.packet_header_messages.next);
        transition select(hdr.packet_header_messages.last.msg_type) {
            16w0x6400: parse_sequence_reset_message;
            16w0x9101: parse_reference_price_message;
            16w0x9201: parse_reference_forward_curve_price_message;
            16w0x9301: parse_reference_fx_rate_message;
            16w0x9401: parse_reference_volatility_price_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_reference_price_message {
        packet.extract(hdr.reference_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_reference_forward_curve_price_message {
        packet.extract(hdr.reference_forward_curve_price_message.next);
        meta.dispatched = 1;
        meta.reference_forward_curve_price_message_curve_prices_remaining = hdr.reference_forward_curve_price_message.last.record_count;
        transition select(meta.reference_forward_curve_price_message_curve_prices_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_reference_forward_curve_price_message_curve_prices;
        }
    }

    state parse_reference_forward_curve_price_message_curve_prices {
        packet.extract(hdr.reference_forward_curve_price_message_curve_prices.next);
        meta.reference_forward_curve_price_message_curve_prices_remaining = meta.reference_forward_curve_price_message_curve_prices_remaining - 1;
        transition select(meta.reference_forward_curve_price_message_curve_prices_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_reference_forward_curve_price_message_curve_prices;
        }
    }

    state parse_reference_fx_rate_message {
        packet.extract(hdr.reference_fx_rate_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_reference_volatility_price_message {
        packet.extract(hdr.reference_volatility_price_message.next);
        meta.dispatched = 1;
        meta.reference_volatility_price_message_volatility_points_remaining = hdr.reference_volatility_price_message.last.record_count;
        transition select(meta.reference_volatility_price_message_volatility_points_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_reference_volatility_price_message_volatility_points;
        }
    }

    state parse_reference_volatility_price_message_volatility_points {
        packet.extract(hdr.reference_volatility_price_message_volatility_points.next);
        meta.reference_volatility_price_message_volatility_points_remaining = meta.reference_volatility_price_message_volatility_points_remaining - 1;
        transition select(meta.reference_volatility_price_message_volatility_points_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_reference_volatility_price_message_volatility_points;
        }
    }

    state parse_packet_header_messages_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectReferencepricesVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectReferencepricesIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectReferencepricesEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectReferencepricesComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectReferencepricesDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_messages);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.reference_price_message);
        packet.emit(hdr.reference_forward_curve_price_message);
        packet.emit(hdr.reference_forward_curve_price_message_curve_prices);
        packet.emit(hdr.reference_fx_rate_message);
        packet.emit(hdr.reference_volatility_price_message);
        packet.emit(hdr.reference_volatility_price_message_volatility_points);
    }
}

V1Switch(
    LmeselectReferencepricesParser(),
    LmeselectReferencepricesVerifyChecksum(),
    LmeselectReferencepricesIngress(),
    LmeselectReferencepricesEgress(),
    LmeselectReferencepricesComputeChecksum(),
    LmeselectReferencepricesDeparser()
) main;
