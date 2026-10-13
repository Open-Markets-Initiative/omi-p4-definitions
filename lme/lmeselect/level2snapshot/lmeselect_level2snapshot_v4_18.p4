// P4_16 (v1model) definition for: Lme LmeSelect Level2Snapshot LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource Level2 Refresh
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

header aggregate_order_book_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<8> no_entries;
}

header aggregate_order_book_message_entries_t {
    bit<64> aggregate_volume;
    bit<64> price;
    bit<32> number_of_explicit_orders;
    bit<64> total_qty_of_explicit_orders;
    bit<32> number_of_implied_orders;
    bit<64> total_qty_of_implied_orders;
    bit<8> buy_sell;
    bit<8> price_level;
    bit<8> update_action;
}

header refresh_complete_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> aggregate_order_book_message_entries_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_messages_t packet_header_messages[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    market_state_contract_message_t market_state_contract_message[MAX_MESSAGES];
    market_state_instrument_message_t market_state_instrument_message[MAX_MESSAGES];
    indicative_opening_price_message_t indicative_opening_price_message[MAX_MESSAGES];
    quote_request_message_t quote_request_message[MAX_MESSAGES];
    aggregate_order_book_message_t aggregate_order_book_message[MAX_MESSAGES];
    aggregate_order_book_message_entries_t aggregate_order_book_message_entries[MAX_MESSAGES];
    refresh_complete_message_t refresh_complete_message[MAX_MESSAGES];
}

parser LmeselectLevel2snapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x3701: parse_market_state_contract_message;
            16w0x3801: parse_market_state_instrument_message;
            16w0x4001: parse_indicative_opening_price_message;
            16w0x4901: parse_quote_request_message;
            16w0x4201: parse_aggregate_order_book_message;
            16w0xcb00: parse_refresh_complete_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_market_state_contract_message {
        packet.extract(hdr.market_state_contract_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_market_state_instrument_message {
        packet.extract(hdr.market_state_instrument_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_indicative_opening_price_message {
        packet.extract(hdr.indicative_opening_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_aggregate_order_book_message {
        packet.extract(hdr.aggregate_order_book_message.next);
        meta.dispatched = 1;
        meta.aggregate_order_book_message_entries_remaining = hdr.aggregate_order_book_message.last.no_entries;
        transition select(meta.aggregate_order_book_message_entries_remaining) {
            8w0: parse_packet_header_messages;
            default: parse_aggregate_order_book_message_entries;
        }
    }

    state parse_aggregate_order_book_message_entries {
        packet.extract(hdr.aggregate_order_book_message_entries.next);
        meta.aggregate_order_book_message_entries_remaining = meta.aggregate_order_book_message_entries_remaining - 1;
        transition select(meta.aggregate_order_book_message_entries_remaining) {
            8w0: parse_packet_header_messages;
            default: parse_aggregate_order_book_message_entries;
        }
    }

    state parse_refresh_complete_message {
        packet.extract(hdr.refresh_complete_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_packet_header_messages_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectLevel2snapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectLevel2snapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectLevel2snapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectLevel2snapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectLevel2snapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_messages);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.market_state_contract_message);
        packet.emit(hdr.market_state_instrument_message);
        packet.emit(hdr.indicative_opening_price_message);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.aggregate_order_book_message);
        packet.emit(hdr.aggregate_order_book_message_entries);
        packet.emit(hdr.refresh_complete_message);
    }
}

V1Switch(
    LmeselectLevel2snapshotParser(),
    LmeselectLevel2snapshotVerifyChecksum(),
    LmeselectLevel2snapshotIngress(),
    LmeselectLevel2snapshotEgress(),
    LmeselectLevel2snapshotComputeChecksum(),
    LmeselectLevel2snapshotDeparser()
) main;
