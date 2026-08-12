// P4_16 (v1model) definition for: Euronext Optiq OrderEntryGateway Sbe v5.30
// 
// Protocol:
//   Organization: Euronext
//   Protocol: Order Entry Gateway
//   Encoding: Simple Binary Encoding
//   Version: 5.30
//   Date: 11/16/2023
//   Specification: Optiq OEG SBE Messages - Interface Specification - Euronext Cash and Derivatives Markets - External - v5.30.0 +TC.pdf
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
    bit<64> order_px_optional;
    bit<64> order_qty;
    bit<32> execution_within_firm_short_code;
    bit<8> trading_capacity;
    bit<8> account_type;
    bit<8> lp_role_optional;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<1> dark_indicator;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<3> reserved_3;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<16> stpid;
    bit<16> non_executing_client_id;
    bit<64> ioi_id_optional;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<144> free_text;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
    bit<64> stop_px;
    bit<64> undisclosed_price;
    bit<64> disclosed_qty;
    bit<64> min_order_qty;
    bit<64> quote_req_id_optional;
    bit<32> order_expiration_time;
    bit<16> order_expiration_date;
    bit<8> peg_offset;
    bit<1> unused_trading_session_validityset_0;
    bit<1> session_1;
    bit<1> session_2;
    bit<1> session_3;
    bit<1> session_4;
    bit<3> reserved_3_2;
    bit<8> undisclosed_iceberg_type;
    bit<8> stop_triggered_time_in_force;
    bit<8> block_length_short_4;
    bit<8> num_in_group_4;
    bit<64> clearing_firm_id;
    bit<64> client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<8> account_type_cross;
    bit<8> trading_capacity_cross;
    bit<8> block_length_short_5;
    bit<8> num_in_group_5;
    bit<8> block_length_short_6;
    bit<8> num_in_group_6;
    bit<8> block_length_short_7;
    bit<8> num_in_group_7;
    bit<128> long_client_id;
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
    bit<64> order_px_optional;
    bit<64> order_qty_optional;
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<32> client_identification_shortcode;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
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
    bit<1> uncrossing_trade;
    bit<1> first_trade_price;
    bit<1> passive_order;
    bit<1> aggressive_order;
    bit<1> trade_creation_by_market_operations;
    bit<1> nav_trade_expressed_in_bps;
    bit<1> nav_trade_expressed_in_price_currency;
    bit<1> deferred_publication;
    bit<64> order_id;
    bit<64> last_traded_px;
    bit<64> last_shares;
    bit<64> leaves_qty;
    bit<32> execution_id;
    bit<8> execution_phase;
    bit<32> lis_transaction_id;
    bit<8> escb_membership;
    bit<128> trade_unique_identifier;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<64> counterpart_firm_id;
    bit<64> other_leg_last_px;
    bit<96> package_id;
    bit<32> underlying_instrument_id;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_instrument_id;
    bit<8> leg_side_optional;
    bit<32> execution_id_optional;
    bit<128> trade_unique_identifier_2;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<32> client_identification_shortcode;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<8> block_length_short_4;
    bit<8> num_in_group_4;
    bit<64> evaluated_price;
    bit<8> message_price_notation;
    bit<32> final_symbol_index;
    bit<32> final_execution_id;
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
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<32> client_identification_shortcode;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
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
    bit<64> order_px_optional;
    bit<64> order_qty;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> account_type_optional;
    bit<8> lp_role_optional;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<1> dark_indicator;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<3> reserved_3;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<16> stpid;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<144> free_text;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<64> stop_px;
    bit<8> peg_offset;
    bit<64> undisclosed_price;
    bit<64> disclosed_qty;
    bit<32> order_expiration_time;
    bit<16> order_expiration_date;
    bit<1> unused_trading_session_validityset_0;
    bit<1> session_1;
    bit<1> session_2;
    bit<1> session_3;
    bit<1> session_4;
    bit<3> reserved_3_2;
    bit<8> stop_triggered_time_in_force;
    bit<8> undisclosed_iceberg_type;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
    bit<64> clearing_firm_id;
    bit<64> client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<8> block_length_short_4;
    bit<8> num_in_group_4;
    bit<8> block_length_short_5;
    bit<8> num_in_group_5;
    bit<8> block_length_short_6;
    bit<8> num_in_group_6;
    bit<128> long_client_id;
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
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> collar_rej_type;
    bit<64> breached_collar_price;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<32> client_identification_shortcode;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
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
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<8> rfe_answer;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<16> stpid;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<64> clearing_firm_id;
    bit<64> client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<144> free_text;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
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
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<8> block_length_short;
    bit<8> num_in_group;
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
    bit<1> dark_indicator;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<3> reserved_3;
    bit<64> min_order_qty;
    bit<8> account_type_optional;
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
    bit<8> order_category;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
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
    bit<8> order_category;
    bit<32> target_execution_within_firm_short_code;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
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
    bit<8> order_category;
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<32> target_execution_within_firm_short_code;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<32> client_identification_shortcode;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
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
    bit<8> order_category;
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
    bit<8> order_category;
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
    bit<8> order_category;
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
    bit<32> lis_transaction_id;
    bit<32> parent_exec_id;
    bit<32> parent_symbol_index;
    bit<128> trade_unique_identifier;
    bit<128> parent_trade_unique_identifier;
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
    bit<1> dark_indicator;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<3> reserved_3;
    bit<64> min_order_qty;
    bit<8> account_type_optional;
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

header rfqlp_matching_status_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> quote_req_id;
    bit<64> potential_matching_qty;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
}

header user_notification_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<32> client_identification_shortcode;
    bit<64> family_id;
    bit<32> symbol_index_optional;
    bit<8> user_status;
    bit<32> lp_role_optional;
    bit<64> order_size_limit;
    bit<64> order_amount_limit;
    bit<8> exposure_side;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header mm_sign_in_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<32> logical_access_id;
    bit<16> oe_partition_id;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<32> execution_within_firm_short_code;
    bit<64> clearing_firm_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<144> free_text;
    bit<128> long_client_id;
}

header mm_sign_in_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<32> logical_access_id;
    bit<16> oe_partition_id;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<32> execution_within_firm_short_code;
    bit<64> clearing_firm_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<144> free_text;
    bit<128> long_client_id;
}

header instrument_synchronization_list_message_t {
    bit<32> msg_seq_num;
    bit<64> oeg_out_to_member_optional;
    bit<16> resynchronization_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> symbol_index;
    bit<8> emm;
}

header synchronization_time_message_t {
    bit<32> msg_seq_num;
    bit<64> oeg_out_to_member_optional;
    bit<16> resynchronization_id;
    bit<64> last_book_in_time;
}

header security_definition_request_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> security_req_id;
    bit<32> contract_symbol_index;
    bit<8> strategy_code;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> leg_symbol_index;
    bit<32> leg_ratio;
    bit<8> leg_security_type;
    bit<8> leg_put_or_call;
    bit<64> leg_price_optional;
    bit<64> leg_strike_price;
    bit<64> leg_last_trading_date;
    bit<8> leg_side;
}

header security_definition_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in_optional;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> security_req_id;
    bit<32> symbol_index;
}

header mm_protection_request_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> execution_within_firm_short_code;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> request_type;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> protection_type;
    bit<64> protection_threshold;
    bit<8> breach_action;
}

header mm_protection_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in_optional;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id_optional;
    bit<32> execution_within_firm_short_code;
    bit<32> symbol_index;
    bit<8> emm;
    bit<1> notification;
    bit<1> acknowledgement;
    bit<1> pull;
    bit<5> reserved_5;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> protection_type_optional;
    bit<64> protection_threshold;
    bit<8> breach_action;
    bit<64> current_mmp_position;
    bit<8> breach_status;
}

header new_wholesale_order_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> contract_symbol_index;
    bit<8> wholesale_trade_type;
    bit<32> lis_transaction_id;
    bit<8> strategy_code_optional;
    bit<64> price;
    bit<64> quantity;
    bit<32> execution_within_firm_short_code;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<8> wholesale_side;
    bit<8> escb_membership;
    bit<8> message_price_notation;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> leg_symbol_index;
    bit<64> leg_price;
    bit<64> bid_quantity;
    bit<64> offer_quantity;
    bit<8> leg_side_optional;
    bit<64> leg_strike_price;
    bit<32> leg_ratio_optional;
    bit<8> leg_put_or_call;
    bit<8> leg_security_type;
    bit<64> leg_last_trading_date;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<32> symbol_index;
    bit<8> side;
    bit<8> account_type;
    bit<64> clearing_firm_id;
    bit<128> long_client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<144> free_text;
    bit<16> non_executing_client_id;
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
    bit<8> trading_capacity_optional;
}

header wholesale_order_ack_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time_optional;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in_optional;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> client_order_id_optional;
    bit<32> contract_symbol_index;
    bit<8> wholesale_trade_type;
    bit<32> lis_transaction_id;
    bit<8> strategy_code_optional;
    bit<64> price_optional;
    bit<64> quantity_optional;
    bit<32> execution_within_firm_short_code;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<8> wholesale_side;
    bit<8> escb_membership;
    bit<8> response_type;
    bit<16> error_code;
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> leg_symbol_index;
    bit<64> leg_bid_order_id;
    bit<64> leg_offer_order_id;
    bit<8> leg_side_optional;
    bit<16> leg_error_code;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<32> symbol_index;
    bit<8> side;
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
    bit<16> non_executing_client_id;
}

header request_for_implied_execution_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> order_id;
    bit<32> execution_within_firm_short_code;
    bit<32> client_identification_shortcode;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
}

header cross_order_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> client_order_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> side;
    bit<8> order_type;
    bit<64> order_px;
    bit<64> order_qty;
    bit<32> execution_within_firm_short_code;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<16> non_executing_client_id;
    bit<8> order_actor_type;
    bit<8> message_price_notation;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<144> free_text;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<32> investment_decision_w_firm_short_code;
    bit<32> non_executing_broker_short_code;
    bit<32> client_identification_shortcode;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
    bit<64> clearing_firm_id;
    bit<128> long_client_id;
    bit<96> account_number;
    bit<8> technical_origin;
    bit<1> field_actively_used;
    bit<1> leg_1;
    bit<1> leg_2;
    bit<1> leg_3;
    bit<1> leg_4;
    bit<1> leg_5;
    bit<1> leg_6;
    bit<1> leg_7;
    bit<1> leg_8;
    bit<1> leg_9;
    bit<6> reserved_6;
    bit<16> clearing_instruction;
    bit<8> account_type;
    bit<8> trading_capacity_optional;
    bit<8> block_length_short_4;
    bit<8> num_in_group_4;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_instrument_id;
}

header rfq_audit_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> book_in;
    bit<64> book_out_time;
    bit<64> oeg_in_from_me;
    bit<64> oeg_out_to_member;
    bit<64> quote_req_id;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> order_origin;
    bit<64> order_price;
    bit<64> last_traded_quantity;
    bit<1> dark_indicator;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<3> reserved_3;
    bit<64> minimum_order_quantity;
}

header wave_for_liquidity_message_t {
    bit<32> cl_msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> ioi_id;
    bit<8> ioi_transaction_type;
    bit<64> original_ioiid;
    bit<1> euronext_data_driven;
    bit<1> interest_lists;
    bit<1> holdings;
    bit<1> buy_side;
    bit<1> sell_side;
    bit<1> quality_of_sell_side_counterparty;
    bit<1> local_community_of_specialist_ams;
    bit<1> local_community_of_specialist_par;
    bit<1> local_community_of_specialist_bru;
    bit<1> local_community_of_specialist_lis;
    bit<6> reserved_6;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> ioi_side;
    bit<64> order_quantity;
    bit<8> ioi_quantity;
    bit<8> ioi_quality_indication;
}

header wave_for_liquidity_notification_message_t {
    bit<32> msg_seq_num;
    bit<64> firm_id;
    bit<64> sending_time;
    bit<64> oeg_in_from_member;
    bit<64> oeg_out_time_to_me;
    bit<64> book_in_optional;
    bit<64> book_out_time_optional;
    bit<64> oeg_in_from_me_optional;
    bit<64> oeg_out_to_member_optional;
    bit<64> ioi_id_optional;
    bit<64> exchange_ioi_id_optional;
    bit<8> ioi_type;
    bit<64> original_ioiid;
    bit<32> symbol_index;
    bit<8> emm_optional;
    bit<8> ioi_side;
    bit<64> order_quantity;
    bit<8> ioi_quantity;
    bit<8> ioi_quality_indication;
    bit<16> error_code_optional;
}

header clear_book_message_t {
    bit<32> msg_seq_num;
    bit<64> oeg_out_to_member_optional;
    bit<32> symbol_index;
    bit<8> emm;
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
    bit<64> quantity_optional;
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
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
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
    bit<8> block_length_short;
    bit<8> num_in_group;
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
    bit<1> lrgs;
    bit<1> rfpt;
    bit<1> nliq;
    bit<1> oilq;
    bit<1> pric;
    bit<1> size;
    bit<1> ilqd;
    bit<1> omf;
    bit<8> block_length_short;
    bit<8> num_in_group;
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
    bit<64> quantity_optional;
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
    bit<1> lrgs;
    bit<1> rfpt;
    bit<1> nliq;
    bit<1> oilq;
    bit<1> pric;
    bit<1> size;
    bit<1> ilqd;
    bit<1> omf;
    bit<8> previous_day_indicator;
    bit<64> miscellaneous_fee_amount;
    bit<8> ccpid;
    bit<128> trade_unique_identifier;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
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
    bit<128> trade_unique_identifier;
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
    bit<8> block_length_short;
    bit<8> num_in_group;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    new_order_message_t new_order_message;
    ack_message_t ack_message;
    fill_message_t fill_message;
    kill_message_t kill_message;
    cancel_replace_message_t cancel_replace_message;
    reject_message_t reject_message;
    quotes_message_t quotes_message;
    quote_ack_message_t quote_ack_message;
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
    rfqlp_matching_status_message_t rfqlp_matching_status_message;
    user_notification_message_t user_notification_message;
    mm_sign_in_message_t mm_sign_in_message;
    mm_sign_in_ack_message_t mm_sign_in_ack_message;
    instrument_synchronization_list_message_t instrument_synchronization_list_message;
    synchronization_time_message_t synchronization_time_message;
    security_definition_request_message_t security_definition_request_message;
    security_definition_ack_message_t security_definition_ack_message;
    mm_protection_request_message_t mm_protection_request_message;
    mm_protection_ack_message_t mm_protection_ack_message;
    new_wholesale_order_message_t new_wholesale_order_message;
    wholesale_order_ack_message_t wholesale_order_ack_message;
    request_for_implied_execution_message_t request_for_implied_execution_message;
    cross_order_message_t cross_order_message;
    rfq_audit_message_t rfq_audit_message;
    wave_for_liquidity_message_t wave_for_liquidity_message;
    wave_for_liquidity_notification_message_t wave_for_liquidity_notification_message;
    clear_book_message_t clear_book_message;
    logon_message_t logon_message;
    logon_ack_message_t logon_ack_message;
    logon_reject_message_t logon_reject_message;
    logout_message_t logout_message;
    technical_reject_message_t technical_reject_message;
    declaration_entry_message_t declaration_entry_message;
    declaration_entry_ack_message_t declaration_entry_ack_message;
    declaration_notice_message_t declaration_notice_message;
    declaration_cancel_and_refusal_message_t declaration_cancel_and_refusal_message;
    fund_price_input_message_t fund_price_input_message;
    fund_price_input_ack_message_t fund_price_input_ack_message;
    declaration_entry_reject_message_t declaration_entry_reject_message;
}

parser EuronextOptiqOrderentrygatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w1: parse_new_order_message;
            16w3: parse_ack_message;
            16w4: parse_fill_message;
            16w5: parse_kill_message;
            16w6: parse_cancel_replace_message;
            16w7: parse_reject_message;
            16w8: parse_quotes_message;
            16w9: parse_quote_ack_message;
            16w10: parse_quote_request_message;
            16w12: parse_cancel_request_message;
            16w13: parse_mass_cancel_message;
            16w14: parse_mass_cancel_ack_message;
            16w15: parse_open_order_request_message;
            16w17: parse_ownership_request_ack_message;
            16w18: parse_ownership_request_message;
            16w19: parse_trade_bust_notification_message;
            16w20: parse_collar_breach_confirmation_message;
            16w28: parse_price_input_message;
            16w32: parse_liquidity_provider_command_message;
            16w33: parse_ask_for_quote_message;
            16w34: parse_request_for_execution_message;
            16w35: parse_rfq_notification_message;
            16w36: parse_rfq_matching_status_message;
            16w37: parse_rfqlp_matching_status_message;
            16w39: parse_user_notification_message;
            16w47: parse_mm_sign_in_message;
            16w48: parse_mm_sign_in_ack_message;
            16w50: parse_instrument_synchronization_list_message;
            16w51: parse_synchronization_time_message;
            16w60: parse_security_definition_request_message;
            16w61: parse_security_definition_ack_message;
            16w62: parse_mm_protection_request_message;
            16w63: parse_mm_protection_ack_message;
            16w64: parse_new_wholesale_order_message;
            16w65: parse_wholesale_order_ack_message;
            16w66: parse_request_for_implied_execution_message;
            16w67: parse_cross_order_message;
            16w72: parse_rfq_audit_message;
            16w73: parse_wave_for_liquidity_message;
            16w74: parse_wave_for_liquidity_notification_message;
            16w75: parse_clear_book_message;
            16w100: parse_logon_message;
            16w101: parse_logon_ack_message;
            16w102: parse_logon_reject_message;
            16w103: parse_logout_message;
            16w108: parse_technical_reject_message;
            16w40: parse_declaration_entry_message;
            16w41: parse_declaration_entry_ack_message;
            16w42: parse_declaration_notice_message;
            16w43: parse_declaration_cancel_and_refusal_message;
            16w44: parse_fund_price_input_message;
            16w45: parse_fund_price_input_ack_message;
            16w46: parse_declaration_entry_reject_message;
            default: accept;
        }
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        transition accept;
    }

    state parse_ack_message {
        packet.extract(hdr.ack_message);
        transition accept;
    }

    state parse_fill_message {
        packet.extract(hdr.fill_message);
        transition accept;
    }

    state parse_kill_message {
        packet.extract(hdr.kill_message);
        transition accept;
    }

    state parse_cancel_replace_message {
        packet.extract(hdr.cancel_replace_message);
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        transition accept;
    }

    state parse_quotes_message {
        packet.extract(hdr.quotes_message);
        transition accept;
    }

    state parse_quote_ack_message {
        packet.extract(hdr.quote_ack_message);
        transition accept;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message);
        transition accept;
    }

    state parse_cancel_request_message {
        packet.extract(hdr.cancel_request_message);
        transition accept;
    }

    state parse_mass_cancel_message {
        packet.extract(hdr.mass_cancel_message);
        transition accept;
    }

    state parse_mass_cancel_ack_message {
        packet.extract(hdr.mass_cancel_ack_message);
        transition accept;
    }

    state parse_open_order_request_message {
        packet.extract(hdr.open_order_request_message);
        transition accept;
    }

    state parse_ownership_request_ack_message {
        packet.extract(hdr.ownership_request_ack_message);
        transition accept;
    }

    state parse_ownership_request_message {
        packet.extract(hdr.ownership_request_message);
        transition accept;
    }

    state parse_trade_bust_notification_message {
        packet.extract(hdr.trade_bust_notification_message);
        transition accept;
    }

    state parse_collar_breach_confirmation_message {
        packet.extract(hdr.collar_breach_confirmation_message);
        transition accept;
    }

    state parse_price_input_message {
        packet.extract(hdr.price_input_message);
        transition accept;
    }

    state parse_liquidity_provider_command_message {
        packet.extract(hdr.liquidity_provider_command_message);
        transition accept;
    }

    state parse_ask_for_quote_message {
        packet.extract(hdr.ask_for_quote_message);
        transition accept;
    }

    state parse_request_for_execution_message {
        packet.extract(hdr.request_for_execution_message);
        transition accept;
    }

    state parse_rfq_notification_message {
        packet.extract(hdr.rfq_notification_message);
        transition accept;
    }

    state parse_rfq_matching_status_message {
        packet.extract(hdr.rfq_matching_status_message);
        transition accept;
    }

    state parse_rfqlp_matching_status_message {
        packet.extract(hdr.rfqlp_matching_status_message);
        transition accept;
    }

    state parse_user_notification_message {
        packet.extract(hdr.user_notification_message);
        transition accept;
    }

    state parse_mm_sign_in_message {
        packet.extract(hdr.mm_sign_in_message);
        transition accept;
    }

    state parse_mm_sign_in_ack_message {
        packet.extract(hdr.mm_sign_in_ack_message);
        transition accept;
    }

    state parse_instrument_synchronization_list_message {
        packet.extract(hdr.instrument_synchronization_list_message);
        transition accept;
    }

    state parse_synchronization_time_message {
        packet.extract(hdr.synchronization_time_message);
        transition accept;
    }

    state parse_security_definition_request_message {
        packet.extract(hdr.security_definition_request_message);
        transition accept;
    }

    state parse_security_definition_ack_message {
        packet.extract(hdr.security_definition_ack_message);
        transition accept;
    }

    state parse_mm_protection_request_message {
        packet.extract(hdr.mm_protection_request_message);
        transition accept;
    }

    state parse_mm_protection_ack_message {
        packet.extract(hdr.mm_protection_ack_message);
        transition accept;
    }

    state parse_new_wholesale_order_message {
        packet.extract(hdr.new_wholesale_order_message);
        transition accept;
    }

    state parse_wholesale_order_ack_message {
        packet.extract(hdr.wholesale_order_ack_message);
        transition accept;
    }

    state parse_request_for_implied_execution_message {
        packet.extract(hdr.request_for_implied_execution_message);
        transition accept;
    }

    state parse_cross_order_message {
        packet.extract(hdr.cross_order_message);
        transition accept;
    }

    state parse_rfq_audit_message {
        packet.extract(hdr.rfq_audit_message);
        transition accept;
    }

    state parse_wave_for_liquidity_message {
        packet.extract(hdr.wave_for_liquidity_message);
        transition accept;
    }

    state parse_wave_for_liquidity_notification_message {
        packet.extract(hdr.wave_for_liquidity_notification_message);
        transition accept;
    }

    state parse_clear_book_message {
        packet.extract(hdr.clear_book_message);
        transition accept;
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        transition accept;
    }

    state parse_logon_ack_message {
        packet.extract(hdr.logon_ack_message);
        transition accept;
    }

    state parse_logon_reject_message {
        packet.extract(hdr.logon_reject_message);
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        transition accept;
    }

    state parse_technical_reject_message {
        packet.extract(hdr.technical_reject_message);
        transition accept;
    }

    state parse_declaration_entry_message {
        packet.extract(hdr.declaration_entry_message);
        transition accept;
    }

    state parse_declaration_entry_ack_message {
        packet.extract(hdr.declaration_entry_ack_message);
        transition accept;
    }

    state parse_declaration_notice_message {
        packet.extract(hdr.declaration_notice_message);
        transition accept;
    }

    state parse_declaration_cancel_and_refusal_message {
        packet.extract(hdr.declaration_cancel_and_refusal_message);
        transition accept;
    }

    state parse_fund_price_input_message {
        packet.extract(hdr.fund_price_input_message);
        transition accept;
    }

    state parse_fund_price_input_ack_message {
        packet.extract(hdr.fund_price_input_ack_message);
        transition accept;
    }

    state parse_declaration_entry_reject_message {
        packet.extract(hdr.declaration_entry_reject_message);
        transition accept;
    }

}

control EuronextOptiqOrderentrygatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqOrderentrygatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
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
        packet.emit(hdr.ack_message);
        packet.emit(hdr.fill_message);
        packet.emit(hdr.kill_message);
        packet.emit(hdr.cancel_replace_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.quotes_message);
        packet.emit(hdr.quote_ack_message);
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
        packet.emit(hdr.rfqlp_matching_status_message);
        packet.emit(hdr.user_notification_message);
        packet.emit(hdr.mm_sign_in_message);
        packet.emit(hdr.mm_sign_in_ack_message);
        packet.emit(hdr.instrument_synchronization_list_message);
        packet.emit(hdr.synchronization_time_message);
        packet.emit(hdr.security_definition_request_message);
        packet.emit(hdr.security_definition_ack_message);
        packet.emit(hdr.mm_protection_request_message);
        packet.emit(hdr.mm_protection_ack_message);
        packet.emit(hdr.new_wholesale_order_message);
        packet.emit(hdr.wholesale_order_ack_message);
        packet.emit(hdr.request_for_implied_execution_message);
        packet.emit(hdr.cross_order_message);
        packet.emit(hdr.rfq_audit_message);
        packet.emit(hdr.wave_for_liquidity_message);
        packet.emit(hdr.wave_for_liquidity_notification_message);
        packet.emit(hdr.clear_book_message);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logon_ack_message);
        packet.emit(hdr.logon_reject_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.technical_reject_message);
        packet.emit(hdr.declaration_entry_message);
        packet.emit(hdr.declaration_entry_ack_message);
        packet.emit(hdr.declaration_notice_message);
        packet.emit(hdr.declaration_cancel_and_refusal_message);
        packet.emit(hdr.fund_price_input_message);
        packet.emit(hdr.fund_price_input_ack_message);
        packet.emit(hdr.declaration_entry_reject_message);
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
