// P4_16 (v1model) definition for: Qse QseCash MarketData Xdp v2.6
// 
// Protocol:
//   Organization: Qatar Stock Exchange
//   Protocol: Qse Cash Market Data
//   Encoding: Exchange Data Publisher
//   Version: 2.6
//   Date: 03/01/2010
//   Specification: XDP for UTP Cash Version 2.6.pdf
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
    bit<16> packet_length;
    bit<16> packet_type;
    bit<32> packet_sequence_number;
    bit<32> send_time;
    bit<16> service_id;
    bit<8> delivery_flag;
    bit<8> number_msg_entries;
}

header packet_header_message_t {
    bit<16> message_size;
    bit<16> message_type;
}

header stock_state_change_message_t {
    bit<32> symbol_index;
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> filler_binary_int_2;
    bit<64> start_date_halting;
    bit<48> start_time_halting;
    bit<48> prog_opening_time;
    bit<8> order_entry_rejection;
    bit<8> instrument_state;
    bit<8> instrument_trading_status;
    bit<8> halt_reason;
    bit<8> action_affecting_state;
    bit<8> instrument_state_tcs;
    bit<8> period_side;
    bit<8> filler_binary_int_1;
}

header class_state_change_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<24> instrument_group_code;
    bit<8> instrument_group_state;
    bit<8> session_type;
    bit<8> filler_binary_int_1;
    bit<32> class_state;
}

header mail_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> e_mail_msg_number;
    bit<16> number_of_message;
    bit<16> sequence_number;
    bit<24> instrument_group_code;
    bit<8> filler_ascii_str_1;
    bit<8> priority_indicator;
    bit<8> type_of_message;
    bit<16> address_type;
    bit<640> title;
    bit<2048> text_chunk0;
    bit<2048> text_chunk1;
    bit<2048> text_chunk2;
    bit<688> text_chunk3;
    bit<16> filler_ascii_str_2;
}

header indicative_matching_price_message_t {
    bit<32> symbol_index;
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> im_price;
    bit<32> variation;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> price_scale_code;
    bit<8> variation_scale_code;
    bit<32> im_volume;
}

header collars_message_t {
    bit<32> symbol_index;
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> high_collar;
    bit<32> low_collar;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> high_scale_code;
    bit<8> low_scale_code;
    bit<8> collar_type;
    bit<24> filler_ascii_str_3;
}

header session_timetable_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<24> instrument_group_code;
    bit<8> session_type;
    bit<48> time_pre_opening_1;
    bit<48> time_opening_1;
    bit<48> time_closing_1;
    bit<48> time_pre_opening_2;
    bit<48> time_opening_2;
    bit<48> time_closing_2;
    bit<48> time_pre_opening_3;
    bit<48> time_opening_3;
    bit<48> time_closing_3;
    bit<48> eod_time;
    bit<16> filler_ascii_str_2;
}

header global_market_activity_summary_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<32> nb_trades;
    bit<32> qty_shares;
    bit<32> amount_traded;
    bit<8> price_scale_code;
    bit<24> filler_ascii_str_3;
}

header start_referential_message_t {
    bit<8> indicator;
    bit<24> filler_ascii_str_3;
}

header end_referential_message_t {
    bit<8> indicator;
    bit<24> filler_ascii_str_3;
}

header referential_message_t {
    bit<32> symbol_index;
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> last_adj_price;
    bit<32> system_id;
    bit<32> prev_volume_traded;
    bit<32> fix_price_tick;
    bit<16> source_time_micro_secs;
    bit<16> stock_exchange_code;
    bit<16> type_of_instrument;
    bit<64> event_date;
    bit<144> instrument_name;
    bit<8> period_indicator;
    bit<8> type_of_market_admission;
    bit<24> issuing_country_code;
    bit<24> trading_currency;
    bit<24> instrument_group_code;
    bit<8> instrument_category;
    bit<96> instrument_code;
    bit<64> date_of_last_trade;
    bit<96> underlying_repo_isin_code;
    bit<64> repo_expiry_date;
    bit<64> first_settlement_date;
    bit<8> type_of_derivatives;
    bit<88> bic_depositary;
    bit<32> icb;
    bit<32> mic;
    bit<96> underlying_wisin_code;
    bit<200> depositary_list;
    bit<40> main_depositary;
    bit<16> type_of_corporate_event;
    bit<40> time_lag_euronext_utc;
    bit<40> time_lag_mi_fid_reg_utc;
    bit<48> cfi;
    bit<32> quantity_notation;
    bit<16> index_set_of_var_price_tick;
    bit<16> market_feed_code;
    bit<192> mic_list;
    bit<32> industry_code;
    bit<800> industry_text;
    bit<24> financial_market_code;
    bit<56> us_indicators;
    bit<16> filler_ascii_str_2;
    bit<64> prev_day_capital_traded;
    bit<64> nom_mkt_price;
    bit<64> lot_size;
    bit<64> number_instrument_circ;
    bit<64> shares_out;
    bit<64> auth_shares;
    bit<16> heading_number;
    bit<8> section_number;
    bit<8> repo_indicator;
    bit<8> last_adj_price_scale_code;
    bit<8> type_of_unit_exp;
    bit<8> market_indicator;
    bit<8> prev_day_capital_traded_scale_code;
    bit<8> tax_code;
    bit<8> nom_mkdt_price_scale_code;
    bit<8> lot_size_scale_code;
    bit<8> fix_price_tick_scale_code;
    bit<40> mnemo;
    bit<96> trading_code;
    bit<24> filler_ascii_str_3;
    bit<32> strike_price;
    bit<24> strike_currency;
    bit<8> strike_scale_code;
    bit<32> currency_coef;
    bit<8> currency_coef_scale_code;
    bit<8> trading_currency_indicator;
    bit<8> strike_currency_indicator;
    bit<16> market_segment;
    bit<8> algo;
    bit<240> local_name;
    bit<32> small_trade;
    bit<96> filler_binary_int_12;
}

header trade_creation_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> trade_id_number;
    bit<32> quote_link_id;
    bit<32> source_seq_num;
    bit<32> price;
    bit<32> volume;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> small_trade_indicator;
    bit<8> trad_cond_2;
    bit<8> trad_cond_3;
    bit<8> trade_origin;
    bit<8> opening_trade_indicator;
    bit<8> price_scale_code;
}

header trade_cancellation_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> original_trade_id_number;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> filler_binary_int_2;
}

header trade_full_information_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> trade_id_number;
    bit<32> quote_link_id;
    bit<32> source_seq_num;
    bit<32> price;
    bit<32> volume;
    bit<32> cumulative_quantity;
    bit<32> highest_price;
    bit<32> lowest_price;
    bit<32> variation_last_price;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> filler_binary_int_2;
    bit<8> small_trade_indicator;
    bit<8> trad_cond_2;
    bit<8> trad_cond_3;
    bit<8> trade_origin;
    bit<8> tick_direction;
    bit<8> opening_trade_indicator;
    bit<8> variation_scale_code;
    bit<8> price_scale_code;
}

header price_update_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> price;
    bit<32> highest_price;
    bit<32> lowest_price;
    bit<32> variation_last_price;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> type_of_price;
    bit<16> filler_binary_int_2;
    bit<8> price_scale_code;
    bit<8> variation_scale_code;
}

header auction_summary_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> first_price;
    bit<32> last_price;
    bit<32> highest_price;
    bit<32> lowest_price;
    bit<32> cumulative_quantity;
    bit<32> variation;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> type_of_last_price;
    bit<8> tick_direction;
    bit<8> instrument_valuation_price;
    bit<8> price_scale_code;
    bit<8> variation_scale_code;
}

header vwap_closing_price_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<16> sending_indicator;
    bit<16> closing_price_rule;
    bit<32> closing_price;
    bit<32> adjusted_closing_price;
    bit<32> nb_trades;
    bit<32> qty_shares;
    bit<32> amount_traded;
    bit<32> system_id;
    bit<8> price_scale_code;
    bit<24> filler_ascii_str_3;
}

header quotes_message_t {
    bit<32> symbol_index;
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> quote_link_id;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> system_id;
    bit<16> number_ask_orders;
    bit<16> number_bid_orders;
    bit<16> source_time_micro_secs;
    bit<8> type_of_ask_price;
    bit<8> type_of_bid_price;
    bit<8> quote_condition;
    bit<8> quote_number;
    bit<8> price_scale_code;
    bit<8> filler_ascii_str_1;
}

header order_update_market_sheet_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> price;
    bit<32> aggregated_volume;
    bit<32> volume;
    bit<32> link_id;
    bit<32> order_id;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> number_orders;
    bit<8> side;
    bit<8> order_type;
    bit<8> action_type;
    bit<8> price_scale_code;
    bit<32> order_date;
    bit<32> order_priority_date;
    bit<32> order_priority_time;
    bit<16> order_priority_micro_secs;
    bit<8> order_origin;
    bit<8> filler_binary_int_1;
}

header orderbook_retransmission_delimiter_message_t {
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<16> trading_engine_id;
    bit<8> instance_id;
    bit<8> retransmission_indicator;
}

header real_time_index_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> index_level;
    bit<32> forerunner_level;
    bit<32> session_high;
    bit<32> session_low;
    bit<32> percentage_of_capitalization;
    bit<32> variation_from_previous_days_price;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> num_of_securities_quoted;
    bit<8> index_level_code;
    bit<8> type_of_level;
    bit<8> level_scale_code;
    bit<8> percentage_scale_code;
    bit<8> variation_scale_code;
    bit<8> rebroadcast_indicator;
    bit<16> filler_ascii_str_2;
}

header index_summary_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> preliminary_opening_level;
    bit<32> preliminary_opening_time;
    bit<32> first_level;
    bit<32> first_time;
    bit<32> opening_reference_level;
    bit<32> opening_reference_time;
    bit<32> closing_reference_level;
    bit<32> closing_reference_time;
    bit<32> percent_variation_prev_clos;
    bit<32> high_level;
    bit<32> high_time;
    bit<32> low_level;
    bit<32> low_time;
    bit<32> clearing_level;
    bit<32> clearing_time;
    bit<32> liquidation_level;
    bit<32> liquidation_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> type_of_level;
    bit<8> level_scale_code;
    bit<8> variation_scale_code;
    bit<24> filler_ascii_str_3;
}

header index_composition_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> instrument_weight;
    bit<32> instrument_factor;
    bit<32> previous_close;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> number_of_conponents;
    bit<96> instrument_id_of_component;
    bit<40> mnemo;
    bit<8> index_frequency;
    bit<8> price_scale_code;
    bit<8> level_scale_code;
}

header start_refresh_message_t {
    bit<32> last_seq_num;
}

header end_refresh_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    stock_state_change_message_t stock_state_change_message[MAX_MESSAGES];
    class_state_change_message_t class_state_change_message[MAX_MESSAGES];
    mail_message_t mail_message[MAX_MESSAGES];
    indicative_matching_price_message_t indicative_matching_price_message[MAX_MESSAGES];
    collars_message_t collars_message[MAX_MESSAGES];
    session_timetable_message_t session_timetable_message[MAX_MESSAGES];
    global_market_activity_summary_message_t global_market_activity_summary_message[MAX_MESSAGES];
    start_referential_message_t start_referential_message[MAX_MESSAGES];
    end_referential_message_t end_referential_message[MAX_MESSAGES];
    referential_message_t referential_message[MAX_MESSAGES];
    trade_creation_message_t trade_creation_message[MAX_MESSAGES];
    trade_cancellation_message_t trade_cancellation_message[MAX_MESSAGES];
    trade_full_information_message_t trade_full_information_message[MAX_MESSAGES];
    price_update_message_t price_update_message[MAX_MESSAGES];
    auction_summary_message_t auction_summary_message[MAX_MESSAGES];
    vwap_closing_price_message_t vwap_closing_price_message[MAX_MESSAGES];
    quotes_message_t quotes_message[MAX_MESSAGES];
    order_update_market_sheet_message_t order_update_market_sheet_message[MAX_MESSAGES];
    orderbook_retransmission_delimiter_message_t orderbook_retransmission_delimiter_message[MAX_MESSAGES];
    real_time_index_message_t real_time_index_message[MAX_MESSAGES];
    index_summary_message_t index_summary_message[MAX_MESSAGES];
    index_composition_message_t index_composition_message[MAX_MESSAGES];
    start_refresh_message_t start_refresh_message[MAX_MESSAGES];
    end_refresh_message_t end_refresh_message[MAX_MESSAGES];
}

parser QsecashMarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.number_msg_entries) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.message_type) {
            16w505: parse_stock_state_change_message;
            16w516: parse_class_state_change_message;
            16w523: parse_mail_message;
            16w530: parse_indicative_matching_price_message;
            16w537: parse_collars_message;
            16w539: parse_session_timetable_message;
            16w545: parse_global_market_activity_summary_message;
            16w550: parse_start_referential_message;
            16w551: parse_end_referential_message;
            16w555: parse_referential_message;
            16w220: parse_trade_creation_message;
            16w221: parse_trade_cancellation_message;
            16w240: parse_trade_full_information_message;
            16w241: parse_price_update_message;
            16w245: parse_auction_summary_message;
            16w247: parse_vwap_closing_price_message;
            16w140: parse_quotes_message;
            16w230: parse_order_update_market_sheet_message;
            16w231: parse_orderbook_retransmission_delimiter_message;
            16w542: parse_real_time_index_message;
            16w543: parse_index_summary_message;
            16w544: parse_index_composition_message;
            16w580: parse_start_refresh_message;
            16w581: parse_end_refresh_message;
            default: accept;
        }
    }

    state parse_stock_state_change_message {
        packet.extract(hdr.stock_state_change_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_class_state_change_message {
        packet.extract(hdr.class_state_change_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_mail_message {
        packet.extract(hdr.mail_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_indicative_matching_price_message {
        packet.extract(hdr.indicative_matching_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_collars_message {
        packet.extract(hdr.collars_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_session_timetable_message {
        packet.extract(hdr.session_timetable_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_global_market_activity_summary_message {
        packet.extract(hdr.global_market_activity_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_start_referential_message {
        packet.extract(hdr.start_referential_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_end_referential_message {
        packet.extract(hdr.end_referential_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_referential_message {
        packet.extract(hdr.referential_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_creation_message {
        packet.extract(hdr.trade_creation_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_cancellation_message {
        packet.extract(hdr.trade_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_full_information_message {
        packet.extract(hdr.trade_full_information_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_price_update_message {
        packet.extract(hdr.price_update_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_auction_summary_message {
        packet.extract(hdr.auction_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_vwap_closing_price_message {
        packet.extract(hdr.vwap_closing_price_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_quotes_message {
        packet.extract(hdr.quotes_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_update_market_sheet_message {
        packet.extract(hdr.order_update_market_sheet_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_orderbook_retransmission_delimiter_message {
        packet.extract(hdr.orderbook_retransmission_delimiter_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_real_time_index_message {
        packet.extract(hdr.real_time_index_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_index_summary_message {
        packet.extract(hdr.index_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_index_composition_message {
        packet.extract(hdr.index_composition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_start_refresh_message {
        packet.extract(hdr.start_refresh_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_end_refresh_message {
        packet.extract(hdr.end_refresh_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control QsecashMarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control QsecashMarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control QsecashMarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control QsecashMarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control QsecashMarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.stock_state_change_message);
        packet.emit(hdr.class_state_change_message);
        packet.emit(hdr.mail_message);
        packet.emit(hdr.indicative_matching_price_message);
        packet.emit(hdr.collars_message);
        packet.emit(hdr.session_timetable_message);
        packet.emit(hdr.global_market_activity_summary_message);
        packet.emit(hdr.start_referential_message);
        packet.emit(hdr.end_referential_message);
        packet.emit(hdr.referential_message);
        packet.emit(hdr.trade_creation_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.trade_full_information_message);
        packet.emit(hdr.price_update_message);
        packet.emit(hdr.auction_summary_message);
        packet.emit(hdr.vwap_closing_price_message);
        packet.emit(hdr.quotes_message);
        packet.emit(hdr.order_update_market_sheet_message);
        packet.emit(hdr.orderbook_retransmission_delimiter_message);
        packet.emit(hdr.real_time_index_message);
        packet.emit(hdr.index_summary_message);
        packet.emit(hdr.index_composition_message);
        packet.emit(hdr.start_refresh_message);
        packet.emit(hdr.end_refresh_message);
    }
}

V1Switch(
    QsecashMarketdataParser(),
    QsecashMarketdataVerifyChecksum(),
    QsecashMarketdataIngress(),
    QsecashMarketdataEgress(),
    QsecashMarketdataComputeChecksum(),
    QsecashMarketdataDeparser()
) main;
