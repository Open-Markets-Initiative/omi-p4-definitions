// P4_16 (v1model) definition for: Jpx TseEquities MarketByOrder Flex v1.1
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

header tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> packet_type;
}

header login_request_message_t {
    bit<48> user_id;
    bit<8> multicast_group_number;
    bit<8> number_of_system_reboots;
    bit<32> sequence_number;
    bit<24> requested_message_count;
}

header login_result_message_t {
    bit<8> multicast_group_number;
    bit<8> result_code;
}

header end_of_message_message_t {
    bit<8> multicast_group_number;
    bit<8> number_of_system_reboots;
    bit<32> next_sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    tcp_packet_header_t tcp_packet_header;
    login_request_message_t login_request_message;
    login_result_message_t login_result_message;
    end_of_message_message_t end_of_message_message;
}

parser JpxTseequitiesMarketbyorderTcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.tcp_packet_header);
        transition select(hdr.tcp_packet_header.packet_type) {
            8w0x52: parse_login_request_message;
            8w0x41: parse_login_result_message;
            8w0x53: parse_message_response_message;
            8w0x47: parse_end_of_message_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_result_message {
        packet.extract(hdr.login_result_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_response_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_message_message {
        packet.extract(hdr.end_of_message_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control JpxTseequitiesMarketbyorderTcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JpxTseequitiesMarketbyorderTcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control JpxTseequitiesMarketbyorderTcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control JpxTseequitiesMarketbyorderTcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JpxTseequitiesMarketbyorderTcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.tcp_packet_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.login_result_message);
        packet.emit(hdr.end_of_message_message);
    }
}

V1Switch(
    JpxTseequitiesMarketbyorderTcpParser(),
    JpxTseequitiesMarketbyorderTcpVerifyChecksum(),
    JpxTseequitiesMarketbyorderTcpIngress(),
    JpxTseequitiesMarketbyorderTcpEgress(),
    JpxTseequitiesMarketbyorderTcpComputeChecksum(),
    JpxTseequitiesMarketbyorderTcpDeparser()
) main;
