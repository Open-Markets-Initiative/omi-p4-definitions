// P4_16 (v1model) definition for: Bme BmeFixedIncome MarketAndOrder BmeGate v1.6
// 
// Protocol:
//   Organization: Bolsas y Mercados Españoles
//   Protocol: BME Fixed Income Market And Order
//   Encoding: BMEGate Binary Interface
//   Version: 1.6
//   Date: 06/13/2025
//   Specification: BMEGate binary protocol B1.6.pdf
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
    bit<16> message_size;
    bit<8> message_type;
}

header logon_response_message_t {
    bit<32> sequence_number;
    bit<8> heart_bt_int;
    bit<48> protocol_version;
    bit<8> test_production_ind;
    bit<16> environment_code;
    bit<32> session_date;
    bit<32> expected_sequence_number;
    bit<32> sequence_number_to;
}

header logout_response_message_t {
    bit<32> sequence_number;
    bit<8> logout_reason;
}

header heartbeat_message_t {
    bit<32> sequence_number;
}

header network_status_message_t {
    bit<32> sequence_number;
    bit<8> network_status_value;
}

header logon_message_t {
    bit<56> username;
    bit<80> password;
    bit<200> software_name;
    bit<32> expected_sequence_number;
    bit<8> subscriptions;
    bit<48> protocol_version;
}

header reject_message_t {
    bit<32> sequence_number;
    bit<8> session_reject_reason;
    bit<464> text_c_58;
    bit<56> msg_rejected_reference;
}

header trading_session_status_message_t {
    bit<32> sequence_number;
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> trad_ses_status;
    bit<64> transaction_date_and_time;
}

header news_message_t {
    bit<32> sequence_number;
    bit<624> news_text;
}

header security_list_cancellation_report_message_t {
    bit<32> sequence_number;
    bit<32> market_id;
    bit<32> market_segment_id;
    bit<32> security_code;
    bit<176> symbol;
    bit<96> symbol_isin;
}

header statistics_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<8> data_count;
}

header statistics_message_statistics_repeating_group_t {
    bit<8> data_code;
    bit<64> data_value;
}

header security_list_message_t {
    bit<32> sequence_number;
    bit<32> market_id;
    bit<32> market_segment_id;
    bit<32> security_code;
    bit<176> symbol;
    bit<96> symbol_isin;
    bit<280> fisn;
    bit<160> issuer_lei;
    bit<16> security_group;
    bit<48> cfi_code;
    bit<16> security_type;
    bit<32> maturity_date;
    bit<32> issue_date;
    bit<64> contract_multiplier;
    bit<64> li_spre;
    bit<64> sst_ipre;
    bit<64> li_spost;
    bit<64> sst_ipost;
    bit<8> liquid_instrument;
    bit<8> admission_requested_by_issuer;
    bit<32> min_trade_vol;
    bit<32> round_lot;
    bit<24> currency;
    bit<32> modality_mask_b_4;
    bit<640> security_description;
    bit<8> trading_obligation;
    bit<320> security_name;
    bit<8> security_status;
    bit<32> coupon_payment_date;
    bit<64> min_price_increment;
    bit<8> number_of_decimals;
    bit<8> order_number_of_decimals;
    bit<64> coupon_rate;
    bit<96> issuer;
    bit<8> trading_scope_b_1;
    bit<32> first_trading_date;
    bit<8> settlement_system;
    bit<64> maturity;
    bit<8> coupon_periodicity;
    bit<8> benchmark;
    bit<8> strippable;
    bit<64> volume_issued;
    bit<64> alive_volume;
    bit<8> coupon_type;
    bit<8> coupon_quotation;
    bit<8> accrued_interest_calculation_procedure;
    bit<32> next_redemption_date;
    bit<16> type_of_redemption;
    bit<64> facial;
    bit<8> calculation_method;
    bit<32> date_last_coupon_was_paid;
    bit<32> bond_seniority;
    bit<32> interest_accrual_date;
    bit<32> start_date;
    bit<8> price_type;
    bit<64> spread_to_index;
    bit<32> benchmark_curve_points_units;
    bit<8> benchmark_curve_points_value;
    bit<200> benchmark_security_id;
    bit<64> accrued_interest_rate_r_8;
}

header security_list_update_report_message_t {
    bit<32> sequence_number;
    bit<32> market_id;
    bit<32> market_segment_id;
    bit<32> security_code;
    bit<176> symbol;
    bit<96> symbol_isin;
    bit<280> fisn;
    bit<160> issuer_lei;
    bit<16> security_group;
    bit<48> cfi_code;
    bit<16> security_type;
    bit<32> maturity_date;
    bit<32> issue_date;
    bit<64> contract_multiplier;
    bit<64> li_spre;
    bit<64> sst_ipre;
    bit<64> li_spost;
    bit<64> sst_ipost;
    bit<8> liquid_instrument;
    bit<8> admission_requested_by_issuer;
    bit<32> min_trade_vol;
    bit<32> round_lot;
    bit<24> currency;
    bit<32> modality_mask_b_4;
    bit<640> security_description;
    bit<8> trading_obligation;
    bit<320> security_name;
    bit<8> security_status;
    bit<32> coupon_payment_date;
    bit<64> min_price_increment;
    bit<8> number_of_decimals;
    bit<8> order_number_of_decimals;
    bit<64> coupon_rate;
    bit<96> issuer;
    bit<8> trading_scope_b_1;
    bit<32> first_trading_date;
    bit<8> settlement_system;
    bit<64> maturity;
    bit<8> coupon_periodicity;
    bit<8> benchmark;
    bit<8> strippable;
    bit<64> volume_issued;
    bit<64> alive_volume;
    bit<8> coupon_type;
    bit<8> coupon_quotation;
    bit<8> accrued_interest_calculation_procedure;
    bit<32> next_redemption_date;
    bit<16> type_of_redemption;
    bit<64> facial;
    bit<8> calculation_method;
    bit<32> date_last_coupon_was_paid;
    bit<32> bond_seniority;
    bit<32> interest_accrual_date;
    bit<32> start_date;
    bit<8> price_type;
    bit<64> spread_to_index;
    bit<32> benchmark_curve_points_units;
    bit<8> benchmark_curve_points_value;
    bit<200> benchmark_security_id;
    bit<64> accrued_interest_rate_r_8;
}

header security_status_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<64> reference_price;
    bit<8> security_trading_status;
    bit<8> non_availability_reason;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<8> static_range_type;
    bit<64> order_static_range;
    bit<64> block_static_range;
}

header order_book_clear_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
}

header order_market_pre_transparency_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<8> side;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
}

header quote_market_pre_transparency_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> secondary_order_id_2;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
}

header order_cancellation_market_member_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> entry_date;
}

header quote_cancellation_market_member_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> secondary_order_id_2;
}

header trade_market_post_transparency_information_topofbook_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
}

header trade_trade_amendment_or_cancellation_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<8> last_change_flag;
    bit<8> bencrfpt_flag;
    bit<8> trade_price_condition;
    bit<8> pre_trade_transparency_waiver;
    bit<8> deferral_waiver;
    bit<8> post_deferral_publication_type;
    bit<64> publish_date_and_time;
    bit<64> trade_date;
    bit<32> trade_session_date;
    bit<32> settl_date_2;
    bit<64> end_cash;
    bit<8> amended_trade_type;
    bit<32> exec_ref_id;
    bit<32> amended_trade_date;
}

header trade_market_post_transparency_information_full_depth_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> secondary_order_id_2;
    bit<32> entry_date_2;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
}

header indication_of_interest_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> ioiid;
    bit<8> ioi_trans_type;
    bit<8> side;
    bit<32> ioi_qty;
    bit<64> ioi_price;
    bit<8> trading_session_id;
}

header rfq_market_pre_transparency_information_message_t {
    bit<32> sequence_number;
    bit<32> rfqid;
    bit<8> trading_session_id;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<64> mid_buy_price;
    bit<32> mid_buy_volume;
    bit<16> buy_rf_qs_number;
    bit<64> mid_sell_price;
    bit<32> mid_sell_volume;
    bit<16> sell_rf_qs_number;
    bit<16> bid_orders_1;
    bit<32> bid_size_1;
    bit<64> bid_px_1;
    bit<16> ask_orders_1;
    bit<32> ask_size_1;
    bit<64> ask_px_1;
    bit<16> bid_orders_2;
    bit<32> bid_size_2;
    bit<64> bid_px_2;
    bit<16> ask_orders_2;
    bit<32> ask_size_2;
    bit<64> ask_px_2;
    bit<16> bid_orders_3;
    bit<32> bid_size_3;
    bit<64> bid_px_3;
    bit<16> ask_orders_3;
    bit<32> ask_size_3;
    bit<64> ask_px_3;
    bit<16> bid_orders_4;
    bit<32> bid_size_4;
    bit<64> bid_px_4;
    bit<16> ask_orders_4;
    bit<32> ask_size_4;
    bit<64> ask_px_4;
    bit<16> bid_orders_5;
    bit<32> bid_size_5;
    bit<64> bid_px_5;
    bit<16> ask_orders_5;
    bit<32> ask_size_5;
    bit<64> ask_px_5;
}

header topofbook_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<16> bid_orders_1;
    bit<32> bid_size_1;
    bit<64> bid_px_1;
    bit<64> alt_bid_px_1;
    bit<16> ask_orders_1;
    bit<32> ask_size_1;
    bit<64> ask_px_1;
    bit<64> alt_sell_px_1;
}

header order_and_quote_client_data_message_t {
    bit<32> request_id;
    bit<16> client_data_id;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<120> client_data_reference;
}

header simple_new_order_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<16> client_data_id;
    bit<32> order_id;
    bit<8> side;
    bit<64> price;
    bit<32> order_qty;
    bit<8> time_in_force;
}

header simple_new_order_with_client_data_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<32> order_id;
    bit<8> side;
    bit<64> price;
    bit<32> order_qty;
    bit<8> time_in_force;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<120> client_data_reference;
}

header simple_order_modification_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<32> order_id;
    bit<8> side;
    bit<64> price;
    bit<32> order_qty;
    bit<16> client_data_id;
}

header simple_order_modification_with_client_data_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<32> order_id;
    bit<8> side;
    bit<64> price;
    bit<32> order_qty;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<120> client_data_reference;
}

header order_cancellation_request_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<32> order_id;
}

header new_quote_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<16> client_data_id;
    bit<32> bid_size_1;
    bit<64> bid_px_1;
    bit<32> ask_size_1;
    bit<64> ask_px_1;
}

header quote_modification_request_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<16> client_data_id;
    bit<64> bid_px_1;
    bit<64> ask_px_1;
}

header quote_cancellation_request_message_t {
    bit<32> request_id;
    bit<32> security_code;
    bit<16> client_data_id;
}

header mass_orderquote_cancellation_message_t {
    bit<32> request_id;
    bit<40> account;
    bit<32> security_code;
    bit<8> side;
    bit<8> cancellation_type;
    bit<96> issuer;
    bit<128> account_bolsa;
    bit<32> account_member;
    bit<8> order_or_quote_cancel;
}

header order_and_quote_client_data_parameters_ack_nack_message_t {
    bit<32> sequence_number;
    bit<32> request_id;
    bit<8> status;
    bit<16> client_data_id;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<120> client_data_reference;
}

header simple_order_status_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<8> side;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ord_rej_reason;
    bit<8> exec_type;
    bit<32> request_id;
    bit<16> client_data_id;
}

header quote_status_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> secondary_order_id;
    bit<32> secondary_order_id_2;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ord_rej_reason;
    bit<8> exec_type;
    bit<32> order_id_2;
    bit<32> secondary_exec_id_2;
    bit<32> order_qty_2;
    bit<8> ord_status_2;
    bit<8> ord_rej_reason_2;
    bit<8> exec_type_2;
    bit<32> request_id;
    bit<16> client_data_id;
}

header order_cancel_reject_message_t {
    bit<32> sequence_number;
    bit<64> transaction_date_and_time;
    bit<32> order_id;
    bit<8> ord_status;
    bit<8> cxl_rej_response_to;
    bit<8> cxl_rej_reason;
    bit<32> request_id;
}

header mass_orderquote_cancellation_completion_message_t {
    bit<32> sequence_number;
    bit<64> transaction_date_and_time;
    bit<8> trading_unit;
    bit<8> cancellation_type;
    bit<8> order_or_quote_cancel;
    bit<32> request_id;
}

header mass_orderquote_cancellation_reject_message_t {
    bit<32> sequence_number;
    bit<64> transaction_date_and_time;
    bit<8> trading_unit;
    bit<8> mass_cancel_reject_reason;
}

header business_message_reject_message_t {
    bit<32> sequence_number;
    bit<64> transaction_date_and_time;
    bit<8> ref_msg_type;
    bit<8> business_reject_reason;
    bit<520> text_c_65;
    bit<32> request_id;
}

header execution_private_information_2_legs_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ccp_code;
    bit<8> aggressor_indicator;
    bit<32> request_id;
    bit<16> client_data_id;
    bit<32> secondary_order_id_2;
    bit<32> entry_date_2;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
    bit<32> order_id_2;
    bit<32> secondary_exec_id_2;
    bit<32> order_qty_2;
    bit<8> ord_status_2;
    bit<8> ccp_code_2;
    bit<8> aggressor_indicator_2;
    bit<32> request_id_2;
    bit<16> client_data_id_2;
}

header trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<8> last_change_flag;
    bit<8> bencrfpt_flag;
    bit<8> trade_price_condition;
    bit<8> pre_trade_transparency_waiver;
    bit<8> deferral_waiver;
    bit<8> post_deferral_publication_type;
    bit<64> publish_date_and_time;
    bit<64> trade_date;
    bit<32> trade_session_date;
    bit<32> settl_date_2;
    bit<64> end_cash;
    bit<8> amended_trade_type;
    bit<32> exec_ref_id;
    bit<32> amended_trade_date;
    bit<24> broker_trader;
    bit<120> broker_text;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ccp_code;
    bit<8> aggressor_indicator;
    bit<32> request_id;
    bit<16> client_data_id;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<32> member;
    bit<24> trader;
    bit<8> sub_member;
    bit<32> cross_id;
    bit<32> order_security_code;
}

header trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<8> last_change_flag;
    bit<8> bencrfpt_flag;
    bit<8> trade_price_condition;
    bit<8> pre_trade_transparency_waiver;
    bit<8> deferral_waiver;
    bit<8> post_deferral_publication_type;
    bit<64> publish_date_and_time;
    bit<64> trade_date;
    bit<32> trade_session_date;
    bit<32> settl_date_2;
    bit<64> end_cash;
    bit<8> amended_trade_type;
    bit<32> exec_ref_id;
    bit<32> amended_trade_date;
    bit<24> broker_trader;
    bit<120> broker_text;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ccp_code;
    bit<8> aggressor_indicator;
    bit<32> request_id;
    bit<16> client_data_id;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<32> member;
    bit<24> trader;
    bit<8> sub_member;
    bit<32> cross_id;
    bit<32> order_security_code;
}

header trade_trade_amendment_or_cancellation_2_legs_private_information_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<8> last_change_flag;
    bit<8> bencrfpt_flag;
    bit<8> trade_price_condition;
    bit<8> pre_trade_transparency_waiver;
    bit<8> deferral_waiver;
    bit<8> post_deferral_publication_type;
    bit<64> publish_date_and_time;
    bit<64> trade_date;
    bit<32> trade_session_date;
    bit<32> settl_date_2;
    bit<64> end_cash;
    bit<8> amended_trade_type;
    bit<32> exec_ref_id;
    bit<32> amended_trade_date;
    bit<24> broker_trader;
    bit<120> broker_text;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ccp_code;
    bit<8> aggressor_indicator;
    bit<32> request_id;
    bit<16> client_data_id;
    bit<8> algorithmic_trade_indicator;
    bit<32> client_id;
    bit<128> account_bolsa;
    bit<40> account;
    bit<8> dea_flag;
    bit<32> decisor_id;
    bit<32> executor_id;
    bit<8> liquidity_provision_activity;
    bit<32> account_member;
    bit<8> last_capacity;
    bit<8> received_dept_id;
    bit<8> persistence;
    bit<32> member;
    bit<24> trader;
    bit<8> sub_member;
    bit<32> cross_id;
    bit<32> order_security_code;
    bit<32> secondary_order_id_2;
    bit<32> entry_date_2;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
    bit<32> order_id_2;
    bit<32> secondary_exec_id_2;
    bit<32> order_qty_2;
    bit<8> ord_status_2;
    bit<8> ccp_code_2;
    bit<8> aggressor_indicator_2;
    bit<32> request_id_2;
    bit<16> client_data_id_2;
    bit<8> algorithmic_trade_indicator_2;
    bit<32> client_id_2;
    bit<128> account_bolsa_2;
    bit<40> account_2;
    bit<8> dea_flag_2;
    bit<32> decisor_id_2;
    bit<32> executor_id_2;
    bit<8> liquidity_provision_activity_2;
    bit<32> account_member_2;
    bit<8> last_capacity_2;
    bit<8> received_dept_id_2;
    bit<8> persistence_2;
    bit<32> member_2;
    bit<24> trader_2;
    bit<8> sub_member_2;
    bit<32> cross_id_2;
    bit<32> order_security_code_2;
}

header execution_private_information_1_leg_buy_market_order_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> order_id;
    bit<32> secondary_exec_id;
    bit<32> order_qty;
    bit<8> ord_status;
    bit<8> ccp_code;
    bit<8> aggressor_indicator;
    bit<32> request_id;
    bit<16> client_data_id;
    bit<32> secondary_order_id_2;
    bit<32> entry_date_2;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
}

header execution_private_information_1_leg_sell_market_order_message_t {
    bit<32> sequence_number;
    bit<32> security_code;
    bit<64> transaction_date_and_time;
    bit<32> market_segment_id;
    bit<8> trading_session_id;
    bit<32> trd_match_id;
    bit<8> trade_type;
    bit<64> last_px;
    bit<32> last_qty;
    bit<64> gross_trade_amt;
    bit<8> designation;
    bit<8> market_mechanism;
    bit<8> algo_flag;
    bit<64> alt_last_px;
    bit<64> accrued_interest_amt;
    bit<64> accrued_interest_rate_p_8;
    bit<32> settl_date;
    bit<8> transaction_category;
    bit<32> secondary_order_id;
    bit<32> entry_date;
    bit<32> priority;
    bit<64> price;
    bit<32> display_qty;
    bit<64> alt_price;
    bit<32> secondary_order_id_2;
    bit<32> entry_date_2;
    bit<32> priority_2;
    bit<64> price_2;
    bit<32> display_qty_2;
    bit<64> alt_price_2;
    bit<32> order_id_2;
    bit<32> secondary_exec_id_2;
    bit<32> order_qty_2;
    bit<8> ord_status_2;
    bit<8> ccp_code_2;
    bit<8> aggressor_indicator_2;
    bit<32> request_id_2;
    bit<16> client_data_id_2;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> statistics_message_statistics_repeating_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    logon_response_message_t logon_response_message;
    logout_response_message_t logout_response_message;
    heartbeat_message_t heartbeat_message;
    network_status_message_t network_status_message;
    logon_message_t logon_message;
    reject_message_t reject_message;
    trading_session_status_message_t trading_session_status_message;
    news_message_t news_message;
    security_list_cancellation_report_message_t security_list_cancellation_report_message;
    statistics_message_t statistics_message;
    statistics_message_statistics_repeating_group_t statistics_message_statistics_repeating_group[MAX_MESSAGES];
    security_list_message_t security_list_message;
    security_list_update_report_message_t security_list_update_report_message;
    security_status_message_t security_status_message;
    order_book_clear_message_t order_book_clear_message;
    order_market_pre_transparency_information_message_t order_market_pre_transparency_information_message;
    quote_market_pre_transparency_information_message_t quote_market_pre_transparency_information_message;
    order_cancellation_market_member_message_t order_cancellation_market_member_message;
    quote_cancellation_market_member_message_t quote_cancellation_market_member_message;
    trade_market_post_transparency_information_topofbook_message_t trade_market_post_transparency_information_topofbook_message;
    trade_trade_amendment_or_cancellation_message_t trade_trade_amendment_or_cancellation_message;
    trade_market_post_transparency_information_full_depth_message_t trade_market_post_transparency_information_full_depth_message;
    indication_of_interest_message_t indication_of_interest_message;
    rfq_market_pre_transparency_information_message_t rfq_market_pre_transparency_information_message;
    topofbook_message_t topofbook_message;
    order_and_quote_client_data_message_t order_and_quote_client_data_message;
    simple_new_order_message_t simple_new_order_message;
    simple_new_order_with_client_data_message_t simple_new_order_with_client_data_message;
    simple_order_modification_message_t simple_order_modification_message;
    simple_order_modification_with_client_data_message_t simple_order_modification_with_client_data_message;
    order_cancellation_request_message_t order_cancellation_request_message;
    new_quote_message_t new_quote_message;
    quote_modification_request_message_t quote_modification_request_message;
    quote_cancellation_request_message_t quote_cancellation_request_message;
    mass_orderquote_cancellation_message_t mass_orderquote_cancellation_message;
    order_and_quote_client_data_parameters_ack_nack_message_t order_and_quote_client_data_parameters_ack_nack_message;
    simple_order_status_message_t simple_order_status_message;
    quote_status_message_t quote_status_message;
    order_cancel_reject_message_t order_cancel_reject_message;
    mass_orderquote_cancellation_completion_message_t mass_orderquote_cancellation_completion_message;
    mass_orderquote_cancellation_reject_message_t mass_orderquote_cancellation_reject_message;
    business_message_reject_message_t business_message_reject_message;
    execution_private_information_2_legs_message_t execution_private_information_2_legs_message;
    trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message_t trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message;
    trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message_t trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message;
    trade_trade_amendment_or_cancellation_2_legs_private_information_message_t trade_trade_amendment_or_cancellation_2_legs_private_information_message;
    execution_private_information_1_leg_buy_market_order_message_t execution_private_information_1_leg_buy_market_order_message;
    execution_private_information_1_leg_sell_market_order_message_t execution_private_information_1_leg_sell_market_order_message;
}

parser BmefixedincomeMarketandorderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x08: parse_logon_response_message;
            8w0x0B: parse_logout_response_message;
            8w0x30: parse_heartbeat_message;
            8w0x0A: parse_network_status_message;
            8w0x41: parse_logon_message;
            8w0x35: parse_logout_message;
            8w0x0D: parse_reject_message;
            8w0x68: parse_trading_session_status_message;
            8w0x42: parse_news_message;
            8w0x78: parse_security_list_cancellation_report_message;
            8w0x84: parse_statistics_message;
            8w0x79: parse_security_list_message;
            8w0x80: parse_security_list_update_report_message;
            8w0x66: parse_security_status_message;
            8w0x81: parse_order_book_clear_message;
            8w0x03: parse_order_market_pre_transparency_information_message;
            8w0x07: parse_quote_market_pre_transparency_information_message;
            8w0x01: parse_order_cancellation_market_member_message;
            8w0x05: parse_quote_cancellation_market_member_message;
            8w0x10: parse_trade_market_post_transparency_information_topofbook_message;
            8w0x18: parse_trade_trade_amendment_or_cancellation_message;
            8w0x11: parse_trade_market_post_transparency_information_full_depth_message;
            8w0x36: parse_indication_of_interest_message;
            8w0x85: parse_rfq_market_pre_transparency_information_message;
            8w0x82: parse_topofbook_message;
            8w0x6F: parse_order_and_quote_client_data_message;
            8w0x44: parse_simple_new_order_message;
            8w0x45: parse_simple_new_order_with_client_data_message;
            8w0x47: parse_simple_order_modification_message;
            8w0x48: parse_simple_order_modification_with_client_data_message;
            8w0x46: parse_order_cancellation_request_message;
            8w0x53: parse_new_quote_message;
            8w0x61: parse_quote_modification_request_message;
            8w0x5A: parse_quote_cancellation_request_message;
            8w0x71: parse_mass_orderquote_cancellation_message;
            8w0x87: parse_order_and_quote_client_data_parameters_ack_nack_message;
            8w0x02: parse_simple_order_status_message;
            8w0x06: parse_quote_status_message;
            8w0x39: parse_order_cancel_reject_message;
            8w0x72: parse_mass_orderquote_cancellation_completion_message;
            8w0x73: parse_mass_orderquote_cancellation_reject_message;
            8w0x6A: parse_business_message_reject_message;
            8w0x17: parse_execution_private_information_2_legs_message;
            8w0x1A: parse_trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message;
            8w0x1C: parse_trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message;
            8w0x1E: parse_trade_trade_amendment_or_cancellation_2_legs_private_information_message;
            8w0x13: parse_execution_private_information_1_leg_buy_market_order_message;
            8w0x15: parse_execution_private_information_1_leg_sell_market_order_message;
            default: accept;
        }
    }

    state parse_logon_response_message {
        packet.extract(hdr.logon_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_response_message {
        packet.extract(hdr.logout_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_network_status_message {
        packet.extract(hdr.network_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_news_message {
        packet.extract(hdr.news_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_list_cancellation_report_message {
        packet.extract(hdr.security_list_cancellation_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_statistics_message {
        packet.extract(hdr.statistics_message);
        meta.dispatched = 1;
        meta.statistics_message_statistics_repeating_group_remaining = hdr.statistics_message.data_count;
        transition select(meta.statistics_message_statistics_repeating_group_remaining) {
            8w0: accept;
            default: parse_statistics_message_statistics_repeating_group;
        }
    }

    state parse_statistics_message_statistics_repeating_group {
        packet.extract(hdr.statistics_message_statistics_repeating_group.next);
        meta.statistics_message_statistics_repeating_group_remaining = meta.statistics_message_statistics_repeating_group_remaining - 1;
        transition select(meta.statistics_message_statistics_repeating_group_remaining) {
            8w0: accept;
            default: parse_statistics_message_statistics_repeating_group;
        }
    }

    state parse_security_list_message {
        packet.extract(hdr.security_list_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_list_update_report_message {
        packet.extract(hdr.security_list_update_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_clear_message {
        packet.extract(hdr.order_book_clear_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_market_pre_transparency_information_message {
        packet.extract(hdr.order_market_pre_transparency_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_market_pre_transparency_information_message {
        packet.extract(hdr.quote_market_pre_transparency_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_market_member_message {
        packet.extract(hdr.order_cancellation_market_member_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_cancellation_market_member_message {
        packet.extract(hdr.quote_cancellation_market_member_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_market_post_transparency_information_topofbook_message {
        packet.extract(hdr.trade_market_post_transparency_information_topofbook_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_trade_amendment_or_cancellation_message {
        packet.extract(hdr.trade_trade_amendment_or_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_market_post_transparency_information_full_depth_message {
        packet.extract(hdr.trade_market_post_transparency_information_full_depth_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indication_of_interest_message {
        packet.extract(hdr.indication_of_interest_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rfq_market_pre_transparency_information_message {
        packet.extract(hdr.rfq_market_pre_transparency_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_topofbook_message {
        packet.extract(hdr.topofbook_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_and_quote_client_data_message {
        packet.extract(hdr.order_and_quote_client_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_new_order_message {
        packet.extract(hdr.simple_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_new_order_with_client_data_message {
        packet.extract(hdr.simple_new_order_with_client_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_order_modification_message {
        packet.extract(hdr.simple_order_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_order_modification_with_client_data_message {
        packet.extract(hdr.simple_order_modification_with_client_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_request_message {
        packet.extract(hdr.order_cancellation_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_quote_message {
        packet.extract(hdr.new_quote_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_modification_request_message {
        packet.extract(hdr.quote_modification_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_cancellation_request_message {
        packet.extract(hdr.quote_cancellation_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_orderquote_cancellation_message {
        packet.extract(hdr.mass_orderquote_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_and_quote_client_data_parameters_ack_nack_message {
        packet.extract(hdr.order_and_quote_client_data_parameters_ack_nack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_order_status_message {
        packet.extract(hdr.simple_order_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_status_message {
        packet.extract(hdr.quote_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_reject_message {
        packet.extract(hdr.order_cancel_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_orderquote_cancellation_completion_message {
        packet.extract(hdr.mass_orderquote_cancellation_completion_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_orderquote_cancellation_reject_message {
        packet.extract(hdr.mass_orderquote_cancellation_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_business_message_reject_message {
        packet.extract(hdr.business_message_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_private_information_2_legs_message {
        packet.extract(hdr.execution_private_information_2_legs_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message {
        packet.extract(hdr.trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message {
        packet.extract(hdr.trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_trade_amendment_or_cancellation_2_legs_private_information_message {
        packet.extract(hdr.trade_trade_amendment_or_cancellation_2_legs_private_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_private_information_1_leg_buy_market_order_message {
        packet.extract(hdr.execution_private_information_1_leg_buy_market_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_private_information_1_leg_sell_market_order_message {
        packet.extract(hdr.execution_private_information_1_leg_sell_market_order_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control BmefixedincomeMarketandorderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmefixedincomeMarketandorderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmefixedincomeMarketandorderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmefixedincomeMarketandorderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmefixedincomeMarketandorderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.logon_response_message);
        packet.emit(hdr.logout_response_message);
        packet.emit(hdr.heartbeat_message);
        packet.emit(hdr.network_status_message);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.news_message);
        packet.emit(hdr.security_list_cancellation_report_message);
        packet.emit(hdr.statistics_message);
        packet.emit(hdr.statistics_message_statistics_repeating_group);
        packet.emit(hdr.security_list_message);
        packet.emit(hdr.security_list_update_report_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.order_book_clear_message);
        packet.emit(hdr.order_market_pre_transparency_information_message);
        packet.emit(hdr.quote_market_pre_transparency_information_message);
        packet.emit(hdr.order_cancellation_market_member_message);
        packet.emit(hdr.quote_cancellation_market_member_message);
        packet.emit(hdr.trade_market_post_transparency_information_topofbook_message);
        packet.emit(hdr.trade_trade_amendment_or_cancellation_message);
        packet.emit(hdr.trade_market_post_transparency_information_full_depth_message);
        packet.emit(hdr.indication_of_interest_message);
        packet.emit(hdr.rfq_market_pre_transparency_information_message);
        packet.emit(hdr.topofbook_message);
        packet.emit(hdr.order_and_quote_client_data_message);
        packet.emit(hdr.simple_new_order_message);
        packet.emit(hdr.simple_new_order_with_client_data_message);
        packet.emit(hdr.simple_order_modification_message);
        packet.emit(hdr.simple_order_modification_with_client_data_message);
        packet.emit(hdr.order_cancellation_request_message);
        packet.emit(hdr.new_quote_message);
        packet.emit(hdr.quote_modification_request_message);
        packet.emit(hdr.quote_cancellation_request_message);
        packet.emit(hdr.mass_orderquote_cancellation_message);
        packet.emit(hdr.order_and_quote_client_data_parameters_ack_nack_message);
        packet.emit(hdr.simple_order_status_message);
        packet.emit(hdr.quote_status_message);
        packet.emit(hdr.order_cancel_reject_message);
        packet.emit(hdr.mass_orderquote_cancellation_completion_message);
        packet.emit(hdr.mass_orderquote_cancellation_reject_message);
        packet.emit(hdr.business_message_reject_message);
        packet.emit(hdr.execution_private_information_2_legs_message);
        packet.emit(hdr.trade_trade_amendment_or_cancellation_1_leg_buy_private_information_message);
        packet.emit(hdr.trade_trade_amendment_or_cancellation_1_leg_sell_private_information_message);
        packet.emit(hdr.trade_trade_amendment_or_cancellation_2_legs_private_information_message);
        packet.emit(hdr.execution_private_information_1_leg_buy_market_order_message);
        packet.emit(hdr.execution_private_information_1_leg_sell_market_order_message);
    }
}

V1Switch(
    BmefixedincomeMarketandorderParser(),
    BmefixedincomeMarketandorderVerifyChecksum(),
    BmefixedincomeMarketandorderIngress(),
    BmefixedincomeMarketandorderEgress(),
    BmefixedincomeMarketandorderComputeChecksum(),
    BmefixedincomeMarketandorderDeparser()
) main;
