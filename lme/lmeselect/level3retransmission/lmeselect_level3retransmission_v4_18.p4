// P4_16 (v1model) definition for: Lme LmeSelect Level3Retransmission LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource Level3 Retransmission
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

header order_add_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> t_1;
    bit<64> t_2;
    bit<64> t_3;
    bit<64> tradable_instrument_id;
    bit<64> order_id;
    bit<8> buy_sell;
    bit<32> volume;
    bit<64> price;
    bit<32> order_book_position;
    bit<8> filler_string_1;
}

header order_amend_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> t_1;
    bit<64> t_2;
    bit<64> t_3;
    bit<64> tradable_instrument_id;
    bit<64> order_id;
    bit<8> buy_sell;
    bit<32> volume;
    bit<64> price;
    bit<32> order_book_position;
    bit<8> filler_string_1;
}

header order_cancel_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> t_1;
    bit<64> t_2;
    bit<64> t_3;
    bit<64> tradable_instrument_id;
    bit<64> order_id;
    bit<8> buy_sell;
    bit<8> filler_string_1;
}

header order_executed_message_t {
    bit<16> trading_venue;
    bit<64> time_of_event;
    bit<64> tradable_instrument_id;
    bit<64> price;
    bit<32> volume;
    bit<64> order_id;
    bit<64> match_id;
    bit<8> trade_cancel_flag;
    bit<8> sub_type_of_trade;
    bit<8> trade_buy_sell;
    bit<32> strategy_leg_count;
}

header order_executed_message_executed_legs_t {
    bit<64> leg_tradable_instrument_id;
    bit<8> leg_buy_sell;
    bit<64> leg_price;
    bit<32> leg_volume;
    bit<64> leg_match_id;
}

header logon_message_t {
    bit<96> username;
}

header logon_response_message_t {
    bit<8> session_status;
    bit<24> filler_string_3;
}

header retransmission_request_message_t {
    bit<16> channel_id;
    bit<16> filler_string_2;
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
}

header retransmission_response_message_t {
    bit<16> channel_id;
    bit<8> retrans_status;
    bit<8> filler_string_1;
    bit<32> begin_seq_num;
    bit<32> end_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> order_executed_message_executed_legs_remaining;
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
    order_add_message_t order_add_message[MAX_MESSAGES];
    order_amend_message_t order_amend_message[MAX_MESSAGES];
    order_cancel_message_t order_cancel_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_message_executed_legs_t order_executed_message_executed_legs[MAX_MESSAGES];
    logon_message_t logon_message[MAX_MESSAGES];
    logon_response_message_t logon_response_message[MAX_MESSAGES];
    retransmission_request_message_t retransmission_request_message[MAX_MESSAGES];
    retransmission_response_message_t retransmission_response_message[MAX_MESSAGES];
}

parser LmeselectLevel3retransmissionParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x4301: parse_order_add_message;
            16w0x4401: parse_order_amend_message;
            16w0x4501: parse_order_cancel_message;
            16w0x4601: parse_order_executed_message;
            16w0x6500: parse_logon_message;
            16w0x6600: parse_logon_response_message;
            16w0xc900: parse_retransmission_request_message;
            16w0xca00: parse_retransmission_response_message;
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

    state parse_order_add_message {
        packet.extract(hdr.order_add_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_amend_message {
        packet.extract(hdr.order_amend_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        meta.order_executed_message_executed_legs_remaining = hdr.order_executed_message.last.strategy_leg_count;
        transition select(meta.order_executed_message_executed_legs_remaining) {
            32w0: parse_packet_header_message;
            default: parse_order_executed_message_executed_legs;
        }
    }

    state parse_order_executed_message_executed_legs {
        packet.extract(hdr.order_executed_message_executed_legs.next);
        meta.order_executed_message_executed_legs_remaining = meta.order_executed_message_executed_legs_remaining - 1;
        transition select(meta.order_executed_message_executed_legs_remaining) {
            32w0: parse_packet_header_message;
            default: parse_order_executed_message_executed_legs;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_logon_response_message {
        packet.extract(hdr.logon_response_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_retransmission_request_message {
        packet.extract(hdr.retransmission_request_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_retransmission_response_message {
        packet.extract(hdr.retransmission_response_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectLevel3retransmissionVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectLevel3retransmissionIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectLevel3retransmissionEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectLevel3retransmissionComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectLevel3retransmissionDeparser(packet_out packet, in headers_t hdr) {
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
        packet.emit(hdr.order_add_message);
        packet.emit(hdr.order_amend_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_message_executed_legs);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logon_response_message);
        packet.emit(hdr.retransmission_request_message);
        packet.emit(hdr.retransmission_response_message);
    }
}

V1Switch(
    LmeselectLevel3retransmissionParser(),
    LmeselectLevel3retransmissionVerifyChecksum(),
    LmeselectLevel3retransmissionIngress(),
    LmeselectLevel3retransmissionEgress(),
    LmeselectLevel3retransmissionComputeChecksum(),
    LmeselectLevel3retransmissionDeparser()
) main;
