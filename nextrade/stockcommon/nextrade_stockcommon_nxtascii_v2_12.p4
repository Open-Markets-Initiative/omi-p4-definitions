// P4_16 (v1model) definition for: Nextrade StockCommon NxtAscii v2.12
// 
// Protocol:
//   Organization: Nextrade
//   Protocol: Nextrade Stock Market Data Common
//   Encoding: Nextrade Ascii Standard Message
//   Version: 2.12
//   Date: 08/13/2026
//   Specification: Unknown
// 
// Byte order: big (P4 extracts in network/big-endian order)
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

header packet_header_t {
    bit<40> tr_code;
}

header polling_data_message_t {
    bit<32> current_time_1_minute_interval;
    bit<8> end_keyword;
}

header securities_quote_10_level_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<88> ask_level_1_price;
    bit<88> bid_level_1_price;
    bit<96> ask_level_1_volume;
    bit<96> bid_level_1_volume;
    bit<88> ask_level_2_price;
    bit<88> bid_level_2_price;
    bit<96> ask_level_2_volume;
    bit<96> bid_level_2_volume;
    bit<88> ask_level_3_price;
    bit<88> bid_level_3_price;
    bit<96> ask_level_3_volume;
    bit<96> bid_level_3_volume;
    bit<88> ask_level_4_price;
    bit<88> bid_level_4_price;
    bit<96> ask_level_4_volume;
    bit<96> bid_level_4_volume;
    bit<88> ask_level_5_price;
    bit<88> bid_level_5_price;
    bit<96> ask_level_5_volume;
    bit<96> bid_level_5_volume;
    bit<88> ask_level_6_price;
    bit<88> bid_level_6_price;
    bit<96> ask_level_6_volume;
    bit<96> bid_level_6_volume;
    bit<88> ask_level_7_price;
    bit<88> bid_level_7_price;
    bit<96> ask_level_7_volume;
    bit<96> bid_level_7_volume;
    bit<88> ask_level_8_price;
    bit<88> bid_level_8_price;
    bit<96> ask_level_8_volume;
    bit<96> bid_level_8_volume;
    bit<88> ask_level_9_price;
    bit<88> bid_level_9_price;
    bit<96> ask_level_9_volume;
    bit<96> bid_level_9_volume;
    bit<88> ask_level_10_price;
    bit<88> bid_level_10_price;
    bit<96> ask_level_10_volume;
    bit<96> bid_level_10_volume;
    bit<96> total_ask_volume;
    bit<96> total_bid_volume;
    bit<88> estimated_trading_price;
    bit<96> estimated_trading_volume;
    bit<88> mid_price;
    bit<96> total_mid_price_ask_volume_total_ask_volume_on_mid_price;
    bit<96> total_mid_price_bid_volume_total_bid_volume_on_mid_price;
    bit<8> end_keyword;
}

header securities_order_filled_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<8> price_change_against_previous_day;
    bit<88> a_price_change_against_the_previous_day;
    bit<88> trading_price;
    bit<80> trading_volume;
    bit<88> opening_price;
    bit<88> todays_high;
    bit<88> todays_low;
    bit<96> accumulated_trading_volume;
    bit<176> accumulated_trading_value;
    bit<8> final_ask_bid_type_code;
    bit<120> lp_holding_quantity;
    bit<88> the_best_ask;
    bit<88> the_best_bid;
    bit<8> end_keyword;
}

header market_operation_ts_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<24> board_event_id;
    bit<72> start_time_of_a_board_event;
    bit<40> board_event_group_code;
    bit<24> trading_halt_reason_code;
    bit<8> end_keyword;
}

header issue_closing_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<88> closing_price;
    bit<8> closing_price_type_code;
    bit<88> upper_limit_price_on_the_single_price_trade_in_the_off_hours_session;
    bit<88> lower_limit_price_on_the_single_price_trade_in_the_off_hours_session;
    bit<88> closing_price_weighted_stock_price_average;
    bit<88> closing_price_base_price_of_buy_in;
    bit<88> closing_price_upper_limit_of_buy_in;
    bit<88> closing_price_lower_limit_of_buy_in;
    bit<8> end_keyword;
}

header triggering_removing_vi_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<72> the_time_ending_vi;
    bit<8> vi_status_code;
    bit<8> vi_type_code;
    bit<88> a_base_price_to_trigger_static_vi;
    bit<88> a_base_price_to_trigger_dynamic_vi;
    bit<88> vi_triggering_price;
    bit<104> disparate_ratio_to_trigger_static_vi;
    bit<104> disparate_ratio_to_trigger_dynamic_vi;
    bit<8> end_keyword;
}

header closing_price_trading_quote_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> total_ask_volume;
    bit<96> total_bid_volume;
    bit<8> end_keyword;
}

header equities_snapshot_10_level_message_t {
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<8> price_change_against_previous_day;
    bit<88> a_price_change_against_the_previous_day;
    bit<88> upper_limit_price;
    bit<88> lower_limit_price;
    bit<88> current_price;
    bit<88> opening_price;
    bit<88> todays_high;
    bit<88> todays_low;
    bit<96> accumulated_trading_volume;
    bit<176> accumulated_trading_value;
    bit<8> final_ask_bid_type_code;
    bit<88> ask_level_1_price;
    bit<88> bid_level_1_price;
    bit<96> ask_level_1_volume;
    bit<96> bid_level_1_volume;
    bit<88> ask_level_2_price;
    bit<88> bid_level_2_price;
    bit<96> ask_level_2_volume;
    bit<96> bid_level_2_volume;
    bit<88> ask_level_3_price;
    bit<88> bid_level_3_price;
    bit<96> ask_level_3_volume;
    bit<96> bid_level_3_volume;
    bit<88> ask_level_4_price;
    bit<88> bid_level_4_price;
    bit<96> ask_level_4_volume;
    bit<96> bid_level_4_volume;
    bit<88> ask_level_5_price;
    bit<88> bid_level_5_price;
    bit<96> ask_level_5_volume;
    bit<96> bid_level_5_volume;
    bit<88> ask_level_6_price;
    bit<88> bid_level_6_price;
    bit<96> ask_level_6_volume;
    bit<96> bid_level_6_volume;
    bit<88> ask_level_7_price;
    bit<88> bid_level_7_price;
    bit<96> ask_level_7_volume;
    bit<96> bid_level_7_volume;
    bit<88> ask_level_8_price;
    bit<88> bid_level_8_price;
    bit<96> ask_level_8_volume;
    bit<96> bid_level_8_volume;
    bit<88> ask_level_9_price;
    bit<88> bid_level_9_price;
    bit<96> ask_level_9_volume;
    bit<96> bid_level_9_volume;
    bit<88> ask_level_10_price;
    bit<88> bid_level_10_price;
    bit<96> ask_level_10_volume;
    bit<96> bid_level_10_volume;
    bit<96> total_ask_volume;
    bit<96> total_bid_volume;
    bit<88> estimated_trading_price;
    bit<96> estimated_trading_volume;
    bit<8> closing_price_type_code;
    bit<8> trading_halt;
    bit<88> mid_price;
    bit<96> total_mid_price_ask_volume_total_ask_volume_on_mid_price;
    bit<96> total_mid_price_bid_volume_total_bid_volume_on_mid_price;
    bit<8> end_keyword;
}

header investor_activities_per_an_industry_message_t {
    bit<48> calculation_time;
    bit<32> investor_code;
    bit<48> interface_index_id;
    bit<96> index_isin_code;
    bit<96> accumulated_ask_trading_volume;
    bit<176> accumulated_ask_trading_value;
    bit<96> accumulated_bid_trading_volume;
    bit<176> accumulated_bid_trading_value;
    bit<24> filler_3;
    bit<8> end_keyword;
}

header current_movement_message_t {
    bit<40> total_number_of_issues;
    bit<40> number_of_issues_for_movement_calculation;
    bit<40> number_of_issues_of_upper_limit;
    bit<40> number_of_issues_of_going_up;
    bit<40> number_of_issues_of_steadiness;
    bit<40> number_of_issues_of_lower_limit;
    bit<40> number_of_issues_of_going_down;
    bit<40> number_of_issues_having_quotes;
    bit<40> number_of_issues_of_which_quotes_are_increasing;
    bit<40> number_of_issues_of_which_quotes_are_decreasing;
    bit<8> end_keyword;
}

header program_trading_activity_per_investor_message_t {
    bit<48> calculation_time;
    bit<32> investor_code;
    bit<120> sellside_arbitrage_volume;
    bit<176> sellside_arbitrage_value;
    bit<120> sellside_nonarbitrage_volume;
    bit<176> sellside_nonarbitrage_value;
    bit<120> buyside_arbitrage_volume;
    bit<176> buyside_arbitrage_value;
    bit<120> buyside_nonarbitrage_volume;
    bit<176> buyside_nonarbitrage_value;
    bit<8> end_keyword;
}

header program_trading_information_per_issue_aggregated_information_message_t {
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<120> sellside_arbitrage_trading_remaining_quantity;
    bit<120> buyside_arbitrage_trading_remaining_quantity;
    bit<120> sellside_nonarbitrage_remaining_quantity;
    bit<120> buyside_nonarbitrage_remaining_quantity;
    bit<120> sellside_arbitrage_quantity;
    bit<120> buyside_arbitrage_quantity;
    bit<120> sellside_nonarbitrage_quantity;
    bit<120> buyside_nonarbitrage_quantity;
    bit<80> arbitrage_ask_trust_trading_volume;
    bit<80> arbitrage_ask_principal_trading_volume;
    bit<80> arbitrage_bid_trust_trading_volume;
    bit<80> arbitrage_bid_principal_trading_volume;
    bit<80> non_arbitrage_ask_trust_trading_volume;
    bit<80> non_arbitrage_ask_principal_trading_volume;
    bit<80> non_arbitrage_bid_trust_trading_volume;
    bit<80> non_arbitrage_bid_principal_trading_volume;
    bit<176> arbitrage_ask_trust_trading_value;
    bit<176> arbitrage_ask_principal_trading_value;
    bit<176> arbitrage_bid_trust_trading_value;
    bit<176> arbitrage_bid_principal_trading_value;
    bit<176> non_arbitrage_ask_trust_trading_value;
    bit<176> non_arbitrage_ask_principal_trading_value;
    bit<176> non_arbitrage_bid_trust_trading_value;
    bit<176> non_arbitrage_bid_principal_trading_value;
    bit<8> end_keyword;
}

header program_trading_information_of_total_aggregated_information_message_t {
    bit<120> sellside_arbitrage_trading_remaining_quantity;
    bit<120> buyside_arbitrage_trading_remaining_quantity;
    bit<120> sellside_nonarbitrage_remaining_quantity;
    bit<120> buyside_nonarbitrage_remaining_quantity;
    bit<120> sellside_arbitrage_quantity;
    bit<120> buyside_arbitrage_quantity;
    bit<120> sellside_nonarbitrage_quantity;
    bit<120> buyside_nonarbitrage_quantity;
    bit<80> arbitrage_ask_trust_trading_volume;
    bit<80> arbitrage_ask_principal_trading_volume;
    bit<80> arbitrage_bid_trust_trading_volume;
    bit<80> arbitrage_bid_principal_trading_volume;
    bit<80> non_arbitrage_ask_trust_trading_volume;
    bit<80> non_arbitrage_ask_principal_trading_volume;
    bit<80> non_arbitrage_bid_trust_trading_volume;
    bit<80> non_arbitrage_bid_principal_trading_volume;
    bit<176> arbitrage_ask_trust_trading_value;
    bit<176> arbitrage_ask_principal_trading_value;
    bit<176> arbitrage_bid_trust_trading_value;
    bit<176> arbitrage_bid_principal_trading_value;
    bit<176> non_arbitrage_ask_trust_trading_value;
    bit<176> non_arbitrage_ask_principal_trading_value;
    bit<176> non_arbitrage_bid_trust_trading_value;
    bit<176> non_arbitrage_bid_principal_trading_value;
    bit<8> end_keyword;
}

header market_operation_schedule_message_t {
    bit<24> market_operation_product_id;
    bit<16> board_id;
    bit<24> board_event_id;
    bit<72> start_time_of_a_board_event;
    bit<40> board_event_group_code;
    bit<16> session_start_end_code;
    bit<16> session_id;
    bit<96> isin_code;
    bit<96> isin_code_of_a_common_stock;
    bit<88> product_id;
    bit<24> trading_halt_reason_code;
    bit<8> trading_halt_type_code;
    bit<16> step_applied;
    bit<8> price_limit_range_expansion_for_base_issue_type_code;
    bit<72> expected_time_of_expanding_price_limit_range;
    bit<8> end_keyword;
}

header member_firm_imposing_lifting_sanctions_message_t {
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<24> disclosing_data_type_code;
    bit<72> disclosure_time;
    bit<40> member_number;
    bit<40> member_firm_trust_principal_type_code;
    bit<8> end_keyword;
}

header top_five_traders_activities_message_t {
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<40> member_number_1_for_ask;
    bit<96> ask_trading_volume_1;
    bit<176> ask_trading_value_1;
    bit<40> member_number_1_for_bid;
    bit<96> bid_trading_volume_1;
    bit<176> bid_trading_value_1;
    bit<40> member_number_2_for_ask;
    bit<96> ask_trading_volume_2;
    bit<176> ask_trading_value_2;
    bit<40> member_number_2_for_bid;
    bit<96> bid_trading_volume_2;
    bit<176> bid_trading_value_2;
    bit<40> member_number_3_for_ask;
    bit<96> ask_trading_volume_3;
    bit<176> ask_trading_value_3;
    bit<40> member_number_3_for_bid;
    bit<96> bid_trading_volume_3;
    bit<176> bid_trading_value_3;
    bit<40> member_number_4_for_ask;
    bit<96> ask_trading_volume_4;
    bit<176> ask_trading_value_4;
    bit<40> member_number_4_for_bid;
    bit<96> bid_trading_volume_4;
    bit<176> bid_trading_value_4;
    bit<40> member_number_5_for_ask;
    bit<96> ask_trading_volume_5;
    bit<176> ask_trading_value_5;
    bit<40> member_number_5_for_bid;
    bit<96> bid_trading_volume_5;
    bit<176> bid_trading_value_5;
    bit<8> end_keyword;
}

header equities_batch_data_message_t {
    bit<64> message_sequence_number;
    bit<48> total_number_of_instruments_of_the_contract;
    bit<64> business_date;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<72> abbreviated_issue_code;
    bit<320> abbreviated_issue_name;
    bit<320> abbreviated_issue_name_in_en;
    bit<40> group_number;
    bit<24> market_operation_product_id;
    bit<16> security_group_id;
    bit<8> unit_trading;
    bit<16> rights_type_code;
    bit<16> par_value_type_code;
    bit<8> an_issue_of_which_base_price_is_settled_with_a_todays_single_price;
    bit<16> reevaluation_reason_code;
    bit<8> base_price_change;
    bit<8> random_end_trigger_code;
    bit<8> market_alert;
    bit<16> market_alert_type_code;
    bit<8> korea_corporate_governance_stock_price_index_kogi;
    bit<8> issue_for_administration;
    bit<8> unfaithful_disclosure;
    bit<8> backdoor_listing;
    bit<8> trading_halt;
    bit<80> industry_id;
    bit<8> small_medium_sized_business;
    bit<8> section_type_code;
    bit<8> investment_institution_type_code;
    bit<88> base_price;
    bit<8> yesterdays_closing_price_type_code_krx;
    bit<88> yesterdays_closing_price_krx;
    bit<96> yesterdays_accumulated_trading_amount;
    bit<176> yesterdays_accumulated_trading_value;
    bit<88> upper_limit_price;
    bit<88> lower_limit_price;
    bit<88> substitute_price_of_securities;
    bit<88> par_value;
    bit<88> issuing_price;
    bit<64> listing_date;
    bit<128> number_of_listed_shares;
    bit<8> liquidation_trade;
    bit<64> the_establishment_date;
    bit<64> maturity_date;
    bit<64> exercising_period;
    bit<64> expiration_date_for_right;
    bit<104> exercise_price_of_elw_or_bw;
    bit<176> capital;
    bit<8> credit_order_possibility;
    bit<40> limit_order_permission_type_code;
    bit<40> market_price_order_permission_type_code;
    bit<40> conditioned_order_permission_type_code;
    bit<40> best_favorable_order_permission_type_code;
    bit<40> first_best_order_permission_type;
    bit<40> mid_price_order_permission_type_code;
    bit<40> stop_limit_price_order_permission_type_code;
    bit<16> capital_increase_type_code;
    bit<8> other_stock_type_code;
    bit<8> national_stock;
    bit<88> appraised_price;
    bit<88> lowest_order_price;
    bit<88> highest_order_price;
    bit<88> unit_of_volume_in_main_board;
    bit<88> lot_size_afterhours_trading;
    bit<8> rei_ts_type_code;
    bit<96> target_stock_isin_code;
    bit<24> currency_iso_code;
    bit<24> country_code;
    bit<8> market_making_possibility;
    bit<8> closing_price_trading_possibility_in_the_after_hours;
    bit<8> closing_price_trading_in_the_preopening_market;
    bit<8> block_trading_in_the_preopening_market;
    bit<8> basket_trading_in_the_preopening_market;
    bit<8> announcement_of_estimated_trading_price;
    bit<8> short_selling;
    bit<104> etf_tracking_difference;
    bit<8> regs;
    bit<8> spac;
    bit<8> tax_type_code;
    bit<104> appraisal_ratio_of_substitute_price;
    bit<8> investment_caution_issue;
    bit<64> delisting_date;
    bit<8> shortterm_overheat_issue_type_code;
    bit<8> etf_replication_methods_type_code;
    bit<64> expiration_date;
    bit<16> distribution_type_code;
    bit<64> calculation_of_redemption_price_start_date;
    bit<64> calculation_of_redemption_price_end_date;
    bit<8> etp_product_type_code;
    bit<16> index_calculation_institution_type_code;
    bit<48> index_market_classification_id;
    bit<24> index_sequence_number;
    bit<16> tracking_index_leverage_inverse_type_code;
    bit<16> reference_index_leverage_inverse_type_code;
    bit<48> index_asset_classification_id_1;
    bit<48> index_asset_classification_id_2;
    bit<40> ipo_underwriter_member_number;
    bit<8> lp_order;
    bit<8> low_liquidity;
    bit<8> abnormal_rise;
    bit<184> upper_limit_quantity;
    bit<8> investment_precaution_issue;
    bit<8> preferred_stocks_with_lesser_shares;
    bit<8> spac_merger;
    bit<8> segment_type_code;
    bit<8> after_market_possibility;
    bit<8> choice_on_competitive_trading;
    bit<8> limit_on_competitive_trading_volume;
    bit<8> occurrence_of_reasons_prohibiting_competitive_trading;
    bit<8> approval_on_competitive_trading;
    bit<8> approval_on_negotiation_trading;
    bit<8> yesterdays_closing_price_type_code_nxt;
    bit<88> yesterdays_closing_price_nxt;
    bit<40> competition_board_trade_permission_code;
    bit<8> negotiation_possible_or_not_before_main_market;
    bit<8> end_keyword;
}

header member_information_message_t {
    bit<64> message_sequence_number;
    bit<64> business_date;
    bit<40> market_participant_number;
    bit<640> name_of_a_market_participant_in_kr;
    bit<640> name_of_a_market_participant_in_en;
    bit<160> an_abbreviated_name_of_a_market_participant_in_kr;
    bit<8> end_keyword;
}

header issue_event_message_t {
    bit<64> message_sequence_number;
    bit<96> isin_code;
    bit<16> event_type_code;
    bit<32> event_reason_code;
    bit<64> event_start_date;
    bit<64> event_end_date;
    bit<8> end_keyword;
}

header block_basket_trade_data_message_t {
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> accumulated_trading_volume;
    bit<176> accumulated_trading_value;
    bit<8> end_keyword;
}

header investor_activities_per_an_issue_eod_message_t {
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<32> investor_code;
    bit<96> accumulated_ask_trading_volume;
    bit<176> accumulated_ask_trading_value;
    bit<96> accumulated_bid_trading_volume;
    bit<176> accumulated_bid_trading_value;
    bit<8> end_keyword;
}

header short_selling_message_t {
    bit<96> isin_code;
    bit<96> covered_short_selling_trading_volume;
    bit<176> covered_short_selling_trading_value;
    bit<96> uptick_rule_applied_covered_short_selling_trading_volume;
    bit<176> uptick_rule_applied_covered_short_selling_trading_value;
    bit<96> uptick_rule_unapplied_covered_short_selling_trading_volume;
    bit<176> uptick_rule_unapplied_covered_short_selling_trading_value;
    bit<8> end_keyword;
}

header brokers_acitity_information_message_t {
    bit<96> isin_code;
    bit<40> member_number;
    bit<96> accumulated_ask_trading_volume;
    bit<176> accumulated_ask_trading_value;
    bit<96> accumulated_bid_trading_volume;
    bit<176> accumulated_bid_trading_value;
    bit<8> end_keyword;
}

header trading_activity_by_session_per_an_issue_message_t {
    bit<96> isin_code;
    bit<40> total_number_of_tradable_issues_on_competitive_trading;
    bit<96> premarket_accumulated_trading_volume;
    bit<176> premarket_accumulated_trading_value;
    bit<96> mainmarket_accumulated_trading_volume;
    bit<176> mainmarket_accumulated_trading_value;
    bit<96> aftermarket_accumulated_trading_volume;
    bit<176> aftermarket_accumulated_trading_value;
    bit<8> end_keyword;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    polling_data_message_t polling_data_message;
    securities_quote_10_level_message_t securities_quote_10_level_message;
    securities_order_filled_message_t securities_order_filled_message;
    market_operation_ts_message_t market_operation_ts_message;
    issue_closing_message_t issue_closing_message;
    triggering_removing_vi_message_t triggering_removing_vi_message;
    closing_price_trading_quote_message_t closing_price_trading_quote_message;
    equities_snapshot_10_level_message_t equities_snapshot_10_level_message;
    investor_activities_per_an_industry_message_t investor_activities_per_an_industry_message;
    current_movement_message_t current_movement_message;
    program_trading_activity_per_investor_message_t program_trading_activity_per_investor_message;
    program_trading_information_per_issue_aggregated_information_message_t program_trading_information_per_issue_aggregated_information_message;
    program_trading_information_of_total_aggregated_information_message_t program_trading_information_of_total_aggregated_information_message;
    market_operation_schedule_message_t market_operation_schedule_message;
    member_firm_imposing_lifting_sanctions_message_t member_firm_imposing_lifting_sanctions_message;
    top_five_traders_activities_message_t top_five_traders_activities_message;
    equities_batch_data_message_t equities_batch_data_message;
    member_information_message_t member_information_message;
    issue_event_message_t issue_event_message;
    block_basket_trade_data_message_t block_basket_trade_data_message;
    investor_activities_per_an_issue_eod_message_t investor_activities_per_an_issue_eod_message;
    short_selling_message_t short_selling_message;
    brokers_acitity_information_message_t brokers_acitity_information_message;
    trading_activity_by_session_per_an_issue_message_t trading_activity_by_session_per_an_issue_message;
}

parser NextradeStockcommonParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.tr_code) {
            40w0x4932353030: parse_polling_data_message;
            40w0x4236353153: parse_securities_quote_10_level_message;
            40w0x4236353151: parse_securities_quote_10_level_message;
            40w0x4133353153: parse_securities_order_filled_message;
            40w0x4133353151: parse_securities_order_filled_message;
            40w0x4137353153: parse_market_operation_ts_message;
            40w0x4137353151: parse_market_operation_ts_message;
            40w0x4136353153: parse_issue_closing_message;
            40w0x4136353151: parse_issue_closing_message;
            40w0x5238353153: parse_triggering_removing_vi_message;
            40w0x5238353151: parse_triggering_removing_vi_message;
            40w0x4531353153: parse_closing_price_trading_quote_message;
            40w0x4531353151: parse_closing_price_trading_quote_message;
            40w0x4232353153: parse_equities_snapshot_10_level_message;
            40w0x4232353151: parse_equities_snapshot_10_level_message;
            40w0x4330353153: parse_investor_activities_per_an_industry_message;
            40w0x4330353151: parse_investor_activities_per_an_industry_message;
            40w0x4235353153: parse_current_movement_message;
            40w0x4235353151: parse_current_movement_message;
            40w0x5030353153: parse_program_trading_activity_per_investor_message;
            40w0x5030353151: parse_program_trading_activity_per_investor_message;
            40w0x4333353153: parse_program_trading_information_per_issue_aggregated_information_message;
            40w0x4333353151: parse_program_trading_information_per_issue_aggregated_information_message;
            40w0x4a30353153: parse_program_trading_information_of_total_aggregated_information_message;
            40w0x4a30353151: parse_program_trading_information_of_total_aggregated_information_message;
            40w0x4d34353153: parse_market_operation_schedule_message;
            40w0x4d34353151: parse_market_operation_schedule_message;
            40w0x5233353154: parse_member_firm_imposing_lifting_sanctions_message;
            40w0x4239353153: parse_top_five_traders_activities_message;
            40w0x4239353151: parse_top_five_traders_activities_message;
            40w0x4130353153: parse_equities_batch_data_message;
            40w0x4530353153: parse_equities_batch_data_message;
            40w0x4130353151: parse_equities_batch_data_message;
            40w0x4530353151: parse_equities_batch_data_message;
            40w0x4d39353154: parse_member_information_message;
            40w0x4538353154: parse_member_information_message;
            40w0x4936353153: parse_issue_event_message;
            40w0x4536353153: parse_issue_event_message;
            40w0x4936353151: parse_issue_event_message;
            40w0x4536353151: parse_issue_event_message;
            40w0x4334353153: parse_block_basket_trade_data_message;
            40w0x4334353151: parse_block_basket_trade_data_message;
            40w0x4331353153: parse_investor_activities_per_an_issue_eod_message;
            40w0x4331353151: parse_investor_activities_per_an_issue_eod_message;
            40w0x4938353153: parse_short_selling_message;
            40w0x4938353151: parse_short_selling_message;
            40w0x4532353153: parse_brokers_acitity_information_message;
            40w0x4532353151: parse_brokers_acitity_information_message;
            40w0x4533353153: parse_trading_activity_by_session_per_an_issue_message;
            40w0x4533353151: parse_trading_activity_by_session_per_an_issue_message;
            default: accept;
        }
    }

    state parse_polling_data_message {
        packet.extract(hdr.polling_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_securities_quote_10_level_message {
        packet.extract(hdr.securities_quote_10_level_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_securities_order_filled_message {
        packet.extract(hdr.securities_order_filled_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_operation_ts_message {
        packet.extract(hdr.market_operation_ts_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_issue_closing_message {
        packet.extract(hdr.issue_closing_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_triggering_removing_vi_message {
        packet.extract(hdr.triggering_removing_vi_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_closing_price_trading_quote_message {
        packet.extract(hdr.closing_price_trading_quote_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_equities_snapshot_10_level_message {
        packet.extract(hdr.equities_snapshot_10_level_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_investor_activities_per_an_industry_message {
        packet.extract(hdr.investor_activities_per_an_industry_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_current_movement_message {
        packet.extract(hdr.current_movement_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_program_trading_activity_per_investor_message {
        packet.extract(hdr.program_trading_activity_per_investor_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_program_trading_information_per_issue_aggregated_information_message {
        packet.extract(hdr.program_trading_information_per_issue_aggregated_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_program_trading_information_of_total_aggregated_information_message {
        packet.extract(hdr.program_trading_information_of_total_aggregated_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_operation_schedule_message {
        packet.extract(hdr.market_operation_schedule_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_member_firm_imposing_lifting_sanctions_message {
        packet.extract(hdr.member_firm_imposing_lifting_sanctions_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_top_five_traders_activities_message {
        packet.extract(hdr.top_five_traders_activities_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_equities_batch_data_message {
        packet.extract(hdr.equities_batch_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_member_information_message {
        packet.extract(hdr.member_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_issue_event_message {
        packet.extract(hdr.issue_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_block_basket_trade_data_message {
        packet.extract(hdr.block_basket_trade_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_investor_activities_per_an_issue_eod_message {
        packet.extract(hdr.investor_activities_per_an_issue_eod_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_short_selling_message {
        packet.extract(hdr.short_selling_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_brokers_acitity_information_message {
        packet.extract(hdr.brokers_acitity_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_activity_by_session_per_an_issue_message {
        packet.extract(hdr.trading_activity_by_session_per_an_issue_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NextradeStockcommonVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NextradeStockcommonIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NextradeStockcommonEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NextradeStockcommonComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NextradeStockcommonDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.polling_data_message);
        packet.emit(hdr.securities_quote_10_level_message);
        packet.emit(hdr.securities_order_filled_message);
        packet.emit(hdr.market_operation_ts_message);
        packet.emit(hdr.issue_closing_message);
        packet.emit(hdr.triggering_removing_vi_message);
        packet.emit(hdr.closing_price_trading_quote_message);
        packet.emit(hdr.equities_snapshot_10_level_message);
        packet.emit(hdr.investor_activities_per_an_industry_message);
        packet.emit(hdr.current_movement_message);
        packet.emit(hdr.program_trading_activity_per_investor_message);
        packet.emit(hdr.program_trading_information_per_issue_aggregated_information_message);
        packet.emit(hdr.program_trading_information_of_total_aggregated_information_message);
        packet.emit(hdr.market_operation_schedule_message);
        packet.emit(hdr.member_firm_imposing_lifting_sanctions_message);
        packet.emit(hdr.top_five_traders_activities_message);
        packet.emit(hdr.equities_batch_data_message);
        packet.emit(hdr.member_information_message);
        packet.emit(hdr.issue_event_message);
        packet.emit(hdr.block_basket_trade_data_message);
        packet.emit(hdr.investor_activities_per_an_issue_eod_message);
        packet.emit(hdr.short_selling_message);
        packet.emit(hdr.brokers_acitity_information_message);
        packet.emit(hdr.trading_activity_by_session_per_an_issue_message);
    }
}

V1Switch(
    NextradeStockcommonParser(),
    NextradeStockcommonVerifyChecksum(),
    NextradeStockcommonIngress(),
    NextradeStockcommonEgress(),
    NextradeStockcommonComputeChecksum(),
    NextradeStockcommonDeparser()
) main;
