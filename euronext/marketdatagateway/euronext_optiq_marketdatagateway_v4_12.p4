// P4_16 (v1model) definition for: Euronext Optiq MarketDataGateway Sbe v4.12
// 
// Protocol:
//   Organization: Euronext
//   Protocol: Market Data Gateway
//   Encoding: Simple Binary Encoding
//   Version: 4.12
//   Date: 1/21/2022
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
    bit<64> packet_time;
    bit<32> packet_sequence_number;
    bit<1> compression;
    bit<3> mdg_restart_count;
    bit<3> psn_high_weight;
    bit<1> has_start_of_day_snapshot;
    bit<1> has_end_of_day_snapshot;
    bit<1> has_status_message;
    bit<6> reserved_bits;
    bit<16> channel_id;
    bit<16> frame;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header start_of_day_message_t {
    bit<64> md_seq_num;
    bit<16> session_trading_day;
}

header end_of_day_message_t {
    bit<64> md_seq_num;
    bit<16> session_trading_day;
}

header health_status_message_t {
    bit<64> md_seq_num;
    bit<64> event_time;
}

header technical_notification_message_t {
    bit<64> md_seq_num_optional;
    bit<8> technical_notification_type;
    bit<8> rebroadcast_indicator;
    bit<64> retransmission_start_time;
    bit<64> retransmission_end_time;
    bit<32> symbol_index_optional;
}

header market_update_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> update_type;
    bit<32> symbol_index;
    bit<16> number_of_orders;
    bit<64> price;
    bit<64> quantity_optional;
}

header order_update_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> symbol_index;
    bit<8> action_type;
    bit<64> order_priority;
    bit<64> previous_priority;
    bit<8> order_type;
    bit<64> order_px;
    bit<8> order_side;
    bit<64> order_quantity;
    bit<8> peg_offset;
}

header price_update_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> price_type;
    bit<32> symbol_index;
    bit<64> price;
    bit<64> quantity_optional;
    bit<64> imbalance_qty;
    bit<8> imbalance_qty_side;
}

header full_trade_information_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<32> symbol_index_optional;
    bit<216> trading_date_time;
    bit<216> publication_date_time;
    bit<8> trade_type;
    bit<32> mifid_instrument_id_type_optional;
    bit<96> mifid_instrument_id_optional;
    bit<416> mifid_execution_id;
    bit<160> mifid_price_optional;
    bit<160> mifid_quantity;
    bit<32> mifid_price_notation;
    bit<24> mifid_currency;
    bit<200> mifid_qty_in_msrmt_unit_notation;
    bit<160> mifid_quantity_measurement_unit;
    bit<160> mifid_notional_amount;
    bit<24> notional_currency;
    bit<40> mifid_clearing_flag;
    bit<8> mmt_market_mechanism;
    bit<8> mmt_trading_mode;
    bit<32> mmt_transaction_category;
    bit<32> mmt_negotiation_indicator;
    bit<32> mmt_agency_cross_trade_indicator;
    bit<32> mmt_modification_indicator_char_4_optional;
    bit<32> mmt_benchmark_indicator;
    bit<32> mmt_special_dividend_indicator;
    bit<8> mmt_off_book_automated_indicator;
    bit<32> mmt_contributionto_price;
    bit<32> mmt_algorithmic_indicator;
    bit<32> mmt_publication_mode;
    bit<32> mmt_post_trade_deferral;
    bit<32> mmt_duplicative_indicator;
    bit<1> uncrossing_trade;
    bit<1> first_trade_price;
    bit<1> passive_order;
    bit<1> aggressive_order;
    bit<1> trade_creation_by_market_operations;
    bit<1> nav_trade_expressed_in_bps;
    bit<1> nav_trade_expressed_in_price_currency;
    bit<1> deferred_publication;
    bit<8> transaction_type;
    bit<8> effective_date_indicator;
    bit<8> block_trade_code;
    bit<240> trade_reference;
    bit<64> original_report_timestamp;
    bit<8> transparency_indicator;
    bit<32> currency_coefficient;
    bit<32> price_multiplier;
    bit<8> price_multiplier_decimals;
    bit<88> venue;
    bit<32> start_time_vwap;
    bit<32> end_time_vwap;
    bit<32> mifid_emission_allowance_type;
    bit<32> market_of_reference_mic;
    bit<64> evaluated_price;
    bit<8> message_price_notation;
    bit<16> settlement_date;
    bit<16> repo_settlement_date;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header market_status_change_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<8> block_length_short;
    bit<8> num_in_group;
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
    bit<8> reserved_8;
    bit<8> trading_period_optional;
    bit<8> trading_side;
    bit<8> price_limits;
    bit<8> quote_spread_multiplier;
    bit<8> order_entry_qualifier;
    bit<8> session;
    bit<8> scheduled_event;
    bit<64> scheduled_event_time;
    bit<8> instrument_state;
}

header timetable_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm_optional;
    bit<16> pattern_id;
    bit<32> symbol_index_optional;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<64> phase_time;
    bit<8> phase_id;
    bit<1> no_qualifier;
    bit<1> call_bbo_only;
    bit<1> trading_at_last;
    bit<1> random_uncrossing;
    bit<1> suspended;
    bit<1> wholesale_allowed;
    bit<1> stressed_market_conditions;
    bit<1> exceptional_market_conditions;
    bit<8> reserved_8;
    bit<8> trading_period;
    bit<8> order_entry_qualifier;
    bit<8> session;
    bit<8> scheduled_event;
}

header standing_data_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<8> optiq_segment;
    bit<16> partition_id;
    bit<816> full_instrument_name;
    bit<144> instrument_name;
    bit<120> instrument_trading_code;
    bit<16> instrument_group_code;
    bit<96> isin_code;
    bit<8> price_decimals;
    bit<8> quantity_decimals;
    bit<8> amount_decimals;
    bit<8> ratio_decimals;
    bit<48> cfi;
    bit<16> instrument_event_date;
    bit<64> strike_price;
    bit<8> dark_eligibility;
    bit<64> dark_lis_threshold;
    bit<32> dark_min_quantity;
    bit<16> date_of_last_trade;
    bit<160> depositary_list;
    bit<40> main_depositary;
    bit<16> first_settlement_date;
    bit<8> guarantee_indicator;
    bit<128> icb;
    bit<24> issuing_country;
    bit<64> last_adjusted_closing_price;
    bit<64> lot_size_optional;
    bit<64> maturity_date_optional;
    bit<8> maximum_decimals_in_quantity;
    bit<32> mic;
    bit<160> mic_list;
    bit<24> country_of_exchange_optional;
    bit<40> mnemonic;
    bit<32> underlying_mic;
    bit<96> underlying_isin_code;
    bit<24> trading_currency_optional;
    bit<32> currency_coefficient;
    bit<8> trading_currency_indicator;
    bit<8> strike_currency_indicator;
    bit<64> number_instrument_circulating;
    bit<64> par_value;
    bit<24> quantity_notation;
    bit<8> inst_unit_exp;
    bit<16> settlement_delay;
    bit<24> strike_currency;
    bit<8> tax_code;
    bit<16> type_of_corporate_event;
    bit<8> type_of_market_admission;
    bit<8> repo_indicator;
    bit<64> issue_price;
    bit<24> nominal_currency;
    bit<8> issue_price_decimals;
    bit<8> strike_price_decimals;
    bit<8> liquid_instrument_indicator;
    bit<32> market_of_reference_mic;
    bit<64> icb_code;
    bit<64> threshold_lis_post_trade_60mn;
    bit<64> threshold_lis_post_trade_120mn;
    bit<64> threshold_lis_post_trade_eod;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> emm;
    bit<16> pattern_id;
    bit<16> tick_size_index_id;
    bit<8> market_model;
    bit<64> lot_size_optional_2;
    bit<8> inst_unit_exp_2;
    bit<8> anonymous;
}

header real_time_index_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<32> symbol_index;
    bit<64> index_level;
    bit<64> pctg_of_capitalization;
    bit<64> prct_varfrom_prev_close;
    bit<16> num_traded_instruments;
    bit<8> index_level_type;
    bit<8> index_price_code;
}

header statistics_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> stats_update_type;
    bit<64> stats_update_value;
}

header index_summary_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<32> symbol_index;
    bit<64> opening_level;
    bit<64> opening_time;
    bit<64> confirmed_reference_level;
    bit<64> confirmed_reference_time;
    bit<64> closing_reference_level;
    bit<64> closing_reference_time;
    bit<64> prct_varfrom_prev_close;
    bit<64> high_level;
    bit<64> high_time;
    bit<64> low_level;
    bit<64> low_time;
    bit<64> liquidation_level;
    bit<64> liquidation_time;
}

header strategy_standing_data_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<32> symbol_index;
    bit<144> derivatives_instrument_trading_code;
    bit<8> exchange_code;
    bit<64> maturity_date;
    bit<8> strategy_code;
    bit<32> contract_symbol_index;
    bit<48> cfi_optional;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> leg_symbol_index;
    bit<64> leg_price;
    bit<32> leg_ratio;
    bit<8> leg_buy_sell;
}

header contract_standing_data_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<8> optiq_segment;
    bit<16> partition_id;
    bit<16> contract_event_date;
    bit<8> exchange_code;
    bit<8> exer_style;
    bit<480> contract_name;
    bit<8> contract_type;
    bit<8> underlying_type;
    bit<8> price_decimals_optional;
    bit<8> quantity_decimals;
    bit<8> amount_decimals;
    bit<8> ratio_decimals_optional;
    bit<40> main_depositary;
    bit<32> mic;
    bit<24> country_of_exchange;
    bit<32> product_code;
    bit<32> underlying_mic;
    bit<96> underlying_isin_code;
    bit<32> underlying_expiry;
    bit<1> market;
    bit<1> limit;
    bit<1> stop_stop_loss;
    bit<1> stop_limit;
    bit<1> market_on_open_moo;
    bit<1> trade_at_settlement;
    bit<10> reserved_10;
    bit<8> settlement_method;
    bit<24> trading_currency;
    bit<8> strike_price_decimals_ratio;
    bit<1> delta;
    bit<1> volume;
    bit<6> reserved_6;
    bit<8> contract_trading_type;
    bit<8> inst_unit_exp;
    bit<8> underlying_subtype;
    bit<96> mother_stock_isin;
    bit<64> settlement_tick_size;
    bit<64> edsp_tick_size;
    bit<32> underlying_symbol_index;
    bit<8> trading_policy;
    bit<16> reference_spread_table_id;
    bit<8> derivatives_market_model;
    bit<64> trading_unit;
    bit<8> reference_price_origin_in_opening_call;
    bit<8> reference_price_origin_in_continuous;
    bit<8> reference_price_origin_in_trading_interruption;
    bit<8> collar_expansion_factor;
    bit<8> mifidii_liquid_flag;
    bit<8> pricing_algorithm;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> emm_optional;
    bit<16> tick_size_index_id;
    bit<16> pattern_id;
    bit<64> lot_size_optional;
    bit<1> jelly_roll;
    bit<1> butterfly;
    bit<1> call_or_put_cabinet;
    bit<1> spread;
    bit<1> calendar_spread;
    bit<1> diagonal_calendar_spread;
    bit<1> guts;
    bit<1> two_by_one_ratio_spread;
    bit<1> iron_butterfly;
    bit<1> combo;
    bit<1> strangle;
    bit<1> ladder;
    bit<1> strip;
    bit<1> straddle_calendar_spread;
    bit<1> pack;
    bit<1> diagonal_straddle_calendar_spread;
    bit<1> simple_inter_commodity_spread;
    bit<1> conversion_reversal;
    bit<1> straddle;
    bit<1> volatility_trade;
    bit<1> condor;
    bit<1> box;
    bit<1> bundle;
    bit<1> reduced_tick_spread;
    bit<1> ladder_versus_underlying;
    bit<1> butterfly_versus_underlying;
    bit<1> call_spread_versus_put_versus_underlying;
    bit<1> call_or_put_spread_versus_underlying;
    bit<1> call_or_put_calendar_spread_versus_underlying;
    bit<1> call_put_diagonal_calendar_spread_versus_underlying;
    bit<1> guts_versus_underlying;
    bit<1> two_by_one_call_or_put_ratio_spread_versus_underlying;
    bit<1> iron_butterfly_versus_underlying;
    bit<1> combo_versus_underlying;
    bit<1> strangle_versus_underlying;
    bit<1> exchange_for_physical;
    bit<1> straddle_calendar_spread_versus_underlying;
    bit<1> put_spread_versus_call_versus_underlying;
    bit<1> diagonal_straddle_calendar_spread_versus_underlying;
    bit<1> synthetic;
    bit<1> straddle_versus_underlying;
    bit<1> condor_versus_underlying;
    bit<1> buy_write;
    bit<1> iron_condor_versus_underlying;
    bit<1> iron_condor;
    bit<1> call_spread_versus_sell_a_put;
    bit<1> put_spread_versus_sell_a_call;
    bit<1> put_straddle_versus_sell_a_call_or_a_put;
    bit<16> reserved_16;
    bit<8> dynamic_collar_logic;
    bit<8> collar_max_unhalt_nb;
    bit<32> collar_unhalt_delay;
}

header outright_standing_data_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<32> contract_symbol_index;
    bit<16> instrument_event_date;
    bit<96> isin_code;
    bit<48> cfi_optional;
    bit<64> maturity_date;
    bit<64> lot_size;
    bit<64> strike_price;
    bit<16> last_trading_date;
    bit<16> days_to_expiry;
    bit<144> derivatives_instrument_trading_code_optional;
    bit<8> derivatives_instrument_type;
    bit<8> expiry_cycle_type;
    bit<144> underlying_derivatives_instrument_trading_code;
    bit<32> underlying_symbol_index;
    bit<64> trading_unit;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<8> emm;
}

header long_order_update_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> symbol_index;
    bit<8> action_type;
    bit<64> order_priority;
    bit<64> previous_priority;
    bit<8> order_type;
    bit<64> order_px;
    bit<8> order_side;
    bit<64> order_quantity;
    bit<8> peg_offset;
    bit<64> firm_id;
    bit<8> account_type;
}

header lis_package_structure_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<32> contract_symbol_index;
    bit<416> mifid_execution_id;
    bit<8> strategy_code;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> leg_symbol_index;
    bit<32> leg_ratio;
    bit<64> leg_last_px;
    bit<64> leg_last_qty;
}

header apa_quotes_message_t {
    bit<64> md_seq_num_optional;
    bit<8> rebroadcast_indicator;
    bit<32> mifid_instrument_id_type;
    bit<96> mifid_instrument_id;
    bit<32> mic;
    bit<24> currency;
    bit<160> lei_code;
    bit<64> event_time;
    bit<8> quote_update_type;
    bit<160> mifid_price;
    bit<160> mifid_quantity;
    bit<32> apa_origin;
}

header apa_standing_data_message_t {
    bit<64> md_seq_num_optional;
    bit<8> rebroadcast_indicator;
    bit<32> mifid_instrument_id_type;
    bit<96> mifid_instrument_id;
    bit<816> full_instrument_name;
    bit<48> cfi_optional;
    bit<24> notional_currency;
    bit<24> second_notional_currency;
    bit<32> price_multiplier;
    bit<8> price_multiplier_decimals;
    bit<96> underlying_isin_code;
    bit<200> underlying_index_name;
    bit<64> underlying_index_term;
    bit<8> option_type;
    bit<64> strike_price;
    bit<8> strike_price_decimals;
    bit<8> exer_style;
    bit<64> maturity_date_optional;
    bit<64> expiry_date;
    bit<8> settlement_method;
}

header apa_full_trade_information_message_t {
    bit<64> md_seq_num;
    bit<8> rebroadcast_indicator;
    bit<8> emm;
    bit<64> event_time;
    bit<216> trading_date_time;
    bit<216> publication_date_time;
    bit<8> trade_type;
    bit<32> mifid_instrument_id_type_optional;
    bit<96> mifid_instrument_id_optional;
    bit<416> mifid_transaction_id;
    bit<160> mifid_price_optional;
    bit<160> mifid_quantity;
    bit<32> mifid_price_notation;
    bit<24> mifid_currency;
    bit<200> mifid_qty_in_msrmt_unit_notation;
    bit<160> mifid_quantity_measurement_unit;
    bit<160> mifid_notional_amount;
    bit<24> notional_currency;
    bit<40> mifid_clearing_flag;
    bit<8> efficient_mmt_market_mechanism;
    bit<8> efficient_mmt_trading_mode;
    bit<8> efficient_mmt_transaction_category;
    bit<8> efficient_mmt_negotiation_indicator;
    bit<8> efficient_mmt_agency_cross_trade_indicator;
    bit<8> efficient_mmt_modification_indicator;
    bit<8> efficient_mmt_benchmark_indicator;
    bit<8> efficient_mmt_special_dividend_indicator;
    bit<8> efficient_mmt_off_book_automated_indicator;
    bit<8> efficient_mmt_contributionto_price;
    bit<8> efficient_mmt_algorithmic_indicator;
    bit<8> efficient_mmt_publication_mode;
    bit<8> efficient_mmt_post_trade_deferral;
    bit<8> efficient_mmt_duplicative_indicator;
    bit<240> trade_reference;
    bit<64> original_report_timestamp;
    bit<32> price_multiplier;
    bit<8> price_multiplier_decimals;
    bit<88> venue;
    bit<32> mifid_emission_allowance_type;
    bit<416> long_trade_reference;
    bit<32> apa_origin;
}

header bf_instrument_reference_message_t {
    bit<64> md_seq_num_optional;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<8> optiq_segment;
    bit<96> isin_code_optional;
    bit<56> sedol_code;
    bit<2000> long_issuer_name;
    bit<2000> long_instrument_name;
    bit<24> currency_optional;
    bit<16> date_of_initial_listing;
    bit<64> share_amount_in_issue;
    bit<8> opened_closed_fund;
    bit<64> last_nav_price;
    bit<8> gross_of_cdsc_indicator;
    bit<64> coupon;
    bit<64> maturity_date_optional;
    bit<64> closing_price;
    bit<32> mic_optional;
    bit<64> gross_dividend_payable_per_unit;
    bit<24> dividend_currency;
    bit<16> dividend_record_date;
    bit<64> dividend_rate;
    bit<16> ex_dividend_date;
    bit<16> dividend_payment_date;
    bit<8> tax_description_attaching_to_a_dividend;
    bit<64> next_meeting;
    bit<64> gross_dividend_in_euros;
    bit<16> issue_date;
    bit<24> issuing_country;
    bit<48> cfi_optional;
    bit<8> payment_frequency;
    bit<64> minimum_amount;
    bit<8> instrument_category;
    bit<8> security_condition;
    bit<32> mifid_price_notation;
    bit<8> price_index_level_decimals;
    bit<8> quantity_decimals;
    bit<8> amount_decimals;
    bit<8> ratio_multiplier_decimals;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<16> interest_payment_date;
}

header bf_trade_message_t {
    bit<64> md_seq_num_optional;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<416> mifid_transaction_id;
    bit<64> event_time;
    bit<64> bid_offer_date_time;
    bit<32> mmt_modification_indicator;
    bit<64> price;
    bit<64> bid_price;
    bit<64> offer_price;
    bit<64> quantity;
    bit<32> mmt_agency_cross_trade_indicator;
    bit<32> mmt_benchmark_indicator;
    bit<32> mmt_special_dividend_indicator;
    bit<8> mmt_trading_mode;
    bit<32> mifid_price_notation;
    bit<24> quantity_notation;
    bit<64> notional_amount_traded;
    bit<24> trading_currency_optional;
}

header bfnav_message_t {
    bit<64> md_seq_num_optional;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<64> bid_offer_date_time;
    bit<416> mifid_transaction_id;
    bit<32> mmt_modification_indicator;
    bit<64> nav_price;
    bit<64> event_time_optional;
    bit<64> nav_bid_price;
    bit<64> nav_offer_price;
}

header bf_instrument_suspension_message_t {
    bit<64> md_seq_num_optional;
    bit<8> rebroadcast_indicator;
    bit<32> symbol_index;
    bit<64> event_time;
    bit<8> security_condition;
}

header start_of_snapshot_message_t {
    bit<64> last_md_seq_num;
    bit<64> snapshot_time;
}

header end_of_snapshot_message_t {
    bit<64> last_md_seq_num;
    bit<64> snapshot_time;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    start_of_day_message_t start_of_day_message;
    end_of_day_message_t end_of_day_message;
    health_status_message_t health_status_message;
    technical_notification_message_t technical_notification_message;
    market_update_message_t market_update_message;
    order_update_message_t order_update_message;
    price_update_message_t price_update_message;
    full_trade_information_message_t full_trade_information_message;
    market_status_change_message_t market_status_change_message;
    timetable_message_t timetable_message;
    standing_data_message_t standing_data_message;
    real_time_index_message_t real_time_index_message;
    statistics_message_t statistics_message;
    index_summary_message_t index_summary_message;
    strategy_standing_data_message_t strategy_standing_data_message;
    contract_standing_data_message_t contract_standing_data_message;
    outright_standing_data_message_t outright_standing_data_message;
    long_order_update_message_t long_order_update_message;
    lis_package_structure_message_t lis_package_structure_message;
    apa_quotes_message_t apa_quotes_message;
    apa_standing_data_message_t apa_standing_data_message;
    apa_full_trade_information_message_t apa_full_trade_information_message;
    bf_instrument_reference_message_t bf_instrument_reference_message;
    bf_trade_message_t bf_trade_message;
    bfnav_message_t bfnav_message;
    bf_instrument_suspension_message_t bf_instrument_suspension_message;
    start_of_snapshot_message_t start_of_snapshot_message;
    end_of_snapshot_message_t end_of_snapshot_message;
}

parser EuronextOptiqMarketdatagatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w1101: parse_start_of_day_message;
            16w1102: parse_end_of_day_message;
            16w1103: parse_health_status_message;
            16w1106: parse_technical_notification_message;
            16w1001: parse_market_update_message;
            16w1002: parse_order_update_message;
            16w1003: parse_price_update_message;
            16w1004: parse_full_trade_information_message;
            16w1005: parse_market_status_change_message;
            16w1006: parse_timetable_message;
            16w1007: parse_standing_data_message;
            16w1008: parse_real_time_index_message;
            16w1009: parse_statistics_message;
            16w1011: parse_index_summary_message;
            16w1012: parse_strategy_standing_data_message;
            16w1013: parse_contract_standing_data_message;
            16w1014: parse_outright_standing_data_message;
            16w1015: parse_long_order_update_message;
            16w1016: parse_lis_package_structure_message;
            16w1026: parse_apa_quotes_message;
            16w1027: parse_apa_standing_data_message;
            16w1028: parse_apa_full_trade_information_message;
            16w1201: parse_bf_instrument_reference_message;
            16w1202: parse_bf_trade_message;
            16w1203: parse_bfnav_message;
            16w1204: parse_bf_instrument_suspension_message;
            16w2101: parse_start_of_snapshot_message;
            16w2102: parse_end_of_snapshot_message;
            default: accept;
        }
    }

    state parse_start_of_day_message {
        packet.extract(hdr.start_of_day_message);
        transition accept;
    }

    state parse_end_of_day_message {
        packet.extract(hdr.end_of_day_message);
        transition accept;
    }

    state parse_health_status_message {
        packet.extract(hdr.health_status_message);
        transition accept;
    }

    state parse_technical_notification_message {
        packet.extract(hdr.technical_notification_message);
        transition accept;
    }

    state parse_market_update_message {
        packet.extract(hdr.market_update_message);
        transition accept;
    }

    state parse_order_update_message {
        packet.extract(hdr.order_update_message);
        transition accept;
    }

    state parse_price_update_message {
        packet.extract(hdr.price_update_message);
        transition accept;
    }

    state parse_full_trade_information_message {
        packet.extract(hdr.full_trade_information_message);
        transition accept;
    }

    state parse_market_status_change_message {
        packet.extract(hdr.market_status_change_message);
        transition accept;
    }

    state parse_timetable_message {
        packet.extract(hdr.timetable_message);
        transition accept;
    }

    state parse_standing_data_message {
        packet.extract(hdr.standing_data_message);
        transition accept;
    }

    state parse_real_time_index_message {
        packet.extract(hdr.real_time_index_message);
        transition accept;
    }

    state parse_statistics_message {
        packet.extract(hdr.statistics_message);
        transition accept;
    }

    state parse_index_summary_message {
        packet.extract(hdr.index_summary_message);
        transition accept;
    }

    state parse_strategy_standing_data_message {
        packet.extract(hdr.strategy_standing_data_message);
        transition accept;
    }

    state parse_contract_standing_data_message {
        packet.extract(hdr.contract_standing_data_message);
        transition accept;
    }

    state parse_outright_standing_data_message {
        packet.extract(hdr.outright_standing_data_message);
        transition accept;
    }

    state parse_long_order_update_message {
        packet.extract(hdr.long_order_update_message);
        transition accept;
    }

    state parse_lis_package_structure_message {
        packet.extract(hdr.lis_package_structure_message);
        transition accept;
    }

    state parse_apa_quotes_message {
        packet.extract(hdr.apa_quotes_message);
        transition accept;
    }

    state parse_apa_standing_data_message {
        packet.extract(hdr.apa_standing_data_message);
        transition accept;
    }

    state parse_apa_full_trade_information_message {
        packet.extract(hdr.apa_full_trade_information_message);
        transition accept;
    }

    state parse_bf_instrument_reference_message {
        packet.extract(hdr.bf_instrument_reference_message);
        transition accept;
    }

    state parse_bf_trade_message {
        packet.extract(hdr.bf_trade_message);
        transition accept;
    }

    state parse_bfnav_message {
        packet.extract(hdr.bfnav_message);
        transition accept;
    }

    state parse_bf_instrument_suspension_message {
        packet.extract(hdr.bf_instrument_suspension_message);
        transition accept;
    }

    state parse_start_of_snapshot_message {
        packet.extract(hdr.start_of_snapshot_message);
        transition accept;
    }

    state parse_end_of_snapshot_message {
        packet.extract(hdr.end_of_snapshot_message);
        transition accept;
    }

}

control EuronextOptiqMarketdatagatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqMarketdatagatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EuronextOptiqMarketdatagatewayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EuronextOptiqMarketdatagatewayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EuronextOptiqMarketdatagatewayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.health_status_message);
        packet.emit(hdr.technical_notification_message);
        packet.emit(hdr.market_update_message);
        packet.emit(hdr.order_update_message);
        packet.emit(hdr.price_update_message);
        packet.emit(hdr.full_trade_information_message);
        packet.emit(hdr.market_status_change_message);
        packet.emit(hdr.timetable_message);
        packet.emit(hdr.standing_data_message);
        packet.emit(hdr.real_time_index_message);
        packet.emit(hdr.statistics_message);
        packet.emit(hdr.index_summary_message);
        packet.emit(hdr.strategy_standing_data_message);
        packet.emit(hdr.contract_standing_data_message);
        packet.emit(hdr.outright_standing_data_message);
        packet.emit(hdr.long_order_update_message);
        packet.emit(hdr.lis_package_structure_message);
        packet.emit(hdr.apa_quotes_message);
        packet.emit(hdr.apa_standing_data_message);
        packet.emit(hdr.apa_full_trade_information_message);
        packet.emit(hdr.bf_instrument_reference_message);
        packet.emit(hdr.bf_trade_message);
        packet.emit(hdr.bfnav_message);
        packet.emit(hdr.bf_instrument_suspension_message);
        packet.emit(hdr.start_of_snapshot_message);
        packet.emit(hdr.end_of_snapshot_message);
    }
}

V1Switch(
    EuronextOptiqMarketdatagatewayParser(),
    EuronextOptiqMarketdatagatewayVerifyChecksum(),
    EuronextOptiqMarketdatagatewayIngress(),
    EuronextOptiqMarketdatagatewayEgress(),
    EuronextOptiqMarketdatagatewayComputeChecksum(),
    EuronextOptiqMarketdatagatewayDeparser()
) main;
