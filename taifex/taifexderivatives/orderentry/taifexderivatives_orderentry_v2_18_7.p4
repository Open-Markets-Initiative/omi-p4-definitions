// P4_16 (v1model) definition for: Taifex TaifexDerivatives OrderEntry Tmp v2.18.7
// 
// Protocol:
//   Organization: Taiwan Futures Exchange
//   Protocol: Order Entry
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

header resend_report_message_t {
    bit<8> statuscode_uint_81;
    bit<8> iseof;
    bit<32> filesize;
}

header resend_report_confirmed_message_t {
    bit<8> statuscode_uint_81;
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

header trade_session_status_request_message_t {
    bit<8> statuscode_uint_81;
    bit<16> trade_req_id;
    bit<8> flowgroupno;
    bit<8> subscription_request_type;
}

header trade_session_status_report_message_t {
    bit<8> statuscode_uint_81;
    bit<16> trade_req_id;
    bit<8> flowgroupno;
    bit<8> trade_status;
}

header order_input_message_t {
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

header order_input_long_format_message_t {
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

header price_inquiry_input_message_t {
    bit<40> orderno;
    bit<32> ordid;
    bit<16> fcmid;
    bit<8> symboltype;
}

header price_inquiry_input_long_format_message_t {
    bit<40> orderno;
    bit<32> ordid;
    bit<16> fcmid;
    bit<8> symboltype;
}

header price_inquiry_reply_message_t {
    bit<8> statuscode_uint_81;
    bit<40> orderno;
    bit<32> ordid;
    bit<16> fcmid;
    bit<8> symboltype;
}

header price_inquiry_reply_long_format_message_t {
    bit<8> statuscode_uint_81;
    bit<40> orderno;
    bit<32> ordid;
    bit<16> fcmid;
    bit<8> symboltype;
}

header quote_input_message_t {
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<8> symboltype;
}

header quote_input_long_format_message_t {
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<8> symboltype;
}

header condensed_version_order_status_report_message_t {
    bit<8> statuscode_uint_81;
    bit<8> exec_type;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<8> side;
    bit<8> position_effect;
    bit<16> leaves_qty;
    bit<16> beforeqty;
    bit<32> legpx;
    bit<16> legqty_uint_1624;
    bit<32> epochs_int_324;
    bit<16> ms;
    bit<32> uniqid;
    bit<32> rptseq;
    bit<8> protocoltype;
    bit<32> price;
}

header execution_report_including_head_office_and_branch_offices_message_t {
    bit<8> statuscode_uint_81;
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
    bit<8> symboltype;
}

header bulletin_request_message_t {
    bit<32> fcmreqid;
    bit<32> bulletinreqid;
    bit<8> systemtype;
}

header bulletin_report_message_t {
    bit<8> statuscode_uint_81;
    bit<32> fcmreqid;
    bit<32> bulletinseq;
    bit<32> epochs_int_324;
    bit<16> ms;
    bit<8> systemtype;
}

header system_notification_message_t {
    bit<8> statuscode_uint_81;
}

header flex_order_input_single_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
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

header flex_price_inquiry_input_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<40> orderno;
    bit<32> ordid;
    bit<16> fcmid;
}

header flex_quote_input_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> exec_type;
    bit<16> cmid;
    bit<16> fcmid;
    bit<40> orderno;
    bit<32> ordid;
    bit<64> userdefine;
}

header request_for_supplementary_flex_group_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
    bit<32> requeststartseq;
}

header temporary_suspension_of_supplementary_flex_group_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
}

header flex_product_definition_request_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> security_request_type;
    bit<32> security_req_id;
    bit<8> type_;
    bit<16> fcmid;
    bit<32> investoracno;
    bit<8> applicationtype;
    bit<24> rootsymbol;
    bit<8> expirytype;
    bit<64> contractdate;
    bit<32> strikeprice;
    bit<8> callputcode;
    bit<160> reserved_20;
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

header flex_price_inquiry_reply_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> partid;
    bit<16> statuscode_uint_162;
    bit<40> orderno;
    bit<32> ordid;
    bit<16> fcmid;
}

header send_flex_group_report_resend_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<16> statuscode_uint_162;
    bit<8> partid;
    bit<8> iseof;
    bit<32> filesize;
}

header flex_product_definition_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<8> security_request_type;
    bit<32> security_req_id;
    bit<16> statuscode_uint_162;
}

header flex_bulletin_request_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<32> fcmreqid;
    bit<32> bulletinreqid;
    bit<8> systemtype;
}

header flex_bulletin_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msgtimens;
    bit<16> statuscode_uint_162;
    bit<32> fcmreqid;
    bit<32> bulletinseq;
    bit<32> epochs_uint_324;
    bit<32> nanosecond;
    bit<8> systemtype;
}

header resend_report_message_data_uint_8_hdrmsglength_156_t {
    varbit<2048> data_uint_8_hdrmsglength_156;
}

header bulletin_request_message_data_char_hdrmsglength_159_t {
    varbit<2048> data_char_hdrmsglength_159;
}

header bulletin_report_message_data_char_hdrmsglength_1516_t {
    varbit<2048> data_char_hdrmsglength_1516;
}

header system_setting_message_data_char_hdrmsglength_15_t {
    varbit<2048> data_char_hdrmsglength_15;
}

header system_notification_message_data_char_hdrmsglength_151_t {
    varbit<2048> data_char_hdrmsglength_151;
}

header send_flex_group_report_resend_message_data_uint_8_hdrmsglength_1514_t {
    varbit<2048> data_uint_8_hdrmsglength_1514;
}

header flex_bulletin_request_message_data_char_hdrmsglength_1515_t {
    varbit<2048> data_char_hdrmsglength_1515;
}

header flex_bulletin_report_message_data_char_hdrmsglength_1525_t {
    varbit<2048> data_char_hdrmsglength_1525;
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
    resend_report_message_t resend_report_message;
    resend_report_confirmed_message_t resend_report_confirmed_message;
    activate_application_system_message_t activate_application_system_message;
    activate_application_system_confirmed_message_t activate_application_system_confirmed_message;
    logout_confirmed_message_t logout_confirmed_message;
    confirm_connection_message_t confirm_connection_message;
    connection_confirmed_message_t connection_confirmed_message;
    trade_session_status_request_message_t trade_session_status_request_message;
    trade_session_status_report_message_t trade_session_status_report_message;
    order_input_message_t order_input_message;
    symbolnum_t symbolnum;
    symboltext_t symboltext;
    order_input_long_format_message_t order_input_long_format_message;
    longsymbolnum_t longsymbolnum;
    longsymboltext_t longsymboltext;
    order_status_report_message_t order_status_report_message;
    order_status_report_long_format_message_t order_status_report_long_format_message;
    error_report_message_t error_report_message;
    price_inquiry_input_message_t price_inquiry_input_message;
    price_inquiry_input_long_format_message_t price_inquiry_input_long_format_message;
    price_inquiry_reply_message_t price_inquiry_reply_message;
    price_inquiry_reply_long_format_message_t price_inquiry_reply_long_format_message;
    quote_input_message_t quote_input_message;
    quote_input_long_format_message_t quote_input_long_format_message;
    condensed_version_order_status_report_message_t condensed_version_order_status_report_message;
    execution_report_including_head_office_and_branch_offices_message_t execution_report_including_head_office_and_branch_offices_message;
    bulletin_request_message_t bulletin_request_message;
    bulletin_report_message_t bulletin_report_message;
    system_notification_message_t system_notification_message;
    flex_order_input_single_message_t flex_order_input_single_message;
    symbolnumx_t symbolnumx;
    symboltxtx_t symboltxtx;
    multilegnum_t multilegnum;
    multilegnum_legentrynum_t multilegnum_legentrynum[MAX_MESSAGES];
    multilegtxt_t multilegtxt;
    multilegtxt_legentrytxt_t multilegtxt_legentrytxt[MAX_MESSAGES];
    flex_price_inquiry_input_message_t flex_price_inquiry_input_message;
    flex_quote_input_message_t flex_quote_input_message;
    request_for_supplementary_flex_group_report_message_t request_for_supplementary_flex_group_report_message;
    temporary_suspension_of_supplementary_flex_group_report_message_t temporary_suspension_of_supplementary_flex_group_report_message;
    flex_product_definition_request_message_t flex_product_definition_request_message;
    flex_order_status_report_message_t flex_order_status_report_message;
    flex_error_report_message_t flex_error_report_message;
    flex_price_inquiry_reply_message_t flex_price_inquiry_reply_message;
    send_flex_group_report_resend_message_t send_flex_group_report_resend_message;
    flex_product_definition_message_t flex_product_definition_message;
    flex_bulletin_request_message_t flex_bulletin_request_message;
    flex_bulletin_report_message_t flex_bulletin_report_message;
    resend_report_message_data_uint_8_hdrmsglength_156_t resend_report_message_data_uint_8_hdrmsglength_156;
    bulletin_request_message_data_char_hdrmsglength_159_t bulletin_request_message_data_char_hdrmsglength_159;
    bulletin_report_message_data_char_hdrmsglength_1516_t bulletin_report_message_data_char_hdrmsglength_1516;
    system_setting_message_data_char_hdrmsglength_15_t system_setting_message_data_char_hdrmsglength_15;
    system_notification_message_data_char_hdrmsglength_151_t system_notification_message_data_char_hdrmsglength_151;
    send_flex_group_report_resend_message_data_uint_8_hdrmsglength_1514_t send_flex_group_report_resend_message_data_uint_8_hdrmsglength_1514;
    flex_bulletin_request_message_data_char_hdrmsglength_1515_t flex_bulletin_request_message_data_char_hdrmsglength_1515;
    flex_bulletin_report_message_data_char_hdrmsglength_1525_t flex_bulletin_report_message_data_char_hdrmsglength_1525;
}

parser TaifexderivativesOrderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.hdr);
        transition select(hdr.hdr.message_type) {
            8w10: parse_wake_up_call_message;
            8w20: parse_wake_up_call_confirmed_message;
            8w30: parse_logon_notice_message;
            8w230: parse_final_sequential_number_notification_for_group_message;
            8w40: parse_request_logon_message;
            8w41: parse_resend_report_message;
            8w42: parse_resend_report_confirmed_message;
            8w50: parse_activate_application_system_message;
            8w60: parse_activate_application_system_confirmed_message;
            8w70: parse_logout_message;
            8w80: parse_logout_confirmed_message;
            8w104: parse_confirm_connection_message;
            8w105: parse_connection_confirmed_message;
            8w111: parse_trade_session_status_request_message;
            8w112: parse_trade_session_status_report_message;
            8w101: parse_order_input_message;
            8w131: parse_order_input_long_format_message;
            8w102: parse_order_status_report_message;
            8w132: parse_order_status_report_long_format_message;
            8w103: parse_error_report_message;
            8w107: parse_price_inquiry_input_message;
            8w137: parse_price_inquiry_input_long_format_message;
            8w108: parse_price_inquiry_reply_message;
            8w138: parse_price_inquiry_reply_long_format_message;
            8w109: parse_quote_input_message;
            8w139: parse_quote_input_long_format_message;
            8w122: parse_condensed_version_order_status_report_message;
            8w106: parse_execution_report_including_head_office_and_branch_offices_message;
            8w113: parse_bulletin_request_message;
            8w114: parse_bulletin_report_message;
            8w117: parse_system_setting_message;
            8w118: parse_system_notification_message;
            8w201: parse_flex_order_input_single_message;
            8w207: parse_flex_price_inquiry_input_message;
            8w209: parse_flex_quote_input_message;
            8w240: parse_request_for_supplementary_flex_group_report_message;
            8w242: parse_temporary_suspension_of_supplementary_flex_group_report_message;
            8w219: parse_flex_product_definition_request_message;
            8w202: parse_flex_order_status_report_message;
            8w203: parse_flex_error_report_message;
            8w208: parse_flex_price_inquiry_reply_message;
            8w241: parse_send_flex_group_report_resend_message;
            8w220: parse_flex_product_definition_message;
            8w213: parse_flex_bulletin_request_message;
            8w214: parse_flex_bulletin_report_message;
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

    state parse_resend_report_message {
        packet.extract(hdr.resend_report_message);
        meta.dispatched = 1;
        packet.extract(hdr.resend_report_message_data_uint_8_hdrmsglength_156, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_resend_report_confirmed_message {
        packet.extract(hdr.resend_report_confirmed_message);
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

    state parse_trade_session_status_request_message {
        packet.extract(hdr.trade_session_status_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_session_status_report_message {
        packet.extract(hdr.trade_session_status_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_input_message {
        packet.extract(hdr.order_input_message);
        meta.dispatched = 1;
        transition select(hdr.order_input_message.symboltype) {
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

    state parse_order_input_long_format_message {
        packet.extract(hdr.order_input_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.order_input_long_format_message.symboltype) {
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

    state parse_order_status_report_message {
        packet.extract(hdr.order_status_report_message);
        meta.dispatched = 1;
        transition select(hdr.order_status_report_message.symboltype) {
            8w1: parse_symbolnum;
            8w2: parse_symboltext;
            default: accept;
        }
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

    state parse_error_report_message {
        packet.extract(hdr.error_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_inquiry_input_message {
        packet.extract(hdr.price_inquiry_input_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_input_message.symboltype) {
            8w1: parse_symbolnum;
            8w2: parse_symboltext;
            default: accept;
        }
    }

    state parse_price_inquiry_input_long_format_message {
        packet.extract(hdr.price_inquiry_input_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_input_long_format_message.symboltype) {
            8w3: parse_longsymbolnum;
            8w4: parse_longsymboltext;
            default: accept;
        }
    }

    state parse_price_inquiry_reply_message {
        packet.extract(hdr.price_inquiry_reply_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_reply_message.symboltype) {
            8w1: parse_symbolnum;
            8w2: parse_symboltext;
            default: accept;
        }
    }

    state parse_price_inquiry_reply_long_format_message {
        packet.extract(hdr.price_inquiry_reply_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_reply_long_format_message.symboltype) {
            8w3: parse_longsymbolnum;
            8w4: parse_longsymboltext;
            default: accept;
        }
    }

    state parse_quote_input_message {
        packet.extract(hdr.quote_input_message);
        meta.dispatched = 1;
        transition select(hdr.quote_input_message.symboltype) {
            8w1: parse_symbolnum;
            8w2: parse_symboltext;
            default: accept;
        }
    }

    state parse_quote_input_long_format_message {
        packet.extract(hdr.quote_input_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.quote_input_long_format_message.symboltype) {
            8w3: parse_longsymbolnum;
            8w4: parse_longsymboltext;
            default: accept;
        }
    }

    state parse_condensed_version_order_status_report_message {
        packet.extract(hdr.condensed_version_order_status_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_including_head_office_and_branch_offices_message {
        packet.extract(hdr.execution_report_including_head_office_and_branch_offices_message);
        meta.dispatched = 1;
        transition select(hdr.execution_report_including_head_office_and_branch_offices_message.symboltype) {
            8w1: parse_symbolnum;
            8w2: parse_symboltext;
            default: accept;
        }
    }

    state parse_bulletin_request_message {
        packet.extract(hdr.bulletin_request_message);
        meta.dispatched = 1;
        packet.extract(hdr.bulletin_request_message_data_char_hdrmsglength_159, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_bulletin_report_message {
        packet.extract(hdr.bulletin_report_message);
        meta.dispatched = 1;
        packet.extract(hdr.bulletin_report_message_data_char_hdrmsglength_1516, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_system_setting_message {
        meta.dispatched = 1;
        packet.extract(hdr.system_setting_message_data_char_hdrmsglength_15, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_system_notification_message {
        packet.extract(hdr.system_notification_message);
        meta.dispatched = 1;
        packet.extract(hdr.system_notification_message_data_char_hdrmsglength_151, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_flex_order_input_single_message {
        packet.extract(hdr.flex_order_input_single_message);
        meta.dispatched = 1;
        transition select(hdr.flex_order_input_single_message.msg_type_ext) {
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

    state parse_flex_price_inquiry_input_message {
        packet.extract(hdr.flex_price_inquiry_input_message);
        meta.dispatched = 1;
        transition select(hdr.flex_price_inquiry_input_message.msg_type_ext) {
            8w1: parse_symbolnumx;
            8w2: parse_symboltxtx;
            8w3: parse_multilegnum;
            8w4: parse_multilegtxt;
            default: accept;
        }
    }

    state parse_flex_quote_input_message {
        packet.extract(hdr.flex_quote_input_message);
        meta.dispatched = 1;
        transition select(hdr.flex_quote_input_message.msg_type_ext) {
            8w1: parse_symbolnumx;
            8w2: parse_symboltxtx;
            8w3: parse_multilegnum;
            8w4: parse_multilegtxt;
            default: accept;
        }
    }

    state parse_request_for_supplementary_flex_group_report_message {
        packet.extract(hdr.request_for_supplementary_flex_group_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_temporary_suspension_of_supplementary_flex_group_report_message {
        packet.extract(hdr.temporary_suspension_of_supplementary_flex_group_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flex_product_definition_request_message {
        packet.extract(hdr.flex_product_definition_request_message);
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

    state parse_flex_error_report_message {
        packet.extract(hdr.flex_error_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flex_price_inquiry_reply_message {
        packet.extract(hdr.flex_price_inquiry_reply_message);
        meta.dispatched = 1;
        transition select(hdr.flex_price_inquiry_reply_message.msg_type_ext) {
            8w1: parse_symbolnumx;
            8w2: parse_symboltxtx;
            8w3: parse_multilegnum;
            8w4: parse_multilegtxt;
            default: accept;
        }
    }

    state parse_send_flex_group_report_resend_message {
        packet.extract(hdr.send_flex_group_report_resend_message);
        meta.dispatched = 1;
        packet.extract(hdr.send_flex_group_report_resend_message_data_uint_8_hdrmsglength_1514, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_flex_product_definition_message {
        packet.extract(hdr.flex_product_definition_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flex_bulletin_request_message {
        packet.extract(hdr.flex_bulletin_request_message);
        meta.dispatched = 1;
        packet.extract(hdr.flex_bulletin_request_message_data_char_hdrmsglength_1515, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_flex_bulletin_report_message {
        packet.extract(hdr.flex_bulletin_report_message);
        meta.dispatched = 1;
        packet.extract(hdr.flex_bulletin_report_message_data_char_hdrmsglength_1525, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

}

control TaifexderivativesOrderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control TaifexderivativesOrderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control TaifexderivativesOrderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control TaifexderivativesOrderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control TaifexderivativesOrderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.hdr);
        packet.emit(hdr.wake_up_call_message);
        packet.emit(hdr.wake_up_call_confirmed_message);
        packet.emit(hdr.logon_notice_message);
        packet.emit(hdr.final_sequential_number_notification_for_group_message);
        packet.emit(hdr.request_logon_message);
        packet.emit(hdr.resend_report_message);
        packet.emit(hdr.resend_report_message_data_uint_8_hdrmsglength_156);
        packet.emit(hdr.resend_report_confirmed_message);
        packet.emit(hdr.activate_application_system_message);
        packet.emit(hdr.activate_application_system_confirmed_message);
        packet.emit(hdr.logout_confirmed_message);
        packet.emit(hdr.confirm_connection_message);
        packet.emit(hdr.connection_confirmed_message);
        packet.emit(hdr.trade_session_status_request_message);
        packet.emit(hdr.trade_session_status_report_message);
        packet.emit(hdr.order_input_message);
        packet.emit(hdr.symbolnum);
        packet.emit(hdr.symboltext);
        packet.emit(hdr.order_input_long_format_message);
        packet.emit(hdr.longsymbolnum);
        packet.emit(hdr.longsymboltext);
        packet.emit(hdr.order_status_report_message);
        packet.emit(hdr.order_status_report_long_format_message);
        packet.emit(hdr.error_report_message);
        packet.emit(hdr.price_inquiry_input_message);
        packet.emit(hdr.price_inquiry_input_long_format_message);
        packet.emit(hdr.price_inquiry_reply_message);
        packet.emit(hdr.price_inquiry_reply_long_format_message);
        packet.emit(hdr.quote_input_message);
        packet.emit(hdr.quote_input_long_format_message);
        packet.emit(hdr.condensed_version_order_status_report_message);
        packet.emit(hdr.execution_report_including_head_office_and_branch_offices_message);
        packet.emit(hdr.bulletin_request_message);
        packet.emit(hdr.bulletin_request_message_data_char_hdrmsglength_159);
        packet.emit(hdr.bulletin_report_message);
        packet.emit(hdr.bulletin_report_message_data_char_hdrmsglength_1516);
        packet.emit(hdr.system_setting_message_data_char_hdrmsglength_15);
        packet.emit(hdr.system_notification_message);
        packet.emit(hdr.system_notification_message_data_char_hdrmsglength_151);
        packet.emit(hdr.flex_order_input_single_message);
        packet.emit(hdr.symbolnumx);
        packet.emit(hdr.symboltxtx);
        packet.emit(hdr.multilegnum);
        packet.emit(hdr.multilegnum_legentrynum);
        packet.emit(hdr.multilegtxt);
        packet.emit(hdr.multilegtxt_legentrytxt);
        packet.emit(hdr.flex_price_inquiry_input_message);
        packet.emit(hdr.flex_quote_input_message);
        packet.emit(hdr.request_for_supplementary_flex_group_report_message);
        packet.emit(hdr.temporary_suspension_of_supplementary_flex_group_report_message);
        packet.emit(hdr.flex_product_definition_request_message);
        packet.emit(hdr.flex_order_status_report_message);
        packet.emit(hdr.flex_error_report_message);
        packet.emit(hdr.flex_price_inquiry_reply_message);
        packet.emit(hdr.send_flex_group_report_resend_message);
        packet.emit(hdr.send_flex_group_report_resend_message_data_uint_8_hdrmsglength_1514);
        packet.emit(hdr.flex_product_definition_message);
        packet.emit(hdr.flex_bulletin_request_message);
        packet.emit(hdr.flex_bulletin_request_message_data_char_hdrmsglength_1515);
        packet.emit(hdr.flex_bulletin_report_message);
        packet.emit(hdr.flex_bulletin_report_message_data_char_hdrmsglength_1525);
    }
}

V1Switch(
    TaifexderivativesOrderentryParser(),
    TaifexderivativesOrderentryVerifyChecksum(),
    TaifexderivativesOrderentryIngress(),
    TaifexderivativesOrderentryEgress(),
    TaifexderivativesOrderentryComputeChecksum(),
    TaifexderivativesOrderentryDeparser()
) main;
