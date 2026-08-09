// P4_16 (v1model) definition for: Nasdaq IseOptions OrderFeed Itch v1.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Ise Order Feed Market Data
//   Encoding: Itch
//   Version: 1.1
//   Date: 08/23/2017
//   Specification: ISE-GEMX-MRX-Order-Feed-Specification_tcm5044-42717.pdf
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

header system_event_message_t {
    bit<48> timestamp;
    bit<8> event_code;
    bit<16> current_year;
    bit<8> current_month;
    bit<8> current_day;
    bit<8> version;
    bit<8> subversion;
}

header option_directory_message_t {
    bit<48> timestamp;
    bit<32> option_id;
    bit<48> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<64> strike_price;
    bit<8> option_type;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> trading_type;
    bit<16> contract_size;
    bit<8> option_closing_type;
    bit<8> tradable;
    bit<8> mpv;
    bit<8> closing_only;
}

header trading_action_message_t {
    bit<48> timestamp;
    bit<32> option_id;
    bit<8> current_trading_state;
}

header security_open_closed_message_t {
    bit<48> timestamp;
    bit<32> option_id;
    bit<8> open_state;
}

header opening_imbalance_message_t {
    bit<48> timestamp;
    bit<32> option_id;
    bit<32> paired_contracts;
    bit<8> imbalance_direction;
    bit<32> imbalance_price;
    bit<32> imbalance_volume;
}

header order_on_book_message_t {
    bit<48> timestamp;
    bit<32> option_id;
    bit<8> order_type;
    bit<8> side;
    bit<32> price;
    bit<32> size;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
}

header auction_message_t {
    bit<48> timestamp;
    bit<32> option_id;
    bit<32> auction_id;
    bit<8> order_type;
    bit<8> side;
    bit<32> price;
    bit<32> size;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
    bit<8> auction_event;
    bit<8> number_of_responses;
    bit<32> response_price;
    bit<32> response_size;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    option_directory_message_t option_directory_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    security_open_closed_message_t security_open_closed_message[MAX_MESSAGES];
    opening_imbalance_message_t opening_imbalance_message[MAX_MESSAGES];
    order_on_book_message_t order_on_book_message[MAX_MESSAGES];
    auction_message_t auction_message[MAX_MESSAGES];
}

parser IseoptionsOrderfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x44: parse_option_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x4f: parse_security_open_closed_message;
            8w0x4e: parse_opening_imbalance_message;
            8w0x42: parse_order_on_book_message;
            8w0x41: parse_auction_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_option_directory_message {
        packet.extract(hdr.option_directory_message.next);
        transition parse_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        transition parse_message;
    }

    state parse_security_open_closed_message {
        packet.extract(hdr.security_open_closed_message.next);
        transition parse_message;
    }

    state parse_opening_imbalance_message {
        packet.extract(hdr.opening_imbalance_message.next);
        transition parse_message;
    }

    state parse_order_on_book_message {
        packet.extract(hdr.order_on_book_message.next);
        transition parse_message;
    }

    state parse_auction_message {
        packet.extract(hdr.auction_message.next);
        transition parse_message;
    }

}

control IseoptionsOrderfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsOrderfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IseoptionsOrderfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IseoptionsOrderfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsOrderfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.option_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.security_open_closed_message);
        packet.emit(hdr.opening_imbalance_message);
        packet.emit(hdr.order_on_book_message);
        packet.emit(hdr.auction_message);
    }
}

V1Switch(
    IseoptionsOrderfeedParser(),
    IseoptionsOrderfeedVerifyChecksum(),
    IseoptionsOrderfeedIngress(),
    IseoptionsOrderfeedEgress(),
    IseoptionsOrderfeedComputeChecksum(),
    IseoptionsOrderfeedDeparser()
) main;
