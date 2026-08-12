// P4_16 (v1model) definition for: Euronext Optiq DropCopyGateway Sbe v6.64
// 
// Protocol:
//   Organization: Euronext
//   Protocol: Drop Copy Gateway
//   Encoding: Simple Binary Encoding
//   Version: 6.64
//   Date: 2/25/2026
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

header dc_market_status_change_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<8> emm;
    bit<64> event_id;
    bit<8> phase_id;
    bit<8> trading_group_state;
    bit<8> instrument_state;
    bit<8> change_type;
    bit<32> symbol_index;
    bit<64> event_time;
    bit<8> book_state;
    bit<8> status_reason;
    bit<1> no_qualifier;
    bit<1> call_bbo_only;
    bit<1> trading_at_last;
    bit<1> random_uncrossing;
    bit<1> suspended;
    bit<1> wholesale_allowed;
    bit<1> stressed_market_conditions;
    bit<1> exceptional_market_conditions;
    bit<1> price_improvement_only;
    bit<1> quoting_period;
    bit<1> execution_prevention_across_all_firms;
    bit<5> reserved_5;
    bit<8> trading_period;
    bit<8> trading_side;
    bit<8> price_limits;
    bit<8> quote_spread_multiplier;
    bit<8> order_entry_qualifier;
    bit<8> session_sessionenum;
    bit<8> scheduled_event;
    bit<64> scheduled_event_time;
    bit<8> trading_group_order_entry_qualifier;
    bit<8> instrument_order_entry_qualifier;
    bit<64> phase_time;
    bit<32> contract_symbol_index;
    bit<8> price_limit_style;
}

header dc_price_update_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<8> emm;
    bit<64> event_id;
    bit<64> event_time;
    bit<8> price_type;
    bit<32> symbol_index;
    bit<64> price_int_64t_optional;
    bit<64> quantity_uint_64t_optional;
    bit<64> imbalance_qty;
    bit<8> imbalance_qty_side;
}

header long_order_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<8> order_event_type;
    bit<8> account_type_internal_account_type_internalenum;
    bit<8> ack_phase;
    bit<1> dark_indicator;
    bit<1> queue_indicator;
    bit<1> request_with_client_order_id;
    bit<1> use_of_cross_partition;
    bit<1> internal_1;
    bit<1> internal_2;
    bit<1> execution_upon_entry_flag_enabled;
    bit<1> executed_upon_entry_flag;
    bit<8> ack_type;
    bit<64> book_in_uint_64t_optional;
    bit<64> book_out_time_uint_64t_optional;
    bit<64> client_order_i_d_int_64t_optional;
    bit<1> dark_indicator_2;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<1> dark_stp_indicator;
    bit<1> dark_passive_order_indicator;
    bit<1> unused_dark_execution_instructionset_7;
    bit<8> emm;
    bit<64> event_id;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<64> firm_id;
    bit<64> indicative_auction_price;
    bit<64> indicative_auction_volume;
    bit<64> oe_session_i_d_uint_64t;
    bit<8> lp_role_lp_roleenum_optional;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<64> oegin_from_member_uint_64t_optional;
    bit<64> oegout_time_to_m_e_uint_64t_optional;
    bit<64> order_id;
    bit<64> order_priority;
    bit<64> order_px;
    bit<64> order_qty;
    bit<8> order_side_order_sideenum;
    bit<8> order_type;
    bit<64> orig_client_order_id;
    bit<16> stpid;
    bit<32> symbol_index;
    bit<8> time_in_force_time_in_forceenum;
    bit<64> displayed_qty;
    bit<8> cross_order_indicator_unsignedchar;
    bit<64> counterpart_firm_id;
    bit<32> execution_i_d_uint_32t_optional;
    bit<8> execution_phase_execution_phaseenum_optional;
    bit<64> last_shares_uint_64t_optional;
    bit<64> last_traded_px_int_64t_optional;
    bit<64> leaves_qty;
    bit<1> uncrossing_trade;
    bit<1> first_trade_price;
    bit<1> passive_order;
    bit<1> aggressive_order;
    bit<1> trade_creation_by_market_operations;
    bit<1> nav_trade_expressed_in_bps;
    bit<1> nav_trade_expressed_in_price_currency;
    bit<1> deferred_publication;
    bit<64> trade_time;
    bit<8> trade_type;
    bit<16> kill_reason;
    bit<64> breached_collar_price;
    bit<8> collar_rej_type;
    bit<8> rejected_message;
    bit<16> error_code_uint_16t_optional;
    bit<64> stop_queue_priority;
    bit<8> counterparty_reason_type;
    bit<8> quote_indicator;
    bit<32> lis_transaction_id;
    bit<8> wholesale_trade_type;
    bit<8> escb_membership;
    bit<128> trade_unique_identifier;
    bit<64> order_tolerable_price;
    bit<8> order_sweep_reason;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<144> free_text;
    bit<8> block_length_uint_8_2;
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
    bit<3> reserved_3;
    bit<8> stop_triggered_time_in_force;
    bit<8> undisclosed_iceberg_type;
    bit<8> block_length_uint_8_3;
    bit<8> num_in_group_3;
    bit<64> clearing_firm_i_d_char_8_optional;
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
    bit<16> clearing_instruction_clearing_instructionenum_optional;
    bit<8> block_length_uint_8_4;
    bit<8> num_in_group_4;
    bit<8> trading_capacity_trading_capacityenum_optional;
    bit<64> minimum_order_quantity;
    bit<8> account_type_cross;
    bit<8> block_length_uint_8_5;
    bit<8> num_in_group_5;
    bit<32> original_client_id_short_code;
    bit<32> original_exec_w_firm_short_code;
    bit<32> original_invest_decis_w_firm_short_code;
    bit<32> original_non_exec_broker_short_code;
    bit<8> block_length_uint_8_6;
    bit<8> num_in_group_6;
    bit<32> event_client_id_short_code;
    bit<32> event_exec_w_firm_short_code;
    bit<8> block_length_uint_8_7;
    bit<8> num_in_group_7;
    bit<8> market_phase_flag;
    bit<8> margin_trading_flag;
    bit<8> access_flag;
    bit<128> trader_id;
    bit<88> sender_location_id;
    bit<88> desk_id;
    bit<8> block_length_uint_8_8;
    bit<8> num_in_group_8;
    bit<128> event_investor_id;
    bit<8> block_length_uint_8_9;
    bit<8> num_in_group_9;
    bit<128> original_investor_id;
    bit<8> block_length_uint_8_10;
    bit<8> num_in_group_10;
    bit<128> clearing_account;
    bit<8> block_length_uint_8_11;
    bit<8> num_in_group_11;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
    bit<32> leg_instrument_id;
    bit<8> leg_side;
    bit<32> execution_i_d_uint_32t_optional_2;
    bit<128> trade_unique_identifier_2;
    bit<8> block_length_uint_8_12;
    bit<8> num_in_group_12;
    bit<64> evaluated_price;
    bit<8> message_price_notation;
    bit<32> final_symbol_index;
    bit<32> final_execution_id;
    bit<8> block_length_uint_8_13;
    bit<8> num_in_group_13;
    bit<128> long_client_id;
    bit<8> block_length_uint_8_14;
    bit<8> num_in_group_14;
    bit<8> original_short_code_type;
    bit<8> short_code_role;
    bit<8> short_code_role_qualifier;
    bit<8> block_length_uint_8_15;
    bit<8> num_in_group_15;
    bit<8> event_short_code_type;
    bit<8> short_code_role_2;
    bit<8> short_code_role_qualifier_2;
}

header dc_short_order_reject_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<8> order_event_type;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<64> client_order_i_d_int_64t;
    bit<8> emm;
    bit<64> event_id;
    bit<64> firm_id;
    bit<64> oegin_from_member_uint_64t_optional;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<64> order_id;
    bit<32> symbol_index;
    bit<64> breached_collar_price;
    bit<8> collar_rej_type;
    bit<8> rejected_message;
    bit<16> error_code_uint_16t;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<64> oe_session_i_d_uint_64t_optional;
    bit<8> order_side_order_sideenum_optional;
    bit<8> time_in_force_time_in_forceenum_optional;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<32> event_client_id_short_code;
    bit<32> event_exec_w_firm_short_code;
    bit<8> block_length_uint_8_2;
    bit<8> num_in_group_2;
    bit<8> event_short_code_type;
    bit<8> short_code_role;
    bit<8> short_code_role_qualifier;
}

header dc_short_trade_cancellation_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<32> execution_i_d_uint_32t;
    bit<8> emm;
    bit<64> event_id;
    bit<32> symbol_index;
    bit<64> book_in_uint_64t;
    bit<64> last_traded_px_int_64t;
    bit<64> last_shares_uint_64t;
    bit<128> trade_unique_identifier;
}

header dc_static_collars_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<8> update_type;
    bit<64> price_int_64t;
}

header trade_bust_notification_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> firm_id;
    bit<64> oe_session_i_d_uint_64t;
    bit<8> order_side_order_sideenum;
    bit<64> book_out_time_uint_64t;
    bit<64> book_in_time;
    bit<32> symbol_index;
    bit<8> emm;
    bit<32> execution_i_d_uint_32t;
    bit<64> last_shares_uint_64t;
    bit<64> last_traded_px_int_64t;
    bit<64> order_id;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<64> clearing_firm_i_d_char_8;
    bit<8> trading_capacity_trading_capacityenum;
    bit<64> oegin_from_member_uint_64t;
    bit<8> execution_phase_execution_phaseenum;
    bit<1> uncrossing_trade;
    bit<1> first_trade_price;
    bit<1> passive_order;
    bit<1> aggressive_order;
    bit<1> trade_creation_by_market_operations;
    bit<1> nav_trade_expressed_in_bps;
    bit<1> nav_trade_expressed_in_price_currency;
    bit<1> deferred_publication;
    bit<64> counterpart_firm_id;
    bit<8> order_type;
    bit<8> time_in_force_time_in_forceenum_optional;
    bit<16> clearing_instruction_clearing_instructionenum_optional;
    bit<8> technical_origin;
    bit<144> free_text;
    bit<96> account_number;
    bit<8> account_type_account_typeenum;
    bit<8> lp_role_lp_roleenum_optional;
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
    bit<32> original_invest_decis_w_firm_short_code;
    bit<32> original_non_exec_broker_short_code;
    bit<32> event_client_id_short_code;
    bit<32> event_exec_w_firm_short_code;
    bit<32> original_client_id_short_code;
    bit<32> original_exec_w_firm_short_code;
    bit<128> clearing_account;
    bit<32> lis_transaction_id;
    bit<32> parent_exec_id;
    bit<32> parent_symbol_index;
    bit<128> trade_unique_identifier;
    bit<128> parent_trade_unique_identifier;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<8> original_short_code_type;
    bit<8> short_code_role;
    bit<8> short_code_role_qualifier;
    bit<8> block_length_uint_8_2;
    bit<8> num_in_group_2;
    bit<8> event_short_code_type;
    bit<8> short_code_role_2;
    bit<8> short_code_role_qualifier_2;
}

header dc_quote_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<32> symbol_index;
    bit<8> emm;
    bit<64> event_id;
    bit<64> client_order_i_d_int_64t;
    bit<8> trading_capacity_trading_capacityenum;
    bit<8> account_type_account_typeenum;
    bit<8> lp_role_lp_roleenum;
    bit<1> dea_indicator;
    bit<1> investment_algo_indicator;
    bit<1> execution_algo_indicator;
    bit<1> commodity_derivative_indicator;
    bit<1> deferral_indicator;
    bit<1> frmaramplp;
    bit<2> reserved_2;
    bit<8> rfe_answer_unsignedchar;
    bit<64> firm_id;
    bit<1> stp_resting_order;
    bit<1> stp_incoming_order;
    bit<1> disclosed_quantity_randomization;
    bit<1> disabled_cancel_on_disconnect_indicator;
    bit<1> rfq_answer;
    bit<1> rfq_confirmation;
    bit<1> conditional_order;
    bit<1> stp_both_orders;
    bit<16> stpid;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<64> bid_size;
    bit<64> bid_px;
    bit<64> bid_quote_priority;
    bit<64> bid_order_id;
    bit<8> buy_revision_flag;
    bit<16> bid_error_code;
    bit<64> bid_oe_session_id;
    bit<8> rfe_answer_unsignedchar_optional;
    bit<64> bid_leaves_quantity;
    bit<64> bid_previous_size;
    bit<64> bid_previous_px;
    bit<8> block_length_uint_8_2;
    bit<8> num_in_group_2;
    bit<64> offer_size;
    bit<64> offer_px;
    bit<64> offer_quote_priority;
    bit<64> offer_order_id;
    bit<8> sell_revision_flag;
    bit<16> offer_error_code;
    bit<64> offer_oe_session_id;
    bit<8> rfe_answer_unsignedchar_optional_2;
    bit<64> offer_leaves_quantity;
    bit<64> offer_previous_size;
    bit<64> offer_previous_px;
    bit<8> block_length_uint_8_3;
    bit<8> num_in_group_3;
    bit<64> clearing_firm_i_d_char_8_optional;
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
    bit<16> clearing_instruction_clearing_instructionenum_optional;
    bit<144> free_text;
    bit<8> block_length_uint_8_4;
    bit<8> num_in_group_4;
    bit<32> original_client_id_short_code;
    bit<32> original_exec_w_firm_short_code;
    bit<32> original_invest_decis_w_firm_short_code;
    bit<32> original_non_exec_broker_short_code;
    bit<8> block_length_uint_8_5;
    bit<8> num_in_group_5;
    bit<32> event_client_id_short_code;
    bit<32> event_exec_w_firm_short_code;
}

header dcafqrfe_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<8> afq_reason;
    bit<64> book_out_time_uint_64t;
    bit<8> emm;
    bit<64> event_id;
    bit<32> symbol_index;
    bit<64> firm_id;
    bit<8> afq_indicator;
    bit<64> oe_session_i_d_uint_64t;
}

header dc_declaration_new_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> message_sending_time;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<64> oegin_from_member_uint_64t;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<64> event_id;
    bit<8> declaration_event_type;
    bit<64> firm_id;
    bit<64> oe_session_i_d_uint_64t;
    bit<8> account_type_account_typeenum;
    bit<64> client_order_i_d_int_64t;
    bit<8> emm;
    bit<64> declaration_id;
    bit<8> declaration_status;
    bit<64> price_int_64t_optional;
    bit<64> quantity_uint_64t_optional;
    bit<8> side;
    bit<32> symbol_index;
    bit<8> operation_type;
    bit<8> cross_order_indicator_unsignedchar;
    bit<64> entering_counterparty;
    bit<128> trader_id;
    bit<128> investor_id;
    bit<144> free_text;
    bit<64> principal_code;
    bit<64> clearing_firm_i_d_char_8_optional;
    bit<128> clearing_account;
    bit<8> settlement_period_unsignedchar;
    bit<8> settlement_flag_unsignedchar;
    bit<8> guarantee_flag_guarantee_flagenum;
    bit<8> transaction_price_type;
}

header dc_short_declaration_reject_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> message_sending_time;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<64> oegin_from_member_uint_64t;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<64> event_id;
    bit<8> declaration_event_type;
    bit<64> firm_id;
    bit<64> client_order_i_d_int_64t;
    bit<8> emm;
    bit<64> declaration_id;
    bit<32> symbol_index;
    bit<16> error_code_uint_16t;
    bit<16> rejected_message_id;
}

header dc_short_declaration_cancel_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> message_sending_time;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<64> oegin_from_member_uint_64t;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<64> event_id;
    bit<8> declaration_event_type;
    bit<64> firm_id;
    bit<64> oe_session_i_d_uint_64t;
    bit<64> client_order_i_d_int_64t;
    bit<8> emm;
    bit<64> declaration_id;
    bit<32> symbol_index;
    bit<8> declaration_kill_reason;
}

header dc_short_trade_declaration_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> event_id;
    bit<8> emm;
    bit<32> symbol_index;
    bit<32> execution_i_d_uint_32t;
    bit<8> cross_order_indicator_unsignedchar;
    bit<64> trade_time;
    bit<64> publication_time;
    bit<8> session_sessionenum_optional;
    bit<8> trade_type;
    bit<8> settlement_period_unsignedchar_optional;
    bit<8> settlement_flag_unsignedchar_optional;
    bit<8> guarantee_flag_guarantee_flagenum_optional;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<64> declaration_id;
    bit<64> price_int_64t_optional;
    bit<64> quantity_uint_64t_optional;
    bit<8> operation_type;
    bit<8> side;
    bit<64> firm_id;
    bit<16> oe_partition_i_d_uint_16t;
    bit<32> logical_access_i_d_uint_32t;
    bit<64> book_in_uint_64t;
    bit<128> trader_id;
    bit<128> investor_id;
    bit<64> principal_code;
    bit<64> clearing_firm_i_d_char_8_optional;
    bit<128> clearing_account;
    bit<8> account_type_account_typeenum;
    bit<64> client_order_i_d_int_64t;
    bit<144> free_text;
}

header dc_short_trade_declaration_cancellation_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> book_in_uint_64t;
    bit<64> event_id;
    bit<8> emm;
    bit<32> execution_i_d_uint_32t;
    bit<32> symbol_index;
    bit<64> price_int_64t;
    bit<64> quantity_uint_64t;
}

header dc_trade_bust_declaration_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> message_sending_time;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<64> oegin_from_member_uint_64t;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<64> event_id;
    bit<8> declaration_event_type;
    bit<64> firm_id;
    bit<64> oe_session_i_d_uint_64t;
    bit<8> account_type_account_typeenum;
    bit<64> client_order_i_d_int_64t;
    bit<8> emm;
    bit<64> declaration_id;
    bit<8> declaration_status;
    bit<64> price_int_64t_optional;
    bit<64> quantity_uint_64t_optional;
    bit<8> side;
    bit<32> symbol_index;
    bit<8> operation_type;
    bit<64> entering_counterparty;
    bit<128> trader_id;
    bit<128> investor_id;
    bit<144> free_text;
    bit<64> clearing_firm_i_d_char_8_optional;
    bit<128> clearing_account;
}

header dc_trade_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> event_id;
    bit<32> execution_i_d_uint_32t;
    bit<64> quantity_uint_64t;
    bit<64> price_int_64t_optional;
    bit<64> trade_time;
    bit<64> publication_time;
    bit<8> session_sessionenum_optional;
    bit<8> exec_phase;
    bit<8> transparency_indicator;
    bit<1> uncrossing_trade;
    bit<1> first_trade_price;
    bit<1> passive_order;
    bit<1> aggressive_order;
    bit<1> trade_creation_by_market_operations;
    bit<1> nav_trade_expressed_in_bps;
    bit<1> nav_trade_expressed_in_price_currency;
    bit<1> deferred_publication;
    bit<8> settlement_period_unsignedchar_optional;
    bit<8> settlement_flag_unsignedchar_optional;
    bit<8> guarantee_flag_guarantee_flagenum_optional;
    bit<8> counterparty_reason_type;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> trade_type;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<64> order_id;
    bit<8> order_side_order_sideenum;
    bit<8> order_type;
    bit<8> time_in_force_time_in_forceenum;
    bit<64> order_px;
    bit<64> client_id;
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
    bit<64> client_order_i_d_int_64t;
    bit<64> firm_id;
    bit<16> oe_partition_i_d_uint_16t_optional;
    bit<32> logical_access_i_d_uint_32t_optional;
    bit<64> book_in_uint_64t_optional;
    bit<1> uncrossing_trade_2;
    bit<1> first_trade_price_2;
    bit<1> passive_order_2;
    bit<1> aggressive_order_2;
    bit<1> trade_creation_by_market_operations_2;
    bit<1> nav_trade_expressed_in_bps_2;
    bit<1> nav_trade_expressed_in_price_currency_2;
    bit<1> deferred_publication_2;
    bit<8> account_type_internal_account_type_internalenum_optional;
    bit<8> lp_role_lp_roleenum_optional;
    bit<128> clearing_account;
    bit<144> free_text;
    bit<64> clearing_firm_i_d_char_8_optional;
    bit<128> trader_id;
    bit<128> original_investor_id;
    bit<8> cross_order_indicator_unsignedchar_optional;
    bit<16> clearing_instruction_clearing_instructionenum;
    bit<8> block_length_uint_8_2;
    bit<8> num_in_group_2;
    bit<64> declaration_id;
    bit<8> side;
    bit<8> operation_type;
    bit<64> firm_id_2;
    bit<16> oe_partition_i_d_uint_16t_optional_2;
    bit<32> logical_access_i_d_uint_32t_optional_2;
    bit<64> book_in_uint_64t_optional_2;
    bit<8> account_type_account_typeenum_optional;
    bit<64> client_order_i_d_int_64t_2;
    bit<144> free_text_2;
    bit<64> clearing_firm_i_d_char_8_optional_2;
    bit<128> clearing_account_2;
    bit<64> principal_code;
    bit<8> cross_order_indicator_unsignedchar_optional_2;
    bit<128> trader_id_2;
    bit<128> investor_id;
}

header dc_short_declaration_fill_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> message_sending_time;
    bit<64> book_in_uint_64t;
    bit<64> book_out_time_uint_64t;
    bit<64> oegin_from_member_uint_64t;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<8> operation_type;
    bit<8> declaration_event_type;
    bit<8> declaration_status;
    bit<64> event_id;
    bit<8> emm;
    bit<32> symbol_index;
    bit<64> declaration_id;
    bit<64> price_int_64t;
    bit<64> quantity_uint_64t;
    bit<8> side;
    bit<8> cross_order_indicator_unsignedchar;
    bit<64> trade_time;
    bit<64> entering_counterparty;
    bit<8> session_sessionenum_optional;
    bit<8> trade_type;
    bit<64> firm_id;
    bit<16> oe_partition_i_d_uint_16t;
    bit<32> logical_access_i_d_uint_32t;
    bit<128> trader_id;
    bit<128> investor_id;
    bit<64> principal_code;
    bit<64> clearing_firm_i_d_char_8_optional;
    bit<128> clearing_account;
    bit<8> account_type_account_typeenum;
    bit<64> client_order_i_d_int_64t;
    bit<144> free_text;
    bit<8> settlement_period_unsignedchar_optional;
    bit<8> settlement_flag_unsignedchar_optional;
    bit<8> guarantee_flag_guarantee_flagenum_optional;
}

header dc_quote_request_message_t {
    bit<32> msg_seq_num;
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> event_id;
    bit<64> book_in;
    bit<64> book_out_time_uint_64t;
    bit<64> client_order_i_d_int_64t;
    bit<1> dark_indicator;
    bit<1> deferred_trade_indicator;
    bit<1> displayed_order_interaction;
    bit<1> sweep_order_indicator;
    bit<1> minimum_quantity_type;
    bit<1> dark_stp_indicator;
    bit<1> dark_passive_order_indicator;
    bit<1> unused_dark_execution_instructionset_7;
    bit<8> emm;
    bit<88> end_client;
    bit<64> firm_id;
    bit<8> firm_id_publication;
    bit<64> oe_session_i_d_uint_64t;
    bit<64> oegin_from_member_uint_64t;
    bit<64> oegout_time_to_m_e_uint_64t;
    bit<64> order_id;
    bit<64> order_qty;
    bit<8> order_side_order_sideenum_optional;
    bit<8> rfq_status;
    bit<32> symbol_index;
    bit<64> min_order_qty;
    bit<64> sequence_time;
    bit<8> rfq_type;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
    bit<32> original_client_id_short_code;
    bit<32> original_exec_w_firm_short_code;
    bit<32> original_invest_decis_w_firm_short_code;
    bit<32> original_non_exec_broker_short_code;
    bit<8> block_length_uint_8_2;
    bit<8> num_in_group_2;
    bit<8> original_short_code_type;
    bit<8> short_code_role;
    bit<8> short_code_role_qualifier;
    bit<8> block_length_uint_8_3;
    bit<8> num_in_group_3;
    bit<64> limit_matching_price;
    bit<8> minimum_number_of_l_ps;
    bit<16> expiration_delay;
}

header dc_clear_book_message_t {
    bit<64> produce_time;
    bit<64> consume_time;
    bit<64> sequence_time;
    bit<64> book_in_time;
    bit<32> symbol_index;
    bit<8> emm;
    bit<8> clear_book_origin;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    dc_market_status_change_message_t dc_market_status_change_message;
    dc_price_update_message_t dc_price_update_message;
    long_order_message_t long_order_message;
    dc_short_order_reject_message_t dc_short_order_reject_message;
    dc_short_trade_cancellation_message_t dc_short_trade_cancellation_message;
    dc_static_collars_message_t dc_static_collars_message;
    trade_bust_notification_message_t trade_bust_notification_message;
    dc_quote_message_t dc_quote_message;
    dcafqrfe_message_t dcafqrfe_message;
    dc_declaration_new_message_t dc_declaration_new_message;
    dc_short_declaration_reject_message_t dc_short_declaration_reject_message;
    dc_short_declaration_cancel_message_t dc_short_declaration_cancel_message;
    dc_short_trade_declaration_message_t dc_short_trade_declaration_message;
    dc_short_trade_declaration_cancellation_message_t dc_short_trade_declaration_cancellation_message;
    dc_trade_bust_declaration_message_t dc_trade_bust_declaration_message;
    dc_trade_message_t dc_trade_message;
    dc_short_declaration_fill_message_t dc_short_declaration_fill_message;
    dc_quote_request_message_t dc_quote_request_message;
    dc_clear_book_message_t dc_clear_book_message;
}

parser EuronextOptiqDropcopygatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w16001: parse_dc_market_status_change_message;
            16w16003: parse_dc_price_update_message;
            16w16006: parse_long_order_message;
            16w16010: parse_dc_short_order_reject_message;
            16w16016: parse_dc_short_trade_cancellation_message;
            16w16018: parse_dc_static_collars_message;
            16w16021: parse_trade_bust_notification_message;
            16w16050: parse_dc_quote_message;
            16w16051: parse_dcafqrfe_message;
            16w16052: parse_dc_declaration_new_message;
            16w16053: parse_dc_short_declaration_reject_message;
            16w16054: parse_dc_short_declaration_cancel_message;
            16w16055: parse_dc_short_trade_declaration_message;
            16w16056: parse_dc_short_trade_declaration_cancellation_message;
            16w16057: parse_dc_trade_bust_declaration_message;
            16w16058: parse_dc_trade_message;
            16w16059: parse_dc_short_declaration_fill_message;
            16w16060: parse_dc_quote_request_message;
            16w16061: parse_dc_clear_book_message;
            default: accept;
        }
    }

    state parse_dc_market_status_change_message {
        packet.extract(hdr.dc_market_status_change_message);
        transition accept;
    }

    state parse_dc_price_update_message {
        packet.extract(hdr.dc_price_update_message);
        transition accept;
    }

    state parse_long_order_message {
        packet.extract(hdr.long_order_message);
        transition accept;
    }

    state parse_dc_short_order_reject_message {
        packet.extract(hdr.dc_short_order_reject_message);
        transition accept;
    }

    state parse_dc_short_trade_cancellation_message {
        packet.extract(hdr.dc_short_trade_cancellation_message);
        transition accept;
    }

    state parse_dc_static_collars_message {
        packet.extract(hdr.dc_static_collars_message);
        transition accept;
    }

    state parse_trade_bust_notification_message {
        packet.extract(hdr.trade_bust_notification_message);
        transition accept;
    }

    state parse_dc_quote_message {
        packet.extract(hdr.dc_quote_message);
        transition accept;
    }

    state parse_dcafqrfe_message {
        packet.extract(hdr.dcafqrfe_message);
        transition accept;
    }

    state parse_dc_declaration_new_message {
        packet.extract(hdr.dc_declaration_new_message);
        transition accept;
    }

    state parse_dc_short_declaration_reject_message {
        packet.extract(hdr.dc_short_declaration_reject_message);
        transition accept;
    }

    state parse_dc_short_declaration_cancel_message {
        packet.extract(hdr.dc_short_declaration_cancel_message);
        transition accept;
    }

    state parse_dc_short_trade_declaration_message {
        packet.extract(hdr.dc_short_trade_declaration_message);
        transition accept;
    }

    state parse_dc_short_trade_declaration_cancellation_message {
        packet.extract(hdr.dc_short_trade_declaration_cancellation_message);
        transition accept;
    }

    state parse_dc_trade_bust_declaration_message {
        packet.extract(hdr.dc_trade_bust_declaration_message);
        transition accept;
    }

    state parse_dc_trade_message {
        packet.extract(hdr.dc_trade_message);
        transition accept;
    }

    state parse_dc_short_declaration_fill_message {
        packet.extract(hdr.dc_short_declaration_fill_message);
        transition accept;
    }

    state parse_dc_quote_request_message {
        packet.extract(hdr.dc_quote_request_message);
        transition accept;
    }

    state parse_dc_clear_book_message {
        packet.extract(hdr.dc_clear_book_message);
        transition accept;
    }

}

control EuronextOptiqDropcopygatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqDropcopygatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EuronextOptiqDropcopygatewayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EuronextOptiqDropcopygatewayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqDropcopygatewayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.dc_market_status_change_message);
        packet.emit(hdr.dc_price_update_message);
        packet.emit(hdr.long_order_message);
        packet.emit(hdr.dc_short_order_reject_message);
        packet.emit(hdr.dc_short_trade_cancellation_message);
        packet.emit(hdr.dc_static_collars_message);
        packet.emit(hdr.trade_bust_notification_message);
        packet.emit(hdr.dc_quote_message);
        packet.emit(hdr.dcafqrfe_message);
        packet.emit(hdr.dc_declaration_new_message);
        packet.emit(hdr.dc_short_declaration_reject_message);
        packet.emit(hdr.dc_short_declaration_cancel_message);
        packet.emit(hdr.dc_short_trade_declaration_message);
        packet.emit(hdr.dc_short_trade_declaration_cancellation_message);
        packet.emit(hdr.dc_trade_bust_declaration_message);
        packet.emit(hdr.dc_trade_message);
        packet.emit(hdr.dc_short_declaration_fill_message);
        packet.emit(hdr.dc_quote_request_message);
        packet.emit(hdr.dc_clear_book_message);
    }
}

V1Switch(
    EuronextOptiqDropcopygatewayParser(),
    EuronextOptiqDropcopygatewayVerifyChecksum(),
    EuronextOptiqDropcopygatewayIngress(),
    EuronextOptiqDropcopygatewayEgress(),
    EuronextOptiqDropcopygatewayComputeChecksum(),
    EuronextOptiqDropcopygatewayDeparser()
) main;
