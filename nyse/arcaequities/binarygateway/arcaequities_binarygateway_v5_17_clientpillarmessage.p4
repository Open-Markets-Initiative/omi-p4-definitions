// P4_16 (v1model) definition for: Nyse ArcaEquities BinaryGateway PillarStream v5.17
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Binary Gateway
//   Encoding: Pillar Stream Protocol
//   Version: 5.17
//   Date: 10/17/2025
//   Specification: NYSE_Pillar_Gateway_Binary_Protocol_Specification.pdf
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

header heartbeat_t {
    bit<16> msg_type;
    bit<16> msg_length;
}

header open_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> value;
    bit<64> start_seq;
    bit<64> end_seq;
    bit<8> access;
    bit<8> mode;
}

header close_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> value;
}

header client_seq_msg_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<32> sess;
    bit<32> value;
    bit<64> seq;
    bit<32> reserved_4;
    bit<64> timestamp;
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
}

header session_configuration_request_message_t {
    bit<128> username;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header new_order_single_and_cancel_replace_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<32> mmid;
    bit<8> mpsubid_1;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> bitfield_order_instructions;
    bit<64> price;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<64> user_data;
}

header order_cancel_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
}

header order_modify_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<32> order_qty;
    bit<8> side;
    bit<8> locate_reqd_u_81;
}

header bulk_cancel_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<32> mmid;
    bit<64> cl_ord_id;
    bit<40> deliver_to_comp_id;
    bit<8> bulk_cancel_type;
    bit<8> side;
}

header symbol_subscription_request_message_t {
    bit<32> symbol_id;
    bit<128> username;
}

header manual_action_response_message_t {
    bit<32> symbol_id;
    bit<64> cl_ord_id;
    bit<32> sess;
    bit<32> value;
    bit<64> seq;
    bit<8> sell_indicator;
    bit<32> intraday_sell_short_qty;
    bit<8> mpsubid_1;
    bit<8> locate_reqd_u_81;
    bit<8> self_trade_type_bits;
    bit<64> user_data;
    bit<8> manual_response_type;
    bit<160> dmm_reject_reason;
}

header risk_limit_update_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker_nul;
    bit<32> mpsubid_4;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_request;
    bit<8> ioc_attribution;
    bit<8> risk_range_id;
    bit<64> risk_minimum_value;
    bit<8> price_scale;
    bit<1520> reserved_190;
}

header risk_action_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker_nul;
    bit<32> mpsubid_4;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_action_type;
    bit<8> risk_range_id;
    bit<1592> reserved_199;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    login_message_t login_message;
    heartbeat_t heartbeat;
    open_t open;
    close_t close;
    client_seq_msg_t client_seq_msg;
    session_configuration_request_message_t session_configuration_request_message;
    new_order_single_and_cancel_replace_request_message_t new_order_single_and_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    order_modify_request_message_t order_modify_request_message;
    bulk_cancel_request_message_t bulk_cancel_request_message;
    symbol_subscription_request_message_t symbol_subscription_request_message;
    manual_action_response_message_t manual_action_response_message;
    risk_limit_update_request_message_t risk_limit_update_request_message;
    risk_action_request_message_t risk_action_request_message;
}

parser ArcaequitiesBinarygatewayClientpillarmessageParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        transition select(packet.lookahead<bit<16>>()) {
            16w0x102: parse_login_message;
            16w0x402: parse_heartbeat;
            16w0x502: parse_open;
            16w0x702: parse_close;
            16w0x509: parse_client_seq_msg;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
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

    state parse_close {
        packet.extract(hdr.close);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_seq_msg {
        packet.extract(hdr.client_seq_msg);
        meta.dispatched = 1;
        transition select(hdr.client_seq_msg.seq_msg_type) {
            16w0x2002: parse_session_configuration_request_message;
            16w0x8202: parse_sequenced_filler_message;
            16w0x4002: parse_new_order_single_and_cancel_replace_request_message;
            16w0x8002: parse_order_cancel_request_message;
            16w0x7002: parse_order_modify_request_message;
            16w0x8102: parse_bulk_cancel_request_message;
            16w0x4603: parse_symbol_subscription_request_message;
            16w0x4303: parse_tg_begin_message;
            16w0x4403: parse_tg_end_message;
            16w0x5403: parse_manual_action_response_message;
            16w0x3003: parse_risk_limit_update_request_message;
            16w0x3103: parse_risk_action_request_message;
            default: accept;
        }
    }

    state parse_session_configuration_request_message {
        packet.extract(hdr.session_configuration_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_filler_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_single_and_cancel_replace_request_message {
        packet.extract(hdr.new_order_single_and_cancel_replace_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_request_message {
        packet.extract(hdr.order_modify_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bulk_cancel_request_message {
        packet.extract(hdr.bulk_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symbol_subscription_request_message {
        packet.extract(hdr.symbol_subscription_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tg_begin_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tg_end_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_manual_action_response_message {
        packet.extract(hdr.manual_action_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_risk_limit_update_request_message {
        packet.extract(hdr.risk_limit_update_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_risk_action_request_message {
        packet.extract(hdr.risk_action_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control ArcaequitiesBinarygatewayClientpillarmessageVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaequitiesBinarygatewayClientpillarmessageIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control ArcaequitiesBinarygatewayClientpillarmessageEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control ArcaequitiesBinarygatewayClientpillarmessageComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaequitiesBinarygatewayClientpillarmessageDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.login_message);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.open);
        packet.emit(hdr.close);
        packet.emit(hdr.client_seq_msg);
        packet.emit(hdr.session_configuration_request_message);
        packet.emit(hdr.new_order_single_and_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.order_modify_request_message);
        packet.emit(hdr.bulk_cancel_request_message);
        packet.emit(hdr.symbol_subscription_request_message);
        packet.emit(hdr.manual_action_response_message);
        packet.emit(hdr.risk_limit_update_request_message);
        packet.emit(hdr.risk_action_request_message);
    }
}

V1Switch(
    ArcaequitiesBinarygatewayClientpillarmessageParser(),
    ArcaequitiesBinarygatewayClientpillarmessageVerifyChecksum(),
    ArcaequitiesBinarygatewayClientpillarmessageIngress(),
    ArcaequitiesBinarygatewayClientpillarmessageEgress(),
    ArcaequitiesBinarygatewayClientpillarmessageComputeChecksum(),
    ArcaequitiesBinarygatewayClientpillarmessageDeparser()
) main;
