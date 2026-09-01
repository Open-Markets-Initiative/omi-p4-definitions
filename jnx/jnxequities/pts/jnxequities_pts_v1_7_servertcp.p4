// P4_16 (v1model) definition for: Jnx JnxEquities Pts Itch v1.7
// 
// Protocol:
//   Organization: Japannext Securities
//   Protocol: Proprietary Trading System
//   Encoding: Itch
//   Version: 1.7
//   Date: 11/01/2023
//   Specification: Japannext_PTS_ITCH_Equities_v1.7.pdf
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

header seconds_message_t {
    bit<32> seconds;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<32> group;
    bit<8> system_event;
}

header price_tick_size_message_t {
    bit<32> nanoseconds;
    bit<32> price_tick_size_table_id;
    bit<32> price_tick_size;
    bit<32> price_start;
}

header orderbook_directory_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook_id;
    bit<96> orderbook_code;
    bit<32> group;
    bit<32> round_lot_size;
    bit<32> price_tick_size_table_id;
    bit<32> price_decimals;
    bit<32> upper_price_limit;
    bit<32> lower_price_limit;
}

header trading_state_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook_id;
    bit<32> group;
    bit<8> trading_state;
}

header short_selling_price_restriction_state_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook_id;
    bit<32> group;
    bit<8> short_selling_state;
}

header order_added_without_attributes_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> orderbook_id;
    bit<32> group;
    bit<32> price;
}

header order_added_with_attributes_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> orderbook_id;
    bit<32> group;
    bit<32> price;
    bit<32> attribution;
    bit<8> order_type;
}

header order_executed_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<32> executed_quantity;
    bit<64> match_number;
}

header order_deleted_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
}

header order_replaced_message_t {
    bit<32> nanoseconds;
    bit<64> original_order_number;
    bit<64> new_order_number;
    bit<32> quantity;
    bit<32> price;
}

struct metadata_t {
}

struct headers_t {
    server_tcp_packet_header_t server_tcp_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    seconds_message_t seconds_message;
    system_event_message_t system_event_message;
    price_tick_size_message_t price_tick_size_message;
    orderbook_directory_message_t orderbook_directory_message;
    trading_state_message_t trading_state_message;
    short_selling_price_restriction_state_message_t short_selling_price_restriction_state_message;
    order_added_without_attributes_message_t order_added_without_attributes_message;
    order_added_with_attributes_message_t order_added_with_attributes_message;
    order_executed_message_t order_executed_message;
    order_deleted_message_t order_deleted_message;
    order_replaced_message_t order_replaced_message;
}

parser JnxequitiesPtsServertcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x54: parse_seconds_message;
            8w0x53: parse_system_event_message;
            8w0x4c: parse_price_tick_size_message;
            8w0x52: parse_orderbook_directory_message;
            8w0x48: parse_trading_state_message;
            8w0x59: parse_short_selling_price_restriction_state_message;
            8w0x41: parse_order_added_without_attributes_message;
            8w0x46: parse_order_added_with_attributes_message;
            8w0x45: parse_order_executed_message;
            8w0x44: parse_order_deleted_message;
            8w0x55: parse_order_replaced_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message);
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_price_tick_size_message {
        packet.extract(hdr.price_tick_size_message);
        transition accept;
    }

    state parse_orderbook_directory_message {
        packet.extract(hdr.orderbook_directory_message);
        transition accept;
    }

    state parse_trading_state_message {
        packet.extract(hdr.trading_state_message);
        transition accept;
    }

    state parse_short_selling_price_restriction_state_message {
        packet.extract(hdr.short_selling_price_restriction_state_message);
        transition accept;
    }

    state parse_order_added_without_attributes_message {
        packet.extract(hdr.order_added_without_attributes_message);
        transition accept;
    }

    state parse_order_added_with_attributes_message {
        packet.extract(hdr.order_added_with_attributes_message);
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        transition accept;
    }

    state parse_order_deleted_message {
        packet.extract(hdr.order_deleted_message);
        transition accept;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        transition accept;
    }

}

control JnxequitiesPtsServertcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JnxequitiesPtsServertcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control JnxequitiesPtsServertcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control JnxequitiesPtsServertcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JnxequitiesPtsServertcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_tcp_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.price_tick_size_message);
        packet.emit(hdr.orderbook_directory_message);
        packet.emit(hdr.trading_state_message);
        packet.emit(hdr.short_selling_price_restriction_state_message);
        packet.emit(hdr.order_added_without_attributes_message);
        packet.emit(hdr.order_added_with_attributes_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_deleted_message);
        packet.emit(hdr.order_replaced_message);
    }
}

V1Switch(
    JnxequitiesPtsServertcpParser(),
    JnxequitiesPtsServertcpVerifyChecksum(),
    JnxequitiesPtsServertcpIngress(),
    JnxequitiesPtsServertcpEgress(),
    JnxequitiesPtsServertcpComputeChecksum(),
    JnxequitiesPtsServertcpDeparser()
) main;
