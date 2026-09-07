// P4_16 (v1model) definition for: Nasdaq IseOptions OrderComboFeed Itch v1.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Ise Order Combo Market Data Feed
//   Encoding: Itch
//   Version: 1.1
//   Date: 06/13/2017
//   Specification: ISEOrderComboFeedSpecification_tcm5044-41354.pdf
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

header system_event_message_t {
    bit<48> timestamp;
    bit<8> event_code;
    bit<16> current_year;
    bit<8> current_month;
    bit<8> current_day;
    bit<8> version;
    bit<8> subversion;
}

header complex_strategy_directory_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> strategy_type;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> number_of_legs;
}

header complex_strategy_directory_message_leg_information_t {
    bit<32> option_id;
    bit<48> security_symbol;
    bit<8> leg_id;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<64> explicit_strike_price;
    bit<8> option_type;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header strategy_trading_action_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> current_trading_state;
}

header strategy_open_closed_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> open_state;
}

header complex_strategy_order_on_book_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> order_type;
    bit<8> side;
    bit<32> price;
    bit<32> size;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<8> scope;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
}

header complex_strategy_auction_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<32> auction_id;
    bit<8> order_type;
    bit<8> side;
    bit<32> price;
    bit<32> size;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<8> scope;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
    bit<8> auction_event;
    bit<8> auction_type;
    bit<8> number_of_responses;
}

header complex_strategy_auction_message_auction_response_t {
    bit<32> response_price;
    bit<32> response_size;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> complex_strategy_directory_message_leg_information_remaining;
    bit<8> complex_strategy_auction_message_auction_response_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    complex_strategy_directory_message_t complex_strategy_directory_message[MAX_MESSAGES];
    complex_strategy_directory_message_leg_information_t complex_strategy_directory_message_leg_information[MAX_MESSAGES];
    strategy_trading_action_message_t strategy_trading_action_message[MAX_MESSAGES];
    strategy_open_closed_message_t strategy_open_closed_message[MAX_MESSAGES];
    complex_strategy_order_on_book_message_t complex_strategy_order_on_book_message[MAX_MESSAGES];
    complex_strategy_auction_message_t complex_strategy_auction_message[MAX_MESSAGES];
    complex_strategy_auction_message_auction_response_t complex_strategy_auction_message_auction_response[MAX_MESSAGES];
}

parser IseoptionsOrdercombofeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_complex_strategy_directory_message;
            8w0x48: parse_strategy_trading_action_message;
            8w0x4f: parse_strategy_open_closed_message;
            8w0x4c: parse_complex_strategy_order_on_book_message;
            8w0x4a: parse_complex_strategy_auction_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_complex_strategy_directory_message {
        packet.extract(hdr.complex_strategy_directory_message.next);
        meta.dispatched = 1;
        meta.complex_strategy_directory_message_leg_information_remaining = hdr.complex_strategy_directory_message.last.number_of_legs;
        transition select(meta.complex_strategy_directory_message_leg_information_remaining) {
            8w0: parse_message;
            default: parse_complex_strategy_directory_message_leg_information;
        }
    }

    state parse_complex_strategy_directory_message_leg_information {
        packet.extract(hdr.complex_strategy_directory_message_leg_information.next);
        meta.complex_strategy_directory_message_leg_information_remaining = meta.complex_strategy_directory_message_leg_information_remaining - 1;
        transition select(meta.complex_strategy_directory_message_leg_information_remaining) {
            8w0: parse_message;
            default: parse_complex_strategy_directory_message_leg_information;
        }
    }

    state parse_strategy_trading_action_message {
        packet.extract(hdr.strategy_trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_strategy_open_closed_message {
        packet.extract(hdr.strategy_open_closed_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_complex_strategy_order_on_book_message {
        packet.extract(hdr.complex_strategy_order_on_book_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_complex_strategy_auction_message {
        packet.extract(hdr.complex_strategy_auction_message.next);
        meta.dispatched = 1;
        meta.complex_strategy_auction_message_auction_response_remaining = hdr.complex_strategy_auction_message.last.number_of_responses;
        transition select(meta.complex_strategy_auction_message_auction_response_remaining) {
            8w0: parse_message;
            default: parse_complex_strategy_auction_message_auction_response;
        }
    }

    state parse_complex_strategy_auction_message_auction_response {
        packet.extract(hdr.complex_strategy_auction_message_auction_response.next);
        meta.complex_strategy_auction_message_auction_response_remaining = meta.complex_strategy_auction_message_auction_response_remaining - 1;
        transition select(meta.complex_strategy_auction_message_auction_response_remaining) {
            8w0: parse_message;
            default: parse_complex_strategy_auction_message_auction_response;
        }
    }

}

control IseoptionsOrdercombofeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsOrdercombofeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IseoptionsOrdercombofeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IseoptionsOrdercombofeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsOrdercombofeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.complex_strategy_directory_message);
        packet.emit(hdr.complex_strategy_directory_message_leg_information);
        packet.emit(hdr.strategy_trading_action_message);
        packet.emit(hdr.strategy_open_closed_message);
        packet.emit(hdr.complex_strategy_order_on_book_message);
        packet.emit(hdr.complex_strategy_auction_message);
        packet.emit(hdr.complex_strategy_auction_message_auction_response);
    }
}

V1Switch(
    IseoptionsOrdercombofeedParser(),
    IseoptionsOrdercombofeedVerifyChecksum(),
    IseoptionsOrdercombofeedIngress(),
    IseoptionsOrdercombofeedEgress(),
    IseoptionsOrdercombofeedComputeChecksum(),
    IseoptionsOrdercombofeedDeparser()
) main;
