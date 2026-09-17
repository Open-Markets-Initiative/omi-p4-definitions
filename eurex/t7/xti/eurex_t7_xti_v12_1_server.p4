// P4_16 (v1model) definition for: Eurex T7 Xti Fbe v12.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Cash Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 12.1
//   Date: 3/11/2024
//   Specification: T7_R.12.1_Enhanced_Trading_Interface_-_Cash_Message_Reference_Version_2.pdf
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

header broadcast_error_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> appl_id_status;
    bit<32> ref_appl_sub_id;
    bit<16> var_text_len;
    bit<8> ref_appl_id;
    bit<8> session_status;
}

header cross_request_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> exec_id;
}

header delete_all_order_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> mass_action_report_id;
    bit<64> security_id;
    bit<64> price;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> target_party_id_executing_trader;
    bit<32> party_id_entering_trader;
    bit<16> no_not_affected_orders;
    bit<16> no_affected_orders;
    bit<16> no_affected_order_requests;
    bit<8> party_id_entering_firm;
    bit<8> mass_action_reason;
    bit<8> exec_inst;
    bit<8> side;
    bit<48> pad6;
}

header delete_all_order_broadcast_not_affected_orders_grp_comp_t {
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
}

header delete_all_order_broadcast_affected_ord_grp_comp_t {
    bit<64> affected_order_id;
    bit<64> affected_orig_cl_ord_id;
}

header delete_all_order_broadcast_affected_order_requests_grp_comp_t {
    bit<32> affected_order_request_id;
    bit<32> pad4;
}

header delete_all_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> mass_action_report_id;
}

header delete_all_order_quote_event_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> mass_action_report_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<8> mass_action_reason;
    bit<8> exec_inst;
    bit<16> pad2v2;
}

header delete_all_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<128> appl_msg_id;
    bit<8> last_fragment;
    bit<64> mass_action_report_id;
    bit<16> no_not_affected_orders;
    bit<16> no_affected_orders;
    bit<16> no_affected_order_requests;
    bit<16> pad2v2;
}

header delete_all_order_response_not_affected_orders_grp_comp_t {
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
}

header delete_all_order_response_affected_ord_grp_comp_t {
    bit<64> affected_order_id;
    bit<64> affected_orig_cl_ord_id;
}

header delete_all_order_response_affected_order_requests_grp_comp_t {
    bit<32> affected_order_request_id;
    bit<32> pad4;
}

header delete_all_quote_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> mass_action_report_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> party_id_entering_trader;
    bit<32> target_party_id_executing_trader;
    bit<16> no_not_affected_securities;
    bit<8> mass_action_reason;
    bit<8> party_id_entering_firm;
    bit<24> target_party_id_desk_id;
    bit<8> pad1;
}

header delete_all_quote_broadcast_not_affected_securities_grp_comp_t {
    bit<64> not_affected_security_id;
}

header delete_all_quote_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> mass_action_report_id;
    bit<16> no_not_affected_securities;
    bit<48> pad6;
}

header delete_all_quote_response_not_affected_securities_grp_comp_t {
    bit<64> not_affected_security_id;
}

header delete_order_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> quote_id;
    bit<32> order_id_sfx;
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<32> party_id_session_id;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<8> order_event_type;
    bit<160> fix_cl_ord_id;
    bit<40> party_entering_firm;
    bit<48> party_entering_trader;
    bit<16> pad2v2;
}

header delete_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> transaction_delay_indicator;
    bit<56> pad7;
}

header delete_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<128> appl_msg_id;
    bit<8> last_fragment;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> transaction_delay_indicator;
    bit<56> pad7;
}

header extended_deletion_report_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> trd_reg_ts_entry_time;
    bit<64> price;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> order_qty;
    bit<64> display_qty;
    bit<64> display_low_qty;
    bit<64> display_high_qty;
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> expire_date;
    bit<32> match_inst_cross_id;
    bit<32> party_id_executing_unit;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<32> party_id_entering_trader;
    bit<16> exec_restatement_reason;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<8> ord_type;
    bit<8> trading_capacity;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> appl_seq_indicator;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<40> party_entering_firm;
    bit<48> party_entering_trader;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<160> fix_cl_ord_id;
    bit<8> triggered;
    bit<16> pad2v2;
}

header forced_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<16> var_text_len;
}

header forced_user_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> username;
    bit<16> var_text_len;
    bit<8> user_status;
}

header heartbeat_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
}

header inquire_enrichment_rule_id_list_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<128> last_entity_processed;
    bit<16> no_enrichment_rules;
    bit<48> pad6;
}

header inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_t {
    bit<16> enrichment_rule_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<48> pad6;
}

header inquire_session_list_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<16> no_sessions;
    bit<48> pad6;
}

header inquire_session_list_response_sessions_grp_comp_t {
    bit<32> party_id_session_id;
    bit<8> session_mode;
    bit<8> session_sub_mode;
    bit<16> pad2;
}

header inquire_user_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<128> last_entity_processed;
    bit<16> no_party_details;
    bit<48> pad6;
}

header inquire_user_response_party_details_grp_comp_t {
    bit<32> party_detail_id_executing_trader;
    bit<48> party_detail_executing_trader;
    bit<8> party_detail_role_qualifier;
    bit<8> party_detail_status;
    bit<24> party_detail_desk_id;
    bit<8> pad1;
}

header issuer_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> transact_time;
    bit<64> last_px;
    bit<64> potential_exec_volume;
    bit<64> last_qty;
    bit<64> imbalance_qty;
    bit<32> market_segment_id;
    bit<32> party_id_session_id;
    bit<8> security_trading_status;
    bit<56> pad7_2;
}

header issuer_security_state_change_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> security_status_report_id;
}

header legal_notification_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<16> var_text_len;
    bit<8> user_status;
}

header logon_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> throttle_time_interval;
    bit<32> throttle_no_msgs;
    bit<32> throttle_disconnect_limit;
    bit<32> heart_bt_int;
    bit<32> session_instance_id;
    bit<32> latest_public_key_seq_no;
    bit<16> public_key_len;
    bit<16> market_id;
    bit<8> trad_ses_mode;
    bit<240> default_cstm_appl_ver_id;
    bit<40> default_cstm_appl_ver_sub_id;
}

header logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header mass_quote_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> quote_id;
    bit<64> quote_response_id;
    bit<32> market_segment_id;
    bit<8> no_quote_side_entries;
    bit<24> pad3_2;
}

header mass_quote_response_quote_entry_ack_grp_comp_t {
    bit<64> security_id;
    bit<64> cxl_size;
    bit<32> quote_entry_reject_reason;
    bit<8> quote_entry_status;
    bit<8> side;
    bit<16> pad2;
}

header modify_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> stop_px;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> display_qty;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> bbo_setting;
    bit<8> no_order_events;
    bit<24> pad3_2;
}

header modify_order_nr_response_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header modify_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<128> appl_msg_id;
    bit<8> last_fragment;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> stop_px;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> display_qty;
    bit<64> trd_reg_ts_time_priority;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> bbo_setting;
    bit<8> no_order_events;
    bit<24> pad3;
}

header modify_order_response_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header new_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> leaves_qty;
    bit<64> cxl_qty;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> bbo_setting;
    bit<8> no_order_events;
    bit<24> pad3_2;
}

header new_order_nr_response_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header new_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<128> appl_msg_id;
    bit<8> last_fragment;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> leaves_qty;
    bit<64> cxl_qty;
    bit<64> trd_reg_ts_entry_time;
    bit<64> trd_reg_ts_time_priority;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> bbo_setting;
    bit<8> no_order_events;
    bit<24> pad3;
}

header new_order_response_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header news_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> orig_time;
    bit<16> var_text_len;
    bit<2048> headline;
}

header order_exec_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> display_qty;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> order_event_type;
    bit<8> match_type;
    bit<8> triggered;
    bit<8> crossed_indicator;
    bit<8> bbo_setting;
    bit<160> fix_cl_ord_id;
    bit<8> no_fills;
    bit<8> no_order_events;
}

header order_exec_notification_fills_grp_comp_t {
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7;
}

header order_exec_notification_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header order_exec_report_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> trd_reg_ts_entry_time;
    bit<64> trd_reg_ts_time_priority;
    bit<64> price;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> order_qty;
    bit<64> display_qty;
    bit<64> display_low_qty;
    bit<64> display_high_qty;
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> expire_date;
    bit<32> match_inst_cross_id;
    bit<32> party_id_executing_unit;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<32> party_id_entering_trader;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> order_event_type;
    bit<8> match_type;
    bit<8> side;
    bit<8> ord_type;
    bit<8> trading_capacity;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> appl_seq_indicator;
    bit<40> party_entering_firm;
    bit<48> party_entering_trader;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<160> fix_cl_ord_id;
    bit<8> no_fills;
    bit<8> no_order_events;
    bit<8> triggered;
    bit<8> crossed_indicator;
    bit<8> trade_at_close_opt_in;
    bit<8> bbo_setting;
    bit<16> pad2v2;
}

header order_exec_report_broadcast_fills_grp_comp_t {
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7;
}

header order_exec_report_broadcast_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header order_exec_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<16> partition_id;
    bit<8> appl_id;
    bit<128> appl_msg_id;
    bit<8> last_fragment;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> trd_reg_ts_entry_time;
    bit<64> trd_reg_ts_time_priority;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> display_qty;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> match_type;
    bit<8> triggered;
    bit<8> crossed_indicator;
    bit<8> transaction_delay_indicator;
    bit<8> bbo_setting;
    bit<8> no_fills;
    bit<8> no_order_events;
    bit<32> pad4;
}

header order_exec_response_fills_grp_comp_t {
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7;
}

header order_exec_response_order_event_grp_comp_t {
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header party_action_report_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<32> trade_date;
    bit<32> requesting_party_id_executing_trader;
    bit<32> party_id_executing_unit;
    bit<32> party_id_executing_trader;
    bit<32> requesting_party_id_executing_system;
    bit<16> market_id;
    bit<8> party_action_type;
    bit<8> requesting_party_id_entering_firm;
}

header party_entitlements_update_report_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
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

header ping_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> transact_time;
}

header pre_trade_risk_limit_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> risk_limit_report_id;
    bit<32> market_segment_id;
    bit<8> no_risk_limits;
    bit<8> party_detail_status;
    bit<40> party_detail_executing_unit;
    bit<40> pad5;
}

header pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_t {
    bit<64> risk_limit_amount;
    bit<64> risk_limit_open_amount;
    bit<64> risk_limit_net_position_amount;
    bit<32> activation_date;
    bit<8> risk_limit_type;
    bit<8> risk_limit_requesting_party_role;
    bit<8> risk_limit_violation_indicator;
    bit<24> risk_limit_group;
    bit<48> pad6;
}

header quote_activation_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> mass_action_report_id;
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<16> no_not_affected_securities;
    bit<8> party_id_entering_firm;
    bit<8> mass_action_type;
    bit<8> mass_action_reason;
    bit<24> pad3;
}

header quote_activation_notification_not_affected_securities_grp_comp_t {
    bit<64> not_affected_security_id;
}

header quote_activation_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> mass_action_report_id;
    bit<16> no_not_affected_securities;
    bit<48> pad6;
}

header quote_activation_response_not_affected_securities_grp_comp_t {
    bit<64> not_affected_security_id;
}

header quote_execution_report_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> exec_id;
    bit<32> market_segment_id;
    bit<8> no_quote_events;
    bit<24> pad3;
}

header quote_execution_report_quote_event_grp_comp_t {
    bit<64> security_id;
    bit<64> quote_event_px;
    bit<64> quote_event_qty;
    bit<64> quote_msg_id;
    bit<32> quote_event_match_id;
    bit<32> quote_event_exec_id;
    bit<8> quote_event_type;
    bit<8> quote_event_side;
    bit<8> quote_event_liquidity_ind;
    bit<8> bbo_setting;
    bit<8> quote_event_reason;
    bit<24> pad3;
}

header rfq_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> order_qty;
    bit<32> market_segment_id;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> pad6;
}

header rfq_reject_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<8> quote_request_reject_reason;
    bit<40> party_executing_firm;
    bit<48> pad6;
}

header rfq_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> exec_id;
}

header rfq_specialist_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> order_qty;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> pad6;
}

header reject_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<32> session_reject_reason;
    bit<16> var_text_len;
    bit<8> session_status;
}

header retransmit_me_message_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<16> appl_total_message_count;
    bit<128> appl_end_msg_id;
    bit<128> ref_appl_last_msg_id;
    bit<48> pad6;
}

header retransmit_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> appl_end_seq_num;
    bit<64> ref_appl_last_seq_num;
    bit<16> appl_total_message_count;
    bit<48> pad6;
}

header service_availability_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<16> pad2_2;
    bit<32> matching_engine_trade_date;
    bit<32> trade_manager_trade_date;
    bit<32> appl_seq_trade_date;
    bit<32> t_7_entry_service_trade_date;
    bit<32> t_7_entry_service_rtm_trade_date;
    bit<16> partition_id;
    bit<8> matching_engine_status;
    bit<8> trade_manager_status;
    bit<8> appl_seq_status;
    bit<8> t_7_entry_service_status;
    bit<8> t_7_entry_service_rtm_status;
    bit<40> pad5;
}

header service_availability_market_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<16> pad2_2;
    bit<32> selective_request_for_quote_service_trade_date;
    bit<8> selective_request_for_quote_service_status;
    bit<8> selective_request_for_quote_rtm_service_status;
    bit<8> news_rtm_service_status;
    bit<8> risk_control_rtm_service_status;
}

header specialist_delete_all_order_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> mass_action_report_id;
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<16> no_affected_orders;
    bit<16> no_not_affected_orders;
    bit<8> party_id_entering_firm;
    bit<8> mass_action_reason;
    bit<16> pad2v2;
}

header specialist_delete_all_order_broadcast_affected_ord_grp_comp_t {
    bit<64> affected_order_id;
    bit<64> affected_orig_cl_ord_id;
}

header specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_t {
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
}

header specialist_instrument_event_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> transact_time;
    bit<32> market_segment_id;
    bit<8> event_type;
    bit<24> pad3;
}

header specialist_order_book_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> trd_reg_ts_entry_time;
    bit<64> trd_reg_ts_time_priority;
    bit<64> price;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> order_qty;
    bit<64> stop_px;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> expire_date;
    bit<32> party_id_executing_unit;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<32> party_id_entering_trader;
    bit<8> no_fills;
    bit<8> pad1;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> order_event_type;
    bit<8> match_type;
    bit<8> side;
    bit<8> ord_type;
    bit<8> trading_capacity;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> appl_seq_indicator;
    bit<8> triggered;
    bit<8> order_attribute_liquidity_provision;
    bit<40> party_entering_firm;
    bit<48> party_entering_trader;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<160> fix_cl_ord_id;
}

header specialist_order_book_notification_fills_grp_comp_t {
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7;
}

header specialist_rfq_reply_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> transact_time;
    bit<64> quote_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<32> market_segment_id;
    bit<40> party_executing_firm;
    bit<56> pad7_2;
}

header specialist_rfq_reply_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> transact_time;
}

header specialist_security_state_change_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> security_status_report_id;
}

header status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<32> trade_date;
    bit<8> trad_ses_event;
    bit<24> pad3;
}

header subscribe_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<32> appl_sub_id;
    bit<32> pad4_2;
}

header tes_approve_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> alloc_qty;
    bit<64> transact_time;
    bit<64> trans_bkd_time;
    bit<64> settl_curr_fx_rate;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> alloc_id;
    bit<32> settl_date;
    bit<32> tes_enrichment_rule_id;
    bit<32> auto_approval_rule_id;
    bit<16> trd_type;
    bit<16> var_text_len;
    bit<8> side;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> trade_publish_indicator;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<8> trading_capacity;
    bit<8> trade_alloc_status;
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> party_id_entering_firm;
    bit<48> party_entering_trader;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
}

header tes_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> transact_time;
    bit<64> trans_bkd_time;
    bit<64> settl_curr_fx_rate;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> settl_date;
    bit<32> auto_approval_rule_id;
    bit<16> trd_type;
    bit<16> var_text_len;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<8> message_event_source;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
}

header tes_broadcast_side_alloc_grp_bc_comp_t {
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<24> pad3;
}

header tes_delete_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<16> trd_type;
    bit<8> delete_reason;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<16> pad2v2;
}

header tes_execution_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> alloc_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> side;
    bit<8> trd_rpt_status;
    bit<8> message_event_source;
    bit<16> pad2v2;
}

header tes_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<32> tes_exec_id;
    bit<160> trade_report_id;
}

header tes_trade_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> transact_time;
    bit<64> settl_curr_amt;
    bit<64> side_gross_trade_amt;
    bit<64> settl_curr_fx_rate;
    bit<64> accrued_interes_amt;
    bit<64> coupon_rate;
    bit<64> root_party_id_client_id;
    bit<64> executing_trader;
    bit<64> root_party_id_investment_decision_maker;
    bit<32> package_id;
    bit<32> market_segment_id;
    bit<32> trade_id;
    bit<32> trade_date;
    bit<32> side_trade_id;
    bit<32> root_party_id_session_id;
    bit<32> root_party_id_settlement_unit;
    bit<32> root_party_id_contra_unit;
    bit<32> root_party_id_contra_settlement_unit;
    bit<32> orig_trade_id;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_clearing_unit;
    bit<32> settl_date;
    bit<32> num_days_interest;
    bit<32> negotiation_id;
    bit<32> srqs_related_trade_id;
    bit<16> trd_type;
    bit<16> last_mkt;
    bit<8> side;
    bit<8> trading_capacity;
    bit<8> trade_report_type;
    bit<8> transfer_reason;
    bit<8> trade_publish_indicator;
    bit<8> delivery_type;
    bit<8> last_coupon_deviation_indicator;
    bit<8> refinancing_eligibility_indicator;
    bit<8> clearing_instruction;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> root_party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<16> account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<24> settl_currency;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<40> root_party_clearing_firm;
    bit<32> root_party_executing_firm_kv_number;
    bit<280> root_party_settlement_account;
    bit<24> root_party_settlement_location;
    bit<40> root_party_settlement_firm;
    bit<40> root_party_contra_firm;
    bit<40> root_party_contra_settlement_firm;
    bit<32> root_party_contra_firm_kv_number;
    bit<280> root_party_contra_settlement_account;
    bit<24> root_party_contra_settlement_location;
    bit<32> root_party_id_execution_venue;
    bit<416> regulatory_trade_id;
    bit<24> pad3;
}

header tes_trading_session_status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<32> trade_date;
    bit<8> trad_ses_event;
    bit<24> pad3;
}

header tm_trading_session_status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<8> trad_ses_event;
    bit<56> pad7_2;
}

header throttle_update_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> throttle_time_interval;
    bit<32> throttle_no_msgs;
    bit<32> throttle_disconnect_limit;
}

header trade_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> price;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> settl_curr_amt;
    bit<64> settl_curr_fx_rate;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> side_gross_trade_amt;
    bit<64> accrued_interes_amt;
    bit<64> coupon_rate;
    bit<64> root_party_id_client_id;
    bit<64> executing_trader;
    bit<64> root_party_id_investment_decision_maker;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_session_id;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_settlement_unit;
    bit<32> root_party_id_clearing_unit;
    bit<32> root_party_id_contra_unit;
    bit<32> root_party_id_contra_settlement_unit;
    bit<32> party_id_specialist_trader;
    bit<32> order_id_sfx;
    bit<32> market_segment_id;
    bit<32> side_trade_id;
    bit<32> side_trade_report_id;
    bit<32> trade_number;
    bit<32> match_date;
    bit<32> settl_date;
    bit<32> trd_match_id;
    bit<32> num_days_interest;
    bit<16> last_mkt;
    bit<8> trade_report_type;
    bit<8> transfer_reason;
    bit<8> match_type;
    bit<8> match_sub_type;
    bit<8> side;
    bit<8> side_liquidity_ind;
    bit<8> delivery_type;
    bit<8> trading_capacity;
    bit<8> last_coupon_deviation_indicator;
    bit<8> refinancing_eligibility_indicator;
    bit<8> clearing_instruction;
    bit<8> order_origination;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> root_party_id_investment_decision_maker_qualifier;
    bit<16> account;
    bit<24> settl_currency;
    bit<24> currency;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<8> order_category;
    bit<8> ord_type;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<40> root_party_clearing_firm;
    bit<32> root_party_executing_firm_kv_number;
    bit<280> root_party_settlement_account;
    bit<24> root_party_settlement_location;
    bit<40> root_party_settlement_firm;
    bit<40> root_party_contra_firm;
    bit<40> root_party_contra_settlement_firm;
    bit<32> root_party_contra_firm_kv_number;
    bit<280> root_party_contra_settlement_account;
    bit<24> root_party_contra_settlement_location;
    bit<40> party_specialist_firm;
    bit<48> party_specialist_trader;
    bit<416> regulatory_trade_id;
    bit<32> root_party_id_execution_venue;
    bit<24> pad3;
}

header trading_session_status_broadcast_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<32> market_segment_id;
    bit<32> trade_date;
    bit<8> trad_ses_event;
    bit<128> ref_appl_last_msg_id;
    bit<56> pad7_2;
}

header trailing_stop_update_notification_t {
    bit<16> pad2;
    bit<64> trd_reg_ts_time_out;
    bit<64> notification_in;
    bit<64> sending_time;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<128> appl_msg_id;
    bit<8> appl_id;
    bit<8> appl_resend_flag;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> exec_id;
    bit<64> stop_px;
    bit<64> order_qty;
    bit<32> order_id_sfx;
    bit<32> market_segment_id;
    bit<16> exec_restatement_reason;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<160> fix_cl_ord_id;
    bit<56> pad7_2;
}

header unsubscribe_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header user_login_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header user_logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header xetra_en_light_approve_deal_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<8> trd_rpt_status;
    bit<8> requesting_side;
    bit<8> target_side;
    bit<8> message_event_source;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<40> requesting_party_executing_firm;
    bit<48> requesting_party_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<56> pad7_2;
}

header xetra_en_light_create_deal_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> quote_id;
    bit<64> security_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<32> settl_date;
    bit<8> trading_capacity;
    bit<8> trd_rpt_status;
    bit<8> message_event_source;
    bit<8> side;
    bit<8> alloc_method;
    bit<8> auto_exec_type;
    bit<8> no_order_book_items;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<48> root_party_entering_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<48> target_party_entering_trader;
    bit<160> firm_trade_id;
    bit<160> firm_negotiation_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
}

header xetra_en_light_create_deal_notification_order_book_item_grp_comp_t {
    bit<64> best_bid_px;
    bit<64> best_bid_size;
    bit<64> best_offer_px;
    bit<64> best_offer_size;
    bit<8> md_book_type;
    bit<8> md_sub_book_type;
    bit<48> pad6;
}

header xetra_en_light_deal_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> security_id;
    bit<64> quote_id;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<32> secondary_trade_id;
    bit<160> firm_trade_id;
    bit<160> firm_negotiation_id;
    bit<32> pad4_2;
}

header xetra_en_light_deal_status_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<8> message_event_source;
    bit<8> trd_rpt_status;
    bit<16> pad2v2;
}

header xetra_en_light_delete_all_quote_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<32> target_party_id_session_id;
    bit<32> pad4;
}

header xetra_en_light_negotiation_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> leaves_qty;
    bit<32> negotiation_id;
    bit<32> number_of_respondents;
    bit<32> settl_date;
    bit<8> side;
    bit<8> quote_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<160> firm_negotiation_id;
    bit<1056> free_text_5;
    bit<40> pad5;
}

header xetra_en_light_negotiation_requester_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> trd_reg_ts_execution_time;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<64> last_px;
    bit<64> leaves_qty;
    bit<64> last_qty;
    bit<64> auto_exec_limit_price;
    bit<64> expire_time;
    bit<64> auto_exec_expiry_time;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> negotiation_id;
    bit<32> number_of_respondents;
    bit<32> settl_date;
    bit<32> auto_exec_reference_price_offset;
    bit<32> auto_exec_min_no_of_quotes;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> quote_type;
    bit<8> respondent_type;
    bit<8> trading_capacity;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> auto_exec_type;
    bit<8> side_disclosure_instruction;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<160> firm_negotiation_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<1056> free_text_5;
    bit<1056> closure_reason;
}

header xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_t {
    bit<32> target_party_id_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> pad1;
}

header xetra_en_light_negotiation_status_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<32> negotiation_id;
    bit<8> quote_condition;
    bit<160> firm_negotiation_id;
    bit<56> pad7_2;
}

header xetra_en_light_open_negotiation_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> negotiation_start_time;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> leaves_qty;
    bit<64> expire_time;
    bit<32> negotiation_id;
    bit<32> market_segment_id;
    bit<32> number_of_respondents;
    bit<32> settl_date;
    bit<8> side;
    bit<8> quote_type;
    bit<8> respondent_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<160> firm_negotiation_id;
    bit<1056> free_text_5;
}

header xetra_en_light_open_negotiation_requester_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> expire_time;
    bit<64> auto_exec_expiry_time;
    bit<64> auto_exec_limit_price;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> negotiation_id;
    bit<32> market_segment_id;
    bit<32> number_of_respondents;
    bit<32> settl_date;
    bit<32> auto_exec_reference_price_offset;
    bit<32> auto_exec_min_no_of_quotes;
    bit<8> no_target_party_i_ds;
    bit<8> side;
    bit<8> quote_type;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> respondent_type;
    bit<8> bid_px_is_locked;
    bit<8> offer_px_is_locked;
    bit<8> side_is_locked;
    bit<8> trading_capacity;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> auto_exec_type;
    bit<8> side_disclosure_instruction;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<160> firm_negotiation_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<1056> free_text_5;
    bit<40> pad5;
}

header xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_t {
    bit<32> target_party_id_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> pad1;
}

header xetra_en_light_quote_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<64> quote_id;
    bit<64> secondary_quote_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<64> expire_time;
    bit<32> negotiation_id;
    bit<8> trading_capacity;
    bit<8> quoting_status;
    bit<8> quote_event_reason;
    bit<8> quote_cancel_reason;
    bit<8> quoting_frequency;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<160> quote_req_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<16> pad2v2;
}

header xetra_en_light_quote_requester_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> transact_time;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<160> quote_req_id;
    bit<8> no_quote_entries;
    bit<24> pad3;
}

header xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_t {
    bit<64> transact_time;
    bit<64> expire_time;
    bit<64> quote_id;
    bit<64> secondary_quote_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<32> party_id_executing_trader;
    bit<32> negotiation_id;
    bit<8> quoting_status;
    bit<8> quoting_frequency;
    bit<160> firm_negotiation_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<8> pad1;
}

header xetra_en_light_quote_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> quote_id;
    bit<32> negotiation_id;
    bit<160> quote_req_id;
}

header xetra_en_light_quote_snapshot_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<8> no_quote_entries;
    bit<8> message_event_source;
    bit<48> pad6;
}

header xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_t {
    bit<64> transact_time;
    bit<64> expire_time;
    bit<64> quote_id;
    bit<64> secondary_quote_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<32> party_id_executing_trader;
    bit<32> negotiation_id;
    bit<8> quoting_status;
    bit<8> quoting_frequency;
    bit<160> firm_negotiation_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<8> pad1;
}

header xetra_en_light_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header xetra_en_light_status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<32> trade_date;
    bit<8> trad_ses_event;
    bit<24> pad3;
}

header broadcast_error_notification_var_text_t {
    varbit<2048> var_text;
}

header forced_logout_notification_var_text_t {
    varbit<2048> var_text;
}

header forced_user_logout_notification_var_text_t {
    varbit<2048> var_text;
}

header legal_notification_broadcast_var_text_t {
    varbit<2048> var_text;
}

header logon_response_public_key_t {
    varbit<2048> public_key;
}

header news_broadcast_var_text_t {
    varbit<2048> var_text;
}

header reject_var_text_t {
    varbit<2048> var_text;
}

header tes_approve_broadcast_var_text_t {
    varbit<2048> var_text;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> delete_all_order_broadcast_not_affected_orders_grp_comp_remaining;
    bit<16> delete_all_order_broadcast_affected_ord_grp_comp_remaining;
    bit<16> delete_all_order_broadcast_affected_order_requests_grp_comp_remaining;
    bit<16> delete_all_order_response_not_affected_orders_grp_comp_remaining;
    bit<16> delete_all_order_response_affected_ord_grp_comp_remaining;
    bit<16> delete_all_order_response_affected_order_requests_grp_comp_remaining;
    bit<16> delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining;
    bit<16> delete_all_quote_response_not_affected_securities_grp_comp_remaining;
    bit<16> inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining;
    bit<16> inquire_session_list_response_sessions_grp_comp_remaining;
    bit<16> inquire_user_response_party_details_grp_comp_remaining;
    bit<8> mass_quote_response_quote_entry_ack_grp_comp_remaining;
    bit<8> modify_order_nr_response_order_event_grp_comp_remaining;
    bit<8> modify_order_response_order_event_grp_comp_remaining;
    bit<8> new_order_nr_response_order_event_grp_comp_remaining;
    bit<8> new_order_response_order_event_grp_comp_remaining;
    bit<8> order_exec_notification_fills_grp_comp_remaining;
    bit<8> order_exec_notification_order_event_grp_comp_remaining;
    bit<8> order_exec_report_broadcast_fills_grp_comp_remaining;
    bit<8> order_exec_report_broadcast_order_event_grp_comp_remaining;
    bit<8> order_exec_response_fills_grp_comp_remaining;
    bit<8> order_exec_response_order_event_grp_comp_remaining;
    bit<8> pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_remaining;
    bit<16> quote_activation_notification_not_affected_securities_grp_comp_remaining;
    bit<16> quote_activation_response_not_affected_securities_grp_comp_remaining;
    bit<8> quote_execution_report_quote_event_grp_comp_remaining;
    bit<16> specialist_delete_all_order_broadcast_affected_ord_grp_comp_remaining;
    bit<16> specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_remaining;
    bit<8> specialist_order_book_notification_fills_grp_comp_remaining;
    bit<8> tes_broadcast_side_alloc_grp_bc_comp_remaining;
    bit<8> xetra_en_light_create_deal_notification_order_book_item_grp_comp_remaining;
    bit<8> xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining;
    bit<8> xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining;
    bit<8> xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_remaining;
    bit<8> xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_remaining;
}

struct headers_t {
    message_header_t message_header;
    broadcast_error_notification_t broadcast_error_notification;
    cross_request_response_t cross_request_response;
    delete_all_order_broadcast_t delete_all_order_broadcast;
    delete_all_order_broadcast_not_affected_orders_grp_comp_t delete_all_order_broadcast_not_affected_orders_grp_comp[MAX_MESSAGES];
    delete_all_order_broadcast_affected_ord_grp_comp_t delete_all_order_broadcast_affected_ord_grp_comp[MAX_MESSAGES];
    delete_all_order_broadcast_affected_order_requests_grp_comp_t delete_all_order_broadcast_affected_order_requests_grp_comp[MAX_MESSAGES];
    delete_all_order_nr_response_t delete_all_order_nr_response;
    delete_all_order_quote_event_broadcast_t delete_all_order_quote_event_broadcast;
    delete_all_order_response_t delete_all_order_response;
    delete_all_order_response_not_affected_orders_grp_comp_t delete_all_order_response_not_affected_orders_grp_comp[MAX_MESSAGES];
    delete_all_order_response_affected_ord_grp_comp_t delete_all_order_response_affected_ord_grp_comp[MAX_MESSAGES];
    delete_all_order_response_affected_order_requests_grp_comp_t delete_all_order_response_affected_order_requests_grp_comp[MAX_MESSAGES];
    delete_all_quote_broadcast_t delete_all_quote_broadcast;
    delete_all_quote_broadcast_not_affected_securities_grp_comp_t delete_all_quote_broadcast_not_affected_securities_grp_comp[MAX_MESSAGES];
    delete_all_quote_response_t delete_all_quote_response;
    delete_all_quote_response_not_affected_securities_grp_comp_t delete_all_quote_response_not_affected_securities_grp_comp[MAX_MESSAGES];
    delete_order_broadcast_t delete_order_broadcast;
    delete_order_nr_response_t delete_order_nr_response;
    delete_order_response_t delete_order_response;
    extended_deletion_report_t extended_deletion_report;
    forced_logout_notification_t forced_logout_notification;
    forced_user_logout_notification_t forced_user_logout_notification;
    heartbeat_notification_t heartbeat_notification;
    inquire_enrichment_rule_id_list_response_t inquire_enrichment_rule_id_list_response;
    inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_t inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp[MAX_MESSAGES];
    inquire_session_list_response_t inquire_session_list_response;
    inquire_session_list_response_sessions_grp_comp_t inquire_session_list_response_sessions_grp_comp[MAX_MESSAGES];
    inquire_user_response_t inquire_user_response;
    inquire_user_response_party_details_grp_comp_t inquire_user_response_party_details_grp_comp[MAX_MESSAGES];
    issuer_notification_t issuer_notification;
    issuer_security_state_change_response_t issuer_security_state_change_response;
    legal_notification_broadcast_t legal_notification_broadcast;
    logon_response_t logon_response;
    logout_response_t logout_response;
    mass_quote_response_t mass_quote_response;
    mass_quote_response_quote_entry_ack_grp_comp_t mass_quote_response_quote_entry_ack_grp_comp[MAX_MESSAGES];
    modify_order_nr_response_t modify_order_nr_response;
    modify_order_nr_response_order_event_grp_comp_t modify_order_nr_response_order_event_grp_comp[MAX_MESSAGES];
    modify_order_response_t modify_order_response;
    modify_order_response_order_event_grp_comp_t modify_order_response_order_event_grp_comp[MAX_MESSAGES];
    new_order_nr_response_t new_order_nr_response;
    new_order_nr_response_order_event_grp_comp_t new_order_nr_response_order_event_grp_comp[MAX_MESSAGES];
    new_order_response_t new_order_response;
    new_order_response_order_event_grp_comp_t new_order_response_order_event_grp_comp[MAX_MESSAGES];
    news_broadcast_t news_broadcast;
    order_exec_notification_t order_exec_notification;
    order_exec_notification_fills_grp_comp_t order_exec_notification_fills_grp_comp[MAX_MESSAGES];
    order_exec_notification_order_event_grp_comp_t order_exec_notification_order_event_grp_comp[MAX_MESSAGES];
    order_exec_report_broadcast_t order_exec_report_broadcast;
    order_exec_report_broadcast_fills_grp_comp_t order_exec_report_broadcast_fills_grp_comp[MAX_MESSAGES];
    order_exec_report_broadcast_order_event_grp_comp_t order_exec_report_broadcast_order_event_grp_comp[MAX_MESSAGES];
    order_exec_response_t order_exec_response;
    order_exec_response_fills_grp_comp_t order_exec_response_fills_grp_comp[MAX_MESSAGES];
    order_exec_response_order_event_grp_comp_t order_exec_response_order_event_grp_comp[MAX_MESSAGES];
    party_action_report_t party_action_report;
    party_entitlements_update_report_t party_entitlements_update_report;
    ping_response_t ping_response;
    pre_trade_risk_limit_response_t pre_trade_risk_limit_response;
    pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_t pre_trade_risk_limit_response_risk_limits_rpt_grp_comp[MAX_MESSAGES];
    quote_activation_notification_t quote_activation_notification;
    quote_activation_notification_not_affected_securities_grp_comp_t quote_activation_notification_not_affected_securities_grp_comp[MAX_MESSAGES];
    quote_activation_response_t quote_activation_response;
    quote_activation_response_not_affected_securities_grp_comp_t quote_activation_response_not_affected_securities_grp_comp[MAX_MESSAGES];
    quote_execution_report_t quote_execution_report;
    quote_execution_report_quote_event_grp_comp_t quote_execution_report_quote_event_grp_comp[MAX_MESSAGES];
    rfq_broadcast_t rfq_broadcast;
    rfq_reject_notification_t rfq_reject_notification;
    rfq_response_t rfq_response;
    rfq_specialist_broadcast_t rfq_specialist_broadcast;
    reject_t reject;
    retransmit_me_message_response_t retransmit_me_message_response;
    retransmit_response_t retransmit_response;
    service_availability_broadcast_t service_availability_broadcast;
    service_availability_market_broadcast_t service_availability_market_broadcast;
    specialist_delete_all_order_broadcast_t specialist_delete_all_order_broadcast;
    specialist_delete_all_order_broadcast_affected_ord_grp_comp_t specialist_delete_all_order_broadcast_affected_ord_grp_comp[MAX_MESSAGES];
    specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_t specialist_delete_all_order_broadcast_not_affected_orders_grp_comp[MAX_MESSAGES];
    specialist_instrument_event_notification_t specialist_instrument_event_notification;
    specialist_order_book_notification_t specialist_order_book_notification;
    specialist_order_book_notification_fills_grp_comp_t specialist_order_book_notification_fills_grp_comp[MAX_MESSAGES];
    specialist_rfq_reply_notification_t specialist_rfq_reply_notification;
    specialist_rfq_reply_response_t specialist_rfq_reply_response;
    specialist_security_state_change_response_t specialist_security_state_change_response;
    status_broadcast_t status_broadcast;
    subscribe_response_t subscribe_response;
    tes_approve_broadcast_t tes_approve_broadcast;
    tes_broadcast_t tes_broadcast;
    tes_broadcast_side_alloc_grp_bc_comp_t tes_broadcast_side_alloc_grp_bc_comp[MAX_MESSAGES];
    tes_delete_broadcast_t tes_delete_broadcast;
    tes_execution_broadcast_t tes_execution_broadcast;
    tes_response_t tes_response;
    tes_trade_broadcast_t tes_trade_broadcast;
    tes_trading_session_status_broadcast_t tes_trading_session_status_broadcast;
    tm_trading_session_status_broadcast_t tm_trading_session_status_broadcast;
    throttle_update_notification_t throttle_update_notification;
    trade_broadcast_t trade_broadcast;
    trading_session_status_broadcast_t trading_session_status_broadcast;
    trailing_stop_update_notification_t trailing_stop_update_notification;
    unsubscribe_response_t unsubscribe_response;
    user_login_response_t user_login_response;
    user_logout_response_t user_logout_response;
    xetra_en_light_approve_deal_notification_t xetra_en_light_approve_deal_notification;
    xetra_en_light_create_deal_notification_t xetra_en_light_create_deal_notification;
    xetra_en_light_create_deal_notification_order_book_item_grp_comp_t xetra_en_light_create_deal_notification_order_book_item_grp_comp[MAX_MESSAGES];
    xetra_en_light_deal_response_t xetra_en_light_deal_response;
    xetra_en_light_deal_status_notification_t xetra_en_light_deal_status_notification;
    xetra_en_light_delete_all_quote_notification_t xetra_en_light_delete_all_quote_notification;
    xetra_en_light_negotiation_notification_t xetra_en_light_negotiation_notification;
    xetra_en_light_negotiation_requester_notification_t xetra_en_light_negotiation_requester_notification;
    xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_t xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp[MAX_MESSAGES];
    xetra_en_light_negotiation_status_notification_t xetra_en_light_negotiation_status_notification;
    xetra_en_light_open_negotiation_notification_t xetra_en_light_open_negotiation_notification;
    xetra_en_light_open_negotiation_requester_notification_t xetra_en_light_open_negotiation_requester_notification;
    xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_t xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp[MAX_MESSAGES];
    xetra_en_light_quote_notification_t xetra_en_light_quote_notification;
    xetra_en_light_quote_requester_notification_t xetra_en_light_quote_requester_notification;
    xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_t xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp[MAX_MESSAGES];
    xetra_en_light_quote_response_t xetra_en_light_quote_response;
    xetra_en_light_quote_snapshot_notification_t xetra_en_light_quote_snapshot_notification;
    xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_t xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp[MAX_MESSAGES];
    xetra_en_light_response_t xetra_en_light_response;
    xetra_en_light_status_broadcast_t xetra_en_light_status_broadcast;
    broadcast_error_notification_var_text_t broadcast_error_notification_var_text;
    forced_logout_notification_var_text_t forced_logout_notification_var_text;
    forced_user_logout_notification_var_text_t forced_user_logout_notification_var_text;
    legal_notification_broadcast_var_text_t legal_notification_broadcast_var_text;
    logon_response_public_key_t logon_response_public_key;
    news_broadcast_var_text_t news_broadcast_var_text;
    reject_var_text_t reject_var_text;
    tes_approve_broadcast_var_text_t tes_approve_broadcast_var_text;
}

parser EurexT7XtiServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x3027: parse_broadcast_error_notification;
            16w0x8727: parse_cross_request_response;
            16w0x8a27: parse_delete_all_order_broadcast;
            16w0x8c27: parse_delete_all_order_nr_response;
            16w0x4428: parse_delete_all_order_quote_event_broadcast;
            16w0x8927: parse_delete_all_order_response;
            16w0xaa28: parse_delete_all_quote_broadcast;
            16w0xa928: parse_delete_all_quote_response;
            16w0x8027: parse_delete_order_broadcast;
            16w0x7f27: parse_delete_order_nr_response;
            16w0x7e27: parse_delete_order_response;
            16w0x9027: parse_extended_deletion_report;
            16w0x1c27: parse_forced_logout_notification;
            16w0x3b27: parse_forced_user_logout_notification;
            16w0x2727: parse_heartbeat_notification;
            16w0x3927: parse_inquire_enrichment_rule_id_list_response;
            16w0x3427: parse_inquire_session_list_response;
            16w0x3727: parse_inquire_user_response;
            16w0x4c28: parse_issuer_notification;
            16w0x4b28: parse_issuer_security_state_change_response;
            16w0x3527: parse_legal_notification_broadcast;
            16w0x1127: parse_logon_response;
            16w0x1327: parse_logout_response;
            16w0xa628: parse_mass_quote_response;
            16w0x7c27: parse_modify_order_nr_response;
            16w0x7b27: parse_modify_order_response;
            16w0x7627: parse_new_order_nr_response;
            16w0x7527: parse_new_order_response;
            16w0x2f27: parse_news_broadcast;
            16w0x7827: parse_order_exec_notification;
            16w0x8527: parse_order_exec_report_broadcast;
            16w0x7727: parse_order_exec_response;
            16w0x3a27: parse_party_action_report;
            16w0x3227: parse_party_entitlements_update_report;
            16w0x5128: parse_ping_response;
            16w0x4928: parse_pre_trade_risk_limit_response;
            16w0xab28: parse_quote_activation_notification;
            16w0xa428: parse_quote_activation_response;
            16w0xa728: parse_quote_execution_report;
            16w0xaf28: parse_rfq_broadcast;
            16w0xb428: parse_rfq_reject_notification;
            16w0xa228: parse_rfq_response;
            16w0xb328: parse_rfq_specialist_broadcast;
            16w0x1a27: parse_reject;
            16w0x2b27: parse_retransmit_me_message_response;
            16w0x1927: parse_retransmit_response;
            16w0x2e27: parse_service_availability_broadcast;
            16w0x3c27: parse_service_availability_market_broadcast;
            16w0x9927: parse_specialist_delete_all_order_broadcast;
            16w0x4f28: parse_specialist_instrument_event_notification;
            16w0x9827: parse_specialist_order_book_notification;
            16w0xb828: parse_specialist_rfq_reply_notification;
            16w0xb728: parse_specialist_rfq_reply_response;
            16w0x4e28: parse_specialist_security_state_change_response;
            16w0x3d27: parse_status_broadcast;
            16w0x1527: parse_subscribe_response;
            16w0x6f29: parse_tes_approve_broadcast;
            16w0x6c29: parse_tes_broadcast;
            16w0x6e29: parse_tes_delete_broadcast;
            16w0x7229: parse_tes_execution_broadcast;
            16w0x7329: parse_tes_response;
            16w0x7629: parse_tes_trade_broadcast;
            16w0x7729: parse_tes_trading_session_status_broadcast;
            16w0x529: parse_tm_trading_session_status_broadcast;
            16w0x2c27: parse_throttle_update_notification;
            16w0x429: parse_trade_broadcast;
            16w0x4328: parse_trading_session_status_broadcast;
            16w0x8f27: parse_trailing_stop_update_notification;
            16w0x1727: parse_unsubscribe_response;
            16w0x2327: parse_user_login_response;
            16w0x2827: parse_user_logout_response;
            16w0x422a: parse_xetra_en_light_approve_deal_notification;
            16w0x382a: parse_xetra_en_light_create_deal_notification;
            16w0x352a: parse_xetra_en_light_deal_response;
            16w0x492a: parse_xetra_en_light_deal_status_notification;
            16w0x482a: parse_xetra_en_light_delete_all_quote_notification;
            16w0x3d2a: parse_xetra_en_light_negotiation_notification;
            16w0x3c2a: parse_xetra_en_light_negotiation_requester_notification;
            16w0x3f2a: parse_xetra_en_light_negotiation_status_notification;
            16w0x3b2a: parse_xetra_en_light_open_negotiation_notification;
            16w0x3a2a: parse_xetra_en_light_open_negotiation_requester_notification;
            16w0x372a: parse_xetra_en_light_quote_notification;
            16w0x402a: parse_xetra_en_light_quote_requester_notification;
            16w0x332a: parse_xetra_en_light_quote_response;
            16w0x472a: parse_xetra_en_light_quote_snapshot_notification;
            16w0x462a: parse_xetra_en_light_response;
            16w0x3e2a: parse_xetra_en_light_status_broadcast;
            default: accept;
        }
    }

    state parse_broadcast_error_notification {
        packet.extract(hdr.broadcast_error_notification);
        meta.dispatched = 1;
        packet.extract(hdr.broadcast_error_notification_var_text, (bit<32>)hdr.broadcast_error_notification.var_text_len * 8);
        transition accept;
    }

    state parse_cross_request_response {
        packet.extract(hdr.cross_request_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_order_broadcast {
        packet.extract(hdr.delete_all_order_broadcast);
        meta.dispatched = 1;
        meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining = hdr.delete_all_order_broadcast.no_not_affected_orders;
        transition select(meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining) {
            16w0: read_delete_all_order_broadcast_affected_ord_grp_comp;
            default: parse_delete_all_order_broadcast_not_affected_orders_grp_comp;
        }
    }

    state parse_delete_all_order_broadcast_not_affected_orders_grp_comp {
        packet.extract(hdr.delete_all_order_broadcast_not_affected_orders_grp_comp.next);
        meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining = meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining) {
            16w0: read_delete_all_order_broadcast_affected_ord_grp_comp;
            default: parse_delete_all_order_broadcast_not_affected_orders_grp_comp;
        }
    }

    state read_delete_all_order_broadcast_affected_ord_grp_comp {
        meta.delete_all_order_broadcast_affected_ord_grp_comp_remaining = hdr.delete_all_order_broadcast.no_affected_orders;
        transition select(meta.delete_all_order_broadcast_affected_ord_grp_comp_remaining) {
            16w0: read_delete_all_order_broadcast_affected_order_requests_grp_comp;
            default: parse_delete_all_order_broadcast_affected_ord_grp_comp;
        }
    }

    state parse_delete_all_order_broadcast_affected_ord_grp_comp {
        packet.extract(hdr.delete_all_order_broadcast_affected_ord_grp_comp.next);
        meta.delete_all_order_broadcast_affected_ord_grp_comp_remaining = meta.delete_all_order_broadcast_affected_ord_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_broadcast_affected_ord_grp_comp_remaining) {
            16w0: read_delete_all_order_broadcast_affected_order_requests_grp_comp;
            default: parse_delete_all_order_broadcast_affected_ord_grp_comp;
        }
    }

    state read_delete_all_order_broadcast_affected_order_requests_grp_comp {
        meta.delete_all_order_broadcast_affected_order_requests_grp_comp_remaining = hdr.delete_all_order_broadcast.no_affected_order_requests;
        transition select(meta.delete_all_order_broadcast_affected_order_requests_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_order_broadcast_affected_order_requests_grp_comp;
        }
    }

    state parse_delete_all_order_broadcast_affected_order_requests_grp_comp {
        packet.extract(hdr.delete_all_order_broadcast_affected_order_requests_grp_comp.next);
        meta.delete_all_order_broadcast_affected_order_requests_grp_comp_remaining = meta.delete_all_order_broadcast_affected_order_requests_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_broadcast_affected_order_requests_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_order_broadcast_affected_order_requests_grp_comp;
        }
    }

    state parse_delete_all_order_nr_response {
        packet.extract(hdr.delete_all_order_nr_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_order_quote_event_broadcast {
        packet.extract(hdr.delete_all_order_quote_event_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_order_response {
        packet.extract(hdr.delete_all_order_response);
        meta.dispatched = 1;
        meta.delete_all_order_response_not_affected_orders_grp_comp_remaining = hdr.delete_all_order_response.no_not_affected_orders;
        transition select(meta.delete_all_order_response_not_affected_orders_grp_comp_remaining) {
            16w0: read_delete_all_order_response_affected_ord_grp_comp;
            default: parse_delete_all_order_response_not_affected_orders_grp_comp;
        }
    }

    state parse_delete_all_order_response_not_affected_orders_grp_comp {
        packet.extract(hdr.delete_all_order_response_not_affected_orders_grp_comp.next);
        meta.delete_all_order_response_not_affected_orders_grp_comp_remaining = meta.delete_all_order_response_not_affected_orders_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_response_not_affected_orders_grp_comp_remaining) {
            16w0: read_delete_all_order_response_affected_ord_grp_comp;
            default: parse_delete_all_order_response_not_affected_orders_grp_comp;
        }
    }

    state read_delete_all_order_response_affected_ord_grp_comp {
        meta.delete_all_order_response_affected_ord_grp_comp_remaining = hdr.delete_all_order_response.no_affected_orders;
        transition select(meta.delete_all_order_response_affected_ord_grp_comp_remaining) {
            16w0: read_delete_all_order_response_affected_order_requests_grp_comp;
            default: parse_delete_all_order_response_affected_ord_grp_comp;
        }
    }

    state parse_delete_all_order_response_affected_ord_grp_comp {
        packet.extract(hdr.delete_all_order_response_affected_ord_grp_comp.next);
        meta.delete_all_order_response_affected_ord_grp_comp_remaining = meta.delete_all_order_response_affected_ord_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_response_affected_ord_grp_comp_remaining) {
            16w0: read_delete_all_order_response_affected_order_requests_grp_comp;
            default: parse_delete_all_order_response_affected_ord_grp_comp;
        }
    }

    state read_delete_all_order_response_affected_order_requests_grp_comp {
        meta.delete_all_order_response_affected_order_requests_grp_comp_remaining = hdr.delete_all_order_response.no_affected_order_requests;
        transition select(meta.delete_all_order_response_affected_order_requests_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_order_response_affected_order_requests_grp_comp;
        }
    }

    state parse_delete_all_order_response_affected_order_requests_grp_comp {
        packet.extract(hdr.delete_all_order_response_affected_order_requests_grp_comp.next);
        meta.delete_all_order_response_affected_order_requests_grp_comp_remaining = meta.delete_all_order_response_affected_order_requests_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_response_affected_order_requests_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_order_response_affected_order_requests_grp_comp;
        }
    }

    state parse_delete_all_quote_broadcast {
        packet.extract(hdr.delete_all_quote_broadcast);
        meta.dispatched = 1;
        meta.delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining = hdr.delete_all_quote_broadcast.no_not_affected_securities;
        transition select(meta.delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_quote_broadcast_not_affected_securities_grp_comp;
        }
    }

    state parse_delete_all_quote_broadcast_not_affected_securities_grp_comp {
        packet.extract(hdr.delete_all_quote_broadcast_not_affected_securities_grp_comp.next);
        meta.delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining = meta.delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining - 1;
        transition select(meta.delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_quote_broadcast_not_affected_securities_grp_comp;
        }
    }

    state parse_delete_all_quote_response {
        packet.extract(hdr.delete_all_quote_response);
        meta.dispatched = 1;
        meta.delete_all_quote_response_not_affected_securities_grp_comp_remaining = hdr.delete_all_quote_response.no_not_affected_securities;
        transition select(meta.delete_all_quote_response_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_quote_response_not_affected_securities_grp_comp;
        }
    }

    state parse_delete_all_quote_response_not_affected_securities_grp_comp {
        packet.extract(hdr.delete_all_quote_response_not_affected_securities_grp_comp.next);
        meta.delete_all_quote_response_not_affected_securities_grp_comp_remaining = meta.delete_all_quote_response_not_affected_securities_grp_comp_remaining - 1;
        transition select(meta.delete_all_quote_response_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_quote_response_not_affected_securities_grp_comp;
        }
    }

    state parse_delete_order_broadcast {
        packet.extract(hdr.delete_order_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_nr_response {
        packet.extract(hdr.delete_order_nr_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_response {
        packet.extract(hdr.delete_order_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_extended_deletion_report {
        packet.extract(hdr.extended_deletion_report);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_forced_logout_notification {
        packet.extract(hdr.forced_logout_notification);
        meta.dispatched = 1;
        packet.extract(hdr.forced_logout_notification_var_text, (bit<32>)hdr.forced_logout_notification.var_text_len * 8);
        transition accept;
    }

    state parse_forced_user_logout_notification {
        packet.extract(hdr.forced_user_logout_notification);
        meta.dispatched = 1;
        packet.extract(hdr.forced_user_logout_notification_var_text, (bit<32>)hdr.forced_user_logout_notification.var_text_len * 8);
        transition accept;
    }

    state parse_heartbeat_notification {
        packet.extract(hdr.heartbeat_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquire_enrichment_rule_id_list_response {
        packet.extract(hdr.inquire_enrichment_rule_id_list_response);
        meta.dispatched = 1;
        meta.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining = hdr.inquire_enrichment_rule_id_list_response.no_enrichment_rules;
        transition select(meta.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining) {
            16w0: accept;
            default: parse_inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp;
        }
    }

    state parse_inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp {
        packet.extract(hdr.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp.next);
        meta.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining = meta.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining - 1;
        transition select(meta.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining) {
            16w0: accept;
            default: parse_inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp;
        }
    }

    state parse_inquire_session_list_response {
        packet.extract(hdr.inquire_session_list_response);
        meta.dispatched = 1;
        meta.inquire_session_list_response_sessions_grp_comp_remaining = hdr.inquire_session_list_response.no_sessions;
        transition select(meta.inquire_session_list_response_sessions_grp_comp_remaining) {
            16w0: accept;
            default: parse_inquire_session_list_response_sessions_grp_comp;
        }
    }

    state parse_inquire_session_list_response_sessions_grp_comp {
        packet.extract(hdr.inquire_session_list_response_sessions_grp_comp.next);
        meta.inquire_session_list_response_sessions_grp_comp_remaining = meta.inquire_session_list_response_sessions_grp_comp_remaining - 1;
        transition select(meta.inquire_session_list_response_sessions_grp_comp_remaining) {
            16w0: accept;
            default: parse_inquire_session_list_response_sessions_grp_comp;
        }
    }

    state parse_inquire_user_response {
        packet.extract(hdr.inquire_user_response);
        meta.dispatched = 1;
        meta.inquire_user_response_party_details_grp_comp_remaining = hdr.inquire_user_response.no_party_details;
        transition select(meta.inquire_user_response_party_details_grp_comp_remaining) {
            16w0: accept;
            default: parse_inquire_user_response_party_details_grp_comp;
        }
    }

    state parse_inquire_user_response_party_details_grp_comp {
        packet.extract(hdr.inquire_user_response_party_details_grp_comp.next);
        meta.inquire_user_response_party_details_grp_comp_remaining = meta.inquire_user_response_party_details_grp_comp_remaining - 1;
        transition select(meta.inquire_user_response_party_details_grp_comp_remaining) {
            16w0: accept;
            default: parse_inquire_user_response_party_details_grp_comp;
        }
    }

    state parse_issuer_notification {
        packet.extract(hdr.issuer_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_issuer_security_state_change_response {
        packet.extract(hdr.issuer_security_state_change_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_legal_notification_broadcast {
        packet.extract(hdr.legal_notification_broadcast);
        meta.dispatched = 1;
        packet.extract(hdr.legal_notification_broadcast_var_text, (bit<32>)hdr.legal_notification_broadcast.var_text_len * 8);
        transition accept;
    }

    state parse_logon_response {
        packet.extract(hdr.logon_response);
        meta.dispatched = 1;
        packet.extract(hdr.logon_response_public_key, (bit<32>)hdr.logon_response.public_key_len * 8);
        transition accept;
    }

    state parse_logout_response {
        packet.extract(hdr.logout_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_response {
        packet.extract(hdr.mass_quote_response);
        meta.dispatched = 1;
        meta.mass_quote_response_quote_entry_ack_grp_comp_remaining = hdr.mass_quote_response.no_quote_side_entries;
        transition select(meta.mass_quote_response_quote_entry_ack_grp_comp_remaining) {
            8w0: accept;
            default: parse_mass_quote_response_quote_entry_ack_grp_comp;
        }
    }

    state parse_mass_quote_response_quote_entry_ack_grp_comp {
        packet.extract(hdr.mass_quote_response_quote_entry_ack_grp_comp.next);
        meta.mass_quote_response_quote_entry_ack_grp_comp_remaining = meta.mass_quote_response_quote_entry_ack_grp_comp_remaining - 1;
        transition select(meta.mass_quote_response_quote_entry_ack_grp_comp_remaining) {
            8w0: accept;
            default: parse_mass_quote_response_quote_entry_ack_grp_comp;
        }
    }

    state parse_modify_order_nr_response {
        packet.extract(hdr.modify_order_nr_response);
        meta.dispatched = 1;
        meta.modify_order_nr_response_order_event_grp_comp_remaining = hdr.modify_order_nr_response.no_order_events;
        transition select(meta.modify_order_nr_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_nr_response_order_event_grp_comp;
        }
    }

    state parse_modify_order_nr_response_order_event_grp_comp {
        packet.extract(hdr.modify_order_nr_response_order_event_grp_comp.next);
        meta.modify_order_nr_response_order_event_grp_comp_remaining = meta.modify_order_nr_response_order_event_grp_comp_remaining - 1;
        transition select(meta.modify_order_nr_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_nr_response_order_event_grp_comp;
        }
    }

    state parse_modify_order_response {
        packet.extract(hdr.modify_order_response);
        meta.dispatched = 1;
        meta.modify_order_response_order_event_grp_comp_remaining = hdr.modify_order_response.no_order_events;
        transition select(meta.modify_order_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_response_order_event_grp_comp;
        }
    }

    state parse_modify_order_response_order_event_grp_comp {
        packet.extract(hdr.modify_order_response_order_event_grp_comp.next);
        meta.modify_order_response_order_event_grp_comp_remaining = meta.modify_order_response_order_event_grp_comp_remaining - 1;
        transition select(meta.modify_order_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_response_order_event_grp_comp;
        }
    }

    state parse_new_order_nr_response {
        packet.extract(hdr.new_order_nr_response);
        meta.dispatched = 1;
        meta.new_order_nr_response_order_event_grp_comp_remaining = hdr.new_order_nr_response.no_order_events;
        transition select(meta.new_order_nr_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_nr_response_order_event_grp_comp;
        }
    }

    state parse_new_order_nr_response_order_event_grp_comp {
        packet.extract(hdr.new_order_nr_response_order_event_grp_comp.next);
        meta.new_order_nr_response_order_event_grp_comp_remaining = meta.new_order_nr_response_order_event_grp_comp_remaining - 1;
        transition select(meta.new_order_nr_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_nr_response_order_event_grp_comp;
        }
    }

    state parse_new_order_response {
        packet.extract(hdr.new_order_response);
        meta.dispatched = 1;
        meta.new_order_response_order_event_grp_comp_remaining = hdr.new_order_response.no_order_events;
        transition select(meta.new_order_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_response_order_event_grp_comp;
        }
    }

    state parse_new_order_response_order_event_grp_comp {
        packet.extract(hdr.new_order_response_order_event_grp_comp.next);
        meta.new_order_response_order_event_grp_comp_remaining = meta.new_order_response_order_event_grp_comp_remaining - 1;
        transition select(meta.new_order_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_response_order_event_grp_comp;
        }
    }

    state parse_news_broadcast {
        packet.extract(hdr.news_broadcast);
        meta.dispatched = 1;
        packet.extract(hdr.news_broadcast_var_text, (bit<32>)hdr.news_broadcast.var_text_len * 8);
        transition accept;
    }

    state parse_order_exec_notification {
        packet.extract(hdr.order_exec_notification);
        meta.dispatched = 1;
        meta.order_exec_notification_fills_grp_comp_remaining = hdr.order_exec_notification.no_fills;
        transition select(meta.order_exec_notification_fills_grp_comp_remaining) {
            8w0: read_order_exec_notification_order_event_grp_comp;
            default: parse_order_exec_notification_fills_grp_comp;
        }
    }

    state parse_order_exec_notification_fills_grp_comp {
        packet.extract(hdr.order_exec_notification_fills_grp_comp.next);
        meta.order_exec_notification_fills_grp_comp_remaining = meta.order_exec_notification_fills_grp_comp_remaining - 1;
        transition select(meta.order_exec_notification_fills_grp_comp_remaining) {
            8w0: read_order_exec_notification_order_event_grp_comp;
            default: parse_order_exec_notification_fills_grp_comp;
        }
    }

    state read_order_exec_notification_order_event_grp_comp {
        meta.order_exec_notification_order_event_grp_comp_remaining = hdr.order_exec_notification.no_order_events;
        transition select(meta.order_exec_notification_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_order_exec_notification_order_event_grp_comp;
        }
    }

    state parse_order_exec_notification_order_event_grp_comp {
        packet.extract(hdr.order_exec_notification_order_event_grp_comp.next);
        meta.order_exec_notification_order_event_grp_comp_remaining = meta.order_exec_notification_order_event_grp_comp_remaining - 1;
        transition select(meta.order_exec_notification_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_order_exec_notification_order_event_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast {
        packet.extract(hdr.order_exec_report_broadcast);
        meta.dispatched = 1;
        meta.order_exec_report_broadcast_fills_grp_comp_remaining = hdr.order_exec_report_broadcast.no_fills;
        transition select(meta.order_exec_report_broadcast_fills_grp_comp_remaining) {
            8w0: read_order_exec_report_broadcast_order_event_grp_comp;
            default: parse_order_exec_report_broadcast_fills_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast_fills_grp_comp {
        packet.extract(hdr.order_exec_report_broadcast_fills_grp_comp.next);
        meta.order_exec_report_broadcast_fills_grp_comp_remaining = meta.order_exec_report_broadcast_fills_grp_comp_remaining - 1;
        transition select(meta.order_exec_report_broadcast_fills_grp_comp_remaining) {
            8w0: read_order_exec_report_broadcast_order_event_grp_comp;
            default: parse_order_exec_report_broadcast_fills_grp_comp;
        }
    }

    state read_order_exec_report_broadcast_order_event_grp_comp {
        meta.order_exec_report_broadcast_order_event_grp_comp_remaining = hdr.order_exec_report_broadcast.no_order_events;
        transition select(meta.order_exec_report_broadcast_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_order_exec_report_broadcast_order_event_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast_order_event_grp_comp {
        packet.extract(hdr.order_exec_report_broadcast_order_event_grp_comp.next);
        meta.order_exec_report_broadcast_order_event_grp_comp_remaining = meta.order_exec_report_broadcast_order_event_grp_comp_remaining - 1;
        transition select(meta.order_exec_report_broadcast_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_order_exec_report_broadcast_order_event_grp_comp;
        }
    }

    state parse_order_exec_response {
        packet.extract(hdr.order_exec_response);
        meta.dispatched = 1;
        meta.order_exec_response_fills_grp_comp_remaining = hdr.order_exec_response.no_fills;
        transition select(meta.order_exec_response_fills_grp_comp_remaining) {
            8w0: read_order_exec_response_order_event_grp_comp;
            default: parse_order_exec_response_fills_grp_comp;
        }
    }

    state parse_order_exec_response_fills_grp_comp {
        packet.extract(hdr.order_exec_response_fills_grp_comp.next);
        meta.order_exec_response_fills_grp_comp_remaining = meta.order_exec_response_fills_grp_comp_remaining - 1;
        transition select(meta.order_exec_response_fills_grp_comp_remaining) {
            8w0: read_order_exec_response_order_event_grp_comp;
            default: parse_order_exec_response_fills_grp_comp;
        }
    }

    state read_order_exec_response_order_event_grp_comp {
        meta.order_exec_response_order_event_grp_comp_remaining = hdr.order_exec_response.no_order_events;
        transition select(meta.order_exec_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_order_exec_response_order_event_grp_comp;
        }
    }

    state parse_order_exec_response_order_event_grp_comp {
        packet.extract(hdr.order_exec_response_order_event_grp_comp.next);
        meta.order_exec_response_order_event_grp_comp_remaining = meta.order_exec_response_order_event_grp_comp_remaining - 1;
        transition select(meta.order_exec_response_order_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_order_exec_response_order_event_grp_comp;
        }
    }

    state parse_party_action_report {
        packet.extract(hdr.party_action_report);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_party_entitlements_update_report {
        packet.extract(hdr.party_entitlements_update_report);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ping_response {
        packet.extract(hdr.ping_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_pre_trade_risk_limit_response {
        packet.extract(hdr.pre_trade_risk_limit_response);
        meta.dispatched = 1;
        meta.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_remaining = hdr.pre_trade_risk_limit_response.no_risk_limits;
        transition select(meta.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_remaining) {
            8w0: accept;
            default: parse_pre_trade_risk_limit_response_risk_limits_rpt_grp_comp;
        }
    }

    state parse_pre_trade_risk_limit_response_risk_limits_rpt_grp_comp {
        packet.extract(hdr.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp.next);
        meta.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_remaining = meta.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_remaining - 1;
        transition select(meta.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp_remaining) {
            8w0: accept;
            default: parse_pre_trade_risk_limit_response_risk_limits_rpt_grp_comp;
        }
    }

    state parse_quote_activation_notification {
        packet.extract(hdr.quote_activation_notification);
        meta.dispatched = 1;
        meta.quote_activation_notification_not_affected_securities_grp_comp_remaining = hdr.quote_activation_notification.no_not_affected_securities;
        transition select(meta.quote_activation_notification_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_quote_activation_notification_not_affected_securities_grp_comp;
        }
    }

    state parse_quote_activation_notification_not_affected_securities_grp_comp {
        packet.extract(hdr.quote_activation_notification_not_affected_securities_grp_comp.next);
        meta.quote_activation_notification_not_affected_securities_grp_comp_remaining = meta.quote_activation_notification_not_affected_securities_grp_comp_remaining - 1;
        transition select(meta.quote_activation_notification_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_quote_activation_notification_not_affected_securities_grp_comp;
        }
    }

    state parse_quote_activation_response {
        packet.extract(hdr.quote_activation_response);
        meta.dispatched = 1;
        meta.quote_activation_response_not_affected_securities_grp_comp_remaining = hdr.quote_activation_response.no_not_affected_securities;
        transition select(meta.quote_activation_response_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_quote_activation_response_not_affected_securities_grp_comp;
        }
    }

    state parse_quote_activation_response_not_affected_securities_grp_comp {
        packet.extract(hdr.quote_activation_response_not_affected_securities_grp_comp.next);
        meta.quote_activation_response_not_affected_securities_grp_comp_remaining = meta.quote_activation_response_not_affected_securities_grp_comp_remaining - 1;
        transition select(meta.quote_activation_response_not_affected_securities_grp_comp_remaining) {
            16w0: accept;
            default: parse_quote_activation_response_not_affected_securities_grp_comp;
        }
    }

    state parse_quote_execution_report {
        packet.extract(hdr.quote_execution_report);
        meta.dispatched = 1;
        meta.quote_execution_report_quote_event_grp_comp_remaining = hdr.quote_execution_report.no_quote_events;
        transition select(meta.quote_execution_report_quote_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_quote_execution_report_quote_event_grp_comp;
        }
    }

    state parse_quote_execution_report_quote_event_grp_comp {
        packet.extract(hdr.quote_execution_report_quote_event_grp_comp.next);
        meta.quote_execution_report_quote_event_grp_comp_remaining = meta.quote_execution_report_quote_event_grp_comp_remaining - 1;
        transition select(meta.quote_execution_report_quote_event_grp_comp_remaining) {
            8w0: accept;
            default: parse_quote_execution_report_quote_event_grp_comp;
        }
    }

    state parse_rfq_broadcast {
        packet.extract(hdr.rfq_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_reject_notification {
        packet.extract(hdr.rfq_reject_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_response {
        packet.extract(hdr.rfq_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_specialist_broadcast {
        packet.extract(hdr.rfq_specialist_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject {
        packet.extract(hdr.reject);
        meta.dispatched = 1;
        packet.extract(hdr.reject_var_text, (bit<32>)hdr.reject.var_text_len * 8);
        transition accept;
    }

    state parse_retransmit_me_message_response {
        packet.extract(hdr.retransmit_me_message_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_response {
        packet.extract(hdr.retransmit_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_service_availability_broadcast {
        packet.extract(hdr.service_availability_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_service_availability_market_broadcast {
        packet.extract(hdr.service_availability_market_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_specialist_delete_all_order_broadcast {
        packet.extract(hdr.specialist_delete_all_order_broadcast);
        meta.dispatched = 1;
        meta.specialist_delete_all_order_broadcast_affected_ord_grp_comp_remaining = hdr.specialist_delete_all_order_broadcast.no_affected_orders;
        transition select(meta.specialist_delete_all_order_broadcast_affected_ord_grp_comp_remaining) {
            16w0: read_specialist_delete_all_order_broadcast_not_affected_orders_grp_comp;
            default: parse_specialist_delete_all_order_broadcast_affected_ord_grp_comp;
        }
    }

    state parse_specialist_delete_all_order_broadcast_affected_ord_grp_comp {
        packet.extract(hdr.specialist_delete_all_order_broadcast_affected_ord_grp_comp.next);
        meta.specialist_delete_all_order_broadcast_affected_ord_grp_comp_remaining = meta.specialist_delete_all_order_broadcast_affected_ord_grp_comp_remaining - 1;
        transition select(meta.specialist_delete_all_order_broadcast_affected_ord_grp_comp_remaining) {
            16w0: read_specialist_delete_all_order_broadcast_not_affected_orders_grp_comp;
            default: parse_specialist_delete_all_order_broadcast_affected_ord_grp_comp;
        }
    }

    state read_specialist_delete_all_order_broadcast_not_affected_orders_grp_comp {
        meta.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_remaining = hdr.specialist_delete_all_order_broadcast.no_not_affected_orders;
        transition select(meta.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_remaining) {
            16w0: accept;
            default: parse_specialist_delete_all_order_broadcast_not_affected_orders_grp_comp;
        }
    }

    state parse_specialist_delete_all_order_broadcast_not_affected_orders_grp_comp {
        packet.extract(hdr.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp.next);
        meta.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_remaining = meta.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_remaining - 1;
        transition select(meta.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp_remaining) {
            16w0: accept;
            default: parse_specialist_delete_all_order_broadcast_not_affected_orders_grp_comp;
        }
    }

    state parse_specialist_instrument_event_notification {
        packet.extract(hdr.specialist_instrument_event_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_specialist_order_book_notification {
        packet.extract(hdr.specialist_order_book_notification);
        meta.dispatched = 1;
        meta.specialist_order_book_notification_fills_grp_comp_remaining = hdr.specialist_order_book_notification.no_fills;
        transition select(meta.specialist_order_book_notification_fills_grp_comp_remaining) {
            8w0: accept;
            default: parse_specialist_order_book_notification_fills_grp_comp;
        }
    }

    state parse_specialist_order_book_notification_fills_grp_comp {
        packet.extract(hdr.specialist_order_book_notification_fills_grp_comp.next);
        meta.specialist_order_book_notification_fills_grp_comp_remaining = meta.specialist_order_book_notification_fills_grp_comp_remaining - 1;
        transition select(meta.specialist_order_book_notification_fills_grp_comp_remaining) {
            8w0: accept;
            default: parse_specialist_order_book_notification_fills_grp_comp;
        }
    }

    state parse_specialist_rfq_reply_notification {
        packet.extract(hdr.specialist_rfq_reply_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_specialist_rfq_reply_response {
        packet.extract(hdr.specialist_rfq_reply_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_specialist_security_state_change_response {
        packet.extract(hdr.specialist_security_state_change_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_status_broadcast {
        packet.extract(hdr.status_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscribe_response {
        packet.extract(hdr.subscribe_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tes_approve_broadcast {
        packet.extract(hdr.tes_approve_broadcast);
        meta.dispatched = 1;
        packet.extract(hdr.tes_approve_broadcast_var_text, (bit<32>)hdr.tes_approve_broadcast.var_text_len * 8);
        transition accept;
    }

    state parse_tes_broadcast {
        packet.extract(hdr.tes_broadcast);
        meta.dispatched = 1;
        meta.tes_broadcast_side_alloc_grp_bc_comp_remaining = hdr.tes_broadcast.no_side_allocs;
        transition select(meta.tes_broadcast_side_alloc_grp_bc_comp_remaining) {
            8w0: accept;
            default: parse_tes_broadcast_side_alloc_grp_bc_comp;
        }
    }

    state parse_tes_broadcast_side_alloc_grp_bc_comp {
        packet.extract(hdr.tes_broadcast_side_alloc_grp_bc_comp.next);
        meta.tes_broadcast_side_alloc_grp_bc_comp_remaining = meta.tes_broadcast_side_alloc_grp_bc_comp_remaining - 1;
        transition select(meta.tes_broadcast_side_alloc_grp_bc_comp_remaining) {
            8w0: accept;
            default: parse_tes_broadcast_side_alloc_grp_bc_comp;
        }
    }

    state parse_tes_delete_broadcast {
        packet.extract(hdr.tes_delete_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tes_execution_broadcast {
        packet.extract(hdr.tes_execution_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tes_response {
        packet.extract(hdr.tes_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tes_trade_broadcast {
        packet.extract(hdr.tes_trade_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tes_trading_session_status_broadcast {
        packet.extract(hdr.tes_trading_session_status_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tm_trading_session_status_broadcast {
        packet.extract(hdr.tm_trading_session_status_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_throttle_update_notification {
        packet.extract(hdr.throttle_update_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_broadcast {
        packet.extract(hdr.trade_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_session_status_broadcast {
        packet.extract(hdr.trading_session_status_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trailing_stop_update_notification {
        packet.extract(hdr.trailing_stop_update_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsubscribe_response {
        packet.extract(hdr.unsubscribe_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_login_response {
        packet.extract(hdr.user_login_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_logout_response {
        packet.extract(hdr.user_logout_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_approve_deal_notification {
        packet.extract(hdr.xetra_en_light_approve_deal_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_create_deal_notification {
        packet.extract(hdr.xetra_en_light_create_deal_notification);
        meta.dispatched = 1;
        meta.xetra_en_light_create_deal_notification_order_book_item_grp_comp_remaining = hdr.xetra_en_light_create_deal_notification.no_order_book_items;
        transition select(meta.xetra_en_light_create_deal_notification_order_book_item_grp_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_create_deal_notification_order_book_item_grp_comp;
        }
    }

    state parse_xetra_en_light_create_deal_notification_order_book_item_grp_comp {
        packet.extract(hdr.xetra_en_light_create_deal_notification_order_book_item_grp_comp.next);
        meta.xetra_en_light_create_deal_notification_order_book_item_grp_comp_remaining = meta.xetra_en_light_create_deal_notification_order_book_item_grp_comp_remaining - 1;
        transition select(meta.xetra_en_light_create_deal_notification_order_book_item_grp_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_create_deal_notification_order_book_item_grp_comp;
        }
    }

    state parse_xetra_en_light_deal_response {
        packet.extract(hdr.xetra_en_light_deal_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_deal_status_notification {
        packet.extract(hdr.xetra_en_light_deal_status_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_delete_all_quote_notification {
        packet.extract(hdr.xetra_en_light_delete_all_quote_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_negotiation_notification {
        packet.extract(hdr.xetra_en_light_negotiation_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_negotiation_requester_notification {
        packet.extract(hdr.xetra_en_light_negotiation_requester_notification);
        meta.dispatched = 1;
        meta.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining = hdr.xetra_en_light_negotiation_requester_notification.no_target_party_i_ds;
        transition select(meta.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp;
        }
    }

    state parse_xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp {
        packet.extract(hdr.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp.next);
        meta.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining = meta.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining - 1;
        transition select(meta.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp;
        }
    }

    state parse_xetra_en_light_negotiation_status_notification {
        packet.extract(hdr.xetra_en_light_negotiation_status_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_open_negotiation_notification {
        packet.extract(hdr.xetra_en_light_open_negotiation_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_open_negotiation_requester_notification {
        packet.extract(hdr.xetra_en_light_open_negotiation_requester_notification);
        meta.dispatched = 1;
        meta.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining = hdr.xetra_en_light_open_negotiation_requester_notification.no_target_party_i_ds;
        transition select(meta.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp;
        }
    }

    state parse_xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp {
        packet.extract(hdr.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp.next);
        meta.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining = meta.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining - 1;
        transition select(meta.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp;
        }
    }

    state parse_xetra_en_light_quote_notification {
        packet.extract(hdr.xetra_en_light_quote_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_quote_requester_notification {
        packet.extract(hdr.xetra_en_light_quote_requester_notification);
        meta.dispatched = 1;
        meta.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_remaining = hdr.xetra_en_light_quote_requester_notification.no_quote_entries;
        transition select(meta.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp;
        }
    }

    state parse_xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp {
        packet.extract(hdr.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp.next);
        meta.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_remaining = meta.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_remaining - 1;
        transition select(meta.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp;
        }
    }

    state parse_xetra_en_light_quote_response {
        packet.extract(hdr.xetra_en_light_quote_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_quote_snapshot_notification {
        packet.extract(hdr.xetra_en_light_quote_snapshot_notification);
        meta.dispatched = 1;
        meta.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_remaining = hdr.xetra_en_light_quote_snapshot_notification.no_quote_entries;
        transition select(meta.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp;
        }
    }

    state parse_xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp {
        packet.extract(hdr.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp.next);
        meta.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_remaining = meta.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_remaining - 1;
        transition select(meta.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp;
        }
    }

    state parse_xetra_en_light_response {
        packet.extract(hdr.xetra_en_light_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_xetra_en_light_status_broadcast {
        packet.extract(hdr.xetra_en_light_status_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

}

control EurexT7XtiServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control EurexT7XtiServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7XtiServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.broadcast_error_notification);
        packet.emit(hdr.broadcast_error_notification_var_text);
        packet.emit(hdr.cross_request_response);
        packet.emit(hdr.delete_all_order_broadcast);
        packet.emit(hdr.delete_all_order_broadcast_not_affected_orders_grp_comp);
        packet.emit(hdr.delete_all_order_broadcast_affected_ord_grp_comp);
        packet.emit(hdr.delete_all_order_broadcast_affected_order_requests_grp_comp);
        packet.emit(hdr.delete_all_order_nr_response);
        packet.emit(hdr.delete_all_order_quote_event_broadcast);
        packet.emit(hdr.delete_all_order_response);
        packet.emit(hdr.delete_all_order_response_not_affected_orders_grp_comp);
        packet.emit(hdr.delete_all_order_response_affected_ord_grp_comp);
        packet.emit(hdr.delete_all_order_response_affected_order_requests_grp_comp);
        packet.emit(hdr.delete_all_quote_broadcast);
        packet.emit(hdr.delete_all_quote_broadcast_not_affected_securities_grp_comp);
        packet.emit(hdr.delete_all_quote_response);
        packet.emit(hdr.delete_all_quote_response_not_affected_securities_grp_comp);
        packet.emit(hdr.delete_order_broadcast);
        packet.emit(hdr.delete_order_nr_response);
        packet.emit(hdr.delete_order_response);
        packet.emit(hdr.extended_deletion_report);
        packet.emit(hdr.forced_logout_notification);
        packet.emit(hdr.forced_logout_notification_var_text);
        packet.emit(hdr.forced_user_logout_notification);
        packet.emit(hdr.forced_user_logout_notification_var_text);
        packet.emit(hdr.heartbeat_notification);
        packet.emit(hdr.inquire_enrichment_rule_id_list_response);
        packet.emit(hdr.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp);
        packet.emit(hdr.inquire_session_list_response);
        packet.emit(hdr.inquire_session_list_response_sessions_grp_comp);
        packet.emit(hdr.inquire_user_response);
        packet.emit(hdr.inquire_user_response_party_details_grp_comp);
        packet.emit(hdr.issuer_notification);
        packet.emit(hdr.issuer_security_state_change_response);
        packet.emit(hdr.legal_notification_broadcast);
        packet.emit(hdr.legal_notification_broadcast_var_text);
        packet.emit(hdr.logon_response);
        packet.emit(hdr.logon_response_public_key);
        packet.emit(hdr.logout_response);
        packet.emit(hdr.mass_quote_response);
        packet.emit(hdr.mass_quote_response_quote_entry_ack_grp_comp);
        packet.emit(hdr.modify_order_nr_response);
        packet.emit(hdr.modify_order_nr_response_order_event_grp_comp);
        packet.emit(hdr.modify_order_response);
        packet.emit(hdr.modify_order_response_order_event_grp_comp);
        packet.emit(hdr.new_order_nr_response);
        packet.emit(hdr.new_order_nr_response_order_event_grp_comp);
        packet.emit(hdr.new_order_response);
        packet.emit(hdr.new_order_response_order_event_grp_comp);
        packet.emit(hdr.news_broadcast);
        packet.emit(hdr.news_broadcast_var_text);
        packet.emit(hdr.order_exec_notification);
        packet.emit(hdr.order_exec_notification_fills_grp_comp);
        packet.emit(hdr.order_exec_notification_order_event_grp_comp);
        packet.emit(hdr.order_exec_report_broadcast);
        packet.emit(hdr.order_exec_report_broadcast_fills_grp_comp);
        packet.emit(hdr.order_exec_report_broadcast_order_event_grp_comp);
        packet.emit(hdr.order_exec_response);
        packet.emit(hdr.order_exec_response_fills_grp_comp);
        packet.emit(hdr.order_exec_response_order_event_grp_comp);
        packet.emit(hdr.party_action_report);
        packet.emit(hdr.party_entitlements_update_report);
        packet.emit(hdr.ping_response);
        packet.emit(hdr.pre_trade_risk_limit_response);
        packet.emit(hdr.pre_trade_risk_limit_response_risk_limits_rpt_grp_comp);
        packet.emit(hdr.quote_activation_notification);
        packet.emit(hdr.quote_activation_notification_not_affected_securities_grp_comp);
        packet.emit(hdr.quote_activation_response);
        packet.emit(hdr.quote_activation_response_not_affected_securities_grp_comp);
        packet.emit(hdr.quote_execution_report);
        packet.emit(hdr.quote_execution_report_quote_event_grp_comp);
        packet.emit(hdr.rfq_broadcast);
        packet.emit(hdr.rfq_reject_notification);
        packet.emit(hdr.rfq_response);
        packet.emit(hdr.rfq_specialist_broadcast);
        packet.emit(hdr.reject);
        packet.emit(hdr.reject_var_text);
        packet.emit(hdr.retransmit_me_message_response);
        packet.emit(hdr.retransmit_response);
        packet.emit(hdr.service_availability_broadcast);
        packet.emit(hdr.service_availability_market_broadcast);
        packet.emit(hdr.specialist_delete_all_order_broadcast);
        packet.emit(hdr.specialist_delete_all_order_broadcast_affected_ord_grp_comp);
        packet.emit(hdr.specialist_delete_all_order_broadcast_not_affected_orders_grp_comp);
        packet.emit(hdr.specialist_instrument_event_notification);
        packet.emit(hdr.specialist_order_book_notification);
        packet.emit(hdr.specialist_order_book_notification_fills_grp_comp);
        packet.emit(hdr.specialist_rfq_reply_notification);
        packet.emit(hdr.specialist_rfq_reply_response);
        packet.emit(hdr.specialist_security_state_change_response);
        packet.emit(hdr.status_broadcast);
        packet.emit(hdr.subscribe_response);
        packet.emit(hdr.tes_approve_broadcast);
        packet.emit(hdr.tes_approve_broadcast_var_text);
        packet.emit(hdr.tes_broadcast);
        packet.emit(hdr.tes_broadcast_side_alloc_grp_bc_comp);
        packet.emit(hdr.tes_delete_broadcast);
        packet.emit(hdr.tes_execution_broadcast);
        packet.emit(hdr.tes_response);
        packet.emit(hdr.tes_trade_broadcast);
        packet.emit(hdr.tes_trading_session_status_broadcast);
        packet.emit(hdr.tm_trading_session_status_broadcast);
        packet.emit(hdr.throttle_update_notification);
        packet.emit(hdr.trade_broadcast);
        packet.emit(hdr.trading_session_status_broadcast);
        packet.emit(hdr.trailing_stop_update_notification);
        packet.emit(hdr.unsubscribe_response);
        packet.emit(hdr.user_login_response);
        packet.emit(hdr.user_logout_response);
        packet.emit(hdr.xetra_en_light_approve_deal_notification);
        packet.emit(hdr.xetra_en_light_create_deal_notification);
        packet.emit(hdr.xetra_en_light_create_deal_notification_order_book_item_grp_comp);
        packet.emit(hdr.xetra_en_light_deal_response);
        packet.emit(hdr.xetra_en_light_deal_status_notification);
        packet.emit(hdr.xetra_en_light_delete_all_quote_notification);
        packet.emit(hdr.xetra_en_light_negotiation_notification);
        packet.emit(hdr.xetra_en_light_negotiation_requester_notification);
        packet.emit(hdr.xetra_en_light_negotiation_requester_notification_xetra_en_light_target_parties_comp);
        packet.emit(hdr.xetra_en_light_negotiation_status_notification);
        packet.emit(hdr.xetra_en_light_open_negotiation_notification);
        packet.emit(hdr.xetra_en_light_open_negotiation_requester_notification);
        packet.emit(hdr.xetra_en_light_open_negotiation_requester_notification_xetra_en_light_target_parties_comp);
        packet.emit(hdr.xetra_en_light_quote_notification);
        packet.emit(hdr.xetra_en_light_quote_requester_notification);
        packet.emit(hdr.xetra_en_light_quote_requester_notification_srqs_quote_entry_grp_comp);
        packet.emit(hdr.xetra_en_light_quote_response);
        packet.emit(hdr.xetra_en_light_quote_snapshot_notification);
        packet.emit(hdr.xetra_en_light_quote_snapshot_notification_srqs_quote_entry_grp_comp);
        packet.emit(hdr.xetra_en_light_response);
        packet.emit(hdr.xetra_en_light_status_broadcast);
    }
}

V1Switch(
    EurexT7XtiServerParser(),
    EurexT7XtiServerVerifyChecksum(),
    EurexT7XtiServerIngress(),
    EurexT7XtiServerEgress(),
    EurexT7XtiServerComputeChecksum(),
    EurexT7XtiServerDeparser()
) main;
