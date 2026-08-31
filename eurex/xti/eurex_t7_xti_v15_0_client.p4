// P4_16 (v1model) definition for: Eurex T7 Xti Fbe v15.0
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Cash Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 15.0
//   Date: 8/26/2026
//   Specification: T7_R.15.0_Enhanced_Trading_Interface_-_Cash_Message_Reference_Version 2.pdf
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

header approve_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> alloc_qty;
    bit<32> package_id;
    bit<32> alloc_id;
    bit<32> tes_exec_id;
    bit<32> market_segment_id;
    bit<16> trd_type;
    bit<8> trading_capacity;
    bit<8> trade_report_type;
    bit<8> side;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> order_origination;
    bit<160> trade_report_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<48> pad6;
}

header cross_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> order_qty;
    bit<32> market_segment_id;
    bit<32> pad4;
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

header delete_order_single_request_t {
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
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<48> pad6;
}

header delete_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> package_id;
    bit<32> market_segment_id;
    bit<32> tes_exec_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<160> trade_report_id;
    bit<40> pad5;
}

header enter_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> settl_curr_fx_rate;
    bit<32> market_segment_id;
    bit<32> settl_date;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<24> pad3;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header heartbeat_t {
    bit<64> network_msg_id;
    bit<16> pad2;
}

header inquire_enrichment_rule_id_list_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<128> last_entity_processed;
}

header inquire_overall_risk_limits_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_sponsored_access_unit;
    bit<32> pad4;
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

header inquire_user_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<128> last_entity_processed;
}

header issuer_security_state_change_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> transact_time;
    bit<32> market_segment_id;
    bit<8> no_events;
    bit<8> security_status;
    bit<8> sold_out_indicator;
    bit<8> pad1;
    bit<64> event_px;
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
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
    bit<16> pad2v2;
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
    bit<48> pad6;
}

header logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
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
    bit<8> cross_match_instruction;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> quote_size_type;
    bit<8> quote_type;
    bit<8> trading_capacity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> no_quote_entries;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<24> pad3;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
}

header modify_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> display_qty;
    bit<64> display_low_qty;
    bit<64> display_high_qty;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> stop_px;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> party_id_client_id;
    bit<64> executing_trader;
    bit<32> broker_internalization_id;
    bit<32> match_inst_cross_id;
    bit<32> expire_date;
    bit<32> target_party_id_session_id;
    bit<8> trading_session_sub_id;
    bit<8> stop_px_indicator;
    bit<8> ownership_indicator;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> appl_seq_indicator;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_origination;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<160> fix_cl_ord_id;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<48> pad6;
    bit<64> party_id_investment_decision_maker;
    bit<8> order_attribute_liquidity_provision;
    bit<8> trading_capacity;
    bit<8> cross_match_instruction;
    bit<8> pad1;
    bit<32> market_segment_id;
    bit<64> security_id;
    bit<64> min_qty;
    bit<64> order_qty;
    bit<64> price;
    bit<8> side;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> mid_point_type;
    bit<16> check_sum_correction;
    bit<16> pad2v2;
}

header modify_order_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> executing_trader;
    bit<32> match_inst_cross_id;
    bit<8> appl_seq_indicator;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<32> pad4;
    bit<64> party_id_investment_decision_maker;
    bit<16> enrichment_rule_id;
    bit<8> order_attribute_liquidity_provision;
    bit<8> cross_match_instruction;
    bit<32> pad4v1;
    bit<64> security_id;
    bit<64> min_qty;
    bit<64> order_qty;
    bit<64> price;
    bit<8> side;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> mid_point_type;
    bit<16> check_sum_correction;
    bit<16> pad2v2;
}

header modify_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> settl_date;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<24> pad3;
    bit<64> alloc_qty;
    bit<32> individual_alloc_id;
    bit<32> tes_enrichment_rule_id;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header new_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> stop_px;
    bit<64> display_qty;
    bit<64> display_low_qty;
    bit<64> display_high_qty;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> party_id_client_id;
    bit<64> executing_trader;
    bit<64> quote_id;
    bit<32> broker_internalization_id;
    bit<32> target_party_id_session_id;
    bit<32> match_inst_cross_id;
    bit<32> expire_date;
    bit<8> trading_session_sub_id;
    bit<8> trade_at_close_opt_in;
    bit<8> cross_match_instruction;
    bit<8> appl_seq_indicator;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_origination;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<160> fix_cl_ord_id;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<48> pad6;
    bit<64> party_id_investment_decision_maker;
    bit<8> order_attribute_liquidity_provision;
    bit<8> trading_capacity;
    bit<16> pad2v2;
    bit<32> market_segment_id;
    bit<64> security_id;
    bit<64> min_qty;
    bit<64> order_qty;
    bit<64> price;
    bit<8> side;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> mid_point_type;
    bit<16> check_sum_correction;
    bit<16> pad2v1;
}

header new_order_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> executing_trader;
    bit<32> match_inst_cross_id;
    bit<8> appl_seq_indicator;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> trading_capacity;
    bit<8> order_origination;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<32> pad4;
    bit<64> party_id_investment_decision_maker;
    bit<16> enrichment_rule_id;
    bit<8> order_attribute_liquidity_provision;
    bit<8> cross_match_instruction;
    bit<32> pad4v1;
    bit<64> security_id;
    bit<64> min_qty;
    bit<64> order_qty;
    bit<64> price;
    bit<8> side;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> mid_point_type;
    bit<16> check_sum_correction;
    bit<16> pad2v2;
}

header otc_upload_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> settl_curr_fx_rate;
    bit<64> trans_bkd_time;
    bit<64> transaction_cost_amt;
    bit<32> market_segment_id;
    bit<32> settl_date;
    bit<8> trade_report_type;
    bit<8> no_side_otc_allocs;
    bit<8> transaction_cost_code;
    bit<8> trade_platform;
    bit<24> settl_currency;
    bit<160> trade_report_id;
    bit<416> regulatory_trade_id;
    bit<8> pad1;
    bit<8> side;
    bit<8> trading_capacity;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<24> pad3;
}

header overall_risk_limits_definition_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_sponsored_access_unit;
    bit<32> pad4;
    bit<64> throttle_time_interval;
    bit<8> no_risk_limit_types;
    bit<56> pad7;
    bit<64> risk_limit_amount;
    bit<8> risk_limit_type;
    bit<8> risk_limit_level;
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

header pre_trade_risk_limits_definition_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<8> risk_limit_platform;
    bit<8> no_risk_limit_amount;
    bit<8> party_detail_status;
    bit<8> risk_limit_group_status;
    bit<24> risk_limit_group;
    bit<40> party_detail_executing_unit;
    bit<64> risk_limit_amount;
    bit<8> risk_limit_type;
    bit<56> pad7;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<40> pad5;
}

header rfq_reject_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<8> quote_request_reject_reason;
    bit<40> party_executing_firm;
    bit<48> pad6;
}

header rfq_reply_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> quote_id;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<32> market_segment_id;
    bit<40> party_executing_firm;
    bit<56> pad7;
}

header rfq_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> order_qty;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<8> rfq_publish_indicator;
    bit<8> rfq_requester_disclosure_instruction;
    bit<8> side;
    bit<8> pad1;
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

header reverse_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> package_id;
    bit<32> tes_exec_id;
    bit<32> pad4;
}

header single_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_id;
    bit<64> security_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> bid_px;
    bit<64> bid_size;
    bit<64> offer_px;
    bit<64> offer_size;
    bit<64> settl_curr_fx_rate;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<8> cross_match_instruction;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> quote_size_type;
    bit<8> quote_type;
    bit<8> trading_capacity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<48> pad6;
}

header specialist_security_state_change_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<8> event_type;
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

header trading_action_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<8> risk_limit_platform;
    bit<8> order_deletion_instruction;
    bit<8> party_action_type;
    bit<8> pad1;
    bit<32> party_id_executing_unit;
    bit<32> target_party_id_executing_unit;
    bit<32> pad4;
}

header unsubscribe_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> ref_appl_sub_id;
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

header user_logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<32> pad4;
}

header xetra_en_light_delete_all_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> target_party_id_session_id;
    bit<32> pad4;
}

header xetra_en_light_enter_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> bid_size;
    bit<64> offer_size;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> valid_until_time;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> value_check_type_quantity;
    bit<8> value_check_type_value;
    bit<8> trading_capacity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> quoting_frequency;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<48> pad6;
}

header xetra_en_light_hit_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_id;
    bit<64> order_qty;
    bit<64> price;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> side;
    bit<8> value_check_type_quantity;
    bit<8> value_check_type_value;
    bit<8> trading_capacity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> alloc_method;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<160> firm_trade_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
}

header xetra_en_light_open_negotiation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<64> valid_until_time;
    bit<64> auto_exec_limit_price;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> settl_date;
    bit<32> auto_exec_exposure_duration;
    bit<32> auto_exec_reference_price_offset;
    bit<32> auto_exec_min_no_of_quotes;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> respondent_type;
    bit<8> bid_px_is_locked;
    bit<8> offer_px_is_locked;
    bit<8> side_is_locked;
    bit<8> trading_capacity;
    bit<8> auto_exec_type;
    bit<8> side_disclosure_instruction;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
    bit<160> quote_req_id;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<32> target_party_id_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> pad1;
}

header xetra_en_light_quote_snapshot_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header xetra_en_light_quoting_status_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> quoting_status;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header xetra_en_light_update_negotiation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> order_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<64> auto_exec_limit_price;
    bit<32> auto_exec_reference_price_offset;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> settl_date;
    bit<32> auto_exec_exposure_duration;
    bit<32> auto_exec_min_no_of_quotes;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> respondent_type;
    bit<8> trading_capacity;
    bit<8> auto_exec_type;
    bit<8> side_disclosure_instruction;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> order_origination;
    bit<8> quote_condition;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<1056> free_text_5;
    bit<24> pad3;
    bit<32> target_party_id_executing_trader;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> pad1;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    approve_tes_trade_request_t approve_tes_trade_request;
    cross_request_t cross_request;
    delete_all_order_request_t delete_all_order_request;
    delete_all_quote_request_t delete_all_quote_request;
    delete_order_single_request_t delete_order_single_request;
    delete_tes_trade_request_t delete_tes_trade_request;
    enter_tes_trade_request_t enter_tes_trade_request;
    heartbeat_t heartbeat;
    inquire_enrichment_rule_id_list_request_t inquire_enrichment_rule_id_list_request;
    inquire_overall_risk_limits_request_t inquire_overall_risk_limits_request;
    inquire_pre_trade_risk_limits_request_t inquire_pre_trade_risk_limits_request;
    inquire_session_list_request_t inquire_session_list_request;
    inquire_user_request_t inquire_user_request;
    issuer_security_state_change_request_t issuer_security_state_change_request;
    logon_request_t logon_request;
    logon_request_encrypted_t logon_request_encrypted;
    logout_request_t logout_request;
    mass_quote_request_t mass_quote_request;
    modify_order_request_t modify_order_request;
    modify_order_short_request_t modify_order_short_request;
    modify_tes_trade_request_t modify_tes_trade_request;
    new_order_request_t new_order_request;
    new_order_short_request_t new_order_short_request;
    otc_upload_request_t otc_upload_request;
    overall_risk_limits_definition_request_t overall_risk_limits_definition_request;
    ping_request_t ping_request;
    pre_trade_risk_limits_definition_request_t pre_trade_risk_limits_definition_request;
    quote_activation_request_t quote_activation_request;
    rfq_reject_request_t rfq_reject_request;
    rfq_reply_request_t rfq_reply_request;
    rfq_request_t rfq_request;
    retransmit_me_message_request_t retransmit_me_message_request;
    retransmit_request_t retransmit_request;
    reverse_tes_trade_request_t reverse_tes_trade_request;
    single_quote_request_t single_quote_request;
    specialist_security_state_change_request_t specialist_security_state_change_request;
    subscribe_request_t subscribe_request;
    trading_action_request_t trading_action_request;
    unsubscribe_request_t unsubscribe_request;
    user_login_request_t user_login_request;
    user_login_request_encrypted_t user_login_request_encrypted;
    user_logout_request_t user_logout_request;
    xetra_en_light_delete_all_quote_request_t xetra_en_light_delete_all_quote_request;
    xetra_en_light_enter_quote_request_t xetra_en_light_enter_quote_request;
    xetra_en_light_hit_quote_request_t xetra_en_light_hit_quote_request;
    xetra_en_light_open_negotiation_request_t xetra_en_light_open_negotiation_request;
    xetra_en_light_quote_snapshot_request_t xetra_en_light_quote_snapshot_request;
    xetra_en_light_quoting_status_request_t xetra_en_light_quoting_status_request;
    xetra_en_light_update_negotiation_request_t xetra_en_light_update_negotiation_request;
}

parser EurexT7XtiClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10603: parse_approve_tes_trade_request;
            16w10118: parse_cross_request;
            16w10120: parse_delete_all_order_request;
            16w10408: parse_delete_all_quote_request;
            16w10109: parse_delete_order_single_request;
            16w10602: parse_delete_tes_trade_request;
            16w10600: parse_enter_tes_trade_request;
            16w10011: parse_heartbeat;
            16w10040: parse_inquire_enrichment_rule_id_list_request;
            16w10900: parse_inquire_overall_risk_limits_request;
            16w10311: parse_inquire_pre_trade_risk_limits_request;
            16w10035: parse_inquire_session_list_request;
            16w10038: parse_inquire_user_request;
            16w10314: parse_issuer_security_state_change_request;
            16w10000: parse_logon_request;
            16w19000: parse_logon_request_encrypted;
            16w10002: parse_logout_request;
            16w10405: parse_mass_quote_request;
            16w10140: parse_modify_order_request;
            16w10141: parse_modify_order_short_request;
            16w10601: parse_modify_tes_trade_request;
            16w10138: parse_new_order_request;
            16w10139: parse_new_order_short_request;
            16w10616: parse_otc_upload_request;
            16w10901: parse_overall_risk_limits_definition_request;
            16w10320: parse_ping_request;
            16w10312: parse_pre_trade_risk_limits_definition_request;
            16w10403: parse_quote_activation_request;
            16w10421: parse_rfq_reject_request;
            16w10422: parse_rfq_reply_request;
            16w10401: parse_rfq_request;
            16w10026: parse_retransmit_me_message_request;
            16w10008: parse_retransmit_request;
            16w10630: parse_reverse_tes_trade_request;
            16w10418: parse_single_quote_request;
            16w10317: parse_specialist_security_state_change_request;
            16w10025: parse_subscribe_request;
            16w10904: parse_trading_action_request;
            16w10006: parse_unsubscribe_request;
            16w10018: parse_user_login_request;
            16w19018: parse_user_login_request_encrypted;
            16w10029: parse_user_logout_request;
            16w10821: parse_xetra_en_light_delete_all_quote_request;
            16w10802: parse_xetra_en_light_enter_quote_request;
            16w10804: parse_xetra_en_light_hit_quote_request;
            16w10800: parse_xetra_en_light_open_negotiation_request;
            16w10820: parse_xetra_en_light_quote_snapshot_request;
            16w10817: parse_xetra_en_light_quoting_status_request;
            16w10801: parse_xetra_en_light_update_negotiation_request;
            default: accept;
        }
    }

    state parse_approve_tes_trade_request {
        packet.extract(hdr.approve_tes_trade_request);
        transition accept;
    }

    state parse_cross_request {
        packet.extract(hdr.cross_request);
        transition accept;
    }

    state parse_delete_all_order_request {
        packet.extract(hdr.delete_all_order_request);
        transition accept;
    }

    state parse_delete_all_quote_request {
        packet.extract(hdr.delete_all_quote_request);
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

    state parse_enter_tes_trade_request {
        packet.extract(hdr.enter_tes_trade_request);
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        transition accept;
    }

    state parse_inquire_enrichment_rule_id_list_request {
        packet.extract(hdr.inquire_enrichment_rule_id_list_request);
        transition accept;
    }

    state parse_inquire_overall_risk_limits_request {
        packet.extract(hdr.inquire_overall_risk_limits_request);
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

    state parse_inquire_user_request {
        packet.extract(hdr.inquire_user_request);
        transition accept;
    }

    state parse_issuer_security_state_change_request {
        packet.extract(hdr.issuer_security_state_change_request);
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

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        transition accept;
    }

    state parse_mass_quote_request {
        packet.extract(hdr.mass_quote_request);
        transition accept;
    }

    state parse_modify_order_request {
        packet.extract(hdr.modify_order_request);
        transition accept;
    }

    state parse_modify_order_short_request {
        packet.extract(hdr.modify_order_short_request);
        transition accept;
    }

    state parse_modify_tes_trade_request {
        packet.extract(hdr.modify_tes_trade_request);
        transition accept;
    }

    state parse_new_order_request {
        packet.extract(hdr.new_order_request);
        transition accept;
    }

    state parse_new_order_short_request {
        packet.extract(hdr.new_order_short_request);
        transition accept;
    }

    state parse_otc_upload_request {
        packet.extract(hdr.otc_upload_request);
        transition accept;
    }

    state parse_overall_risk_limits_definition_request {
        packet.extract(hdr.overall_risk_limits_definition_request);
        transition accept;
    }

    state parse_ping_request {
        packet.extract(hdr.ping_request);
        transition accept;
    }

    state parse_pre_trade_risk_limits_definition_request {
        packet.extract(hdr.pre_trade_risk_limits_definition_request);
        transition accept;
    }

    state parse_quote_activation_request {
        packet.extract(hdr.quote_activation_request);
        transition accept;
    }

    state parse_rfq_reject_request {
        packet.extract(hdr.rfq_reject_request);
        transition accept;
    }

    state parse_rfq_reply_request {
        packet.extract(hdr.rfq_reply_request);
        transition accept;
    }

    state parse_rfq_request {
        packet.extract(hdr.rfq_request);
        transition accept;
    }

    state parse_retransmit_me_message_request {
        packet.extract(hdr.retransmit_me_message_request);
        transition accept;
    }

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        transition accept;
    }

    state parse_reverse_tes_trade_request {
        packet.extract(hdr.reverse_tes_trade_request);
        transition accept;
    }

    state parse_single_quote_request {
        packet.extract(hdr.single_quote_request);
        transition accept;
    }

    state parse_specialist_security_state_change_request {
        packet.extract(hdr.specialist_security_state_change_request);
        transition accept;
    }

    state parse_subscribe_request {
        packet.extract(hdr.subscribe_request);
        transition accept;
    }

    state parse_trading_action_request {
        packet.extract(hdr.trading_action_request);
        transition accept;
    }

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
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

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
        transition accept;
    }

    state parse_xetra_en_light_delete_all_quote_request {
        packet.extract(hdr.xetra_en_light_delete_all_quote_request);
        transition accept;
    }

    state parse_xetra_en_light_enter_quote_request {
        packet.extract(hdr.xetra_en_light_enter_quote_request);
        transition accept;
    }

    state parse_xetra_en_light_hit_quote_request {
        packet.extract(hdr.xetra_en_light_hit_quote_request);
        transition accept;
    }

    state parse_xetra_en_light_open_negotiation_request {
        packet.extract(hdr.xetra_en_light_open_negotiation_request);
        transition accept;
    }

    state parse_xetra_en_light_quote_snapshot_request {
        packet.extract(hdr.xetra_en_light_quote_snapshot_request);
        transition accept;
    }

    state parse_xetra_en_light_quoting_status_request {
        packet.extract(hdr.xetra_en_light_quoting_status_request);
        transition accept;
    }

    state parse_xetra_en_light_update_negotiation_request {
        packet.extract(hdr.xetra_en_light_update_negotiation_request);
        transition accept;
    }

}

control EurexT7XtiClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7XtiClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7XtiClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.approve_tes_trade_request);
        packet.emit(hdr.cross_request);
        packet.emit(hdr.delete_all_order_request);
        packet.emit(hdr.delete_all_quote_request);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.delete_tes_trade_request);
        packet.emit(hdr.enter_tes_trade_request);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.inquire_enrichment_rule_id_list_request);
        packet.emit(hdr.inquire_overall_risk_limits_request);
        packet.emit(hdr.inquire_pre_trade_risk_limits_request);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.inquire_user_request);
        packet.emit(hdr.issuer_security_state_change_request);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logon_request_encrypted);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.modify_order_request);
        packet.emit(hdr.modify_order_short_request);
        packet.emit(hdr.modify_tes_trade_request);
        packet.emit(hdr.new_order_request);
        packet.emit(hdr.new_order_short_request);
        packet.emit(hdr.otc_upload_request);
        packet.emit(hdr.overall_risk_limits_definition_request);
        packet.emit(hdr.ping_request);
        packet.emit(hdr.pre_trade_risk_limits_definition_request);
        packet.emit(hdr.quote_activation_request);
        packet.emit(hdr.rfq_reject_request);
        packet.emit(hdr.rfq_reply_request);
        packet.emit(hdr.rfq_request);
        packet.emit(hdr.retransmit_me_message_request);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.reverse_tes_trade_request);
        packet.emit(hdr.single_quote_request);
        packet.emit(hdr.specialist_security_state_change_request);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.trading_action_request);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_login_request_encrypted);
        packet.emit(hdr.user_logout_request);
        packet.emit(hdr.xetra_en_light_delete_all_quote_request);
        packet.emit(hdr.xetra_en_light_enter_quote_request);
        packet.emit(hdr.xetra_en_light_hit_quote_request);
        packet.emit(hdr.xetra_en_light_open_negotiation_request);
        packet.emit(hdr.xetra_en_light_quote_snapshot_request);
        packet.emit(hdr.xetra_en_light_quoting_status_request);
        packet.emit(hdr.xetra_en_light_update_negotiation_request);
    }
}

V1Switch(
    EurexT7XtiClientParser(),
    EurexT7XtiClientVerifyChecksum(),
    EurexT7XtiClientIngress(),
    EurexT7XtiClientEgress(),
    EurexT7XtiClientComputeChecksum(),
    EurexT7XtiClientDeparser()
) main;
