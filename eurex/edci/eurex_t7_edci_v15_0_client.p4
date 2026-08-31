// P4_16 (v1model) definition for: Eurex T7 Edci Fbe v15.0
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Extended Derivatives Clearing Interface
//   Encoding: Flat Binary Encoding
//   Version: 15.0
//   Date: 8/26/2026
//   Specification: T7_R.15.0_Enhanced_Drop_Copy_Interface_-_Derivatives_Message_Reference_Version_2.pdf
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
    bit<32> sender_sub_id;
    bit<32> heart_bt_int;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<16> pad2v2;
}

header logout_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header retransmit_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> appl_beg_seq_num;
    bit<64> appl_end_seq_num;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> ref_appl_id;
    bit<8> pad1;
}

header trading_action_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<8> risk_limit_platform;
    bit<8> order_deletion_instruction;
    bit<8> party_action_type;
    bit<8> pad1;
    bit<32> party_id_executing_unit;
    bit<32> target_party_id_executing_unit;
    bit<32> pad4;
}

header user_login_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<256> password;
    bit<32> pad4;
}

header user_logout_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<32> pad4;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    heartbeat_t heartbeat;
    logon_request_t logon_request;
    logout_request_t logout_request;
    retransmit_request_t retransmit_request;
    trading_action_request_t trading_action_request;
    user_login_request_t user_login_request;
    user_logout_request_t user_logout_request;
}

parser EurexT7EdciClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10011: parse_heartbeat;
            16w10000: parse_logon_request;
            16w10002: parse_logout_request;
            16w10008: parse_retransmit_request;
            16w10908: parse_trading_action_request;
            16w10018: parse_user_login_request;
            16w10029: parse_user_logout_request;
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

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        transition accept;
    }

    state parse_trading_action_request {
        packet.extract(hdr.trading_action_request);
        transition accept;
    }

    state parse_user_login_request {
        packet.extract(hdr.user_login_request);
        transition accept;
    }

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
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
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.trading_action_request);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_logout_request);
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
