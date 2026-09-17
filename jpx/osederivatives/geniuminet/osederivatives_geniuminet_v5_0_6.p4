// P4_16 (v1model) definition for: Jpx OseDerivatives GeniumInet Itch v5.0.6
// 
// Protocol:
//   Organization: Japan Exchange Group
//   Protocol: Genium Inet
//   Encoding: Itch
//   Version: 5.0.6
//   Date: 5/8/2024
//   Specification: ITCH_ProtSpec_OSE_va70.pdf
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

header seconds_message_t {
    bit<32> seconds;
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
    bit<32> underlying_orderbook_id;
    bit<32> strike_price;
    bit<32> expiration_date;
    bit<16> decimals_in_strike_price;
    bit<8> put_or_call;
}

header combination_orderbook_leg_t {
    bit<32> nanoseconds;
    bit<32> combination_orderbook_id;
    bit<32> leg_orderbook_id;
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

header system_event_message_t {
    bit<32> nanoseconds;
    bit<8> event_code;
}

header order_book_state_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<160> state_name;
}

header add_order_no_mpid_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> order_book_position;
    bit<64> quantity;
    bit<32> price;
    bit<10> unused;
    bit<1> undisclosed;
    bit<1> override_crossing;
    bit<1> price_stabilization;
    bit<1> market_bid;
    bit<1> short_sell;
    bit<1> force;
    bit<8> lot_type;
}

header add_order_with_mpid_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> order_book_position;
    bit<64> quantity;
    bit<32> price;
    bit<10> unused;
    bit<1> undisclosed;
    bit<1> override_crossing;
    bit<1> price_stabilization;
    bit<1> market_bid;
    bit<1> short_sell;
    bit<1> force;
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
    bit<56> participant_id_owner;
    bit<56> participant_id_counterparty;
}

header order_executed_with_price_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<56> owner_participant_id;
    bit<56> counterparty_participant_id;
    bit<32> trade_price;
    bit<8> occurred_at_cross;
    bit<8> printable;
}

header order_replace_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> new_orderbook_position;
    bit<64> quantity;
    bit<32> price;
    bit<10> unused;
    bit<1> undisclosed;
    bit<1> override_crossing;
    bit<1> price_stabilization;
    bit<1> market_bid;
    bit<1> short_sell;
    bit<1> force;
}

header order_delete_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
}

header trade_message_t {
    bit<32> nanoseconds;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<8> side;
    bit<64> quantity;
    bit<32> order_book_id;
    bit<32> trade_price;
    bit<56> owner_participant_id;
    bit<56> counterparty_participant_id;
    bit<8> printable;
    bit<8> occurred_at_cross;
}

header equilibrium_price_update_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> available_bid_quantity_at_equilibrium_price;
    bit<64> available_ask_quantity_at_equilibrium_price;
    bit<32> equilibrium_price;
    bit<192> reserved_24;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    order_book_directory_t order_book_directory[MAX_MESSAGES];
    combination_orderbook_leg_t combination_orderbook_leg[MAX_MESSAGES];
    tick_size_table_entry_t tick_size_table_entry[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    add_order_no_mpid_t add_order_no_mpid[MAX_MESSAGES];
    add_order_with_mpid_t add_order_with_mpid[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    equilibrium_price_update_t equilibrium_price_update[MAX_MESSAGES];
}

parser OsederivativesGeniuminetParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x54: parse_seconds_message;
            8w0x52: parse_order_book_directory;
            8w0x4d: parse_combination_orderbook_leg;
            8w0x4c: parse_tick_size_table_entry;
            8w0x53: parse_system_event_message;
            8w0x4f: parse_order_book_state_message;
            8w0x41: parse_add_order_no_mpid;
            8w0x46: parse_add_order_with_mpid;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x55: parse_order_replace_message;
            8w0x44: parse_order_delete_message;
            8w0x50: parse_trade_message;
            8w0x5a: parse_equilibrium_price_update;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_directory {
        packet.extract(hdr.order_book_directory.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_combination_orderbook_leg {
        packet.extract(hdr.combination_orderbook_leg.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_tick_size_table_entry {
        packet.extract(hdr.tick_size_table_entry.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_no_mpid {
        packet.extract(hdr.add_order_no_mpid.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_with_mpid {
        packet.extract(hdr.add_order_with_mpid.next);
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

    state parse_order_replace_message {
        packet.extract(hdr.order_replace_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_equilibrium_price_update {
        packet.extract(hdr.equilibrium_price_update.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control OsederivativesGeniuminetVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesGeniuminetIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control OsederivativesGeniuminetEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsederivativesGeniuminetComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesGeniuminetDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory);
        packet.emit(hdr.combination_orderbook_leg);
        packet.emit(hdr.tick_size_table_entry);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.add_order_no_mpid);
        packet.emit(hdr.add_order_with_mpid);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.equilibrium_price_update);
    }
}

V1Switch(
    OsederivativesGeniuminetParser(),
    OsederivativesGeniuminetVerifyChecksum(),
    OsederivativesGeniuminetIngress(),
    OsederivativesGeniuminetEgress(),
    OsederivativesGeniuminetComputeChecksum(),
    OsederivativesGeniuminetDeparser()
) main;
