// P4_16 (v1model) definition for: Gpw Wse PricesAndTrades Xdp v6.8
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: Warsaw Stock Exchange Prices and Trades
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

header trade_full_information_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> trade_id_number;
    bit<32> venue_of_execution;
    bit<32> source_seq_num;
    bit<32> price_notation;
    bit<32> transaction_to_be_cleared;
    bit<32> cumulative_quantity;
    bit<32> highest_price;
    bit<32> lowest_price;
    bit<32> variation_last_price;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<24> price_currency;
    bit<8> last_trade_indicator;
    bit<8> type_of_trade;
    bit<8> trade_origin;
    bit<8> tick_direction;
    bit<8> opening_trade_indicator;
    bit<8> variation_scale_code;
    bit<8> price_scale_code;
    bit<216> trading_date_time;
    bit<216> publication_date_time;
    bit<32> instrument_id_code_type;
    bit<96> instrument_id_code;
    bit<160> price_ascii_ch_20;
    bit<160> quantity;
    bit<160> notional_amount;
    bit<24> notional_currency;
    bit<8> reserved_1;
    bit<416> transaction_id_code;
    bit<8> mmt_market_mechanism;
    bit<8> mmt_trading_mode;
    bit<32> mmt_algorithmic_indicator;
    bit<32> mmt_modification_indicator;
    bit<32> mmt_negotiation_indicator;
    bit<32> mmt_special_dividend_indicator;
    bit<32> mmt_contribution_to_price;
    bit<32> mmt_benchmark_indicator;
}

header price_update_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> price_binary_int_4;
    bit<32> highest_price;
    bit<32> lowest_price;
    bit<32> variation_last_price;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<16> type_of_price;
    bit<16> reserved_2;
    bit<8> price_scale_code;
    bit<8> variation_scale_code;
}

header trade_publication_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> venue_of_execution;
    bit<32> instrument_id_code_type;
    bit<32> price_multiplier;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<216> trading_date_time;
    bit<24> price_currency;
    bit<96> instrument_id_code;
    bit<216> publication_date_time;
    bit<24> notional_currency;
    bit<128> tcs_trade_id;
    bit<32> price_notation;
    bit<8> reserved_1;
    bit<32> transaction_to_be_cleared;
    bit<32> mmt_benchmark_indicator;
    bit<32> mmt_contribution_to_price;
    bit<8> multiplier_scale_code;
    bit<160> price_ascii_ch_20;
    bit<160> quantity;
    bit<160> notional_amount;
    bit<416> transaction_id_code;
    bit<8> mmt_market_mechanism;
    bit<8> mmt_trading_mode;
    bit<32> mmt_special_dividend_indicator;
    bit<32> mmt_negotiation_indicator;
    bit<32> mmt_agency_cross_indicator;
    bit<32> mmt_transaction_category;
    bit<32> mmt_modification_indicator;
    bit<32> mmt_duplicative_indicator;
    bit<32> mmt_publication_mode;
    bit<32> mmt_algorithmic_indicator;
    bit<16> reserved_2;
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
    bit<64> amount_traded;
    bit<32> qty_shares;
    bit<32> system_id;
    bit<16> source_time_micro_secs;
    bit<8> scale_code;
    bit<40> reserved_5;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    trade_full_information_message_t trade_full_information_message[MAX_MESSAGES];
    price_update_message_t price_update_message[MAX_MESSAGES];
    trade_publication_message_t trade_publication_message[MAX_MESSAGES];
    auction_summary_message_t auction_summary_message[MAX_MESSAGES];
    vwap_closing_price_message_t vwap_closing_price_message[MAX_MESSAGES];
}

parser WsePricesandtradesParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w240: parse_trade_full_information_message;
            16w241: parse_price_update_message;
            16w243: parse_trade_publication_message;
            16w245: parse_auction_summary_message;
            16w247: parse_vwap_closing_price_message;
            default: accept;
        }
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

    state parse_trade_publication_message {
        packet.extract(hdr.trade_publication_message.next);
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

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control WsePricesandtradesVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WsePricesandtradesIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control WsePricesandtradesEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control WsePricesandtradesComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WsePricesandtradesDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.trade_full_information_message);
        packet.emit(hdr.price_update_message);
        packet.emit(hdr.trade_publication_message);
        packet.emit(hdr.auction_summary_message);
        packet.emit(hdr.vwap_closing_price_message);
    }
}

V1Switch(
    WsePricesandtradesParser(),
    WsePricesandtradesVerifyChecksum(),
    WsePricesandtradesIngress(),
    WsePricesandtradesEgress(),
    WsePricesandtradesComputeChecksum(),
    WsePricesandtradesDeparser()
) main;
