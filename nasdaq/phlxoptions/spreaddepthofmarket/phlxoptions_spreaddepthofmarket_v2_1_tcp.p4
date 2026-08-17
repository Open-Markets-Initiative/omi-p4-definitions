// P4_16 (v1model) definition for: Nasdaq PhlxOptions SpreadDepthOfMarket Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Spread Depth
//   Encoding: Itch
//   Version: 2.1
//   Date: 09/15/2025
//   Specification: Options_Spread_Feed_2.1.pdf
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

header complex_strategy_directory_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> strategy_type;
    bit<104> underlying_symbol;
    bit<128> reserved_16;
    bit<8> number_of_legs;
    bit<32> option_id;
    bit<64> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> side;
    bit<32> leg_ratio;
}

header strategy_trading_action_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> current_trading_state;
}

header add_order_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<64> order_reference_number;
    bit<8> depth_side;
    bit<8> depth_order_capacity;
    bit<16> price_short;
    bit<16> volume_short;
    bit<8> scope;
    bit<24> reserved_3;
}

header add_order_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<64> order_reference_number;
    bit<8> depth_side;
    bit<8> depth_order_capacity;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> scope;
    bit<24> reserved_3;
}

header single_side_executed_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
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
    bit<32> strategy_id;
    bit<64> order_reference_number;
    bit<32> cross_number;
    bit<32> match_number;
    bit<8> reserved_1;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> trade_condition;
    bit<32> auction_id;
}

header single_side_replace_short_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<64> original_order_reference_number;
    bit<64> new_order_reference_number;
    bit<16> price_short;
    bit<16> volume_short;
    bit<8> order_type;
    bit<8> scope;
    bit<24> reserved_3;
}

header single_side_replace_long_form_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<64> original_order_reference_number;
    bit<64> new_order_reference_number;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> order_type;
    bit<8> scope;
    bit<24> reserved_3;
}

header single_side_delete_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id_order_reference;
    bit<64> order_reference_number;
}

header single_side_update_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<64> order_reference_number;
    bit<8> change_reason;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> order_type;
}

header complex_strategy_trade_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<32> cross_number;
    bit<32> match_number;
    bit<32> reserved_4;
    bit<8> cross_type;
    bit<32> price_long;
    bit<32> volume_long;
    bit<8> trade_condition;
    bit<32> auction_id;
    bit<8> reserved_1;
    bit<8> trade_type;
    bit<128> reserved_16;
}

header complex_strategy_auction_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> auction_duration;
    bit<8> auction_event;
    bit<8> order_type;
    bit<8> side;
    bit<32> price_long;
    bit<32> size;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<8> scope;
    bit<48> owner_id;
    bit<48> giveup;
    bit<48> cmta;
    bit<32> response_price;
    bit<32> response_size;
    bit<32> reserved_4;
    bit<8> number_of_flex_dac_legs;
    bit<64> reserved_8;
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
    complex_strategy_directory_message_t complex_strategy_directory_message;
    strategy_trading_action_message_t strategy_trading_action_message;
    add_order_short_form_message_t add_order_short_form_message;
    add_order_long_form_message_t add_order_long_form_message;
    single_side_executed_message_t single_side_executed_message;
    single_side_executed_with_price_message_t single_side_executed_with_price_message;
    single_side_replace_short_form_message_t single_side_replace_short_form_message;
    single_side_replace_long_form_message_t single_side_replace_long_form_message;
    single_side_delete_message_t single_side_delete_message;
    single_side_update_message_t single_side_update_message;
    complex_strategy_trade_message_t complex_strategy_trade_message;
    complex_strategy_auction_message_t complex_strategy_auction_message;
    end_of_replay_sequence_message_t end_of_replay_sequence_message;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
}

parser PhlxoptionsSpreaddepthofmarketTcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x73: parse_complex_strategy_directory_message;
            8w0x48: parse_strategy_trading_action_message;
            8w0x72: parse_add_order_short_form_message;
            8w0x6f: parse_add_order_long_form_message;
            8w0x74: parse_single_side_executed_message;
            8w0x54: parse_single_side_executed_with_price_message;
            8w0x69: parse_single_side_replace_short_form_message;
            8w0x49: parse_single_side_replace_long_form_message;
            8w0x44: parse_single_side_delete_message;
            8w0x50: parse_single_side_update_message;
            8w0x71: parse_complex_strategy_trade_message;
            8w0x61: parse_complex_strategy_auction_message;
            8w0x4d: parse_end_of_replay_sequence_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_complex_strategy_directory_message {
        packet.extract(hdr.complex_strategy_directory_message);
        transition accept;
    }

    state parse_strategy_trading_action_message {
        packet.extract(hdr.strategy_trading_action_message);
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

    state parse_single_side_executed_message {
        packet.extract(hdr.single_side_executed_message);
        transition accept;
    }

    state parse_single_side_executed_with_price_message {
        packet.extract(hdr.single_side_executed_with_price_message);
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

    state parse_complex_strategy_trade_message {
        packet.extract(hdr.complex_strategy_trade_message);
        transition accept;
    }

    state parse_complex_strategy_auction_message {
        packet.extract(hdr.complex_strategy_auction_message);
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

control PhlxoptionsSpreaddepthofmarketTcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsSpreaddepthofmarketTcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PhlxoptionsSpreaddepthofmarketTcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsSpreaddepthofmarketTcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsSpreaddepthofmarketTcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.tcp_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.complex_strategy_directory_message);
        packet.emit(hdr.strategy_trading_action_message);
        packet.emit(hdr.add_order_short_form_message);
        packet.emit(hdr.add_order_long_form_message);
        packet.emit(hdr.single_side_executed_message);
        packet.emit(hdr.single_side_executed_with_price_message);
        packet.emit(hdr.single_side_replace_short_form_message);
        packet.emit(hdr.single_side_replace_long_form_message);
        packet.emit(hdr.single_side_delete_message);
        packet.emit(hdr.single_side_update_message);
        packet.emit(hdr.complex_strategy_trade_message);
        packet.emit(hdr.complex_strategy_auction_message);
        packet.emit(hdr.end_of_replay_sequence_message);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
    }
}

V1Switch(
    PhlxoptionsSpreaddepthofmarketTcpParser(),
    PhlxoptionsSpreaddepthofmarketTcpVerifyChecksum(),
    PhlxoptionsSpreaddepthofmarketTcpIngress(),
    PhlxoptionsSpreaddepthofmarketTcpEgress(),
    PhlxoptionsSpreaddepthofmarketTcpComputeChecksum(),
    PhlxoptionsSpreaddepthofmarketTcpDeparser()
) main;
