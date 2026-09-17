// P4_16 (v1model) definition for: Biva BivaEquities TotalView Itch v1.12
// 
// Protocol:
//   Organization: Bolsa Institucional de Valores
//   Protocol: Total View
//   Encoding: Itch
//   Version: 1.12
//   Date: 1/1/2022
//   Specification: BIVA_X-Stream_External_ITCH_Specification_v1.12.0.pdf
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

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header time_stamp_seconds_message_t {
    bit<32> second;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<64> group;
    bit<8> event_code;
    bit<32> orderbook;
}

header price_tick_size_message_t {
    bit<32> nanoseconds;
    bit<32> tick_size_table_id;
    bit<32> price_tick_size;
    bit<32> price_start;
}

header quantity_tick_size_message_t {
    bit<32> nanoseconds;
    bit<32> tick_size_table_id;
    bit<64> quantity_tick_size;
    bit<64> quantity_start;
}

header orderbook_directory_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook;
    bit<96> isin;
    bit<120> sec_code;
    bit<24> currency;
    bit<64> group;
    bit<64> minimum_quantity;
    bit<32> quantity_tick_size_table_id;
    bit<32> quantity_decimals;
    bit<32> price_tick_size_table_id;
    bit<32> price_decimals;
    bit<32> delisting_or_maturity_date;
    bit<32> delisting_time;
    bit<8> turnover_ratio;
    bit<24> quotation_basis;
    bit<96> instrument;
    bit<8> listing_type;
    bit<32> listing_exchange;
}

header participant_directory_message_t {
    bit<32> nanoseconds;
    bit<32> participant_id;
    bit<96> participant_code;
}

header orderbook_trading_action_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook;
    bit<8> trading_state;
    bit<8> trading_action_reason;
}

header orderbook_reference_price_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook;
    bit<32> reference_price;
    bit<8> price_type;
    bit<8> reference_price_reason;
}

header add_order_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<8> order_verb;
    bit<64> quantity;
    bit<32> orderbook;
    bit<32> price;
    bit<32> participant_id;
}

header order_executed_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<64> executed_quantity;
    bit<64> match_number;
    bit<8> trade_indicator;
    bit<8> stat_update;
    bit<32> aggressor_participant_id;
}

header order_executed_with_price_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<64> executed_quantity;
    bit<64> match_number;
    bit<8> trade_indicator;
    bit<8> printable;
    bit<32> execution_price;
    bit<8> stat_update;
    bit<32> counterparty_participant_id;
}

header trade_message_t {
    bit<32> nanoseconds;
    bit<64> executed_quantity;
    bit<32> orderbook;
    bit<8> printable;
    bit<32> execution_price;
    bit<64> match_number;
    bit<8> trade_indicator;
    bit<8> stat_update;
    bit<32> buy_participant_id;
    bit<32> sell_participant_id;
}

header broken_trade_message_t {
    bit<32> nanoseconds;
    bit<64> match_number;
    bit<8> broken_trade_reason;
}

header order_delete_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
}

header order_replace_message_t {
    bit<32> nanoseconds;
    bit<64> original_order_number;
    bit<64> new_order_number;
    bit<64> quantity;
    bit<32> price;
}

header indicative_price_quantity_message_t {
    bit<32> nanoseconds;
    bit<64> theoretical_opening_quantity;
    bit<32> orderbook;
    bit<32> best_bid;
    bit<32> best_offer;
    bit<32> theoretical_opening_price;
    bit<8> cross_type;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    time_stamp_seconds_message_t time_stamp_seconds_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    price_tick_size_message_t price_tick_size_message[MAX_MESSAGES];
    quantity_tick_size_message_t quantity_tick_size_message[MAX_MESSAGES];
    orderbook_directory_message_t orderbook_directory_message[MAX_MESSAGES];
    participant_directory_message_t participant_directory_message[MAX_MESSAGES];
    orderbook_trading_action_message_t orderbook_trading_action_message[MAX_MESSAGES];
    orderbook_reference_price_message_t orderbook_reference_price_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    indicative_price_quantity_message_t indicative_price_quantity_message[MAX_MESSAGES];
}

parser BivaequitiesTotalviewParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            16w65535: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_time_stamp_seconds_message;
            8w0x53: parse_system_event_message;
            8w0x4c: parse_price_tick_size_message;
            8w0x4d: parse_quantity_tick_size_message;
            8w0x52: parse_orderbook_directory_message;
            8w0x46: parse_participant_directory_message;
            8w0x48: parse_orderbook_trading_action_message;
            8w0x58: parse_orderbook_reference_price_message;
            8w0x41: parse_add_order_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x50: parse_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x44: parse_order_delete_message;
            8w0x55: parse_order_replace_message;
            8w0x49: parse_indicative_price_quantity_message;
            default: accept;
        }
    }

    state parse_time_stamp_seconds_message {
        packet.extract(hdr.time_stamp_seconds_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_price_tick_size_message {
        packet.extract(hdr.price_tick_size_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_quantity_tick_size_message {
        packet.extract(hdr.quantity_tick_size_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_orderbook_directory_message {
        packet.extract(hdr.orderbook_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_participant_directory_message {
        packet.extract(hdr.participant_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_orderbook_trading_action_message {
        packet.extract(hdr.orderbook_trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_orderbook_reference_price_message {
        packet.extract(hdr.orderbook_reference_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_replace_message {
        packet.extract(hdr.order_replace_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_indicative_price_quantity_message {
        packet.extract(hdr.indicative_price_quantity_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control BivaequitiesTotalviewVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesTotalviewIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BivaequitiesTotalviewEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BivaequitiesTotalviewComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesTotalviewDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.time_stamp_seconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.price_tick_size_message);
        packet.emit(hdr.quantity_tick_size_message);
        packet.emit(hdr.orderbook_directory_message);
        packet.emit(hdr.participant_directory_message);
        packet.emit(hdr.orderbook_trading_action_message);
        packet.emit(hdr.orderbook_reference_price_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.indicative_price_quantity_message);
    }
}

V1Switch(
    BivaequitiesTotalviewParser(),
    BivaequitiesTotalviewVerifyChecksum(),
    BivaequitiesTotalviewIngress(),
    BivaequitiesTotalviewEgress(),
    BivaequitiesTotalviewComputeChecksum(),
    BivaequitiesTotalviewDeparser()
) main;
