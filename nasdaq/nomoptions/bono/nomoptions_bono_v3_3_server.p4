// P4_16 (v1model) definition for: Nasdaq NomOptions Bono Itch v3.3
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nom Binary Order Entry
//   Encoding: Itch
//   Version: 3.3
//   Date: 04/22/2025
//   Specification: BONO_Spec_.pdf
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

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
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

header end_of_replay_sequence_message_t {
    bit<160> end_of_replay_sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    timestamp_message_t timestamp_message;
    system_event_message_t system_event_message;
    options_directory_message_t options_directory_message;
    trading_action_message_t trading_action_message;
    security_open_closed_message_t security_open_closed_message;
    short_best_bid_and_ask_update_message_t short_best_bid_and_ask_update_message;
    long_best_bid_and_ask_update_message_t long_best_bid_and_ask_update_message;
    short_best_ask_update_message_t short_best_ask_update_message;
    short_best_bid_update_message_t short_best_bid_update_message;
    long_best_ask_update_message_t long_best_ask_update_message;
    long_best_bid_update_message_t long_best_bid_update_message;
    trade_report_message_t trade_report_message;
    broken_trade_report_message_t broken_trade_report_message;
    end_of_replay_sequence_message_t end_of_replay_sequence_message;
}

parser NomoptionsBonoServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat_packet;
            8w0x5a: parse_end_of_session_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
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
            8w0x4d: parse_end_of_replay_sequence_message;
            default: accept;
        }
    }

    state parse_timestamp_message {
        packet.extract(hdr.timestamp_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_options_directory_message {
        packet.extract(hdr.options_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_open_closed_message {
        packet.extract(hdr.security_open_closed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_short_best_bid_and_ask_update_message {
        packet.extract(hdr.short_best_bid_and_ask_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_best_bid_and_ask_update_message {
        packet.extract(hdr.long_best_bid_and_ask_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_short_best_ask_update_message {
        packet.extract(hdr.short_best_ask_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_short_best_bid_update_message {
        packet.extract(hdr.short_best_bid_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_best_ask_update_message {
        packet.extract(hdr.long_best_ask_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_best_bid_update_message {
        packet.extract(hdr.long_best_bid_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broken_trade_report_message {
        packet.extract(hdr.broken_trade_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_replay_sequence_message {
        packet.extract(hdr.end_of_replay_sequence_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat_packet {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session_packet {
        meta.dispatched = 1;
        transition accept;
    }

}

control NomoptionsBonoServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsBonoServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NomoptionsBonoServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NomoptionsBonoServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsBonoServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
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
        packet.emit(hdr.end_of_replay_sequence_message);
    }
}

V1Switch(
    NomoptionsBonoServerParser(),
    NomoptionsBonoServerVerifyChecksum(),
    NomoptionsBonoServerIngress(),
    NomoptionsBonoServerEgress(),
    NomoptionsBonoServerComputeChecksum(),
    NomoptionsBonoServerDeparser()
) main;
