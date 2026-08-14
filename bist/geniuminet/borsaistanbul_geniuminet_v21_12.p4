// P4_16 (v1model) definition for: Bist BorsaIstanbul GeniumInet Itch v21.12
// 
// Protocol:
//   Organization: Borsa İstanbul A.Ş.
//   Protocol: Genium Inet
//   Encoding: Itch
//   Version: 21.12
//   Date: 2/28/2025
//   Specification: bistech-itch-protocol-specification.pdf
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

header order_book_directory_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> isin;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> decimals_in_price;
    bit<16> decimals_in_nominal_value;
    bit<32> odd_lot_size;
    bit<32> round_lot_size;
    bit<32> block_lot_size;
    bit<64> nominal_value;
    bit<8> number_of_legs;
    bit<32> underlying_order_book_id;
    bit<32> strike_price;
    bit<32> expiration_date;
    bit<16> decimals_in_strike_price;
    bit<8> put_or_call;
    bit<8> ranking_type;
}

header combination_order_book_leg_t {
    bit<32> nanoseconds;
    bit<32> combination_order_book_id;
    bit<32> leg_order_book_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header tick_size_table_entry_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> tick_size;
    bit<32> price_from;
    bit<32> price_to;
}

header short_sell_status_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<8> short_sale_restriction;
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

header add_order_no_mpid_attribution_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> ranking_sequence_number;
    bit<64> quantity;
    bit<32> price;
    bit<13> reserved_13;
    bit<1> bait_implied_order;
    bit<2> reserved_2;
    bit<8> lot_type;
    bit<64> ranking_time;
}

header add_order_with_mpid_attribution_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> reserved_4;
    bit<64> quantity;
    bit<32> price;
    bit<13> reserved_13;
    bit<1> bait_implied_order;
    bit<2> reserved_2;
    bit<8> lot_type;
    bit<56> participant_id;
}

header order_executed_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<112> reserved_14;
}

header order_executed_with_price_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<112> reserved_14;
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
    bit<13> reserved_13;
    bit<1> bait_implied_order;
    bit<2> reserved_2;
}

header order_delete_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
}

header order_book_flush_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
}

header trade_message_t {
    bit<32> nanoseconds;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<8> side;
    bit<64> quantity;
    bit<32> order_book_id;
    bit<32> trade_price;
    bit<112> reserved_14;
    bit<8> printable;
    bit<8> occurred_at_cross;
}

header equilibrium_price_update_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> available_bid_quantity_at_equilibrium_price;
    bit<64> available_ask_quantity_at_equilibrium_price;
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
    order_book_directory_t order_book_directory[MAX_MESSAGES];
    combination_order_book_leg_t combination_order_book_leg[MAX_MESSAGES];
    tick_size_table_entry_t tick_size_table_entry[MAX_MESSAGES];
    short_sell_status_t short_sell_status[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    add_order_no_mpid_attribution_t add_order_no_mpid_attribution[MAX_MESSAGES];
    add_order_with_mpid_attribution_t add_order_with_mpid_attribution[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    order_book_flush_message_t order_book_flush_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    equilibrium_price_update_t equilibrium_price_update[MAX_MESSAGES];
}

parser BorsaistanbulGeniuminetParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_seconds_message;
            8w0x52: parse_order_book_directory;
            8w0x4d: parse_combination_order_book_leg;
            8w0x4c: parse_tick_size_table_entry;
            8w0x56: parse_short_sell_status;
            8w0x53: parse_system_event_message;
            8w0x4f: parse_order_book_state_message;
            8w0x41: parse_add_order_no_mpid_attribution;
            8w0x46: parse_add_order_with_mpid_attribution;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x55: parse_order_replace_message;
            8w0x44: parse_order_delete_message;
            8w0x59: parse_order_book_flush_message;
            8w0x50: parse_trade_message;
            8w0x5a: parse_equilibrium_price_update;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        transition parse_message;
    }

    state parse_order_book_directory {
        packet.extract(hdr.order_book_directory.next);
        transition parse_message;
    }

    state parse_combination_order_book_leg {
        packet.extract(hdr.combination_order_book_leg.next);
        transition parse_message;
    }

    state parse_tick_size_table_entry {
        packet.extract(hdr.tick_size_table_entry.next);
        transition parse_message;
    }

    state parse_short_sell_status {
        packet.extract(hdr.short_sell_status.next);
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

    state parse_add_order_no_mpid_attribution {
        packet.extract(hdr.add_order_no_mpid_attribution.next);
        transition parse_message;
    }

    state parse_add_order_with_mpid_attribution {
        packet.extract(hdr.add_order_with_mpid_attribution.next);
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

    state parse_order_book_flush_message {
        packet.extract(hdr.order_book_flush_message.next);
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        transition parse_message;
    }

    state parse_equilibrium_price_update {
        packet.extract(hdr.equilibrium_price_update.next);
        transition parse_message;
    }

}

control BorsaistanbulGeniuminetVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BorsaistanbulGeniuminetIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control BorsaistanbulGeniuminetEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BorsaistanbulGeniuminetComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BorsaistanbulGeniuminetDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory);
        packet.emit(hdr.combination_order_book_leg);
        packet.emit(hdr.tick_size_table_entry);
        packet.emit(hdr.short_sell_status);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.add_order_no_mpid_attribution);
        packet.emit(hdr.add_order_with_mpid_attribution);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_book_flush_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.equilibrium_price_update);
    }
}

V1Switch(
    BorsaistanbulGeniuminetParser(),
    BorsaistanbulGeniuminetVerifyChecksum(),
    BorsaistanbulGeniuminetIngress(),
    BorsaistanbulGeniuminetEgress(),
    BorsaistanbulGeniuminetComputeChecksum(),
    BorsaistanbulGeniuminetDeparser()
) main;
