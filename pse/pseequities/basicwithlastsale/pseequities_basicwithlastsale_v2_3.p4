// P4_16 (v1model) definition for: Pse PseEquities BasicWithLastSale Itch v2.3
// 
// Protocol:
//   Organization: Philippine Stock Exchange
//   Protocol: Pse Equities Itch Basic With Last Sale
//   Encoding: Itch
//   Version: 2.3
//   Date: 10/5/2018
//   Specification: PSE_Equities_Feed_Specification_v2.3.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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
    bit<32> timestamp;
    bit<64> group;
    bit<8> event_code;
    bit<32> orderbook;
}

header trading_schedule_message_t {
    bit<32> timestamp;
    bit<64> group;
    bit<8> event_code;
    bit<32> orderbook;
    bit<32> scheduled_time;
}

header price_tick_size_message_t {
    bit<32> timestamp;
    bit<32> tick_size_table_id;
    bit<32> tick_size_integer_4;
    bit<32> price_start;
}

header quantity_tick_size_message_t {
    bit<32> timestamp;
    bit<32> tick_size_table_id;
    bit<64> tick_size_integer_8;
    bit<64> quantity_start;
}

header orderbook_directory_message_t {
    bit<32> timestamp;
    bit<32> orderbook;
    bit<8> price_type;
    bit<96> isin;
    bit<96> sec_code;
    bit<24> currency;
    bit<64> group;
    bit<64> lot_size;
    bit<32> quantity_tick_size_table_id;
    bit<32> price_tick_size_table_id;
    bit<32> price_decimals;
    bit<32> delisting_date;
    bit<32> delisting_time;
    bit<8> instrument_type;
    bit<64> shares;
    bit<64> product_code;
}

header orderbook_restrictions_message_t {
    bit<32> timestamp;
    bit<32> orderbook;
    bit<8> short_sell_eligible;
    bit<32> high_collar;
    bit<32> low_collar;
    bit<32> cb_limit_up;
    bit<32> cb_limit_down;
    bit<32> cb_limit_decimals;
}

header orderbook_trading_action_message_t {
    bit<32> timestamp;
    bit<32> orderbook;
    bit<8> trading_state;
    bit<8> reason;
}

header trade_message_t {
    bit<32> timestamp;
    bit<64> executed_quantity;
    bit<32> orderbook;
    bit<8> printable;
    bit<32> execution_price;
    bit<64> match_number;
    bit<8> trade_indicator;
}

header trade_with_broker_id_message_t {
    bit<32> timestamp;
    bit<64> executed_quantity;
    bit<32> orderbook;
    bit<8> printable;
    bit<32> execution_price;
    bit<64> match_number;
    bit<8> trade_indicator;
    bit<32> buy_broker_id;
    bit<32> sell_broker_id;
}

header bbo_quotation_message_t {
    bit<32> timestamp;
    bit<32> orderbook;
    bit<32> best_bid_price;
    bit<64> best_bid_size;
    bit<32> best_offer_price;
    bit<64> best_offer_size;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    time_stamp_seconds_message_t time_stamp_seconds_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    trading_schedule_message_t trading_schedule_message[MAX_MESSAGES];
    price_tick_size_message_t price_tick_size_message[MAX_MESSAGES];
    quantity_tick_size_message_t quantity_tick_size_message[MAX_MESSAGES];
    orderbook_directory_message_t orderbook_directory_message[MAX_MESSAGES];
    orderbook_restrictions_message_t orderbook_restrictions_message[MAX_MESSAGES];
    orderbook_trading_action_message_t orderbook_trading_action_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    trade_with_broker_id_message_t trade_with_broker_id_message[MAX_MESSAGES];
    bbo_quotation_message_t bbo_quotation_message[MAX_MESSAGES];
}

parser PseequitiesBasicwithlastsaleParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x73: parse_trading_schedule_message;
            8w0x4c: parse_price_tick_size_message;
            8w0x4d: parse_quantity_tick_size_message;
            8w0x52: parse_orderbook_directory_message;
            8w0x6b: parse_orderbook_restrictions_message;
            8w0x48: parse_orderbook_trading_action_message;
            8w0x50: parse_trade_message;
            8w0x70: parse_trade_with_broker_id_message;
            8w0x4f: parse_bbo_quotation_message;
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

    state parse_trading_schedule_message {
        packet.extract(hdr.trading_schedule_message.next);
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

    state parse_orderbook_restrictions_message {
        packet.extract(hdr.orderbook_restrictions_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_orderbook_trading_action_message {
        packet.extract(hdr.orderbook_trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_with_broker_id_message {
        packet.extract(hdr.trade_with_broker_id_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_bbo_quotation_message {
        packet.extract(hdr.bbo_quotation_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control PseequitiesBasicwithlastsaleVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PseequitiesBasicwithlastsaleIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control PseequitiesBasicwithlastsaleEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PseequitiesBasicwithlastsaleComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PseequitiesBasicwithlastsaleDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.time_stamp_seconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.trading_schedule_message);
        packet.emit(hdr.price_tick_size_message);
        packet.emit(hdr.quantity_tick_size_message);
        packet.emit(hdr.orderbook_directory_message);
        packet.emit(hdr.orderbook_restrictions_message);
        packet.emit(hdr.orderbook_trading_action_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_with_broker_id_message);
        packet.emit(hdr.bbo_quotation_message);
    }
}

V1Switch(
    PseequitiesBasicwithlastsaleParser(),
    PseequitiesBasicwithlastsaleVerifyChecksum(),
    PseequitiesBasicwithlastsaleIngress(),
    PseequitiesBasicwithlastsaleEgress(),
    PseequitiesBasicwithlastsaleComputeChecksum(),
    PseequitiesBasicwithlastsaleDeparser()
) main;
