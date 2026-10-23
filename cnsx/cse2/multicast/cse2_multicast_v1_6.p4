// P4_16 (v1model) definition for: Cnsx Cse2 Multicast Mmd v1.6
// 
// Protocol:
//   Organization: Canadian Securities Exchange
//   Protocol: CSE2 Multicast Market Data Feed
//   Encoding: Multicast Market Data Feed
//   Version: 1.6
//   Date: 11/07/2025
//   Specification: CSE2_Multicast_Market_Data_Programmers_Guide_1.6.pdf
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

header block_header_t {
    bit<16> block_length;
    bit<8> block_number_of_messages;
    bit<32> block_start_sequence;
}

header block_header_message_t {
    bit<8> sub_length;
    bit<8> message_type;
}

header time_message_t {
    bit<32> second;
    bit<16> millisecond;
}

header system_event_message_t {
    bit<32> time_offset;
    bit<64> group;
    bit<8> event_code;
    bit<64> exchange_timestamp;
}

header symbol_directory_message_t {
    bit<32> time_offset;
    bit<96> symbol;
    bit<96> cusip;
    bit<120> sec_name;
    bit<24> currency;
    bit<64> stock_group;
    bit<64> listing;
    bit<64> expiry;
    bit<32> lot_size;
    bit<64> settlement_term;
    bit<8> listing_market;
    bit<32> previous_closing_price;
    bit<8> listing_tier;
    bit<160> market_maker_name;
    bit<96> market_maker_phone_number;
    bit<600> full_sec_name;
}

header symbol_dynamics_message_t {
    bit<32> time_offset;
    bit<96> symbol;
    bit<64> settlement_term;
    bit<8> gmf_setting;
    bit<64> gmf_volume;
    bit<8> anonymous_setting;
    bit<8> moc_eligible;
}

header trading_action_message_t {
    bit<32> time_offset;
    bit<96> symbol;
    bit<8> trading_state;
    bit<64> exchange_timestamp;
}

header add_order_message_t {
    bit<32> time_offset;
    bit<144> order_number;
    bit<8> order_verb;
    bit<32> quantity;
    bit<96> symbol;
    bit<32> price;
    bit<24> firm_id;
    bit<64> settlement_term;
    bit<8> odd_lot_flag;
    bit<64> exchange_timestamp;
    bit<64> priority_timestamp;
}

header order_executed_message_t {
    bit<32> time_offset;
    bit<144> order_number;
    bit<32> executed_quantity;
    bit<144> match_number;
    bit<64> exchange_timestamp;
}

header order_executed_with_price_message_t {
    bit<32> time_offset;
    bit<144> order_number;
    bit<32> executed_quantity;
    bit<144> match_number;
    bit<32> execution_price;
    bit<64> exchange_timestamp;
}

header trade_message_t {
    bit<32> time_offset;
    bit<32> executed_quantity;
    bit<96> symbol;
    bit<32> execution_price;
    bit<144> match_number;
    bit<24> firm_id;
    bit<24> contra_firm_id;
    bit<64> settlement_term;
    bit<8> trade_attribute;
    bit<8> cross_type;
    bit<8> odd_lot_flag;
    bit<8> sets_the_last_price;
    bit<64> exchange_timestamp;
    bit<8> opening_trade;
    bit<8> ccp_session_trade;
    bit<8> moc_trade_marker;
}

header broken_trade_message_t {
    bit<32> time_offset;
    bit<144> match_number;
    bit<8> reason;
    bit<64> exchange_timestamp;
}

header order_delete_message_t {
    bit<32> time_offset;
    bit<144> order_number;
    bit<64> exchange_timestamp;
}

header order_replace_message_t {
    bit<32> time_offset;
    bit<144> order_number;
    bit<32> quantity;
    bit<32> price;
    bit<64> exchange_timestamp;
}

header best_bid_offer_message_t {
    bit<32> time_offset;
    bit<96> symbol;
    bit<32> best_bid;
    bit<32> best_bid_size;
    bit<32> best_offer;
    bit<32> best_offer_size;
    bit<64> exchange_timestamp;
}

header closing_price_message_t {
    bit<32> time_offset;
    bit<96> symbol;
    bit<32> price;
}

header general_message_t {
    bit<32> time_offset;
    bit<1024> message_text;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    block_header_t block_header;
    block_header_message_t block_header_message[MAX_MESSAGES];
    time_message_t time_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    symbol_directory_message_t symbol_directory_message[MAX_MESSAGES];
    symbol_dynamics_message_t symbol_dynamics_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    best_bid_offer_message_t best_bid_offer_message[MAX_MESSAGES];
    closing_price_message_t closing_price_message[MAX_MESSAGES];
    general_message_t general_message[MAX_MESSAGES];
}

parser Cse2MulticastParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.block_header);
        transition select(hdr.block_header.block_number_of_messages) {
            8w0: parse_block_header_message_empty;
            default: parse_block_header_message;
        }
    }

    state parse_block_header_message {
        packet.extract(hdr.block_header_message.next);
        transition select(hdr.block_header_message.last.message_type) {
            8w0x54: parse_time_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_symbol_directory_message;
            8w0x4f: parse_symbol_dynamics_message;
            8w0x48: parse_trading_action_message;
            8w0x41: parse_add_order_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x50: parse_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x44: parse_order_delete_message;
            8w0x55: parse_order_replace_message;
            8w0x51: parse_best_bid_offer_message;
            8w0x46: parse_closing_price_message;
            8w0x47: parse_general_message;
            default: accept;
        }
    }

    state parse_time_message {
        packet.extract(hdr.time_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_symbol_directory_message {
        packet.extract(hdr.symbol_directory_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_symbol_dynamics_message {
        packet.extract(hdr.symbol_dynamics_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_order_replace_message {
        packet.extract(hdr.order_replace_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_best_bid_offer_message {
        packet.extract(hdr.best_bid_offer_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_closing_price_message {
        packet.extract(hdr.closing_price_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_general_message {
        packet.extract(hdr.general_message.next);
        meta.dispatched = 1;
        transition parse_block_header_message;
    }

    state parse_block_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control Cse2MulticastVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control Cse2MulticastIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control Cse2MulticastEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control Cse2MulticastComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control Cse2MulticastDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.block_header);
        packet.emit(hdr.block_header_message);
        packet.emit(hdr.time_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.symbol_directory_message);
        packet.emit(hdr.symbol_dynamics_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.best_bid_offer_message);
        packet.emit(hdr.closing_price_message);
        packet.emit(hdr.general_message);
    }
}

V1Switch(
    Cse2MulticastParser(),
    Cse2MulticastVerifyChecksum(),
    Cse2MulticastIngress(),
    Cse2MulticastEgress(),
    Cse2MulticastComputeChecksum(),
    Cse2MulticastDeparser()
) main;
