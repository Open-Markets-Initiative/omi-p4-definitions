// P4_16 (v1model) definition for: Nasdaq GemxOptions DepthOfMarket Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Depth Of Market
//   Encoding: Itch
//   Version: 2.1
//   Date: 02/13/2026
//   Specification: Options_Depth_of_Market_Feed_2.1.pdf
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

header server_tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
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

header add_order_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<8> side;
    bit<8> order_capacity;
    bit<16> price_short;
    bit<16> volume_short;
    bit<32> reserved_4;
}

header add_order_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<8> side;
    bit<8> order_capacity;
    bit<32> price_long;
    bit<32> volume_long;
    bit<32> reserved_4;
}

header add_quote_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> bid_reference_number;
    bit<64> ask_reference_number;
    bit<16> bid_price_short;
    bit<16> bid_size_short;
    bit<16> ask_price_short;
    bit<16> ask_size_short;
}

header add_quote_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> bid_reference_number;
    bit<64> ask_reference_number;
    bit<32> bid_price_long;
    bit<32> bid_size_long;
    bit<32> ask_price_long;
    bit<32> ask_size_long;
}

header single_side_executed_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> strategy_id;
    bit<64> order_reference_number;
    bit<32> executed_volume;
    bit<8> trade_condition;
    bit<32> auction_id;
    bit<32> cross_number;
    bit<32> match_number;
}

header single_side_executed_with_price_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> strategy_id;
    bit<64> order_reference_number;
    bit<32> cross_number;
    bit<32> match_number;
    bit<8> printable;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> trade_condition;
    bit<32> auction_id;
}

header order_cancel_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<32> cancelled_volume;
}

header single_side_replace_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<64> new_reference_number;
    bit<16> price_short;
    bit<16> volume_short;
}

header single_side_replace_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<64> new_reference_number;
    bit<32> price_long;
    bit<32> volume_long;
}

header single_side_delete_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
}

header single_side_update_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> order_reference_number;
    bit<8> change_reason;
    bit<32> price_long;
    bit<32> volume_long;
}

header quote_replace_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> original_bid_reference_number;
    bit<64> bid_reference_number;
    bit<64> original_ask_reference_number;
    bit<64> ask_reference_number;
    bit<16> bid_price_short;
    bit<16> bid_size_short;
    bit<16> ask_price_short;
    bit<16> ask_size_short;
}

header quote_replace_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> original_bid_reference_number;
    bit<64> bid_reference_number;
    bit<64> original_ask_reference_number;
    bit<64> ask_reference_number;
    bit<32> bid_price_long;
    bit<32> bid_size_long;
    bit<32> ask_price_long;
    bit<32> ask_size_long;
}

header quote_delete_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<64> bid_reference_number;
    bit<64> ask_reference_number;
}

header trade_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> cross_number;
    bit<32> match_number;
    bit<32> strategy_id;
    bit<8> cross_type;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> trade_condition;
    bit<32> auction_id;
    bit<8> printable;
    bit<8> trade_type;
    bit<128> reserved_16;
}

header net_order_imbalance_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> instrument_id;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> paired_quantity;
    bit<8> side_imbalance_direction;
    bit<32> price_imbalance_price;
    bit<32> imbalance_volume;
    bit<8> order_capacity;
}

header end_of_replay_sequence_message_t {
    bit<160> end_of_replay_sequence_number;
}

struct metadata_t {
}

struct headers_t {
    server_tcp_packet_header_t server_tcp_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    derivative_directory_message_t derivative_directory_message;
    trading_action_message_t trading_action_message;
    add_order_short_form_message_t add_order_short_form_message;
    add_order_long_form_message_t add_order_long_form_message;
    add_quote_short_form_message_t add_quote_short_form_message;
    add_quote_long_form_message_t add_quote_long_form_message;
    single_side_executed_message_t single_side_executed_message;
    single_side_executed_with_price_message_t single_side_executed_with_price_message;
    order_cancel_message_t order_cancel_message;
    single_side_replace_short_form_message_t single_side_replace_short_form_message;
    single_side_replace_long_form_message_t single_side_replace_long_form_message;
    single_side_delete_message_t single_side_delete_message;
    single_side_update_message_t single_side_update_message;
    quote_replace_short_form_message_t quote_replace_short_form_message;
    quote_replace_long_form_message_t quote_replace_long_form_message;
    quote_delete_message_t quote_delete_message;
    trade_message_t trade_message;
    net_order_imbalance_message_t net_order_imbalance_message;
    end_of_replay_sequence_message_t end_of_replay_sequence_message;
}

parser GemxoptionsDepthofmarketServertcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_tcp_packet_header);
        transition select(hdr.server_tcp_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
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
            8w0x6d: parse_derivative_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x72: parse_add_order_short_form_message;
            8w0x6f: parse_add_order_long_form_message;
            8w0x6a: parse_add_quote_short_form_message;
            8w0x4a: parse_add_quote_long_form_message;
            8w0x65: parse_single_side_executed_message;
            8w0x63: parse_single_side_executed_with_price_message;
            8w0x58: parse_order_cancel_message;
            8w0x75: parse_single_side_replace_short_form_message;
            8w0x55: parse_single_side_replace_long_form_message;
            8w0x44: parse_single_side_delete_message;
            8w0x47: parse_single_side_update_message;
            8w0x6b: parse_quote_replace_short_form_message;
            8w0x4b: parse_quote_replace_long_form_message;
            8w0x59: parse_quote_delete_message;
            8w0x71: parse_trade_message;
            8w0x4f: parse_net_order_imbalance_message;
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

    state parse_add_order_short_form_message {
        packet.extract(hdr.add_order_short_form_message);
        transition accept;
    }

    state parse_add_order_long_form_message {
        packet.extract(hdr.add_order_long_form_message);
        transition accept;
    }

    state parse_add_quote_short_form_message {
        packet.extract(hdr.add_quote_short_form_message);
        transition accept;
    }

    state parse_add_quote_long_form_message {
        packet.extract(hdr.add_quote_long_form_message);
        transition accept;
    }

    state parse_single_side_executed_message {
        packet.extract(hdr.single_side_executed_message);
        transition accept;
    }

    state parse_single_side_executed_with_price_message {
        packet.extract(hdr.single_side_executed_with_price_message);
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        transition accept;
    }

    state parse_single_side_replace_short_form_message {
        packet.extract(hdr.single_side_replace_short_form_message);
        transition accept;
    }

    state parse_single_side_replace_long_form_message {
        packet.extract(hdr.single_side_replace_long_form_message);
        transition accept;
    }

    state parse_single_side_delete_message {
        packet.extract(hdr.single_side_delete_message);
        transition accept;
    }

    state parse_single_side_update_message {
        packet.extract(hdr.single_side_update_message);
        transition accept;
    }

    state parse_quote_replace_short_form_message {
        packet.extract(hdr.quote_replace_short_form_message);
        transition accept;
    }

    state parse_quote_replace_long_form_message {
        packet.extract(hdr.quote_replace_long_form_message);
        transition accept;
    }

    state parse_quote_delete_message {
        packet.extract(hdr.quote_delete_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_net_order_imbalance_message {
        packet.extract(hdr.net_order_imbalance_message);
        transition accept;
    }

    state parse_end_of_replay_sequence_message {
        packet.extract(hdr.end_of_replay_sequence_message);
        transition accept;
    }

}

control GemxoptionsDepthofmarketServertcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control GemxoptionsDepthofmarketServertcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control GemxoptionsDepthofmarketServertcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control GemxoptionsDepthofmarketServertcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control GemxoptionsDepthofmarketServertcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_tcp_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.derivative_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.add_order_short_form_message);
        packet.emit(hdr.add_order_long_form_message);
        packet.emit(hdr.add_quote_short_form_message);
        packet.emit(hdr.add_quote_long_form_message);
        packet.emit(hdr.single_side_executed_message);
        packet.emit(hdr.single_side_executed_with_price_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.single_side_replace_short_form_message);
        packet.emit(hdr.single_side_replace_long_form_message);
        packet.emit(hdr.single_side_delete_message);
        packet.emit(hdr.single_side_update_message);
        packet.emit(hdr.quote_replace_short_form_message);
        packet.emit(hdr.quote_replace_long_form_message);
        packet.emit(hdr.quote_delete_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.net_order_imbalance_message);
        packet.emit(hdr.end_of_replay_sequence_message);
    }
}

V1Switch(
    GemxoptionsDepthofmarketServertcpParser(),
    GemxoptionsDepthofmarketServertcpVerifyChecksum(),
    GemxoptionsDepthofmarketServertcpIngress(),
    GemxoptionsDepthofmarketServertcpEgress(),
    GemxoptionsDepthofmarketServertcpComputeChecksum(),
    GemxoptionsDepthofmarketServertcpDeparser()
) main;
