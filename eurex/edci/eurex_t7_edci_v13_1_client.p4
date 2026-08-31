// P4_16 (v1model) definition for: Eurex T7 Edci Fbe v13.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Extended Derivatives Clearing Interface
//   Encoding: Flat Binary Encoding
//   Version: 13.1
//   Date: 3/6/2025
//   Specification: T7_R.13.1_Enhanced_Drop_Copy_Interface_-_Derivatives_Message_Reference_Version_1.pdf
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

header message_header_t {
    bit<32> body_len;
    bit<16> template_id;
}

header heartbeat_t {
    bit<16> pad2;
}

header logon_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<32> heart_bt_int;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<16> pad2v2;
}

header logout_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    heartbeat_t heartbeat;
    logon_request_t logon_request;
    logout_request_t logout_request;
}

parser EurexT7EdciClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10011: parse_heartbeat;
            16w10000: parse_logon_request;
            16w10002: parse_logout_request;
            default: accept;
        }
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        transition accept;
    }

    state parse_logon_request {
        packet.extract(hdr.logon_request);
        transition accept;
    }

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        transition accept;
    }

}

control EurexT7EdciClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EdciClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7EdciClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EdciClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EdciClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logout_request);
    }
}

V1Switch(
    EurexT7EdciClientParser(),
    EurexT7EdciClientVerifyChecksum(),
    EurexT7EdciClientIngress(),
    EurexT7EdciClientEgress(),
    EurexT7EdciClientComputeChecksum(),
    EurexT7EdciClientDeparser()
) main;
