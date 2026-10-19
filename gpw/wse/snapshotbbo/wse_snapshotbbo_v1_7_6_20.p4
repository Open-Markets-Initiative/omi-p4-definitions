// P4_16 (v1model) definition for: Gpw Wse SnapshotBbo Wats v1.7.6.20
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: Warsaw Stock Exchange BBO Snapshot
//   Encoding: Warsaw Automated Trading System
//   Version: 1.7.6.20
//   Date: 10/05/2026
//   Specification: GPW_WATS_3.01_Market_Data_Protocol_v1.7.6.20.pdf
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
    bit<16> message_length;
    bit<16> message_type;
    bit<16> message_version;
    bit<32> sequence_number;
    bit<64> timestamp;
    bit<64> source_timestamp;
    bit<8> is_encrypted;
    bit<64> encryption_offset;
    bit<32> encryption_key_id;
    bit<16> session_id;
    bit<8> stream_id;
}

header week_plan_t {
    bit<32> calendar_id;
    bit<56> weekdays;
}

header calendar_exception_t {
    bit<32> calendar_id;
    bit<32> calendar_exception_date;
    bit<8> calendar_exception_type;
}

header tick_table_entry_t {
    bit<64> tick_size;
    bit<64> lower_bound;
    bit<32> tick_table_id;
}

header collar_table_entry_t {
    bit<32> collar_table_id;
    bit<8> collar_mode;
    bit<8> collar_expression;
    bit<64> collar_lower_bound;
    bit<64> collar_value;
    bit<64> collar_lower_bid;
    bit<64> collar_upper_bid;
    bit<64> collar_upper_ask;
    bit<64> collar_lower_ask;
}

header trading_phase_schedule_entry_t {
    bit<32> trading_schedule_id;
    bit<32> trading_phase_id;
    bit<8> trading_phase_settlement_cycle;
    bit<8> trading_phase_max_block_settlement_cycle;
    bit<32> static_collar_volatility_auction_id;
    bit<32> dynamic_collar_volatility_auction_id;
    bit<64> trading_phase_start_time;
    bit<8> trading_phase_type;
    bit<8> uncrossing;
    bit<32> ext_static_collar_volatility_auction_id;
    bit<32> ext_dynamic_collar_volatility_auction_id;
    bit<32> clat_id;
}

header market_structure_t {
    bit<32> id;
    bit<32> parent_id;
    bit<32> mic;
    bit<400> name;
    bit<8> market_model_type;
}

header collar_group_t {
    bit<32> id;
    bit<32> order_static_collar_table_id;
    bit<32> order_dynamic_collar_table_id;
    bit<32> trade_static_collar_table_id;
    bit<32> trade_dynamic_collar_table_id;
}

header external_underlying_t {
    bit<32> external_underlying_id;
    bit<240> product_identification_product_identification;
    bit<8> product_identification_type;
    bit<160> product_code;
    bit<400> product_name;
    bit<32> mic;
    bit<16> nominal_currency;
    bit<16> trading_currency;
}

header instrument_t {
    bit<32> instrument_id;
    bit<8> product_type;
    bit<8> product_subtype;
    bit<32> first_trading_date;
    bit<32> last_trading_date;
    bit<32> product_id;
    bit<16> currency;
    bit<64> iceberg_min_value;
    bit<32> lot_size;
    bit<8> price_expression_type;
    bit<32> calendar_id;
    bit<32> market_structure_id;
    bit<32> tick_table_id;
    bit<32> reference_instrument_id;
    bit<32> collar_group_id;
    bit<32> trading_schedule_id;
    bit<512> description;
    bit<32> mic;
    bit<64> nominal_value_price;
    bit<8> nominal_value_type;
    bit<64> multiplier_multiplier;
    bit<64> strike_price;
    bit<16> strike_price_currency;
    bit<240> product_identification_product_identification;
    bit<8> product_identification_type;
    bit<32> settlement_calendar_id;
    bit<8> bond_coupon_type;
    bit<64> pre_trade_check_min_price;
    bit<64> pre_trade_check_max_price;
    bit<64> pre_trade_check_min_quantity;
    bit<64> pre_trade_check_max_quantity;
    bit<64> pre_trade_check_max_value;
    bit<64> pre_trade_check_min_value;
    bit<8> liquidity;
    bit<8> market_model_type;
    bit<1200> issuer;
    bit<16> issuer_reg_country;
    bit<32> underlying_instrument_id;
    bit<160> product_code;
    bit<48> cfi;
    bit<280> fisn;
    bit<64> issue_size;
    bit<16> nominal_currency;
    bit<8> us_indicator;
    bit<32> expiry_date;
    bit<8> version_number;
    bit<8> settlement_type;
    bit<8> option_type;
    bit<8> exercise_type;
    bit<400> product_name;
    bit<64> reference_price;
    bit<8> status;
    bit<32> initial_phase_id;
    bit<64> threshold_max;
    bit<64> threshold_min;
    bit<8> is_leverage;
    bit<64> accrued_interest_value;
    bit<1024> kid;
    bit<32> kid_issue_date;
    bit<8> value_at_risk;
    bit<32> external_underlying_id;
}

header accrued_interest_table_entry_t {
    bit<32> product_id;
    bit<32> accrued_interest_table_entry_date;
    bit<64> accrued_interest_table_entry_value;
}

header indexation_table_entry_t {
    bit<32> product_id;
    bit<32> indexation_table_entry_date;
    bit<64> indexation_table_entry_value;
}

header index_params_t {
    bit<32> instrument_id;
    bit<64> index_base_value;
    bit<64> index_base_capitalisation;
    bit<32> index_base_date;
    bit<64> correction_coefficient;
    bit<16> num_of_components;
    bit<8> index_publication_schedule;
    bit<8> index_type;
    bit<6> reserved_27_index_params_presence_flags;
    bit<1> has_number_of_dividends;
    bit<1> has_days_since_last_publication;
    bit<8> days_since_last_publication;
    bit<16> number_of_dividends;
    bit<8> count;
}

header index_params_items_t {
    bit<240> product_identification_product_identification;
    bit<8> product_identification_type;
    bit<8> index_underlying_type;
}

header index_portfolio_entry_t {
    bit<32> id;
    bit<32> index_id;
    bit<7> reserved_17_index_portfolio_entry_presence_flags;
    bit<1> has_instrument_id;
    bit<32> instrument_id;
    bit<240> product_identification_product_identification;
    bit<8> product_identification_type;
    bit<32> mic;
    bit<16> currency;
    bit<64> instrument_packet;
    bit<8> suspended;
}

header auction_summary_t {
    bit<32> instrument_id;
    bit<64> price;
    bit<64> quantity;
    bit<8> auction_type;
}

header auction_update_t {
    bit<32> instrument_id;
    bit<64> indicative_matching_price;
    bit<64> indicative_matching_volume;
    bit<64> total_sell_quantity_at_imp;
    bit<64> total_buy_quantity_at_imp;
    bit<64> best_sell_level;
    bit<64> best_sell_level_quantity;
    bit<64> best_buy_level;
    bit<64> best_buy_level_quantity;
}

header price_level_snapshot_t {
    bit<32> instrument_id;
    bit<8> max_depth;
    bit<8> mm_buy_quote_level;
    bit<8> mm_sell_quote_level;
}

header price_level_snapshot_buy_t {
    bit<8> is_encrypted;
    bit<64> encryption_offset;
    bit<32> encryption_key_id;
    bit<64> price;
    bit<64> quantity;
    bit<16> order_count;
}

header price_level_snapshot_sell_t {
    bit<8> is_encrypted;
    bit<64> encryption_offset;
    bit<32> encryption_key_id;
    bit<64> price;
    bit<64> quantity;
    bit<16> order_count;
}

header top_price_level_update_t {
    bit<32> instrument_id;
    bit<64> price;
    bit<64> quantity;
    bit<8> side;
    bit<16> order_count;
}

header trade_t {
    bit<32> instrument_id;
    bit<64> settlement_value_value;
    bit<32> settlement_date;
    bit<64> trading_timestamp;
    bit<240> product_identification_product_identification;
    bit<8> product_identification_type;
    bit<64> price;
    bit<16> price_currency;
    bit<8> price_notation;
    bit<64> quantity;
    bit<64> nominal_value_value;
    bit<16> nominal_currency;
    bit<32> mic;
    bit<64> publication_timestamp;
    bit<32> trade_id;
    bit<8> trade_to_be_cleared;
    bit<64> pct_change;
    bit<64> vwap;
    bit<64> no_trades;
    bit<64> total_volume;
    bit<64> total_value;
    bit<64> opening_price;
    bit<64> max_price;
    bit<64> min_price;
    bit<8> mmt_market_mechanism;
    bit<8> mmt_trading_mode;
    bit<8> mmt_transaction_category;
    bit<8> mmt_negotiation_indicator;
    bit<8> mmt_agency_cross_trade_indicator;
    bit<8> mmt_modification_indicator;
    bit<8> mmt_benchmark_reference_price_indicator;
    bit<8> mmt_special_dividend_indicator;
    bit<8> mmt_off_book_automated_indicator;
    bit<8> mmt_ordinary_trade_indicator;
    bit<8> mmt_algorithmic_indicator;
    bit<8> mmt_post_trade_deferral_reason;
    bit<8> mmt_post_trade_deferral_type;
}

header position_report_t {
    bit<240> product_identification_product_identification;
    bit<8> product_identification_type;
    bit<8> pos_type;
    bit<32> open_positions;
    bit<32> trade_id;
}

header instrument_status_change_t {
    bit<32> instrument_id;
    bit<32> trading_phase_id;
    bit<8> trading_phase_type;
    bit<8> status;
    bit<8> stressed_market;
}

header order_collars_t {
    bit<32> instrument_id;
    bit<8> collar_type;
    bit<64> price;
    bit<64> lower_bid;
    bit<64> upper_bid;
    bit<64> lower_ask;
    bit<64> upper_ask;
}

header trade_collars_t {
    bit<32> instrument_id;
    bit<8> collar_type;
    bit<64> price;
    bit<64> lower;
    bit<64> upper;
}

header instrument_summary_t {
    bit<32> instrument_id;
    bit<64> last_traded_price;
    bit<64> closing_price;
    bit<8> closing_price_type;
    bit<64> adjusted_closing_price;
    bit<8> adjusted_closing_price_reason;
    bit<64> pct_change;
    bit<64> vwap;
    bit<64> no_trades;
    bit<64> total_volume;
    bit<64> total_value;
    bit<64> opening_price;
    bit<64> max_price;
    bit<64> min_price;
    bit<8> is_correction;
}

header product_summary_t {
    bit<32> instrument_id;
    bit<8> market_model_type;
    bit<64> last_traded_price;
    bit<64> closing_price;
    bit<8> closing_price_type;
    bit<64> adjusted_closing_price;
    bit<8> adjusted_closing_price_reason;
    bit<64> pct_change;
    bit<64> vwap;
    bit<64> no_trades;
    bit<64> total_volume;
    bit<64> total_value;
    bit<64> opening_price;
    bit<64> max_price;
    bit<64> min_price;
    bit<64> settlement_price;
    bit<64> settlement_value_price;
    bit<32> end_trading_date;
    bit<32> last_trade_date;
    bit<32> instrument_id_2;
    bit<8> market_model_type_2;
    bit<64> last_traded_price_2;
    bit<64> closing_price_2;
    bit<8> closing_price_type_2;
    bit<64> adjusted_closing_price_2;
    bit<8> adjusted_closing_price_reason_2;
    bit<64> pct_change_2;
    bit<64> vwap_2;
    bit<64> no_trades_2;
    bit<64> total_volume_2;
    bit<64> total_value_2;
    bit<64> opening_price_2;
    bit<64> max_price_2;
    bit<64> min_price_2;
    bit<64> settlement_price_2;
    bit<64> settlement_value_price_2;
    bit<32> end_trading_date_2;
    bit<32> last_trade_date_2;
    bit<32> instrument_id_3;
    bit<8> market_model_type_3;
    bit<64> last_traded_price_3;
    bit<64> closing_price_3;
    bit<8> closing_price_type_3;
    bit<64> adjusted_closing_price_3;
    bit<8> adjusted_closing_price_reason_3;
    bit<64> pct_change_3;
    bit<64> vwap_3;
    bit<64> no_trades_3;
    bit<64> total_volume_3;
    bit<64> total_value_3;
    bit<64> opening_price_3;
    bit<64> max_price_3;
    bit<64> min_price_3;
    bit<64> settlement_price_3;
    bit<64> settlement_value_price_3;
    bit<32> end_trading_date_3;
    bit<32> last_trade_date_3;
    bit<32> instrument_id_4;
    bit<8> market_model_type_4;
    bit<64> last_traded_price_4;
    bit<64> closing_price_4;
    bit<8> closing_price_type_4;
    bit<64> adjusted_closing_price_4;
    bit<8> adjusted_closing_price_reason_4;
    bit<64> pct_change_4;
    bit<64> vwap_4;
    bit<64> no_trades_4;
    bit<64> total_volume_4;
    bit<64> total_value_4;
    bit<64> opening_price_4;
    bit<64> max_price_4;
    bit<64> min_price_4;
    bit<64> settlement_price_4;
    bit<64> settlement_value_price_4;
    bit<32> end_trading_date_4;
    bit<32> last_trade_date_4;
    bit<8> product_identification_type;
    bit<240> product_identification_product_identification;
    bit<32> product_id;
    bit<32> mic;
    bit<64> accumulated_interest;
    bit<64> interest_rate;
    bit<16> currency;
    bit<32> session_date;
    bit<64> trading_value_currency;
    bit<8> status;
    bit<16> sector;
    bit<8> market;
    bit<8> marker_price_change;
    bit<8> lower_liquidity;
    bit<64> multiplier_number;
    bit<64> dividend_rate;
    bit<64> delta;
    bit<64> gamma;
    bit<64> rho;
    bit<64> theta;
    bit<64> vega;
    bit<64> volatility;
    bit<64> options_strike_price;
    bit<8> dividend;
    bit<8> subscription_right;
    bit<8> interim_dividend_right;
    bit<8> split;
    bit<8> quotation_system;
    bit<8> liquidity_support_pge;
}

header price_update_t {
    bit<32> instrument_id;
    bit<8> price_update_type;
    bit<16> price_ytm_presence;
    bit<64> value;
    bit<64> value_bid;
    bit<64> value_ask;
}

header news_t {
    bit<32> market_structure_id;
    bit<32> news_id;
    bit<640> title;
    bit<8> entry_number;
    bit<8> total;
    bit<2048> text_chunk0;
    bit<2048> text_chunk1;
    bit<2048> text_chunk2;
    bit<256> text_chunk3;
}

header real_time_index_t {
    bit<32> instrument_id;
    bit<8> index_level_code;
    bit<16> num_of_active_instruments;
    bit<64> ind_index_opening_portfolio;
    bit<64> index_value;
    bit<64> pct_change_index_val_prev_session;
    bit<64> session_low;
    bit<64> session_high;
    bit<3> reserved_57;
    bit<1> has_difference_central_spread;
    bit<1> has_mid_spread_index;
    bit<1> has_index_value_ask;
    bit<1> has_index_value_bid;
    bit<1> has_trading_value;
    bit<64> trading_value;
    bit<64> index_value_bid;
    bit<64> index_value_ask;
    bit<64> mid_spread_index;
    bit<64> difference_central_spread;
}

header index_summary_t {
    bit<32> instrument_id;
    bit<64> opening_index_value;
    bit<64> session_low;
    bit<64> session_high;
    bit<64> closing_index_value;
    bit<7> reserved_17_index_summary_presence_flags;
    bit<1> has_session_avg;
    bit<64> session_avg;
    bit<64> pct_change_index_val_prev_session;
    bit<64> pct_change_index_val_prev_year;
    bit<64> closing_capitalisation_portfolio;
    bit<64> ind_index_opening_portfolio;
}

header trading_session_status_t {
    bit<32> market_id;
    bit<32> market_structure_id;
    bit<8> trading_session_event;
    bit<32> date;
}

header test_event_t {
    bit<1600> scenario_name;
    bit<8> event_type;
}

header encryption_key_t {
    bit<32> id;
    bit<256> secret_key;
}

header login_t {
    bit<16> connection_id;
    bit<64> token;
    bit<6> reserved_27_message_filter;
    bit<1> ref_data;
    bit<1> trades;
}

header login_response_t {
    bit<8> result;
}

header end_of_snapshot_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> index_params_items_remaining;
    bit<16> price_level_snapshot_buy_remaining;
    bit<16> price_level_snapshot_sell_remaining;
}

struct headers_t {
    message_header_t message_header;
    week_plan_t week_plan;
    calendar_exception_t calendar_exception;
    tick_table_entry_t tick_table_entry;
    collar_table_entry_t collar_table_entry;
    trading_phase_schedule_entry_t trading_phase_schedule_entry;
    market_structure_t market_structure;
    collar_group_t collar_group;
    external_underlying_t external_underlying;
    instrument_t instrument;
    accrued_interest_table_entry_t accrued_interest_table_entry;
    indexation_table_entry_t indexation_table_entry;
    index_params_t index_params;
    index_params_items_t index_params_items[MAX_MESSAGES];
    index_portfolio_entry_t index_portfolio_entry;
    auction_summary_t auction_summary;
    auction_update_t auction_update;
    price_level_snapshot_t price_level_snapshot;
    price_level_snapshot_buy_t price_level_snapshot_buy[MAX_MESSAGES];
    price_level_snapshot_sell_t price_level_snapshot_sell[MAX_MESSAGES];
    top_price_level_update_t top_price_level_update;
    trade_t trade;
    position_report_t position_report;
    instrument_status_change_t instrument_status_change;
    order_collars_t order_collars;
    trade_collars_t trade_collars;
    instrument_summary_t instrument_summary;
    product_summary_t product_summary;
    price_update_t price_update;
    news_t news;
    real_time_index_t real_time_index;
    index_summary_t index_summary;
    trading_session_status_t trading_session_status;
    test_event_t test_event;
    encryption_key_t encryption_key;
    login_t login;
    login_response_t login_response;
    end_of_snapshot_t end_of_snapshot;
}

parser WseSnapshotbboParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w0x2100: parse_week_plan;
            16w0x2300: parse_calendar_exception;
            16w0x2000: parse_tick_table_entry;
            16w0x6c00: parse_collar_table_entry;
            16w0x1b00: parse_trading_phase_schedule_entry;
            16w0x1301: parse_market_structure;
            16w0x2b01: parse_collar_group;
            16w0x2603: parse_external_underlying;
            16w0x1701: parse_instrument;
            16w0x2400: parse_accrued_interest_table_entry;
            16w0x2500: parse_indexation_table_entry;
            16w0xf701: parse_index_params;
            16w0xf601: parse_index_portfolio_entry;
            16w0xe01: parse_auction_summary;
            16w0xc01: parse_auction_update;
            16w0x101: parse_price_level_snapshot;
            16w0x1: parse_top_price_level_update;
            16w0x2600: parse_trade;
            16w0x2103: parse_position_report;
            16w0x1a00: parse_instrument_status_change;
            16w0x1001: parse_order_collars;
            16w0x1101: parse_trade_collars;
            16w0x9f02: parse_instrument_summary;
            16w0xa002: parse_product_summary;
            16w0xf01: parse_price_update;
            16w0x502: parse_news;
            16w0xf401: parse_real_time_index;
            16w0xf501: parse_index_summary;
            16w0x1700: parse_trading_session_status;
            16w0x100: parse_heartbeat;
            16w0x20: parse_test_event;
            16w0x1800: parse_encryption_key;
            16w0x9b02: parse_login;
            16w0x9c02: parse_login_response;
            16w0x9d02: parse_logout;
            16w0x9e02: parse_end_of_snapshot;
            default: accept;
        }
    }

    state parse_week_plan {
        packet.extract(hdr.week_plan);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_calendar_exception {
        packet.extract(hdr.calendar_exception);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tick_table_entry {
        packet.extract(hdr.tick_table_entry);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_collar_table_entry {
        packet.extract(hdr.collar_table_entry);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_phase_schedule_entry {
        packet.extract(hdr.trading_phase_schedule_entry);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_structure {
        packet.extract(hdr.market_structure);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_collar_group {
        packet.extract(hdr.collar_group);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_external_underlying {
        packet.extract(hdr.external_underlying);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument {
        packet.extract(hdr.instrument);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_accrued_interest_table_entry {
        packet.extract(hdr.accrued_interest_table_entry);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indexation_table_entry {
        packet.extract(hdr.indexation_table_entry);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_index_params {
        packet.extract(hdr.index_params);
        meta.dispatched = 1;
        meta.index_params_items_remaining = 16w3;
        transition parse_index_params_items;
    }

    state parse_index_params_items {
        packet.extract(hdr.index_params_items.next);
        meta.index_params_items_remaining = meta.index_params_items_remaining - 1;
        transition select(meta.index_params_items_remaining) {
            16w0: accept;
            default: parse_index_params_items;
        }
    }

    state parse_index_portfolio_entry {
        packet.extract(hdr.index_portfolio_entry);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_summary {
        packet.extract(hdr.auction_summary);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_update {
        packet.extract(hdr.auction_update);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_level_snapshot {
        packet.extract(hdr.price_level_snapshot);
        meta.dispatched = 1;
        meta.price_level_snapshot_buy_remaining = 16w5;
        transition parse_price_level_snapshot_buy;
    }

    state parse_price_level_snapshot_buy {
        packet.extract(hdr.price_level_snapshot_buy.next);
        meta.price_level_snapshot_buy_remaining = meta.price_level_snapshot_buy_remaining - 1;
        transition select(meta.price_level_snapshot_buy_remaining) {
            16w0: read_price_level_snapshot_sell;
            default: parse_price_level_snapshot_buy;
        }
    }

    state read_price_level_snapshot_sell {
        meta.price_level_snapshot_sell_remaining = 16w5;
        transition parse_price_level_snapshot_sell;
    }

    state parse_price_level_snapshot_sell {
        packet.extract(hdr.price_level_snapshot_sell.next);
        meta.price_level_snapshot_sell_remaining = meta.price_level_snapshot_sell_remaining - 1;
        transition select(meta.price_level_snapshot_sell_remaining) {
            16w0: accept;
            default: parse_price_level_snapshot_sell;
        }
    }

    state parse_top_price_level_update {
        packet.extract(hdr.top_price_level_update);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade {
        packet.extract(hdr.trade);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_position_report {
        packet.extract(hdr.position_report);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_status_change {
        packet.extract(hdr.instrument_status_change);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_collars {
        packet.extract(hdr.order_collars);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_collars {
        packet.extract(hdr.trade_collars);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_summary {
        packet.extract(hdr.instrument_summary);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_product_summary {
        packet.extract(hdr.product_summary);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_update {
        packet.extract(hdr.price_update);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_news {
        packet.extract(hdr.news);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_real_time_index {
        packet.extract(hdr.real_time_index);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_index_summary {
        packet.extract(hdr.index_summary);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_session_status {
        packet.extract(hdr.trading_session_status);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test_event {
        packet.extract(hdr.test_event);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_encryption_key {
        packet.extract(hdr.encryption_key);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login {
        packet.extract(hdr.login);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_response {
        packet.extract(hdr.login_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_snapshot {
        packet.extract(hdr.end_of_snapshot);
        meta.dispatched = 1;
        transition accept;
    }

}

control WseSnapshotbboVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseSnapshotbboIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control WseSnapshotbboEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control WseSnapshotbboComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseSnapshotbboDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.week_plan);
        packet.emit(hdr.calendar_exception);
        packet.emit(hdr.tick_table_entry);
        packet.emit(hdr.collar_table_entry);
        packet.emit(hdr.trading_phase_schedule_entry);
        packet.emit(hdr.market_structure);
        packet.emit(hdr.collar_group);
        packet.emit(hdr.external_underlying);
        packet.emit(hdr.instrument);
        packet.emit(hdr.accrued_interest_table_entry);
        packet.emit(hdr.indexation_table_entry);
        packet.emit(hdr.index_params);
        packet.emit(hdr.index_params_items);
        packet.emit(hdr.index_portfolio_entry);
        packet.emit(hdr.auction_summary);
        packet.emit(hdr.auction_update);
        packet.emit(hdr.price_level_snapshot);
        packet.emit(hdr.price_level_snapshot_buy);
        packet.emit(hdr.price_level_snapshot_sell);
        packet.emit(hdr.top_price_level_update);
        packet.emit(hdr.trade);
        packet.emit(hdr.position_report);
        packet.emit(hdr.instrument_status_change);
        packet.emit(hdr.order_collars);
        packet.emit(hdr.trade_collars);
        packet.emit(hdr.instrument_summary);
        packet.emit(hdr.product_summary);
        packet.emit(hdr.price_update);
        packet.emit(hdr.news);
        packet.emit(hdr.real_time_index);
        packet.emit(hdr.index_summary);
        packet.emit(hdr.trading_session_status);
        packet.emit(hdr.test_event);
        packet.emit(hdr.encryption_key);
        packet.emit(hdr.login);
        packet.emit(hdr.login_response);
        packet.emit(hdr.end_of_snapshot);
    }
}

V1Switch(
    WseSnapshotbboParser(),
    WseSnapshotbboVerifyChecksum(),
    WseSnapshotbboIngress(),
    WseSnapshotbboEgress(),
    WseSnapshotbboComputeChecksum(),
    WseSnapshotbboDeparser()
) main;
