// P4_16 (v1model) definition for: Lme LmeSelect NonElectronicRefDataSnapshot LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource NonElectronicRefData Refresh
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

header instrument_definition_message_t {
    bit<64> instrument_id;
    bit<320> name;
    bit<96> contract_code;
    bit<64> underlying_instrument_id;
    bit<32> expiry_date;
    bit<64> strike_price;
    bit<8> option_type;
    bit<48> cfi_code;
    bit<96> isin;
}

header tradable_instrument_definition_message_t {
    bit<64> tradable_instrument_id;
    bit<64> instrument_id;
    bit<16> trading_venue;
    bit<32> business_days_to_expiry;
    bit<32> last_trading_date;
    bit<32> tick_size_id;
    bit<96> contract_code;
    bit<8> contract_type;
    bit<8> instrument_type;
    bit<24> trading_currency;
    bit<32> market_code;
    bit<96> market_segment_code;
    bit<16> product_code;
    bit<64> underlying_tradable_instrument_id;
    bit<32> settlement_date;
    bit<32> expiry_date;
    bit<8> option_type;
    bit<64> strike_price;
    bit<48> cfi_code;
    bit<96> isin;
    bit<8> trade_at_reference;
    bit<16> price_code;
    bit<48> prompt_date_label;
    bit<8> prompt_type;
    bit<32> option_strike_relative_position;
    bit<32> strategy_type_code;
    bit<16> remaining_records;
    bit<16> record_count;
    bit<32> strategy_leg_count;
}

header tradable_instrument_definition_message_definition_legs_t {
    bit<32> leg_number;
    bit<8> leg_buy_sell;
    bit<64> leg_ratio;
    bit<64> leg_delta_hedge_price;
    bit<64> leg_tradable_instrument_id;
}

header order_statistics_intraday_message_t {
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<16> trading_venue;
    bit<16> ring_session;
    bit<64> order_high;
    bit<64> order_low;
}

header refresh_complete_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> tradable_instrument_definition_message_definition_legs_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_messages_t packet_header_messages[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    instrument_definition_message_t instrument_definition_message[MAX_MESSAGES];
    tradable_instrument_definition_message_t tradable_instrument_definition_message[MAX_MESSAGES];
    tradable_instrument_definition_message_definition_legs_t tradable_instrument_definition_message_definition_legs[MAX_MESSAGES];
    order_statistics_intraday_message_t order_statistics_intraday_message[MAX_MESSAGES];
    refresh_complete_message_t refresh_complete_message[MAX_MESSAGES];
}

parser LmeselectNonelectronicrefdatasnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x2f01: parse_instrument_definition_message;
            16w0x3001: parse_tradable_instrument_definition_message;
            16w0x5e01: parse_order_statistics_intraday_message;
            16w0xcb00: parse_refresh_complete_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_instrument_definition_message {
        packet.extract(hdr.instrument_definition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_tradable_instrument_definition_message {
        packet.extract(hdr.tradable_instrument_definition_message.next);
        meta.dispatched = 1;
        meta.tradable_instrument_definition_message_definition_legs_remaining = hdr.tradable_instrument_definition_message.last.record_count;
        transition select(meta.tradable_instrument_definition_message_definition_legs_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_tradable_instrument_definition_message_definition_legs;
        }
    }

    state parse_tradable_instrument_definition_message_definition_legs {
        packet.extract(hdr.tradable_instrument_definition_message_definition_legs.next);
        meta.tradable_instrument_definition_message_definition_legs_remaining = meta.tradable_instrument_definition_message_definition_legs_remaining - 1;
        transition select(meta.tradable_instrument_definition_message_definition_legs_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_tradable_instrument_definition_message_definition_legs;
        }
    }

    state parse_order_statistics_intraday_message {
        packet.extract(hdr.order_statistics_intraday_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
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

control LmeselectNonelectronicrefdatasnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectNonelectronicrefdatasnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectNonelectronicrefdatasnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectNonelectronicrefdatasnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectNonelectronicrefdatasnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_messages);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.instrument_definition_message);
        packet.emit(hdr.tradable_instrument_definition_message);
        packet.emit(hdr.tradable_instrument_definition_message_definition_legs);
        packet.emit(hdr.order_statistics_intraday_message);
        packet.emit(hdr.refresh_complete_message);
    }
}

V1Switch(
    LmeselectNonelectronicrefdatasnapshotParser(),
    LmeselectNonelectronicrefdatasnapshotVerifyChecksum(),
    LmeselectNonelectronicrefdatasnapshotIngress(),
    LmeselectNonelectronicrefdatasnapshotEgress(),
    LmeselectNonelectronicrefdatasnapshotComputeChecksum(),
    LmeselectNonelectronicrefdatasnapshotDeparser()
) main;
