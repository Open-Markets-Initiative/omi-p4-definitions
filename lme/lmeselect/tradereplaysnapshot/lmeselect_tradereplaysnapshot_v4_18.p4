// P4_16 (v1model) definition for: Lme LmeSelect TradeReplaySnapshot LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource TradeReplay Refresh
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

header refresh_complete_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> market_data_trade_message_trade_legs_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_messages_t packet_header_messages[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    market_data_trade_message_t market_data_trade_message[MAX_MESSAGES];
    market_data_trade_message_trade_legs_t market_data_trade_message_trade_legs[MAX_MESSAGES];
    refresh_complete_message_t refresh_complete_message[MAX_MESSAGES];
}

parser LmeselectTradereplaysnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x5501: parse_market_data_trade_message;
            16w0xcb00: parse_refresh_complete_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_market_data_trade_message {
        packet.extract(hdr.market_data_trade_message.next);
        meta.dispatched = 1;
        meta.market_data_trade_message_trade_legs_remaining = hdr.market_data_trade_message.last.record_count;
        transition select(meta.market_data_trade_message_trade_legs_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_market_data_trade_message_trade_legs;
        }
    }

    state parse_market_data_trade_message_trade_legs {
        packet.extract(hdr.market_data_trade_message_trade_legs.next);
        meta.market_data_trade_message_trade_legs_remaining = meta.market_data_trade_message_trade_legs_remaining - 1;
        transition select(meta.market_data_trade_message_trade_legs_remaining) {
            16w0: parse_packet_header_messages;
            default: parse_market_data_trade_message_trade_legs;
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

control LmeselectTradereplaysnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectTradereplaysnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectTradereplaysnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectTradereplaysnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectTradereplaysnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_messages);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.market_data_trade_message);
        packet.emit(hdr.market_data_trade_message_trade_legs);
        packet.emit(hdr.refresh_complete_message);
    }
}

V1Switch(
    LmeselectTradereplaysnapshotParser(),
    LmeselectTradereplaysnapshotVerifyChecksum(),
    LmeselectTradereplaysnapshotIngress(),
    LmeselectTradereplaysnapshotEgress(),
    LmeselectTradereplaysnapshotComputeChecksum(),
    LmeselectTradereplaysnapshotDeparser()
) main;
