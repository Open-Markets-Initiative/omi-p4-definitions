// P4_16 (v1model) definition for: Lme LmeSelect RingData LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource RingData
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

header packet_header_message_t {
    bit<16> msg_size;
    bit<16> msg_type;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header market_state_product_message_t {
    bit<16> trading_venue;
    bit<64> timeof_event;
    bit<16> product_code;
    bit<8> trading_state;
    bit<16> ring_session;
}

header market_data_order_message_t {
    bit<64> timeof_event;
    bit<64> tradable_instrument_id;
    bit<16> trading_venue;
    bit<16> ring_session;
    bit<16> cancellation_reason;
    bit<16> product_code;
    bit<8> buy_sell;
    bit<64> price;
    bit<32> volume;
    bit<16> remaining_records;
    bit<16> record_count;
    bit<32> strategy_leg_count;
}

header market_data_order_message_order_legs_t {
    bit<8> leg_buy_sell;
    bit<64> leg_price;
    bit<32> leg_volume;
}

header indicative_trade_price_message_t {
    bit<64> timeof_event;
    bit<64> tradable_instrument_id;
    bit<16> trading_venue;
    bit<16> ring_session;
    bit<8> indicative_price_type;
    bit<64> indicative_trade_price;
}

header market_data_trade_message_t {
    bit<64> timeof_event;
    bit<64> tradable_instrument_id;
    bit<16> trading_venue;
    bit<64> matched_time;
    bit<16> ring_session;
    bit<8> trade_cancel_flag;
    bit<64> price;
    bit<32> volume;
    bit<64> match_id;
    bit<8> trade_at_reference_price_type;
    bit<8> sub_type_of_trade;
    bit<16> remaining_records;
    bit<16> record_count;
    bit<32> strategy_leg_count;
}

header market_data_trade_message_trade_legs_t {
    bit<64> leg_price;
    bit<32> leg_volume;
    bit<64> leg_match_id;
    bit<8> leg_trade_at_reference_price;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> market_data_order_message_order_legs_remaining;
    bit<16> market_data_trade_message_trade_legs_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    market_state_product_message_t market_state_product_message[MAX_MESSAGES];
    market_data_order_message_t market_data_order_message[MAX_MESSAGES];
    market_data_order_message_order_legs_t market_data_order_message_order_legs[MAX_MESSAGES];
    indicative_trade_price_message_t indicative_trade_price_message[MAX_MESSAGES];
    market_data_trade_message_t market_data_trade_message[MAX_MESSAGES];
    market_data_trade_message_trade_legs_t market_data_trade_message_trade_legs[MAX_MESSAGES];
}

parser LmeselectRingdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.msg_count) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.msg_type) {
            16w0x6400: parse_sequence_reset_message;
            16w0x3601: parse_market_state_product_message;
            16w0x4801: parse_market_data_order_message;
            16w0x5401: parse_indicative_trade_price_message;
            16w0x5501: parse_market_data_trade_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_state_product_message {
        packet.extract(hdr.market_state_product_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_data_order_message {
        packet.extract(hdr.market_data_order_message.next);
        meta.dispatched = 1;
        meta.market_data_order_message_order_legs_remaining = hdr.market_data_order_message.last.record_count;
        transition select(meta.market_data_order_message_order_legs_remaining) {
            16w0: parse_packet_header_message;
            default: parse_market_data_order_message_order_legs;
        }
    }

    state parse_market_data_order_message_order_legs {
        packet.extract(hdr.market_data_order_message_order_legs.next);
        meta.market_data_order_message_order_legs_remaining = meta.market_data_order_message_order_legs_remaining - 1;
        transition select(meta.market_data_order_message_order_legs_remaining) {
            16w0: parse_packet_header_message;
            default: parse_market_data_order_message_order_legs;
        }
    }

    state parse_indicative_trade_price_message {
        packet.extract(hdr.indicative_trade_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_data_trade_message {
        packet.extract(hdr.market_data_trade_message.next);
        meta.dispatched = 1;
        meta.market_data_trade_message_trade_legs_remaining = hdr.market_data_trade_message.last.record_count;
        transition select(meta.market_data_trade_message_trade_legs_remaining) {
            16w0: parse_packet_header_message;
            default: parse_market_data_trade_message_trade_legs;
        }
    }

    state parse_market_data_trade_message_trade_legs {
        packet.extract(hdr.market_data_trade_message_trade_legs.next);
        meta.market_data_trade_message_trade_legs_remaining = meta.market_data_trade_message_trade_legs_remaining - 1;
        transition select(meta.market_data_trade_message_trade_legs_remaining) {
            16w0: parse_packet_header_message;
            default: parse_market_data_trade_message_trade_legs;
        }
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectRingdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectRingdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectRingdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectRingdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectRingdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.market_state_product_message);
        packet.emit(hdr.market_data_order_message);
        packet.emit(hdr.market_data_order_message_order_legs);
        packet.emit(hdr.indicative_trade_price_message);
        packet.emit(hdr.market_data_trade_message);
        packet.emit(hdr.market_data_trade_message_trade_legs);
    }
}

V1Switch(
    LmeselectRingdataParser(),
    LmeselectRingdataVerifyChecksum(),
    LmeselectRingdataIngress(),
    LmeselectRingdataEgress(),
    LmeselectRingdataComputeChecksum(),
    LmeselectRingdataDeparser()
) main;
