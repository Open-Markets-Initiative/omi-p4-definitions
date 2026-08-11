// P4_16 (v1model) definition for: Iex IexOptions Session Sbe v1.0
// 
// Protocol:
//   Organization: Investors Exchange
//   Protocol: Session
//   Encoding: Simple Binary Encoding
//   Version: 1.0
//   Date: 6/1/2026
//   Specification: IEX Options Binary Session Protocol Specification v1.00
// 
// Byte order: little (P4 extracts in network/big-endian order)
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
    bit<16> packet_length;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header login_request_message_t {
    bit<128> logon_id;
    bit<256> token;
}

header login_response_message_t {
    bit<128> logon_id;
    bit<8> status;
}

header gateway_heartbeat_message_t {
    bit<8> keep_alive;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<8> subsession_type;
    bit<64> subsession_id;
    bit<8> joined;
    bit<32> next_seq_no;
}

header terminate_message_t {
    bit<8> reason;
}

header sequenced_message_header_message_t {
    bit<64> subsession_id;
    bit<32> sequence;
    bit<64> timestamp;
}

header subsession_join_message_t {
    bit<64> subsession_id;
    bit<32> start_sequence;
    bit<32> end_sequence;
}

header subsession_join_response_message_t {
    bit<64> subsession_id;
    bit<8> status;
}

header subsession_leave_message_t {
    bit<64> subsession_id;
}

header subsession_leave_response_message_t {
    bit<64> subsession_id;
    bit<8> reason;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    login_request_message_t login_request_message;
    login_response_message_t login_response_message;
    gateway_heartbeat_message_t gateway_heartbeat_message;
    terminate_message_t terminate_message;
    sequenced_message_header_message_t sequenced_message_header_message;
    subsession_join_message_t subsession_join_message;
    subsession_join_response_message_t subsession_join_response_message;
    subsession_leave_message_t subsession_leave_message;
    subsession_leave_response_message_t subsession_leave_response_message;
}

parser IexoptionsSessionParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w1: parse_login_request_message;
            16w2: parse_login_response_message;
            16w3: parse_gateway_heartbeat_message;
            16w6: parse_terminate_message;
            16w7: parse_sequenced_message_header_message;
            16w8: parse_subsession_join_message;
            16w9: parse_subsession_join_response_message;
            16w10: parse_subsession_leave_message;
            16w11: parse_subsession_leave_response_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        transition accept;
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message);
        transition accept;
    }

    state parse_gateway_heartbeat_message {
        packet.extract(hdr.gateway_heartbeat_message);
        transition accept;
    }

    state parse_terminate_message {
        packet.extract(hdr.terminate_message);
        transition accept;
    }

    state parse_sequenced_message_header_message {
        packet.extract(hdr.sequenced_message_header_message);
        transition accept;
    }

    state parse_subsession_join_message {
        packet.extract(hdr.subsession_join_message);
        transition accept;
    }

    state parse_subsession_join_response_message {
        packet.extract(hdr.subsession_join_response_message);
        transition accept;
    }

    state parse_subsession_leave_message {
        packet.extract(hdr.subsession_leave_message);
        transition accept;
    }

    state parse_subsession_leave_response_message {
        packet.extract(hdr.subsession_leave_response_message);
        transition accept;
    }

}

control IexoptionsSessionVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsSessionIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IexoptionsSessionEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IexoptionsSessionComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsSessionDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.login_response_message);
        packet.emit(hdr.gateway_heartbeat_message);
        packet.emit(hdr.terminate_message);
        packet.emit(hdr.sequenced_message_header_message);
        packet.emit(hdr.subsession_join_message);
        packet.emit(hdr.subsession_join_response_message);
        packet.emit(hdr.subsession_leave_message);
        packet.emit(hdr.subsession_leave_response_message);
    }
}

V1Switch(
    IexoptionsSessionParser(),
    IexoptionsSessionVerifyChecksum(),
    IexoptionsSessionIngress(),
    IexoptionsSessionEgress(),
    IexoptionsSessionComputeChecksum(),
    IexoptionsSessionDeparser()
) main;
