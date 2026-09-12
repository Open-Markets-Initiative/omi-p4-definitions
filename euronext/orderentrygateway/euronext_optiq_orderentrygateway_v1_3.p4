// P4_16 (v1model) definition for: Euronext Optiq OrderEntryGateway Sbe v1.3
// 
// Protocol:
//   Organization: Euronext
//   Protocol: Order Entry Gateway
//   Encoding: Simple Binary Encoding
//   Version: 1.3
//   Date: 8/20/2020
//   Specification: Unknown
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
    bit<16> frame;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header new_order_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<64> order_px;
    bit<64> order_qty;
    bit<32> execution_within_firm_short_code;
    bit<8> trading_capacity;
    bit<8> account_type;
    bit<8> lp_role_optional;
    bit<2> reserved_2;
    bit<1> rfq_confirmation;
    bit<1> rfq_answer;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> disclosed_quantity_randomization;
    bit<1> stp_incoming_order;
    bit<1> stp_resting_order;
    bit<3> reserved_3;
    bit<1> minimum_quantity_type;
    bit<1> sweep_order_indicator;
    bit<1> displayed_order_interaction;
    bit<1> deferred_trade_indicator;
    bit<1> dark_indicator;
    bit<3> reserved_3_2;
    bit<1> deferral_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> execution_algo_indicator;
    bit<1> investment_algo_indicator;
    bit<1> dea_indicator;
    bit<16> stpid;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header new_order_message_new_order_message_free_text_section_group_t {
    bit<144> free_text;
}

header new_order_message_mifid_short_codes_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header new_order_message_mifid_short_codes_group_t {
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
}

header new_order_message_order_optional_fields_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header new_order_message_order_optional_fields_group_t {
    bit<64> stop_px;
    bit<64> undisclosed_price;
    bit<64> disclosed_qty;
    bit<64> min_order_qty;
    bit<64> quote_req_id_optional;
    bit<32> order_expiration_time;
    bit<16> order_expiration_date;
    bit<8> peg_offset;
    bit<4> reserved_4;
    bit<1> session_3;
    bit<1> session_2;
    bit<1> session_1;
    bit<1> unused_trading_session_validityset_0;
    bit<8> undisclosed_iceberg_type;
    bit<8> stop_triggered_time_in_force;
}

header new_order_message_order_clearing_fields_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header new_order_message_order_clearing_fields_group_t {
    bit<64> clearing_firm_id;
    bit<64> client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<6> reserved_6;
    bit<1> leg_9;
    bit<1> leg_8;
    bit<1> leg_7;
    bit<1> leg_6;
    bit<1> leg_5;
    bit<1> leg_4;
    bit<1> leg_3;
    bit<1> leg_2;
    bit<1> leg_1;
    bit<1> field_actively_used;
    bit<16> clearing_instruction;
    bit<8> account_type_cross;
}

header ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id_optional;
    bit<64> orig_client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side_optional;
    bit<8> ack_type;
    bit<8> ack_phase;
    bit<64> order_id_optional;
    bit<64> order_priority;
    bit<64> order_px;
    bit<64> order_qty_optional;
    bit<6> reserved_6;
    bit<1> queue_indicator;
    bit<1> dark_indicator;
}

header fill_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> trade_time;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id_optional;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> trade_type;
    bit<1> unused_trade_qualifierset_7;
    bit<1> nav_trade_expressed_in_price_currency;
    bit<1> nav_trade_expressed_in_bps;
    bit<1> trade_creation_by_market_operations;
    bit<1> aggressive_order;
    bit<1> passive_order;
    bit<1> first_trade_price;
    bit<1> uncrossing_trade;
    bit<64> order_id;
    bit<64> last_traded_px;
    bit<64> last_shares;
    bit<64> leaves_qty;
    bit<32> execution_id;
    bit<8> execution_phase;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header fill_message_fill_optional_field_group_t {
    bit<64> counterpart_firm_id;
    bit<64> other_leg_last_px;
    bit<96> package_id;
    bit<32> underlying_instrument_id;
}

header fill_message_fill_strategy_field_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header fill_message_fill_strategy_field_group_t {
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_instrument_id;
    bit<8> leg_side;
}

header kill_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id_optional;
    bit<64> orig_client_order_id;
    bit<64> order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<16> kill_reason;
}

header cancel_replace_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<64> order_id_optional;
    bit<64> orig_client_order_id;
    bit<64> order_px;
    bit<64> order_qty;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> account_type_optional;
    bit<8> lp_role_optional;
    bit<2> reserved_2;
    bit<1> rfq_confirmation;
    bit<1> rfq_answer;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> disclosed_quantity_randomization;
    bit<1> stp_incoming_order;
    bit<1> stp_resting_order;
    bit<3> reserved_3;
    bit<1> minimum_quantity_type;
    bit<1> sweep_order_indicator;
    bit<1> displayed_order_interaction;
    bit<1> deferred_trade_indicator;
    bit<1> dark_indicator;
    bit<3> reserved_3_2;
    bit<1> deferral_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> execution_algo_indicator;
    bit<1> investment_algo_indicator;
    bit<1> dea_indicator;
    bit<16> stpid;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header cancel_replace_message_new_order_message_free_text_section_group_t {
    bit<144> free_text;
}

header cancel_replace_message_cancel_replace_optional_field_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header cancel_replace_message_cancel_replace_optional_field_group_t {
    bit<64> stop_px;
    bit<8> peg_offset;
    bit<64> undisclosed_price;
    bit<64> disclosed_qty;
    bit<32> order_expiration_time;
    bit<16> order_expiration_date;
    bit<4> reserved_4;
    bit<1> session_3;
    bit<1> session_2;
    bit<1> session_1;
    bit<1> unused_trading_session_validityset_0;
    bit<8> stop_triggered_time_in_force;
    bit<8> undisclosed_iceberg_type;
}

header cancel_replace_message_cancel_replace_clearing_fields_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header cancel_replace_message_cancel_replace_clearing_fields_group_t {
    bit<64> clearing_firm_id;
    bit<64> client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<6> reserved_6;
    bit<1> leg_9;
    bit<1> leg_8;
    bit<1> leg_7;
    bit<1> leg_6;
    bit<1> leg_5;
    bit<1> leg_4;
    bit<1> leg_3;
    bit<1> leg_2;
    bit<1> leg_1;
    bit<1> field_actively_used;
    bit<16> clearing_instruction;
}

header reject_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id_optional;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in_optional;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id_optional;
    bit<64> order_id_optional;
    bit<32> symbol_index_optional;
    bit<8> emm_optional;
    bit<8> rejected_message;
    bit<16> error_code;
    bit<16> rejected_message_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header reject_message_collar_fields_group_t {
    bit<8> collar_rej_type;
    bit<64> breached_collar_price;
}

header quotes_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> execution_within_firm_short_code;
    bit<8> trading_capacity;
    bit<8> account_type;
    bit<8> lp_role;
    bit<3> reserved_3;
    bit<1> deferral_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> execution_algo_indicator;
    bit<1> investment_algo_indicator;
    bit<1> dea_indicator;
    bit<8> rfe_answer;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header quotes_message_mifid_short_codes_group_t {
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
}

header quotes_message_clearing_dataset_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header quotes_message_clearing_dataset_group_t {
    bit<64> clearing_firm_id;
    bit<64> client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<6> reserved_6;
    bit<1> leg_9;
    bit<1> leg_8;
    bit<1> leg_7;
    bit<1> leg_6;
    bit<1> leg_5;
    bit<1> leg_4;
    bit<1> leg_3;
    bit<1> leg_2;
    bit<1> leg_1;
    bit<1> field_actively_used;
    bit<16> clearing_instruction;
    bit<144> free_text;
}

header quotes_message_quotes_rep_group_header_t {
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header quotes_message_quotes_rep_group_t {
    bit<64> bid_size;
    bit<64> bid_px;
    bit<64> offer_size;
    bit<64> offer_px;
    bit<32> symbol_index;
    bit<8> emm;
}

header quote_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id;
    bit<8> account_type;
    bit<8> lp_role;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header quote_ack_message_quote_acks_group_t {
    bit<64> bid_order_id;
    bit<64> offer_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> buy_revision_flag;
    bit<8> sell_revision_flag;
    bit<16> bid_error_code;
    bit<16> offer_error_code;
}

header quote_request_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<64> order_qty;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side_optional;
    bit<8> firm_id_publication;
    bit<88> end_client;
}

header cancel_request_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<64> order_id_optional;
    bit<64> orig_client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> order_type;
}

header mass_cancel_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<32> symbol_index_optional;
    bit<8> emm_optional;
    bit<16> instrument_group_code;
    bit<8> side_optional;
    bit<32> lp_role_optional;
    bit<16> oe_partition_id_optional;
    bit<32> contract_id;
    bit<64> maturity;
    bit<8> account_type_optional;
    bit<8> option_type;
}

header mass_cancel_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in;
    bit<64> book_out_time;
    bit<64> oeg_in_from_me;
    bit<64> oeg_out_to_member;
    bit<64> client_order_id;
    bit<32> total_affected_orders;
    bit<32> symbol_index_optional;
    bit<8> emm_optional;
    bit<16> instrument_group_code;
    bit<8> side_optional;
    bit<32> lp_role_optional;
    bit<16> oe_partition_id_optional;
    bit<32> contract_id;
    bit<64> maturity;
    bit<8> account_type_optional;
    bit<8> option_type;
}

header open_order_request_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<64> order_id_optional;
    bit<64> orig_client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
}

header ownership_request_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> client_order_id;
    bit<64> order_id_optional;
    bit<32> symbol_index;
    bit<32> lp_role_optional;
    bit<16> oe_partition_id_optional;
    bit<32> total_affected_orders;
}

header ownership_request_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<64> order_id_optional;
    bit<64> orig_client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<32> lp_role_optional;
    bit<16> oe_partition_id_optional;
}

header trade_bust_notification_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<32> symbol_index;
    bit<8> emm;
    bit<32> execution_id;
    bit<64> last_traded_px;
    bit<64> last_shares;
}

header collar_breach_confirmation_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> order_id_optional;
    bit<64> orig_client_order_id;
}

header price_input_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> input_price_type;
    bit<64> price_optional;
}

header liquidity_provider_command_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> lp_action_code;
}

header ask_for_quote_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> afq_reason;
}

header request_for_execution_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<32> symbol_index;
    bit<8> emm;
}

header rfq_notification_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> quote_req_id;
    bit<64> order_qty;
    bit<64> counterpart_firm_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> rfq_update_type;
    bit<8> side_optional;
    bit<88> end_client;
}

header rfq_matching_status_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> quote_req_id;
    bit<64> potential_matching_px;
    bit<64> potential_matching_qty;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> number_of_lps;
    bit<8> recipient_type;
}

header user_notification_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<32> execution_within_firm_short_code_optional;
    bit<32> client_identification_shortcode;
    bit<64> family_id;
    bit<32> symbol_index_optional;
    bit<8> user_status;
}

header declaration_entry_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<8> operation_type;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> entering_counterparty;
    bit<8> side;
    bit<64> quantity;
    bit<64> price_optional;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<32> mi_cof_secondary_listing;
    bit<80> centralisation_date;
    bit<64> clearing_firm_id;
    bit<8> account_type;
    bit<8> account_type_cross;
    bit<8> trading_capacity;
    bit<8> trading_capacity_cross;
    bit<8> settlement_period;
    bit<8> settlement_flag;
    bit<8> guarantee_flag;
    bit<3> reserved_3;
    bit<1> deferral_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> execution_algo_indicator;
    bit<1> investment_algo_indicator;
    bit<1> dea_indicator;
    bit<8> transaction_price_type;
    bit<64> principal_code;
    bit<64> principal_code_cross;
    bit<32> start_time_vwap;
    bit<32> end_time_vwap;
    bit<64> gross_trade_amount;
    bit<96> account_number;
    bit<96> account_number_cross;
    bit<144> free_text;
    bit<144> free_text_cross;
    bit<32> investment_decision_w_firm_short_code;
    bit<32> client_identification_short_code_cross;
}

header declaration_entry_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> declaration_id_optional;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<32> mi_cof_secondary_listing;
    bit<8> operation_type;
    bit<8> pre_matching_type;
    bit<1> omf;
    bit<1> ilqd;
    bit<1> size;
    bit<1> pric;
    bit<1> oilq;
    bit<1> nliq;
    bit<1> rfpt;
    bit<1> lrgs;
}

header declaration_notice_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> client_order_id_optional;
    bit<64> declaration_id;
    bit<8> declaration_status;
    bit<8> operation_type;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> entering_counterparty;
    bit<8> side_optional;
    bit<64> quantity;
    bit<64> price_optional;
    bit<8> pre_matching_type;
    bit<64> trade_time_optional;
    bit<32> mi_cof_secondary_listing;
    bit<80> centralisation_date;
    bit<64> clearing_firm_id;
    bit<8> account_type_optional;
    bit<8> account_type_cross;
    bit<8> trading_capacity_optional;
    bit<8> trading_capacity_cross;
    bit<8> settlement_flag_optional;
    bit<8> settlement_period_optional;
    bit<8> guarantee_flag_optional;
    bit<8> transaction_price_type;
    bit<64> principal_code;
    bit<64> principal_code_cross;
    bit<32> start_time_vwap;
    bit<32> end_time_vwap;
    bit<64> gross_trade_amount;
    bit<96> account_number;
    bit<96> account_number_cross;
    bit<144> free_text;
    bit<144> free_text_cross;
    bit<1> omf;
    bit<1> ilqd;
    bit<1> size;
    bit<1> pric;
    bit<1> oilq;
    bit<1> nliq;
    bit<1> rfpt;
    bit<1> lrgs;
    bit<8> previous_day_indicator;
    bit<64> miscellaneous_fee_amount;
}

header declaration_cancel_and_refusal_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> declaration_id;
    bit<8> action_type;
}

header fund_price_input_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> price;
    bit<8> bypass_indicator;
}

header fund_price_input_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> price;
    bit<8> bypass_indicator;
}

header declaration_entry_reject_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm_optional;
    bit<32> mi_cof_secondary_listing;
    bit<8> operation_type;
    bit<16> error_code;
    bit<8> rejected_message;
    bit<16> rejected_message_id;
}

header instrument_synchronization_list_message_t {
    bit<32> msg_seq_num;
    bit<64> oeg_out_to_member_optional;
    bit<16> resynchronization_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header instrument_synchronization_list_message_instrument_synchronization_group_t {
    bit<32> symbol_index;
    bit<8> emm;
}

header synchronization_time_message_t {
    bit<32> msg_seq_num;
    bit<64> oeg_out_to_member_optional;
    bit<16> resynchronization_id;
    bit<64> last_book_in_time;
}

header logon_message_t {
    bit<32> logical_access_id;
    bit<16> oe_partition_id;
    bit<32> last_msg_seq_num_optional;
    bit<64> software_provider;
    bit<8> queueing_indicator;
}

header logon_ack_message_t {
    bit<64> exchange_id;
    bit<32> last_cl_msg_seq_num;
}

header logon_reject_message_t {
    bit<64> exchange_id;
    bit<8> logon_reject_code;
    bit<32> last_cl_msg_seq_num;
    bit<32> last_msg_seq_num;
}

header logout_message_t {
    bit<8> log_out_reason_code;
}

header technical_reject_message_t {
    bit<64> oeg_out_to_member_optional;
    bit<32> rejected_client_message_sequence_number;
    bit<8> rejected_message;
    bit<16> error_code;
    bit<16> rejected_message_id;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> new_order_message_new_order_message_free_text_section_group_remaining;
    bit<8> new_order_message_mifid_short_codes_group_remaining;
    bit<8> new_order_message_order_optional_fields_group_remaining;
    bit<8> new_order_message_order_clearing_fields_group_remaining;
    bit<8> fill_message_fill_optional_field_group_remaining;
    bit<8> fill_message_fill_strategy_field_group_remaining;
    bit<8> cancel_replace_message_new_order_message_free_text_section_group_remaining;
    bit<8> cancel_replace_message_cancel_replace_optional_field_group_remaining;
    bit<8> cancel_replace_message_cancel_replace_clearing_fields_group_remaining;
    bit<8> reject_message_collar_fields_group_remaining;
    bit<8> quotes_message_mifid_short_codes_group_remaining;
    bit<8> quotes_message_clearing_dataset_group_remaining;
    bit<8> quotes_message_quotes_rep_group_remaining;
    bit<8> quote_ack_message_quote_acks_group_remaining;
    bit<8> instrument_synchronization_list_message_instrument_synchronization_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    new_order_message_t new_order_message;
    new_order_message_new_order_message_free_text_section_group_t new_order_message_new_order_message_free_text_section_group[MAX_MESSAGES];
    new_order_message_mifid_short_codes_group_header_t new_order_message_mifid_short_codes_group_header;
    new_order_message_mifid_short_codes_group_t new_order_message_mifid_short_codes_group[MAX_MESSAGES];
    new_order_message_order_optional_fields_group_header_t new_order_message_order_optional_fields_group_header;
    new_order_message_order_optional_fields_group_t new_order_message_order_optional_fields_group[MAX_MESSAGES];
    new_order_message_order_clearing_fields_group_header_t new_order_message_order_clearing_fields_group_header;
    new_order_message_order_clearing_fields_group_t new_order_message_order_clearing_fields_group[MAX_MESSAGES];
    ack_message_t ack_message;
    fill_message_t fill_message;
    fill_message_fill_optional_field_group_t fill_message_fill_optional_field_group[MAX_MESSAGES];
    fill_message_fill_strategy_field_group_header_t fill_message_fill_strategy_field_group_header;
    fill_message_fill_strategy_field_group_t fill_message_fill_strategy_field_group[MAX_MESSAGES];
    kill_message_t kill_message;
    cancel_replace_message_t cancel_replace_message;
    cancel_replace_message_new_order_message_free_text_section_group_t cancel_replace_message_new_order_message_free_text_section_group[MAX_MESSAGES];
    cancel_replace_message_cancel_replace_optional_field_group_header_t cancel_replace_message_cancel_replace_optional_field_group_header;
    cancel_replace_message_cancel_replace_optional_field_group_t cancel_replace_message_cancel_replace_optional_field_group[MAX_MESSAGES];
    cancel_replace_message_cancel_replace_clearing_fields_group_header_t cancel_replace_message_cancel_replace_clearing_fields_group_header;
    cancel_replace_message_cancel_replace_clearing_fields_group_t cancel_replace_message_cancel_replace_clearing_fields_group[MAX_MESSAGES];
    reject_message_t reject_message;
    reject_message_collar_fields_group_t reject_message_collar_fields_group[MAX_MESSAGES];
    quotes_message_t quotes_message;
    quotes_message_mifid_short_codes_group_t quotes_message_mifid_short_codes_group[MAX_MESSAGES];
    quotes_message_clearing_dataset_group_header_t quotes_message_clearing_dataset_group_header;
    quotes_message_clearing_dataset_group_t quotes_message_clearing_dataset_group[MAX_MESSAGES];
    quotes_message_quotes_rep_group_header_t quotes_message_quotes_rep_group_header;
    quotes_message_quotes_rep_group_t quotes_message_quotes_rep_group[MAX_MESSAGES];
    quote_ack_message_t quote_ack_message;
    quote_ack_message_quote_acks_group_t quote_ack_message_quote_acks_group[MAX_MESSAGES];
    quote_request_message_t quote_request_message;
    cancel_request_message_t cancel_request_message;
    mass_cancel_message_t mass_cancel_message;
    mass_cancel_ack_message_t mass_cancel_ack_message;
    open_order_request_message_t open_order_request_message;
    ownership_request_ack_message_t ownership_request_ack_message;
    ownership_request_message_t ownership_request_message;
    trade_bust_notification_message_t trade_bust_notification_message;
    collar_breach_confirmation_message_t collar_breach_confirmation_message;
    price_input_message_t price_input_message;
    liquidity_provider_command_message_t liquidity_provider_command_message;
    ask_for_quote_message_t ask_for_quote_message;
    request_for_execution_message_t request_for_execution_message;
    rfq_notification_message_t rfq_notification_message;
    rfq_matching_status_message_t rfq_matching_status_message;
    user_notification_message_t user_notification_message;
    declaration_entry_message_t declaration_entry_message;
    declaration_entry_ack_message_t declaration_entry_ack_message;
    declaration_notice_message_t declaration_notice_message;
    declaration_cancel_and_refusal_message_t declaration_cancel_and_refusal_message;
    fund_price_input_message_t fund_price_input_message;
    fund_price_input_ack_message_t fund_price_input_ack_message;
    declaration_entry_reject_message_t declaration_entry_reject_message;
    instrument_synchronization_list_message_t instrument_synchronization_list_message;
    instrument_synchronization_list_message_instrument_synchronization_group_t instrument_synchronization_list_message_instrument_synchronization_group[MAX_MESSAGES];
    synchronization_time_message_t synchronization_time_message;
    logon_message_t logon_message;
    logon_ack_message_t logon_ack_message;
    logon_reject_message_t logon_reject_message;
    logout_message_t logout_message;
    technical_reject_message_t technical_reject_message;
}

parser EuronextOptiqOrderentrygatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x100: parse_new_order_message;
            16w0x300: parse_ack_message;
            16w0x400: parse_fill_message;
            16w0x500: parse_kill_message;
            16w0x600: parse_cancel_replace_message;
            16w0x700: parse_reject_message;
            16w0x800: parse_quotes_message;
            16w0x900: parse_quote_ack_message;
            16w0xa00: parse_quote_request_message;
            16w0xc00: parse_cancel_request_message;
            16w0xd00: parse_mass_cancel_message;
            16w0xe00: parse_mass_cancel_ack_message;
            16w0xf00: parse_open_order_request_message;
            16w0x1100: parse_ownership_request_ack_message;
            16w0x1200: parse_ownership_request_message;
            16w0x1300: parse_trade_bust_notification_message;
            16w0x1400: parse_collar_breach_confirmation_message;
            16w0x1c00: parse_price_input_message;
            16w0x2000: parse_liquidity_provider_command_message;
            16w0x2100: parse_ask_for_quote_message;
            16w0x2200: parse_request_for_execution_message;
            16w0x2300: parse_rfq_notification_message;
            16w0x2400: parse_rfq_matching_status_message;
            16w0x2700: parse_user_notification_message;
            16w0x2800: parse_declaration_entry_message;
            16w0x2900: parse_declaration_entry_ack_message;
            16w0x2a00: parse_declaration_notice_message;
            16w0x2b00: parse_declaration_cancel_and_refusal_message;
            16w0x2c00: parse_fund_price_input_message;
            16w0x2d00: parse_fund_price_input_ack_message;
            16w0x2e00: parse_declaration_entry_reject_message;
            16w0x3200: parse_instrument_synchronization_list_message;
            16w0x3300: parse_synchronization_time_message;
            16w0x6400: parse_logon_message;
            16w0x6500: parse_logon_ack_message;
            16w0x6600: parse_logon_reject_message;
            16w0x6700: parse_logout_message;
            16w0x6a00: parse_heartbeat_message;
            16w0x6b00: parse_test_request_message;
            16w0x6c00: parse_technical_reject_message;
            default: accept;
        }
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        meta.dispatched = 1;
        meta.new_order_message_new_order_message_free_text_section_group_remaining = hdr.new_order_message.num_in_group;
        transition select(meta.new_order_message_new_order_message_free_text_section_group_remaining) {
            8w0: read_new_order_message_mifid_short_codes_group;
            default: parse_new_order_message_new_order_message_free_text_section_group;
        }
    }

    state parse_new_order_message_new_order_message_free_text_section_group {
        packet.extract(hdr.new_order_message_new_order_message_free_text_section_group.next);
        meta.new_order_message_new_order_message_free_text_section_group_remaining = meta.new_order_message_new_order_message_free_text_section_group_remaining - 1;
        transition select(meta.new_order_message_new_order_message_free_text_section_group_remaining) {
            8w0: read_new_order_message_mifid_short_codes_group;
            default: parse_new_order_message_new_order_message_free_text_section_group;
        }
    }

    state read_new_order_message_mifid_short_codes_group {
        packet.extract(hdr.new_order_message_mifid_short_codes_group_header);
        meta.new_order_message_mifid_short_codes_group_remaining = hdr.new_order_message_mifid_short_codes_group_header.num_in_group;
        transition select(meta.new_order_message_mifid_short_codes_group_remaining) {
            8w0: read_new_order_message_order_optional_fields_group;
            default: parse_new_order_message_mifid_short_codes_group;
        }
    }

    state parse_new_order_message_mifid_short_codes_group {
        packet.extract(hdr.new_order_message_mifid_short_codes_group.next);
        meta.new_order_message_mifid_short_codes_group_remaining = meta.new_order_message_mifid_short_codes_group_remaining - 1;
        transition select(meta.new_order_message_mifid_short_codes_group_remaining) {
            8w0: read_new_order_message_order_optional_fields_group;
            default: parse_new_order_message_mifid_short_codes_group;
        }
    }

    state read_new_order_message_order_optional_fields_group {
        packet.extract(hdr.new_order_message_order_optional_fields_group_header);
        meta.new_order_message_order_optional_fields_group_remaining = hdr.new_order_message_order_optional_fields_group_header.num_in_group;
        transition select(meta.new_order_message_order_optional_fields_group_remaining) {
            8w0: read_new_order_message_order_clearing_fields_group;
            default: parse_new_order_message_order_optional_fields_group;
        }
    }

    state parse_new_order_message_order_optional_fields_group {
        packet.extract(hdr.new_order_message_order_optional_fields_group.next);
        meta.new_order_message_order_optional_fields_group_remaining = meta.new_order_message_order_optional_fields_group_remaining - 1;
        transition select(meta.new_order_message_order_optional_fields_group_remaining) {
            8w0: read_new_order_message_order_clearing_fields_group;
            default: parse_new_order_message_order_optional_fields_group;
        }
    }

    state read_new_order_message_order_clearing_fields_group {
        packet.extract(hdr.new_order_message_order_clearing_fields_group_header);
        meta.new_order_message_order_clearing_fields_group_remaining = hdr.new_order_message_order_clearing_fields_group_header.num_in_group;
        transition select(meta.new_order_message_order_clearing_fields_group_remaining) {
            8w0: accept;
            default: parse_new_order_message_order_clearing_fields_group;
        }
    }

    state parse_new_order_message_order_clearing_fields_group {
        packet.extract(hdr.new_order_message_order_clearing_fields_group.next);
        meta.new_order_message_order_clearing_fields_group_remaining = meta.new_order_message_order_clearing_fields_group_remaining - 1;
        transition select(meta.new_order_message_order_clearing_fields_group_remaining) {
            8w0: accept;
            default: parse_new_order_message_order_clearing_fields_group;
        }
    }

    state parse_ack_message {
        packet.extract(hdr.ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_fill_message {
        packet.extract(hdr.fill_message);
        meta.dispatched = 1;
        meta.fill_message_fill_optional_field_group_remaining = hdr.fill_message.num_in_group;
        transition select(meta.fill_message_fill_optional_field_group_remaining) {
            8w0: read_fill_message_fill_strategy_field_group;
            default: parse_fill_message_fill_optional_field_group;
        }
    }

    state parse_fill_message_fill_optional_field_group {
        packet.extract(hdr.fill_message_fill_optional_field_group.next);
        meta.fill_message_fill_optional_field_group_remaining = meta.fill_message_fill_optional_field_group_remaining - 1;
        transition select(meta.fill_message_fill_optional_field_group_remaining) {
            8w0: read_fill_message_fill_strategy_field_group;
            default: parse_fill_message_fill_optional_field_group;
        }
    }

    state read_fill_message_fill_strategy_field_group {
        packet.extract(hdr.fill_message_fill_strategy_field_group_header);
        meta.fill_message_fill_strategy_field_group_remaining = hdr.fill_message_fill_strategy_field_group_header.num_in_group;
        transition select(meta.fill_message_fill_strategy_field_group_remaining) {
            8w0: accept;
            default: parse_fill_message_fill_strategy_field_group;
        }
    }

    state parse_fill_message_fill_strategy_field_group {
        packet.extract(hdr.fill_message_fill_strategy_field_group.next);
        meta.fill_message_fill_strategy_field_group_remaining = meta.fill_message_fill_strategy_field_group_remaining - 1;
        transition select(meta.fill_message_fill_strategy_field_group_remaining) {
            8w0: accept;
            default: parse_fill_message_fill_strategy_field_group;
        }
    }

    state parse_kill_message {
        packet.extract(hdr.kill_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_replace_message {
        packet.extract(hdr.cancel_replace_message);
        meta.dispatched = 1;
        meta.cancel_replace_message_new_order_message_free_text_section_group_remaining = hdr.cancel_replace_message.num_in_group;
        transition select(meta.cancel_replace_message_new_order_message_free_text_section_group_remaining) {
            8w0: read_cancel_replace_message_cancel_replace_optional_field_group;
            default: parse_cancel_replace_message_new_order_message_free_text_section_group;
        }
    }

    state parse_cancel_replace_message_new_order_message_free_text_section_group {
        packet.extract(hdr.cancel_replace_message_new_order_message_free_text_section_group.next);
        meta.cancel_replace_message_new_order_message_free_text_section_group_remaining = meta.cancel_replace_message_new_order_message_free_text_section_group_remaining - 1;
        transition select(meta.cancel_replace_message_new_order_message_free_text_section_group_remaining) {
            8w0: read_cancel_replace_message_cancel_replace_optional_field_group;
            default: parse_cancel_replace_message_new_order_message_free_text_section_group;
        }
    }

    state read_cancel_replace_message_cancel_replace_optional_field_group {
        packet.extract(hdr.cancel_replace_message_cancel_replace_optional_field_group_header);
        meta.cancel_replace_message_cancel_replace_optional_field_group_remaining = hdr.cancel_replace_message_cancel_replace_optional_field_group_header.num_in_group;
        transition select(meta.cancel_replace_message_cancel_replace_optional_field_group_remaining) {
            8w0: read_cancel_replace_message_cancel_replace_clearing_fields_group;
            default: parse_cancel_replace_message_cancel_replace_optional_field_group;
        }
    }

    state parse_cancel_replace_message_cancel_replace_optional_field_group {
        packet.extract(hdr.cancel_replace_message_cancel_replace_optional_field_group.next);
        meta.cancel_replace_message_cancel_replace_optional_field_group_remaining = meta.cancel_replace_message_cancel_replace_optional_field_group_remaining - 1;
        transition select(meta.cancel_replace_message_cancel_replace_optional_field_group_remaining) {
            8w0: read_cancel_replace_message_cancel_replace_clearing_fields_group;
            default: parse_cancel_replace_message_cancel_replace_optional_field_group;
        }
    }

    state read_cancel_replace_message_cancel_replace_clearing_fields_group {
        packet.extract(hdr.cancel_replace_message_cancel_replace_clearing_fields_group_header);
        meta.cancel_replace_message_cancel_replace_clearing_fields_group_remaining = hdr.cancel_replace_message_cancel_replace_clearing_fields_group_header.num_in_group;
        transition select(meta.cancel_replace_message_cancel_replace_clearing_fields_group_remaining) {
            8w0: accept;
            default: parse_cancel_replace_message_cancel_replace_clearing_fields_group;
        }
    }

    state parse_cancel_replace_message_cancel_replace_clearing_fields_group {
        packet.extract(hdr.cancel_replace_message_cancel_replace_clearing_fields_group.next);
        meta.cancel_replace_message_cancel_replace_clearing_fields_group_remaining = meta.cancel_replace_message_cancel_replace_clearing_fields_group_remaining - 1;
        transition select(meta.cancel_replace_message_cancel_replace_clearing_fields_group_remaining) {
            8w0: accept;
            default: parse_cancel_replace_message_cancel_replace_clearing_fields_group;
        }
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        meta.dispatched = 1;
        meta.reject_message_collar_fields_group_remaining = hdr.reject_message.num_in_group;
        transition select(meta.reject_message_collar_fields_group_remaining) {
            8w0: accept;
            default: parse_reject_message_collar_fields_group;
        }
    }

    state parse_reject_message_collar_fields_group {
        packet.extract(hdr.reject_message_collar_fields_group.next);
        meta.reject_message_collar_fields_group_remaining = meta.reject_message_collar_fields_group_remaining - 1;
        transition select(meta.reject_message_collar_fields_group_remaining) {
            8w0: accept;
            default: parse_reject_message_collar_fields_group;
        }
    }

    state parse_quotes_message {
        packet.extract(hdr.quotes_message);
        meta.dispatched = 1;
        meta.quotes_message_mifid_short_codes_group_remaining = hdr.quotes_message.num_in_group;
        transition select(meta.quotes_message_mifid_short_codes_group_remaining) {
            8w0: read_quotes_message_clearing_dataset_group;
            default: parse_quotes_message_mifid_short_codes_group;
        }
    }

    state parse_quotes_message_mifid_short_codes_group {
        packet.extract(hdr.quotes_message_mifid_short_codes_group.next);
        meta.quotes_message_mifid_short_codes_group_remaining = meta.quotes_message_mifid_short_codes_group_remaining - 1;
        transition select(meta.quotes_message_mifid_short_codes_group_remaining) {
            8w0: read_quotes_message_clearing_dataset_group;
            default: parse_quotes_message_mifid_short_codes_group;
        }
    }

    state read_quotes_message_clearing_dataset_group {
        packet.extract(hdr.quotes_message_clearing_dataset_group_header);
        meta.quotes_message_clearing_dataset_group_remaining = hdr.quotes_message_clearing_dataset_group_header.num_in_group;
        transition select(meta.quotes_message_clearing_dataset_group_remaining) {
            8w0: read_quotes_message_quotes_rep_group;
            default: parse_quotes_message_clearing_dataset_group;
        }
    }

    state parse_quotes_message_clearing_dataset_group {
        packet.extract(hdr.quotes_message_clearing_dataset_group.next);
        meta.quotes_message_clearing_dataset_group_remaining = meta.quotes_message_clearing_dataset_group_remaining - 1;
        transition select(meta.quotes_message_clearing_dataset_group_remaining) {
            8w0: read_quotes_message_quotes_rep_group;
            default: parse_quotes_message_clearing_dataset_group;
        }
    }

    state read_quotes_message_quotes_rep_group {
        packet.extract(hdr.quotes_message_quotes_rep_group_header);
        meta.quotes_message_quotes_rep_group_remaining = hdr.quotes_message_quotes_rep_group_header.num_in_group;
        transition select(meta.quotes_message_quotes_rep_group_remaining) {
            8w0: accept;
            default: parse_quotes_message_quotes_rep_group;
        }
    }

    state parse_quotes_message_quotes_rep_group {
        packet.extract(hdr.quotes_message_quotes_rep_group.next);
        meta.quotes_message_quotes_rep_group_remaining = meta.quotes_message_quotes_rep_group_remaining - 1;
        transition select(meta.quotes_message_quotes_rep_group_remaining) {
            8w0: accept;
            default: parse_quotes_message_quotes_rep_group;
        }
    }

    state parse_quote_ack_message {
        packet.extract(hdr.quote_ack_message);
        meta.dispatched = 1;
        meta.quote_ack_message_quote_acks_group_remaining = hdr.quote_ack_message.num_in_group;
        transition select(meta.quote_ack_message_quote_acks_group_remaining) {
            8w0: accept;
            default: parse_quote_ack_message_quote_acks_group;
        }
    }

    state parse_quote_ack_message_quote_acks_group {
        packet.extract(hdr.quote_ack_message_quote_acks_group.next);
        meta.quote_ack_message_quote_acks_group_remaining = meta.quote_ack_message_quote_acks_group_remaining - 1;
        transition select(meta.quote_ack_message_quote_acks_group_remaining) {
            8w0: accept;
            default: parse_quote_ack_message_quote_acks_group;
        }
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_request_message {
        packet.extract(hdr.cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_message {
        packet.extract(hdr.mass_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_ack_message {
        packet.extract(hdr.mass_cancel_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_open_order_request_message {
        packet.extract(hdr.open_order_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ownership_request_ack_message {
        packet.extract(hdr.ownership_request_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ownership_request_message {
        packet.extract(hdr.ownership_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_bust_notification_message {
        packet.extract(hdr.trade_bust_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_collar_breach_confirmation_message {
        packet.extract(hdr.collar_breach_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_input_message {
        packet.extract(hdr.price_input_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_liquidity_provider_command_message {
        packet.extract(hdr.liquidity_provider_command_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ask_for_quote_message {
        packet.extract(hdr.ask_for_quote_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_request_for_execution_message {
        packet.extract(hdr.request_for_execution_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_notification_message {
        packet.extract(hdr.rfq_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_matching_status_message {
        packet.extract(hdr.rfq_matching_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_notification_message {
        packet.extract(hdr.user_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_declaration_entry_message {
        packet.extract(hdr.declaration_entry_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_declaration_entry_ack_message {
        packet.extract(hdr.declaration_entry_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_declaration_notice_message {
        packet.extract(hdr.declaration_notice_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_declaration_cancel_and_refusal_message {
        packet.extract(hdr.declaration_cancel_and_refusal_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_fund_price_input_message {
        packet.extract(hdr.fund_price_input_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_fund_price_input_ack_message {
        packet.extract(hdr.fund_price_input_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_declaration_entry_reject_message {
        packet.extract(hdr.declaration_entry_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_synchronization_list_message {
        packet.extract(hdr.instrument_synchronization_list_message);
        meta.dispatched = 1;
        meta.instrument_synchronization_list_message_instrument_synchronization_group_remaining = hdr.instrument_synchronization_list_message.num_in_group;
        transition select(meta.instrument_synchronization_list_message_instrument_synchronization_group_remaining) {
            8w0: accept;
            default: parse_instrument_synchronization_list_message_instrument_synchronization_group;
        }
    }

    state parse_instrument_synchronization_list_message_instrument_synchronization_group {
        packet.extract(hdr.instrument_synchronization_list_message_instrument_synchronization_group.next);
        meta.instrument_synchronization_list_message_instrument_synchronization_group_remaining = meta.instrument_synchronization_list_message_instrument_synchronization_group_remaining - 1;
        transition select(meta.instrument_synchronization_list_message_instrument_synchronization_group_remaining) {
            8w0: accept;
            default: parse_instrument_synchronization_list_message_instrument_synchronization_group;
        }
    }

    state parse_synchronization_time_message {
        packet.extract(hdr.synchronization_time_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_ack_message {
        packet.extract(hdr.logon_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_reject_message {
        packet.extract(hdr.logon_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test_request_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_technical_reject_message {
        packet.extract(hdr.technical_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control EuronextOptiqOrderentrygatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqOrderentrygatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control EuronextOptiqOrderentrygatewayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EuronextOptiqOrderentrygatewayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqOrderentrygatewayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.new_order_message_new_order_message_free_text_section_group);
        packet.emit(hdr.new_order_message_mifid_short_codes_group_header);
        packet.emit(hdr.new_order_message_mifid_short_codes_group);
        packet.emit(hdr.new_order_message_order_optional_fields_group_header);
        packet.emit(hdr.new_order_message_order_optional_fields_group);
        packet.emit(hdr.new_order_message_order_clearing_fields_group_header);
        packet.emit(hdr.new_order_message_order_clearing_fields_group);
        packet.emit(hdr.ack_message);
        packet.emit(hdr.fill_message);
        packet.emit(hdr.fill_message_fill_optional_field_group);
        packet.emit(hdr.fill_message_fill_strategy_field_group_header);
        packet.emit(hdr.fill_message_fill_strategy_field_group);
        packet.emit(hdr.kill_message);
        packet.emit(hdr.cancel_replace_message);
        packet.emit(hdr.cancel_replace_message_new_order_message_free_text_section_group);
        packet.emit(hdr.cancel_replace_message_cancel_replace_optional_field_group_header);
        packet.emit(hdr.cancel_replace_message_cancel_replace_optional_field_group);
        packet.emit(hdr.cancel_replace_message_cancel_replace_clearing_fields_group_header);
        packet.emit(hdr.cancel_replace_message_cancel_replace_clearing_fields_group);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.reject_message_collar_fields_group);
        packet.emit(hdr.quotes_message);
        packet.emit(hdr.quotes_message_mifid_short_codes_group);
        packet.emit(hdr.quotes_message_clearing_dataset_group_header);
        packet.emit(hdr.quotes_message_clearing_dataset_group);
        packet.emit(hdr.quotes_message_quotes_rep_group_header);
        packet.emit(hdr.quotes_message_quotes_rep_group);
        packet.emit(hdr.quote_ack_message);
        packet.emit(hdr.quote_ack_message_quote_acks_group);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.cancel_request_message);
        packet.emit(hdr.mass_cancel_message);
        packet.emit(hdr.mass_cancel_ack_message);
        packet.emit(hdr.open_order_request_message);
        packet.emit(hdr.ownership_request_ack_message);
        packet.emit(hdr.ownership_request_message);
        packet.emit(hdr.trade_bust_notification_message);
        packet.emit(hdr.collar_breach_confirmation_message);
        packet.emit(hdr.price_input_message);
        packet.emit(hdr.liquidity_provider_command_message);
        packet.emit(hdr.ask_for_quote_message);
        packet.emit(hdr.request_for_execution_message);
        packet.emit(hdr.rfq_notification_message);
        packet.emit(hdr.rfq_matching_status_message);
        packet.emit(hdr.user_notification_message);
        packet.emit(hdr.declaration_entry_message);
        packet.emit(hdr.declaration_entry_ack_message);
        packet.emit(hdr.declaration_notice_message);
        packet.emit(hdr.declaration_cancel_and_refusal_message);
        packet.emit(hdr.fund_price_input_message);
        packet.emit(hdr.fund_price_input_ack_message);
        packet.emit(hdr.declaration_entry_reject_message);
        packet.emit(hdr.instrument_synchronization_list_message);
        packet.emit(hdr.instrument_synchronization_list_message_instrument_synchronization_group);
        packet.emit(hdr.synchronization_time_message);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logon_ack_message);
        packet.emit(hdr.logon_reject_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.technical_reject_message);
    }
}

V1Switch(
    EuronextOptiqOrderentrygatewayParser(),
    EuronextOptiqOrderentrygatewayVerifyChecksum(),
    EuronextOptiqOrderentrygatewayIngress(),
    EuronextOptiqOrderentrygatewayEgress(),
    EuronextOptiqOrderentrygatewayComputeChecksum(),
    EuronextOptiqOrderentrygatewayDeparser()
) main;
