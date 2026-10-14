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

header hdr_t {
    bit<16> msg_length;
    bit<32> msg_seq_num;
    bit<32> header_epoch_s;
    bit<16> header_ms;
    bit<8> message_type;
    bit<16> fcmid;
    bit<16> sessionid;
}

header wake_up_call_message_t {
    bit<8> statuscode_uint_81;
    bit<32> startinboundnum;
}

header wake_up_call_confirmed_message_t {
    bit<8> version;
}

header logon_notice_message_t {
    bit<8> statuscode_uint_81;
    bit<16> appendno;
    bit<32> endoutboundnum;
    bit<8> systemtype;
    bit<8> encrypt_method;
}

header final_sequential_number_notification_for_group_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<16> statuscode_uint_162;
    bit<8> partid;
    bit<32> endoutboundnum;
    bit<64> reserved_8;
}

header request_logon_message_t {
    bit<8> statuscode_uint_81;
    bit<16> appendno;
    bit<16> fcmid;
    bit<16> sessionid;
    bit<8> systemtype;
    bit<8> apcode;
    bit<8> keyvalue;
    bit<32> requeststartseq;
    bit<8> cancelordersec;
}

header activate_application_system_message_t {
    bit<8> statuscode_uint_81;
    bit<8> heart_bt_int;
    bit<16> maxflowctrlcnt;
}

header activate_application_system_confirmed_message_t {
    bit<8> statuscode_uint_81;
}

header logout_confirmed_message_t {
    bit<8> statuscode_uint_81;
}

header confirm_connection_message_t {
    bit<8> statuscode_uint_81;
}

header connection_confirmed_message_t {
    bit<8> statuscode_uint_81;
}

header order_status_report_message_t {
    bit<8> statuscode_uint_81;
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<8> symboltype;
}

header symbolnum_t {
    bit<16> pseq_1;
    bit<16> pseq_2;
    bit<8> legside_uint_822;
    bit<8> combop;
    bit<104> reserved_13;
}

header symboltext_t {
    bit<160> symbol_char_2020;
}

header order_status_report_long_format_message_t {
    bit<8> statuscode_uint_81;
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<8> symboltype;
}

header longsymbolnum_t {
    bit<16> pseq_1;
    bit<16> pseq_2;
    bit<8> legside_uint_822;
    bit<8> combop;
    bit<264> reserved_33;
}

header longsymboltext_t {
    bit<320> symbol_char_4040;
}

header error_report_message_t {
    bit<8> statuscode_uint_81;
    bit<8> exec_type;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<32> rptseq;
    bit<8> side;
}

header flex_order_status_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
    bit<8> no_leg;
    bit<16> statuscode_uint_162;
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
}

header symbolnumx_t {
    bit<32> pseq;
}

header symboltxtx_t {
    bit<160> prodid;
}

header multilegnum_t {
    bit<8> no_leg;
    bit<8> combop;
}

header multilegnum_legentrynum_t {
    bit<32> pseq;
    bit<8> legside_uint_81;
    bit<16> legqty_uint_162;
}

header multilegtxt_t {
    bit<8> no_leg;
    bit<8> combop;
}

header multilegtxt_legentrytxt_t {
    bit<160> prodid;
    bit<8> legside_uint_81;
    bit<16> legqty_uint_162;
}

header flex_error_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
    bit<8> ori_message_type;
    bit<16> statuscode_uint_162;
    bit<8> exec_type;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<32> rptseq;
    bit<8> side;
    bit<96> reserved_12;
}

header drop_copy_initiate_operation_message_t {
    bit<16> fcmid;
    bit<8> targetid;
    bit<32> reqcmseq;
}

header drop_copy_initiate_operation_confirmed_message_t {
    bit<8> statuscode_uint_81;
    bit<16> fcmid;
    bit<8> targetid;
    bit<32> reqcmseq;
}

header flex_drop_copy_initiate_operation_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
    bit<16> fcmid;
    bit<8> targetid;
    bit<32> reqcmseq;
}

header flex_drop_copy_initiate_operation_confirmed_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
    bit<16> statuscode_uint_162;
    bit<16> fcmid;
    bit<8> targetid;
    bit<32> reqcmseq;
    bit<128> reserved_16;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> multilegnum_legentrynum_remaining;
    bit<8> multilegtxt_legentrytxt_remaining;
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
    symbolnum_t symbolnum;
    symboltext_t symboltext;
    order_status_report_long_format_message_t order_status_report_long_format_message;
    longsymbolnum_t longsymbolnum;
    longsymboltext_t longsymboltext;
    error_report_message_t error_report_message;
    flex_order_status_report_message_t flex_order_status_report_message;
    symbolnumx_t symbolnumx;
    symboltxtx_t symboltxtx;
    multilegnum_t multilegnum;
    multilegnum_legentrynum_t multilegnum_legentrynum[MAX_MESSAGES];
    multilegtxt_t multilegtxt;
    multilegtxt_legentrytxt_t multilegtxt_legentrytxt[MAX_MESSAGES];
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
        transition select(hdr.order_status_report_message.symboltype) {
            8w1: parse_symbolnum;
            8w2: parse_symboltext;
            default: accept;
        }
    }

    state parse_symbolnum {
        packet.extract(hdr.symbolnum);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symboltext {
        packet.extract(hdr.symboltext);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_status_report_long_format_message {
        packet.extract(hdr.order_status_report_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.order_status_report_long_format_message.symboltype) {
            8w3: parse_longsymbolnum;
            8w4: parse_longsymboltext;
            default: accept;
        }
    }

    state parse_longsymbolnum {
        packet.extract(hdr.longsymbolnum);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_longsymboltext {
        packet.extract(hdr.longsymboltext);
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
            8w1: parse_symbolnumx;
            8w2: parse_symboltxtx;
            8w3: parse_multilegnum;
            8w4: parse_multilegtxt;
            default: accept;
        }
    }

    state parse_symbolnumx {
        packet.extract(hdr.symbolnumx);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symboltxtx {
        packet.extract(hdr.symboltxtx);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_multilegnum {
        packet.extract(hdr.multilegnum);
        meta.dispatched = 1;
        meta.multilegnum_legentrynum_remaining = hdr.multilegnum.no_leg;
        transition select(meta.multilegnum_legentrynum_remaining) {
            8w0: accept;
            default: parse_multilegnum_legentrynum;
        }
    }

    state parse_multilegnum_legentrynum {
        packet.extract(hdr.multilegnum_legentrynum.next);
        meta.multilegnum_legentrynum_remaining = meta.multilegnum_legentrynum_remaining - 1;
        transition select(meta.multilegnum_legentrynum_remaining) {
            8w0: accept;
            default: parse_multilegnum_legentrynum;
        }
    }

    state parse_multilegtxt {
        packet.extract(hdr.multilegtxt);
        meta.dispatched = 1;
        meta.multilegtxt_legentrytxt_remaining = hdr.multilegtxt.no_leg;
        transition select(meta.multilegtxt_legentrytxt_remaining) {
            8w0: accept;
            default: parse_multilegtxt_legentrytxt;
        }
    }

    state parse_multilegtxt_legentrytxt {
        packet.extract(hdr.multilegtxt_legentrytxt.next);
        meta.multilegtxt_legentrytxt_remaining = meta.multilegtxt_legentrytxt_remaining - 1;
        transition select(meta.multilegtxt_legentrytxt_remaining) {
            8w0: accept;
            default: parse_multilegtxt_legentrytxt;
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
        packet.emit(hdr.symbolnum);
        packet.emit(hdr.symboltext);
        packet.emit(hdr.order_status_report_long_format_message);
        packet.emit(hdr.longsymbolnum);
        packet.emit(hdr.longsymboltext);
        packet.emit(hdr.error_report_message);
        packet.emit(hdr.flex_order_status_report_message);
        packet.emit(hdr.symbolnumx);
        packet.emit(hdr.symboltxtx);
        packet.emit(hdr.multilegnum);
        packet.emit(hdr.multilegnum_legentrynum);
        packet.emit(hdr.multilegtxt);
        packet.emit(hdr.multilegtxt_legentrytxt);
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
