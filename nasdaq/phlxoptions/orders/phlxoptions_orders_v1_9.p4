// P4_16 (v1model) definition for: Nasdaq PhlxOptions Orders Itch v1.9
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: PHLX Orders
//   Encoding: Itch
//   Version: 1.9
//   Date: 08/10/2015
//   Specification: topoplusorders.pdf
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
    bit<32> sequence;
    bit<16> count;
}

header message_t {
    bit<16> length;
    bit<8> message_type;
}

header system_event_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> event_code;
    bit<8> version;
}

header options_directory_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> option_closing_type;
    bit<8> phlx_tradable;
}

header complex_order_strategy_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> strategy_id;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> action_;
    bit<8> number_of_legs;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> side;
    bit<32> leg_ratio;
}

header security_trading_action_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> current_trading_state;
}

header complex_trading_action_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> strategy_id;
    bit<8> current_trading_state;
}

header security_open_closed_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> open_state;
}

header strategy_open_closed_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> strategy_id;
    bit<8> open_state;
}

header simple_order_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<32> order_id;
    bit<8> side;
    bit<32> original_order_volume;
    bit<32> executable_order_volume;
    bit<8> order_status;
    bit<8> order_type;
    bit<8> market_qualifier;
    bit<32> limit_price;
    bit<8> all_or_none;
    bit<8> time_in_force;
    bit<8> customer_firm_indicator;
    bit<8> open_close_indicator;
}

header complex_order_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> strategy_id;
    bit<32> order_id;
    bit<8> side;
    bit<32> original_order_volume;
    bit<32> executable_order_volume;
    bit<8> order_status;
    bit<8> order_type;
    bit<32> limit_price;
    bit<8> debit_or_credit;
    bit<8> all_or_none;
    bit<8> time_in_force;
    bit<8> customer_firm_indicator;
    bit<104> underlying_symbol;
    bit<8> number_of_legs;
    bit<8> leg_open_close_indicator;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> side_2;
    bit<32> leg_ratio;
}

header auction_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<5> day;
    bit<4> month;
    bit<7> year;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> price;
    bit<8> auction_side;
    bit<32> matched_volume;
    bit<32> imbalance_volume;
    bit<32> reserved;
}

header complex_auction_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> strategy_id;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> price;
    bit<8> auction_side;
    bit<8> debit_or_credit;
    bit<32> volume;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    options_directory_message_t options_directory_message[MAX_MESSAGES];
    complex_order_strategy_message_t complex_order_strategy_message[MAX_MESSAGES];
    security_trading_action_message_t security_trading_action_message[MAX_MESSAGES];
    complex_trading_action_message_t complex_trading_action_message[MAX_MESSAGES];
    security_open_closed_message_t security_open_closed_message[MAX_MESSAGES];
    strategy_open_closed_message_t strategy_open_closed_message[MAX_MESSAGES];
    simple_order_message_t simple_order_message[MAX_MESSAGES];
    complex_order_message_t complex_order_message[MAX_MESSAGES];
    auction_notification_message_t auction_notification_message[MAX_MESSAGES];
    complex_auction_notification_message_t complex_auction_notification_message[MAX_MESSAGES];
}

parser PhlxoptionsOrdersParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x44: parse_options_directory_message;
            8w0x52: parse_complex_order_strategy_message;
            8w0x48: parse_security_trading_action_message;
            8w0x49: parse_complex_trading_action_message;
            8w0x50: parse_security_open_closed_message;
            8w0x51: parse_strategy_open_closed_message;
            8w0x4f: parse_simple_order_message;
            8w0x58: parse_complex_order_message;
            8w0x41: parse_auction_notification_message;
            8w0x43: parse_complex_auction_notification_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_options_directory_message {
        packet.extract(hdr.options_directory_message.next);
        transition parse_message;
    }

    state parse_complex_order_strategy_message {
        packet.extract(hdr.complex_order_strategy_message.next);
        transition parse_message;
    }

    state parse_security_trading_action_message {
        packet.extract(hdr.security_trading_action_message.next);
        transition parse_message;
    }

    state parse_complex_trading_action_message {
        packet.extract(hdr.complex_trading_action_message.next);
        transition parse_message;
    }

    state parse_security_open_closed_message {
        packet.extract(hdr.security_open_closed_message.next);
        transition parse_message;
    }

    state parse_strategy_open_closed_message {
        packet.extract(hdr.strategy_open_closed_message.next);
        transition parse_message;
    }

    state parse_simple_order_message {
        packet.extract(hdr.simple_order_message.next);
        transition parse_message;
    }

    state parse_complex_order_message {
        packet.extract(hdr.complex_order_message.next);
        transition parse_message;
    }

    state parse_auction_notification_message {
        packet.extract(hdr.auction_notification_message.next);
        transition parse_message;
    }

    state parse_complex_auction_notification_message {
        packet.extract(hdr.complex_auction_notification_message.next);
        transition parse_message;
    }

}

control PhlxoptionsOrdersVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsOrdersIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PhlxoptionsOrdersEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsOrdersComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsOrdersDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.options_directory_message);
        packet.emit(hdr.complex_order_strategy_message);
        packet.emit(hdr.security_trading_action_message);
        packet.emit(hdr.complex_trading_action_message);
        packet.emit(hdr.security_open_closed_message);
        packet.emit(hdr.strategy_open_closed_message);
        packet.emit(hdr.simple_order_message);
        packet.emit(hdr.complex_order_message);
        packet.emit(hdr.auction_notification_message);
        packet.emit(hdr.complex_auction_notification_message);
    }
}

V1Switch(
    PhlxoptionsOrdersParser(),
    PhlxoptionsOrdersVerifyChecksum(),
    PhlxoptionsOrdersIngress(),
    PhlxoptionsOrdersEgress(),
    PhlxoptionsOrdersComputeChecksum(),
    PhlxoptionsOrdersDeparser()
) main;
