// P4_16 (v1model) definition for: Aquis AquisEquities Replay Amd v4.1
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Market Data Replay
//   Encoding: Aquis Market Data Protocol
//   Version: 4.1
//   Date: 1/1/2026
//   Specification: Unknown
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

header message_header_t {
    bit<8> msg_type;
    bit<8> msg_length;
    bit<32> seq_no;
}

header login_message_t {
    bit<80> username;
    bit<80> password;
}

header replay_request_message_t {
    bit<32> begin_seq_no;
    bit<32> end_seq_no;
}

header replay_response_message_t {
    bit<8> response_code;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    login_message_t login_message;
    replay_request_message_t replay_request_message;
    replay_response_message_t replay_response_message;
}

parser AquisequitiesReplayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w13: parse_login_message;
            8w14: parse_replay_request_message;
            8w15: parse_replay_response_message;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        transition accept;
    }

    state parse_replay_response_message {
        packet.extract(hdr.replay_response_message);
        transition accept;
    }

}

control AquisequitiesReplayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesReplayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AquisequitiesReplayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisequitiesReplayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesReplayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_response_message);
    }
}

V1Switch(
    AquisequitiesReplayParser(),
    AquisequitiesReplayVerifyChecksum(),
    AquisequitiesReplayIngress(),
    AquisequitiesReplayEgress(),
    AquisequitiesReplayComputeChecksum(),
    AquisequitiesReplayDeparser()
) main;
