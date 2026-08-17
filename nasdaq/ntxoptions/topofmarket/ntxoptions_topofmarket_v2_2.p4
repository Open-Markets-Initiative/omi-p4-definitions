// P4_16 (v1model) definition for: Nasdaq NtxOptions TopOfMarket Itch v2.2
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Top Of Market
//   Encoding: Itch
//   Version: 2.2
//   Date: 08/30/2024
//   Specification: Nasdaq_Texas_Options_Top_of_Market.pdf
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

header tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> packet_type;
}

header debug_packet_t {
    bit<8> text;
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

header system_event_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<8> event_code;
}

header derivative_directory_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<48> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_date;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<104> underlying_symbol;
    bit<8> closing_type;
    bit<8> tradable;
    bit<8> mpv;
    bit<96> isin;
    bit<16> tick_size_table_id;
    bit<8> price_notation;
    bit<8> volume_notation;
    bit<16> financial_product;
    bit<8> market_segment_id;
    bit<24> trading_currency;
    bit<32> mic;
    bit<128> instrument_long_name;
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

header best_bid_or_ask_update_short_form_message_t {
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

header best_bid_or_ask_update_long_form_message_t {
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

header trade_report_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> cross_id;
    bit<8> trade_condition;
    bit<32> price_long;
    bit<32> volume;
}

header broken_trade_report_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> original_cross_id;
    bit<32> original_price;
    bit<32> original_volume;
}

header end_of_replay_sequence_message_t {
    bit<160> end_of_replay_sequence_number;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_t {
    bit<8> unsequenced_message_type;
}

struct metadata_t {
}

struct headers_t {
    tcp_packet_header_t tcp_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    derivative_directory_message_t derivative_directory_message;
    trading_action_message_t trading_action_message;
    best_bid_and_ask_update_short_form_message_t best_bid_and_ask_update_short_form_message;
    best_bid_and_ask_update_long_form_message_t best_bid_and_ask_update_long_form_message;
    best_bid_or_ask_update_short_form_message_t best_bid_or_ask_update_short_form_message;
    best_bid_or_ask_update_long_form_message_t best_bid_or_ask_update_long_form_message;
    trade_report_message_t trade_report_message;
    broken_trade_report_message_t broken_trade_report_message;
    end_of_replay_sequence_message_t end_of_replay_sequence_message;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
}

parser NtxoptionsTopofmarketParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.tcp_packet_header);
        transition select(hdr.tcp_packet_header.packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_derivative_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x71: parse_best_bid_and_ask_update_short_form_message;
            8w0x51: parse_best_bid_and_ask_update_long_form_message;
            8w0x62: parse_best_bid_or_ask_update_short_form_message;
            8w0x42: parse_best_bid_or_ask_update_long_form_message;
            8w0x54: parse_trade_report_message;
            8w0x58: parse_broken_trade_report_message;
            8w0x4d: parse_end_of_replay_sequence_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_derivative_directory_message {
        packet.extract(hdr.derivative_directory_message);
        transition accept;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message);
        transition accept;
    }

    state parse_best_bid_and_ask_update_short_form_message {
        packet.extract(hdr.best_bid_and_ask_update_short_form_message);
        transition accept;
    }

    state parse_best_bid_and_ask_update_long_form_message {
        packet.extract(hdr.best_bid_and_ask_update_long_form_message);
        transition accept;
    }

    state parse_best_bid_or_ask_update_short_form_message {
        packet.extract(hdr.best_bid_or_ask_update_short_form_message);
        transition accept;
    }

    state parse_best_bid_or_ask_update_long_form_message {
        packet.extract(hdr.best_bid_or_ask_update_long_form_message);
        transition accept;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message);
        transition accept;
    }

    state parse_broken_trade_report_message {
        packet.extract(hdr.broken_trade_report_message);
        transition accept;
    }

    state parse_end_of_replay_sequence_message {
        packet.extract(hdr.end_of_replay_sequence_message);
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        transition accept;
    }

}

control NtxoptionsTopofmarketVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxoptionsTopofmarketIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NtxoptionsTopofmarketEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NtxoptionsTopofmarketComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxoptionsTopofmarketDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.tcp_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.derivative_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.best_bid_and_ask_update_short_form_message);
        packet.emit(hdr.best_bid_and_ask_update_long_form_message);
        packet.emit(hdr.best_bid_or_ask_update_short_form_message);
        packet.emit(hdr.best_bid_or_ask_update_long_form_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.broken_trade_report_message);
        packet.emit(hdr.end_of_replay_sequence_message);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
    }
}

V1Switch(
    NtxoptionsTopofmarketParser(),
    NtxoptionsTopofmarketVerifyChecksum(),
    NtxoptionsTopofmarketIngress(),
    NtxoptionsTopofmarketEgress(),
    NtxoptionsTopofmarketComputeChecksum(),
    NtxoptionsTopofmarketDeparser()
) main;
