// P4_16 (v1model) definition for: Memx MemxEquities CommonHeader Tcp v1.2
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Common Header
//   Encoding: Transmission Control Protocol
//   Version: 1.2
//   Date: 2025-10-23
//   Specification: MEMX-TCP-v1_2.pdf
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

header common_header_t {
    bit<8> message_type;
    bit<16> message_length;
}

header login_request_message_t {
    bit<8> token_type;
    bit<8> token;
}

header replay_request_message_t {
    bit<64> session_id;
    bit<64> next_sequence_number;
    bit<32> count;
}

header replay_all_request_message_t {
    bit<64> session_id;
}

header stream_request_message_t {
    bit<64> session_id;
    bit<64> next_sequence_number;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    login_request_message_t login_request_message;
    replay_request_message_t replay_request_message;
    replay_all_request_message_t replay_all_request_message;
    stream_request_message_t stream_request_message;
}

parser MemxequitiesCommonheaderClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w100: parse_login_request_message;
            8w101: parse_replay_request_message;
            8w102: parse_replay_all_request_message;
            8w103: parse_stream_request_message;
            8w104: parse_unsequenced_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        transition accept;
    }

    state parse_replay_all_request_message {
        packet.extract(hdr.replay_all_request_message);
        transition accept;
    }

    state parse_stream_request_message {
        packet.extract(hdr.stream_request_message);
        transition accept;
    }

    state parse_unsequenced_message {
        transition accept;
    }

}

control MemxequitiesCommonheaderClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesCommonheaderClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxequitiesCommonheaderClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxequitiesCommonheaderClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesCommonheaderClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
    }
}

V1Switch(
    MemxequitiesCommonheaderClientParser(),
    MemxequitiesCommonheaderClientVerifyChecksum(),
    MemxequitiesCommonheaderClientIngress(),
    MemxequitiesCommonheaderClientEgress(),
    MemxequitiesCommonheaderClientComputeChecksum(),
    MemxequitiesCommonheaderClientDeparser()
) main;
