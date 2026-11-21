// P4_16 (v1model) definition for: Asx AsxSecurities Mdf Itch v1.0
// 
// Protocol:
//   Organization: Australian Securities Exchange
//   Protocol: Trade Market Data Feed
//   Encoding: Itch
//   Version: 1.0
//   Date: 3/1/2026
//   Specification: asx-trade-mdf-message-specification.pdf
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
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header seconds_message_t {
    bit<32> second;
}

header order_book_directory_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<8> partition_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> isin;
    bit<256> asset_name;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> number_of_decimals_in_price;
    bit<16> number_of_decimals_in_nominal_value;
    bit<32> round_lot_size;
    bit<64> nominal_value;
    bit<8> number_of_legs;
    bit<32> commodity_code;
    bit<64> strike_price;
    bit<32> expiration_date;
    bit<16> number_of_decimals_in_strike_price;
    bit<8> option_type;
    bit<32> market_id;
    bit<32> exchange_id;
    bit<16> number_of_decimals_in;
    bit<32> sector_code;
    bit<64> number_of_tradable_equities;
    bit<64> number_of_outstanding_equities;
    bit<32> last_traded_date;
    bit<64> contract_multiplier;
    bit<64> multiplier;
    bit<16> decimals_in_multiplier;
    bit<64> min_order_quantity;
    bit<64> max_order_quantity;
    bit<32> number_of_settlement_days;
    bit<8> primary;
    bit<8> test_order_book;
    bit<256> alias_name;
    bit<32> settlement_date;
    bit<8> tradable;
    bit<8> externally_price_sourced;
    bit<8> deliverable;
    bit<8> price_unit;
    bit<256> issuer;
    bit<8> foreign_ownership_restriction;
    bit<48> last_trading_time;
    bit<8> option_style;
    bit<64> minimum_value_for_initial_trade_report;
    bit<48> cfi_code;
    bit<256> upper_level_series;
    bit<32> upper_series_level_order_book_id;
    bit<32> instrument_type;
    bit<8> status;
}

header exchange_directory_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> exchange_id;
    bit<256> exchange_name;
}

header market_directory_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> market_id;
    bit<256> market_name;
    bit<8> market_type;
    bit<8> index_market;
}

header combination_order_book_leg_directory_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> combination_order_book_id;
    bit<32> leg_order_book_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header tick_size_table_entry_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> tick_size;
    bit<64> price_from;
    bit<64> price_to;
}

header corporate_action_entry_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> corporate_action_id;
    bit<32> order_book_id;
    bit<32> corporate_action_code;
    bit<8> corporate_action_type;
    bit<32> start_date;
    bit<32> end_date;
    bit<32> record_date;
    bit<8> corporate_action_status;
    bit<8> action_;
}

header order_book_directory_extension_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<32> accrued_interest_rounding;
    bit<8> accrued_interest_updown;
    bit<8> calculation_convention;
    bit<32> clean_price_rounding;
    bit<8> clean_price_updown;
    bit<32> coupon_frequency;
    bit<64> coupon_interest;
    bit<32> coupon_from_date;
    bit<32> issue_date;
    bit<32> maturity_date;
    bit<8> day_calculation_rule;
    bit<8> day_count_convention;
    bit<32> ex_coupon_period;
    bit<64> dividend;
    bit<8> fixed_income_type;
    bit<32> rate_determination_days;
    bit<32> yield_convention;
    bit<32> end_of_month_count_convention;
    bit<32> first_settlement_date;
    bit<32> coupon_div_date;
    bit<32> date_books_close;
    bit<32> effective_expiration_date;
    bit<32> proceed_date;
    bit<8> set_end_consideration;
    bit<8> set_start_consideration;
}

header system_event_message_t {
    bit<32> timestamp_nanoseconds;
    bit<8> event_code;
}

header order_book_state_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<160> state_name;
    bit<160> display_name;
}

header business_date_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> business_date;
}

header instrument_status_message_t {
    bit<32> timestamp_nanoseconds;
    bit<160> trading_state_name;
    bit<8> instrument_state_level;
    bit<256> name_of_the_instrument_state_level;
    bit<32> start_date;
    bit<32> start_time;
}

header equilibrium_price_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> available_bid_quantity_at_equilibrium_price;
    bit<64> available_ask_quantity_at_equilibrium_price;
    bit<64> equilibrium_price;
    bit<64> best_bid_price;
    bit<64> best_ask_price;
    bit<64> best_bid_quantity;
    bit<64> best_ask_quantity;
    bit<64> equilibrium_quantity;
}

header market_by_price_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<8> maximum_level;
    bit<8> number_of_level_items;
}

header market_by_price_message_array_of_level_items_t {
    bit<8> level_update_action;
    bit<8> side;
    bit<8> level;
    bit<64> price;
    bit<64> quantity;
    bit<8> number_of_deletes;
    bit<64> number_of_orders;
}

header trade_statistics_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> open_price;
    bit<64> high_price;
    bit<64> low_price;
    bit<64> last_price;
    bit<64> last_auction_price;
    bit<64> last_quantity;
    bit<64> turnover_quantity;
    bit<64> reported_trades_turnover_quantity;
    bit<64> turnover_value;
    bit<64> number_of_trades;
    bit<8> trend_indicator;
}

header reference_price_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<8> price_type;
    bit<64> price;
    bit<64> timestamp;
    bit<32> price_date;
}

header index_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> last_price;
    bit<64> timestamp;
    bit<32> change_previous;
    bit<32> change_yesterday;
    bit<8> trend_indicator;
    bit<32> point_of_movement;
}

header open_interest_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> open_interest;
    bit<64> transact_time;
}

header trade_ticker_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> deal_id;
    bit<8> deal_source;
    bit<64> price;
    bit<64> quantity;
    bit<64> deal_time;
    bit<8> action_;
    bit<8> aggressor;
    bit<16> trade_report_type;
    bit<8> printable;
    bit<32> as_of_date;
    bit<48> boq_list;
    bit<40> participant_id_buy;
    bit<64> order_id_buy;
    bit<40> participant_id_sell;
    bit<64> order_id_sell;
    bit<32> trade_slip_number;
    bit<32> exchange_order_type;
    bit<8> trade_condition;
}

header price_limits_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<64> upper_limit;
    bit<64> lower_limit;
    bit<8> type_;
    bit<8> category;
    bit<64> reference_price;
}

header market_announcement_message_t {
    bit<32> timestamp_nanoseconds;
    bit<32> order_book_id;
    bit<32> exchange_id;
    bit<32> market_id;
    bit<8> message_information_type;
    bit<640> message_source;
    bit<8> message_priority;
    bit<640> header_;
    bit<8> items_url;
    bit<2040> document_url;
    bit<8> number_of_message_items;
    bit<8> number_of_messages_items;
}

header market_announcement_message_array_of_message_items_t {
    bit<640> message_item;
}

header end_of_snapshot_message_t {
    bit<160> snapshot_sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> market_by_price_message_array_of_level_items_remaining;
    bit<8> market_announcement_message_array_of_message_items_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    order_book_directory_message_t order_book_directory_message[MAX_MESSAGES];
    exchange_directory_message_t exchange_directory_message[MAX_MESSAGES];
    market_directory_message_t market_directory_message[MAX_MESSAGES];
    combination_order_book_leg_directory_message_t combination_order_book_leg_directory_message[MAX_MESSAGES];
    tick_size_table_entry_message_t tick_size_table_entry_message[MAX_MESSAGES];
    corporate_action_entry_message_t corporate_action_entry_message[MAX_MESSAGES];
    order_book_directory_extension_message_t order_book_directory_extension_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    order_book_state_message_t order_book_state_message[MAX_MESSAGES];
    business_date_message_t business_date_message[MAX_MESSAGES];
    instrument_status_message_t instrument_status_message[MAX_MESSAGES];
    equilibrium_price_message_t equilibrium_price_message[MAX_MESSAGES];
    market_by_price_message_t market_by_price_message[MAX_MESSAGES];
    market_by_price_message_array_of_level_items_t market_by_price_message_array_of_level_items[MAX_MESSAGES];
    trade_statistics_message_t trade_statistics_message[MAX_MESSAGES];
    reference_price_message_t reference_price_message[MAX_MESSAGES];
    index_message_t index_message[MAX_MESSAGES];
    open_interest_message_t open_interest_message[MAX_MESSAGES];
    trade_ticker_message_t trade_ticker_message[MAX_MESSAGES];
    price_limits_message_t price_limits_message[MAX_MESSAGES];
    market_announcement_message_t market_announcement_message[MAX_MESSAGES];
    market_announcement_message_array_of_message_items_t market_announcement_message_array_of_message_items[MAX_MESSAGES];
    end_of_snapshot_message_t end_of_snapshot_message[MAX_MESSAGES];
}

parser AsxsecuritiesMdfParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            16w65535: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_seconds_message;
            8w0x52: parse_order_book_directory_message;
            8w0x65: parse_exchange_directory_message;
            8w0x6d: parse_market_directory_message;
            8w0x4d: parse_combination_order_book_leg_directory_message;
            8w0x4c: parse_tick_size_table_entry_message;
            8w0x43: parse_corporate_action_entry_message;
            8w0x66: parse_order_book_directory_extension_message;
            8w0x53: parse_system_event_message;
            8w0x4f: parse_order_book_state_message;
            8w0x42: parse_business_date_message;
            8w0x67: parse_end_of_recovery_message;
            8w0x74: parse_instrument_status_message;
            8w0x5a: parse_equilibrium_price_message;
            8w0x62: parse_market_by_price_message;
            8w0x49: parse_trade_statistics_message;
            8w0x51: parse_reference_price_message;
            8w0x4a: parse_index_message;
            8w0x68: parse_open_interest_message;
            8w0x69: parse_trade_ticker_message;
            8w0x6b: parse_price_limits_message;
            8w0x4e: parse_market_announcement_message;
            8w0x47: parse_end_of_snapshot_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_directory_message {
        packet.extract(hdr.order_book_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_exchange_directory_message {
        packet.extract(hdr.exchange_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_market_directory_message {
        packet.extract(hdr.market_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_combination_order_book_leg_directory_message {
        packet.extract(hdr.combination_order_book_leg_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_tick_size_table_entry_message {
        packet.extract(hdr.tick_size_table_entry_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_corporate_action_entry_message {
        packet.extract(hdr.corporate_action_entry_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_directory_extension_message {
        packet.extract(hdr.order_book_directory_extension_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_business_date_message {
        packet.extract(hdr.business_date_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_end_of_recovery_message {
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_instrument_status_message {
        packet.extract(hdr.instrument_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_equilibrium_price_message {
        packet.extract(hdr.equilibrium_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_market_by_price_message {
        packet.extract(hdr.market_by_price_message.next);
        meta.dispatched = 1;
        meta.market_by_price_message_array_of_level_items_remaining = hdr.market_by_price_message.last.number_of_level_items;
        transition select(meta.market_by_price_message_array_of_level_items_remaining) {
            8w0: parse_message;
            default: parse_market_by_price_message_array_of_level_items;
        }
    }

    state parse_market_by_price_message_array_of_level_items {
        packet.extract(hdr.market_by_price_message_array_of_level_items.next);
        meta.market_by_price_message_array_of_level_items_remaining = meta.market_by_price_message_array_of_level_items_remaining - 1;
        transition select(meta.market_by_price_message_array_of_level_items_remaining) {
            8w0: parse_message;
            default: parse_market_by_price_message_array_of_level_items;
        }
    }

    state parse_trade_statistics_message {
        packet.extract(hdr.trade_statistics_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_reference_price_message {
        packet.extract(hdr.reference_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_index_message {
        packet.extract(hdr.index_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_ticker_message {
        packet.extract(hdr.trade_ticker_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_price_limits_message {
        packet.extract(hdr.price_limits_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_market_announcement_message {
        packet.extract(hdr.market_announcement_message.next);
        meta.dispatched = 1;
        meta.market_announcement_message_array_of_message_items_remaining = hdr.market_announcement_message.last.number_of_message_items;
        transition select(meta.market_announcement_message_array_of_message_items_remaining) {
            8w0: parse_message;
            default: parse_market_announcement_message_array_of_message_items;
        }
    }

    state parse_market_announcement_message_array_of_message_items {
        packet.extract(hdr.market_announcement_message_array_of_message_items.next);
        meta.market_announcement_message_array_of_message_items_remaining = meta.market_announcement_message_array_of_message_items_remaining - 1;
        transition select(meta.market_announcement_message_array_of_message_items_remaining) {
            8w0: parse_message;
            default: parse_market_announcement_message_array_of_message_items;
        }
    }

    state parse_end_of_snapshot_message {
        packet.extract(hdr.end_of_snapshot_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control AsxsecuritiesMdfVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxsecuritiesMdfIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AsxsecuritiesMdfEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsxsecuritiesMdfComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxsecuritiesMdfDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory_message);
        packet.emit(hdr.exchange_directory_message);
        packet.emit(hdr.market_directory_message);
        packet.emit(hdr.combination_order_book_leg_directory_message);
        packet.emit(hdr.tick_size_table_entry_message);
        packet.emit(hdr.corporate_action_entry_message);
        packet.emit(hdr.order_book_directory_extension_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.business_date_message);
        packet.emit(hdr.instrument_status_message);
        packet.emit(hdr.equilibrium_price_message);
        packet.emit(hdr.market_by_price_message);
        packet.emit(hdr.market_by_price_message_array_of_level_items);
        packet.emit(hdr.trade_statistics_message);
        packet.emit(hdr.reference_price_message);
        packet.emit(hdr.index_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.trade_ticker_message);
        packet.emit(hdr.price_limits_message);
        packet.emit(hdr.market_announcement_message);
        packet.emit(hdr.market_announcement_message_array_of_message_items);
        packet.emit(hdr.end_of_snapshot_message);
    }
}

V1Switch(
    AsxsecuritiesMdfParser(),
    AsxsecuritiesMdfVerifyChecksum(),
    AsxsecuritiesMdfIngress(),
    AsxsecuritiesMdfEgress(),
    AsxsecuritiesMdfComputeChecksum(),
    AsxsecuritiesMdfDeparser()
) main;
