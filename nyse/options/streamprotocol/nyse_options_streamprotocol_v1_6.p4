// P4_16 (v1model) definition for: Nyse Options StreamProtocol PillarStream v1.6
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Stream Protocol
//   Encoding: Pillar Stream Protocol
//   Version: 1.6
//   Date: 9/26/2019
//   Specification: NYSE_Pillar_Stream_Protocol_Specification.pdf
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
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header login_message_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<128> username;
    bit<256> password;
    bit<32> mic;
    bit<160> version;
}

header login_response_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<128> username;
    bit<8> status;
}

header stream_avail_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> user;
    bit<64> next_seq;
    bit<8> access;
}

header heartbeat_t {
    bit<16> msg_type;
    bit<16> msg_length;
}

header open_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> user;
    bit<64> start_seq;
    bit<64> end_seq;
    bit<8> access;
    bit<8> mode;
}

header open_response_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> user;
    bit<8> status;
    bit<8> access;
}

header close_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> user;
}

header close_response_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> user;
    bit<8> status;
}

header seq_msg_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> user;
    bit<64> seq;
    bit<32> reserved_4;
    bit<64> timestamp;
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<16> seq_msg_type_2;
    bit<16> seq_msg_length_2;
}

header seq_msg_data_t {
    varbit<2048> data;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    login_message_t login_message;
    login_response_t login_response;
    stream_avail_t stream_avail;
    heartbeat_t heartbeat;
    open_t open;
    open_response_t open_response;
    close_t close;
    close_response_t close_response;
    seq_msg_t seq_msg;
    seq_msg_data_t seq_msg_data;
}

parser NyseOptionsStreamprotocolParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        transition select(packet.lookahead<bit<16>>()) {
            16w0x102: parse_login_message;
            16w0x202: parse_login_response;
            16w0x302: parse_stream_avail;
            16w0x402: parse_heartbeat;
            16w0x502: parse_open;
            16w0x602: parse_open_response;
            16w0x702: parse_close;
            16w0x802: parse_close_response;
            16w0x509: parse_seq_msg;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_response {
        packet.extract(hdr.login_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stream_avail {
        packet.extract(hdr.stream_avail);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_open {
        packet.extract(hdr.open);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_open_response {
        packet.extract(hdr.open_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_close {
        packet.extract(hdr.close);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_close_response {
        packet.extract(hdr.close_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_seq_msg {
        packet.extract(hdr.seq_msg);
        meta.dispatched = 1;
        packet.extract(hdr.seq_msg_data, (bit<32>)hdr.seq_msg.seq_msg_length_2 * 8);
        transition accept;
    }

}

control NyseOptionsStreamprotocolVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseOptionsStreamprotocolIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NyseOptionsStreamprotocolEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NyseOptionsStreamprotocolComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseOptionsStreamprotocolDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.login_message);
        packet.emit(hdr.login_response);
        packet.emit(hdr.stream_avail);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.open);
        packet.emit(hdr.open_response);
        packet.emit(hdr.close);
        packet.emit(hdr.close_response);
        packet.emit(hdr.seq_msg);
        packet.emit(hdr.seq_msg_data);
    }
}

V1Switch(
    NyseOptionsStreamprotocolParser(),
    NyseOptionsStreamprotocolVerifyChecksum(),
    NyseOptionsStreamprotocolIngress(),
    NyseOptionsStreamprotocolEgress(),
    NyseOptionsStreamprotocolComputeChecksum(),
    NyseOptionsStreamprotocolDeparser()
) main;
