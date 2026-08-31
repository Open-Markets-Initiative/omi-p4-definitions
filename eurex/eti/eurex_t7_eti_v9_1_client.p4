// P4_16 (v1model) definition for: Eurex T7 Eti Fbe v9.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 9.1
//   Date: 4/6/2021
//   Specification: T7_Enhanced_Trading_Interface_-_Derivatives_Message_Reference_v.9.0-D0001.pdf
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
    bit<8> pad1;
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
    bit<40> pad5;
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
    bit<160> basket_trade_report_text;
    bit<160> trade_report_id;
    bit<32> pad4;
    bit<16> root_party_sub_id_type;
    bit<40> root_party_contra_firm;
    bit<48> root_party_contra_trader;
    bit<160> basket_side_trade_report_id;
    bit<56> pad7;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> related_close_price;
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
    bit<32> pad4_2;
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
    bit<64> cum_qty;
    bit<64> delta;
    bit<64> vega;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> pct_count;
    bit<32> pad4;
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
    bit<8> no_legs;
    bit<40> pad5;
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5_2;
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
    bit<16> pad2v2;
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
    bit<56> pad7;
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
    bit<24> pad3;
}

header modify_tes_trade_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> last_px;
    bit<64> trans_bkd_time;
    bit<64> compression_id;
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
    bit<8> no_legs;
    bit<8> pad1;
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
    bit<16> pad2v2;
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
    bit<24> pad3;
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
    bit<24> pad3;
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
    bit<8> no_risk_limits_qty;
    bit<8> party_detail_status;
    bit<24> risk_limit_group;
    bit<40> party_detail_executing_unit;
    bit<8> pad1;
    bit<64> risk_limit_qty;
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
    bit<8> mass_action_sub_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<32> pad4;
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
    bit<32> related_market_segment_id;
    bit<16> trd_type;
    bit<160> trade_report_id;
    bit<1056> reversal_reason_text;
    bit<48> pad6;
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
    bit<64> quote_id;
    bit<64> order_qty;
    bit<64> valid_until_time;
    bit<64> underlying_qty;
    bit<64> underlying_price_stip_value;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> negotiation_id;
    bit<8> side;
    bit<8> order_attribute_liquidity_provision;
    bit<8> executing_trader_qualifier;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> trading_capacity;
    bit<8> trade_publish_indicator;
    bit<8> order_origination;
    bit<8> hedging_instruction;
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
    bit<16> pad2v2;
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
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
    bit<160> quote_req_id;
    bit<1056> party_order_origination_trader;
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
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> party_detail_status;
    bit<8> party_detail_status_information;
    bit<56> pad7;
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
    bit<8> quote_cancel_type;
    bit<8> show_last_deal_on_closure;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<1056> free_text_5;
    bit<1056> party_order_origination_trader;
    bit<32> target_party_id_executing_trader;
    bit<8> side_disclosure_instruction;
    bit<8> price_disclosure_instruction;
    bit<8> leaves_qty_disclosure_instruction;
    bit<8> last_px_disclosure_instruction;
    bit<8> last_qty_disclosure_instruction;
    bit<8> free_text_5_disclosure_instruction;
    bit<8> party_order_origination_disclosure_instruction;
    bit<8> quote_instruction;
    bit<40> target_party_executing_firm;
    bit<48> target_party_executing_trader;
    bit<8> party_detail_status;
    bit<8> party_detail_status_information;
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
    bit<8> pad1;
    bit<64> alloc_qty;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> individual_alloc_id;
    bit<40> party_executing_firm;
    bit<48> party_executing_trader;
    bit<8> pad1_2;
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
    bit<8> pad1_3;
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
}

struct headers_t {
    message_header_t message_header;
    add_complex_instrument_request_t add_complex_instrument_request;
    add_flexible_instrument_request_t add_flexible_instrument_request;
    amend_basket_trade_request_t amend_basket_trade_request;
    approve_basket_trade_request_t approve_basket_trade_request;
    approve_reverse_tes_trade_request_t approve_reverse_tes_trade_request;
    approve_tes_trade_request_t approve_tes_trade_request;
    cross_request_t cross_request;
    delete_all_order_request_t delete_all_order_request;
    delete_all_quote_request_t delete_all_quote_request;
    delete_basket_trade_request_t delete_basket_trade_request;
    delete_clip_request_t delete_clip_request;
    delete_order_complex_request_t delete_order_complex_request;
    delete_order_single_request_t delete_order_single_request;
    delete_tes_trade_request_t delete_tes_trade_request;
    enter_basket_trade_request_t enter_basket_trade_request;
    enter_clip_request_t enter_clip_request;
    enter_tes_trade_request_t enter_tes_trade_request;
    heartbeat_t heartbeat;
    inquire_enrichment_rule_id_list_request_t inquire_enrichment_rule_id_list_request;
    inquire_mm_parameter_request_t inquire_mm_parameter_request;
    inquire_pre_trade_risk_limits_request_t inquire_pre_trade_risk_limits_request;
    inquire_session_list_request_t inquire_session_list_request;
    inquire_user_request_t inquire_user_request;
    logon_request_t logon_request;
    logout_request_t logout_request;
    mm_parameter_definition_request_t mm_parameter_definition_request;
    mass_quote_request_t mass_quote_request;
    modify_basket_trade_request_t modify_basket_trade_request;
    modify_order_complex_request_t modify_order_complex_request;
    modify_order_complex_short_request_t modify_order_complex_short_request;
    modify_order_single_request_t modify_order_single_request;
    modify_order_single_short_request_t modify_order_single_short_request;
    modify_tes_trade_request_t modify_tes_trade_request;
    new_order_complex_request_t new_order_complex_request;
    new_order_complex_short_request_t new_order_complex_short_request;
    new_order_single_request_t new_order_single_request;
    new_order_single_short_request_t new_order_single_short_request;
    ping_request_t ping_request;
    pre_trade_risk_limits_definition_request_t pre_trade_risk_limits_definition_request;
    quote_activation_request_t quote_activation_request;
    rfq_request_t rfq_request;
    retransmit_me_message_request_t retransmit_me_message_request;
    retransmit_request_t retransmit_request;
    reverse_tes_trade_request_t reverse_tes_trade_request;
    srqs_enter_quote_request_t srqs_enter_quote_request;
    srqs_hit_quote_request_t srqs_hit_quote_request;
    srqs_inquire_smart_respondent_request_t srqs_inquire_smart_respondent_request;
    srqs_open_negotiation_request_t srqs_open_negotiation_request;
    srqs_quoting_status_request_t srqs_quoting_status_request;
    srqs_update_deal_status_request_t srqs_update_deal_status_request;
    srqs_update_negotiation_request_t srqs_update_negotiation_request;
    subscribe_request_t subscribe_request;
    tes_compression_run_status_request_t tes_compression_run_status_request;
    unsubscribe_request_t unsubscribe_request;
    upload_tes_trade_request_t upload_tes_trade_request;
    user_login_request_t user_login_request;
    user_logout_request_t user_logout_request;
}

parser EurexT7EtiClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10301: parse_add_complex_instrument_request;
            16w10309: parse_add_flexible_instrument_request;
            16w10629: parse_amend_basket_trade_request;
            16w10623: parse_approve_basket_trade_request;
            16w10631: parse_approve_reverse_tes_trade_request;
            16w10603: parse_approve_tes_trade_request;
            16w10118: parse_cross_request;
            16w10120: parse_delete_all_order_request;
            16w10408: parse_delete_all_quote_request;
            16w10622: parse_delete_basket_trade_request;
            16w10132: parse_delete_clip_request;
            16w10123: parse_delete_order_complex_request;
            16w10109: parse_delete_order_single_request;
            16w10602: parse_delete_tes_trade_request;
            16w10620: parse_enter_basket_trade_request;
            16w10131: parse_enter_clip_request;
            16w10600: parse_enter_tes_trade_request;
            16w10011: parse_heartbeat;
            16w10040: parse_inquire_enrichment_rule_id_list_request;
            16w10305: parse_inquire_mm_parameter_request;
            16w10311: parse_inquire_pre_trade_risk_limits_request;
            16w10035: parse_inquire_session_list_request;
            16w10038: parse_inquire_user_request;
            16w10000: parse_logon_request;
            16w10002: parse_logout_request;
            16w10303: parse_mm_parameter_definition_request;
            16w10405: parse_mass_quote_request;
            16w10621: parse_modify_basket_trade_request;
            16w10114: parse_modify_order_complex_request;
            16w10130: parse_modify_order_complex_short_request;
            16w10106: parse_modify_order_single_request;
            16w10126: parse_modify_order_single_short_request;
            16w10601: parse_modify_tes_trade_request;
            16w10113: parse_new_order_complex_request;
            16w10129: parse_new_order_complex_short_request;
            16w10100: parse_new_order_single_request;
            16w10125: parse_new_order_single_short_request;
            16w10320: parse_ping_request;
            16w10312: parse_pre_trade_risk_limits_definition_request;
            16w10403: parse_quote_activation_request;
            16w10401: parse_rfq_request;
            16w10026: parse_retransmit_me_message_request;
            16w10008: parse_retransmit_request;
            16w10630: parse_reverse_tes_trade_request;
            16w10702: parse_srqs_enter_quote_request;
            16w10704: parse_srqs_hit_quote_request;
            16w10718: parse_srqs_inquire_smart_respondent_request;
            16w10700: parse_srqs_open_negotiation_request;
            16w10717: parse_srqs_quoting_status_request;
            16w10706: parse_srqs_update_deal_status_request;
            16w10701: parse_srqs_update_negotiation_request;
            16w10025: parse_subscribe_request;
            16w10616: parse_tes_compression_run_status_request;
            16w10006: parse_unsubscribe_request;
            16w10612: parse_upload_tes_trade_request;
            16w10018: parse_user_login_request;
            16w10029: parse_user_logout_request;
            default: accept;
        }
    }

    state parse_add_complex_instrument_request {
        packet.extract(hdr.add_complex_instrument_request);
        transition accept;
    }

    state parse_add_flexible_instrument_request {
        packet.extract(hdr.add_flexible_instrument_request);
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

    state parse_delete_basket_trade_request {
        packet.extract(hdr.delete_basket_trade_request);
        transition accept;
    }

    state parse_delete_clip_request {
        packet.extract(hdr.delete_clip_request);
        transition accept;
    }

    state parse_delete_order_complex_request {
        packet.extract(hdr.delete_order_complex_request);
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

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        transition accept;
    }

    state parse_inquire_enrichment_rule_id_list_request {
        packet.extract(hdr.inquire_enrichment_rule_id_list_request);
        transition accept;
    }

    state parse_inquire_mm_parameter_request {
        packet.extract(hdr.inquire_mm_parameter_request);
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

    state parse_logon_request {
        packet.extract(hdr.logon_request);
        transition accept;
    }

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        transition accept;
    }

    state parse_mm_parameter_definition_request {
        packet.extract(hdr.mm_parameter_definition_request);
        transition accept;
    }

    state parse_mass_quote_request {
        packet.extract(hdr.mass_quote_request);
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

    state parse_new_order_single_request {
        packet.extract(hdr.new_order_single_request);
        transition accept;
    }

    state parse_new_order_single_short_request {
        packet.extract(hdr.new_order_single_short_request);
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

    state parse_srqs_open_negotiation_request {
        packet.extract(hdr.srqs_open_negotiation_request);
        transition accept;
    }

    state parse_srqs_quoting_status_request {
        packet.extract(hdr.srqs_quoting_status_request);
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

    state parse_subscribe_request {
        packet.extract(hdr.subscribe_request);
        transition accept;
    }

    state parse_tes_compression_run_status_request {
        packet.extract(hdr.tes_compression_run_status_request);
        transition accept;
    }

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
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

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
        transition accept;
    }

}

control EurexT7EtiClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EtiClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
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
        packet.emit(hdr.add_flexible_instrument_request);
        packet.emit(hdr.amend_basket_trade_request);
        packet.emit(hdr.approve_basket_trade_request);
        packet.emit(hdr.approve_reverse_tes_trade_request);
        packet.emit(hdr.approve_tes_trade_request);
        packet.emit(hdr.cross_request);
        packet.emit(hdr.delete_all_order_request);
        packet.emit(hdr.delete_all_quote_request);
        packet.emit(hdr.delete_basket_trade_request);
        packet.emit(hdr.delete_clip_request);
        packet.emit(hdr.delete_order_complex_request);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.delete_tes_trade_request);
        packet.emit(hdr.enter_basket_trade_request);
        packet.emit(hdr.enter_clip_request);
        packet.emit(hdr.enter_tes_trade_request);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.inquire_enrichment_rule_id_list_request);
        packet.emit(hdr.inquire_mm_parameter_request);
        packet.emit(hdr.inquire_pre_trade_risk_limits_request);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.inquire_user_request);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.mm_parameter_definition_request);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.modify_basket_trade_request);
        packet.emit(hdr.modify_order_complex_request);
        packet.emit(hdr.modify_order_complex_short_request);
        packet.emit(hdr.modify_order_single_request);
        packet.emit(hdr.modify_order_single_short_request);
        packet.emit(hdr.modify_tes_trade_request);
        packet.emit(hdr.new_order_complex_request);
        packet.emit(hdr.new_order_complex_short_request);
        packet.emit(hdr.new_order_single_request);
        packet.emit(hdr.new_order_single_short_request);
        packet.emit(hdr.ping_request);
        packet.emit(hdr.pre_trade_risk_limits_definition_request);
        packet.emit(hdr.quote_activation_request);
        packet.emit(hdr.rfq_request);
        packet.emit(hdr.retransmit_me_message_request);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.reverse_tes_trade_request);
        packet.emit(hdr.srqs_enter_quote_request);
        packet.emit(hdr.srqs_hit_quote_request);
        packet.emit(hdr.srqs_inquire_smart_respondent_request);
        packet.emit(hdr.srqs_open_negotiation_request);
        packet.emit(hdr.srqs_quoting_status_request);
        packet.emit(hdr.srqs_update_deal_status_request);
        packet.emit(hdr.srqs_update_negotiation_request);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.tes_compression_run_status_request);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.upload_tes_trade_request);
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
