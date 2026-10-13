// P4_16 (v1model) definition for: Lme LmeSelect ReferenceDataSnapshot LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource ReferenceData Refresh
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

header contract_definition_message_t {
    bit<16> trading_venue;
    bit<96> contract_code;
    bit<512> name;
    bit<8> contract_type;
    bit<16> product_code;
    bit<8> underlying_type;
    bit<96> underlying_contract_code;
    bit<24> trading_currency;
    bit<8> settlement_type;
    bit<8> settlement_pricing_method;
    bit<8> exercise_style;
    bit<160> lot_unit;
    bit<64> lot_size;
    bit<8> lot_size_type;
    bit<8> contract_price_type;
    bit<32> first_trading_date;
}

header outright_definition_message_t {
    bit<16> trading_venue;
    bit<64> tradable_instrument_id;
    bit<64> merged_tradable_instrument_id;
    bit<64> linked_tradable_instrument_id;
    bit<16> product_code;
    bit<8> contract_type;
    bit<24> trading_currency;
    bit<96> contract_code;
    bit<32> expiry_date;
    bit<8> prompt_type;
    bit<64> strike_price;
    bit<8> option_type;
    bit<8> exercise_style;
    bit<48> prompt_date_label;
    bit<16> price_code;
    bit<96> isin;
    bit<48> cfi_code;
    bit<32> market_code;
    bit<96> market_segment_code;
    bit<32> tick_size_id;
    bit<64> lot_size;
    bit<8> lot_size_type;
    bit<32> last_trading_date;
    bit<8> settlement_type;
    bit<8> settlement_pricing_method;
    bit<8> underlying_type;
}

header strategy_definition_message_t {
    bit<16> trading_venue;
    bit<64> tradable_instrument_id;
    bit<64> merged_tradable_instrument_id;
    bit<16> product_code;
    bit<8> contract_type;
    bit<24> trading_currency;
    bit<32> strategy_type_code;
    bit<96> contract_code;
    bit<8> exercise_style;
    bit<16> price_code;
    bit<32> market_code;
    bit<96> market_segment_code;
    bit<32> tick_size_id;
    bit<64> lot_size;
    bit<8> lot_size_type;
    bit<32> last_trading_date;
    bit<8> settlement_type;
    bit<8> settlement_pricing_method;
    bit<8> underlying_type;
    bit<32> strategy_leg_count;
}

header strategy_definition_message_strategy_legs_t {
    bit<32> leg_number;
    bit<8> leg_buy_sell;
    bit<64> leg_ratio;
    bit<64> leg_delta_hedge_price;
    bit<64> leg_tradable_instrument_id;
}

header price_limits_message_t {
    bit<64> tradable_instrument_id;
    bit<64> upper_price_limit;
    bit<64> lower_price_limit;
    bit<64> transaction_time;
}

header trade_statistics_end_of_day_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<64> open_price;
    bit<64> trade_high;
    bit<64> trade_low;
    bit<64> closing_price;
}

header refresh_complete_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> strategy_definition_message_strategy_legs_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    contract_definition_message_t contract_definition_message[MAX_MESSAGES];
    outright_definition_message_t outright_definition_message[MAX_MESSAGES];
    strategy_definition_message_t strategy_definition_message[MAX_MESSAGES];
    strategy_definition_message_strategy_legs_t strategy_definition_message_strategy_legs[MAX_MESSAGES];
    price_limits_message_t price_limits_message[MAX_MESSAGES];
    trade_statistics_end_of_day_message_t trade_statistics_end_of_day_message[MAX_MESSAGES];
    refresh_complete_message_t refresh_complete_message[MAX_MESSAGES];
}

parser LmeselectReferencedatasnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x2c01: parse_contract_definition_message;
            16w0x2d01: parse_outright_definition_message;
            16w0x2e01: parse_strategy_definition_message;
            16w0x3101: parse_price_limits_message;
            16w0x5f01: parse_trade_statistics_end_of_day_message;
            16w0xcb00: parse_refresh_complete_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_contract_definition_message {
        packet.extract(hdr.contract_definition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_outright_definition_message {
        packet.extract(hdr.outright_definition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_strategy_definition_message {
        packet.extract(hdr.strategy_definition_message.next);
        meta.dispatched = 1;
        meta.strategy_definition_message_strategy_legs_remaining = hdr.strategy_definition_message.last.strategy_leg_count;
        transition select(meta.strategy_definition_message_strategy_legs_remaining) {
            32w0: parse_packet_header_message;
            default: parse_strategy_definition_message_strategy_legs;
        }
    }

    state parse_strategy_definition_message_strategy_legs {
        packet.extract(hdr.strategy_definition_message_strategy_legs.next);
        meta.strategy_definition_message_strategy_legs_remaining = meta.strategy_definition_message_strategy_legs_remaining - 1;
        transition select(meta.strategy_definition_message_strategy_legs_remaining) {
            32w0: parse_packet_header_message;
            default: parse_strategy_definition_message_strategy_legs;
        }
    }

    state parse_price_limits_message {
        packet.extract(hdr.price_limits_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_statistics_end_of_day_message {
        packet.extract(hdr.trade_statistics_end_of_day_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_refresh_complete_message {
        packet.extract(hdr.refresh_complete_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectReferencedatasnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectReferencedatasnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectReferencedatasnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectReferencedatasnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectReferencedatasnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.contract_definition_message);
        packet.emit(hdr.outright_definition_message);
        packet.emit(hdr.strategy_definition_message);
        packet.emit(hdr.strategy_definition_message_strategy_legs);
        packet.emit(hdr.price_limits_message);
        packet.emit(hdr.trade_statistics_end_of_day_message);
        packet.emit(hdr.refresh_complete_message);
    }
}

V1Switch(
    LmeselectReferencedatasnapshotParser(),
    LmeselectReferencedatasnapshotVerifyChecksum(),
    LmeselectReferencedatasnapshotIngress(),
    LmeselectReferencedatasnapshotEgress(),
    LmeselectReferencedatasnapshotComputeChecksum(),
    LmeselectReferencedatasnapshotDeparser()
) main;
