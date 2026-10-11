// P4_16 (v1model) definition for: Nyse NyseBonds DepthOfBook Abp v4.01.b
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: DepthOfBook
//   Encoding: Arca Binary Protocol
//   Version: 4.01.b
//   Date: 10/13/2015
//   Specification: NYSE_Bonds_Depth_of_Book_Client_Spec.pdf
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

header client_message_header_t {
    bit<8> client_message_type;
}

header login_message_t {
    bit<64> username;
    bit<80> password;
    bit<80> login_sequence_number;
    bit<8> listed_subscription;
    bit<8> etf_subscription;
    bit<8> otc_subscription;
    bit<8> global_otc_subscription;
    bit<8> bond_subscription;
    bit<8> etx;
}

header logoff_message_t {
    bit<8> etx;
}

header heartbeat_response_message_t {
    bit<8> etx;
}

header test_request_message_t {
    bit<160> test_request_text;
    bit<8> etx;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_message_header_t client_message_header;
    login_message_t login_message;
    logoff_message_t logoff_message;
    heartbeat_response_message_t heartbeat_response_message;
    test_request_message_t test_request_message;
}

parser NysebondsDepthofbookClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_message_header);
        transition select(hdr.client_message_header.client_message_type) {
            8w0x4c: parse_login_message;
            8w0x4f: parse_logoff_message;
            8w0x48: parse_heartbeat_response_message;
            8w0x54: parse_test_request_message;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logoff_message {
        packet.extract(hdr.logoff_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_response_message {
        packet.extract(hdr.heartbeat_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test_request_message {
        packet.extract(hdr.test_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NysebondsDepthofbookClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsDepthofbookClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NysebondsDepthofbookClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NysebondsDepthofbookClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsDepthofbookClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_message_header);
        packet.emit(hdr.login_message);
        packet.emit(hdr.logoff_message);
        packet.emit(hdr.heartbeat_response_message);
        packet.emit(hdr.test_request_message);
    }
}

V1Switch(
    NysebondsDepthofbookClientParser(),
    NysebondsDepthofbookClientVerifyChecksum(),
    NysebondsDepthofbookClientIngress(),
    NysebondsDepthofbookClientEgress(),
    NysebondsDepthofbookClientComputeChecksum(),
    NysebondsDepthofbookClientDeparser()
) main;
