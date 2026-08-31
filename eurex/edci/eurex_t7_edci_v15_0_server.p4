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

header cross_request_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> security_id;
    bit<64> order_qty;
    bit<64> exec_id;
    bit<32> market_segment_id;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<32> pad4;
}

header delete_order_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
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

header enter_clip_request_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> security_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> exec_id;
    bit<32> market_segment_id;
    bit<32> cross_id;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<8> product_complex;
    bit<8> no_sides;
    bit<8> cross_request_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<16> pad2v2;
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> maximum_price;
    bit<32> match_inst_cross_id;
    bit<8> input_source;
    bit<8> side;
    bit<8> self_match_prevention_instruction;
    bit<8> cross_match_instruction;
    bit<8> trading_capacity;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> cust_order_handling_inst;
    bit<160> party_end_client_identification;
    bit<8> order_origination;
    bit<56> pad7;
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

header heartbeat_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
}

header legal_notification_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> transact_time;
    bit<16> var_text_len;
    bit<8> user_status;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
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
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
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
    bit<32> match_inst_cross_id;
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
    bit<8> self_match_prevention_instruction;
    bit<8> cross_match_instruction;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> no_fills;
    bit<8> crossed_indicator;
    bit<8> cust_order_handling_inst;
    bit<8> order_origination;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<160> fix_cl_ord_id;
    bit<160> fix_orig_cl_ord_id;
    bit<160> party_end_client_identification;
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
}

header order_reject_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<32> party_id_entering_unit;
    bit<32> session_reject_reason;
}

header partition_list_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<8> no_partitions;
    bit<56> pad7;
    bit<16> partition_id;
    bit<48> pad6;
}

header party_action_report_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> transact_time;
    bit<32> trade_date;
    bit<32> requesting_party_id_executing_trader;
    bit<32> party_id_executing_unit_2;
    bit<32> target_party_id_executing_unit;
    bit<32> party_id_executing_trader;
    bit<32> requesting_party_id_executing_system;
    bit<16> market_id;
    bit<8> order_deletion_instruction;
    bit<8> party_action_type;
    bit<8> requesting_party_id_entering_firm;
    bit<24> pad3_2;
}

header party_entitlements_update_report_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> transact_time;
    bit<32> trade_date;
    bit<32> party_detail_id_executing_unit;
    bit<32> requesting_party_id_executing_system;
    bit<16> market_id;
    bit<8> list_update_action;
    bit<72> requesting_party_entering_firm;
    bit<72> requesting_party_clearing_firm;
    bit<8> party_detail_status;
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

header retransmit_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> appl_end_seq_num;
    bit<64> ref_appl_last_seq_num;
    bit<16> appl_total_message_count;
    bit<48> pad6;
}

header rfq_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> security_id;
    bit<64> order_qty;
    bit<64> exec_id;
    bit<32> market_segment_id;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<8> side;
    bit<24> pad3_2;
}

header risk_notification_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> transact_time;
    bit<32> trade_date;
    bit<32> party_detail_id_executing_unit;
    bit<32> target_party_id_executing_unit;
    bit<32> requesting_party_id_executing_system;
    bit<16> market_id;
    bit<8> inventory_check_type;
    bit<8> list_update_action;
    bit<8> risk_limit_action;
    bit<72> requesting_party_entering_firm;
    bit<72> requesting_party_clearing_firm;
    bit<8> pad1;
}

header service_availability_market_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<8> risk_control_rtm_service_status;
    bit<8> marketwide_analytics_and_risk_service_status;
    bit<48> pad6;
}

header session_list_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<16> no_sessions;
    bit<48> pad6;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_unit;
    bit<32> party_id_sponsored_access_unit;
    bit<8> session_mode;
    bit<40> party_executing_firm;
    bit<240> party_sponsored_access_unit;
}

header session_status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> ref_appl_last_seq_num;
    bit<32> trade_date;
    bit<32> market_segment_id;
    bit<8> trad_ses_event;
    bit<56> pad7;
}

header status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> party_id_executing_unit;
    bit<32> party_id_group;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<32> trade_date;
    bit<8> trad_ses_event;
    bit<24> pad3_2;
}

header trading_action_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<8> no_partition_i_ds;
    bit<56> pad7;
    bit<16> partition_id;
    bit<8> matching_engine_status;
    bit<40> pad5;
}

header user_login_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
}

header user_logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    cross_request_notification_t cross_request_notification;
    delete_order_broadcast_t delete_order_broadcast;
    enter_clip_request_notification_t enter_clip_request_notification;
    forced_logout_notification_t forced_logout_notification;
    heartbeat_notification_t heartbeat_notification;
    legal_notification_broadcast_t legal_notification_broadcast;
    logon_response_t logon_response;
    logout_response_t logout_response;
    order_exec_report_broadcast_t order_exec_report_broadcast;
    order_reject_notification_t order_reject_notification;
    partition_list_notification_t partition_list_notification;
    party_action_report_t party_action_report;
    party_entitlements_update_report_t party_entitlements_update_report;
    reject_t reject;
    retransmit_response_t retransmit_response;
    rfq_notification_t rfq_notification;
    risk_notification_broadcast_t risk_notification_broadcast;
    service_availability_market_broadcast_t service_availability_market_broadcast;
    session_list_notification_t session_list_notification;
    session_status_broadcast_t session_status_broadcast;
    status_broadcast_t status_broadcast;
    trading_action_response_t trading_action_response;
    user_login_response_t user_login_response;
    user_logout_response_t user_logout_response;
}

parser EurexT7EdciServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10907: parse_cross_request_notification;
            16w10902: parse_delete_order_broadcast;
            16w10906: parse_enter_clip_request_notification;
            16w10012: parse_forced_logout_notification;
            16w10023: parse_heartbeat_notification;
            16w10035: parse_legal_notification_broadcast;
            16w10001: parse_logon_response;
            16w10003: parse_logout_response;
            16w10901: parse_order_exec_report_broadcast;
            16w10014: parse_order_reject_notification;
            16w10037: parse_partition_list_notification;
            16w10038: parse_party_action_report;
            16w10034: parse_party_entitlements_update_report;
            16w10010: parse_reject;
            16w10009: parse_retransmit_response;
            16w10905: parse_rfq_notification;
            16w10033: parse_risk_notification_broadcast;
            16w10044: parse_service_availability_market_broadcast;
            16w10036: parse_session_list_notification;
            16w10903: parse_session_status_broadcast;
            16w10045: parse_status_broadcast;
            16w10909: parse_trading_action_response;
            16w10019: parse_user_login_response;
            16w10024: parse_user_logout_response;
            default: accept;
        }
    }

    state parse_cross_request_notification {
        packet.extract(hdr.cross_request_notification);
        transition accept;
    }

    state parse_delete_order_broadcast {
        packet.extract(hdr.delete_order_broadcast);
        transition accept;
    }

    state parse_enter_clip_request_notification {
        packet.extract(hdr.enter_clip_request_notification);
        transition accept;
    }

    state parse_forced_logout_notification {
        packet.extract(hdr.forced_logout_notification);
        transition accept;
    }

    state parse_heartbeat_notification {
        packet.extract(hdr.heartbeat_notification);
        transition accept;
    }

    state parse_legal_notification_broadcast {
        packet.extract(hdr.legal_notification_broadcast);
        transition accept;
    }

    state parse_logon_response {
        packet.extract(hdr.logon_response);
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

    state parse_order_reject_notification {
        packet.extract(hdr.order_reject_notification);
        transition accept;
    }

    state parse_partition_list_notification {
        packet.extract(hdr.partition_list_notification);
        transition accept;
    }

    state parse_party_action_report {
        packet.extract(hdr.party_action_report);
        transition accept;
    }

    state parse_party_entitlements_update_report {
        packet.extract(hdr.party_entitlements_update_report);
        transition accept;
    }

    state parse_reject {
        packet.extract(hdr.reject);
        transition accept;
    }

    state parse_retransmit_response {
        packet.extract(hdr.retransmit_response);
        transition accept;
    }

    state parse_rfq_notification {
        packet.extract(hdr.rfq_notification);
        transition accept;
    }

    state parse_risk_notification_broadcast {
        packet.extract(hdr.risk_notification_broadcast);
        transition accept;
    }

    state parse_service_availability_market_broadcast {
        packet.extract(hdr.service_availability_market_broadcast);
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

    state parse_status_broadcast {
        packet.extract(hdr.status_broadcast);
        transition accept;
    }

    state parse_trading_action_response {
        packet.extract(hdr.trading_action_response);
        transition accept;
    }

    state parse_user_login_response {
        packet.extract(hdr.user_login_response);
        transition accept;
    }

    state parse_user_logout_response {
        packet.extract(hdr.user_logout_response);
        transition accept;
    }

}

control EurexT7EdciServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EdciServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7EdciServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EdciServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EdciServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.cross_request_notification);
        packet.emit(hdr.delete_order_broadcast);
        packet.emit(hdr.enter_clip_request_notification);
        packet.emit(hdr.forced_logout_notification);
        packet.emit(hdr.heartbeat_notification);
        packet.emit(hdr.legal_notification_broadcast);
        packet.emit(hdr.logon_response);
        packet.emit(hdr.logout_response);
        packet.emit(hdr.order_exec_report_broadcast);
        packet.emit(hdr.order_reject_notification);
        packet.emit(hdr.partition_list_notification);
        packet.emit(hdr.party_action_report);
        packet.emit(hdr.party_entitlements_update_report);
        packet.emit(hdr.reject);
        packet.emit(hdr.retransmit_response);
        packet.emit(hdr.rfq_notification);
        packet.emit(hdr.risk_notification_broadcast);
        packet.emit(hdr.service_availability_market_broadcast);
        packet.emit(hdr.session_list_notification);
        packet.emit(hdr.session_status_broadcast);
        packet.emit(hdr.status_broadcast);
        packet.emit(hdr.trading_action_response);
        packet.emit(hdr.user_login_response);
        packet.emit(hdr.user_logout_response);
    }
}

V1Switch(
    EurexT7EdciServerParser(),
    EurexT7EdciServerVerifyChecksum(),
    EurexT7EdciServerIngress(),
    EurexT7EdciServerEgress(),
    EurexT7EdciServerComputeChecksum(),
    EurexT7EdciServerDeparser()
) main;
