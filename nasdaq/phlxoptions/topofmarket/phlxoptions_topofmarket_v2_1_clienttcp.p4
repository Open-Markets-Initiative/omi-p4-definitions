// P4_16 (v1model) definition for: Nasdaq PhlxOptions TopOfMarket Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Top Of Market
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
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header client_tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header debug_packet_t {
    bit<8> text;
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
    client_tcp_packet_header_t client_tcp_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
}

parser PhlxoptionsTopofmarketClienttcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_tcp_packet_header);
        transition select(hdr.client_tcp_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
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

control PhlxoptionsTopofmarketClienttcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsTopofmarketClienttcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PhlxoptionsTopofmarketClienttcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsTopofmarketClienttcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsTopofmarketClienttcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_tcp_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
    }
}

V1Switch(
    PhlxoptionsTopofmarketClienttcpParser(),
    PhlxoptionsTopofmarketClienttcpVerifyChecksum(),
    PhlxoptionsTopofmarketClienttcpIngress(),
    PhlxoptionsTopofmarketClienttcpEgress(),
    PhlxoptionsTopofmarketClienttcpComputeChecksum(),
    PhlxoptionsTopofmarketClienttcpDeparser()
) main;
