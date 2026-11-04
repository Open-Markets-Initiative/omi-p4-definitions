// P4_16 (v1model) definition for: Taifex TaifexDerivatives DropCopy Tmp v2.18.7
// 
// Protocol:
//   Organization: Taiwan Futures Exchange
//   Protocol: Drop Copy Service
//   Encoding: Taifex Message Protocol
//   Version: 2.18.7
//   Date: 08/18/2025
//   Specification: Taifex_TCPIP_TMP_v2.18.7.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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

header hdr_t {
    bit<16> msg_length;
    bit<32> msg_seq_num;
    bit<32> header_epoch_s;
    bit<16> header_ms;
    bit<8> message_type;
    bit<16> fcm_id;
    bit<16> session_id;
}

header wake_up_call_message_t {
    bit<8> status_code_uint_81;
    bit<32> start_in_bound_num;
}

header wake_up_call_confirmed_message_t {
    bit<8> version;
}

header logon_notice_message_t {
    bit<8> status_code_uint_81;
    bit<16> append_no;
    bit<32> end_out_bound_num;
    bit<8> system_type;
    bit<8> encrypt_method;
}

header final_sequential_number_notification_for_group_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<16> status_code_uint_162;
    bit<8> part_id;
    bit<32> end_out_bound_num;
    bit<64> reserved_8;
}

header request_logon_message_t {
    bit<8> status_code_uint_81;
    bit<16> append_no;
    bit<16> fcm_id;
    bit<16> session_id;
    bit<8> system_type;
    bit<8> ap_code;
    bit<8> key_value;
    bit<32> request_start_seq;
    bit<8> cancel_order_sec;
}

header activate_application_system_message_t {
    bit<8> status_code_uint_81;
    bit<8> heart_bt_int;
    bit<16> max_flow_ctrl_cnt;
}

header activate_application_system_confirmed_message_t {
    bit<8> status_code_uint_81;
}

header logout_confirmed_message_t {
    bit<8> status_code_uint_81;
}

header confirm_connection_message_t {
    bit<8> status_code_uint_81;
}

header connection_confirmed_message_t {
    bit<8> status_code_uint_81;
}

header order_status_report_message_t {
    bit<8> status_code_uint_81;
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<8> symbol_type;
}

header symbol_num_t {
    bit<16> pseq_1;
    bit<16> pseq_2;
    bit<8> leg_side_uint_822;
    bit<8> comb_op;
    bit<104> reserved_13;
}

header symbol_text_t {
    bit<160> symbol_char_2020;
}

header order_status_report_long_format_message_t {
    bit<8> status_code_uint_81;
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<8> symbol_type;
}

header long_symbol_num_t {
    bit<16> pseq_1;
    bit<16> pseq_2;
    bit<8> leg_side_uint_822;
    bit<8> comb_op;
    bit<264> reserved_33;
}

header long_symbol_text_t {
    bit<320> symbol_char_4040;
}

header error_report_message_t {
    bit<8> status_code_uint_81;
    bit<8> exec_type;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<32> rpt_seq;
    bit<8> side;
}

header flex_order_status_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
    bit<8> no_leg;
    bit<16> status_code_uint_162;
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
}

header symbol_num_x_t {
    bit<32> pseq;
}

header symbol_txt_x_t {
    bit<160> prod_id;
}

header multi_leg_num_t {
    bit<8> no_leg;
    bit<8> comb_op;
}

header multi_leg_num_leg_entry_num_t {
    bit<32> pseq;
    bit<8> leg_side_uint_81;
    bit<16> leg_qty_uint_162;
}

header multi_leg_txt_t {
    bit<8> no_leg;
    bit<8> comb_op;
}

header multi_leg_txt_leg_entry_txt_t {
    bit<160> prod_id;
    bit<8> leg_side_uint_81;
    bit<16> leg_qty_uint_162;
}

header flex_error_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
    bit<8> ori_message_type;
    bit<16> status_code_uint_162;
    bit<8> exec_type;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<32> rpt_seq;
    bit<8> side;
    bit<96> reserved_12;
}

header drop_copy_initiate_operation_message_t {
    bit<16> fcm_id;
    bit<8> target_id;
    bit<32> req_cm_seq;
}

header drop_copy_initiate_operation_confirmed_message_t {
    bit<8> status_code_uint_81;
    bit<16> fcm_id;
    bit<8> target_id;
    bit<32> req_cm_seq;
}

header flex_drop_copy_initiate_operation_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
    bit<16> fcm_id;
    bit<8> target_id;
    bit<32> req_cm_seq;
}

header flex_drop_copy_initiate_operation_confirmed_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
    bit<16> status_code_uint_162;
    bit<16> fcm_id;
    bit<8> target_id;
    bit<32> req_cm_seq;
    bit<128> reserved_16;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> multi_leg_num_leg_entry_num_remaining;
    bit<8> multi_leg_txt_leg_entry_txt_remaining;
}

struct headers_t {
    hdr_t hdr;
    wake_up_call_message_t wake_up_call_message;
    wake_up_call_confirmed_message_t wake_up_call_confirmed_message;
    logon_notice_message_t logon_notice_message;
    final_sequential_number_notification_for_group_message_t final_sequential_number_notification_for_group_message;
    request_logon_message_t request_logon_message;
    activate_application_system_message_t activate_application_system_message;
    activate_application_system_confirmed_message_t activate_application_system_confirmed_message;
    logout_confirmed_message_t logout_confirmed_message;
    confirm_connection_message_t confirm_connection_message;
    connection_confirmed_message_t connection_confirmed_message;
    order_status_report_message_t order_status_report_message;
    symbol_num_t symbol_num;
    symbol_text_t symbol_text;
    order_status_report_long_format_message_t order_status_report_long_format_message;
    long_symbol_num_t long_symbol_num;
    long_symbol_text_t long_symbol_text;
    error_report_message_t error_report_message;
    flex_order_status_report_message_t flex_order_status_report_message;
    symbol_num_x_t symbol_num_x;
    symbol_txt_x_t symbol_txt_x;
    multi_leg_num_t multi_leg_num;
    multi_leg_num_leg_entry_num_t multi_leg_num_leg_entry_num[MAX_MESSAGES];
    multi_leg_txt_t multi_leg_txt;
    multi_leg_txt_leg_entry_txt_t multi_leg_txt_leg_entry_txt[MAX_MESSAGES];
    flex_error_report_message_t flex_error_report_message;
    drop_copy_initiate_operation_message_t drop_copy_initiate_operation_message;
    drop_copy_initiate_operation_confirmed_message_t drop_copy_initiate_operation_confirmed_message;
    flex_drop_copy_initiate_operation_message_t flex_drop_copy_initiate_operation_message;
    flex_drop_copy_initiate_operation_confirmed_message_t flex_drop_copy_initiate_operation_confirmed_message;
}

parser TaifexderivativesDropcopyParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.hdr);
        transition select(hdr.hdr.message_type) {
            8w10: parse_wake_up_call_message;
            8w20: parse_wake_up_call_confirmed_message;
            8w30: parse_logon_notice_message;
            8w230: parse_final_sequential_number_notification_for_group_message;
            8w40: parse_request_logon_message;
            8w50: parse_activate_application_system_message;
            8w60: parse_activate_application_system_confirmed_message;
            8w70: parse_logout_message;
            8w80: parse_logout_confirmed_message;
            8w104: parse_confirm_connection_message;
            8w105: parse_connection_confirmed_message;
            8w102: parse_order_status_report_message;
            8w132: parse_order_status_report_long_format_message;
            8w103: parse_error_report_message;
            8w202: parse_flex_order_status_report_message;
            8w203: parse_flex_error_report_message;
            8w115: parse_drop_copy_initiate_operation_message;
            8w116: parse_drop_copy_initiate_operation_confirmed_message;
            8w215: parse_flex_drop_copy_initiate_operation_message;
            8w216: parse_flex_drop_copy_initiate_operation_confirmed_message;
            default: accept;
        }
    }

    state parse_wake_up_call_message {
        packet.extract(hdr.wake_up_call_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_wake_up_call_confirmed_message {
        packet.extract(hdr.wake_up_call_confirmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_notice_message {
        packet.extract(hdr.logon_notice_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_final_sequential_number_notification_for_group_message {
        packet.extract(hdr.final_sequential_number_notification_for_group_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_request_logon_message {
        packet.extract(hdr.request_logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_activate_application_system_message {
        packet.extract(hdr.activate_application_system_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_activate_application_system_confirmed_message {
        packet.extract(hdr.activate_application_system_confirmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_confirmed_message {
        packet.extract(hdr.logout_confirmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_confirm_connection_message {
        packet.extract(hdr.confirm_connection_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_connection_confirmed_message {
        packet.extract(hdr.connection_confirmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_status_report_message {
        packet.extract(hdr.order_status_report_message);
        meta.dispatched = 1;
        transition select(hdr.order_status_report_message.symbol_type) {
            8w1: parse_symbol_num;
            8w2: parse_symbol_text;
            default: accept;
        }
    }

    state parse_symbol_num {
        packet.extract(hdr.symbol_num);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symbol_text {
        packet.extract(hdr.symbol_text);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_status_report_long_format_message {
        packet.extract(hdr.order_status_report_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.order_status_report_long_format_message.symbol_type) {
            8w3: parse_long_symbol_num;
            8w4: parse_long_symbol_text;
            default: accept;
        }
    }

    state parse_long_symbol_num {
        packet.extract(hdr.long_symbol_num);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_symbol_text {
        packet.extract(hdr.long_symbol_text);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_error_report_message {
        packet.extract(hdr.error_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flex_order_status_report_message {
        packet.extract(hdr.flex_order_status_report_message);
        meta.dispatched = 1;
        transition select(hdr.flex_order_status_report_message.msg_type_ext) {
            8w1: parse_symbol_num_x;
            8w2: parse_symbol_txt_x;
            8w3: parse_multi_leg_num;
            8w4: parse_multi_leg_txt;
            default: accept;
        }
    }

    state parse_symbol_num_x {
        packet.extract(hdr.symbol_num_x);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symbol_txt_x {
        packet.extract(hdr.symbol_txt_x);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_multi_leg_num {
        packet.extract(hdr.multi_leg_num);
        meta.dispatched = 1;
        meta.multi_leg_num_leg_entry_num_remaining = hdr.multi_leg_num.no_leg;
        transition select(meta.multi_leg_num_leg_entry_num_remaining) {
            8w0: accept;
            default: parse_multi_leg_num_leg_entry_num;
        }
    }

    state parse_multi_leg_num_leg_entry_num {
        packet.extract(hdr.multi_leg_num_leg_entry_num.next);
        meta.multi_leg_num_leg_entry_num_remaining = meta.multi_leg_num_leg_entry_num_remaining - 1;
        transition select(meta.multi_leg_num_leg_entry_num_remaining) {
            8w0: accept;
            default: parse_multi_leg_num_leg_entry_num;
        }
    }

    state parse_multi_leg_txt {
        packet.extract(hdr.multi_leg_txt);
        meta.dispatched = 1;
        meta.multi_leg_txt_leg_entry_txt_remaining = hdr.multi_leg_txt.no_leg;
        transition select(meta.multi_leg_txt_leg_entry_txt_remaining) {
            8w0: accept;
            default: parse_multi_leg_txt_leg_entry_txt;
        }
    }

    state parse_multi_leg_txt_leg_entry_txt {
        packet.extract(hdr.multi_leg_txt_leg_entry_txt.next);
        meta.multi_leg_txt_leg_entry_txt_remaining = meta.multi_leg_txt_leg_entry_txt_remaining - 1;
        transition select(meta.multi_leg_txt_leg_entry_txt_remaining) {
            8w0: accept;
            default: parse_multi_leg_txt_leg_entry_txt;
        }
    }

    state parse_flex_error_report_message {
        packet.extract(hdr.flex_error_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_drop_copy_initiate_operation_message {
        packet.extract(hdr.drop_copy_initiate_operation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_drop_copy_initiate_operation_confirmed_message {
        packet.extract(hdr.drop_copy_initiate_operation_confirmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flex_drop_copy_initiate_operation_message {
        packet.extract(hdr.flex_drop_copy_initiate_operation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flex_drop_copy_initiate_operation_confirmed_message {
        packet.extract(hdr.flex_drop_copy_initiate_operation_confirmed_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control TaifexderivativesDropcopyVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control TaifexderivativesDropcopyIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control TaifexderivativesDropcopyEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control TaifexderivativesDropcopyComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control TaifexderivativesDropcopyDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.hdr);
        packet.emit(hdr.wake_up_call_message);
        packet.emit(hdr.wake_up_call_confirmed_message);
        packet.emit(hdr.logon_notice_message);
        packet.emit(hdr.final_sequential_number_notification_for_group_message);
        packet.emit(hdr.request_logon_message);
        packet.emit(hdr.activate_application_system_message);
        packet.emit(hdr.activate_application_system_confirmed_message);
        packet.emit(hdr.logout_confirmed_message);
        packet.emit(hdr.confirm_connection_message);
        packet.emit(hdr.connection_confirmed_message);
        packet.emit(hdr.order_status_report_message);
        packet.emit(hdr.symbol_num);
        packet.emit(hdr.symbol_text);
        packet.emit(hdr.order_status_report_long_format_message);
        packet.emit(hdr.long_symbol_num);
        packet.emit(hdr.long_symbol_text);
        packet.emit(hdr.error_report_message);
        packet.emit(hdr.flex_order_status_report_message);
        packet.emit(hdr.symbol_num_x);
        packet.emit(hdr.symbol_txt_x);
        packet.emit(hdr.multi_leg_num);
        packet.emit(hdr.multi_leg_num_leg_entry_num);
        packet.emit(hdr.multi_leg_txt);
        packet.emit(hdr.multi_leg_txt_leg_entry_txt);
        packet.emit(hdr.flex_error_report_message);
        packet.emit(hdr.drop_copy_initiate_operation_message);
        packet.emit(hdr.drop_copy_initiate_operation_confirmed_message);
        packet.emit(hdr.flex_drop_copy_initiate_operation_message);
        packet.emit(hdr.flex_drop_copy_initiate_operation_confirmed_message);
    }
}

V1Switch(
    TaifexderivativesDropcopyParser(),
    TaifexderivativesDropcopyVerifyChecksum(),
    TaifexderivativesDropcopyIngress(),
    TaifexderivativesDropcopyEgress(),
    TaifexderivativesDropcopyComputeChecksum(),
    TaifexderivativesDropcopyDeparser()
) main;
