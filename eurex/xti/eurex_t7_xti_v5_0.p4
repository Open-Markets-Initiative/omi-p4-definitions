// P4_16 (v1model) definition for: Eurex T7 Xti Fbe v5.0
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Cash Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 5.0
//   Date: 05/22/2017
//   Specification: T7-Enhanced-Trading-Interface-Manual.pdf
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
    bit<32> pad4;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header cross_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> order_qty;
}

header cross_request_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<8> party_id_entering_firm;
    bit<8> mass_action_reason;
    bit<8> exec_inst;
    bit<8> side;
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
    bit<64> affected_order_id;
    bit<64> affected_orig_cl_ord_id;
}

header delete_all_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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

header delete_all_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> target_party_id_executing_trader;
    bit<8> side;
    bit<24> pad3;
}

header delete_all_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> pad4;
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
    bit<64> affected_order_id;
    bit<64> affected_orig_cl_ord_id;
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
    bit<64> not_affected_security_id;
}

header delete_all_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
}

header delete_all_quote_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> order_id_sfx;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<48> pad6;
}

header delete_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> order_id_sfx;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
}

header delete_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> order_id_sfx;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
}

header delete_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
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
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_low_qty;
    bit<32> display_high_qty;
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
    bit<128> free_text_4;
    bit<8> triggered;
    bit<32> pad4;
}

header forced_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<16> var_text_len;
    bit<48> pad6;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header forced_user_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<8> user_status;
    bit<24> pad3;
    bit<32> username;
    bit<16> var_text_len;
    bit<48> pad6;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header gateway_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<48> pad6;
}

header gateway_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<32> gateway_id;
    bit<32> gateway_sub_id;
    bit<32> secondary_gateway_id;
    bit<32> secondary_gateway_sub_id;
    bit<8> session_mode;
    bit<8> trad_ses_mode;
    bit<48> pad6;
}

header heartbeat_t {
    bit<64> network_msg_id;
    bit<16> pad2;
}

header heartbeat_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
}

header inquire_enrichment_rule_id_list_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<128> last_entity_processed;
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
    bit<16> enrichment_rule_id;
    bit<96> free_text_1;
    bit<128> free_text_4;
    bit<16> pad2_2;
}

header inquire_session_list_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header inquire_session_list_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<16> no_sessions;
    bit<48> pad6;
    bit<32> party_id_session_id;
    bit<8> session_mode;
    bit<8> session_sub_mode;
    bit<16> pad2_2;
}

header inquire_user_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<128> last_entity_processed;
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
    bit<32> party_detail_id_executing_trader;
    bit<48> party_detail_executing_trader;
    bit<8> party_detail_role_qualifier;
    bit<8> party_detail_status;
    bit<24> party_detail_desk_id;
    bit<8> pad1;
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
    bit<40> pad5;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header logon_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> heart_bt_int;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<8> appl_usage_orders;
    bit<8> appl_usage_quotes;
    bit<8> order_routing_indicator;
    bit<240> fix_engine_name;
    bit<240> fix_engine_version;
    bit<240> fix_engine_vendor;
    bit<240> application_system_name;
    bit<240> application_system_version;
    bit<240> application_system_vendor;
    bit<24> pad3;
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
    bit<16> market_id;
    bit<8> trad_ses_mode;
    bit<240> default_cstm_appl_ver_id;
    bit<56> pad7;
}

header logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header mass_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_id;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> price_validity_check_type;
    bit<8> quote_size_type;
    bit<8> no_quote_entries;
    bit<24> pad3;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<32> bid_size;
    bit<32> offer_size;
}

header mass_quote_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<8> no_quote_entries;
    bit<24> pad3_2;
    bit<64> security_id;
    bit<32> bid_cxl_size;
    bit<32> offer_cxl_size;
    bit<32> quote_entry_reject_reason;
    bit<8> quote_entry_status;
    bit<24> pad3_3;
}

header modify_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> order_id_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> display_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> triggered;
    bit<48> pad6;
}

header modify_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<64> trd_reg_ts_time_priority;
    bit<32> order_id_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> display_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> triggered;
    bit<48> pad6;
}

header modify_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> compliance_id;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_low_qty;
    bit<32> display_high_qty;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<32> target_party_id_session_id;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> stop_px_indicator;
    bit<8> trading_capacity;
    bit<8> ownership_indicator;
    bit<96> free_text_1;
    bit<128> free_text_4;
    bit<16> pad2v2;
}

header modify_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> compliance_id;
    bit<32> order_qty;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_capacity;
    bit<8> pad1;
}

header new_order_nr_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> triggered;
    bit<48> pad6;
}

header new_order_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<64> trd_reg_ts_entry_time;
    bit<64> trd_reg_ts_time_priority;
    bit<32> order_id_sfx;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> triggered;
    bit<48> pad6;
}

header new_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> compliance_id;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_low_qty;
    bit<32> display_high_qty;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> trading_capacity;
    bit<96> free_text_1;
    bit<128> free_text_4;
}

header new_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> cl_ord_id;
    bit<64> compliance_id;
    bit<32> order_qty;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_capacity;
    bit<8> pad1;
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
    bit<48> pad6;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
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
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> display_qty;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> triggered;
    bit<8> crossed;
    bit<8> no_fills;
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
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
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_low_qty;
    bit<32> display_high_qty;
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
    bit<8> side;
    bit<8> ord_type;
    bit<8> trading_capacity;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> appl_seq_indicator;
    bit<96> free_text_1;
    bit<128> free_text_4;
    bit<8> no_fills;
    bit<8> triggered;
    bit<8> crossed;
    bit<8> pad1;
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<24> pad3;
}

header order_exec_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<32> market_segment_id;
    bit<32> order_id_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> display_qty;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> triggered;
    bit<8> crossed;
    bit<8> no_fills;
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
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
    bit<64> not_affected_security_id;
}

header quote_activation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> mass_action_type;
    bit<56> pad7;
}

header quote_activation_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<64> security_id;
    bit<64> quote_event_px;
    bit<64> quote_msg_id;
    bit<32> quote_event_match_id;
    bit<32> quote_event_exec_id;
    bit<32> quote_event_qty;
    bit<8> quote_event_type;
    bit<8> quote_event_side;
    bit<8> quote_event_liquidity_ind;
    bit<8> quote_event_reason;
}

header rfq_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> compliance_id;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<8> side;
    bit<56> pad7;
}

header rfq_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> exec_id;
}

header reject_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> request_out;
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
    bit<8> pad1;
    bit<2048> var_text_chunk0;
    bit<2048> var_text_chunk1;
    bit<2048> var_text_chunk2;
    bit<2048> var_text_chunk3;
    bit<2048> var_text_chunk4;
    bit<2048> var_text_chunk5;
    bit<2048> var_text_chunk6;
    bit<1664> var_text_chunk7;
}

header retransmit_me_message_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> subscription_scope;
    bit<16> partition_id;
    bit<8> ref_appl_id;
    bit<128> appl_beg_msg_id;
    bit<128> appl_end_msg_id;
    bit<8> pad1;
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

header retransmit_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> appl_beg_seq_num;
    bit<64> appl_end_seq_num;
    bit<16> partition_id;
    bit<8> ref_appl_id;
    bit<40> pad5;
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
    bit<16> partition_id;
    bit<8> matching_engine_status;
    bit<8> trade_manager_status;
    bit<8> appl_seq_status;
    bit<56> pad7;
}

header subscribe_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> subscription_scope;
    bit<8> ref_appl_id;
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
    bit<64> settl_curr_amt;
    bit<64> settl_curr_fx_rate;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_session_id;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_settlement_unit;
    bit<32> root_party_id_clearing_unit;
    bit<32> root_party_id_contra_unit;
    bit<32> root_party_id_contra_settlement_unit;
    bit<32> order_id_sfx;
    bit<32> cum_qty;
    bit<32> leaves_qty;
    bit<32> market_segment_id;
    bit<32> last_qty;
    bit<32> side_trade_id;
    bit<32> side_trade_report_id;
    bit<32> trade_number;
    bit<32> match_date;
    bit<32> settl_date;
    bit<32> trd_match_id;
    bit<16> market_id;
    bit<8> trade_report_type;
    bit<8> transfer_reason;
    bit<8> match_type;
    bit<8> match_sub_type;
    bit<8> side;
    bit<8> side_liquidity_ind;
    bit<8> delivery_type;
    bit<8> trading_capacity;
    bit<16> account;
    bit<24> settl_currency;
    bit<24> currency;
    bit<96> free_text_1;
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
    bit<40> pad5;
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
    bit<32> order_id_sfx;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<16> exec_restatement_reason;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<56> pad7_2;
}

header unsubscribe_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> ref_appl_sub_id;
    bit<32> pad4;
}

header unsubscribe_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header user_login_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<256> password;
    bit<32> pad4;
}

header user_login_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header user_logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<32> pad4;
}

header user_logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    broadcast_error_notification_t broadcast_error_notification;
    cross_request_t cross_request;
    cross_request_response_t cross_request_response;
    delete_all_order_broadcast_t delete_all_order_broadcast;
    delete_all_order_nr_response_t delete_all_order_nr_response;
    delete_all_order_quote_event_broadcast_t delete_all_order_quote_event_broadcast;
    delete_all_order_request_t delete_all_order_request;
    delete_all_order_response_t delete_all_order_response;
    delete_all_quote_broadcast_t delete_all_quote_broadcast;
    delete_all_quote_request_t delete_all_quote_request;
    delete_all_quote_response_t delete_all_quote_response;
    delete_order_broadcast_t delete_order_broadcast;
    delete_order_nr_response_t delete_order_nr_response;
    delete_order_response_t delete_order_response;
    delete_order_single_request_t delete_order_single_request;
    extended_deletion_report_t extended_deletion_report;
    forced_logout_notification_t forced_logout_notification;
    forced_user_logout_notification_t forced_user_logout_notification;
    gateway_request_t gateway_request;
    gateway_response_t gateway_response;
    heartbeat_t heartbeat;
    heartbeat_notification_t heartbeat_notification;
    inquire_enrichment_rule_id_list_request_t inquire_enrichment_rule_id_list_request;
    inquire_enrichment_rule_id_list_response_t inquire_enrichment_rule_id_list_response;
    inquire_session_list_request_t inquire_session_list_request;
    inquire_session_list_response_t inquire_session_list_response;
    inquire_user_request_t inquire_user_request;
    inquire_user_response_t inquire_user_response;
    legal_notification_broadcast_t legal_notification_broadcast;
    logon_request_t logon_request;
    logon_response_t logon_response;
    logout_request_t logout_request;
    logout_response_t logout_response;
    mass_quote_request_t mass_quote_request;
    mass_quote_response_t mass_quote_response;
    modify_order_nr_response_t modify_order_nr_response;
    modify_order_response_t modify_order_response;
    modify_order_single_request_t modify_order_single_request;
    modify_order_single_short_request_t modify_order_single_short_request;
    new_order_nr_response_t new_order_nr_response;
    new_order_response_t new_order_response;
    new_order_single_request_t new_order_single_request;
    new_order_single_short_request_t new_order_single_short_request;
    news_broadcast_t news_broadcast;
    order_exec_notification_t order_exec_notification;
    order_exec_report_broadcast_t order_exec_report_broadcast;
    order_exec_response_t order_exec_response;
    party_action_report_t party_action_report;
    party_entitlements_update_report_t party_entitlements_update_report;
    quote_activation_notification_t quote_activation_notification;
    quote_activation_request_t quote_activation_request;
    quote_activation_response_t quote_activation_response;
    quote_execution_report_t quote_execution_report;
    rfq_request_t rfq_request;
    rfq_response_t rfq_response;
    reject_t reject;
    retransmit_me_message_request_t retransmit_me_message_request;
    retransmit_me_message_response_t retransmit_me_message_response;
    retransmit_request_t retransmit_request;
    retransmit_response_t retransmit_response;
    service_availability_broadcast_t service_availability_broadcast;
    subscribe_request_t subscribe_request;
    subscribe_response_t subscribe_response;
    tm_trading_session_status_broadcast_t tm_trading_session_status_broadcast;
    throttle_update_notification_t throttle_update_notification;
    trade_broadcast_t trade_broadcast;
    trading_session_status_broadcast_t trading_session_status_broadcast;
    trailing_stop_update_notification_t trailing_stop_update_notification;
    unsubscribe_request_t unsubscribe_request;
    unsubscribe_response_t unsubscribe_response;
    user_login_request_t user_login_request;
    user_login_response_t user_login_response;
    user_logout_request_t user_logout_request;
    user_logout_response_t user_logout_response;
}

parser EurexT7XtiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10032: parse_broadcast_error_notification;
            16w10118: parse_cross_request;
            16w10119: parse_cross_request_response;
            16w10122: parse_delete_all_order_broadcast;
            16w10124: parse_delete_all_order_nr_response;
            16w10308: parse_delete_all_order_quote_event_broadcast;
            16w10120: parse_delete_all_order_request;
            16w10121: parse_delete_all_order_response;
            16w10410: parse_delete_all_quote_broadcast;
            16w10408: parse_delete_all_quote_request;
            16w10409: parse_delete_all_quote_response;
            16w10112: parse_delete_order_broadcast;
            16w10111: parse_delete_order_nr_response;
            16w10110: parse_delete_order_response;
            16w10109: parse_delete_order_single_request;
            16w10128: parse_extended_deletion_report;
            16w10012: parse_forced_logout_notification;
            16w10043: parse_forced_user_logout_notification;
            16w10020: parse_gateway_request;
            16w10021: parse_gateway_response;
            16w10011: parse_heartbeat;
            16w10023: parse_heartbeat_notification;
            16w10040: parse_inquire_enrichment_rule_id_list_request;
            16w10041: parse_inquire_enrichment_rule_id_list_response;
            16w10035: parse_inquire_session_list_request;
            16w10036: parse_inquire_session_list_response;
            16w10038: parse_inquire_user_request;
            16w10039: parse_inquire_user_response;
            16w10037: parse_legal_notification_broadcast;
            16w10000: parse_logon_request;
            16w10001: parse_logon_response;
            16w10002: parse_logout_request;
            16w10003: parse_logout_response;
            16w10405: parse_mass_quote_request;
            16w10406: parse_mass_quote_response;
            16w10108: parse_modify_order_nr_response;
            16w10107: parse_modify_order_response;
            16w10106: parse_modify_order_single_request;
            16w10126: parse_modify_order_single_short_request;
            16w10102: parse_new_order_nr_response;
            16w10101: parse_new_order_response;
            16w10100: parse_new_order_single_request;
            16w10125: parse_new_order_single_short_request;
            16w10031: parse_news_broadcast;
            16w10104: parse_order_exec_notification;
            16w10117: parse_order_exec_report_broadcast;
            16w10103: parse_order_exec_response;
            16w10042: parse_party_action_report;
            16w10034: parse_party_entitlements_update_report;
            16w10411: parse_quote_activation_notification;
            16w10403: parse_quote_activation_request;
            16w10404: parse_quote_activation_response;
            16w10407: parse_quote_execution_report;
            16w10401: parse_rfq_request;
            16w10402: parse_rfq_response;
            16w10010: parse_reject;
            16w10026: parse_retransmit_me_message_request;
            16w10027: parse_retransmit_me_message_response;
            16w10008: parse_retransmit_request;
            16w10009: parse_retransmit_response;
            16w10030: parse_service_availability_broadcast;
            16w10025: parse_subscribe_request;
            16w10005: parse_subscribe_response;
            16w10501: parse_tm_trading_session_status_broadcast;
            16w10028: parse_throttle_update_notification;
            16w10500: parse_trade_broadcast;
            16w10307: parse_trading_session_status_broadcast;
            16w10127: parse_trailing_stop_update_notification;
            16w10006: parse_unsubscribe_request;
            16w10007: parse_unsubscribe_response;
            16w10018: parse_user_login_request;
            16w10019: parse_user_login_response;
            16w10029: parse_user_logout_request;
            16w10024: parse_user_logout_response;
            default: accept;
        }
    }

    state parse_broadcast_error_notification {
        packet.extract(hdr.broadcast_error_notification);
        transition accept;
    }

    state parse_cross_request {
        packet.extract(hdr.cross_request);
        transition accept;
    }

    state parse_cross_request_response {
        packet.extract(hdr.cross_request_response);
        transition accept;
    }

    state parse_delete_all_order_broadcast {
        packet.extract(hdr.delete_all_order_broadcast);
        transition accept;
    }

    state parse_delete_all_order_nr_response {
        packet.extract(hdr.delete_all_order_nr_response);
        transition accept;
    }

    state parse_delete_all_order_quote_event_broadcast {
        packet.extract(hdr.delete_all_order_quote_event_broadcast);
        transition accept;
    }

    state parse_delete_all_order_request {
        packet.extract(hdr.delete_all_order_request);
        transition accept;
    }

    state parse_delete_all_order_response {
        packet.extract(hdr.delete_all_order_response);
        transition accept;
    }

    state parse_delete_all_quote_broadcast {
        packet.extract(hdr.delete_all_quote_broadcast);
        transition accept;
    }

    state parse_delete_all_quote_request {
        packet.extract(hdr.delete_all_quote_request);
        transition accept;
    }

    state parse_delete_all_quote_response {
        packet.extract(hdr.delete_all_quote_response);
        transition accept;
    }

    state parse_delete_order_broadcast {
        packet.extract(hdr.delete_order_broadcast);
        transition accept;
    }

    state parse_delete_order_nr_response {
        packet.extract(hdr.delete_order_nr_response);
        transition accept;
    }

    state parse_delete_order_response {
        packet.extract(hdr.delete_order_response);
        transition accept;
    }

    state parse_delete_order_single_request {
        packet.extract(hdr.delete_order_single_request);
        transition accept;
    }

    state parse_extended_deletion_report {
        packet.extract(hdr.extended_deletion_report);
        transition accept;
    }

    state parse_forced_logout_notification {
        packet.extract(hdr.forced_logout_notification);
        transition accept;
    }

    state parse_forced_user_logout_notification {
        packet.extract(hdr.forced_user_logout_notification);
        transition accept;
    }

    state parse_gateway_request {
        packet.extract(hdr.gateway_request);
        transition accept;
    }

    state parse_gateway_response {
        packet.extract(hdr.gateway_response);
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

    state parse_inquire_enrichment_rule_id_list_request {
        packet.extract(hdr.inquire_enrichment_rule_id_list_request);
        transition accept;
    }

    state parse_inquire_enrichment_rule_id_list_response {
        packet.extract(hdr.inquire_enrichment_rule_id_list_response);
        transition accept;
    }

    state parse_inquire_session_list_request {
        packet.extract(hdr.inquire_session_list_request);
        transition accept;
    }

    state parse_inquire_session_list_response {
        packet.extract(hdr.inquire_session_list_response);
        transition accept;
    }

    state parse_inquire_user_request {
        packet.extract(hdr.inquire_user_request);
        transition accept;
    }

    state parse_inquire_user_response {
        packet.extract(hdr.inquire_user_response);
        transition accept;
    }

    state parse_legal_notification_broadcast {
        packet.extract(hdr.legal_notification_broadcast);
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

    state parse_mass_quote_request {
        packet.extract(hdr.mass_quote_request);
        transition accept;
    }

    state parse_mass_quote_response {
        packet.extract(hdr.mass_quote_response);
        transition accept;
    }

    state parse_modify_order_nr_response {
        packet.extract(hdr.modify_order_nr_response);
        transition accept;
    }

    state parse_modify_order_response {
        packet.extract(hdr.modify_order_response);
        transition accept;
    }

    state parse_modify_order_single_request {
        packet.extract(hdr.modify_order_single_request);
        transition accept;
    }

    state parse_modify_order_single_short_request {
        packet.extract(hdr.modify_order_single_short_request);
        transition accept;
    }

    state parse_new_order_nr_response {
        packet.extract(hdr.new_order_nr_response);
        transition accept;
    }

    state parse_new_order_response {
        packet.extract(hdr.new_order_response);
        transition accept;
    }

    state parse_new_order_single_request {
        packet.extract(hdr.new_order_single_request);
        transition accept;
    }

    state parse_new_order_single_short_request {
        packet.extract(hdr.new_order_single_short_request);
        transition accept;
    }

    state parse_news_broadcast {
        packet.extract(hdr.news_broadcast);
        transition accept;
    }

    state parse_order_exec_notification {
        packet.extract(hdr.order_exec_notification);
        transition accept;
    }

    state parse_order_exec_report_broadcast {
        packet.extract(hdr.order_exec_report_broadcast);
        transition accept;
    }

    state parse_order_exec_response {
        packet.extract(hdr.order_exec_response);
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

    state parse_quote_activation_notification {
        packet.extract(hdr.quote_activation_notification);
        transition accept;
    }

    state parse_quote_activation_request {
        packet.extract(hdr.quote_activation_request);
        transition accept;
    }

    state parse_quote_activation_response {
        packet.extract(hdr.quote_activation_response);
        transition accept;
    }

    state parse_quote_execution_report {
        packet.extract(hdr.quote_execution_report);
        transition accept;
    }

    state parse_rfq_request {
        packet.extract(hdr.rfq_request);
        transition accept;
    }

    state parse_rfq_response {
        packet.extract(hdr.rfq_response);
        transition accept;
    }

    state parse_reject {
        packet.extract(hdr.reject);
        transition accept;
    }

    state parse_retransmit_me_message_request {
        packet.extract(hdr.retransmit_me_message_request);
        transition accept;
    }

    state parse_retransmit_me_message_response {
        packet.extract(hdr.retransmit_me_message_response);
        transition accept;
    }

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        transition accept;
    }

    state parse_retransmit_response {
        packet.extract(hdr.retransmit_response);
        transition accept;
    }

    state parse_service_availability_broadcast {
        packet.extract(hdr.service_availability_broadcast);
        transition accept;
    }

    state parse_subscribe_request {
        packet.extract(hdr.subscribe_request);
        transition accept;
    }

    state parse_subscribe_response {
        packet.extract(hdr.subscribe_response);
        transition accept;
    }

    state parse_tm_trading_session_status_broadcast {
        packet.extract(hdr.tm_trading_session_status_broadcast);
        transition accept;
    }

    state parse_throttle_update_notification {
        packet.extract(hdr.throttle_update_notification);
        transition accept;
    }

    state parse_trade_broadcast {
        packet.extract(hdr.trade_broadcast);
        transition accept;
    }

    state parse_trading_session_status_broadcast {
        packet.extract(hdr.trading_session_status_broadcast);
        transition accept;
    }

    state parse_trailing_stop_update_notification {
        packet.extract(hdr.trailing_stop_update_notification);
        transition accept;
    }

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
        transition accept;
    }

    state parse_unsubscribe_response {
        packet.extract(hdr.unsubscribe_response);
        transition accept;
    }

    state parse_user_login_request {
        packet.extract(hdr.user_login_request);
        transition accept;
    }

    state parse_user_login_response {
        packet.extract(hdr.user_login_response);
        transition accept;
    }

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
        transition accept;
    }

    state parse_user_logout_response {
        packet.extract(hdr.user_logout_response);
        transition accept;
    }

}

control EurexT7XtiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7XtiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7XtiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.broadcast_error_notification);
        packet.emit(hdr.cross_request);
        packet.emit(hdr.cross_request_response);
        packet.emit(hdr.delete_all_order_broadcast);
        packet.emit(hdr.delete_all_order_nr_response);
        packet.emit(hdr.delete_all_order_quote_event_broadcast);
        packet.emit(hdr.delete_all_order_request);
        packet.emit(hdr.delete_all_order_response);
        packet.emit(hdr.delete_all_quote_broadcast);
        packet.emit(hdr.delete_all_quote_request);
        packet.emit(hdr.delete_all_quote_response);
        packet.emit(hdr.delete_order_broadcast);
        packet.emit(hdr.delete_order_nr_response);
        packet.emit(hdr.delete_order_response);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.extended_deletion_report);
        packet.emit(hdr.forced_logout_notification);
        packet.emit(hdr.forced_user_logout_notification);
        packet.emit(hdr.gateway_request);
        packet.emit(hdr.gateway_response);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.heartbeat_notification);
        packet.emit(hdr.inquire_enrichment_rule_id_list_request);
        packet.emit(hdr.inquire_enrichment_rule_id_list_response);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.inquire_session_list_response);
        packet.emit(hdr.inquire_user_request);
        packet.emit(hdr.inquire_user_response);
        packet.emit(hdr.legal_notification_broadcast);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logon_response);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.logout_response);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.mass_quote_response);
        packet.emit(hdr.modify_order_nr_response);
        packet.emit(hdr.modify_order_response);
        packet.emit(hdr.modify_order_single_request);
        packet.emit(hdr.modify_order_single_short_request);
        packet.emit(hdr.new_order_nr_response);
        packet.emit(hdr.new_order_response);
        packet.emit(hdr.new_order_single_request);
        packet.emit(hdr.new_order_single_short_request);
        packet.emit(hdr.news_broadcast);
        packet.emit(hdr.order_exec_notification);
        packet.emit(hdr.order_exec_report_broadcast);
        packet.emit(hdr.order_exec_response);
        packet.emit(hdr.party_action_report);
        packet.emit(hdr.party_entitlements_update_report);
        packet.emit(hdr.quote_activation_notification);
        packet.emit(hdr.quote_activation_request);
        packet.emit(hdr.quote_activation_response);
        packet.emit(hdr.quote_execution_report);
        packet.emit(hdr.rfq_request);
        packet.emit(hdr.rfq_response);
        packet.emit(hdr.reject);
        packet.emit(hdr.retransmit_me_message_request);
        packet.emit(hdr.retransmit_me_message_response);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.retransmit_response);
        packet.emit(hdr.service_availability_broadcast);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.subscribe_response);
        packet.emit(hdr.tm_trading_session_status_broadcast);
        packet.emit(hdr.throttle_update_notification);
        packet.emit(hdr.trade_broadcast);
        packet.emit(hdr.trading_session_status_broadcast);
        packet.emit(hdr.trailing_stop_update_notification);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.unsubscribe_response);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_login_response);
        packet.emit(hdr.user_logout_request);
        packet.emit(hdr.user_logout_response);
    }
}

V1Switch(
    EurexT7XtiParser(),
    EurexT7XtiVerifyChecksum(),
    EurexT7XtiIngress(),
    EurexT7XtiEgress(),
    EurexT7XtiComputeChecksum(),
    EurexT7XtiDeparser()
) main;
