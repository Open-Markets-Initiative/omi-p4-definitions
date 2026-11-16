// P4_16 (v1model) definition for: Bmv BmvMarketData Snapshot Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Snapshot
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Connection_Appendix_6.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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
    bit<16> length;
    bit<8> total_messages;
    bit<8> market_data_group;
    bit<8> session;
    bit<32> sequence_number;
    bit<64> datetime;
}

header message_header_message_block_t {
    bit<16> message_length;
    bit<8> message_type;
}

header login_response_message_t {
    bit<8> login_response_status;
}

header replay_response_message_t {
    bit<8> market_data_group;
    bit<32> first_message;
    bit<16> quantity;
    bit<8> replay_response_status;
}

header snapshot_response_message_t {
    bit<32> quantity_of_messages;
    bit<8> snapshot_response_status;
    bit<8> snapshot_type;
}

header snapshot_complete_message_t {
    bit<32> sequence_number;
    bit<8> market_data_group;
    bit<8> snapshot_type;
}

header events_system_message_t {
    bit<32> instrument_number;
    bit<8> event_code;
    bit<8> market;
    bit<64> sending_time;
    bit<64> ending_time;
}

header trade_cancellation_message_t {
    bit<32> instrument_number;
    bit<32> trade_number;
}

header status_changes_message_t {
    bit<32> instrument_number;
    bit<8> instrument_status;
}

header weighted_average_price_settlement_prices_message_t {
    bit<32> instrument_number;
    bit<64> weighted_average_price;
    bit<64> volatility;
}

header capital_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_time;
    bit<32> volume_int_324;
    bit<64> price;
    bit<8> concertation_type;
    bit<32> trade_number;
    bit<8> price_setter;
    bit<8> operation_type;
    bit<64> amount;
    bit<40> buy_alpha_5;
    bit<40> sell_alpha_5;
    bit<8> settlement;
    bit<8> auction_indicator;
}

header probable_allocation_price_message_t {
    bit<32> instrument_number;
    bit<64> probable_allocation_price;
    bit<32> volume_int_324;
}

header continuous_auctions_beginning_message_t {
    bit<32> instrument_number;
    bit<64> beginning_time_of_auction;
    bit<64> end_auction_time;
}

header middle_price_existing_quotes_message_t {
    bit<32> instrument_number;
    bit<8> existing_postures;
}

header registry_operations_message_t {
    bit<32> instrument_number;
    bit<8> offer_type;
    bit<8> income;
    bit<32> value_type;
    bit<56> issuer;
    bit<48> series;
    bit<64> maximum_volume;
    bit<64> registered_volume;
    bit<64> price_rate;
    bit<64> settlement_date;
    bit<40> firm;
    bit<8> movement;
}

header mutual_fund_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_date;
    bit<64> price;
    bit<64> book_value;
    bit<32> number_of_sales_transactions;
    bit<64> sales_volume;
    bit<32> number_of_buy_transactions;
    bit<64> buy_volume;
}

header tradability_message_t {
    bit<32> instrument_number;
    bit<32> number_of_operations;
    bit<64> volume_int_648;
    bit<64> amount;
    bit<64> opening_price;
    bit<64> maximum;
    bit<64> minimum;
    bit<64> average;
    bit<64> last;
}

header virtual_trades_message_t {
    bit<32> instrument_number;
    bit<8> virtual_trades_status;
    bit<8> operation_type;
    bit<32> number;
    bit<32> volume_int_324;
    bit<8> concertation;
    bit<40> buy_alpha_5;
    bit<40> sell_alpha_5;
}

header order_addition_message_t {
    bit<32> instrument_number;
    bit<64> date_and_time;
    bit<32> number;
    bit<8> direction;
    bit<32> volume_int_324;
    bit<64> price;
    bit<40> participant;
}

header execution_of_orders_message_t {
    bit<32> instrument_number;
    bit<64> date;
    bit<32> number;
    bit<32> volume_int_324;
    bit<32> trade_number;
    bit<64> execution_price;
}

header order_cancellation_message_t {
    bit<32> instrument_number;
    bit<64> date;
    bit<32> number;
}

header order_change_message_t {
    bit<32> instrument_number;
    bit<64> original_date;
    bit<32> original_number;
    bit<64> new_date;
    bit<32> new_number;
    bit<8> direction;
    bit<32> volume_int_324;
    bit<64> price;
}

header depth_message_t {
    bit<32> instrument_number;
    bit<8> side;
    bit<8> purchase_or_sale_levels;
}

header depth_message_price_level_t {
    bit<64> price;
    bit<16> number_of_orders;
    bit<32> volume_int_324;
}

header best_offer_message_t {
    bit<32> instrument_number;
    bit<32> volume_int_324;
    bit<64> price_rate;
    bit<8> offer_direction;
    bit<8> operation_type;
}

header public_offerings_message_t {
    bit<32> instrument_number;
    bit<32> number;
    bit<64> volume_int_648;
    bit<64> discount_rate_or_price;
    bit<32> rate_of_return;
    bit<16> term_days;
    bit<8> currency_type;
    bit<8> settlement;
    bit<40> buy_alpha_5;
    bit<40> sell_alpha_5;
    bit<64> placement_date;
    bit<64> issue_date;
    bit<64> maturity_date;
}

header open_interest_message_t {
    bit<32> instrument_number;
    bit<32> open_interest;
}

header derivatives_market_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_time;
    bit<32> volume_int_324;
    bit<64> price_rate;
    bit<8> concertation_type;
    bit<32> trade_number;
    bit<8> operation_type;
    bit<64> amount;
    bit<32> parent_trade_number;
    bit<8> leg_type;
}

header statistics_of_instruments_message_t {
    bit<32> instrument_number;
    bit<64> previous_settlement_price;
    bit<64> opening_price;
    bit<64> max_price_of_the_day;
    bit<64> lower_price_of_the_day;
    bit<64> last_price_of_the_day;
}

header general_indices_message_t {
    bit<16> component;
    bit<8> sector;
    bit<64> indices_hour;
    bit<64> volume_int_648;
    bit<32> indices_price_44;
    bit<32> variation;
    bit<32> percentage;
    bit<8> trend;
    bit<8> indices_status;
}

header indices_components_message_t {
    bit<64> date;
    bit<16> component;
    bit<8> sector;
    bit<8> type_;
    bit<56> issuer;
    bit<48> series;
    bit<64> indices_stocks;
    bit<64> last_price;
    bit<64> closing_price;
    bit<64> influence;
}

header inav_message_t {
    bit<32> trac_number;
    bit<64> theoretical_current_price;
}

header dollar_buy_sell_message_t {
    bit<64> posture_date;
    bit<40> currency;
    bit<8> dollar_side;
    bit<64> buy_precio_88;
    bit<64> sell_precio_88;
    bit<64> last_deal;
}

header short_sales_balances_per_instrument_message_t {
    bit<32> instrument_number;
    bit<64> date;
    bit<64> previous_balance;
    bit<64> amount_traded;
    bit<64> buybacks;
    bit<64> current_balance;
}

header capital_market_multiples_message_t {
    bit<32> instrument_id;
    bit<8> multiple_type;
    bit<8> registry_number;
    bit<8> sector;
    bit<8> subsector;
    bit<8> business_line;
    bit<8> sub_line;
    bit<64> pflepa_multiple;
    bit<64> pfepa_multiple;
    bit<64> ve_uaiida_multiple;
    bit<64> p_u;
    bit<64> p_vl;
    bit<64> f_1_p_unoc;
    bit<64> f_2_p_unoc;
    bit<64> f_1_p_ue;
    bit<64> f_2_p_ue;
    bit<64> f_1_ve_uaiida;
    bit<64> f_2_ve_uaiida;
    bit<64> f_1_p_u;
    bit<64> f_2_p_u;
    bit<64> f_1_p_vl;
    bit<64> f_2_p_vl;
}

header benchmark_message_t {
    bit<320> benchmark_name;
    bit<64> benchmark_date;
    bit<64> outstanding;
    bit<64> integer_amount;
    bit<32> decimal_amount;
    bit<64> indices_precio_88;
    bit<64> indices_24;
    bit<8> rebalance;
    bit<64> daily_performance;
    bit<64> annual_performance;
    bit<64> monthly_performance;
    bit<64> last_12_months_performance;
    bit<64> n24_hours_daily_performance;
    bit<64> n24_hours_annual_performance;
    bit<64> n24_hours_monthly_performance;
    bit<64> last_12_months_24_hours_performance;
}

header capitalization_rules_message_t {
    bit<32> instrument_number;
    bit<64> date_indicators;
    bit<32> bursatility_indices;
    bit<8> bursatility_indices_sign;
    bit<64> beta_coefficient;
    bit<8> beta_coefficient_sign;
    bit<64> correlation_coefficient;
    bit<8> correlation_coefficient_sign;
    bit<32> delta_difference;
}

header closing_price_origin_message_t {
    bit<32> instrument_number;
    bit<64> origin_price;
    bit<8> sending;
}

header mutual_funds_trades_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date_of_the_trade;
    bit<64> price;
    bit<64> book_value;
    bit<32> number_of_sales_trades;
    bit<64> sales_volume;
    bit<32> number_of_purchase_trades;
    bit<64> purchase_volume;
}

header opening_of_continuous_auctions_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> auction_session_startup_time;
    bit<64> auction_session_end_time;
}

header existence_of_bids_at_mid_price_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<8> bids_existing;
}

header catalogue_of_debt_and_metals_instruments_message_t {
    bit<32> number_of_the_instrument;
    bit<8> origin;
    bit<16> type_of_value;
    bit<56> issuing_company;
    bit<48> issuance;
    bit<64> date_of_issuance;
    bit<64> date_of_maturity;
    bit<64> price_rate_of_reference;
    bit<64> date_of_reference;
    bit<8> reference;
    bit<16> term_days;
    bit<16> coupon_period;
    bit<96> isin;
    bit<8> market;
    bit<64> current_nominal_value;
    bit<64> original_nominal_value;
    bit<64> outstanding_shares;
    bit<64> amount_placed;
    bit<8> trades_rate_price;
}

header catalog_sent_for_instruments_belonging_to_mutual_funds_message_t {
    bit<32> number_of_the_instrument;
    bit<8> origin;
    bit<16> type_of_value;
    bit<56> issuing_company;
    bit<48> series;
    bit<8> sector;
    bit<8> subsector;
    bit<8> industry;
    bit<8> sub_industry;
    bit<80> trading_company;
    bit<64> reference_price;
    bit<64> reference_date;
    bit<8> reference;
    bit<96> isin;
    bit<120> rating;
}

header weighted_average_price_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> weighted_average_price;
    bit<64> volatility;
}

header system_events_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<8> code_of_event;
    bit<8> market;
    bit<64> send_time;
    bit<64> end_time;
    bit<64> group;
}

header reference_price_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> price;
    bit<8> price_type;
}

header changes_in_status_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<8> status;
    bit<8> reason;
}

header catalog_for_instruments_belonging_to_the_capital_warrants_market_message_t {
    bit<32> number_of_the_instrument;
    bit<8> origin;
    bit<16> type_of_value;
    bit<56> issuing_company;
    bit<48> series;
    bit<8> type_of_warrant;
    bit<64> date_of_maturity;
    bit<64> price_of_exercise;
    bit<64> reference_price;
    bit<64> reference_date;
    bit<8> reference;
    bit<96> isin;
}

header catalog_sent_for_instruments_belonging_to_capital_tracs_message_t {
    bit<32> number_of_the_trac;
    bit<8> origin;
    bit<64> name_of_the_trac;
    bit<56> underlying_issuing_company;
    bit<48> underlying_series;
    bit<64> securities;
    bit<64> excluded_securities;
    bit<64> price;
    bit<64> component_in_cash;
    bit<64> excluded_value;
    bit<64> number_of_certificates;
    bit<64> theoretical_price;
}

header consolidated_inav_message_t {
    bit<32> number_of_the_trac;
    bit<8> origin;
    bit<64> current_theoretical_price;
}

header catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message_t {
    bit<32> mse_instrument_number;
    bit<16> value_of_type;
    bit<56> issuing_company;
    bit<48> series;
    bit<64> last_price;
    bit<64> ppp_weighted_average_price;
    bit<64> reference_date;
    bit<8> reference;
    bit<16> coupon_in_effect;
    bit<8> marketability;
    bit<32> numerical_marketability;
    bit<96> isin;
    bit<8> market;
    bit<64> registered_values;
    bit<8> exchange;
}

header probable_price_of_allocation_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> probable_price_of_allocation;
    bit<64> volume_int_648;
}

header relation_between_bmvbiva_instruments_message_t {
    bit<32> number_of_the_bmv_instrument;
    bit<32> biva_instrument;
    bit<8> type_of_trading;
}

header equities_market_trades_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> time_of_the_trade;
    bit<64> volume_int_648;
    bit<64> price;
    bit<8> type_of_agreement;
    bit<64> consecutive_number_of_the_trade;
    bit<8> sets_price;
    bit<8> type_of_trading;
    bit<64> amount;
    bit<40> purchases;
    bit<40> sells;
    bit<8> settlement;
    bit<8> auction_indicator;
    bit<8> indicator;
}

header consolidated_trade_cancellation_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> consecutive_number_of_the_trade;
}

header pricevolume_indicator_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> probable_price_of_allotment;
    bit<64> volume_int_648;
    bit<64> best_selling_price;
    bit<64> best_purchasing_price;
    bit<8> type_of_cross_trading;
}

header consolidated_execution_of_orders_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date;
    bit<64> consecutive_number;
    bit<64> volume_int_648;
    bit<64> consecutive_number_of_the_trade;
    bit<64> execution_price;
    bit<8> indicator;
    bit<8> sets_price;
    bit<40> participant;
}

header registration_of_order_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date_and_time;
    bit<64> consecutive_number;
    bit<8> direction;
    bit<64> volume_int_648;
    bit<64> price;
    bit<40> participant;
}

header cancellations_of_orders_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date;
    bit<64> consecutive_number;
}

header last_quote_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> volume_int_648;
    bit<64> price_rate;
    bit<8> direction_of_the_bid;
    bit<8> type_of_trading;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> depth_message_price_level_remaining;
}

struct headers_t {
    message_header_t message_header;
    message_header_message_block_t message_header_message_block[MAX_MESSAGES];
    login_response_message_t login_response_message[MAX_MESSAGES];
    replay_response_message_t replay_response_message[MAX_MESSAGES];
    snapshot_response_message_t snapshot_response_message[MAX_MESSAGES];
    snapshot_complete_message_t snapshot_complete_message[MAX_MESSAGES];
    events_system_message_t events_system_message[MAX_MESSAGES];
    trade_cancellation_message_t trade_cancellation_message[MAX_MESSAGES];
    status_changes_message_t status_changes_message[MAX_MESSAGES];
    weighted_average_price_settlement_prices_message_t weighted_average_price_settlement_prices_message[MAX_MESSAGES];
    capital_trades_message_t capital_trades_message[MAX_MESSAGES];
    probable_allocation_price_message_t probable_allocation_price_message[MAX_MESSAGES];
    continuous_auctions_beginning_message_t continuous_auctions_beginning_message[MAX_MESSAGES];
    middle_price_existing_quotes_message_t middle_price_existing_quotes_message[MAX_MESSAGES];
    registry_operations_message_t registry_operations_message[MAX_MESSAGES];
    mutual_fund_trades_message_t mutual_fund_trades_message[MAX_MESSAGES];
    tradability_message_t tradability_message[MAX_MESSAGES];
    virtual_trades_message_t virtual_trades_message[MAX_MESSAGES];
    order_addition_message_t order_addition_message[MAX_MESSAGES];
    execution_of_orders_message_t execution_of_orders_message[MAX_MESSAGES];
    order_cancellation_message_t order_cancellation_message[MAX_MESSAGES];
    order_change_message_t order_change_message[MAX_MESSAGES];
    depth_message_t depth_message[MAX_MESSAGES];
    depth_message_price_level_t depth_message_price_level[MAX_MESSAGES];
    best_offer_message_t best_offer_message[MAX_MESSAGES];
    public_offerings_message_t public_offerings_message[MAX_MESSAGES];
    open_interest_message_t open_interest_message[MAX_MESSAGES];
    derivatives_market_trades_message_t derivatives_market_trades_message[MAX_MESSAGES];
    statistics_of_instruments_message_t statistics_of_instruments_message[MAX_MESSAGES];
    general_indices_message_t general_indices_message[MAX_MESSAGES];
    indices_components_message_t indices_components_message[MAX_MESSAGES];
    inav_message_t inav_message[MAX_MESSAGES];
    dollar_buy_sell_message_t dollar_buy_sell_message[MAX_MESSAGES];
    short_sales_balances_per_instrument_message_t short_sales_balances_per_instrument_message[MAX_MESSAGES];
    capital_market_multiples_message_t capital_market_multiples_message[MAX_MESSAGES];
    benchmark_message_t benchmark_message[MAX_MESSAGES];
    capitalization_rules_message_t capitalization_rules_message[MAX_MESSAGES];
    closing_price_origin_message_t closing_price_origin_message[MAX_MESSAGES];
    mutual_funds_trades_message_t mutual_funds_trades_message[MAX_MESSAGES];
    opening_of_continuous_auctions_message_t opening_of_continuous_auctions_message[MAX_MESSAGES];
    existence_of_bids_at_mid_price_message_t existence_of_bids_at_mid_price_message[MAX_MESSAGES];
    catalogue_of_debt_and_metals_instruments_message_t catalogue_of_debt_and_metals_instruments_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_mutual_funds_message_t catalog_sent_for_instruments_belonging_to_mutual_funds_message[MAX_MESSAGES];
    weighted_average_price_message_t weighted_average_price_message[MAX_MESSAGES];
    system_events_message_t system_events_message[MAX_MESSAGES];
    reference_price_message_t reference_price_message[MAX_MESSAGES];
    changes_in_status_message_t changes_in_status_message[MAX_MESSAGES];
    catalog_for_instruments_belonging_to_the_capital_warrants_market_message_t catalog_for_instruments_belonging_to_the_capital_warrants_market_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_capital_tracs_message_t catalog_sent_for_instruments_belonging_to_capital_tracs_message[MAX_MESSAGES];
    consolidated_inav_message_t consolidated_inav_message[MAX_MESSAGES];
    catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message_t catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message[MAX_MESSAGES];
    probable_price_of_allocation_message_t probable_price_of_allocation_message[MAX_MESSAGES];
    relation_between_bmvbiva_instruments_message_t relation_between_bmvbiva_instruments_message[MAX_MESSAGES];
    equities_market_trades_message_t equities_market_trades_message[MAX_MESSAGES];
    consolidated_trade_cancellation_message_t consolidated_trade_cancellation_message[MAX_MESSAGES];
    pricevolume_indicator_message_t pricevolume_indicator_message[MAX_MESSAGES];
    consolidated_execution_of_orders_message_t consolidated_execution_of_orders_message[MAX_MESSAGES];
    registration_of_order_message_t registration_of_order_message[MAX_MESSAGES];
    cancellations_of_orders_message_t cancellations_of_orders_message[MAX_MESSAGES];
    last_quote_message_t last_quote_message[MAX_MESSAGES];
}

parser BmvmarketdataSnapshotTcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.total_messages) {
            8w0: parse_message_header_message_block_empty;
            default: parse_message_header_message_block;
        }
    }

    state parse_message_header_message_block {
        packet.extract(hdr.message_header_message_block.next);
        transition select(hdr.message_header_message_block.last.message_type) {
            8w0x26: parse_login_response_message;
            8w0x2A: parse_replay_response_message;
            8w0x2B: parse_snapshot_response_message;
            8w0x3F: parse_snapshot_complete_message;
            8w0x53: parse_events_system_message;
            8w0x48: parse_trade_cancellation_message;
            8w0x34: parse_status_changes_message;
            8w0x4D: parse_weighted_average_price_settlement_prices_message;
            8w0x50: parse_capital_trades_message;
            8w0x32: parse_probable_allocation_price_message;
            8w0x33: parse_continuous_auctions_beginning_message;
            8w0x35: parse_middle_price_existing_quotes_message;
            8w0x5A: parse_registry_operations_message;
            8w0x59: parse_mutual_fund_trades_message;
            8w0x45: parse_tradability_message;
            8w0x56: parse_virtual_trades_message;
            8w0x41: parse_order_addition_message;
            8w0x43: parse_execution_of_orders_message;
            8w0x44: parse_order_cancellation_message;
            8w0x46: parse_order_change_message;
            8w0x31: parse_depth_message;
            8w0x4F: parse_best_offer_message;
            8w0x42: parse_public_offerings_message;
            8w0x49: parse_open_interest_message;
            8w0x51: parse_derivatives_market_trades_message;
            8w0x52: parse_statistics_of_instruments_message;
            8w0x55: parse_general_indices_message;
            8w0x57: parse_indices_components_message;
            8w0x47: parse_inav_message;
            8w0x72: parse_dollar_buy_sell_message;
            8w0x73: parse_short_sales_balances_per_instrument_message;
            8w0x74: parse_capital_market_multiples_message;
            8w0x78: parse_benchmark_message;
            8w0x7A: parse_capitalization_rules_message;
            8w0x7E: parse_closing_price_origin_message;
            8w0x28: parse_mutual_funds_trades_message;
            8w0x29: parse_opening_of_continuous_auctions_message;
            8w0x2C: parse_existence_of_bids_at_mid_price_message;
            8w0x2E: parse_catalogue_of_debt_and_metals_instruments_message;
            8w0x30: parse_catalog_sent_for_instruments_belonging_to_mutual_funds_message;
            8w0x36: parse_weighted_average_price_message;
            8w0x37: parse_system_events_message;
            8w0x38: parse_reference_price_message;
            8w0x39: parse_changes_in_status_message;
            8w0x54: parse_catalog_for_instruments_belonging_to_the_capital_warrants_market_message;
            8w0x5B: parse_catalog_sent_for_instruments_belonging_to_capital_tracs_message;
            8w0x5D: parse_consolidated_inav_message;
            8w0x68: parse_catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message;
            8w0x69: parse_probable_price_of_allocation_message;
            8w0x6A: parse_relation_between_bmvbiva_instruments_message;
            8w0x70: parse_equities_market_trades_message;
            8w0x71: parse_consolidated_trade_cancellation_message;
            8w0x5C: parse_pricevolume_indicator_message;
            8w0x6B: parse_consolidated_execution_of_orders_message;
            8w0x6E: parse_registration_of_order_message;
            8w0x75: parse_cancellations_of_orders_message;
            8w0x6D: parse_last_quote_message;
            default: accept;
        }
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_replay_response_message {
        packet.extract(hdr.replay_response_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_snapshot_response_message {
        packet.extract(hdr.snapshot_response_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_snapshot_complete_message {
        packet.extract(hdr.snapshot_complete_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_events_system_message {
        packet.extract(hdr.events_system_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_trade_cancellation_message {
        packet.extract(hdr.trade_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_status_changes_message {
        packet.extract(hdr.status_changes_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_weighted_average_price_settlement_prices_message {
        packet.extract(hdr.weighted_average_price_settlement_prices_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_capital_trades_message {
        packet.extract(hdr.capital_trades_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_probable_allocation_price_message {
        packet.extract(hdr.probable_allocation_price_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_continuous_auctions_beginning_message {
        packet.extract(hdr.continuous_auctions_beginning_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_middle_price_existing_quotes_message {
        packet.extract(hdr.middle_price_existing_quotes_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_registry_operations_message {
        packet.extract(hdr.registry_operations_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_mutual_fund_trades_message {
        packet.extract(hdr.mutual_fund_trades_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_tradability_message {
        packet.extract(hdr.tradability_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_virtual_trades_message {
        packet.extract(hdr.virtual_trades_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_order_addition_message {
        packet.extract(hdr.order_addition_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_execution_of_orders_message {
        packet.extract(hdr.execution_of_orders_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_order_cancellation_message {
        packet.extract(hdr.order_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_order_change_message {
        packet.extract(hdr.order_change_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_depth_message {
        packet.extract(hdr.depth_message.next);
        meta.dispatched = 1;
        meta.depth_message_price_level_remaining = hdr.depth_message.last.purchase_or_sale_levels;
        transition select(meta.depth_message_price_level_remaining) {
            8w0: parse_message_header_message_block;
            default: parse_depth_message_price_level;
        }
    }

    state parse_depth_message_price_level {
        packet.extract(hdr.depth_message_price_level.next);
        meta.depth_message_price_level_remaining = meta.depth_message_price_level_remaining - 1;
        transition select(meta.depth_message_price_level_remaining) {
            8w0: parse_message_header_message_block;
            default: parse_depth_message_price_level;
        }
    }

    state parse_best_offer_message {
        packet.extract(hdr.best_offer_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_public_offerings_message {
        packet.extract(hdr.public_offerings_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_derivatives_market_trades_message {
        packet.extract(hdr.derivatives_market_trades_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_statistics_of_instruments_message {
        packet.extract(hdr.statistics_of_instruments_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_general_indices_message {
        packet.extract(hdr.general_indices_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_indices_components_message {
        packet.extract(hdr.indices_components_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_inav_message {
        packet.extract(hdr.inav_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_dollar_buy_sell_message {
        packet.extract(hdr.dollar_buy_sell_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_short_sales_balances_per_instrument_message {
        packet.extract(hdr.short_sales_balances_per_instrument_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_capital_market_multiples_message {
        packet.extract(hdr.capital_market_multiples_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_benchmark_message {
        packet.extract(hdr.benchmark_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_capitalization_rules_message {
        packet.extract(hdr.capitalization_rules_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_closing_price_origin_message {
        packet.extract(hdr.closing_price_origin_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_mutual_funds_trades_message {
        packet.extract(hdr.mutual_funds_trades_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_opening_of_continuous_auctions_message {
        packet.extract(hdr.opening_of_continuous_auctions_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_existence_of_bids_at_mid_price_message {
        packet.extract(hdr.existence_of_bids_at_mid_price_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_catalogue_of_debt_and_metals_instruments_message {
        packet.extract(hdr.catalogue_of_debt_and_metals_instruments_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_mutual_funds_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_mutual_funds_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_weighted_average_price_message {
        packet.extract(hdr.weighted_average_price_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_system_events_message {
        packet.extract(hdr.system_events_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_reference_price_message {
        packet.extract(hdr.reference_price_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_changes_in_status_message {
        packet.extract(hdr.changes_in_status_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_catalog_for_instruments_belonging_to_the_capital_warrants_market_message {
        packet.extract(hdr.catalog_for_instruments_belonging_to_the_capital_warrants_market_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_capital_tracs_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_capital_tracs_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_consolidated_inav_message {
        packet.extract(hdr.consolidated_inav_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message {
        packet.extract(hdr.catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_probable_price_of_allocation_message {
        packet.extract(hdr.probable_price_of_allocation_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_relation_between_bmvbiva_instruments_message {
        packet.extract(hdr.relation_between_bmvbiva_instruments_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_equities_market_trades_message {
        packet.extract(hdr.equities_market_trades_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_consolidated_trade_cancellation_message {
        packet.extract(hdr.consolidated_trade_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_pricevolume_indicator_message {
        packet.extract(hdr.pricevolume_indicator_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_consolidated_execution_of_orders_message {
        packet.extract(hdr.consolidated_execution_of_orders_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_registration_of_order_message {
        packet.extract(hdr.registration_of_order_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_cancellations_of_orders_message {
        packet.extract(hdr.cancellations_of_orders_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_last_quote_message {
        packet.extract(hdr.last_quote_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message_block;
    }

    state parse_message_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataSnapshotTcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataSnapshotTcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataSnapshotTcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataSnapshotTcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataSnapshotTcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.message_header_message_block);
        packet.emit(hdr.login_response_message);
        packet.emit(hdr.replay_response_message);
        packet.emit(hdr.snapshot_response_message);
        packet.emit(hdr.snapshot_complete_message);
        packet.emit(hdr.events_system_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.status_changes_message);
        packet.emit(hdr.weighted_average_price_settlement_prices_message);
        packet.emit(hdr.capital_trades_message);
        packet.emit(hdr.probable_allocation_price_message);
        packet.emit(hdr.continuous_auctions_beginning_message);
        packet.emit(hdr.middle_price_existing_quotes_message);
        packet.emit(hdr.registry_operations_message);
        packet.emit(hdr.mutual_fund_trades_message);
        packet.emit(hdr.tradability_message);
        packet.emit(hdr.virtual_trades_message);
        packet.emit(hdr.order_addition_message);
        packet.emit(hdr.execution_of_orders_message);
        packet.emit(hdr.order_cancellation_message);
        packet.emit(hdr.order_change_message);
        packet.emit(hdr.depth_message);
        packet.emit(hdr.depth_message_price_level);
        packet.emit(hdr.best_offer_message);
        packet.emit(hdr.public_offerings_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.derivatives_market_trades_message);
        packet.emit(hdr.statistics_of_instruments_message);
        packet.emit(hdr.general_indices_message);
        packet.emit(hdr.indices_components_message);
        packet.emit(hdr.inav_message);
        packet.emit(hdr.dollar_buy_sell_message);
        packet.emit(hdr.short_sales_balances_per_instrument_message);
        packet.emit(hdr.capital_market_multiples_message);
        packet.emit(hdr.benchmark_message);
        packet.emit(hdr.capitalization_rules_message);
        packet.emit(hdr.closing_price_origin_message);
        packet.emit(hdr.mutual_funds_trades_message);
        packet.emit(hdr.opening_of_continuous_auctions_message);
        packet.emit(hdr.existence_of_bids_at_mid_price_message);
        packet.emit(hdr.catalogue_of_debt_and_metals_instruments_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_mutual_funds_message);
        packet.emit(hdr.weighted_average_price_message);
        packet.emit(hdr.system_events_message);
        packet.emit(hdr.reference_price_message);
        packet.emit(hdr.changes_in_status_message);
        packet.emit(hdr.catalog_for_instruments_belonging_to_the_capital_warrants_market_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_capital_tracs_message);
        packet.emit(hdr.consolidated_inav_message);
        packet.emit(hdr.catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message);
        packet.emit(hdr.probable_price_of_allocation_message);
        packet.emit(hdr.relation_between_bmvbiva_instruments_message);
        packet.emit(hdr.equities_market_trades_message);
        packet.emit(hdr.consolidated_trade_cancellation_message);
        packet.emit(hdr.pricevolume_indicator_message);
        packet.emit(hdr.consolidated_execution_of_orders_message);
        packet.emit(hdr.registration_of_order_message);
        packet.emit(hdr.cancellations_of_orders_message);
        packet.emit(hdr.last_quote_message);
    }
}

V1Switch(
    BmvmarketdataSnapshotTcpParser(),
    BmvmarketdataSnapshotTcpVerifyChecksum(),
    BmvmarketdataSnapshotTcpIngress(),
    BmvmarketdataSnapshotTcpEgress(),
    BmvmarketdataSnapshotTcpComputeChecksum(),
    BmvmarketdataSnapshotTcpDeparser()
) main;
