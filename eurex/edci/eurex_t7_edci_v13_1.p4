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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<32> body_len;
    bit<16> template_id;
}

header delete_order_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> party_id_executing_unit;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<64> exec_id;
    bit<32> market_segment_id;
    bit<16> no_affected_orders;
    bit<16> pad2v2;
    bit<64> affected_order_id;
    bit<64> affected_cl_ord_id;
    bit<64> affected_orig_cl_ord_id;
    bit<64> security_id;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<160> affected_fix_cl_ord_id;
    bit<160> affected_fix_orig_cl_ord_id;
    bit<48> pad6;
}

header forced_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<16> var_text_len;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header heartbeat_t {
    bit<16> pad2;
}

header heartbeat_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
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

header logon_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<32> heart_bt_int;
    bit<32> session_instance_id;
    bit<16> market_id;
    bit<8> trad_ses_mode;
    bit<240> default_cstm_appl_ver_id;
    bit<40> default_cstm_appl_ver_sub_id;
    bit<16> pad2v2;
}

header logout_request_t {
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
}

header order_exec_report_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> party_id_executing_unit;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> order_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> expire_date;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<8> product_complex;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<8> ord_type;
    bit<8> match_type;
    bit<8> trading_capacity;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> triggered;
    bit<8> trading_session_sub_id;
    bit<8> appl_seq_indicator;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> no_fills;
    bit<8> crossed_indicator;
    bit<8> cust_order_handling_inst;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<160> fix_cl_ord_id;
    bit<160> fix_orig_cl_ord_id;
    bit<160> party_end_client_identification;
    bit<56> pad7;
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
}

header partition_list_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<8> no_partitions;
    bit<56> pad7;
    bit<16> partition_id;
    bit<48> pad6;
}

header reject_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<32> session_reject_reason;
    bit<16> var_text_len;
    bit<8> session_status;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header session_list_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<16> no_sessions;
    bit<48> pad6;
    bit<32> party_id_session_id;
    bit<8> session_mode;
    bit<40> party_executing_firm;
    bit<48> pad6_2;
}

header session_status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> party_id_executing_unit;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<32> trade_date;
    bit<32> market_segment_id;
    bit<8> trad_ses_event;
    bit<56> pad7;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    delete_order_broadcast_t delete_order_broadcast;
    forced_logout_notification_t forced_logout_notification;
    heartbeat_t heartbeat;
    heartbeat_notification_t heartbeat_notification;
    logon_request_t logon_request;
    logon_response_t logon_response;
    logout_request_t logout_request;
    logout_response_t logout_response;
    order_exec_report_broadcast_t order_exec_report_broadcast;
    partition_list_notification_t partition_list_notification;
    reject_t reject;
    session_list_notification_t session_list_notification;
    session_status_broadcast_t session_status_broadcast;
}

parser EurexT7EdciParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10902: parse_delete_order_broadcast;
            16w10012: parse_forced_logout_notification;
            16w10011: parse_heartbeat;
            16w10023: parse_heartbeat_notification;
            16w10000: parse_logon_request;
            16w10001: parse_logon_response;
            16w10002: parse_logout_request;
            16w10003: parse_logout_response;
            16w10901: parse_order_exec_report_broadcast;
            16w10037: parse_partition_list_notification;
            16w10010: parse_reject;
            16w10036: parse_session_list_notification;
            16w10903: parse_session_status_broadcast;
            default: accept;
        }
    }

    state parse_delete_order_broadcast {
        packet.extract(hdr.delete_order_broadcast);
        transition accept;
    }

    state parse_forced_logout_notification {
        packet.extract(hdr.forced_logout_notification);
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        transition accept;
    }

    state parse_heartbeat_notification {
        packet.extract(hdr.heartbeat_notification);
        transition accept;
    }

    state parse_logon_request {
        packet.extract(hdr.logon_request);
        transition accept;
    }

    state parse_logon_response {
        packet.extract(hdr.logon_response);
        transition accept;
    }

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        transition accept;
    }

    state parse_logout_response {
        packet.extract(hdr.logout_response);
        transition accept;
    }

    state parse_order_exec_report_broadcast {
        packet.extract(hdr.order_exec_report_broadcast);
        transition accept;
    }

    state parse_partition_list_notification {
        packet.extract(hdr.partition_list_notification);
        transition accept;
    }

    state parse_reject {
        packet.extract(hdr.reject);
        transition accept;
    }

    state parse_session_list_notification {
        packet.extract(hdr.session_list_notification);
        transition accept;
    }

    state parse_session_status_broadcast {
        packet.extract(hdr.session_status_broadcast);
        transition accept;
    }

}

control EurexT7EdciVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EdciIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7EdciEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EdciComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EdciDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.delete_order_broadcast);
        packet.emit(hdr.forced_logout_notification);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.heartbeat_notification);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logon_response);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.logout_response);
        packet.emit(hdr.order_exec_report_broadcast);
        packet.emit(hdr.partition_list_notification);
        packet.emit(hdr.reject);
        packet.emit(hdr.session_list_notification);
        packet.emit(hdr.session_status_broadcast);
    }
}

V1Switch(
    EurexT7EdciParser(),
    EurexT7EdciVerifyChecksum(),
    EurexT7EdciIngress(),
    EurexT7EdciEgress(),
    EurexT7EdciComputeChecksum(),
    EurexT7EdciDeparser()
) main;
