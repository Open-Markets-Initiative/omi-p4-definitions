// P4_16 (v1model) definition for: Jpx SseEquities MarketByOrder Flex v1.1
// 
// Protocol:
//   Organization: Japan Exchange Group
//   Protocol: Market By Order
//   Encoding: Flex
//   Version: 1.1
//   Date: 11/20/2024
//   Specification: TSEarrowhead_FLEX_MarketbyOrderSpecifications_ver.1.1.pdf
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
    bit<8> multicast_group_number;
    bit<8> number_of_system_reboots;
    bit<32> sequence_number;
    bit<96> issue_code;
    bit<32> update_number;
    bit<8> packet_number;
    bit<8> total_number_of_packets;
    bit<8> utility_flag;
    bit<8> message_count;
}

header packet_header_message_t {
    bit<8> tag_length;
    bit<8> message_type;
}

header seconds_timestamp_message_t {
    bit<32> time_seconds;
}

header trading_status_message_t {
    bit<32> time_microseconds;
    bit<8> market_status;
    bit<16> status_flag;
    bit<8> short_selling_status;
    bit<8> pricing_method;
    bit<64> book_center_price;
}

header execution_summary_message_t {
    bit<32> time_microseconds;
    bit<8> triggered_side;
    bit<48> total_volume;
    bit<48> total_invalidation;
    bit<64> last_price;
    bit<32> match_id;
    bit<64> best_offer;
    bit<64> best_bid;
}

header add_order_message_t {
    bit<32> time_microseconds;
    bit<32> order_id;
    bit<8> side;
    bit<48> quantity;
    bit<64> price;
    bit<8> order_condition;
    bit<8> modification_flag;
}

header order_executed_message_t {
    bit<32> time_microseconds;
    bit<32> order_id;
    bit<8> side;
    bit<48> volume;
    bit<32> match_id;
}

header order_executed_with_price_message_t {
    bit<32> time_microseconds;
    bit<32> order_id;
    bit<8> side;
    bit<48> volume;
    bit<32> match_id;
    bit<64> execution_price;
    bit<8> adopted_pricing_method;
}

header order_delete_message_t {
    bit<32> time_microseconds;
    bit<32> order_id;
    bit<8> side;
    bit<8> modification_flag;
}

header reset_message_t {
    bit<8> reset_start_end_flag;
}

header communication_control_message_t {
    bit<8> test_mode_flag;
    bit<8> communication_start_end_flag;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    seconds_timestamp_message_t seconds_timestamp_message[MAX_MESSAGES];
    trading_status_message_t trading_status_message[MAX_MESSAGES];
    execution_summary_message_t execution_summary_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    reset_message_t reset_message[MAX_MESSAGES];
    communication_control_message_t communication_control_message[MAX_MESSAGES];
}

parser JpxSseequitiesMarketbyorderUdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            8w0: accept;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.message_type) {
            8w0x54: parse_seconds_timestamp_message;
            8w0x4f: parse_trading_status_message;
            8w0x4b: parse_execution_summary_message;
            8w0x41: parse_add_order_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x44: parse_order_delete_message;
            8w0x52: parse_reset_message;
            8w0x4c: parse_communication_control_message;
            default: accept;
        }
    }

    state parse_seconds_timestamp_message {
        packet.extract(hdr.seconds_timestamp_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trading_status_message {
        packet.extract(hdr.trading_status_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_execution_summary_message {
        packet.extract(hdr.execution_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_reset_message {
        packet.extract(hdr.reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_communication_control_message {
        packet.extract(hdr.communication_control_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

}

control JpxSseequitiesMarketbyorderUdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JpxSseequitiesMarketbyorderUdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control JpxSseequitiesMarketbyorderUdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control JpxSseequitiesMarketbyorderUdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JpxSseequitiesMarketbyorderUdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.seconds_timestamp_message);
        packet.emit(hdr.trading_status_message);
        packet.emit(hdr.execution_summary_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.reset_message);
        packet.emit(hdr.communication_control_message);
    }
}

V1Switch(
    JpxSseequitiesMarketbyorderUdpParser(),
    JpxSseequitiesMarketbyorderUdpVerifyChecksum(),
    JpxSseequitiesMarketbyorderUdpIngress(),
    JpxSseequitiesMarketbyorderUdpEgress(),
    JpxSseequitiesMarketbyorderUdpComputeChecksum(),
    JpxSseequitiesMarketbyorderUdpDeparser()
) main;
