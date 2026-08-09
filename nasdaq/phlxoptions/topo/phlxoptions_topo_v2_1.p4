// P4_16 (v1model) definition for: Nasdaq PhlxOptions Topo Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Phlx Top Order Market Data
//   Encoding: Itch
//   Version: 2.1
//   Date: 02/13/2026
//   Specification: Options_Top_of_Market_Feed_2.1.pdf
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
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<8> event_code;
}

header derivative_directory_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<104> underlying_symbol;
    bit<8> closing_type;
    bit<8> tradable;
    bit<8> mpv;
    bit<128> reserved_16;
}

header trading_action_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> current_trading_state;
}

header best_bid_and_ask_update_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> quote_condition;
    bit<16> bid_market_order_size_short;
    bit<16> bid_price_short;
    bit<16> bid_size_short;
    bit<16> bid_cust_size_short;
    bit<16> bid_procust_size_short;
    bit<16> ask_market_order_size_short;
    bit<16> ask_price_short;
    bit<16> ask_size_short;
    bit<16> ask_cust_size_short;
    bit<16> ask_procust_size_short;
}

header best_bid_and_ask_update_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> quote_condition;
    bit<32> bid_market_order_size_long;
    bit<32> bid_price_long;
    bit<32> bid_size_long;
    bit<32> bid_cust_size_long;
    bit<32> bid_procust_size_long;
    bit<32> ask_market_order_size_long;
    bit<32> ask_price_long;
    bit<32> ask_size_long;
    bit<32> ask_cust_size_long;
    bit<32> ask_procust_size_long;
}

header best_bid_update_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> quote_condition;
    bit<16> market_order_size_short;
    bit<16> price_short;
    bit<16> size_short;
    bit<16> cust_size_short;
    bit<16> procust_size_short;
}

header best_ask_update_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> quote_condition;
    bit<16> market_order_size_short;
    bit<16> price_short;
    bit<16> size_short;
    bit<16> cust_size_short;
    bit<16> procust_size_short;
}

header best_bid_update_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> quote_condition;
    bit<32> market_order_size_long;
    bit<32> price_long;
    bit<32> size_long;
    bit<32> cust_size_long;
    bit<32> procust_size_long;
}

header best_ask_update_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<8> quote_condition;
    bit<32> market_order_size_long;
    bit<32> price_long;
    bit<32> size_long;
    bit<32> cust_size_long;
    bit<32> procust_size_long;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    derivative_directory_message_t derivative_directory_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    best_bid_and_ask_update_short_form_message_t best_bid_and_ask_update_short_form_message[MAX_MESSAGES];
    best_bid_and_ask_update_long_form_message_t best_bid_and_ask_update_long_form_message[MAX_MESSAGES];
    best_bid_update_short_form_message_t best_bid_update_short_form_message[MAX_MESSAGES];
    best_ask_update_short_form_message_t best_ask_update_short_form_message[MAX_MESSAGES];
    best_bid_update_long_form_message_t best_bid_update_long_form_message[MAX_MESSAGES];
    best_ask_update_long_form_message_t best_ask_update_long_form_message[MAX_MESSAGES];
}

parser PhlxoptionsTopoParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x6d: parse_derivative_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x71: parse_best_bid_and_ask_update_short_form_message;
            8w0x51: parse_best_bid_and_ask_update_long_form_message;
            8w0x62: parse_best_bid_update_short_form_message;
            8w0x61: parse_best_ask_update_short_form_message;
            8w0x42: parse_best_bid_update_long_form_message;
            8w0x41: parse_best_ask_update_long_form_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_derivative_directory_message {
        packet.extract(hdr.derivative_directory_message.next);
        transition parse_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        transition parse_message;
    }

    state parse_best_bid_and_ask_update_short_form_message {
        packet.extract(hdr.best_bid_and_ask_update_short_form_message.next);
        transition parse_message;
    }

    state parse_best_bid_and_ask_update_long_form_message {
        packet.extract(hdr.best_bid_and_ask_update_long_form_message.next);
        transition parse_message;
    }

    state parse_best_bid_update_short_form_message {
        packet.extract(hdr.best_bid_update_short_form_message.next);
        transition parse_message;
    }

    state parse_best_ask_update_short_form_message {
        packet.extract(hdr.best_ask_update_short_form_message.next);
        transition parse_message;
    }

    state parse_best_bid_update_long_form_message {
        packet.extract(hdr.best_bid_update_long_form_message.next);
        transition parse_message;
    }

    state parse_best_ask_update_long_form_message {
        packet.extract(hdr.best_ask_update_long_form_message.next);
        transition parse_message;
    }

}

control PhlxoptionsTopoVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsTopoIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PhlxoptionsTopoEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsTopoComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsTopoDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.derivative_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.best_bid_and_ask_update_short_form_message);
        packet.emit(hdr.best_bid_and_ask_update_long_form_message);
        packet.emit(hdr.best_bid_update_short_form_message);
        packet.emit(hdr.best_ask_update_short_form_message);
        packet.emit(hdr.best_bid_update_long_form_message);
        packet.emit(hdr.best_ask_update_long_form_message);
    }
}

V1Switch(
    PhlxoptionsTopoParser(),
    PhlxoptionsTopoVerifyChecksum(),
    PhlxoptionsTopoIngress(),
    PhlxoptionsTopoEgress(),
    PhlxoptionsTopoComputeChecksum(),
    PhlxoptionsTopoDeparser()
) main;
