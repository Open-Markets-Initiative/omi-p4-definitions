// P4_16 (v1model) definition for: Tradelogiq TcpLevel1 Itch v1.01
// 
// Protocol:
//   Organization: Tradelogiq Markets Inc.
//   Protocol: Lynx Tcp Level 1
//   Encoding: Itch
//   Version: 1.01
//   Date: 01/30/2022
//   Specification: TradelogiQ-Level-1-ITCH-5.0-Specification-v1.01.pdf
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_unsequenced_message_t {
    varbit<2048> unsequenced_message;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_unsequenced_message_t unsequenced_data_packet_unsequenced_message;
}

parser LynxatsTcplevel1ClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat;
            8w0x4f: parse_logout_request;
            default: accept;
        }
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        meta.dispatched = 1;
        packet.extract(hdr.unsequenced_data_packet_unsequenced_message, (bit<32>)hdr.client_packet_header.packet_length * 8);
        transition accept;
    }

    state parse_client_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        meta.dispatched = 1;
        transition accept;
    }

}

control LynxatsTcplevel1ClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LynxatsTcplevel1ClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LynxatsTcplevel1ClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LynxatsTcplevel1ClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LynxatsTcplevel1ClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet_unsequenced_message);
    }
}

V1Switch(
    LynxatsTcplevel1ClientParser(),
    LynxatsTcplevel1ClientVerifyChecksum(),
    LynxatsTcplevel1ClientIngress(),
    LynxatsTcplevel1ClientEgress(),
    LynxatsTcplevel1ClientComputeChecksum(),
    LynxatsTcplevel1ClientDeparser()
) main;
