// P4_16 (v1model) definition for: Eurex T7 Eti Fbe v6.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 6.1
//   Date: 05/16/2018
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

header add_complex_instrument_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> security_sub_type;
    bit<8> product_complex;
    bit<8> no_legs;
    bit<160> compliance_text;
    bit<16> pad2v2;
}

header add_complex_instrument_request_instrmt_leg_grp_comp_t {
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
    bit<8> settl_method;
    bit<8> opt_attribute;
    bit<8> put_or_call;
    bit<8> exercise_style;
    bit<160> compliance_text;
}

header approve_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> package_id;
    bit<32> alloc_id;
    bit<32> alloc_qty;
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
    bit<48> pad6;
}

header cross_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<160> compliance_text;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> pad1;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> fix_cl_ord_id;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> fix_cl_ord_id;
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
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<160> trade_report_id;
    bit<8> pad1;
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
    bit<32> market_segment_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> related_trade_quantity;
    bit<64> underlying_qty;
    bit<32> negotiation_id;
    bit<32> srqs_related_trade_id;
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
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
    bit<8> pad1;
}

header enter_tes_trade_request_side_alloc_grp_comp_t {
    bit<32> individual_alloc_id;
    bit<32> alloc_qty;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header enter_tes_trade_request_trd_instrmnt_leg_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_price;
}

header enter_tes_trade_request_instrument_event_grp_comp_t {
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
}

header enter_tes_trade_request_instrument_attribute_grp_comp_t {
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
}

header enter_tes_trade_request_underlying_stip_grp_comp_t {
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1;
}

header gateway_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_session_id;
    bit<16> partition_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
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

header inquire_mm_parameter_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
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

header logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header mm_parameter_definition_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> exposure_duration;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> cum_qty;
    bit<32> pct_count;
    bit<32> delta;
    bit<32> vega;
    bit<8> product_complex;
    bit<56> pad7;
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
}

header mass_quote_request_quote_entry_grp_comp_t {
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<32> bid_size;
    bit<32> offer_size;
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
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> order_qty;
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
    bit<8> no_legs;
    bit<16> pad2v2;
}

header modify_order_complex_request_leg_ord_grp_comp_t {
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
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> order_qty;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<56> pad7;
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
    bit<64> stop_px;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
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
    bit<32> pad4;
}

header modify_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
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
    bit<32> related_market_segment_id;
    bit<32> negotiation_id;
    bit<32> srqs_related_trade_id;
    bit<16> trd_type;
    bit<8> trade_report_type;
    bit<8> trade_publish_indicator;
    bit<8> no_side_allocs;
    bit<8> no_legs;
    bit<160> trade_report_text;
    bit<160> trade_report_id;
    bit<16> pad2v2;
}

header modify_tes_trade_request_side_alloc_grp_comp_t {
    bit<32> individual_alloc_id;
    bit<32> alloc_qty;
    bit<8> side;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header modify_tes_trade_request_trd_instrmnt_leg_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_price;
}

header new_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> order_qty;
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
    bit<8> no_legs;
    bit<48> pad6;
}

header new_order_complex_request_leg_ord_grp_comp_t {
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
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> order_qty;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<56> pad7;
}

header new_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
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
}

header new_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
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
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
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
    bit<8> product_complex;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<24> pad3;
}

header rfq_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<8> side;
    bit<160> compliance_text;
    bit<24> pad3;
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

header srqs_enter_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> underlying_px;
    bit<64> underlying_delta_percentage;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> bid_size;
    bit<32> offer_size;
    bit<8> value_check_type_quantity;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<96> free_text_1;
}

header srqs_hit_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_id;
    bit<64> valid_until_time;
    bit<64> underlying_qty;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> order_qty;
    bit<8> side;
    bit<8> value_check_type_quantity;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<160> firm_trade_id;
    bit<96> free_text_1;
    bit<56> pad7;
}

header srqs_open_negotiation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> quote_ref_price;
    bit<64> underlying_delta_percentage;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<32> security_sub_type;
    bit<8> quote_type;
    bit<8> no_legs;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> quote_ref_price_source;
    bit<8> trade_underlying;
    bit<8> negotiate_underlying;
    bit<8> product_complex;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<160> quote_req_id;
    bit<32> pad4;
}

header srqs_open_negotiation_request_quot_req_legs_grp_comp_t {
    bit<64> leg_security_id;
    bit<32> leg_ratio_qty;
    bit<32> leg_symbol;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<48> pad6;
}

header srqs_open_negotiation_request_target_parties_comp_t {
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> quote_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<56> pad7;
}

header srqs_update_deal_status_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> trade_id;
    bit<8> trade_report_type;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
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
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<32> order_qty;
    bit<8> no_target_party_i_ds;
    bit<8> number_of_resp_disclosure_instruction;
    bit<8> side;
    bit<8> quote_cancel_type;
    bit<8> quote_ref_price_source;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<32> pad4;
}

header srqs_update_negotiation_request_target_parties_comp_t {
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> quote_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
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

header unsubscribe_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> ref_appl_sub_id;
    bit<32> pad4;
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
    bit<32> market_segment_id;
    bit<32> underlying_settlement_date;
    bit<32> underlying_maturity_date;
    bit<32> related_trade_id;
    bit<32> related_market_segment_id;
    bit<32> related_trade_quantity;
    bit<64> underlying_qty;
    bit<32> negotiation_id;
    bit<32> srqs_related_trade_id;
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
    bit<8> hedge_type;
    bit<8> party_id_settlement_location;
    bit<160> trade_report_id;
    bit<160> trade_report_text;
    bit<96> underlying_security_id;
    bit<240> underlying_security_desc;
    bit<24> underlying_currency;
    bit<240> underlying_issuer;
}

header upload_tes_trade_request_side_alloc_ext_grp_comp_t {
    bit<32> individual_alloc_id;
    bit<32> alloc_qty;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> side;
    bit<8> trade_alloc_status;
    bit<8> trading_capacity;
    bit<8> position_effect;
    bit<8> order_attribute_liquidity_provision;
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
    bit<48> pad6;
}

header upload_tes_trade_request_trd_instrmnt_leg_grp_comp_t {
    bit<64> leg_security_id;
    bit<64> leg_price;
}

header upload_tes_trade_request_instrument_event_grp_comp_t {
    bit<32> event_date;
    bit<8> event_type;
    bit<24> pad3;
}

header upload_tes_trade_request_instrument_attribute_grp_comp_t {
    bit<8> instr_attrib_type;
    bit<256> instr_attrib_value;
    bit<56> pad7;
}

header upload_tes_trade_request_underlying_stip_grp_comp_t {
    bit<256> underlying_stip_value;
    bit<56> underlying_stip_type;
    bit<8> pad1;
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

header user_logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<32> pad4;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> add_complex_instrument_request_instrmt_leg_grp_comp_remaining;
    bit<8> enter_tes_trade_request_side_alloc_grp_comp_remaining;
    bit<8> enter_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining;
    bit<8> enter_tes_trade_request_instrument_event_grp_comp_remaining;
    bit<8> enter_tes_trade_request_instrument_attribute_grp_comp_remaining;
    bit<8> enter_tes_trade_request_underlying_stip_grp_comp_remaining;
    bit<8> mass_quote_request_quote_entry_grp_comp_remaining;
    bit<8> modify_order_complex_request_leg_ord_grp_comp_remaining;
    bit<8> modify_tes_trade_request_side_alloc_grp_comp_remaining;
    bit<8> modify_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining;
    bit<8> new_order_complex_request_leg_ord_grp_comp_remaining;
    bit<8> srqs_open_negotiation_request_quot_req_legs_grp_comp_remaining;
    bit<8> srqs_open_negotiation_request_target_parties_comp_remaining;
    bit<8> srqs_update_negotiation_request_target_parties_comp_remaining;
    bit<8> upload_tes_trade_request_side_alloc_ext_grp_comp_remaining;
    bit<8> upload_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining;
    bit<8> upload_tes_trade_request_instrument_event_grp_comp_remaining;
    bit<8> upload_tes_trade_request_instrument_attribute_grp_comp_remaining;
    bit<8> upload_tes_trade_request_underlying_stip_grp_comp_remaining;
}

struct headers_t {
    message_header_t message_header;
    add_complex_instrument_request_t add_complex_instrument_request;
    add_complex_instrument_request_instrmt_leg_grp_comp_t add_complex_instrument_request_instrmt_leg_grp_comp[MAX_MESSAGES];
    add_flexible_instrument_request_t add_flexible_instrument_request;
    approve_tes_trade_request_t approve_tes_trade_request;
    cross_request_t cross_request;
    delete_all_order_request_t delete_all_order_request;
    delete_all_quote_request_t delete_all_quote_request;
    delete_order_complex_request_t delete_order_complex_request;
    delete_order_single_request_t delete_order_single_request;
    delete_tes_trade_request_t delete_tes_trade_request;
    enter_tes_trade_request_t enter_tes_trade_request;
    enter_tes_trade_request_side_alloc_grp_comp_t enter_tes_trade_request_side_alloc_grp_comp[MAX_MESSAGES];
    enter_tes_trade_request_trd_instrmnt_leg_grp_comp_t enter_tes_trade_request_trd_instrmnt_leg_grp_comp[MAX_MESSAGES];
    enter_tes_trade_request_instrument_event_grp_comp_t enter_tes_trade_request_instrument_event_grp_comp[MAX_MESSAGES];
    enter_tes_trade_request_instrument_attribute_grp_comp_t enter_tes_trade_request_instrument_attribute_grp_comp[MAX_MESSAGES];
    enter_tes_trade_request_underlying_stip_grp_comp_t enter_tes_trade_request_underlying_stip_grp_comp[MAX_MESSAGES];
    gateway_request_t gateway_request;
    heartbeat_t heartbeat;
    inquire_enrichment_rule_id_list_request_t inquire_enrichment_rule_id_list_request;
    inquire_mm_parameter_request_t inquire_mm_parameter_request;
    inquire_session_list_request_t inquire_session_list_request;
    inquire_user_request_t inquire_user_request;
    logon_request_t logon_request;
    logout_request_t logout_request;
    mm_parameter_definition_request_t mm_parameter_definition_request;
    mass_quote_request_t mass_quote_request;
    mass_quote_request_quote_entry_grp_comp_t mass_quote_request_quote_entry_grp_comp[MAX_MESSAGES];
    modify_order_complex_request_t modify_order_complex_request;
    modify_order_complex_request_leg_ord_grp_comp_t modify_order_complex_request_leg_ord_grp_comp[MAX_MESSAGES];
    modify_order_complex_short_request_t modify_order_complex_short_request;
    modify_order_single_request_t modify_order_single_request;
    modify_order_single_short_request_t modify_order_single_short_request;
    modify_tes_trade_request_t modify_tes_trade_request;
    modify_tes_trade_request_side_alloc_grp_comp_t modify_tes_trade_request_side_alloc_grp_comp[MAX_MESSAGES];
    modify_tes_trade_request_trd_instrmnt_leg_grp_comp_t modify_tes_trade_request_trd_instrmnt_leg_grp_comp[MAX_MESSAGES];
    new_order_complex_request_t new_order_complex_request;
    new_order_complex_request_leg_ord_grp_comp_t new_order_complex_request_leg_ord_grp_comp[MAX_MESSAGES];
    new_order_complex_short_request_t new_order_complex_short_request;
    new_order_single_request_t new_order_single_request;
    new_order_single_short_request_t new_order_single_short_request;
    quote_activation_request_t quote_activation_request;
    rfq_request_t rfq_request;
    retransmit_me_message_request_t retransmit_me_message_request;
    retransmit_request_t retransmit_request;
    srqs_enter_quote_request_t srqs_enter_quote_request;
    srqs_hit_quote_request_t srqs_hit_quote_request;
    srqs_open_negotiation_request_t srqs_open_negotiation_request;
    srqs_open_negotiation_request_quot_req_legs_grp_comp_t srqs_open_negotiation_request_quot_req_legs_grp_comp[MAX_MESSAGES];
    srqs_open_negotiation_request_target_parties_comp_t srqs_open_negotiation_request_target_parties_comp[MAX_MESSAGES];
    srqs_update_deal_status_request_t srqs_update_deal_status_request;
    srqs_update_negotiation_request_t srqs_update_negotiation_request;
    srqs_update_negotiation_request_target_parties_comp_t srqs_update_negotiation_request_target_parties_comp[MAX_MESSAGES];
    subscribe_request_t subscribe_request;
    unsubscribe_request_t unsubscribe_request;
    upload_tes_trade_request_t upload_tes_trade_request;
    upload_tes_trade_request_side_alloc_ext_grp_comp_t upload_tes_trade_request_side_alloc_ext_grp_comp[MAX_MESSAGES];
    upload_tes_trade_request_trd_instrmnt_leg_grp_comp_t upload_tes_trade_request_trd_instrmnt_leg_grp_comp[MAX_MESSAGES];
    upload_tes_trade_request_instrument_event_grp_comp_t upload_tes_trade_request_instrument_event_grp_comp[MAX_MESSAGES];
    upload_tes_trade_request_instrument_attribute_grp_comp_t upload_tes_trade_request_instrument_attribute_grp_comp[MAX_MESSAGES];
    upload_tes_trade_request_underlying_stip_grp_comp_t upload_tes_trade_request_underlying_stip_grp_comp[MAX_MESSAGES];
    user_login_request_t user_login_request;
    user_logout_request_t user_logout_request;
}

parser EurexT7EtiClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x3d28: parse_add_complex_instrument_request;
            16w0x4528: parse_add_flexible_instrument_request;
            16w0x6b29: parse_approve_tes_trade_request;
            16w0x8627: parse_cross_request;
            16w0x8827: parse_delete_all_order_request;
            16w0xa828: parse_delete_all_quote_request;
            16w0x8b27: parse_delete_order_complex_request;
            16w0x7d27: parse_delete_order_single_request;
            16w0x6a29: parse_delete_tes_trade_request;
            16w0x6829: parse_enter_tes_trade_request;
            16w0x2427: parse_gateway_request;
            16w0x1b27: parse_heartbeat;
            16w0x3827: parse_inquire_enrichment_rule_id_list_request;
            16w0x4128: parse_inquire_mm_parameter_request;
            16w0x3327: parse_inquire_session_list_request;
            16w0x3627: parse_inquire_user_request;
            16w0x1027: parse_logon_request;
            16w0x1227: parse_logout_request;
            16w0x3f28: parse_mm_parameter_definition_request;
            16w0xa528: parse_mass_quote_request;
            16w0x8227: parse_modify_order_complex_request;
            16w0x9227: parse_modify_order_complex_short_request;
            16w0x7a27: parse_modify_order_single_request;
            16w0x8e27: parse_modify_order_single_short_request;
            16w0x6929: parse_modify_tes_trade_request;
            16w0x8127: parse_new_order_complex_request;
            16w0x9127: parse_new_order_complex_short_request;
            16w0x7427: parse_new_order_single_request;
            16w0x8d27: parse_new_order_single_short_request;
            16w0xa328: parse_quote_activation_request;
            16w0xa128: parse_rfq_request;
            16w0x2a27: parse_retransmit_me_message_request;
            16w0x1827: parse_retransmit_request;
            16w0xce29: parse_srqs_enter_quote_request;
            16w0xd029: parse_srqs_hit_quote_request;
            16w0xcc29: parse_srqs_open_negotiation_request;
            16w0xd229: parse_srqs_update_deal_status_request;
            16w0xcd29: parse_srqs_update_negotiation_request;
            16w0x2927: parse_subscribe_request;
            16w0x1627: parse_unsubscribe_request;
            16w0x7429: parse_upload_tes_trade_request;
            16w0x2227: parse_user_login_request;
            16w0x2d27: parse_user_logout_request;
            default: accept;
        }
    }

    state parse_add_complex_instrument_request {
        packet.extract(hdr.add_complex_instrument_request);
        meta.dispatched = 1;
        meta.add_complex_instrument_request_instrmt_leg_grp_comp_remaining = hdr.add_complex_instrument_request.no_legs;
        transition select(meta.add_complex_instrument_request_instrmt_leg_grp_comp_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_request_instrmt_leg_grp_comp;
        }
    }

    state parse_add_complex_instrument_request_instrmt_leg_grp_comp {
        packet.extract(hdr.add_complex_instrument_request_instrmt_leg_grp_comp.next);
        meta.add_complex_instrument_request_instrmt_leg_grp_comp_remaining = meta.add_complex_instrument_request_instrmt_leg_grp_comp_remaining - 1;
        transition select(meta.add_complex_instrument_request_instrmt_leg_grp_comp_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_request_instrmt_leg_grp_comp;
        }
    }

    state parse_add_flexible_instrument_request {
        packet.extract(hdr.add_flexible_instrument_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_approve_tes_trade_request {
        packet.extract(hdr.approve_tes_trade_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cross_request {
        packet.extract(hdr.cross_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_order_request {
        packet.extract(hdr.delete_all_order_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_quote_request {
        packet.extract(hdr.delete_all_quote_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_complex_request {
        packet.extract(hdr.delete_order_complex_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_single_request {
        packet.extract(hdr.delete_order_single_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_tes_trade_request {
        packet.extract(hdr.delete_tes_trade_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_enter_tes_trade_request {
        packet.extract(hdr.enter_tes_trade_request);
        meta.dispatched = 1;
        meta.enter_tes_trade_request_side_alloc_grp_comp_remaining = hdr.enter_tes_trade_request.no_side_allocs;
        transition select(meta.enter_tes_trade_request_side_alloc_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_trd_instrmnt_leg_grp_comp;
            default: parse_enter_tes_trade_request_side_alloc_grp_comp;
        }
    }

    state parse_enter_tes_trade_request_side_alloc_grp_comp {
        packet.extract(hdr.enter_tes_trade_request_side_alloc_grp_comp.next);
        meta.enter_tes_trade_request_side_alloc_grp_comp_remaining = meta.enter_tes_trade_request_side_alloc_grp_comp_remaining - 1;
        transition select(meta.enter_tes_trade_request_side_alloc_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_trd_instrmnt_leg_grp_comp;
            default: parse_enter_tes_trade_request_side_alloc_grp_comp;
        }
    }

    state read_enter_tes_trade_request_trd_instrmnt_leg_grp_comp {
        meta.enter_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining = hdr.enter_tes_trade_request.no_legs;
        transition select(meta.enter_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_instrument_event_grp_comp;
            default: parse_enter_tes_trade_request_trd_instrmnt_leg_grp_comp;
        }
    }

    state parse_enter_tes_trade_request_trd_instrmnt_leg_grp_comp {
        packet.extract(hdr.enter_tes_trade_request_trd_instrmnt_leg_grp_comp.next);
        meta.enter_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining = meta.enter_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining - 1;
        transition select(meta.enter_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_instrument_event_grp_comp;
            default: parse_enter_tes_trade_request_trd_instrmnt_leg_grp_comp;
        }
    }

    state read_enter_tes_trade_request_instrument_event_grp_comp {
        meta.enter_tes_trade_request_instrument_event_grp_comp_remaining = hdr.enter_tes_trade_request.no_events;
        transition select(meta.enter_tes_trade_request_instrument_event_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_instrument_attribute_grp_comp;
            default: parse_enter_tes_trade_request_instrument_event_grp_comp;
        }
    }

    state parse_enter_tes_trade_request_instrument_event_grp_comp {
        packet.extract(hdr.enter_tes_trade_request_instrument_event_grp_comp.next);
        meta.enter_tes_trade_request_instrument_event_grp_comp_remaining = meta.enter_tes_trade_request_instrument_event_grp_comp_remaining - 1;
        transition select(meta.enter_tes_trade_request_instrument_event_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_instrument_attribute_grp_comp;
            default: parse_enter_tes_trade_request_instrument_event_grp_comp;
        }
    }

    state read_enter_tes_trade_request_instrument_attribute_grp_comp {
        meta.enter_tes_trade_request_instrument_attribute_grp_comp_remaining = hdr.enter_tes_trade_request.no_instr_attrib;
        transition select(meta.enter_tes_trade_request_instrument_attribute_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_underlying_stip_grp_comp;
            default: parse_enter_tes_trade_request_instrument_attribute_grp_comp;
        }
    }

    state parse_enter_tes_trade_request_instrument_attribute_grp_comp {
        packet.extract(hdr.enter_tes_trade_request_instrument_attribute_grp_comp.next);
        meta.enter_tes_trade_request_instrument_attribute_grp_comp_remaining = meta.enter_tes_trade_request_instrument_attribute_grp_comp_remaining - 1;
        transition select(meta.enter_tes_trade_request_instrument_attribute_grp_comp_remaining) {
            8w0: read_enter_tes_trade_request_underlying_stip_grp_comp;
            default: parse_enter_tes_trade_request_instrument_attribute_grp_comp;
        }
    }

    state read_enter_tes_trade_request_underlying_stip_grp_comp {
        meta.enter_tes_trade_request_underlying_stip_grp_comp_remaining = hdr.enter_tes_trade_request.no_underlying_stips;
        transition select(meta.enter_tes_trade_request_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_enter_tes_trade_request_underlying_stip_grp_comp;
        }
    }

    state parse_enter_tes_trade_request_underlying_stip_grp_comp {
        packet.extract(hdr.enter_tes_trade_request_underlying_stip_grp_comp.next);
        meta.enter_tes_trade_request_underlying_stip_grp_comp_remaining = meta.enter_tes_trade_request_underlying_stip_grp_comp_remaining - 1;
        transition select(meta.enter_tes_trade_request_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_enter_tes_trade_request_underlying_stip_grp_comp;
        }
    }

    state parse_gateway_request {
        packet.extract(hdr.gateway_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquire_enrichment_rule_id_list_request {
        packet.extract(hdr.inquire_enrichment_rule_id_list_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquire_mm_parameter_request {
        packet.extract(hdr.inquire_mm_parameter_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquire_session_list_request {
        packet.extract(hdr.inquire_session_list_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquire_user_request {
        packet.extract(hdr.inquire_user_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_request {
        packet.extract(hdr.logon_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mm_parameter_definition_request {
        packet.extract(hdr.mm_parameter_definition_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_request {
        packet.extract(hdr.mass_quote_request);
        meta.dispatched = 1;
        meta.mass_quote_request_quote_entry_grp_comp_remaining = hdr.mass_quote_request.no_quote_entries;
        transition select(meta.mass_quote_request_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_mass_quote_request_quote_entry_grp_comp;
        }
    }

    state parse_mass_quote_request_quote_entry_grp_comp {
        packet.extract(hdr.mass_quote_request_quote_entry_grp_comp.next);
        meta.mass_quote_request_quote_entry_grp_comp_remaining = meta.mass_quote_request_quote_entry_grp_comp_remaining - 1;
        transition select(meta.mass_quote_request_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_mass_quote_request_quote_entry_grp_comp;
        }
    }

    state parse_modify_order_complex_request {
        packet.extract(hdr.modify_order_complex_request);
        meta.dispatched = 1;
        meta.modify_order_complex_request_leg_ord_grp_comp_remaining = hdr.modify_order_complex_request.no_legs;
        transition select(meta.modify_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_modify_order_complex_request_leg_ord_grp_comp {
        packet.extract(hdr.modify_order_complex_request_leg_ord_grp_comp.next);
        meta.modify_order_complex_request_leg_ord_grp_comp_remaining = meta.modify_order_complex_request_leg_ord_grp_comp_remaining - 1;
        transition select(meta.modify_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_modify_order_complex_short_request {
        packet.extract(hdr.modify_order_complex_short_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_order_single_request {
        packet.extract(hdr.modify_order_single_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_order_single_short_request {
        packet.extract(hdr.modify_order_single_short_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_tes_trade_request {
        packet.extract(hdr.modify_tes_trade_request);
        meta.dispatched = 1;
        meta.modify_tes_trade_request_side_alloc_grp_comp_remaining = hdr.modify_tes_trade_request.no_side_allocs;
        transition select(meta.modify_tes_trade_request_side_alloc_grp_comp_remaining) {
            8w0: read_modify_tes_trade_request_trd_instrmnt_leg_grp_comp;
            default: parse_modify_tes_trade_request_side_alloc_grp_comp;
        }
    }

    state parse_modify_tes_trade_request_side_alloc_grp_comp {
        packet.extract(hdr.modify_tes_trade_request_side_alloc_grp_comp.next);
        meta.modify_tes_trade_request_side_alloc_grp_comp_remaining = meta.modify_tes_trade_request_side_alloc_grp_comp_remaining - 1;
        transition select(meta.modify_tes_trade_request_side_alloc_grp_comp_remaining) {
            8w0: read_modify_tes_trade_request_trd_instrmnt_leg_grp_comp;
            default: parse_modify_tes_trade_request_side_alloc_grp_comp;
        }
    }

    state read_modify_tes_trade_request_trd_instrmnt_leg_grp_comp {
        meta.modify_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining = hdr.modify_tes_trade_request.no_legs;
        transition select(meta.modify_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_tes_trade_request_trd_instrmnt_leg_grp_comp;
        }
    }

    state parse_modify_tes_trade_request_trd_instrmnt_leg_grp_comp {
        packet.extract(hdr.modify_tes_trade_request_trd_instrmnt_leg_grp_comp.next);
        meta.modify_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining = meta.modify_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining - 1;
        transition select(meta.modify_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_tes_trade_request_trd_instrmnt_leg_grp_comp;
        }
    }

    state parse_new_order_complex_request {
        packet.extract(hdr.new_order_complex_request);
        meta.dispatched = 1;
        meta.new_order_complex_request_leg_ord_grp_comp_remaining = hdr.new_order_complex_request.no_legs;
        transition select(meta.new_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_new_order_complex_request_leg_ord_grp_comp {
        packet.extract(hdr.new_order_complex_request_leg_ord_grp_comp.next);
        meta.new_order_complex_request_leg_ord_grp_comp_remaining = meta.new_order_complex_request_leg_ord_grp_comp_remaining - 1;
        transition select(meta.new_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_new_order_complex_short_request {
        packet.extract(hdr.new_order_complex_short_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_single_request {
        packet.extract(hdr.new_order_single_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_single_short_request {
        packet.extract(hdr.new_order_single_short_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_activation_request {
        packet.extract(hdr.quote_activation_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_request {
        packet.extract(hdr.rfq_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_me_message_request {
        packet.extract(hdr.retransmit_me_message_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_srqs_enter_quote_request {
        packet.extract(hdr.srqs_enter_quote_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_srqs_hit_quote_request {
        packet.extract(hdr.srqs_hit_quote_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_srqs_open_negotiation_request {
        packet.extract(hdr.srqs_open_negotiation_request);
        meta.dispatched = 1;
        meta.srqs_open_negotiation_request_quot_req_legs_grp_comp_remaining = hdr.srqs_open_negotiation_request.no_legs;
        transition select(meta.srqs_open_negotiation_request_quot_req_legs_grp_comp_remaining) {
            8w0: read_srqs_open_negotiation_request_target_parties_comp;
            default: parse_srqs_open_negotiation_request_quot_req_legs_grp_comp;
        }
    }

    state parse_srqs_open_negotiation_request_quot_req_legs_grp_comp {
        packet.extract(hdr.srqs_open_negotiation_request_quot_req_legs_grp_comp.next);
        meta.srqs_open_negotiation_request_quot_req_legs_grp_comp_remaining = meta.srqs_open_negotiation_request_quot_req_legs_grp_comp_remaining - 1;
        transition select(meta.srqs_open_negotiation_request_quot_req_legs_grp_comp_remaining) {
            8w0: read_srqs_open_negotiation_request_target_parties_comp;
            default: parse_srqs_open_negotiation_request_quot_req_legs_grp_comp;
        }
    }

    state read_srqs_open_negotiation_request_target_parties_comp {
        meta.srqs_open_negotiation_request_target_parties_comp_remaining = hdr.srqs_open_negotiation_request.no_target_party_i_ds;
        transition select(meta.srqs_open_negotiation_request_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_srqs_open_negotiation_request_target_parties_comp;
        }
    }

    state parse_srqs_open_negotiation_request_target_parties_comp {
        packet.extract(hdr.srqs_open_negotiation_request_target_parties_comp.next);
        meta.srqs_open_negotiation_request_target_parties_comp_remaining = meta.srqs_open_negotiation_request_target_parties_comp_remaining - 1;
        transition select(meta.srqs_open_negotiation_request_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_srqs_open_negotiation_request_target_parties_comp;
        }
    }

    state parse_srqs_update_deal_status_request {
        packet.extract(hdr.srqs_update_deal_status_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_srqs_update_negotiation_request {
        packet.extract(hdr.srqs_update_negotiation_request);
        meta.dispatched = 1;
        meta.srqs_update_negotiation_request_target_parties_comp_remaining = hdr.srqs_update_negotiation_request.no_target_party_i_ds;
        transition select(meta.srqs_update_negotiation_request_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_srqs_update_negotiation_request_target_parties_comp;
        }
    }

    state parse_srqs_update_negotiation_request_target_parties_comp {
        packet.extract(hdr.srqs_update_negotiation_request_target_parties_comp.next);
        meta.srqs_update_negotiation_request_target_parties_comp_remaining = meta.srqs_update_negotiation_request_target_parties_comp_remaining - 1;
        transition select(meta.srqs_update_negotiation_request_target_parties_comp_remaining) {
            8w0: accept;
            default: parse_srqs_update_negotiation_request_target_parties_comp;
        }
    }

    state parse_subscribe_request {
        packet.extract(hdr.subscribe_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_upload_tes_trade_request {
        packet.extract(hdr.upload_tes_trade_request);
        meta.dispatched = 1;
        meta.upload_tes_trade_request_side_alloc_ext_grp_comp_remaining = hdr.upload_tes_trade_request.no_side_allocs;
        transition select(meta.upload_tes_trade_request_side_alloc_ext_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_trd_instrmnt_leg_grp_comp;
            default: parse_upload_tes_trade_request_side_alloc_ext_grp_comp;
        }
    }

    state parse_upload_tes_trade_request_side_alloc_ext_grp_comp {
        packet.extract(hdr.upload_tes_trade_request_side_alloc_ext_grp_comp.next);
        meta.upload_tes_trade_request_side_alloc_ext_grp_comp_remaining = meta.upload_tes_trade_request_side_alloc_ext_grp_comp_remaining - 1;
        transition select(meta.upload_tes_trade_request_side_alloc_ext_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_trd_instrmnt_leg_grp_comp;
            default: parse_upload_tes_trade_request_side_alloc_ext_grp_comp;
        }
    }

    state read_upload_tes_trade_request_trd_instrmnt_leg_grp_comp {
        meta.upload_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining = hdr.upload_tes_trade_request.no_legs;
        transition select(meta.upload_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_instrument_event_grp_comp;
            default: parse_upload_tes_trade_request_trd_instrmnt_leg_grp_comp;
        }
    }

    state parse_upload_tes_trade_request_trd_instrmnt_leg_grp_comp {
        packet.extract(hdr.upload_tes_trade_request_trd_instrmnt_leg_grp_comp.next);
        meta.upload_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining = meta.upload_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining - 1;
        transition select(meta.upload_tes_trade_request_trd_instrmnt_leg_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_instrument_event_grp_comp;
            default: parse_upload_tes_trade_request_trd_instrmnt_leg_grp_comp;
        }
    }

    state read_upload_tes_trade_request_instrument_event_grp_comp {
        meta.upload_tes_trade_request_instrument_event_grp_comp_remaining = hdr.upload_tes_trade_request.no_events;
        transition select(meta.upload_tes_trade_request_instrument_event_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_instrument_attribute_grp_comp;
            default: parse_upload_tes_trade_request_instrument_event_grp_comp;
        }
    }

    state parse_upload_tes_trade_request_instrument_event_grp_comp {
        packet.extract(hdr.upload_tes_trade_request_instrument_event_grp_comp.next);
        meta.upload_tes_trade_request_instrument_event_grp_comp_remaining = meta.upload_tes_trade_request_instrument_event_grp_comp_remaining - 1;
        transition select(meta.upload_tes_trade_request_instrument_event_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_instrument_attribute_grp_comp;
            default: parse_upload_tes_trade_request_instrument_event_grp_comp;
        }
    }

    state read_upload_tes_trade_request_instrument_attribute_grp_comp {
        meta.upload_tes_trade_request_instrument_attribute_grp_comp_remaining = hdr.upload_tes_trade_request.no_instr_attrib;
        transition select(meta.upload_tes_trade_request_instrument_attribute_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_underlying_stip_grp_comp;
            default: parse_upload_tes_trade_request_instrument_attribute_grp_comp;
        }
    }

    state parse_upload_tes_trade_request_instrument_attribute_grp_comp {
        packet.extract(hdr.upload_tes_trade_request_instrument_attribute_grp_comp.next);
        meta.upload_tes_trade_request_instrument_attribute_grp_comp_remaining = meta.upload_tes_trade_request_instrument_attribute_grp_comp_remaining - 1;
        transition select(meta.upload_tes_trade_request_instrument_attribute_grp_comp_remaining) {
            8w0: read_upload_tes_trade_request_underlying_stip_grp_comp;
            default: parse_upload_tes_trade_request_instrument_attribute_grp_comp;
        }
    }

    state read_upload_tes_trade_request_underlying_stip_grp_comp {
        meta.upload_tes_trade_request_underlying_stip_grp_comp_remaining = hdr.upload_tes_trade_request.no_underlying_stips;
        transition select(meta.upload_tes_trade_request_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_upload_tes_trade_request_underlying_stip_grp_comp;
        }
    }

    state parse_upload_tes_trade_request_underlying_stip_grp_comp {
        packet.extract(hdr.upload_tes_trade_request_underlying_stip_grp_comp.next);
        meta.upload_tes_trade_request_underlying_stip_grp_comp_remaining = meta.upload_tes_trade_request_underlying_stip_grp_comp_remaining - 1;
        transition select(meta.upload_tes_trade_request_underlying_stip_grp_comp_remaining) {
            8w0: accept;
            default: parse_upload_tes_trade_request_underlying_stip_grp_comp;
        }
    }

    state parse_user_login_request {
        packet.extract(hdr.user_login_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
        meta.dispatched = 1;
        transition accept;
    }

}

control EurexT7EtiClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control EurexT7EtiClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EtiClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.add_complex_instrument_request);
        packet.emit(hdr.add_complex_instrument_request_instrmt_leg_grp_comp);
        packet.emit(hdr.add_flexible_instrument_request);
        packet.emit(hdr.approve_tes_trade_request);
        packet.emit(hdr.cross_request);
        packet.emit(hdr.delete_all_order_request);
        packet.emit(hdr.delete_all_quote_request);
        packet.emit(hdr.delete_order_complex_request);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.delete_tes_trade_request);
        packet.emit(hdr.enter_tes_trade_request);
        packet.emit(hdr.enter_tes_trade_request_side_alloc_grp_comp);
        packet.emit(hdr.enter_tes_trade_request_trd_instrmnt_leg_grp_comp);
        packet.emit(hdr.enter_tes_trade_request_instrument_event_grp_comp);
        packet.emit(hdr.enter_tes_trade_request_instrument_attribute_grp_comp);
        packet.emit(hdr.enter_tes_trade_request_underlying_stip_grp_comp);
        packet.emit(hdr.gateway_request);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.inquire_enrichment_rule_id_list_request);
        packet.emit(hdr.inquire_mm_parameter_request);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.inquire_user_request);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.mm_parameter_definition_request);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.mass_quote_request_quote_entry_grp_comp);
        packet.emit(hdr.modify_order_complex_request);
        packet.emit(hdr.modify_order_complex_request_leg_ord_grp_comp);
        packet.emit(hdr.modify_order_complex_short_request);
        packet.emit(hdr.modify_order_single_request);
        packet.emit(hdr.modify_order_single_short_request);
        packet.emit(hdr.modify_tes_trade_request);
        packet.emit(hdr.modify_tes_trade_request_side_alloc_grp_comp);
        packet.emit(hdr.modify_tes_trade_request_trd_instrmnt_leg_grp_comp);
        packet.emit(hdr.new_order_complex_request);
        packet.emit(hdr.new_order_complex_request_leg_ord_grp_comp);
        packet.emit(hdr.new_order_complex_short_request);
        packet.emit(hdr.new_order_single_request);
        packet.emit(hdr.new_order_single_short_request);
        packet.emit(hdr.quote_activation_request);
        packet.emit(hdr.rfq_request);
        packet.emit(hdr.retransmit_me_message_request);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.srqs_enter_quote_request);
        packet.emit(hdr.srqs_hit_quote_request);
        packet.emit(hdr.srqs_open_negotiation_request);
        packet.emit(hdr.srqs_open_negotiation_request_quot_req_legs_grp_comp);
        packet.emit(hdr.srqs_open_negotiation_request_target_parties_comp);
        packet.emit(hdr.srqs_update_deal_status_request);
        packet.emit(hdr.srqs_update_negotiation_request);
        packet.emit(hdr.srqs_update_negotiation_request_target_parties_comp);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.upload_tes_trade_request);
        packet.emit(hdr.upload_tes_trade_request_side_alloc_ext_grp_comp);
        packet.emit(hdr.upload_tes_trade_request_trd_instrmnt_leg_grp_comp);
        packet.emit(hdr.upload_tes_trade_request_instrument_event_grp_comp);
        packet.emit(hdr.upload_tes_trade_request_instrument_attribute_grp_comp);
        packet.emit(hdr.upload_tes_trade_request_underlying_stip_grp_comp);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_logout_request);
    }
}

V1Switch(
    EurexT7EtiClientParser(),
    EurexT7EtiClientVerifyChecksum(),
    EurexT7EtiClientIngress(),
    EurexT7EtiClientEgress(),
    EurexT7EtiClientComputeChecksum(),
    EurexT7EtiClientDeparser()
) main;
