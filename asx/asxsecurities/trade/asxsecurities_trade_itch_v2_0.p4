// P4_16 (v1model) definition for: Asx AsxSecurities Trade Itch v2.0
// 
// Protocol:
//   Organization: Australian Securities Exchange
//   Protocol: Asx Trade
//   Encoding: Itch
//   Version: 2.0
//   Date: 04/01/2015
//   Specification: asx_041177.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
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

header seconds_message_t {
    bit<32> second;
}

header order_book_directory_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> isin;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> number_of_decimals_in_price;
    bit<16> number_of_decimals_in_nominal_value;
    bit<32> odd_lot_size;
    bit<32> round_lot_size;
    bit<32> block_lot_size;
    bit<64> nominal_value;
}

header combination_order_book_directory_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> isin;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> number_of_decimals_in_price;
    bit<16> number_of_decimals_in_nominal_value;
    bit<32> odd_lot_size;
    bit<32> round_lot_size;
    bit<32> block_lot_size;
    bit<64> nominal_value;
    bit<256> leg_1_symbol;
    bit<8> leg_1_side;
    bit<32> leg_1_ratio;
    bit<256> leg_2_symbol;
    bit<8> leg_2_side;
    bit<32> leg_2_ratio;
    bit<256> leg_3_symbol;
    bit<8> leg_3_side;
    bit<32> leg_3_ratio;
    bit<256> leg_4_symbol;
    bit<8> leg_4_side;
    bit<32> leg_4_ratio;
}

header tick_size_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> tick_size;
    bit<32> price_from;
    bit<32> price_to;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<8> event_code;
}

header order_book_state_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<160> state_name;
}

header add_order_no_participant_id_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> order_book_position;
    bit<64> quantity;
    bit<32> price;
    bit<2> reserved_2_bits;
    bit<1> market_bid;
    bit<1> price_stabilisation;
    bit<1> reserved_bit;
    bit<1> undisclosed;
    bit<10> reserved_10_bits;
    bit<8> lot_type;
}

header add_order_participant_id_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> order_book_position;
    bit<64> quantity;
    bit<32> price;
    bit<2> reserved_2_bits;
    bit<1> market_bid;
    bit<1> price_stabilisation;
    bit<1> reserved_bit;
    bit<1> undisclosed;
    bit<10> reserved_10_bits;
    bit<8> lot_type;
    bit<56> participant_id;
}

header order_executed_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<96> match_id;
    bit<56> participant_id_owner;
    bit<56> participant_id_counterparty;
}

header order_executed_with_price_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<96> match_id;
    bit<56> participant_id_owner;
    bit<56> participant_id_counterparty;
    bit<32> trade_price;
    bit<8> occurred_at_cross;
    bit<8> printable;
}

header order_replace_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> new_order_book_position;
    bit<64> quantity;
    bit<32> price;
    bit<2> reserved_2_bits;
    bit<1> market_bid;
    bit<1> price_stabilisation;
    bit<1> reserved_bit;
    bit<1> undisclosed;
    bit<10> reserved_10_bits;
}

header order_delete_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
}

header trade_message_t {
    bit<32> nanoseconds;
    bit<96> match_id;
    bit<8> side;
    bit<64> quantity;
    bit<32> order_book_id;
    bit<32> trade_price;
    bit<56> participant_id_owner;
    bit<56> participant_id_counterparty;
    bit<8> printable;
    bit<8> occurred_at_cross;
}

header equilibrium_price_update_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> bid_quantity;
    bit<64> ask_quantity;
    bit<32> equilibrium_price;
    bit<32> best_bid_price;
    bit<32> best_ask_price;
    bit<64> best_bid_quantity;
    bit<64> best_ask_quantity;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    order_book_directory_message_t order_book_directory_message[MAX_MESSAGES];
    combination_order_book_directory_message_t combination_order_book_directory_message[MAX_MESSAGES];
    tick_size_message_t tick_size_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    add_order_no_participant_id_message_t add_order_no_participant_id_message[MAX_MESSAGES];
    add_order_participant_id_message_t add_order_participant_id_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    equilibrium_price_update_message_t equilibrium_price_update_message[MAX_MESSAGES];
}

parser AsxsecuritiesTradeParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_seconds_message;
            8w0x52: parse_order_book_directory_message;
            8w0x4d: parse_combination_order_book_directory_message;
            8w0x4c: parse_tick_size_message;
            8w0x53: parse_system_event_message;
            8w0x4f: parse_order_book_state_message;
            8w0x41: parse_add_order_no_participant_id_message;
            8w0x46: parse_add_order_participant_id_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x55: parse_order_replace_message;
            8w0x44: parse_order_delete_message;
            8w0x50: parse_trade_message;
            8w0x5a: parse_equilibrium_price_update_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        transition parse_message;
    }

    state parse_order_book_directory_message {
        packet.extract(hdr.order_book_directory_message.next);
        transition parse_message;
    }

    state parse_combination_order_book_directory_message {
        packet.extract(hdr.combination_order_book_directory_message.next);
        transition parse_message;
    }

    state parse_tick_size_message {
        packet.extract(hdr.tick_size_message.next);
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message.next);
        transition parse_message;
    }

    state parse_add_order_no_participant_id_message {
        packet.extract(hdr.add_order_no_participant_id_message.next);
        transition parse_message;
    }

    state parse_add_order_participant_id_message {
        packet.extract(hdr.add_order_participant_id_message.next);
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        transition parse_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        transition parse_message;
    }

    state parse_order_replace_message {
        packet.extract(hdr.order_replace_message.next);
        transition parse_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        transition parse_message;
    }

    state parse_equilibrium_price_update_message {
        packet.extract(hdr.equilibrium_price_update_message.next);
        transition parse_message;
    }

}

control AsxsecuritiesTradeVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxsecuritiesTradeIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AsxsecuritiesTradeEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsxsecuritiesTradeComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxsecuritiesTradeDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory_message);
        packet.emit(hdr.combination_order_book_directory_message);
        packet.emit(hdr.tick_size_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.add_order_no_participant_id_message);
        packet.emit(hdr.add_order_participant_id_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.equilibrium_price_update_message);
    }
}

V1Switch(
    AsxsecuritiesTradeParser(),
    AsxsecuritiesTradeVerifyChecksum(),
    AsxsecuritiesTradeIngress(),
    AsxsecuritiesTradeEgress(),
    AsxsecuritiesTradeComputeChecksum(),
    AsxsecuritiesTradeDeparser()
) main;
