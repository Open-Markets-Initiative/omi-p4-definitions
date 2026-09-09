// P4_16 (v1model) definition for: Eurex T7 Eti Fbe v5.0
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Enhanced Trading Interface
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

header add_complex_instrument_response_t {
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
    bit<64> low_limit_price;
    bit<64> high_limit_price;
    bit<64> security_id;
    bit<64> last_update_time;
    bit<64> security_response_id;
    bit<32> market_segment_id;
    bit<32> number_of_securities;
    bit<32> security_sub_type;
    bit<8> multileg_model;
    bit<8> implied_market_indicator;
    bit<8> product_complex;
    bit<8> no_legs;
}

header add_complex_instrument_response_instrmt_leg_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<32> leg_symbol;
    bit<32> leg_ratio_qty;
    bit<8> leg_side;
    bit<8> leg_security_type;
    bit<48> pad6;
}

header add_flexible_instrument_response_t {
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
    bit<64> security_response_id;
    bit<64> security_id;
    bit<64> strike_price;
    bit<32> market_segment_id;
    bit<32> maturity_date;
    bit<8> product_complex;
    bit<8> settl_method;
    bit<8> opt_attribute;
    bit<8> put_or_call;
    bit<8> exercise_style;
    bit<32> symbol;
    bit<56> pad7;
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
    bit<8> party_id_entering_firm;
    bit<8> mass_action_reason;
    bit<8> exec_inst;
    bit<8> side;
    bit<16> pad2v2;
}

header delete_all_order_broadcast_not_affected_orders_grp_comp_t {
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
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
    bit<48> pad6;
}

header delete_all_order_response_not_affected_orders_grp_comp_t {
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
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
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> product_complex;
    bit<8> side;
    bit<8> pad1;
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
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> product_complex;
    bit<24> pad3_2;
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
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> product_complex;
    bit<24> pad3;
}

header forced_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<16> var_text_len;
    bit<48> pad6;
}

header forced_user_logout_notification_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<8> user_status;
    bit<24> pad3;
    bit<32> username;
    bit<16> var_text_len;
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
    bit<8> party_id_origination_market;
    bit<16> account;
    bit<8> position_effect;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<8> pad1;
}

header inquire_mm_parameter_response_t {
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
    bit<64> mm_parameter_report_id;
    bit<32> market_segment_id;
    bit<8> no_mm_parameters;
    bit<24> pad3_2;
}

header inquire_mm_parameter_response_mm_parameter_grp_comp_t {
    bit<64> exposure_duration;
    bit<32> cum_qty;
    bit<32> pct_count;
    bit<32> delta;
    bit<32> vega;
    bit<8> product_complex;
    bit<56> pad7;
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

header logout_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header mm_parameter_definition_response_t {
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
}

header mass_quote_response_quote_entry_ack_grp_comp_t {
    bit<64> security_id;
    bit<32> bid_cxl_size;
    bit<32> offer_cxl_size;
    bit<32> quote_entry_reject_reason;
    bit<8> quote_entry_status;
    bit<24> pad3;
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
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> product_complex;
    bit<8> triggered;
    bit<40> pad5;
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
    bit<64> trd_reg_ts_time_priority;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> product_complex;
    bit<8> triggered;
    bit<40> pad5;
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
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> product_complex;
    bit<8> triggered;
    bit<8> pad1;
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
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed;
    bit<8> product_complex;
    bit<8> triggered;
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
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<16> no_leg_execs;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> product_complex;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> triggered;
    bit<8> crossed;
    bit<8> no_fills;
    bit<40> pad5;
}

header order_exec_notification_fills_grp_comp_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<24> pad3;
}

header order_exec_notification_instrmnt_leg_exec_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<32> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<48> pad6;
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
    bit<32> market_segment_id;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<32> order_qty;
    bit<32> expire_date;
    bit<32> match_inst_cross_id;
    bit<32> party_id_executing_unit;
    bit<32> party_id_session_id;
    bit<32> party_id_executing_trader;
    bit<32> party_id_entering_trader;
    bit<16> no_leg_execs;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> product_complex;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> side;
    bit<8> ord_type;
    bit<8> trading_capacity;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> appl_seq_indicator;
    bit<16> account;
    bit<256> party_id_position_account;
    bit<8> position_effect;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<8> no_fills;
    bit<8> no_legs;
    bit<8> triggered;
    bit<8> crossed;
    bit<48> pad6;
}

header order_exec_report_broadcast_leg_ord_grp_comp_t {
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5;
}

header order_exec_report_broadcast_fills_grp_comp_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<24> pad3;
}

header order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<32> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<48> pad6;
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
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> cxl_qty;
    bit<16> no_leg_execs;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> product_complex;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> triggered;
    bit<8> crossed;
    bit<8> no_fills;
    bit<40> pad5;
}

header order_exec_response_fills_grp_comp_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<24> pad3;
}

header order_exec_response_instrmnt_leg_exec_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<32> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<48> pad6;
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
    bit<8> product_complex;
    bit<8> mass_action_type;
    bit<8> mass_action_reason;
    bit<16> pad2v2;
}

header quote_activation_notification_not_affected_securities_grp_comp_t {
    bit<64> not_affected_security_id;
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
    bit<16> no_leg_execs;
    bit<8> no_quote_events;
    bit<8> pad1;
}

header quote_execution_report_quote_event_grp_comp_t {
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

header quote_execution_report_quote_leg_exec_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<32> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> no_quote_events_index;
    bit<48> pad6;
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

header risk_notification_broadcast_t {
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
    bit<8> risk_limit_action;
    bit<72> requesting_party_entering_firm;
    bit<72> requesting_party_clearing_firm;
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
    bit<64> transact_time;
    bit<64> underlying_px;
    bit<64> underlying_qty;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> alloc_qty;
    bit<32> alloc_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> related_trade_quantity;
    bit<16> trd_type;
    bit<8> side;
    bit<8> trade_publish_indicator;
    bit<8> product_complex;
    bit<8> trade_report_type;
    bit<8> trading_capacity;
    bit<8> party_id_settlement_location;
    bit<8> trade_alloc_status;
    bit<8> hedge_type;
    bit<8> no_events;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> party_id_entering_firm;
    bit<48> party_entering_trader;
    bit<8> position_effect;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<40> party_id_take_up_trading_firm;
    bit<16> account;
    bit<256> party_id_position_account;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<24> pad3;
}

header tes_approve_broadcast_instrument_event_grp_comp_t {
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
}

header tes_approve_broadcast_instrument_attribute_grp_comp_t {
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
}

header tes_approve_broadcast_underlying_stip_grp_comp_t {
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1;
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
    bit<64> underlying_px;
    bit<64> underlying_qty;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> related_trade_quantity;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<8> no_events;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> no_side_allocs;
    bit<8> party_id_settlement_location;
    bit<8> hedge_type;
    bit<8> message_event_source;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<48> pad6;
}

header tes_broadcast_side_alloc_grp_bc_comp_t {
    bit<32> individual_alloc_id;
    bit<32> alloc_qty;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<24> pad3;
}

header tes_broadcast_instrument_event_grp_comp_t {
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
}

header tes_broadcast_instrument_attribute_grp_comp_t {
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
}

header tes_broadcast_underlying_stip_grp_comp_t {
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1;
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
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<24> pad3;
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
    bit<8> message_event_source;
    bit<32> pad4;
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
    bit<64> clearing_trade_price;
    bit<64> transact_time;
    bit<64> related_security_id;
    bit<32> package_id;
    bit<32> last_qty;
    bit<32> market_segment_id;
    bit<32> trade_id;
    bit<32> trade_date;
    bit<32> side_trade_id;
    bit<32> root_party_id_session_id;
    bit<32> orig_trade_id;
    bit<32> clearing_trade_qty;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_clearing_unit;
    bit<32> strategy_link_id;
    bit<32> related_symbol;
    bit<32> tot_num_trade_reports;
    bit<16> trd_type;
    bit<8> product_complex;
    bit<8> related_product_complex;
    bit<8> side;
    bit<8> trading_capacity;
    bit<8> trade_report_type;
    bit<8> transfer_reason;
    bit<8> multi_leg_reporting_type;
    bit<8> position_effect;
    bit<16> account;
    bit<256> root_party_id_position_account;
    bit<8> cust_order_handling_inst;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<40> root_party_clearing_firm;
    bit<32> root_party_clearing_organization;
    bit<72> root_party_id_beneficiary;
    bit<40> root_party_id_take_up_trading_firm;
    bit<56> root_party_id_order_origination_firm;
    bit<16> pad2v2;
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

header tes_upload_broadcast_t {
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
    bit<64> trans_bkd_time;
    bit<64> transact_time;
    bit<64> underlying_px;
    bit<64> underlying_qty;
    bit<64> related_close_price;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> related_trade_quantity;
    bit<16> trd_type;
    bit<8> product_complex;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<8> no_events;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> hedge_type;
    bit<8> party_id_settlement_location;
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<16> pad2v2;
}

header tes_upload_broadcast_side_alloc_ext_grp_comp_t {
    bit<64> compliance_id;
    bit<32> individual_alloc_id;
    bit<32> alloc_qty;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<8> trading_capacity;
    bit<8> position_effect;
    bit<16> account;
    bit<256> party_id_position_account;
    bit<40> party_id_take_up_trading_firm;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<56> pad7;
}

header tes_upload_broadcast_instrument_event_grp_comp_t {
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
}

header tes_upload_broadcast_instrument_attribute_grp_comp_t {
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
}

header tes_upload_broadcast_underlying_stip_grp_comp_t {
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1;
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
    bit<64> related_security_id;
    bit<64> price;
    bit<64> last_px;
    bit<64> side_last_px;
    bit<64> clearing_trade_price;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_session_id;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_clearing_unit;
    bit<32> cum_qty;
    bit<32> leaves_qty;
    bit<32> market_segment_id;
    bit<32> related_symbol;
    bit<32> last_qty;
    bit<32> side_last_qty;
    bit<32> clearing_trade_qty;
    bit<32> side_trade_id;
    bit<32> match_date;
    bit<32> trd_match_id;
    bit<32> strategy_link_id;
    bit<32> tot_num_trade_reports;
    bit<8> multi_leg_reporting_type;
    bit<8> trade_report_type;
    bit<8> transfer_reason;
    bit<72> root_party_id_beneficiary;
    bit<40> root_party_id_take_up_trading_firm;
    bit<56> root_party_id_order_origination_firm;
    bit<8> match_type;
    bit<8> match_sub_type;
    bit<8> side;
    bit<8> side_liquidity_ind;
    bit<8> trading_capacity;
    bit<16> account;
    bit<256> root_party_id_position_account;
    bit<8> position_effect;
    bit<8> cust_order_handling_inst;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<8> order_category;
    bit<8> ord_type;
    bit<8> related_product_complex;
    bit<8> order_side;
    bit<32> root_party_clearing_organization;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<40> root_party_clearing_firm;
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

struct metadata_t {
    bit<1> dispatched;
    bit<8> add_complex_instrument_response_instrmt_leg_grp_comp_remaining;
    bit<16> delete_all_order_broadcast_not_affected_orders_grp_comp_remaining;
    bit<16> delete_all_order_response_not_affected_orders_grp_comp_remaining;
    bit<16> delete_all_quote_broadcast_not_affected_securities_grp_comp_remaining;
    bit<16> delete_all_quote_response_not_affected_securities_grp_comp_remaining;
    bit<16> inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_remaining;
    bit<8> inquire_mm_parameter_response_mm_parameter_grp_comp_remaining;
    bit<16> inquire_session_list_response_sessions_grp_comp_remaining;
    bit<16> inquire_user_response_party_details_grp_comp_remaining;
    bit<8> mass_quote_response_quote_entry_ack_grp_comp_remaining;
    bit<8> order_exec_notification_fills_grp_comp_remaining;
    bit<16> order_exec_notification_instrmnt_leg_exec_grp_comp_remaining;
    bit<8> order_exec_report_broadcast_leg_ord_grp_comp_remaining;
    bit<8> order_exec_report_broadcast_fills_grp_comp_remaining;
    bit<16> order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_remaining;
    bit<8> order_exec_response_fills_grp_comp_remaining;
    bit<16> order_exec_response_instrmnt_leg_exec_grp_comp_remaining;
    bit<16> quote_activation_notification_not_affected_securities_grp_comp_remaining;
    bit<16> quote_activation_response_not_affected_securities_grp_comp_remaining;
    bit<8> quote_execution_report_quote_event_grp_comp_remaining;
    bit<16> quote_execution_report_quote_leg_exec_grp_comp_remaining;
    bit<8> tes_approve_broadcast_instrument_event_grp_comp_remaining;
    bit<8> tes_approve_broadcast_instrument_attribute_grp_comp_remaining;
    bit<8> tes_approve_broadcast_underlying_stip_grp_comp_remaining;
    bit<8> tes_broadcast_side_alloc_grp_bc_comp_remaining;
    bit<8> tes_broadcast_instrument_event_grp_comp_remaining;
    bit<8> tes_broadcast_instrument_attribute_grp_comp_remaining;
    bit<8> tes_broadcast_underlying_stip_grp_comp_remaining;
    bit<8> tes_upload_broadcast_side_alloc_ext_grp_comp_remaining;
    bit<8> tes_upload_broadcast_instrument_event_grp_comp_remaining;
    bit<8> tes_upload_broadcast_instrument_attribute_grp_comp_remaining;
    bit<8> tes_upload_broadcast_underlying_stip_grp_comp_remaining;
}

struct headers_t {
    message_header_t message_header;
    add_complex_instrument_response_t add_complex_instrument_response;
    add_complex_instrument_response_instrmt_leg_grp_comp_t add_complex_instrument_response_instrmt_leg_grp_comp[MAX_MESSAGES];
    add_flexible_instrument_response_t add_flexible_instrument_response;
    broadcast_error_notification_t broadcast_error_notification;
    cross_request_response_t cross_request_response;
    delete_all_order_broadcast_t delete_all_order_broadcast;
    delete_all_order_broadcast_not_affected_orders_grp_comp_t delete_all_order_broadcast_not_affected_orders_grp_comp[MAX_MESSAGES];
    delete_all_order_nr_response_t delete_all_order_nr_response;
    delete_all_order_quote_event_broadcast_t delete_all_order_quote_event_broadcast;
    delete_all_order_response_t delete_all_order_response;
    delete_all_order_response_not_affected_orders_grp_comp_t delete_all_order_response_not_affected_orders_grp_comp[MAX_MESSAGES];
    delete_all_quote_broadcast_t delete_all_quote_broadcast;
    delete_all_quote_broadcast_not_affected_securities_grp_comp_t delete_all_quote_broadcast_not_affected_securities_grp_comp[MAX_MESSAGES];
    delete_all_quote_response_t delete_all_quote_response;
    delete_all_quote_response_not_affected_securities_grp_comp_t delete_all_quote_response_not_affected_securities_grp_comp[MAX_MESSAGES];
    delete_order_broadcast_t delete_order_broadcast;
    delete_order_nr_response_t delete_order_nr_response;
    delete_order_response_t delete_order_response;
    forced_logout_notification_t forced_logout_notification;
    forced_user_logout_notification_t forced_user_logout_notification;
    gateway_response_t gateway_response;
    heartbeat_notification_t heartbeat_notification;
    inquire_enrichment_rule_id_list_response_t inquire_enrichment_rule_id_list_response;
    inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp_t inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp[MAX_MESSAGES];
    inquire_mm_parameter_response_t inquire_mm_parameter_response;
    inquire_mm_parameter_response_mm_parameter_grp_comp_t inquire_mm_parameter_response_mm_parameter_grp_comp[MAX_MESSAGES];
    inquire_session_list_response_t inquire_session_list_response;
    inquire_session_list_response_sessions_grp_comp_t inquire_session_list_response_sessions_grp_comp[MAX_MESSAGES];
    inquire_user_response_t inquire_user_response;
    inquire_user_response_party_details_grp_comp_t inquire_user_response_party_details_grp_comp[MAX_MESSAGES];
    legal_notification_broadcast_t legal_notification_broadcast;
    logon_response_t logon_response;
    logout_response_t logout_response;
    mm_parameter_definition_response_t mm_parameter_definition_response;
    mass_quote_response_t mass_quote_response;
    mass_quote_response_quote_entry_ack_grp_comp_t mass_quote_response_quote_entry_ack_grp_comp[MAX_MESSAGES];
    modify_order_nr_response_t modify_order_nr_response;
    modify_order_response_t modify_order_response;
    new_order_nr_response_t new_order_nr_response;
    new_order_response_t new_order_response;
    news_broadcast_t news_broadcast;
    order_exec_notification_t order_exec_notification;
    order_exec_notification_fills_grp_comp_t order_exec_notification_fills_grp_comp[MAX_MESSAGES];
    order_exec_notification_instrmnt_leg_exec_grp_comp_t order_exec_notification_instrmnt_leg_exec_grp_comp[MAX_MESSAGES];
    order_exec_report_broadcast_t order_exec_report_broadcast;
    order_exec_report_broadcast_leg_ord_grp_comp_t order_exec_report_broadcast_leg_ord_grp_comp[MAX_MESSAGES];
    order_exec_report_broadcast_fills_grp_comp_t order_exec_report_broadcast_fills_grp_comp[MAX_MESSAGES];
    order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_t order_exec_report_broadcast_instrmnt_leg_exec_grp_comp[MAX_MESSAGES];
    order_exec_response_t order_exec_response;
    order_exec_response_fills_grp_comp_t order_exec_response_fills_grp_comp[MAX_MESSAGES];
    order_exec_response_instrmnt_leg_exec_grp_comp_t order_exec_response_instrmnt_leg_exec_grp_comp[MAX_MESSAGES];
    party_action_report_t party_action_report;
    party_entitlements_update_report_t party_entitlements_update_report;
    quote_activation_notification_t quote_activation_notification;
    quote_activation_notification_not_affected_securities_grp_comp_t quote_activation_notification_not_affected_securities_grp_comp[MAX_MESSAGES];
    quote_activation_response_t quote_activation_response;
    quote_activation_response_not_affected_securities_grp_comp_t quote_activation_response_not_affected_securities_grp_comp[MAX_MESSAGES];
    quote_execution_report_t quote_execution_report;
    quote_execution_report_quote_event_grp_comp_t quote_execution_report_quote_event_grp_comp[MAX_MESSAGES];
    quote_execution_report_quote_leg_exec_grp_comp_t quote_execution_report_quote_leg_exec_grp_comp[MAX_MESSAGES];
    rfq_response_t rfq_response;
    reject_t reject;
    retransmit_me_message_response_t retransmit_me_message_response;
    retransmit_response_t retransmit_response;
    risk_notification_broadcast_t risk_notification_broadcast;
    service_availability_broadcast_t service_availability_broadcast;
    subscribe_response_t subscribe_response;
    tes_approve_broadcast_t tes_approve_broadcast;
    tes_approve_broadcast_instrument_event_grp_comp_t tes_approve_broadcast_instrument_event_grp_comp[MAX_MESSAGES];
    tes_approve_broadcast_instrument_attribute_grp_comp_t tes_approve_broadcast_instrument_attribute_grp_comp[MAX_MESSAGES];
    tes_approve_broadcast_underlying_stip_grp_comp_t tes_approve_broadcast_underlying_stip_grp_comp[MAX_MESSAGES];
    tes_broadcast_t tes_broadcast;
    tes_broadcast_side_alloc_grp_bc_comp_t tes_broadcast_side_alloc_grp_bc_comp[MAX_MESSAGES];
    tes_broadcast_instrument_event_grp_comp_t tes_broadcast_instrument_event_grp_comp[MAX_MESSAGES];
    tes_broadcast_instrument_attribute_grp_comp_t tes_broadcast_instrument_attribute_grp_comp[MAX_MESSAGES];
    tes_broadcast_underlying_stip_grp_comp_t tes_broadcast_underlying_stip_grp_comp[MAX_MESSAGES];
    tes_delete_broadcast_t tes_delete_broadcast;
    tes_execution_broadcast_t tes_execution_broadcast;
    tes_response_t tes_response;
    tes_trade_broadcast_t tes_trade_broadcast;
    tes_trading_session_status_broadcast_t tes_trading_session_status_broadcast;
    tes_upload_broadcast_t tes_upload_broadcast;
    tes_upload_broadcast_side_alloc_ext_grp_comp_t tes_upload_broadcast_side_alloc_ext_grp_comp[MAX_MESSAGES];
    tes_upload_broadcast_instrument_event_grp_comp_t tes_upload_broadcast_instrument_event_grp_comp[MAX_MESSAGES];
    tes_upload_broadcast_instrument_attribute_grp_comp_t tes_upload_broadcast_instrument_attribute_grp_comp[MAX_MESSAGES];
    tes_upload_broadcast_underlying_stip_grp_comp_t tes_upload_broadcast_underlying_stip_grp_comp[MAX_MESSAGES];
    tm_trading_session_status_broadcast_t tm_trading_session_status_broadcast;
    throttle_update_notification_t throttle_update_notification;
    trade_broadcast_t trade_broadcast;
    trading_session_status_broadcast_t trading_session_status_broadcast;
    unsubscribe_response_t unsubscribe_response;
    user_login_response_t user_login_response;
    user_logout_response_t user_logout_response;
}

parser EurexT7EtiServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x3e28: parse_add_complex_instrument_response;
            16w0x4628: parse_add_flexible_instrument_response;
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
            16w0x1c27: parse_forced_logout_notification;
            16w0x3b27: parse_forced_user_logout_notification;
            16w0x2527: parse_gateway_response;
            16w0x2727: parse_heartbeat_notification;
            16w0x3927: parse_inquire_enrichment_rule_id_list_response;
            16w0x4228: parse_inquire_mm_parameter_response;
            16w0x3427: parse_inquire_session_list_response;
            16w0x3727: parse_inquire_user_response;
            16w0x3527: parse_legal_notification_broadcast;
            16w0x1127: parse_logon_response;
            16w0x1327: parse_logout_response;
            16w0x4028: parse_mm_parameter_definition_response;
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
            16w0xab28: parse_quote_activation_notification;
            16w0xa428: parse_quote_activation_response;
            16w0xa728: parse_quote_execution_report;
            16w0xa228: parse_rfq_response;
            16w0x1a27: parse_reject;
            16w0x2b27: parse_retransmit_me_message_response;
            16w0x1927: parse_retransmit_response;
            16w0x3127: parse_risk_notification_broadcast;
            16w0x2e27: parse_service_availability_broadcast;
            16w0x1527: parse_subscribe_response;
            16w0x6f29: parse_tes_approve_broadcast;
            16w0x6c29: parse_tes_broadcast;
            16w0x6e29: parse_tes_delete_broadcast;
            16w0x7229: parse_tes_execution_broadcast;
            16w0x7329: parse_tes_response;
            16w0x7629: parse_tes_trade_broadcast;
            16w0x7729: parse_tes_trading_session_status_broadcast;
            16w0x7529: parse_tes_upload_broadcast;
            16w0x529: parse_tm_trading_session_status_broadcast;
            16w0x2c27: parse_throttle_update_notification;
            16w0x429: parse_trade_broadcast;
            16w0x4328: parse_trading_session_status_broadcast;
            16w0x1727: parse_unsubscribe_response;
            16w0x2327: parse_user_login_response;
            16w0x2827: parse_user_logout_response;
            default: accept;
        }
    }

    state parse_add_complex_instrument_response {
        packet.extract(hdr.add_complex_instrument_response);
        meta.dispatched = 1;
        meta.add_complex_instrument_response_instrmt_leg_grp_comp_remaining = hdr.add_complex_instrument_response.no_legs;
        transition select(meta.add_complex_instrument_response_instrmt_leg_grp_comp_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_response_instrmt_leg_grp_comp;
        }
    }

    state parse_add_complex_instrument_response_instrmt_leg_grp_comp {
        packet.extract(hdr.add_complex_instrument_response_instrmt_leg_grp_comp.next);
        meta.add_complex_instrument_response_instrmt_leg_grp_comp_remaining = meta.add_complex_instrument_response_instrmt_leg_grp_comp_remaining - 1;
        transition select(meta.add_complex_instrument_response_instrmt_leg_grp_comp_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_response_instrmt_leg_grp_comp;
        }
    }

    state parse_add_flexible_instrument_response {
        packet.extract(hdr.add_flexible_instrument_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broadcast_error_notification {
        packet.extract(hdr.broadcast_error_notification);
        meta.dispatched = 1;
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
            16w0: accept;
            default: parse_delete_all_order_broadcast_not_affected_orders_grp_comp;
        }
    }

    state parse_delete_all_order_broadcast_not_affected_orders_grp_comp {
        packet.extract(hdr.delete_all_order_broadcast_not_affected_orders_grp_comp.next);
        meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining = meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_broadcast_not_affected_orders_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_order_broadcast_not_affected_orders_grp_comp;
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
            16w0: accept;
            default: parse_delete_all_order_response_not_affected_orders_grp_comp;
        }
    }

    state parse_delete_all_order_response_not_affected_orders_grp_comp {
        packet.extract(hdr.delete_all_order_response_not_affected_orders_grp_comp.next);
        meta.delete_all_order_response_not_affected_orders_grp_comp_remaining = meta.delete_all_order_response_not_affected_orders_grp_comp_remaining - 1;
        transition select(meta.delete_all_order_response_not_affected_orders_grp_comp_remaining) {
            16w0: accept;
            default: parse_delete_all_order_response_not_affected_orders_grp_comp;
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

    state parse_forced_logout_notification {
        packet.extract(hdr.forced_logout_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_forced_user_logout_notification {
        packet.extract(hdr.forced_user_logout_notification);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_response {
        packet.extract(hdr.gateway_response);
        meta.dispatched = 1;
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

    state parse_inquire_mm_parameter_response {
        packet.extract(hdr.inquire_mm_parameter_response);
        meta.dispatched = 1;
        meta.inquire_mm_parameter_response_mm_parameter_grp_comp_remaining = hdr.inquire_mm_parameter_response.no_mm_parameters;
        transition select(meta.inquire_mm_parameter_response_mm_parameter_grp_comp_remaining) {
            8w0: accept;
            default: parse_inquire_mm_parameter_response_mm_parameter_grp_comp;
        }
    }

    state parse_inquire_mm_parameter_response_mm_parameter_grp_comp {
        packet.extract(hdr.inquire_mm_parameter_response_mm_parameter_grp_comp.next);
        meta.inquire_mm_parameter_response_mm_parameter_grp_comp_remaining = meta.inquire_mm_parameter_response_mm_parameter_grp_comp_remaining - 1;
        transition select(meta.inquire_mm_parameter_response_mm_parameter_grp_comp_remaining) {
            8w0: accept;
            default: parse_inquire_mm_parameter_response_mm_parameter_grp_comp;
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

    state parse_legal_notification_broadcast {
        packet.extract(hdr.legal_notification_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_response {
        packet.extract(hdr.logon_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_response {
        packet.extract(hdr.logout_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mm_parameter_definition_response {
        packet.extract(hdr.mm_parameter_definition_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_response {
        packet.extract(hdr.mass_quote_response);
        meta.dispatched = 1;
        meta.mass_quote_response_quote_entry_ack_grp_comp_remaining = hdr.mass_quote_response.no_quote_entries;
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
        transition accept;
    }

    state parse_modify_order_response {
        packet.extract(hdr.modify_order_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_nr_response {
        packet.extract(hdr.new_order_nr_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_response {
        packet.extract(hdr.new_order_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_news_broadcast {
        packet.extract(hdr.news_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_exec_notification {
        packet.extract(hdr.order_exec_notification);
        meta.dispatched = 1;
        meta.order_exec_notification_fills_grp_comp_remaining = hdr.order_exec_notification.no_fills;
        transition select(meta.order_exec_notification_fills_grp_comp_remaining) {
            8w0: read_order_exec_notification_instrmnt_leg_exec_grp_comp;
            default: parse_order_exec_notification_fills_grp_comp;
        }
    }

    state parse_order_exec_notification_fills_grp_comp {
        packet.extract(hdr.order_exec_notification_fills_grp_comp.next);
        meta.order_exec_notification_fills_grp_comp_remaining = meta.order_exec_notification_fills_grp_comp_remaining - 1;
        transition select(meta.order_exec_notification_fills_grp_comp_remaining) {
            8w0: read_order_exec_notification_instrmnt_leg_exec_grp_comp;
            default: parse_order_exec_notification_fills_grp_comp;
        }
    }

    state read_order_exec_notification_instrmnt_leg_exec_grp_comp {
        meta.order_exec_notification_instrmnt_leg_exec_grp_comp_remaining = hdr.order_exec_notification.no_leg_execs;
        transition select(meta.order_exec_notification_instrmnt_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_order_exec_notification_instrmnt_leg_exec_grp_comp;
        }
    }

    state parse_order_exec_notification_instrmnt_leg_exec_grp_comp {
        packet.extract(hdr.order_exec_notification_instrmnt_leg_exec_grp_comp.next);
        meta.order_exec_notification_instrmnt_leg_exec_grp_comp_remaining = meta.order_exec_notification_instrmnt_leg_exec_grp_comp_remaining - 1;
        transition select(meta.order_exec_notification_instrmnt_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_order_exec_notification_instrmnt_leg_exec_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast {
        packet.extract(hdr.order_exec_report_broadcast);
        meta.dispatched = 1;
        meta.order_exec_report_broadcast_leg_ord_grp_comp_remaining = hdr.order_exec_report_broadcast.no_legs;
        transition select(meta.order_exec_report_broadcast_leg_ord_grp_comp_remaining) {
            8w0: read_order_exec_report_broadcast_fills_grp_comp;
            default: parse_order_exec_report_broadcast_leg_ord_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast_leg_ord_grp_comp {
        packet.extract(hdr.order_exec_report_broadcast_leg_ord_grp_comp.next);
        meta.order_exec_report_broadcast_leg_ord_grp_comp_remaining = meta.order_exec_report_broadcast_leg_ord_grp_comp_remaining - 1;
        transition select(meta.order_exec_report_broadcast_leg_ord_grp_comp_remaining) {
            8w0: read_order_exec_report_broadcast_fills_grp_comp;
            default: parse_order_exec_report_broadcast_leg_ord_grp_comp;
        }
    }

    state read_order_exec_report_broadcast_fills_grp_comp {
        meta.order_exec_report_broadcast_fills_grp_comp_remaining = hdr.order_exec_report_broadcast.no_fills;
        transition select(meta.order_exec_report_broadcast_fills_grp_comp_remaining) {
            8w0: read_order_exec_report_broadcast_instrmnt_leg_exec_grp_comp;
            default: parse_order_exec_report_broadcast_fills_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast_fills_grp_comp {
        packet.extract(hdr.order_exec_report_broadcast_fills_grp_comp.next);
        meta.order_exec_report_broadcast_fills_grp_comp_remaining = meta.order_exec_report_broadcast_fills_grp_comp_remaining - 1;
        transition select(meta.order_exec_report_broadcast_fills_grp_comp_remaining) {
            8w0: read_order_exec_report_broadcast_instrmnt_leg_exec_grp_comp;
            default: parse_order_exec_report_broadcast_fills_grp_comp;
        }
    }

    state read_order_exec_report_broadcast_instrmnt_leg_exec_grp_comp {
        meta.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_remaining = hdr.order_exec_report_broadcast.no_leg_execs;
        transition select(meta.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_order_exec_report_broadcast_instrmnt_leg_exec_grp_comp;
        }
    }

    state parse_order_exec_report_broadcast_instrmnt_leg_exec_grp_comp {
        packet.extract(hdr.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp.next);
        meta.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_remaining = meta.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_remaining - 1;
        transition select(meta.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_order_exec_report_broadcast_instrmnt_leg_exec_grp_comp;
        }
    }

    state parse_order_exec_response {
        packet.extract(hdr.order_exec_response);
        meta.dispatched = 1;
        meta.order_exec_response_fills_grp_comp_remaining = hdr.order_exec_response.no_fills;
        transition select(meta.order_exec_response_fills_grp_comp_remaining) {
            8w0: read_order_exec_response_instrmnt_leg_exec_grp_comp;
            default: parse_order_exec_response_fills_grp_comp;
        }
    }

    state parse_order_exec_response_fills_grp_comp {
        packet.extract(hdr.order_exec_response_fills_grp_comp.next);
        meta.order_exec_response_fills_grp_comp_remaining = meta.order_exec_response_fills_grp_comp_remaining - 1;
        transition select(meta.order_exec_response_fills_grp_comp_remaining) {
            8w0: read_order_exec_response_instrmnt_leg_exec_grp_comp;
            default: parse_order_exec_response_fills_grp_comp;
        }
    }

    state read_order_exec_response_instrmnt_leg_exec_grp_comp {
        meta.order_exec_response_instrmnt_leg_exec_grp_comp_remaining = hdr.order_exec_response.no_leg_execs;
        transition select(meta.order_exec_response_instrmnt_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_order_exec_response_instrmnt_leg_exec_grp_comp;
        }
    }

    state parse_order_exec_response_instrmnt_leg_exec_grp_comp {
        packet.extract(hdr.order_exec_response_instrmnt_leg_exec_grp_comp.next);
        meta.order_exec_response_instrmnt_leg_exec_grp_comp_remaining = meta.order_exec_response_instrmnt_leg_exec_grp_comp_remaining - 1;
        transition select(meta.order_exec_response_instrmnt_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_order_exec_response_instrmnt_leg_exec_grp_comp;
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
            8w0: read_quote_execution_report_quote_leg_exec_grp_comp;
            default: parse_quote_execution_report_quote_event_grp_comp;
        }
    }

    state parse_quote_execution_report_quote_event_grp_comp {
        packet.extract(hdr.quote_execution_report_quote_event_grp_comp.next);
        meta.quote_execution_report_quote_event_grp_comp_remaining = meta.quote_execution_report_quote_event_grp_comp_remaining - 1;
        transition select(meta.quote_execution_report_quote_event_grp_comp_remaining) {
            8w0: read_quote_execution_report_quote_leg_exec_grp_comp;
            default: parse_quote_execution_report_quote_event_grp_comp;
        }
    }

    state read_quote_execution_report_quote_leg_exec_grp_comp {
        meta.quote_execution_report_quote_leg_exec_grp_comp_remaining = hdr.quote_execution_report.no_leg_execs;
        transition select(meta.quote_execution_report_quote_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_quote_execution_report_quote_leg_exec_grp_comp;
        }
    }

    state parse_quote_execution_report_quote_leg_exec_grp_comp {
        packet.extract(hdr.quote_execution_report_quote_leg_exec_grp_comp.next);
        meta.quote_execution_report_quote_leg_exec_grp_comp_remaining = meta.quote_execution_report_quote_leg_exec_grp_comp_remaining - 1;
        transition select(meta.quote_execution_report_quote_leg_exec_grp_comp_remaining) {
            16w0: accept;
            default: parse_quote_execution_report_quote_leg_exec_grp_comp;
        }
    }

    state parse_rfq_response {
        packet.extract(hdr.rfq_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject {
        packet.extract(hdr.reject);
        meta.dispatched = 1;
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

    state parse_risk_notification_broadcast {
        packet.extract(hdr.risk_notification_broadcast);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_service_availability_broadcast {
        packet.extract(hdr.service_availability_broadcast);
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
        meta.tes_approve_broadcast_instrument_event_grp_comp_remaining = hdr.tes_approve_broadcast.no_events;
        transition select(meta.tes_approve_broadcast_instrument_event_grp_comp_remaining) {
            8w0: read_tes_approve_broadcast_instrument_attribute_grp_comp;
            default: parse_tes_approve_broadcast_instrument_event_grp_comp;
        }
    }

    state parse_tes_approve_broadcast_instrument_event_grp_comp {
        packet.extract(hdr.tes_approve_broadcast_instrument_event_grp_comp.next);
        meta.tes_approve_broadcast_instrument_event_grp_comp_remaining = meta.tes_approve_broadcast_instrument_event_grp_comp_remaining - 1;
        transition select(meta.tes_approve_broadcast_instrument_event_grp_comp_remaining) {
            8w0: read_tes_approve_broadcast_instrument_attribute_grp_comp;
            default: parse_tes_approve_broadcast_instrument_event_grp_comp;
        }
    }

    state read_tes_approve_broadcast_instrument_attribute_grp_comp {
        meta.tes_approve_broadcast_instrument_attribute_grp_comp_remaining = hdr.tes_approve_broadcast.no_instr_attrib;
        transition select(meta.tes_approve_broadcast_instrument_attribute_grp_comp_remaining) {
            8w0: read_tes_approve_broadcast_underlying_stip_grp_comp;
            default: parse_tes_approve_broadcast_instrument_attribute_grp_comp;
        }
    }

    state parse_tes_approve_broadcast_instrument_attribute_grp_comp {
        packet.extract(hdr.tes_approve_broadcast_instrument_attribute_grp_comp.next);
        meta.tes_approve_broadcast_instrument_attribute_grp_comp_remaining = meta.tes_approve_broadcast_instrument_attribute_grp_comp_remaining - 1;
        transition select(meta.tes_approve_broadcast_instrument_attribute_grp_comp_remaining) {
            8w0: read_tes_approve_broadcast_underlying_stip_grp_comp;
            default: parse_tes_approve_broadcast_instrument_attribute_grp_comp;
        }
    }

    state read_tes_approve_broadcast_underlying_stip_grp_comp {
        meta.tes_approve_broadcast_underlying_stip_grp_comp_remaining = hdr.tes_approve_broadcast.no_underlying_stips;
        transition select(meta.tes_approve_broadcast_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_tes_approve_broadcast_underlying_stip_grp_comp;
        }
    }

    state parse_tes_approve_broadcast_underlying_stip_grp_comp {
        packet.extract(hdr.tes_approve_broadcast_underlying_stip_grp_comp.next);
        meta.tes_approve_broadcast_underlying_stip_grp_comp_remaining = meta.tes_approve_broadcast_underlying_stip_grp_comp_remaining - 1;
        transition select(meta.tes_approve_broadcast_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_tes_approve_broadcast_underlying_stip_grp_comp;
        }
    }

    state parse_tes_broadcast {
        packet.extract(hdr.tes_broadcast);
        meta.dispatched = 1;
        meta.tes_broadcast_side_alloc_grp_bc_comp_remaining = hdr.tes_broadcast.no_side_allocs;
        transition select(meta.tes_broadcast_side_alloc_grp_bc_comp_remaining) {
            8w0: read_tes_broadcast_instrument_event_grp_comp;
            default: parse_tes_broadcast_side_alloc_grp_bc_comp;
        }
    }

    state parse_tes_broadcast_side_alloc_grp_bc_comp {
        packet.extract(hdr.tes_broadcast_side_alloc_grp_bc_comp.next);
        meta.tes_broadcast_side_alloc_grp_bc_comp_remaining = meta.tes_broadcast_side_alloc_grp_bc_comp_remaining - 1;
        transition select(meta.tes_broadcast_side_alloc_grp_bc_comp_remaining) {
            8w0: read_tes_broadcast_instrument_event_grp_comp;
            default: parse_tes_broadcast_side_alloc_grp_bc_comp;
        }
    }

    state read_tes_broadcast_instrument_event_grp_comp {
        meta.tes_broadcast_instrument_event_grp_comp_remaining = hdr.tes_broadcast.no_events;
        transition select(meta.tes_broadcast_instrument_event_grp_comp_remaining) {
            8w0: read_tes_broadcast_instrument_attribute_grp_comp;
            default: parse_tes_broadcast_instrument_event_grp_comp;
        }
    }

    state parse_tes_broadcast_instrument_event_grp_comp {
        packet.extract(hdr.tes_broadcast_instrument_event_grp_comp.next);
        meta.tes_broadcast_instrument_event_grp_comp_remaining = meta.tes_broadcast_instrument_event_grp_comp_remaining - 1;
        transition select(meta.tes_broadcast_instrument_event_grp_comp_remaining) {
            8w0: read_tes_broadcast_instrument_attribute_grp_comp;
            default: parse_tes_broadcast_instrument_event_grp_comp;
        }
    }

    state read_tes_broadcast_instrument_attribute_grp_comp {
        meta.tes_broadcast_instrument_attribute_grp_comp_remaining = hdr.tes_broadcast.no_instr_attrib;
        transition select(meta.tes_broadcast_instrument_attribute_grp_comp_remaining) {
            8w0: read_tes_broadcast_underlying_stip_grp_comp;
            default: parse_tes_broadcast_instrument_attribute_grp_comp;
        }
    }

    state parse_tes_broadcast_instrument_attribute_grp_comp {
        packet.extract(hdr.tes_broadcast_instrument_attribute_grp_comp.next);
        meta.tes_broadcast_instrument_attribute_grp_comp_remaining = meta.tes_broadcast_instrument_attribute_grp_comp_remaining - 1;
        transition select(meta.tes_broadcast_instrument_attribute_grp_comp_remaining) {
            8w0: read_tes_broadcast_underlying_stip_grp_comp;
            default: parse_tes_broadcast_instrument_attribute_grp_comp;
        }
    }

    state read_tes_broadcast_underlying_stip_grp_comp {
        meta.tes_broadcast_underlying_stip_grp_comp_remaining = hdr.tes_broadcast.no_underlying_stips;
        transition select(meta.tes_broadcast_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_tes_broadcast_underlying_stip_grp_comp;
        }
    }

    state parse_tes_broadcast_underlying_stip_grp_comp {
        packet.extract(hdr.tes_broadcast_underlying_stip_grp_comp.next);
        meta.tes_broadcast_underlying_stip_grp_comp_remaining = meta.tes_broadcast_underlying_stip_grp_comp_remaining - 1;
        transition select(meta.tes_broadcast_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_tes_broadcast_underlying_stip_grp_comp;
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

    state parse_tes_upload_broadcast {
        packet.extract(hdr.tes_upload_broadcast);
        meta.dispatched = 1;
        meta.tes_upload_broadcast_side_alloc_ext_grp_comp_remaining = hdr.tes_upload_broadcast.no_side_allocs;
        transition select(meta.tes_upload_broadcast_side_alloc_ext_grp_comp_remaining) {
            8w0: read_tes_upload_broadcast_instrument_event_grp_comp;
            default: parse_tes_upload_broadcast_side_alloc_ext_grp_comp;
        }
    }

    state parse_tes_upload_broadcast_side_alloc_ext_grp_comp {
        packet.extract(hdr.tes_upload_broadcast_side_alloc_ext_grp_comp.next);
        meta.tes_upload_broadcast_side_alloc_ext_grp_comp_remaining = meta.tes_upload_broadcast_side_alloc_ext_grp_comp_remaining - 1;
        transition select(meta.tes_upload_broadcast_side_alloc_ext_grp_comp_remaining) {
            8w0: read_tes_upload_broadcast_instrument_event_grp_comp;
            default: parse_tes_upload_broadcast_side_alloc_ext_grp_comp;
        }
    }

    state read_tes_upload_broadcast_instrument_event_grp_comp {
        meta.tes_upload_broadcast_instrument_event_grp_comp_remaining = hdr.tes_upload_broadcast.no_events;
        transition select(meta.tes_upload_broadcast_instrument_event_grp_comp_remaining) {
            8w0: read_tes_upload_broadcast_instrument_attribute_grp_comp;
            default: parse_tes_upload_broadcast_instrument_event_grp_comp;
        }
    }

    state parse_tes_upload_broadcast_instrument_event_grp_comp {
        packet.extract(hdr.tes_upload_broadcast_instrument_event_grp_comp.next);
        meta.tes_upload_broadcast_instrument_event_grp_comp_remaining = meta.tes_upload_broadcast_instrument_event_grp_comp_remaining - 1;
        transition select(meta.tes_upload_broadcast_instrument_event_grp_comp_remaining) {
            8w0: read_tes_upload_broadcast_instrument_attribute_grp_comp;
            default: parse_tes_upload_broadcast_instrument_event_grp_comp;
        }
    }

    state read_tes_upload_broadcast_instrument_attribute_grp_comp {
        meta.tes_upload_broadcast_instrument_attribute_grp_comp_remaining = hdr.tes_upload_broadcast.no_instr_attrib;
        transition select(meta.tes_upload_broadcast_instrument_attribute_grp_comp_remaining) {
            8w0: read_tes_upload_broadcast_underlying_stip_grp_comp;
            default: parse_tes_upload_broadcast_instrument_attribute_grp_comp;
        }
    }

    state parse_tes_upload_broadcast_instrument_attribute_grp_comp {
        packet.extract(hdr.tes_upload_broadcast_instrument_attribute_grp_comp.next);
        meta.tes_upload_broadcast_instrument_attribute_grp_comp_remaining = meta.tes_upload_broadcast_instrument_attribute_grp_comp_remaining - 1;
        transition select(meta.tes_upload_broadcast_instrument_attribute_grp_comp_remaining) {
            8w0: read_tes_upload_broadcast_underlying_stip_grp_comp;
            default: parse_tes_upload_broadcast_instrument_attribute_grp_comp;
        }
    }

    state read_tes_upload_broadcast_underlying_stip_grp_comp {
        meta.tes_upload_broadcast_underlying_stip_grp_comp_remaining = hdr.tes_upload_broadcast.no_underlying_stips;
        transition select(meta.tes_upload_broadcast_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_tes_upload_broadcast_underlying_stip_grp_comp;
        }
    }

    state parse_tes_upload_broadcast_underlying_stip_grp_comp {
        packet.extract(hdr.tes_upload_broadcast_underlying_stip_grp_comp.next);
        meta.tes_upload_broadcast_underlying_stip_grp_comp_remaining = meta.tes_upload_broadcast_underlying_stip_grp_comp_remaining - 1;
        transition select(meta.tes_upload_broadcast_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_tes_upload_broadcast_underlying_stip_grp_comp;
        }
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

}

control EurexT7EtiServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control EurexT7EtiServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EtiServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.add_complex_instrument_response);
        packet.emit(hdr.add_complex_instrument_response_instrmt_leg_grp_comp);
        packet.emit(hdr.add_flexible_instrument_response);
        packet.emit(hdr.broadcast_error_notification);
        packet.emit(hdr.cross_request_response);
        packet.emit(hdr.delete_all_order_broadcast);
        packet.emit(hdr.delete_all_order_broadcast_not_affected_orders_grp_comp);
        packet.emit(hdr.delete_all_order_nr_response);
        packet.emit(hdr.delete_all_order_quote_event_broadcast);
        packet.emit(hdr.delete_all_order_response);
        packet.emit(hdr.delete_all_order_response_not_affected_orders_grp_comp);
        packet.emit(hdr.delete_all_quote_broadcast);
        packet.emit(hdr.delete_all_quote_broadcast_not_affected_securities_grp_comp);
        packet.emit(hdr.delete_all_quote_response);
        packet.emit(hdr.delete_all_quote_response_not_affected_securities_grp_comp);
        packet.emit(hdr.delete_order_broadcast);
        packet.emit(hdr.delete_order_nr_response);
        packet.emit(hdr.delete_order_response);
        packet.emit(hdr.forced_logout_notification);
        packet.emit(hdr.forced_user_logout_notification);
        packet.emit(hdr.gateway_response);
        packet.emit(hdr.heartbeat_notification);
        packet.emit(hdr.inquire_enrichment_rule_id_list_response);
        packet.emit(hdr.inquire_enrichment_rule_id_list_response_enrichment_rules_grp_comp);
        packet.emit(hdr.inquire_mm_parameter_response);
        packet.emit(hdr.inquire_mm_parameter_response_mm_parameter_grp_comp);
        packet.emit(hdr.inquire_session_list_response);
        packet.emit(hdr.inquire_session_list_response_sessions_grp_comp);
        packet.emit(hdr.inquire_user_response);
        packet.emit(hdr.inquire_user_response_party_details_grp_comp);
        packet.emit(hdr.legal_notification_broadcast);
        packet.emit(hdr.logon_response);
        packet.emit(hdr.logout_response);
        packet.emit(hdr.mm_parameter_definition_response);
        packet.emit(hdr.mass_quote_response);
        packet.emit(hdr.mass_quote_response_quote_entry_ack_grp_comp);
        packet.emit(hdr.modify_order_nr_response);
        packet.emit(hdr.modify_order_response);
        packet.emit(hdr.new_order_nr_response);
        packet.emit(hdr.new_order_response);
        packet.emit(hdr.news_broadcast);
        packet.emit(hdr.order_exec_notification);
        packet.emit(hdr.order_exec_notification_fills_grp_comp);
        packet.emit(hdr.order_exec_notification_instrmnt_leg_exec_grp_comp);
        packet.emit(hdr.order_exec_report_broadcast);
        packet.emit(hdr.order_exec_report_broadcast_leg_ord_grp_comp);
        packet.emit(hdr.order_exec_report_broadcast_fills_grp_comp);
        packet.emit(hdr.order_exec_report_broadcast_instrmnt_leg_exec_grp_comp);
        packet.emit(hdr.order_exec_response);
        packet.emit(hdr.order_exec_response_fills_grp_comp);
        packet.emit(hdr.order_exec_response_instrmnt_leg_exec_grp_comp);
        packet.emit(hdr.party_action_report);
        packet.emit(hdr.party_entitlements_update_report);
        packet.emit(hdr.quote_activation_notification);
        packet.emit(hdr.quote_activation_notification_not_affected_securities_grp_comp);
        packet.emit(hdr.quote_activation_response);
        packet.emit(hdr.quote_activation_response_not_affected_securities_grp_comp);
        packet.emit(hdr.quote_execution_report);
        packet.emit(hdr.quote_execution_report_quote_event_grp_comp);
        packet.emit(hdr.quote_execution_report_quote_leg_exec_grp_comp);
        packet.emit(hdr.rfq_response);
        packet.emit(hdr.reject);
        packet.emit(hdr.retransmit_me_message_response);
        packet.emit(hdr.retransmit_response);
        packet.emit(hdr.risk_notification_broadcast);
        packet.emit(hdr.service_availability_broadcast);
        packet.emit(hdr.subscribe_response);
        packet.emit(hdr.tes_approve_broadcast);
        packet.emit(hdr.tes_approve_broadcast_instrument_event_grp_comp);
        packet.emit(hdr.tes_approve_broadcast_instrument_attribute_grp_comp);
        packet.emit(hdr.tes_approve_broadcast_underlying_stip_grp_comp);
        packet.emit(hdr.tes_broadcast);
        packet.emit(hdr.tes_broadcast_side_alloc_grp_bc_comp);
        packet.emit(hdr.tes_broadcast_instrument_event_grp_comp);
        packet.emit(hdr.tes_broadcast_instrument_attribute_grp_comp);
        packet.emit(hdr.tes_broadcast_underlying_stip_grp_comp);
        packet.emit(hdr.tes_delete_broadcast);
        packet.emit(hdr.tes_execution_broadcast);
        packet.emit(hdr.tes_response);
        packet.emit(hdr.tes_trade_broadcast);
        packet.emit(hdr.tes_trading_session_status_broadcast);
        packet.emit(hdr.tes_upload_broadcast);
        packet.emit(hdr.tes_upload_broadcast_side_alloc_ext_grp_comp);
        packet.emit(hdr.tes_upload_broadcast_instrument_event_grp_comp);
        packet.emit(hdr.tes_upload_broadcast_instrument_attribute_grp_comp);
        packet.emit(hdr.tes_upload_broadcast_underlying_stip_grp_comp);
        packet.emit(hdr.tm_trading_session_status_broadcast);
        packet.emit(hdr.throttle_update_notification);
        packet.emit(hdr.trade_broadcast);
        packet.emit(hdr.trading_session_status_broadcast);
        packet.emit(hdr.unsubscribe_response);
        packet.emit(hdr.user_login_response);
        packet.emit(hdr.user_logout_response);
    }
}

V1Switch(
    EurexT7EtiServerParser(),
    EurexT7EtiServerVerifyChecksum(),
    EurexT7EtiServerIngress(),
    EurexT7EtiServerEgress(),
    EurexT7EtiServerComputeChecksum(),
    EurexT7EtiServerDeparser()
) main;
