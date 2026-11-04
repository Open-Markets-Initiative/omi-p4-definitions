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

header resend_report_message_t {
    bit<8> status_code_uint_81;
    bit<8> is_eof;
    bit<32> file_size;
}

header resend_report_confirmed_message_t {
    bit<8> status_code_uint_81;
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

header trade_session_status_request_message_t {
    bit<8> status_code_uint_81;
    bit<16> trade_req_id;
    bit<8> flow_group_no;
    bit<8> subscription_request_type;
}

header trade_session_status_report_message_t {
    bit<8> status_code_uint_81;
    bit<16> trade_req_id;
    bit<8> flow_group_no;
    bit<8> trade_status;
}

header order_input_message_t {
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

header order_input_long_format_message_t {
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

header price_inquiry_input_message_t {
    bit<40> order_no;
    bit<32> ord_id;
    bit<16> fcm_id;
    bit<8> symbol_type;
}

header price_inquiry_input_long_format_message_t {
    bit<40> order_no;
    bit<32> ord_id;
    bit<16> fcm_id;
    bit<8> symbol_type;
}

header price_inquiry_reply_message_t {
    bit<8> status_code_uint_81;
    bit<40> order_no;
    bit<32> ord_id;
    bit<16> fcm_id;
    bit<8> symbol_type;
}

header price_inquiry_reply_long_format_message_t {
    bit<8> status_code_uint_81;
    bit<40> order_no;
    bit<32> ord_id;
    bit<16> fcm_id;
    bit<8> symbol_type;
}

header quote_input_message_t {
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<8> symbol_type;
}

header quote_input_long_format_message_t {
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<8> symbol_type;
}

header condensed_version_order_status_report_message_t {
    bit<8> status_code_uint_81;
    bit<8> exec_type;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<8> side;
    bit<8> position_effect;
    bit<16> leaves_qty;
    bit<16> before_qty;
    bit<32> leg_px;
    bit<16> leg_qty_uint_1624;
    bit<32> epoch_s_int_324;
    bit<16> ms;
    bit<32> uniq_id;
    bit<32> rpt_seq;
    bit<8> protocol_type;
    bit<32> price;
}

header execution_report_including_head_office_and_branch_offices_message_t {
    bit<8> status_code_uint_81;
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
    bit<8> symbol_type;
}

header bulletin_request_message_t {
    bit<32> fcm_req_id;
    bit<32> bulletin_req_id;
    bit<8> system_type;
}

header bulletin_report_message_t {
    bit<8> status_code_uint_81;
    bit<32> fcm_req_id;
    bit<32> bulletin_seq;
    bit<32> epoch_s_int_324;
    bit<16> ms;
    bit<8> system_type;
}

header system_notification_message_t {
    bit<8> status_code_uint_81;
}

header flex_order_input_single_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
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

header flex_price_inquiry_input_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<40> order_no;
    bit<32> ord_id;
    bit<16> fcm_id;
}

header flex_quote_input_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> exec_type;
    bit<16> cm_id;
    bit<16> fcm_id;
    bit<40> order_no;
    bit<32> ord_id;
    bit<64> user_define;
}

header request_for_supplementary_flex_group_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
    bit<32> request_start_seq;
}

header temporary_suspension_of_supplementary_flex_group_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
}

header flex_product_definition_request_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> security_request_type;
    bit<32> security_req_id;
    bit<8> type_;
    bit<16> fcm_id;
    bit<32> investor_acno;
    bit<8> application_type;
    bit<24> root_symbol;
    bit<8> expiry_type;
    bit<64> contract_date;
    bit<32> strike_price;
    bit<8> call_put_code;
    bit<160> reserved_20;
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

header flex_price_inquiry_reply_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> part_id;
    bit<16> status_code_uint_162;
    bit<40> order_no;
    bit<32> ord_id;
    bit<16> fcm_id;
}

header send_flex_group_report_resend_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<16> status_code_uint_162;
    bit<8> part_id;
    bit<8> is_eof;
    bit<32> file_size;
}

header flex_product_definition_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<8> security_request_type;
    bit<32> security_req_id;
    bit<16> status_code_uint_162;
}

header flex_bulletin_request_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<32> fcm_req_id;
    bit<32> bulletin_req_id;
    bit<8> system_type;
}

header flex_bulletin_report_message_t {
    bit<8> msg_type_ext;
    bit<8> preserve;
    bit<32> msg_time_ns;
    bit<16> status_code_uint_162;
    bit<32> fcm_req_id;
    bit<32> bulletin_seq;
    bit<32> epoch_s_uint_324;
    bit<32> nanosecond;
    bit<8> system_type;
}

header resend_report_message_data_uint_8_hdr_msg_length_156_t {
    varbit<2048> data_uint_8_hdr_msg_length_156;
}

header bulletin_request_message_data_char_hdr_msg_length_159_t {
    varbit<2048> data_char_hdr_msg_length_159;
}

header bulletin_report_message_data_char_hdr_msg_length_1516_t {
    varbit<2048> data_char_hdr_msg_length_1516;
}

header system_setting_message_data_char_hdr_msg_length_15_t {
    varbit<2048> data_char_hdr_msg_length_15;
}

header system_notification_message_data_char_hdr_msg_length_151_t {
    varbit<2048> data_char_hdr_msg_length_151;
}

header send_flex_group_report_resend_message_data_uint_8_hdr_msg_length_1514_t {
    varbit<2048> data_uint_8_hdr_msg_length_1514;
}

header flex_bulletin_request_message_data_char_hdr_msg_length_1515_t {
    varbit<2048> data_char_hdr_msg_length_1515;
}

header flex_bulletin_report_message_data_char_hdr_msg_length_1525_t {
    varbit<2048> data_char_hdr_msg_length_1525;
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
    symbol_num_t symbol_num;
    symbol_text_t symbol_text;
    order_input_long_format_message_t order_input_long_format_message;
    long_symbol_num_t long_symbol_num;
    long_symbol_text_t long_symbol_text;
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
    symbol_num_x_t symbol_num_x;
    symbol_txt_x_t symbol_txt_x;
    multi_leg_num_t multi_leg_num;
    multi_leg_num_leg_entry_num_t multi_leg_num_leg_entry_num[MAX_MESSAGES];
    multi_leg_txt_t multi_leg_txt;
    multi_leg_txt_leg_entry_txt_t multi_leg_txt_leg_entry_txt[MAX_MESSAGES];
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
    resend_report_message_data_uint_8_hdr_msg_length_156_t resend_report_message_data_uint_8_hdr_msg_length_156;
    bulletin_request_message_data_char_hdr_msg_length_159_t bulletin_request_message_data_char_hdr_msg_length_159;
    bulletin_report_message_data_char_hdr_msg_length_1516_t bulletin_report_message_data_char_hdr_msg_length_1516;
    system_setting_message_data_char_hdr_msg_length_15_t system_setting_message_data_char_hdr_msg_length_15;
    system_notification_message_data_char_hdr_msg_length_151_t system_notification_message_data_char_hdr_msg_length_151;
    send_flex_group_report_resend_message_data_uint_8_hdr_msg_length_1514_t send_flex_group_report_resend_message_data_uint_8_hdr_msg_length_1514;
    flex_bulletin_request_message_data_char_hdr_msg_length_1515_t flex_bulletin_request_message_data_char_hdr_msg_length_1515;
    flex_bulletin_report_message_data_char_hdr_msg_length_1525_t flex_bulletin_report_message_data_char_hdr_msg_length_1525;
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
        packet.extract(hdr.resend_report_message_data_uint_8_hdr_msg_length_156, (bit<32>)hdr.hdr.msg_length * 8);
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
        transition select(hdr.order_input_message.symbol_type) {
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

    state parse_order_input_long_format_message {
        packet.extract(hdr.order_input_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.order_input_long_format_message.symbol_type) {
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

    state parse_order_status_report_message {
        packet.extract(hdr.order_status_report_message);
        meta.dispatched = 1;
        transition select(hdr.order_status_report_message.symbol_type) {
            8w1: parse_symbol_num;
            8w2: parse_symbol_text;
            default: accept;
        }
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

    state parse_error_report_message {
        packet.extract(hdr.error_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_inquiry_input_message {
        packet.extract(hdr.price_inquiry_input_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_input_message.symbol_type) {
            8w1: parse_symbol_num;
            8w2: parse_symbol_text;
            default: accept;
        }
    }

    state parse_price_inquiry_input_long_format_message {
        packet.extract(hdr.price_inquiry_input_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_input_long_format_message.symbol_type) {
            8w3: parse_long_symbol_num;
            8w4: parse_long_symbol_text;
            default: accept;
        }
    }

    state parse_price_inquiry_reply_message {
        packet.extract(hdr.price_inquiry_reply_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_reply_message.symbol_type) {
            8w1: parse_symbol_num;
            8w2: parse_symbol_text;
            default: accept;
        }
    }

    state parse_price_inquiry_reply_long_format_message {
        packet.extract(hdr.price_inquiry_reply_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.price_inquiry_reply_long_format_message.symbol_type) {
            8w3: parse_long_symbol_num;
            8w4: parse_long_symbol_text;
            default: accept;
        }
    }

    state parse_quote_input_message {
        packet.extract(hdr.quote_input_message);
        meta.dispatched = 1;
        transition select(hdr.quote_input_message.symbol_type) {
            8w1: parse_symbol_num;
            8w2: parse_symbol_text;
            default: accept;
        }
    }

    state parse_quote_input_long_format_message {
        packet.extract(hdr.quote_input_long_format_message);
        meta.dispatched = 1;
        transition select(hdr.quote_input_long_format_message.symbol_type) {
            8w3: parse_long_symbol_num;
            8w4: parse_long_symbol_text;
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
        transition select(hdr.execution_report_including_head_office_and_branch_offices_message.symbol_type) {
            8w1: parse_symbol_num;
            8w2: parse_symbol_text;
            default: accept;
        }
    }

    state parse_bulletin_request_message {
        packet.extract(hdr.bulletin_request_message);
        meta.dispatched = 1;
        packet.extract(hdr.bulletin_request_message_data_char_hdr_msg_length_159, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_bulletin_report_message {
        packet.extract(hdr.bulletin_report_message);
        meta.dispatched = 1;
        packet.extract(hdr.bulletin_report_message_data_char_hdr_msg_length_1516, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_system_setting_message {
        meta.dispatched = 1;
        packet.extract(hdr.system_setting_message_data_char_hdr_msg_length_15, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_system_notification_message {
        packet.extract(hdr.system_notification_message);
        meta.dispatched = 1;
        packet.extract(hdr.system_notification_message_data_char_hdr_msg_length_151, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_flex_order_input_single_message {
        packet.extract(hdr.flex_order_input_single_message);
        meta.dispatched = 1;
        transition select(hdr.flex_order_input_single_message.msg_type_ext) {
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

    state parse_flex_price_inquiry_input_message {
        packet.extract(hdr.flex_price_inquiry_input_message);
        meta.dispatched = 1;
        transition select(hdr.flex_price_inquiry_input_message.msg_type_ext) {
            8w1: parse_symbol_num_x;
            8w2: parse_symbol_txt_x;
            8w3: parse_multi_leg_num;
            8w4: parse_multi_leg_txt;
            default: accept;
        }
    }

    state parse_flex_quote_input_message {
        packet.extract(hdr.flex_quote_input_message);
        meta.dispatched = 1;
        transition select(hdr.flex_quote_input_message.msg_type_ext) {
            8w1: parse_symbol_num_x;
            8w2: parse_symbol_txt_x;
            8w3: parse_multi_leg_num;
            8w4: parse_multi_leg_txt;
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
            8w1: parse_symbol_num_x;
            8w2: parse_symbol_txt_x;
            8w3: parse_multi_leg_num;
            8w4: parse_multi_leg_txt;
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
            8w1: parse_symbol_num_x;
            8w2: parse_symbol_txt_x;
            8w3: parse_multi_leg_num;
            8w4: parse_multi_leg_txt;
            default: accept;
        }
    }

    state parse_send_flex_group_report_resend_message {
        packet.extract(hdr.send_flex_group_report_resend_message);
        meta.dispatched = 1;
        packet.extract(hdr.send_flex_group_report_resend_message_data_uint_8_hdr_msg_length_1514, (bit<32>)hdr.hdr.msg_length * 8);
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
        packet.extract(hdr.flex_bulletin_request_message_data_char_hdr_msg_length_1515, (bit<32>)hdr.hdr.msg_length * 8);
        transition accept;
    }

    state parse_flex_bulletin_report_message {
        packet.extract(hdr.flex_bulletin_report_message);
        meta.dispatched = 1;
        packet.extract(hdr.flex_bulletin_report_message_data_char_hdr_msg_length_1525, (bit<32>)hdr.hdr.msg_length * 8);
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
        packet.emit(hdr.resend_report_message_data_uint_8_hdr_msg_length_156);
        packet.emit(hdr.resend_report_confirmed_message);
        packet.emit(hdr.activate_application_system_message);
        packet.emit(hdr.activate_application_system_confirmed_message);
        packet.emit(hdr.logout_confirmed_message);
        packet.emit(hdr.confirm_connection_message);
        packet.emit(hdr.connection_confirmed_message);
        packet.emit(hdr.trade_session_status_request_message);
        packet.emit(hdr.trade_session_status_report_message);
        packet.emit(hdr.order_input_message);
        packet.emit(hdr.symbol_num);
        packet.emit(hdr.symbol_text);
        packet.emit(hdr.order_input_long_format_message);
        packet.emit(hdr.long_symbol_num);
        packet.emit(hdr.long_symbol_text);
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
        packet.emit(hdr.bulletin_request_message_data_char_hdr_msg_length_159);
        packet.emit(hdr.bulletin_report_message);
        packet.emit(hdr.bulletin_report_message_data_char_hdr_msg_length_1516);
        packet.emit(hdr.system_setting_message_data_char_hdr_msg_length_15);
        packet.emit(hdr.system_notification_message);
        packet.emit(hdr.system_notification_message_data_char_hdr_msg_length_151);
        packet.emit(hdr.flex_order_input_single_message);
        packet.emit(hdr.symbol_num_x);
        packet.emit(hdr.symbol_txt_x);
        packet.emit(hdr.multi_leg_num);
        packet.emit(hdr.multi_leg_num_leg_entry_num);
        packet.emit(hdr.multi_leg_txt);
        packet.emit(hdr.multi_leg_txt_leg_entry_txt);
        packet.emit(hdr.flex_price_inquiry_input_message);
        packet.emit(hdr.flex_quote_input_message);
        packet.emit(hdr.request_for_supplementary_flex_group_report_message);
        packet.emit(hdr.temporary_suspension_of_supplementary_flex_group_report_message);
        packet.emit(hdr.flex_product_definition_request_message);
        packet.emit(hdr.flex_order_status_report_message);
        packet.emit(hdr.flex_error_report_message);
        packet.emit(hdr.flex_price_inquiry_reply_message);
        packet.emit(hdr.send_flex_group_report_resend_message);
        packet.emit(hdr.send_flex_group_report_resend_message_data_uint_8_hdr_msg_length_1514);
        packet.emit(hdr.flex_product_definition_message);
        packet.emit(hdr.flex_bulletin_request_message);
        packet.emit(hdr.flex_bulletin_request_message_data_char_hdr_msg_length_1515);
        packet.emit(hdr.flex_bulletin_report_message);
        packet.emit(hdr.flex_bulletin_report_message_data_char_hdr_msg_length_1525);
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
