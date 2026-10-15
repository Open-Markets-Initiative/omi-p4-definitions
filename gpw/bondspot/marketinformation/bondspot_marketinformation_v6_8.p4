// P4_16 (v1model) definition for: Gpw BondSpot MarketInformation Xdp v6.8
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: BondSpot Market Information
//   Encoding: Exchange Data Publisher
//   Version: 6.8
//   Date: 02/11/2020
//   Specification: WSE_CDE_XDP_Message_Specifications_v_68.pdf
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

header class_state_change_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<24> instrument_group_code;
    bit<8> instrument_group_state;
    bit<8> session_type;
    bit<8> reserved_1;
    bit<32> class_state;
}

header mail_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> scope;
    bit<640> title;
    bit<2048> text_chunk0;
    bit<2048> text_chunk1;
    bit<2048> text_chunk2;
    bit<1856> text_chunk3;
    bit<24> reserved_3;
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
    bit<24> reserved_3;
}

header session_timetable_message_t {
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<24> instrument_group_code;
    bit<8> reserved_1;
    bit<16> class_phase_number;
}

header session_timetable_message_class_phase_t {
    bit<32> class_state_time;
    bit<32> class_state;
}

header start_referential_message_t {
    bit<8> indicator;
    bit<24> reserved_3;
}

header end_referential_message_t {
    bit<8> indicator;
    bit<24> reserved_3;
}

header referential_message_t {
    bit<32> symbol_index;
    bit<32> source_seq_num;
    bit<32> source_time;
    bit<32> last_adj_price;
    bit<32> system_id;
    bit<32> prev_volume_traded;
    bit<32> reserved_4;
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
    bit<64> expiry_date;
    bit<64> first_settlement_date;
    bit<8> type_of_derivatives;
    bit<88> bic_depositary;
    bit<32> icb;
    bit<32> mic;
    bit<96> underlying_isin_code;
    bit<200> depositary_list;
    bit<40> main_depositary;
    bit<16> type_of_corporate_event;
    bit<40> time_lag_euronext_utc;
    bit<40> time_lag_mi_fid_reg_utc;
    bit<48> cfi;
    bit<32> second_reserved_4;
    bit<16> index_set_of_var_price_tick;
    bit<16> market_feed_code;
    bit<192> mic_list;
    bit<32> industry_code;
    bit<800> industry_text;
    bit<24> financial_market_code;
    bit<56> us_indicators;
    bit<16> reserved_2;
    bit<64> prev_day_capital_traded;
    bit<64> lot_size;
    bit<64> number_instrument_circ;
    bit<64> shares_out;
    bit<64> auth_shares;
    bit<32> price_notation;
    bit<8> repo_indicator;
    bit<160> notional_amount;
    bit<24> notional_currency;
    bit<8> last_adj_price_scale_code;
    bit<8> market_indicator;
    bit<8> prev_day_capital_traded_scale_code;
    bit<8> tax_code;
    bit<8> reserved_1;
    bit<8> lot_size_scale_code;
    bit<8> second_reserved_1;
    bit<40> mnemo;
    bit<96> trading_code;
    bit<32> third_reserved_4;
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
    bit<32> block_size;
    bit<8> ss_market_maker;
    bit<8> ss_non_market_maker;
    bit<16> settlement_delay;
    bit<8> option_type;
    bit<8> delivery_type;
    bit<8> exercise_type;
    bit<8> multiplier_scale_code;
    bit<8> warrant_threshold_min_scale_code;
    bit<8> warrant_threshold_max_scale_code;
    bit<16> second_reserved_2;
    bit<32> warrant_threshold_min;
    bit<32> warrant_threshold_max;
    bit<32> min_quantity;
    bit<32> max_quantity;
    bit<32> multiplier;
    bit<32> fourth_reserved_4;
    bit<64> max_value;
}

header session_summary_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> date;
    bit<32> multiplier;
    bit<32> accumulated_interest;
    bit<32> opening_price;
    bit<32> maximum_price;
    bit<32> minimum_price;
    bit<32> closing_price;
    bit<32> implied_volatility;
    bit<32> average_weighted_price;
    bit<32> reference_price;
    bit<32> pct_change_price;
    bit<32> dividend_rate;
    bit<32> settlement_price;
    bit<32> settlement_value;
    bit<32> reserved_4;
    bit<32> open_positions;
    bit<32> trading_volume;
    bit<32> transactions_number;
    bit<64> trading_value;
    bit<32> currency_price;
    bit<32> delta;
    bit<32> gamma;
    bit<32> rho;
    bit<32> theta;
    bit<32> vega;
    bit<32> end_trading;
    bit<32> number_of_instruments;
    bit<64> trading_value_currency;
    bit<32> interest_rate;
    bit<32> volatility;
    bit<32> strike_price;
    bit<32> short_selling_trades_number;
    bit<32> volume_short_selling_trades;
    bit<32> value_short_selling_trades;
    bit<32> last_trade_date;
    bit<32> last_trade_price;
    bit<32> block_trades_number;
    bit<32> volume_block_trades;
    bit<32> value_block_trades;
    bit<32> vwap_blocktrade;
    bit<32> maximum_block_price;
    bit<32> minimum_block_price;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> multiplier_scale_code;
    bit<8> accumulated_interest_scale_code;
    bit<8> opening_price_scale_code;
    bit<8> maximum_price_scale_code;
    bit<8> minimum_price_scale_code;
    bit<8> closing_price_scale_code;
    bit<8> implied_volatility_scale_code;
    bit<8> average_weighted_price_scale_code;
    bit<8> reference_price_scale_code;
    bit<8> pct_change_price_scale_code;
    bit<8> dividend_rate_scale_code;
    bit<8> settlement_price_scale_code;
    bit<8> settlement_value_scale_code;
    bit<8> reserved_1;
    bit<8> trading_value_scale_code;
    bit<8> currency_price_scale_code;
    bit<8> delta_scale_code;
    bit<8> gamma_scale_code;
    bit<8> rho_scale_code;
    bit<8> theta_scale_code;
    bit<8> vega_scale_code;
    bit<8> trading_value_currency_scale_code;
    bit<8> interest_rate_scale_code;
    bit<8> volatility_scale_code;
    bit<8> strike_price_scale_code;
    bit<8> value_short_selling_trades_scale_code;
    bit<8> last_trade_price_scale_code;
    bit<8> value_block_trades_scale_code;
    bit<8> vwap_blocktrade_scale_code;
    bit<8> maximum_block_price_scale_code;
    bit<8> minimum_block_price_scale_code;
    bit<8> status_indicator;
    bit<24> sector;
    bit<8> market;
    bit<8> second_reserved_1;
    bit<8> short_sale;
    bit<8> marker_pct_change_price;
    bit<8> symbol_delta;
    bit<8> symbol_gamma;
    bit<8> symbol_rho;
    bit<8> symbol_theta;
    bit<8> symbol_vega;
    bit<8> third_reserved_1;
    bit<8> fourth_reserved_1;
    bit<8> fifth_reserved_1;
    bit<8> sixth_reserved_1;
    bit<8> seventh_reserved_1;
    bit<8> eighth_reserved_1;
    bit<16> segment;
    bit<8> lower_liquidity;
    bit<16> dividend;
    bit<16> subscription_right;
    bit<16> split;
    bit<16> interim_dividend_right;
    bit<16> quotation_system;
    bit<16> liquidity_support_pge;
    bit<8> ninth_reserved_1;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> session_timetable_message_class_phase_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    class_state_change_message_t class_state_change_message[MAX_MESSAGES];
    mail_message_t mail_message[MAX_MESSAGES];
    collars_message_t collars_message[MAX_MESSAGES];
    session_timetable_message_t session_timetable_message[MAX_MESSAGES];
    session_timetable_message_class_phase_t session_timetable_message_class_phase[MAX_MESSAGES];
    start_referential_message_t start_referential_message[MAX_MESSAGES];
    end_referential_message_t end_referential_message[MAX_MESSAGES];
    referential_message_t referential_message[MAX_MESSAGES];
    session_summary_message_t session_summary_message[MAX_MESSAGES];
}

parser BondspotMarketinformationParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w516: parse_class_state_change_message;
            16w523: parse_mail_message;
            16w537: parse_collars_message;
            16w539: parse_session_timetable_message;
            16w550: parse_start_referential_message;
            16w551: parse_end_referential_message;
            16w556: parse_referential_message;
            16w561: parse_session_summary_message;
            default: accept;
        }
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

    state parse_collars_message {
        packet.extract(hdr.collars_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_session_timetable_message {
        packet.extract(hdr.session_timetable_message.next);
        meta.dispatched = 1;
        meta.session_timetable_message_class_phase_remaining = 16w15;
        transition parse_session_timetable_message_class_phase;
    }

    state parse_session_timetable_message_class_phase {
        packet.extract(hdr.session_timetable_message_class_phase.next);
        meta.session_timetable_message_class_phase_remaining = meta.session_timetable_message_class_phase_remaining - 1;
        transition select(meta.session_timetable_message_class_phase_remaining) {
            16w0: parse_packet_header_message;
            default: parse_session_timetable_message_class_phase;
        }
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

    state parse_session_summary_message {
        packet.extract(hdr.session_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BondspotMarketinformationVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BondspotMarketinformationIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BondspotMarketinformationEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BondspotMarketinformationComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BondspotMarketinformationDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.class_state_change_message);
        packet.emit(hdr.mail_message);
        packet.emit(hdr.collars_message);
        packet.emit(hdr.session_timetable_message);
        packet.emit(hdr.session_timetable_message_class_phase);
        packet.emit(hdr.start_referential_message);
        packet.emit(hdr.end_referential_message);
        packet.emit(hdr.referential_message);
        packet.emit(hdr.session_summary_message);
    }
}

V1Switch(
    BondspotMarketinformationParser(),
    BondspotMarketinformationVerifyChecksum(),
    BondspotMarketinformationIngress(),
    BondspotMarketinformationEgress(),
    BondspotMarketinformationComputeChecksum(),
    BondspotMarketinformationDeparser()
) main;
