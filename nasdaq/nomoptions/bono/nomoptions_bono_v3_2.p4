// P4_16 (v1model) definition for: Nasdaq NomOptions Bono Itch v3.2
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nom Binary Order Entry
//   Encoding: Itch
//   Version: 3.2
//   Date: 11/02/2017
//   Specification: http://www.nasdaqtrader.com/content/productsservices/trading/optionsmarket/BONO_spec.pdf
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

header timestamp_message_t {
    bit<32> second;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<8> event_code;
    bit<8> version;
    bit<8> subversion;
}

header options_directory_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<48> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<32> strike_price;
    bit<8> option_type;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> option_closing_type;
    bit<8> tradable;
    bit<8> mpv;
}

header trading_action_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> current_trading_state;
}

header security_open_closed_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> open_state;
}

header short_best_bid_and_ask_update_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> quote_condition;
    bit<16> bid_price_2;
    bit<16> bid_size_2;
    bit<16> ask_price_2;
    bit<16> ask_size_2;
}

header long_best_bid_and_ask_update_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> quote_condition;
    bit<32> bid_price_4;
    bit<32> bid_size_4;
    bit<32> ask_price_4;
    bit<32> ask_size_4;
}

header short_best_ask_update_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> quote_condition;
    bit<16> price_2;
    bit<16> size_2;
}

header short_best_bid_update_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> quote_condition;
    bit<16> price_2;
    bit<16> size_2;
}

header long_best_ask_update_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> quote_condition;
    bit<32> price_4;
    bit<32> size_4;
}

header long_best_bid_update_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> quote_condition;
    bit<32> price_4;
    bit<32> size_4;
}

header trade_report_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<32> cross_id;
    bit<8> trade_condition;
    bit<32> price_4;
    bit<32> volume;
}

header broken_trade_report_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<32> original_cross_id;
    bit<32> original_price;
    bit<32> original_volume;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    timestamp_message_t timestamp_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    options_directory_message_t options_directory_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    security_open_closed_message_t security_open_closed_message[MAX_MESSAGES];
    short_best_bid_and_ask_update_message_t short_best_bid_and_ask_update_message[MAX_MESSAGES];
    long_best_bid_and_ask_update_message_t long_best_bid_and_ask_update_message[MAX_MESSAGES];
    short_best_ask_update_message_t short_best_ask_update_message[MAX_MESSAGES];
    short_best_bid_update_message_t short_best_bid_update_message[MAX_MESSAGES];
    long_best_ask_update_message_t long_best_ask_update_message[MAX_MESSAGES];
    long_best_bid_update_message_t long_best_bid_update_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    broken_trade_report_message_t broken_trade_report_message[MAX_MESSAGES];
}

parser NomoptionsBonoParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_timestamp_message;
            8w0x53: parse_system_event_message;
            8w0x44: parse_options_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x4f: parse_security_open_closed_message;
            8w0x71: parse_short_best_bid_and_ask_update_message;
            8w0x51: parse_long_best_bid_and_ask_update_message;
            8w0x61: parse_short_best_ask_update_message;
            8w0x62: parse_short_best_bid_update_message;
            8w0x41: parse_long_best_ask_update_message;
            8w0x42: parse_long_best_bid_update_message;
            8w0x52: parse_trade_report_message;
            8w0x58: parse_broken_trade_report_message;
            default: accept;
        }
    }

    state parse_timestamp_message {
        packet.extract(hdr.timestamp_message.next);
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_options_directory_message {
        packet.extract(hdr.options_directory_message.next);
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

    state parse_short_best_bid_and_ask_update_message {
        packet.extract(hdr.short_best_bid_and_ask_update_message.next);
        transition parse_message;
    }

    state parse_long_best_bid_and_ask_update_message {
        packet.extract(hdr.long_best_bid_and_ask_update_message.next);
        transition parse_message;
    }

    state parse_short_best_ask_update_message {
        packet.extract(hdr.short_best_ask_update_message.next);
        transition parse_message;
    }

    state parse_short_best_bid_update_message {
        packet.extract(hdr.short_best_bid_update_message.next);
        transition parse_message;
    }

    state parse_long_best_ask_update_message {
        packet.extract(hdr.long_best_ask_update_message.next);
        transition parse_message;
    }

    state parse_long_best_bid_update_message {
        packet.extract(hdr.long_best_bid_update_message.next);
        transition parse_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        transition parse_message;
    }

    state parse_broken_trade_report_message {
        packet.extract(hdr.broken_trade_report_message.next);
        transition parse_message;
    }

}

control NomoptionsBonoVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsBonoIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NomoptionsBonoEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NomoptionsBonoComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsBonoDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.timestamp_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.options_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.security_open_closed_message);
        packet.emit(hdr.short_best_bid_and_ask_update_message);
        packet.emit(hdr.long_best_bid_and_ask_update_message);
        packet.emit(hdr.short_best_ask_update_message);
        packet.emit(hdr.short_best_bid_update_message);
        packet.emit(hdr.long_best_ask_update_message);
        packet.emit(hdr.long_best_bid_update_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.broken_trade_report_message);
    }
}

V1Switch(
    NomoptionsBonoParser(),
    NomoptionsBonoVerifyChecksum(),
    NomoptionsBonoIngress(),
    NomoptionsBonoEgress(),
    NomoptionsBonoComputeChecksum(),
    NomoptionsBonoDeparser()
) main;
