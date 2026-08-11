// P4_16 (v1model) definition for: Eurex T7 Eti Fbe v11.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 11.1
//   Date: 02/20/2023
//   Specification: T7_Enhanced_Trading_Interface_-_Derivatives_Message_Reference_v.11.1-D0001
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

header add_complex_instrument_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> security_sub_type;
    bit<8> product_complex;
    bit<8> no_leg_onbooks;
    bit<8> multileg_model;
    bit<160> compliance_text;
    bit<8> pad1;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<32> leg_symbol;
    bit<32> leg_ratio_qty;
    bit<8> leg_side;
    bit<8> leg_security_type;
    bit<48> pad6;
}

header add_complex_instrument_response_t {
    bit<16> pad2;
    bit<64> request_time;
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
    bit<8> no_leg_onbooks;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<32> leg_symbol;
    bit<32> leg_ratio_qty;
    bit<8> leg_side;
    bit<8> leg_security_type;
    bit<48> pad6;
}

header add_flexible_instrument_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> strike_price;
    bit<32> market_segment_id;
    bit<32> maturity_date;
    bit<32> contract_date;
    bit<8> settl_method;
    bit<8> opt_attribute;
    bit<8> put_or_call;
    bit<8> exercise_style;
    bit<160> compliance_text;
    bit<32> pad4;
}

header add_flexible_instrument_response_t {
    bit<16> pad2;
    bit<64> request_time;
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
    bit<32> contract_date;
    bit<8> product_complex;
    bit<8> settl_method;
    bit<8> opt_attribute;
    bit<8> put_or_call;
    bit<8> exercise_style;
    bit<56> pad7;
}

header amend_basket_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> basket_trd_match_id;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<32> maturity_month_year;
    bit<32> basket_profile_id;
    bit<16> trd_type;
    bit<16> no_basket_side_alloc;
    bit<8> trade_report_type;
    bit<8> basket_trade_report_type;
    bit<8> no_basket_root_party_grps;
    bit<8> no_instrmt_match_sides;
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<16> root_party_sub_id_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<160> basket_side_trade_report_id;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<64> clearing_trade_price;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<16> side_trd_sub_typ;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<8> instrmt_match_side_id;
    bit<8> effect_on_basket;
    bit<160> trade_report_text;
    bit<48> pad6;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<16> party_sub_id_type;
    bit<8> side;
    bit<8> instrmt_match_side_id_2;
    bit<8> trade_alloc_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header approve_basket_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> basket_trd_match_id;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<16> root_party_sub_id_type;
    bit<16> no_basket_side_alloc;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<160> basket_side_trade_report_id;
    bit<40> pad5;
    bit<64> alloc_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<32> alloc_id;
    bit<8> side;
    bit<8> position_effect;
    bit<8> trading_capacity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_attribute_risk_reduction;
    bit<8> order_origination;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<16> account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<56> pad7;
}

header approve_reverse_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> alloc_id;
    bit<32> tes_exec_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<160> trade_report_id;
    bit<48> pad6;
}

header approve_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> alloc_qty;
    bit<64> compression_id;
    bit<32> package_id;
    bit<32> alloc_id;
    bit<32> tes_exec_id;
    bit<32> market_segment_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> trading_capacity;
    bit<8> trade_report_type;
    bit<8> side;
    bit<8> order_attribute_liquidity_provision;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> order_attribute_risk_reduction;
    bit<8> order_origination;
    bit<160> trade_report_id;
    bit<8> position_effect;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<16> account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<40> party_id_take_up_trading_firm;
    bit<256> party_id_position_account;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<40> party_end_client_identification;
    bit<24> pad3;
}

header basket_approve_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> basket_trd_match_id;
    bit<64> transact_time;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<32> basket_profile_id;
    bit<16> trd_type;
    bit<16> no_basket_side_alloc;
    bit<8> trade_report_type;
    bit<8> basket_trade_report_type;
    bit<8> message_event_source;
    bit<8> no_basket_root_party_grps;
    bit<8> party_id_entering_firm;
    bit<48> party_entering_trader;
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<40> pad5;
    bit<16> root_party_sub_id_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<160> basket_side_trade_report_id;
    bit<56> pad7_2;
    bit<64> alloc_qty;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<32> alloc_id;
    bit<16> side_trd_sub_typ;
    bit<16> party_sub_id_type;
    bit<8> side;
    bit<8> position_effect;
    bit<8> effect_on_basket;
    bit<8> trading_capacity;
    bit<8> trade_alloc_status;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<16> account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<32> pad4;
}

header basket_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> basket_trd_match_id;
    bit<64> transact_time;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<32> maturity_month_year;
    bit<32> basket_profile_id;
    bit<16> no_basket_side_alloc;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> basket_trade_report_type;
    bit<8> message_event_source;
    bit<8> no_basket_root_party_grps_bc;
    bit<8> no_instrmt_match_sides;
    bit<8> basket_anonymity;
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<48> pad6;
    bit<16> root_party_sub_id_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<160> basket_side_trade_report_id;
    bit<56> pad7_2;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<64> clearing_trade_price;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<16> side_trd_sub_typ;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<8> instrmt_match_side_id;
    bit<8> effect_on_basket;
    bit<160> trade_report_text;
    bit<48> pad6_2;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<16> party_sub_id_type;
    bit<8> side;
    bit<8> instrmt_match_side_id_2;
    bit<8> trade_alloc_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header basket_delete_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> basket_trd_match_id;
    bit<64> transact_time;
    bit<32> market_segment_id;
    bit<32> basket_exec_id;
    bit<32> basket_profile_id;
    bit<16> trd_type;
    bit<8> delete_reason;
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<32> pad4;
}

header basket_execution_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> basket_trd_match_id;
    bit<64> transact_time;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<32> basket_profile_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> no_instrmt_match_sides;
    bit<8> message_event_source;
    bit<160> basket_side_trade_report_id;
    bit<24> pad3;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<32> alloc_id;
    bit<16> side_trd_sub_typ;
    bit<16> pad2_2;
}

header basket_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<32> basket_exec_id;
    bit<160> trade_report_id;
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

header clip_deletion_notification_t {
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
    bit<64> exec_id;
    bit<64> security_id;
    bit<64> cxl_qty;
    bit<32> market_segment_id;
    bit<16> exec_restatement_reason;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<48> pad6;
}

header clip_execution_notification_t {
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
    bit<64> exec_id;
    bit<64> security_id;
    bit<64> cxl_qty;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<32> market_segment_id;
    bit<16> exec_restatement_reason;
    bit<16> no_leg_execs;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> match_type;
    bit<8> no_fills;
    bit<16> pad2v2;
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7_2;
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<16> pad2_2;
}

header clip_response_t {
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
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> cross_request_id;
    bit<8> no_sides;
    bit<8> implied_check_price_indicator;
    bit<48> pad6;
    bit<64> order_id;
    bit<8> input_source;
    bit<8> side;
    bit<48> pad6_2;
}

header cross_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> order_qty;
    bit<32> market_segment_id;
    bit<160> compliance_text;
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
    bit<16> no_affected_order_requests;
    bit<8> party_id_entering_firm;
    bit<8> mass_action_reason;
    bit<8> exec_inst;
    bit<8> side;
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
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

header delete_all_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> target_party_id_executing_trader;
    bit<8> side;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
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
    bit<16> no_affected_order_requests;
    bit<32> pad4;
    bit<64> not_affected_order_id;
    bit<64> not_aff_orig_cl_ord_id;
    bit<32> affected_order_request_id;
    bit<32> pad4_2;
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
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<48> pad6;
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
    bit<64> not_affected_security_id;
}

header delete_basket_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> basket_trd_match_id;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<160> trade_report_id;
    bit<8> pad1;
}

header delete_clip_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> security_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> cross_request_id;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<48> pad6;
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
    bit<32> market_segment_id;
    bit<32> party_id_entering_trader;
    bit<32> party_id_session_id;
    bit<16> exec_restatement_reason;
    bit<8> party_id_entering_firm;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> product_complex;
    bit<8> side;
    bit<160> fix_cl_ord_id;
    bit<8> pad1;
}

header delete_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> fix_cl_ord_id;
    bit<160> compliance_text;
    bit<40> pad5;
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
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> product_complex;
    bit<8> transaction_delay_indicator;
    bit<16> pad2v2;
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
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> product_complex;
    bit<8> transaction_delay_indicator;
    bit<16> pad2v2;
}

header delete_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> simple_security_id;
    bit<32> target_party_id_session_id;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> fix_cl_ord_id;
    bit<160> compliance_text;
    bit<8> pad1;
}

header delete_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> compression_id;
    bit<32> package_id;
    bit<32> market_segment_id;
    bit<32> tes_exec_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<160> trade_report_id;
    bit<8> pad1;
}

header enter_basket_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> maturity_month_year;
    bit<32> basket_profile_id;
    bit<16> trd_type;
    bit<16> no_basket_side_alloc;
    bit<8> trade_report_type;
    bit<8> basket_trade_report_type;
    bit<8> no_basket_root_party_grps;
    bit<8> no_instrmt_match_sides;
    bit<8> basket_anonymity;
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<24> pad3;
    bit<16> root_party_sub_id_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<160> basket_side_trade_report_id;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<64> clearing_trade_price;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<16> side_trd_sub_typ;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<8> instrmt_match_side_id;
    bit<8> effect_on_basket;
    bit<160> trade_report_text;
    bit<48> pad6;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<16> party_sub_id_type;
    bit<8> side;
    bit<8> instrmt_match_side_id_2;
    bit<8> trade_alloc_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header enter_clip_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> order_qty;
    bit<32> market_segment_id;
    bit<32> cross_id;
    bit<32> cross_request_id;
    bit<8> no_sides;
    bit<8> no_cross_legs;
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> order_qty_disclosure_instruction;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<32> pad4;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> maximum_price;
    bit<8> input_source;
    bit<8> side;
    bit<8> trading_capacity;
    bit<8> executing_trader_qualifier;
    bit<8> order_attribute_liquidity_provision;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> position_effect;
    bit<8> cust_order_handling_inst;
    bit<16> account;
    bit<256> party_id_position_account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<40> party_id_take_up_trading_firm;
    bit<160> side_compliance_text;
    bit<16> party_id_location_id;
    bit<56> pad7;
    bit<8> leg_input_source;
    bit<8> leg_position_effect;
    bit<16> leg_account;
    bit<32> pad4_2;
}

header enter_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> underlying_px;
    bit<64> related_close_price;
    bit<64> related_trade_quantity;
    bit<64> underlying_qty;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> product_complex;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<8> no_events;
    bit<8> no_legs;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> party_id_settlement_location;
    bit<8> hedge_type;
    bit<8> swap_clearer;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<32> pad4;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4_2;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<64> leg_qty;
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1;
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
    bit<32> username;
    bit<16> var_text_len;
    bit<8> user_status;
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

header inquire_mm_parameter_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
}

header inquire_mm_parameter_response_t {
    bit<16> pad2;
    bit<64> request_time;
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
    bit<64> exposure_duration;
    bit<64> cum_qty;
    bit<64> delta;
    bit<64> vega;
    bit<32> pct_count;
    bit<32> target_party_id_session_id;
}

header inquire_margin_based_risk_limit_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<16> partition_id;
    bit<40> party_detail_executing_unit;
    bit<8> pad1;
}

header inquire_margin_based_risk_limit_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<64> margin_based_risk_limit_long;
    bit<64> margin_based_risk_limit_short;
}

header inquire_pre_trade_risk_limits_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<8> risk_limit_platform;
    bit<40> party_executing_unit;
    bit<24> risk_limit_group;
    bit<24> pad3;
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

header logon_request_encrypted_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> heart_bt_int;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<2048> encrypted_password_chunk0;
    bit<2048> encrypted_password_chunk1;
    bit<1376> encrypted_password_chunk2;
    bit<8> appl_usage_orders;
    bit<8> appl_usage_quotes;
    bit<8> order_routing_indicator;
    bit<240> fix_engine_name;
    bit<240> fix_engine_version;
    bit<240> fix_engine_vendor;
    bit<240> application_system_name;
    bit<240> application_system_version;
    bit<240> application_system_vendor;
    bit<56> pad7;
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
    bit<2048> public_key_chunk0;
    bit<2048> public_key_chunk1;
    bit<2048> public_key_chunk2;
    bit<368> public_key_chunk3;
    bit<48> pad6;
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

header mm_parameter_definition_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> exposure_duration;
    bit<64> cum_qty;
    bit<64> delta;
    bit<64> vega;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> pct_count;
    bit<32> pad4;
}

header mm_parameter_definition_response_t {
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

header mass_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> quote_size_type;
    bit<8> quote_type;
    bit<8> order_attribute_liquidity_provision;
    bit<8> no_quote_entries;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<48> pad6;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
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
    bit<64> security_id;
    bit<64> cxl_size;
    bit<32> quote_entry_reject_reason;
    bit<8> quote_entry_status;
    bit<8> side;
    bit<16> pad2_2;
}

header modify_basket_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> basket_trd_match_id;
    bit<32> basket_exec_id;
    bit<32> market_segment_id;
    bit<32> maturity_month_year;
    bit<32> basket_profile_id;
    bit<16> trd_type;
    bit<16> no_basket_side_alloc;
    bit<8> trade_report_type;
    bit<8> no_basket_root_party_grps;
    bit<8> no_instrmt_match_sides;
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<8> pad1;
    bit<16> root_party_sub_id_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<160> basket_side_trade_report_id;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<64> clearing_trade_price;
    bit<32> package_id;
    bit<32> side_market_segment_id;
    bit<16> side_trd_sub_typ;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<8> instrmt_match_side_id;
    bit<8> effect_on_basket;
    bit<160> trade_report_text;
    bit<48> pad6;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<16> party_sub_id_type;
    bit<8> side;
    bit<8> instrmt_match_side_id_2;
    bit<8> trade_alloc_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header modify_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> expire_date;
    bit<32> match_inst_cross_id;
    bit<32> target_party_id_session_id;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> appl_seq_indicator;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> trading_capacity;
    bit<8> ownership_indicator;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<256> party_id_position_account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<160> fix_cl_ord_id;
    bit<40> party_end_client_identification;
    bit<8> no_leg_onbooks;
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5;
}

header modify_order_complex_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> appl_seq_indicator;
    bit<8> product_complex;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> compliance_text;
    bit<48> pad6;
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
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> product_complex;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> no_order_events;
    bit<56> pad7;
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3_2;
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
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<64> trd_reg_ts_time_priority;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> product_complex;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> no_order_events;
    bit<56> pad7;
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header modify_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> stop_px;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> simple_security_id;
    bit<32> match_inst_cross_id;
    bit<32> target_party_id_session_id;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<16> account;
    bit<256> party_id_position_account;
    bit<8> position_effect;
    bit<8> ownership_indicator;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<160> fix_cl_ord_id;
    bit<40> party_end_client_identification;
    bit<16> pad2v2;
}

header modify_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> simple_security_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> appl_seq_indicator;
    bit<8> exec_inst;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> compliance_text;
    bit<56> pad7;
}

header modify_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> compression_id;
    bit<64> related_close_price;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<8> no_legs;
    bit<8> swap_clearer;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<8> pad1;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<64> leg_qty;
}

header new_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> expire_date;
    bit<32> match_inst_cross_id;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> appl_seq_indicator;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> order_attribute_risk_reduction;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<16> party_id_location_id;
    bit<160> compliance_text;
    bit<8> cust_order_handling_inst;
    bit<256> party_id_position_account;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<160> fix_cl_ord_id;
    bit<40> party_end_client_identification;
    bit<8> no_leg_onbooks;
    bit<32> pad4;
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5;
}

header new_order_complex_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> appl_seq_indicator;
    bit<8> product_complex;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> compliance_text;
    bit<48> pad6;
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
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> product_complex;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> no_order_events;
    bit<56> pad7;
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3_2;
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
    bit<8> ord_status;
    bit<8> exec_type;
    bit<16> exec_restatement_reason;
    bit<8> crossed_indicator;
    bit<8> product_complex;
    bit<8> triggered;
    bit<8> transaction_delay_indicator;
    bit<8> no_order_events;
    bit<56> pad7;
    bit<64> order_event_px;
    bit<64> order_event_qty;
    bit<32> order_event_match_id;
    bit<8> order_event_reason;
    bit<24> pad3;
}

header new_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> stop_px;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> simple_security_id;
    bit<32> match_inst_cross_id;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> order_attribute_risk_reduction;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<16> account;
    bit<256> party_id_position_account;
    bit<8> position_effect;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> compliance_text;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<160> fix_cl_ord_id;
    bit<40> party_end_client_identification;
    bit<48> pad6;
}

header new_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> order_qty;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> simple_security_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> side;
    bit<8> appl_seq_indicator;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> compliance_text;
    bit<56> pad7;
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
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> cxl_qty;
    bit<32> market_segment_id;
    bit<16> no_leg_execs;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> product_complex;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> triggered;
    bit<8> crossed_indicator;
    bit<160> fix_cl_ord_id;
    bit<8> no_fills;
    bit<8> no_order_events;
    bit<32> pad4;
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7_2;
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<16> pad2_2;
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
    bit<64> stop_px;
    bit<32> market_segment_id;
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
    bit<160> fix_cl_ord_id;
    bit<8> no_fills;
    bit<8> no_leg_onbooks;
    bit<8> no_order_events;
    bit<8> triggered;
    bit<8> crossed_indicator;
    bit<8> pad1;
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5;
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7_2;
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<16> pad2_2;
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
    bit<32> market_segment_id;
    bit<16> no_leg_execs;
    bit<16> exec_restatement_reason;
    bit<8> side;
    bit<8> product_complex;
    bit<8> ord_status;
    bit<8> exec_type;
    bit<8> triggered;
    bit<8> crossed_indicator;
    bit<8> transaction_delay_indicator;
    bit<8> no_fills;
    bit<8> no_order_events;
    bit<56> pad7;
    bit<64> fill_px;
    bit<64> fill_qty;
    bit<32> fill_match_id;
    bit<32> fill_exec_id;
    bit<8> fill_liquidity_ind;
    bit<56> pad7_2;
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> fill_ref_id;
    bit<16> pad2_2;
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

header ping_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<16> partition_id;
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
    bit<8> risk_limit_platform;
    bit<40> party_detail_executing_unit;
    bit<32> pad4;
    bit<64> risk_limit_qty;
    bit<64> risk_limit_open_qty;
    bit<64> risk_limit_net_position_qty;
    bit<64> netting_coefficient;
    bit<64> quote_weighting_coefficient;
    bit<32> activation_date;
    bit<8> risk_limit_type;
    bit<8> risk_limit_requesting_party_role;
    bit<8> risk_limit_violation_indicator;
    bit<24> risk_limit_group;
    bit<48> pad6;
}

header pre_trade_risk_limits_definition_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> netting_coefficient;
    bit<64> quote_weighting_coefficient;
    bit<32> market_segment_id;
    bit<8> risk_limit_platform;
    bit<8> no_risk_limits_qty;
    bit<8> party_detail_status;
    bit<24> risk_limit_group;
    bit<40> party_detail_executing_unit;
    bit<8> pad1;
    bit<64> risk_limit_qty;
    bit<8> risk_limit_type;
    bit<56> pad7;
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
    bit<8> mass_action_sub_type;
    bit<8> mass_action_reason;
    bit<16> pad2v2;
    bit<64> not_affected_security_id;
}

header quote_activation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> mass_action_type;
    bit<8> mass_action_sub_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<32> pad4;
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
    bit<64> security_id;
    bit<64> quote_event_px;
    bit<64> quote_event_qty;
    bit<64> quote_msg_id;
    bit<32> quote_event_match_id;
    bit<32> quote_event_exec_id;
    bit<8> quote_event_type;
    bit<8> quote_event_side;
    bit<8> quote_event_liquidity_ind;
    bit<8> quote_event_reason;
    bit<32> pad4;
    bit<64> leg_security_id;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_exec_id;
    bit<8> leg_side;
    bit<8> no_quote_events_index;
    bit<16> pad2_2;
}

header rfq_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> order_qty;
    bit<32> market_segment_id;
    bit<8> side;
    bit<160> compliance_text;
    bit<56> pad7;
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

header reverse_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<160> trade_report_id;
    bit<1056> reversal_reason_text;
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
    bit<8> inventory_check_type;
    bit<8> list_update_action;
    bit<8> risk_limit_action;
    bit<72> requesting_party_entering_firm;
    bit<72> requesting_party_clearing_firm;
    bit<40> pad5;
}

header srqs_create_deal_notification_t {
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
    bit<64> security_id;
    bit<64> expire_time;
    bit<64> underlying_px;
    bit<64> underlying_delta_percentage;
    bit<64> underlying_effective_delta_percentage;
    bit<64> underlying_qty;
    bit<64> underlying_price_stip_value;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<8> trd_rpt_status;
    bit<8> trade_report_type;
    bit<8> message_event_source;
    bit<8> side;
    bit<8> no_order_book_items;
    bit<8> trading_capacity;
    bit<8> trade_publish_indicator;
    bit<8> hedging_instruction;
    bit<8> no_srqs_target_party_trd_grps;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<48> root_party_entering_trader;
    bit<160> firm_trade_id;
    bit<160> firm_negotiation_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<1056> free_text_5;
    bit<8> position_effect;
    bit<16> account;
    bit<72> party_id_beneficiary;
    bit<8> cust_order_handling_inst;
    bit<56> party_id_order_origination_firm;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<160> compliance_text;
    bit<40> party_id_take_up_trading_firm;
    bit<24> pad3;
    bit<64> security_id_2;
    bit<64> best_bid_px;
    bit<64> best_bid_size;
    bit<64> best_offer_px;
    bit<64> best_offer_size;
    bit<8> md_book_type;
    bit<8> md_sub_book_type;
    bit<48> pad6;
    bit<64> side_last_qty;
    bit<64> quote_id;
    bit<32> target_party_id_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<48> target_party_entering_trader;
    bit<24> pad3_2;
}

header srqs_deal_notification_t {
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
    bit<64> underlying_price_stip_value;
    bit<64> underlying_px;
    bit<64> last_px;
    bit<64> last_qty;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<16> requesting_party_sub_id_type;
    bit<8> trd_rpt_status;
    bit<8> trade_request_result;
    bit<8> message_event_source;
    bit<8> trading_capacity;
    bit<8> no_srqs_target_party_trd_grps;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<48> root_party_entering_trader;
    bit<160> firm_trade_id;
    bit<160> firm_negotiation_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<1056> free_text_5;
    bit<8> position_effect;
    bit<16> account;
    bit<72> party_id_beneficiary;
    bit<8> cust_order_handling_inst;
    bit<56> party_id_order_origination_firm;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<160> compliance_text;
    bit<40> party_id_take_up_trading_firm;
    bit<8> pad1;
    bit<64> side_last_qty;
    bit<64> quote_id;
    bit<32> target_party_id_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<48> target_party_entering_trader;
    bit<24> pad3;
}

header srqs_deal_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> security_id;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<32> secondary_trade_id;
    bit<8> no_srqs_quote_grps;
    bit<160> firm_trade_id;
    bit<160> firm_negotiation_id;
    bit<24> pad3;
    bit<64> quote_id;
}

header srqs_enter_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> underlying_delta_percentage;
    bit<64> bid_size;
    bit<64> offer_size;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> quote_ref_price;
    bit<64> valid_until_time;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> trading_capacity;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<1056> free_text_5;
    bit<8> position_effect;
    bit<16> account;
    bit<72> party_id_beneficiary;
    bit<8> cust_order_handling_inst;
    bit<56> party_id_order_origination_firm;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<160> compliance_text;
    bit<40> party_id_take_up_trading_firm;
    bit<16> pad2v2;
}

header srqs_hit_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> valid_until_time;
    bit<64> underlying_qty;
    bit<64> underlying_price_stip_value;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> trading_capacity;
    bit<8> trade_publish_indicator;
    bit<8> order_origination;
    bit<8> hedging_instruction;
    bit<8> no_srqs_quote_grps;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<160> firm_trade_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<1056> free_text_5;
    bit<8> position_effect;
    bit<16> account;
    bit<72> party_id_beneficiary;
    bit<8> cust_order_handling_inst;
    bit<56> party_id_order_origination_firm;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<160> compliance_text;
    bit<40> party_id_take_up_trading_firm;
    bit<40> party_end_client_identification;
    bit<40> pad5;
    bit<64> order_qty;
    bit<64> quote_id;
    bit<8> side;
    bit<56> pad7;
}

header srqs_inquire_smart_respondent_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<8> eurex_volume_ranking;
    bit<8> enlight_rfq_avg_resp_time_ranking;
    bit<8> enlight_rfq_avg_resp_rate_ranking;
    bit<8> trade_to_quote_ratio_ranking;
}

header srqs_inquire_smart_respondent_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<32> market_segment_id;
    bit<16> no_party_details;
    bit<16> pad2v2;
    bit<40> party_detail_executing_unit;
    bit<48> party_detail_executing_trader;
    bit<40> pad5;
}

header srqs_negotiation_notification_t {
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
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> last_px;
    bit<64> leaves_qty;
    bit<64> last_qty;
    bit<64> effective_time;
    bit<64> last_update_time;
    bit<64> trade_to_quote_ratio;
    bit<32> negotiation_id;
    bit<32> number_of_respondents;
    bit<16> trade_to_quote_ratio_position;
    bit<8> quote_type;
    bit<8> quote_sub_type;
    bit<8> quote_instruction;
    bit<8> side;
    bit<8> trade_aggregation_trans_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<160> firm_negotiation_id;
    bit<1056> free_text_5;
    bit<1056> party_order_origination_trader;
    bit<1056> charge_id;
    bit<32> pad4;
}

header srqs_negotiation_requester_notification_t {
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
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<64> last_px;
    bit<64> leaves_qty;
    bit<64> last_qty;
    bit<64> effective_time;
    bit<64> last_update_time;
    bit<64> trade_to_request_ratio;
    bit<32> negotiation_id;
    bit<32> number_of_respondents;
    bit<8> quote_type;
    bit<8> quote_sub_type;
    bit<8> respondent_type;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> show_last_deal_on_closure;
    bit<8> trade_aggregation_trans_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<160> firm_negotiation_id;
    bit<1056> free_text_5;
    bit<1056> party_order_origination_trader;
    bit<1056> charge_id;
    bit<48> pad6;
    bit<32> target_party_id_executing_trader;
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> free_text_5_disclosure_instruction;
    bit<8> party_order_origination_disclosure_instruction;
    bit<8> quote_instruction;
    bit<8> charge_id_disclosure_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> party_detail_status;
    bit<8> party_detail_status_information;
    bit<48> pad6_2;
}

header srqs_negotiation_status_notification_t {
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
    bit<64> effective_time;
    bit<32> negotiation_id;
    bit<8> quote_condition;
    bit<160> firm_negotiation_id;
    bit<56> pad7_2;
}

header srqs_open_negotiation_notification_t {
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
    bit<64> last_qty;
    bit<64> last_px;
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<64> expire_time;
    bit<64> trade_to_request_ratio;
    bit<64> trade_to_quote_ratio;
    bit<32> negotiation_id;
    bit<32> market_segment_id;
    bit<32> security_sub_type;
    bit<32> number_of_respondents;
    bit<16> trade_to_quote_ratio_position;
    bit<8> quote_type;
    bit<8> quote_sub_type;
    bit<8> no_legs;
    bit<8> side;
    bit<8> product_complex;
    bit<8> respondent_type;
    bit<8> trade_aggregation_trans_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<160> firm_negotiation_id;
    bit<1056> free_text_5;
    bit<1056> party_order_origination_trader;
    bit<1056> charge_id;
    bit<16> pad2v2;
    bit<64> leg_security_id;
    bit<32> leg_ratio_qty;
    bit<32> leg_symbol;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<48> pad6;
}

header srqs_open_negotiation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<64> valid_until_time;
    bit<32> market_segment_id;
    bit<32> security_sub_type;
    bit<8> quote_type;
    bit<8> quote_sub_type;
    bit<8> no_legs;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> product_complex;
    bit<8> respondent_type;
    bit<8> show_last_deal_on_closure;
    bit<8> bid_px_is_locked;
    bit<8> offer_px_is_locked;
    bit<8> side_is_locked;
    bit<8> order_qty_is_locked;
    bit<8> trade_aggregation_trans_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
    bit<160> quote_req_id;
    bit<1056> party_order_origination_trader;
    bit<1056> charge_id;
    bit<48> pad6;
    bit<64> leg_security_id;
    bit<32> leg_ratio_qty;
    bit<32> leg_symbol;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<48> pad6_2;
    bit<32> target_party_id_executing_trader;
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> free_text_5_disclosure_instruction;
    bit<8> party_order_origination_disclosure_instruction;
    bit<8> quote_instruction;
    bit<8> charge_id_disclosure_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> party_detail_status;
    bit<8> party_detail_status_information;
    bit<48> pad6_3;
}

header srqs_open_negotiation_requester_notification_t {
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
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<64> expire_time;
    bit<64> trade_to_request_ratio;
    bit<32> negotiation_id;
    bit<32> market_segment_id;
    bit<32> security_sub_type;
    bit<32> number_of_respondents;
    bit<8> quote_type;
    bit<8> quote_sub_type;
    bit<8> no_legs;
    bit<8> no_target_party_i_ds;
    bit<8> side;
    bit<8> product_complex;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> respondent_type;
    bit<8> show_last_deal_on_closure;
    bit<8> bid_px_is_locked;
    bit<8> offer_px_is_locked;
    bit<8> side_is_locked;
    bit<8> order_qty_is_locked;
    bit<8> trade_aggregation_trans_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<160> firm_negotiation_id;
    bit<1056> free_text_5;
    bit<1056> party_order_origination_trader;
    bit<1056> charge_id;
    bit<64> leg_security_id;
    bit<32> leg_ratio_qty;
    bit<32> leg_symbol;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<48> pad6;
    bit<32> target_party_id_executing_trader;
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> free_text_5_disclosure_instruction;
    bit<8> party_order_origination_disclosure_instruction;
    bit<8> quote_instruction;
    bit<8> charge_id_disclosure_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> party_detail_status;
    bit<8> party_detail_status_information;
    bit<48> pad6_2;
}

header srqs_quote_notification_t {
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
    bit<64> underlying_delta_percentage;
    bit<64> quote_ref_price;
    bit<64> expire_time;
    bit<32> negotiation_id;
    bit<8> quoting_status;
    bit<8> trading_capacity;
    bit<8> quote_cancel_reason;
    bit<8> pad1;
    bit<32> party_id_executing_trader;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<160> quote_req_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<96> free_text_3;
    bit<1056> free_text_5;
    bit<8> position_effect;
    bit<16> account;
    bit<72> party_id_beneficiary;
    bit<8> cust_order_handling_inst;
    bit<56> party_id_order_origination_firm;
    bit<256> party_id_position_account;
    bit<16> party_id_location_id;
    bit<160> compliance_text;
    bit<40> party_id_take_up_trading_firm;
}

header srqs_quote_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> quote_id;
    bit<32> negotiation_id;
    bit<160> quote_req_id;
}

header srqs_quote_snapshot_notification_t {
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
    bit<64> transact_time;
    bit<64> expire_time;
    bit<64> quote_id;
    bit<64> secondary_quote_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<64> underlying_px;
    bit<64> underlying_delta_percentage;
    bit<64> quote_ref_price;
    bit<32> party_id_executing_trader;
    bit<32> negotiation_id;
    bit<8> quoting_status;
    bit<160> firm_negotiation_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> party_entering_trader;
    bit<16> pad2_2;
}

header srqs_quote_snapshot_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header srqs_quoting_status_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> quoting_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
}

header srqs_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
}

header srqs_status_broadcast_t {
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

header srqs_update_deal_status_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> underlying_price_stip_value;
    bit<64> underlying_px;
    bit<64> last_qty;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
    bit<24> pad3;
}

header srqs_update_negotiation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> show_last_deal_on_closure;
    bit<8> quote_type;
    bit<8> quote_sub_type;
    bit<8> respondent_type;
    bit<8> trade_aggregation_trans_type;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
    bit<1056> party_order_origination_trader;
    bit<1056> charge_id;
    bit<32> target_party_id_executing_trader;
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> free_text_5_disclosure_instruction;
    bit<8> party_order_origination_disclosure_instruction;
    bit<8> quote_instruction;
    bit<8> charge_id_disclosure_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> party_detail_status;
    bit<8> party_detail_status_information;
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
    bit<64> underlying_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<64> related_trade_quantity;
    bit<64> underlying_qty;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> alloc_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> negotiation_id;
    bit<32> tes_enrichment_rule_id;
    bit<32> auto_approval_rule_id;
    bit<16> trd_type;
    bit<16> var_text_len;
    bit<8> side;
    bit<8> trade_publish_indicator;
    bit<8> product_complex;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<8> trading_capacity;
    bit<8> party_id_settlement_location;
    bit<8> trade_alloc_status;
    bit<8> hedge_type;
    bit<8> no_legs;
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
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<64> leg_qty;
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3_2;
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7_2;
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
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
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
    bit<64> related_trade_quantity;
    bit<64> underlying_qty;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> auto_approval_rule_id;
    bit<16> trd_type;
    bit<16> var_text_len;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<8> product_complex;
    bit<8> trade_publish_indicator;
    bit<8> no_events;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> no_side_allocs;
    bit<8> no_legs;
    bit<8> no_leg_clearing_prices;
    bit<8> party_id_settlement_location;
    bit<8> hedge_type;
    bit<8> swap_clearer;
    bit<8> message_event_source;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<64> alloc_qty;
    bit<64> reversal_approval_time;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<24> pad3;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<64> leg_qty;
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3_2;
    bit<64> leg_security_id_2;
    bit<64> leg_clearing_trade_price;
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7_2;
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
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

header tes_compression_run_status_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<8> compression_action;
    bit<8> compression_status;
    bit<8> trade_publish_indicator;
    bit<8> pad1;
}

header tes_compression_run_status_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<8> compression_action;
    bit<8> trade_publish_indicator;
    bit<16> pad2v2;
}

header tes_compression_run_status_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<32> pad4;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<8> compression_action;
    bit<8> compression_status;
    bit<8> trade_publish_indicator;
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
    bit<64> compression_id;
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
    bit<64> compression_id;
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

header tes_reversal_broadcast_t {
    bit<16> pad2;
    bit<64> sending_time;
    bit<64> appl_seq_num;
    bit<32> appl_sub_id;
    bit<16> partition_id;
    bit<8> appl_resend_flag;
    bit<8> appl_id;
    bit<8> last_fragment;
    bit<56> pad7;
    bit<64> reversal_initiation_time;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> trd_rpt_status;
    bit<8> reversal_cancellation_reason;
    bit<8> no_side_allocs;
    bit<160> trade_report_id;
    bit<1056> reversal_reason_text;
    bit<24> pad3;
    bit<64> alloc_qty;
    bit<64> reversal_approval_time;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<24> pad3_2;
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
    bit<64> clearing_trade_price;
    bit<64> clearing_trade_qty;
    bit<64> transact_time;
    bit<64> related_security_id;
    bit<64> compression_id;
    bit<64> root_party_id_client_id;
    bit<64> executing_trader;
    bit<64> root_party_id_investment_decision_maker;
    bit<64> basket_trd_match_id;
    bit<64> side_last_px;
    bit<64> side_last_qty;
    bit<64> related_close_price;
    bit<32> package_id;
    bit<32> market_segment_id;
    bit<32> trade_id;
    bit<32> trade_date;
    bit<32> side_trade_id;
    bit<32> root_party_id_session_id;
    bit<32> orig_trade_id;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_clearing_unit;
    bit<32> strategy_link_id;
    bit<32> related_symbol;
    bit<32> tot_num_trade_reports;
    bit<32> negotiation_id;
    bit<32> srqs_related_trade_id;
    bit<32> basket_profile_id;
    bit<32> security_sub_type;
    bit<16> trd_type;
    bit<8> product_complex;
    bit<8> related_product_complex;
    bit<8> side;
    bit<8> trading_capacity;
    bit<8> trade_report_type;
    bit<8> transfer_reason;
    bit<8> trade_publish_indicator;
    bit<8> multi_leg_reporting_type;
    bit<8> position_effect;
    bit<8> multileg_price_model;
    bit<8> order_attribute_liquidity_provision;
    bit<8> order_attribute_risk_reduction;
    bit<8> executing_trader_qualifier;
    bit<8> root_party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<8> reversal_indicator;
    bit<8> trade_aggregation_trans_type;
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
    bit<32> root_party_id_execution_venue;
    bit<416> regulatory_trade_id;
    bit<40> basket_party_contra_firm;
    bit<160> basket_side_trade_report_id;
    bit<120> fee_idnt_code;
    bit<8> pad1;
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
    bit<64> related_close_price;
    bit<64> related_trade_quantity;
    bit<64> underlying_qty;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> product_complex;
    bit<8> trade_report_type;
    bit<8> trd_rpt_status;
    bit<8> trade_publish_indicator;
    bit<8> trade_platform;
    bit<8> no_side_allocs;
    bit<8> no_legs;
    bit<8> no_events;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> hedge_type;
    bit<8> party_id_settlement_location;
    bit<8> swap_clearer;
    bit<8> message_event_source;
    bit<160> trade_report_id;
    bit<40> root_party_executing_firm;
    bit<48> root_party_executing_trader;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<16> pad2v2;
    bit<64> alloc_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> individual_alloc_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> pad1;
    bit<32> tes_enrichment_rule_id;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<8> trading_capacity;
    bit<8> position_effect;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_attribute_risk_reduction;
    bit<8> order_origination;
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
    bit<8> pad1v1;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<64> leg_qty;
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7_2;
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1_2;
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
    bit<64> last_qty;
    bit<64> side_last_px;
    bit<64> side_last_qty;
    bit<64> clearing_trade_price;
    bit<64> clearing_trade_qty;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<64> root_party_id_client_id;
    bit<64> executing_trader;
    bit<64> root_party_id_investment_decision_maker;
    bit<64> underlying_px;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<32> root_party_id_executing_unit;
    bit<32> root_party_id_session_id;
    bit<32> root_party_id_executing_trader;
    bit<32> root_party_id_clearing_unit;
    bit<32> market_segment_id;
    bit<32> related_symbol;
    bit<32> side_trade_id;
    bit<32> match_date;
    bit<32> trd_match_id;
    bit<32> strategy_link_id;
    bit<32> tot_num_trade_reports;
    bit<32> security_sub_type;
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
    bit<8> order_origination;
    bit<8> order_attribute_liquidity_provision;
    bit<8> order_attribute_risk_reduction;
    bit<8> executing_trader_qualifier;
    bit<8> root_party_id_investment_decision_maker_qualifier;
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
    bit<416> regulatory_trade_id;
    bit<32> root_party_id_execution_venue;
    bit<120> fee_idnt_code;
    bit<56> pad7_2;
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

header update_remaining_risk_allowance_base_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<16> partition_id;
    bit<16> no_party_risk_limits;
    bit<32> pad4;
    bit<64> remaining_risk_allowance_base_long;
    bit<64> remaining_risk_allowance_base_short;
    bit<32> risk_limit_id;
    bit<40> party_detail_executing_unit;
    bit<56> pad7;
}

header update_remaining_risk_allowance_base_response_t {
    bit<16> pad2;
    bit<64> request_time;
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_time_out;
    bit<64> response_in;
    bit<64> sending_time;
    bit<32> msg_seq_num;
    bit<8> last_fragment;
    bit<24> pad3;
    bit<16> no_party_risk_limits;
    bit<48> pad6;
    bit<40> party_detail_executing_unit;
    bit<8> pad1;
    bit<16> risk_limit_result;
}

header upload_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> underlying_px;
    bit<64> related_close_price;
    bit<64> related_trade_quantity;
    bit<64> underlying_qty;
    bit<64> compression_id;
    bit<32> market_segment_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> product_complex;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<8> no_legs;
    bit<8> no_events;
    bit<8> no_instr_attrib;
    bit<8> no_underlying_stips;
    bit<8> skip_validations;
    bit<8> trd_rpt_status;
    bit<8> trade_platform;
    bit<8> hedge_type;
    bit<8> party_id_settlement_location;
    bit<8> value_check_type_min_lot_size;
    bit<160> trade_report_id;
    bit<160> trade_report_text;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<8> swap_clearer;
    bit<64> alloc_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> individual_alloc_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> pad1;
    bit<32> tes_enrichment_rule_id;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<8> trading_capacity;
    bit<8> position_effect;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_attribute_risk_reduction;
    bit<8> order_origination;
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
    bit<8> pad1v1;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<64> leg_qty;
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1_2;
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

header user_login_request_encrypted_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<2048> encrypted_password_chunk0;
    bit<2048> encrypted_password_chunk1;
    bit<1376> encrypted_password_chunk2;
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
    add_complex_instrument_request_t add_complex_instrument_request;
    add_complex_instrument_response_t add_complex_instrument_response;
    add_flexible_instrument_request_t add_flexible_instrument_request;
    add_flexible_instrument_response_t add_flexible_instrument_response;
    amend_basket_trade_request_t amend_basket_trade_request;
    approve_basket_trade_request_t approve_basket_trade_request;
    approve_reverse_tes_trade_request_t approve_reverse_tes_trade_request;
    approve_tes_trade_request_t approve_tes_trade_request;
    basket_approve_broadcast_t basket_approve_broadcast;
    basket_broadcast_t basket_broadcast;
    basket_delete_broadcast_t basket_delete_broadcast;
    basket_execution_broadcast_t basket_execution_broadcast;
    basket_response_t basket_response;
    broadcast_error_notification_t broadcast_error_notification;
    clip_deletion_notification_t clip_deletion_notification;
    clip_execution_notification_t clip_execution_notification;
    clip_response_t clip_response;
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
    delete_basket_trade_request_t delete_basket_trade_request;
    delete_clip_request_t delete_clip_request;
    delete_order_broadcast_t delete_order_broadcast;
    delete_order_complex_request_t delete_order_complex_request;
    delete_order_nr_response_t delete_order_nr_response;
    delete_order_response_t delete_order_response;
    delete_order_single_request_t delete_order_single_request;
    delete_tes_trade_request_t delete_tes_trade_request;
    enter_basket_trade_request_t enter_basket_trade_request;
    enter_clip_request_t enter_clip_request;
    enter_tes_trade_request_t enter_tes_trade_request;
    forced_logout_notification_t forced_logout_notification;
    forced_user_logout_notification_t forced_user_logout_notification;
    heartbeat_t heartbeat;
    heartbeat_notification_t heartbeat_notification;
    inquire_enrichment_rule_id_list_request_t inquire_enrichment_rule_id_list_request;
    inquire_enrichment_rule_id_list_response_t inquire_enrichment_rule_id_list_response;
    inquire_mm_parameter_request_t inquire_mm_parameter_request;
    inquire_mm_parameter_response_t inquire_mm_parameter_response;
    inquire_margin_based_risk_limit_request_t inquire_margin_based_risk_limit_request;
    inquire_margin_based_risk_limit_response_t inquire_margin_based_risk_limit_response;
    inquire_pre_trade_risk_limits_request_t inquire_pre_trade_risk_limits_request;
    inquire_session_list_request_t inquire_session_list_request;
    inquire_session_list_response_t inquire_session_list_response;
    inquire_user_request_t inquire_user_request;
    inquire_user_response_t inquire_user_response;
    legal_notification_broadcast_t legal_notification_broadcast;
    logon_request_t logon_request;
    logon_request_encrypted_t logon_request_encrypted;
    logon_response_t logon_response;
    logout_request_t logout_request;
    logout_response_t logout_response;
    mm_parameter_definition_request_t mm_parameter_definition_request;
    mm_parameter_definition_response_t mm_parameter_definition_response;
    mass_quote_request_t mass_quote_request;
    mass_quote_response_t mass_quote_response;
    modify_basket_trade_request_t modify_basket_trade_request;
    modify_order_complex_request_t modify_order_complex_request;
    modify_order_complex_short_request_t modify_order_complex_short_request;
    modify_order_nr_response_t modify_order_nr_response;
    modify_order_response_t modify_order_response;
    modify_order_single_request_t modify_order_single_request;
    modify_order_single_short_request_t modify_order_single_short_request;
    modify_tes_trade_request_t modify_tes_trade_request;
    new_order_complex_request_t new_order_complex_request;
    new_order_complex_short_request_t new_order_complex_short_request;
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
    ping_request_t ping_request;
    ping_response_t ping_response;
    pre_trade_risk_limit_response_t pre_trade_risk_limit_response;
    pre_trade_risk_limits_definition_request_t pre_trade_risk_limits_definition_request;
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
    reverse_tes_trade_request_t reverse_tes_trade_request;
    risk_notification_broadcast_t risk_notification_broadcast;
    srqs_create_deal_notification_t srqs_create_deal_notification;
    srqs_deal_notification_t srqs_deal_notification;
    srqs_deal_response_t srqs_deal_response;
    srqs_enter_quote_request_t srqs_enter_quote_request;
    srqs_hit_quote_request_t srqs_hit_quote_request;
    srqs_inquire_smart_respondent_request_t srqs_inquire_smart_respondent_request;
    srqs_inquire_smart_respondent_response_t srqs_inquire_smart_respondent_response;
    srqs_negotiation_notification_t srqs_negotiation_notification;
    srqs_negotiation_requester_notification_t srqs_negotiation_requester_notification;
    srqs_negotiation_status_notification_t srqs_negotiation_status_notification;
    srqs_open_negotiation_notification_t srqs_open_negotiation_notification;
    srqs_open_negotiation_request_t srqs_open_negotiation_request;
    srqs_open_negotiation_requester_notification_t srqs_open_negotiation_requester_notification;
    srqs_quote_notification_t srqs_quote_notification;
    srqs_quote_response_t srqs_quote_response;
    srqs_quote_snapshot_notification_t srqs_quote_snapshot_notification;
    srqs_quote_snapshot_request_t srqs_quote_snapshot_request;
    srqs_quoting_status_request_t srqs_quoting_status_request;
    srqs_response_t srqs_response;
    srqs_status_broadcast_t srqs_status_broadcast;
    srqs_update_deal_status_request_t srqs_update_deal_status_request;
    srqs_update_negotiation_request_t srqs_update_negotiation_request;
    service_availability_broadcast_t service_availability_broadcast;
    service_availability_market_broadcast_t service_availability_market_broadcast;
    status_broadcast_t status_broadcast;
    subscribe_request_t subscribe_request;
    subscribe_response_t subscribe_response;
    tes_approve_broadcast_t tes_approve_broadcast;
    tes_broadcast_t tes_broadcast;
    tes_compression_run_status_broadcast_t tes_compression_run_status_broadcast;
    tes_compression_run_status_request_t tes_compression_run_status_request;
    tes_compression_run_status_response_t tes_compression_run_status_response;
    tes_delete_broadcast_t tes_delete_broadcast;
    tes_execution_broadcast_t tes_execution_broadcast;
    tes_response_t tes_response;
    tes_reversal_broadcast_t tes_reversal_broadcast;
    tes_trade_broadcast_t tes_trade_broadcast;
    tes_trading_session_status_broadcast_t tes_trading_session_status_broadcast;
    tes_upload_broadcast_t tes_upload_broadcast;
    tm_trading_session_status_broadcast_t tm_trading_session_status_broadcast;
    throttle_update_notification_t throttle_update_notification;
    trade_broadcast_t trade_broadcast;
    trading_session_status_broadcast_t trading_session_status_broadcast;
    unsubscribe_request_t unsubscribe_request;
    unsubscribe_response_t unsubscribe_response;
    update_remaining_risk_allowance_base_request_t update_remaining_risk_allowance_base_request;
    update_remaining_risk_allowance_base_response_t update_remaining_risk_allowance_base_response;
    upload_tes_trade_request_t upload_tes_trade_request;
    user_login_request_t user_login_request;
    user_login_request_encrypted_t user_login_request_encrypted;
    user_login_response_t user_login_response;
    user_logout_request_t user_logout_request;
    user_logout_response_t user_logout_response;
}

parser EurexT7EtiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10301: parse_add_complex_instrument_request;
            16w10302: parse_add_complex_instrument_response;
            16w10309: parse_add_flexible_instrument_request;
            16w10310: parse_add_flexible_instrument_response;
            16w10629: parse_amend_basket_trade_request;
            16w10623: parse_approve_basket_trade_request;
            16w10631: parse_approve_reverse_tes_trade_request;
            16w10603: parse_approve_tes_trade_request;
            16w10627: parse_basket_approve_broadcast;
            16w10625: parse_basket_broadcast;
            16w10626: parse_basket_delete_broadcast;
            16w10628: parse_basket_execution_broadcast;
            16w10624: parse_basket_response;
            16w10032: parse_broadcast_error_notification;
            16w10134: parse_clip_deletion_notification;
            16w10135: parse_clip_execution_notification;
            16w10133: parse_clip_response;
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
            16w10622: parse_delete_basket_trade_request;
            16w10132: parse_delete_clip_request;
            16w10112: parse_delete_order_broadcast;
            16w10123: parse_delete_order_complex_request;
            16w10111: parse_delete_order_nr_response;
            16w10110: parse_delete_order_response;
            16w10109: parse_delete_order_single_request;
            16w10602: parse_delete_tes_trade_request;
            16w10620: parse_enter_basket_trade_request;
            16w10131: parse_enter_clip_request;
            16w10600: parse_enter_tes_trade_request;
            16w10012: parse_forced_logout_notification;
            16w10043: parse_forced_user_logout_notification;
            16w10011: parse_heartbeat;
            16w10023: parse_heartbeat_notification;
            16w10040: parse_inquire_enrichment_rule_id_list_request;
            16w10041: parse_inquire_enrichment_rule_id_list_response;
            16w10305: parse_inquire_mm_parameter_request;
            16w10306: parse_inquire_mm_parameter_response;
            16w10323: parse_inquire_margin_based_risk_limit_request;
            16w10324: parse_inquire_margin_based_risk_limit_response;
            16w10311: parse_inquire_pre_trade_risk_limits_request;
            16w10035: parse_inquire_session_list_request;
            16w10036: parse_inquire_session_list_response;
            16w10038: parse_inquire_user_request;
            16w10039: parse_inquire_user_response;
            16w10037: parse_legal_notification_broadcast;
            16w10000: parse_logon_request;
            16w19000: parse_logon_request_encrypted;
            16w10001: parse_logon_response;
            16w10002: parse_logout_request;
            16w10003: parse_logout_response;
            16w10303: parse_mm_parameter_definition_request;
            16w10304: parse_mm_parameter_definition_response;
            16w10405: parse_mass_quote_request;
            16w10406: parse_mass_quote_response;
            16w10621: parse_modify_basket_trade_request;
            16w10114: parse_modify_order_complex_request;
            16w10130: parse_modify_order_complex_short_request;
            16w10108: parse_modify_order_nr_response;
            16w10107: parse_modify_order_response;
            16w10106: parse_modify_order_single_request;
            16w10126: parse_modify_order_single_short_request;
            16w10601: parse_modify_tes_trade_request;
            16w10113: parse_new_order_complex_request;
            16w10129: parse_new_order_complex_short_request;
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
            16w10320: parse_ping_request;
            16w10321: parse_ping_response;
            16w10313: parse_pre_trade_risk_limit_response;
            16w10312: parse_pre_trade_risk_limits_definition_request;
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
            16w10630: parse_reverse_tes_trade_request;
            16w10033: parse_risk_notification_broadcast;
            16w10708: parse_srqs_create_deal_notification;
            16w10709: parse_srqs_deal_notification;
            16w10705: parse_srqs_deal_response;
            16w10702: parse_srqs_enter_quote_request;
            16w10704: parse_srqs_hit_quote_request;
            16w10718: parse_srqs_inquire_smart_respondent_request;
            16w10719: parse_srqs_inquire_smart_respondent_response;
            16w10713: parse_srqs_negotiation_notification;
            16w10712: parse_srqs_negotiation_requester_notification;
            16w10715: parse_srqs_negotiation_status_notification;
            16w10711: parse_srqs_open_negotiation_notification;
            16w10700: parse_srqs_open_negotiation_request;
            16w10710: parse_srqs_open_negotiation_requester_notification;
            16w10707: parse_srqs_quote_notification;
            16w10703: parse_srqs_quote_response;
            16w10723: parse_srqs_quote_snapshot_notification;
            16w10720: parse_srqs_quote_snapshot_request;
            16w10717: parse_srqs_quoting_status_request;
            16w10722: parse_srqs_response;
            16w10714: parse_srqs_status_broadcast;
            16w10706: parse_srqs_update_deal_status_request;
            16w10701: parse_srqs_update_negotiation_request;
            16w10030: parse_service_availability_broadcast;
            16w10044: parse_service_availability_market_broadcast;
            16w10045: parse_status_broadcast;
            16w10025: parse_subscribe_request;
            16w10005: parse_subscribe_response;
            16w10607: parse_tes_approve_broadcast;
            16w10604: parse_tes_broadcast;
            16w10618: parse_tes_compression_run_status_broadcast;
            16w10616: parse_tes_compression_run_status_request;
            16w10617: parse_tes_compression_run_status_response;
            16w10606: parse_tes_delete_broadcast;
            16w10610: parse_tes_execution_broadcast;
            16w10611: parse_tes_response;
            16w10632: parse_tes_reversal_broadcast;
            16w10614: parse_tes_trade_broadcast;
            16w10615: parse_tes_trading_session_status_broadcast;
            16w10613: parse_tes_upload_broadcast;
            16w10501: parse_tm_trading_session_status_broadcast;
            16w10028: parse_throttle_update_notification;
            16w10500: parse_trade_broadcast;
            16w10307: parse_trading_session_status_broadcast;
            16w10006: parse_unsubscribe_request;
            16w10007: parse_unsubscribe_response;
            16w10325: parse_update_remaining_risk_allowance_base_request;
            16w10326: parse_update_remaining_risk_allowance_base_response;
            16w10612: parse_upload_tes_trade_request;
            16w10018: parse_user_login_request;
            16w19018: parse_user_login_request_encrypted;
            16w10019: parse_user_login_response;
            16w10029: parse_user_logout_request;
            16w10024: parse_user_logout_response;
            default: accept;
        }
    }

    state parse_add_complex_instrument_request {
        packet.extract(hdr.add_complex_instrument_request);
        transition accept;
    }

    state parse_add_complex_instrument_response {
        packet.extract(hdr.add_complex_instrument_response);
        transition accept;
    }

    state parse_add_flexible_instrument_request {
        packet.extract(hdr.add_flexible_instrument_request);
        transition accept;
    }

    state parse_add_flexible_instrument_response {
        packet.extract(hdr.add_flexible_instrument_response);
        transition accept;
    }

    state parse_amend_basket_trade_request {
        packet.extract(hdr.amend_basket_trade_request);
        transition accept;
    }

    state parse_approve_basket_trade_request {
        packet.extract(hdr.approve_basket_trade_request);
        transition accept;
    }

    state parse_approve_reverse_tes_trade_request {
        packet.extract(hdr.approve_reverse_tes_trade_request);
        transition accept;
    }

    state parse_approve_tes_trade_request {
        packet.extract(hdr.approve_tes_trade_request);
        transition accept;
    }

    state parse_basket_approve_broadcast {
        packet.extract(hdr.basket_approve_broadcast);
        transition accept;
    }

    state parse_basket_broadcast {
        packet.extract(hdr.basket_broadcast);
        transition accept;
    }

    state parse_basket_delete_broadcast {
        packet.extract(hdr.basket_delete_broadcast);
        transition accept;
    }

    state parse_basket_execution_broadcast {
        packet.extract(hdr.basket_execution_broadcast);
        transition accept;
    }

    state parse_basket_response {
        packet.extract(hdr.basket_response);
        transition accept;
    }

    state parse_broadcast_error_notification {
        packet.extract(hdr.broadcast_error_notification);
        transition accept;
    }

    state parse_clip_deletion_notification {
        packet.extract(hdr.clip_deletion_notification);
        transition accept;
    }

    state parse_clip_execution_notification {
        packet.extract(hdr.clip_execution_notification);
        transition accept;
    }

    state parse_clip_response {
        packet.extract(hdr.clip_response);
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

    state parse_delete_basket_trade_request {
        packet.extract(hdr.delete_basket_trade_request);
        transition accept;
    }

    state parse_delete_clip_request {
        packet.extract(hdr.delete_clip_request);
        transition accept;
    }

    state parse_delete_order_broadcast {
        packet.extract(hdr.delete_order_broadcast);
        transition accept;
    }

    state parse_delete_order_complex_request {
        packet.extract(hdr.delete_order_complex_request);
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

    state parse_delete_tes_trade_request {
        packet.extract(hdr.delete_tes_trade_request);
        transition accept;
    }

    state parse_enter_basket_trade_request {
        packet.extract(hdr.enter_basket_trade_request);
        transition accept;
    }

    state parse_enter_clip_request {
        packet.extract(hdr.enter_clip_request);
        transition accept;
    }

    state parse_enter_tes_trade_request {
        packet.extract(hdr.enter_tes_trade_request);
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

    state parse_inquire_mm_parameter_request {
        packet.extract(hdr.inquire_mm_parameter_request);
        transition accept;
    }

    state parse_inquire_mm_parameter_response {
        packet.extract(hdr.inquire_mm_parameter_response);
        transition accept;
    }

    state parse_inquire_margin_based_risk_limit_request {
        packet.extract(hdr.inquire_margin_based_risk_limit_request);
        transition accept;
    }

    state parse_inquire_margin_based_risk_limit_response {
        packet.extract(hdr.inquire_margin_based_risk_limit_response);
        transition accept;
    }

    state parse_inquire_pre_trade_risk_limits_request {
        packet.extract(hdr.inquire_pre_trade_risk_limits_request);
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

    state parse_logon_request_encrypted {
        packet.extract(hdr.logon_request_encrypted);
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

    state parse_mm_parameter_definition_request {
        packet.extract(hdr.mm_parameter_definition_request);
        transition accept;
    }

    state parse_mm_parameter_definition_response {
        packet.extract(hdr.mm_parameter_definition_response);
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

    state parse_modify_basket_trade_request {
        packet.extract(hdr.modify_basket_trade_request);
        transition accept;
    }

    state parse_modify_order_complex_request {
        packet.extract(hdr.modify_order_complex_request);
        transition accept;
    }

    state parse_modify_order_complex_short_request {
        packet.extract(hdr.modify_order_complex_short_request);
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

    state parse_modify_tes_trade_request {
        packet.extract(hdr.modify_tes_trade_request);
        transition accept;
    }

    state parse_new_order_complex_request {
        packet.extract(hdr.new_order_complex_request);
        transition accept;
    }

    state parse_new_order_complex_short_request {
        packet.extract(hdr.new_order_complex_short_request);
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

    state parse_ping_request {
        packet.extract(hdr.ping_request);
        transition accept;
    }

    state parse_ping_response {
        packet.extract(hdr.ping_response);
        transition accept;
    }

    state parse_pre_trade_risk_limit_response {
        packet.extract(hdr.pre_trade_risk_limit_response);
        transition accept;
    }

    state parse_pre_trade_risk_limits_definition_request {
        packet.extract(hdr.pre_trade_risk_limits_definition_request);
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

    state parse_reverse_tes_trade_request {
        packet.extract(hdr.reverse_tes_trade_request);
        transition accept;
    }

    state parse_risk_notification_broadcast {
        packet.extract(hdr.risk_notification_broadcast);
        transition accept;
    }

    state parse_srqs_create_deal_notification {
        packet.extract(hdr.srqs_create_deal_notification);
        transition accept;
    }

    state parse_srqs_deal_notification {
        packet.extract(hdr.srqs_deal_notification);
        transition accept;
    }

    state parse_srqs_deal_response {
        packet.extract(hdr.srqs_deal_response);
        transition accept;
    }

    state parse_srqs_enter_quote_request {
        packet.extract(hdr.srqs_enter_quote_request);
        transition accept;
    }

    state parse_srqs_hit_quote_request {
        packet.extract(hdr.srqs_hit_quote_request);
        transition accept;
    }

    state parse_srqs_inquire_smart_respondent_request {
        packet.extract(hdr.srqs_inquire_smart_respondent_request);
        transition accept;
    }

    state parse_srqs_inquire_smart_respondent_response {
        packet.extract(hdr.srqs_inquire_smart_respondent_response);
        transition accept;
    }

    state parse_srqs_negotiation_notification {
        packet.extract(hdr.srqs_negotiation_notification);
        transition accept;
    }

    state parse_srqs_negotiation_requester_notification {
        packet.extract(hdr.srqs_negotiation_requester_notification);
        transition accept;
    }

    state parse_srqs_negotiation_status_notification {
        packet.extract(hdr.srqs_negotiation_status_notification);
        transition accept;
    }

    state parse_srqs_open_negotiation_notification {
        packet.extract(hdr.srqs_open_negotiation_notification);
        transition accept;
    }

    state parse_srqs_open_negotiation_request {
        packet.extract(hdr.srqs_open_negotiation_request);
        transition accept;
    }

    state parse_srqs_open_negotiation_requester_notification {
        packet.extract(hdr.srqs_open_negotiation_requester_notification);
        transition accept;
    }

    state parse_srqs_quote_notification {
        packet.extract(hdr.srqs_quote_notification);
        transition accept;
    }

    state parse_srqs_quote_response {
        packet.extract(hdr.srqs_quote_response);
        transition accept;
    }

    state parse_srqs_quote_snapshot_notification {
        packet.extract(hdr.srqs_quote_snapshot_notification);
        transition accept;
    }

    state parse_srqs_quote_snapshot_request {
        packet.extract(hdr.srqs_quote_snapshot_request);
        transition accept;
    }

    state parse_srqs_quoting_status_request {
        packet.extract(hdr.srqs_quoting_status_request);
        transition accept;
    }

    state parse_srqs_response {
        packet.extract(hdr.srqs_response);
        transition accept;
    }

    state parse_srqs_status_broadcast {
        packet.extract(hdr.srqs_status_broadcast);
        transition accept;
    }

    state parse_srqs_update_deal_status_request {
        packet.extract(hdr.srqs_update_deal_status_request);
        transition accept;
    }

    state parse_srqs_update_negotiation_request {
        packet.extract(hdr.srqs_update_negotiation_request);
        transition accept;
    }

    state parse_service_availability_broadcast {
        packet.extract(hdr.service_availability_broadcast);
        transition accept;
    }

    state parse_service_availability_market_broadcast {
        packet.extract(hdr.service_availability_market_broadcast);
        transition accept;
    }

    state parse_status_broadcast {
        packet.extract(hdr.status_broadcast);
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

    state parse_tes_approve_broadcast {
        packet.extract(hdr.tes_approve_broadcast);
        transition accept;
    }

    state parse_tes_broadcast {
        packet.extract(hdr.tes_broadcast);
        transition accept;
    }

    state parse_tes_compression_run_status_broadcast {
        packet.extract(hdr.tes_compression_run_status_broadcast);
        transition accept;
    }

    state parse_tes_compression_run_status_request {
        packet.extract(hdr.tes_compression_run_status_request);
        transition accept;
    }

    state parse_tes_compression_run_status_response {
        packet.extract(hdr.tes_compression_run_status_response);
        transition accept;
    }

    state parse_tes_delete_broadcast {
        packet.extract(hdr.tes_delete_broadcast);
        transition accept;
    }

    state parse_tes_execution_broadcast {
        packet.extract(hdr.tes_execution_broadcast);
        transition accept;
    }

    state parse_tes_response {
        packet.extract(hdr.tes_response);
        transition accept;
    }

    state parse_tes_reversal_broadcast {
        packet.extract(hdr.tes_reversal_broadcast);
        transition accept;
    }

    state parse_tes_trade_broadcast {
        packet.extract(hdr.tes_trade_broadcast);
        transition accept;
    }

    state parse_tes_trading_session_status_broadcast {
        packet.extract(hdr.tes_trading_session_status_broadcast);
        transition accept;
    }

    state parse_tes_upload_broadcast {
        packet.extract(hdr.tes_upload_broadcast);
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

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
        transition accept;
    }

    state parse_unsubscribe_response {
        packet.extract(hdr.unsubscribe_response);
        transition accept;
    }

    state parse_update_remaining_risk_allowance_base_request {
        packet.extract(hdr.update_remaining_risk_allowance_base_request);
        transition accept;
    }

    state parse_update_remaining_risk_allowance_base_response {
        packet.extract(hdr.update_remaining_risk_allowance_base_response);
        transition accept;
    }

    state parse_upload_tes_trade_request {
        packet.extract(hdr.upload_tes_trade_request);
        transition accept;
    }

    state parse_user_login_request {
        packet.extract(hdr.user_login_request);
        transition accept;
    }

    state parse_user_login_request_encrypted {
        packet.extract(hdr.user_login_request_encrypted);
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

control EurexT7EtiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7EtiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EtiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.add_complex_instrument_request);
        packet.emit(hdr.add_complex_instrument_response);
        packet.emit(hdr.add_flexible_instrument_request);
        packet.emit(hdr.add_flexible_instrument_response);
        packet.emit(hdr.amend_basket_trade_request);
        packet.emit(hdr.approve_basket_trade_request);
        packet.emit(hdr.approve_reverse_tes_trade_request);
        packet.emit(hdr.approve_tes_trade_request);
        packet.emit(hdr.basket_approve_broadcast);
        packet.emit(hdr.basket_broadcast);
        packet.emit(hdr.basket_delete_broadcast);
        packet.emit(hdr.basket_execution_broadcast);
        packet.emit(hdr.basket_response);
        packet.emit(hdr.broadcast_error_notification);
        packet.emit(hdr.clip_deletion_notification);
        packet.emit(hdr.clip_execution_notification);
        packet.emit(hdr.clip_response);
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
        packet.emit(hdr.delete_basket_trade_request);
        packet.emit(hdr.delete_clip_request);
        packet.emit(hdr.delete_order_broadcast);
        packet.emit(hdr.delete_order_complex_request);
        packet.emit(hdr.delete_order_nr_response);
        packet.emit(hdr.delete_order_response);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.delete_tes_trade_request);
        packet.emit(hdr.enter_basket_trade_request);
        packet.emit(hdr.enter_clip_request);
        packet.emit(hdr.enter_tes_trade_request);
        packet.emit(hdr.forced_logout_notification);
        packet.emit(hdr.forced_user_logout_notification);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.heartbeat_notification);
        packet.emit(hdr.inquire_enrichment_rule_id_list_request);
        packet.emit(hdr.inquire_enrichment_rule_id_list_response);
        packet.emit(hdr.inquire_mm_parameter_request);
        packet.emit(hdr.inquire_mm_parameter_response);
        packet.emit(hdr.inquire_margin_based_risk_limit_request);
        packet.emit(hdr.inquire_margin_based_risk_limit_response);
        packet.emit(hdr.inquire_pre_trade_risk_limits_request);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.inquire_session_list_response);
        packet.emit(hdr.inquire_user_request);
        packet.emit(hdr.inquire_user_response);
        packet.emit(hdr.legal_notification_broadcast);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logon_request_encrypted);
        packet.emit(hdr.logon_response);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.logout_response);
        packet.emit(hdr.mm_parameter_definition_request);
        packet.emit(hdr.mm_parameter_definition_response);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.mass_quote_response);
        packet.emit(hdr.modify_basket_trade_request);
        packet.emit(hdr.modify_order_complex_request);
        packet.emit(hdr.modify_order_complex_short_request);
        packet.emit(hdr.modify_order_nr_response);
        packet.emit(hdr.modify_order_response);
        packet.emit(hdr.modify_order_single_request);
        packet.emit(hdr.modify_order_single_short_request);
        packet.emit(hdr.modify_tes_trade_request);
        packet.emit(hdr.new_order_complex_request);
        packet.emit(hdr.new_order_complex_short_request);
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
        packet.emit(hdr.ping_request);
        packet.emit(hdr.ping_response);
        packet.emit(hdr.pre_trade_risk_limit_response);
        packet.emit(hdr.pre_trade_risk_limits_definition_request);
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
        packet.emit(hdr.reverse_tes_trade_request);
        packet.emit(hdr.risk_notification_broadcast);
        packet.emit(hdr.srqs_create_deal_notification);
        packet.emit(hdr.srqs_deal_notification);
        packet.emit(hdr.srqs_deal_response);
        packet.emit(hdr.srqs_enter_quote_request);
        packet.emit(hdr.srqs_hit_quote_request);
        packet.emit(hdr.srqs_inquire_smart_respondent_request);
        packet.emit(hdr.srqs_inquire_smart_respondent_response);
        packet.emit(hdr.srqs_negotiation_notification);
        packet.emit(hdr.srqs_negotiation_requester_notification);
        packet.emit(hdr.srqs_negotiation_status_notification);
        packet.emit(hdr.srqs_open_negotiation_notification);
        packet.emit(hdr.srqs_open_negotiation_request);
        packet.emit(hdr.srqs_open_negotiation_requester_notification);
        packet.emit(hdr.srqs_quote_notification);
        packet.emit(hdr.srqs_quote_response);
        packet.emit(hdr.srqs_quote_snapshot_notification);
        packet.emit(hdr.srqs_quote_snapshot_request);
        packet.emit(hdr.srqs_quoting_status_request);
        packet.emit(hdr.srqs_response);
        packet.emit(hdr.srqs_status_broadcast);
        packet.emit(hdr.srqs_update_deal_status_request);
        packet.emit(hdr.srqs_update_negotiation_request);
        packet.emit(hdr.service_availability_broadcast);
        packet.emit(hdr.service_availability_market_broadcast);
        packet.emit(hdr.status_broadcast);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.subscribe_response);
        packet.emit(hdr.tes_approve_broadcast);
        packet.emit(hdr.tes_broadcast);
        packet.emit(hdr.tes_compression_run_status_broadcast);
        packet.emit(hdr.tes_compression_run_status_request);
        packet.emit(hdr.tes_compression_run_status_response);
        packet.emit(hdr.tes_delete_broadcast);
        packet.emit(hdr.tes_execution_broadcast);
        packet.emit(hdr.tes_response);
        packet.emit(hdr.tes_reversal_broadcast);
        packet.emit(hdr.tes_trade_broadcast);
        packet.emit(hdr.tes_trading_session_status_broadcast);
        packet.emit(hdr.tes_upload_broadcast);
        packet.emit(hdr.tm_trading_session_status_broadcast);
        packet.emit(hdr.throttle_update_notification);
        packet.emit(hdr.trade_broadcast);
        packet.emit(hdr.trading_session_status_broadcast);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.unsubscribe_response);
        packet.emit(hdr.update_remaining_risk_allowance_base_request);
        packet.emit(hdr.update_remaining_risk_allowance_base_response);
        packet.emit(hdr.upload_tes_trade_request);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_login_request_encrypted);
        packet.emit(hdr.user_login_response);
        packet.emit(hdr.user_logout_request);
        packet.emit(hdr.user_logout_response);
    }
}

V1Switch(
    EurexT7EtiParser(),
    EurexT7EtiVerifyChecksum(),
    EurexT7EtiIngress(),
    EurexT7EtiEgress(),
    EurexT7EtiComputeChecksum(),
    EurexT7EtiDeparser()
) main;
