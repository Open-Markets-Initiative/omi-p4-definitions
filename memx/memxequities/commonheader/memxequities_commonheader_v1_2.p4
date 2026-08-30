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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
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

header login_accepted_message_t {
    bit<8> supported_request_mode;
}

header login_rejected_message_t {
    bit<8> login_reject_code;
}

header start_of_session_message_t {
    bit<64> session_id;
}

header replay_begin_message_t {
    bit<64> next_sequence_number;
    bit<32> pending_message_count;
}

header replay_rejected_message_t {
    bit<8> replay_reject_code;
}

header replay_complete_message_t {
    bit<64> message_count;
}

header stream_begin_message_t {
    bit<64> next_sequence_number;
    bit<64> max_sequence_number;
}

header stream_rejected_message_t {
    bit<8> stream_reject_code;
}

header stream_complete_message_t {
    bit<64> total_sequence_count;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    login_request_message_t login_request_message;
    replay_request_message_t replay_request_message;
    replay_all_request_message_t replay_all_request_message;
    stream_request_message_t stream_request_message;
    login_accepted_message_t login_accepted_message;
    login_rejected_message_t login_rejected_message;
    start_of_session_message_t start_of_session_message;
    replay_begin_message_t replay_begin_message;
    replay_rejected_message_t replay_rejected_message;
    replay_complete_message_t replay_complete_message;
    stream_begin_message_t stream_begin_message;
    stream_rejected_message_t stream_rejected_message;
    stream_complete_message_t stream_complete_message;
}

parser MemxequitiesCommonheaderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w100: parse_login_request_message;
            8w101: parse_replay_request_message;
            8w102: parse_replay_all_request_message;
            8w103: parse_stream_request_message;
            8w104: parse_unsequenced_message;
            8w1: parse_login_accepted_message;
            8w2: parse_login_rejected_message;
            8w3: parse_start_of_session_message;
            8w5: parse_replay_begin_message;
            8w6: parse_replay_rejected_message;
            8w7: parse_replay_complete_message;
            8w8: parse_stream_begin_message;
            8w9: parse_stream_rejected_message;
            8w10: parse_stream_complete_message;
            8w11: parse_sequenced_message;
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

    state parse_login_accepted_message {
        packet.extract(hdr.login_accepted_message);
        transition accept;
    }

    state parse_login_rejected_message {
        packet.extract(hdr.login_rejected_message);
        transition accept;
    }

    state parse_start_of_session_message {
        packet.extract(hdr.start_of_session_message);
        transition accept;
    }

    state parse_replay_begin_message {
        packet.extract(hdr.replay_begin_message);
        transition accept;
    }

    state parse_replay_rejected_message {
        packet.extract(hdr.replay_rejected_message);
        transition accept;
    }

    state parse_replay_complete_message {
        packet.extract(hdr.replay_complete_message);
        transition accept;
    }

    state parse_stream_begin_message {
        packet.extract(hdr.stream_begin_message);
        transition accept;
    }

    state parse_stream_rejected_message {
        packet.extract(hdr.stream_rejected_message);
        transition accept;
    }

    state parse_stream_complete_message {
        packet.extract(hdr.stream_complete_message);
        transition accept;
    }

    state parse_sequenced_message {
        transition accept;
    }

}

control MemxequitiesCommonheaderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesCommonheaderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxequitiesCommonheaderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxequitiesCommonheaderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesCommonheaderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.login_accepted_message);
        packet.emit(hdr.login_rejected_message);
        packet.emit(hdr.start_of_session_message);
        packet.emit(hdr.replay_begin_message);
        packet.emit(hdr.replay_rejected_message);
        packet.emit(hdr.replay_complete_message);
        packet.emit(hdr.stream_begin_message);
        packet.emit(hdr.stream_rejected_message);
        packet.emit(hdr.stream_complete_message);
    }
}

V1Switch(
    MemxequitiesCommonheaderParser(),
    MemxequitiesCommonheaderVerifyChecksum(),
    MemxequitiesCommonheaderIngress(),
    MemxequitiesCommonheaderEgress(),
    MemxequitiesCommonheaderComputeChecksum(),
    MemxequitiesCommonheaderDeparser()
) main;
