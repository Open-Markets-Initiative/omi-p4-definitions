// P4_16 (v1model) definition for: Lme LmeSelect Level1 LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource Level1
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

header market_state_contract_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<96> contract_code;
    bit<8> trading_state;
    bit<64> start_time;
    bit<64> end_time;
    bit<8> trading_state_condition;
    bit<16> filler_string_2;
}

header market_state_instrument_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<8> timetable_control_type;
    bit<8> trading_state;
    bit<64> start_time;
    bit<64> end_time;
    bit<8> trading_state_condition;
    bit<24> filler_string_3;
}

header indicative_opening_price_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<64> indicative_opening_price;
    bit<32> indicative_opening_volume;
    bit<64> indicative_opening_mid_price;
    bit<16> filler_string_2;
}

header quote_request_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<8> quote_request_type;
    bit<8> buy_sell;
    bit<32> volume;
    bit<16> filler_string_2;
}

header order_book_clear_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
}

header cross_request_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<64> cross_id;
    bit<32> volume;
    bit<64> expire_time;
    bit<16> filler_string_2;
}

header top_of_book_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<64> aggregate_bid_volume;
    bit<64> aggregate_ask_volume;
    bit<64> bid_price;
    bit<64> ask_price;
    bit<32> number_bid_explicit_orders;
    bit<64> bid_qty_explicit_orders;
    bit<32> number_ask_explicit_orders;
    bit<64> ask_qty_explicit_orders;
    bit<32> number_bid_implied_orders;
    bit<64> bid_qty_implied_orders;
    bit<32> number_ask_implied_orders;
    bit<64> ask_qty_implied_orders;
}

header market_data_trade_message_t {
    bit<64> time_of_event;
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
    bit<16> market_data_trade_message_trade_legs_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    market_state_contract_message_t market_state_contract_message[MAX_MESSAGES];
    market_state_instrument_message_t market_state_instrument_message[MAX_MESSAGES];
    indicative_opening_price_message_t indicative_opening_price_message[MAX_MESSAGES];
    quote_request_message_t quote_request_message[MAX_MESSAGES];
    order_book_clear_message_t order_book_clear_message[MAX_MESSAGES];
    cross_request_message_t cross_request_message[MAX_MESSAGES];
    top_of_book_message_t top_of_book_message[MAX_MESSAGES];
    market_data_trade_message_t market_data_trade_message[MAX_MESSAGES];
    market_data_trade_message_trade_legs_t market_data_trade_message_trade_legs[MAX_MESSAGES];
}

parser LmeselectLevel1Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x3701: parse_market_state_contract_message;
            16w0x3801: parse_market_state_instrument_message;
            16w0x4001: parse_indicative_opening_price_message;
            16w0x4901: parse_quote_request_message;
            16w0x4701: parse_order_book_clear_message;
            16w0x4a01: parse_cross_request_message;
            16w0x4101: parse_top_of_book_message;
            16w0x5501: parse_market_data_trade_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_state_contract_message {
        packet.extract(hdr.market_state_contract_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_market_state_instrument_message {
        packet.extract(hdr.market_state_instrument_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_indicative_opening_price_message {
        packet.extract(hdr.indicative_opening_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_book_clear_message {
        packet.extract(hdr.order_book_clear_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_cross_request_message {
        packet.extract(hdr.cross_request_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_top_of_book_message {
        packet.extract(hdr.top_of_book_message.next);
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

control LmeselectLevel1VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectLevel1Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectLevel1Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectLevel1ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectLevel1Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.market_state_contract_message);
        packet.emit(hdr.market_state_instrument_message);
        packet.emit(hdr.indicative_opening_price_message);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.order_book_clear_message);
        packet.emit(hdr.cross_request_message);
        packet.emit(hdr.top_of_book_message);
        packet.emit(hdr.market_data_trade_message);
        packet.emit(hdr.market_data_trade_message_trade_legs);
    }
}

V1Switch(
    LmeselectLevel1Parser(),
    LmeselectLevel1VerifyChecksum(),
    LmeselectLevel1Ingress(),
    LmeselectLevel1Egress(),
    LmeselectLevel1ComputeChecksum(),
    LmeselectLevel1Deparser()
) main;
