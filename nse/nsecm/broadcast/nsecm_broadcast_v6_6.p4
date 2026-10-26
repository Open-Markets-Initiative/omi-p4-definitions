// P4_16 (v1model) definition for: Nse NseCm Broadcast NnfBcast v6.6
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: 
//   Encoding: Non-Neat Front End Broadcast
//   Version: 6.6
//   Date: 8/3/2026
//   Specification: TP_CM_Trimmed_NNF_PROTOCOL_6.6_20260803151116.pdf
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

header bcast_header_t {
    bit<16> net_id;
    bit<16> number_of_packets;
}

header bcast_header_packed_packet_t {
    bit<16> compression_length;
    bit<8> bcast_market_type;
    bit<56> bcast_reserved;
    bit<16> reserved_0;
    bit<16> reserved_2;
    bit<32> log_time;
    bit<16> alpha_char;
    bit<16> transaction_code;
    bit<16> error_code;
    bit<32> bc_seq_no;
    bit<8> reserved_18;
    bit<24> reserved_19;
    bit<64> time_stamp_2;
    bit<64> filler_2;
    bit<16> message_length;
}

header broadcast_journal_vct_message_t {
    bit<16> branch_number;
    bit<40> broker_number;
    bit<24> action_code_char_3;
    bit<32> reserved_4;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header security_master_change_message_t {
    bit<32> token_long_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> instrument_type;
    bit<16> permitted_to_trade;
    bit<64> issued_capital;
    bit<16> settlement_type;
    bit<16> freeze_percent;
    bit<152> credit_rating;
    bit<8> reserved_1;
}

header security_master_change_message_security_eligibility_per_market_t {
    bit<1> eligibility;
    bit<7> reserved_17;
    bit<8> reserved_1;
    bit<16> status;
}

header participant_master_change_message_t {
    bit<96> participant_id;
    bit<200> participant_name;
    bit<8> participant_status;
    bit<32> participant_update_date_time;
    bit<8> delete_flag;
    bit<8> reserved_1;
}

header security_status_change_message_t {
    bit<16> number_of_records;
}

header security_status_change_message_token_and_eligibility_t {
    bit<32> token_long_4;
}

header security_status_change_preopen_message_t {
    bit<16> number_of_records;
}

header security_status_change_preopen_message_token_and_eligibility_t {
    bit<32> token_long_4;
}

header turnover_exceeded_message_t {
    bit<40> broker_code;
    bit<40> counter_broker_code;
    bit<16> warning_type;
    bit<80> symbol;
    bit<16> series;
    bit<32> trade_number;
    bit<32> trade_price;
    bit<32> trade_volume;
    bit<8> final;
}

header broker_reactivated_message_t {
    bit<40> broker_code;
    bit<40> counter_broker_code;
    bit<16> warning_type;
    bit<80> symbol;
    bit<16> series;
    bit<32> trade_number;
    bit<32> trade_price;
    bit<32> trade_volume;
    bit<8> final;
}

header auction_inquiry_message_t {
    bit<32> token_long_4;
    bit<16> auction_number;
    bit<16> auction_status_short_2;
    bit<16> initiator_type;
    bit<32> total_buy_qty;
    bit<32> best_buy_price;
    bit<32> total_sell_qty;
    bit<32> best_sell_price;
    bit<32> auction_price;
    bit<32> auction_qty;
    bit<16> settlement_period;
}

header auction_status_change_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<8> auction_status_char_1;
    bit<24> action_code_char_3;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header preopen_shutdown_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header preopen_market_order_restricted_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header normal_market_preopen_ended_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header market_open_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header cts_close_for_cas_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header revised_price_band_completed_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header cas_start_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header market_order_restricted_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header cas_end_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header market_close_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header closing_start_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header closing_end_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1920> broadcast_message;
}

header symbol_status_change_action_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<16> reserved_2;
    bit<16> action_code_short_2;
}

header ticker_and_market_index_message_t {
    bit<16> number_of_records;
}

header ticker_and_market_index_message_ticker_index_information_t {
    bit<32> token_long_4;
    bit<16> market_type;
    bit<32> fill_price;
    bit<32> fill_volume;
    bit<32> market_index_value;
}

header market_by_order_and_market_by_price_message_t {
    bit<32> token_long_4;
    bit<16> book_type;
    bit<16> trading_status;
    bit<64> volume_traded_today;
    bit<32> last_traded_price;
    bit<8> net_change_indicator;
    bit<8> filler_1;
    bit<32> net_price_change_from_closing_price;
    bit<32> last_trade_quantity;
    bit<32> last_trade_time;
    bit<32> average_trade_price;
    bit<16> auction_number;
    bit<16> auction_status_short_2;
    bit<16> initiator_type;
    bit<32> initiator_price;
    bit<32> initiator_quantity;
    bit<32> auction_price;
    bit<32> auction_quantity;
}

header market_by_order_and_market_by_price_message_mbo_information_t {
    bit<32> trader_id;
    bit<32> qty;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<14> reserved_114;
    bit<32> min_fill_qty;
}

header market_by_order_and_market_by_price_message_mbp_information_t {
    bit<64> quantity;
    bit<32> price;
    bit<16> number_of_orders;
    bit<16> bb_buy_sell_flag;
}

header only_market_by_price_message_t {
    bit<16> no_of_records;
}

header only_market_by_price_message_interactive_only_mbp_data_t {
    bit<32> token_long_4;
    bit<16> book_type;
    bit<16> trading_status;
    bit<64> volume_traded_today;
    bit<32> last_traded_price;
    bit<8> net_change_indicator;
    bit<8> filler_1;
    bit<32> net_price_change_from_closing_price;
    bit<32> last_trade_quantity;
    bit<32> last_trade_time;
    bit<32> average_trade_price;
    bit<112> reserved_14;
    bit<64> indicative_imbalance_qty;
}

header market_watch_round_robin_message_t {
    bit<16> number_of_records;
}

header market_watch_round_robin_message_marketwatchbroadcast_t {
    bit<32> token_long_4;
}

header call_auction_market_by_price_message_t {
    bit<16> no_of_records;
}

header call_auction_market_by_price_message_interactive_call_auction_mbp_data_t {
    bit<32> token_long_4;
    bit<16> book_type;
    bit<16> trading_status;
    bit<64> volume_traded_today;
    bit<64> indicative_traded_qty;
    bit<32> last_traded_price;
    bit<8> net_change_indicator;
    bit<8> filler_1;
    bit<32> net_price_change_from_closing_price;
    bit<32> last_trade_quantity;
    bit<32> last_trade_time;
    bit<32> average_trade_price;
    bit<32> first_open_price;
}

header call_auction_market_watch_message_t {
    bit<16> no_of_records;
}

header call_auction_market_watch_message_ca_marketwatchbroadcast_t {
    bit<32> token_long_4;
    bit<16> mkt_type;
    bit<1> last_trade_more;
    bit<1> last_trade_less;
    bit<1> buy;
    bit<1> sell;
    bit<12> reserved_112;
    bit<64> buy_volume;
    bit<32> buy_price;
    bit<64> sell_volume;
    bit<32> sell_price;
    bit<32> last_trade_price;
    bit<32> last_trade_time;
}

header security_open_price_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> token_short_2;
    bit<32> opening_price;
}

header indices_message_t {
    bit<16> number_of_records;
}

header indices_message_indices_t {
    bit<168> index_name;
    bit<32> index_value;
    bit<32> high_index_value;
    bit<32> low_index_value;
    bit<32> opening_index;
    bit<32> closing_index;
    bit<32> percent_change;
    bit<32> yearly_high;
    bit<32> yearly_low;
    bit<32> no_of_upmoves;
    bit<32> no_of_downmoves;
    bit<64> market_capitalisation;
    bit<8> net_change_indicator;
    bit<8> filler_1;
}

header indicative_indices_message_t {
    bit<16> number_of_records;
}

header indicative_indices_message_indicative_indices_t {
    bit<168> index_name;
    bit<32> indicative_close_value;
    bit<32> reserved_4;
    bit<32> second_reserved_4;
    bit<32> third_reserved_4;
    bit<32> closing_index;
    bit<32> percent_change;
    bit<32> fourth_reserved_4;
    bit<32> fifth_reserved_4;
    bit<32> change;
    bit<32> sixth_reserved_4;
    bit<64> market_capitalization;
    bit<8> net_change_indicator;
    bit<8> filler_1;
}

header indices_vix_message_t {
    bit<16> number_of_records;
}

header indices_vix_message_indices_t {
    bit<168> index_name;
    bit<32> index_value;
    bit<32> high_index_value;
    bit<32> low_index_value;
    bit<32> opening_index;
    bit<32> closing_index;
    bit<32> percent_change;
    bit<32> yearly_high;
    bit<32> yearly_low;
    bit<32> no_of_upmoves;
    bit<32> no_of_downmoves;
    bit<64> market_capitalisation;
    bit<8> net_change_indicator;
    bit<8> filler_1;
}

header industry_indices_message_t {
    bit<16> number_of_records;
}

header industry_indices_message_industry_indices_t {
    bit<168> industry_name;
    bit<32> index_value;
}

header buy_back_message_t {
    bit<16> number_of_records;
}

header buy_back_message_buybackdata_t {
    bit<32> token_long_4;
    bit<80> symbol;
    bit<16> series;
    bit<64> pday_cum_vol;
    bit<32> pday_high_price;
    bit<32> pday_low_price;
    bit<32> pday_wt_avg;
    bit<64> cday_cum_vol;
    bit<32> cday_high_price;
    bit<32> cday_low_price;
    bit<32> cday_wt_avg;
    bit<32> start_date;
    bit<32> end_date;
}

header call_auction_order_cancel_update_message_t {
    bit<16> no_of_records;
}

header call_auction_order_cancel_update_message_interactive_ord_cxl_details_t {
    bit<32> token_long_4;
    bit<32> filler_4;
    bit<64> buy_ord_cxl_count;
    bit<64> buy_ord_cxl_vol;
    bit<64> sell_ord_cxl_count;
    bit<64> sell_ord_cxl_vol;
    bit<128> reserved_16;
}

header cas_reference_price_message_t {
    bit<16> number_of_records;
}

header cas_reference_price_message_token_and_refprice_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> token_long_4;
    bit<32> reference_price;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> security_master_change_message_security_eligibility_per_market_remaining;
    bit<16> security_status_change_message_token_and_eligibility_remaining;
    bit<16> security_status_change_preopen_message_token_and_eligibility_remaining;
    bit<16> ticker_and_market_index_message_ticker_index_information_remaining;
    bit<16> market_by_order_and_market_by_price_message_mbo_information_remaining;
    bit<16> market_by_order_and_market_by_price_message_mbp_information_remaining;
    bit<16> only_market_by_price_message_interactive_only_mbp_data_remaining;
    bit<16> market_watch_round_robin_message_marketwatchbroadcast_remaining;
    bit<16> call_auction_market_by_price_message_interactive_call_auction_mbp_data_remaining;
    bit<16> call_auction_market_watch_message_ca_marketwatchbroadcast_remaining;
    bit<16> indices_message_indices_remaining;
    bit<16> indicative_indices_message_indicative_indices_remaining;
    bit<16> indices_vix_message_indices_remaining;
    bit<16> industry_indices_message_industry_indices_remaining;
    bit<16> buy_back_message_buybackdata_remaining;
    bit<16> call_auction_order_cancel_update_message_interactive_ord_cxl_details_remaining;
    bit<16> cas_reference_price_message_token_and_refprice_remaining;
}

struct headers_t {
    bcast_header_t bcast_header;
    bcast_header_packed_packet_t bcast_header_packed_packet[MAX_MESSAGES];
    broadcast_journal_vct_message_t broadcast_journal_vct_message[MAX_MESSAGES];
    security_master_change_message_t security_master_change_message[MAX_MESSAGES];
    security_master_change_message_security_eligibility_per_market_t security_master_change_message_security_eligibility_per_market[MAX_MESSAGES];
    participant_master_change_message_t participant_master_change_message[MAX_MESSAGES];
    security_status_change_message_t security_status_change_message[MAX_MESSAGES];
    security_status_change_message_token_and_eligibility_t security_status_change_message_token_and_eligibility[MAX_MESSAGES];
    security_status_change_preopen_message_t security_status_change_preopen_message[MAX_MESSAGES];
    security_status_change_preopen_message_token_and_eligibility_t security_status_change_preopen_message_token_and_eligibility[MAX_MESSAGES];
    turnover_exceeded_message_t turnover_exceeded_message[MAX_MESSAGES];
    broker_reactivated_message_t broker_reactivated_message[MAX_MESSAGES];
    auction_inquiry_message_t auction_inquiry_message[MAX_MESSAGES];
    auction_status_change_message_t auction_status_change_message[MAX_MESSAGES];
    preopen_shutdown_message_t preopen_shutdown_message[MAX_MESSAGES];
    preopen_market_order_restricted_message_t preopen_market_order_restricted_message[MAX_MESSAGES];
    normal_market_preopen_ended_message_t normal_market_preopen_ended_message[MAX_MESSAGES];
    market_open_message_t market_open_message[MAX_MESSAGES];
    cts_close_for_cas_message_t cts_close_for_cas_message[MAX_MESSAGES];
    revised_price_band_completed_message_t revised_price_band_completed_message[MAX_MESSAGES];
    cas_start_message_t cas_start_message[MAX_MESSAGES];
    market_order_restricted_message_t market_order_restricted_message[MAX_MESSAGES];
    cas_end_message_t cas_end_message[MAX_MESSAGES];
    market_close_message_t market_close_message[MAX_MESSAGES];
    closing_start_message_t closing_start_message[MAX_MESSAGES];
    closing_end_message_t closing_end_message[MAX_MESSAGES];
    symbol_status_change_action_message_t symbol_status_change_action_message[MAX_MESSAGES];
    ticker_and_market_index_message_t ticker_and_market_index_message[MAX_MESSAGES];
    ticker_and_market_index_message_ticker_index_information_t ticker_and_market_index_message_ticker_index_information[MAX_MESSAGES];
    market_by_order_and_market_by_price_message_t market_by_order_and_market_by_price_message[MAX_MESSAGES];
    market_by_order_and_market_by_price_message_mbo_information_t market_by_order_and_market_by_price_message_mbo_information[MAX_MESSAGES];
    market_by_order_and_market_by_price_message_mbp_information_t market_by_order_and_market_by_price_message_mbp_information[MAX_MESSAGES];
    only_market_by_price_message_t only_market_by_price_message[MAX_MESSAGES];
    only_market_by_price_message_interactive_only_mbp_data_t only_market_by_price_message_interactive_only_mbp_data[MAX_MESSAGES];
    market_watch_round_robin_message_t market_watch_round_robin_message[MAX_MESSAGES];
    market_watch_round_robin_message_marketwatchbroadcast_t market_watch_round_robin_message_marketwatchbroadcast[MAX_MESSAGES];
    call_auction_market_by_price_message_t call_auction_market_by_price_message[MAX_MESSAGES];
    call_auction_market_by_price_message_interactive_call_auction_mbp_data_t call_auction_market_by_price_message_interactive_call_auction_mbp_data[MAX_MESSAGES];
    call_auction_market_watch_message_t call_auction_market_watch_message[MAX_MESSAGES];
    call_auction_market_watch_message_ca_marketwatchbroadcast_t call_auction_market_watch_message_ca_marketwatchbroadcast[MAX_MESSAGES];
    security_open_price_message_t security_open_price_message[MAX_MESSAGES];
    indices_message_t indices_message[MAX_MESSAGES];
    indices_message_indices_t indices_message_indices[MAX_MESSAGES];
    indicative_indices_message_t indicative_indices_message[MAX_MESSAGES];
    indicative_indices_message_indicative_indices_t indicative_indices_message_indicative_indices[MAX_MESSAGES];
    indices_vix_message_t indices_vix_message[MAX_MESSAGES];
    indices_vix_message_indices_t indices_vix_message_indices[MAX_MESSAGES];
    industry_indices_message_t industry_indices_message[MAX_MESSAGES];
    industry_indices_message_industry_indices_t industry_indices_message_industry_indices[MAX_MESSAGES];
    buy_back_message_t buy_back_message[MAX_MESSAGES];
    buy_back_message_buybackdata_t buy_back_message_buybackdata[MAX_MESSAGES];
    call_auction_order_cancel_update_message_t call_auction_order_cancel_update_message[MAX_MESSAGES];
    call_auction_order_cancel_update_message_interactive_ord_cxl_details_t call_auction_order_cancel_update_message_interactive_ord_cxl_details[MAX_MESSAGES];
    cas_reference_price_message_t cas_reference_price_message[MAX_MESSAGES];
    cas_reference_price_message_token_and_refprice_t cas_reference_price_message_token_and_refprice[MAX_MESSAGES];
}

parser NsecmBroadcastParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.bcast_header);
        transition select(hdr.bcast_header.number_of_packets) {
            16w0: parse_bcast_header_packed_packet_empty;
            default: parse_bcast_header_packed_packet;
        }
    }

    state parse_bcast_header_packed_packet {
        packet.extract(hdr.bcast_header_packed_packet.next);
        transition select(hdr.bcast_header_packed_packet.last.transaction_code) {
            16w6501: parse_broadcast_journal_vct_message;
            16w18720: parse_security_master_change_message;
            16w7306: parse_participant_master_change_message;
            16w18130: parse_security_status_change_message;
            16w18707: parse_security_status_change_preopen_message;
            16w9010: parse_turnover_exceeded_message;
            16w9011: parse_broker_reactivated_message;
            16w18700: parse_auction_inquiry_message;
            16w6581: parse_auction_status_change_message;
            16w6531: parse_preopen_shutdown_message;
            16w6664: parse_preopen_market_order_restricted_message;
            16w6571: parse_normal_market_preopen_ended_message;
            16w6511: parse_market_open_message;
            16w6651: parse_cts_close_for_cas_message;
            16w6652: parse_revised_price_band_completed_message;
            16w6653: parse_cas_start_message;
            16w6654: parse_market_order_restricted_message;
            16w6655: parse_cas_end_message;
            16w6521: parse_market_close_message;
            16w6583: parse_closing_start_message;
            16w6584: parse_closing_end_message;
            16w7764: parse_symbol_status_change_action_message;
            16w18703: parse_ticker_and_market_index_message;
            16w7200: parse_market_by_order_and_market_by_price_message;
            16w7208: parse_only_market_by_price_message;
            16w7201: parse_market_watch_round_robin_message;
            16w7214: parse_call_auction_market_by_price_message;
            16w7215: parse_call_auction_market_watch_message;
            16w6013: parse_security_open_price_message;
            16w6541: parse_circuit_check_message;
            16w7207: parse_indices_message;
            16w8207: parse_indicative_indices_message;
            16w7216: parse_indices_vix_message;
            16w7203: parse_industry_indices_message;
            16w18708: parse_buy_back_message;
            16w7210: parse_call_auction_order_cancel_update_message;
            16w7338: parse_cas_reference_price_message;
            default: accept;
        }
    }

    state parse_broadcast_journal_vct_message {
        packet.extract(hdr.broadcast_journal_vct_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_security_master_change_message {
        packet.extract(hdr.security_master_change_message.next);
        meta.dispatched = 1;
        meta.security_master_change_message_security_eligibility_per_market_remaining = 16w6;
        transition parse_security_master_change_message_security_eligibility_per_market;
    }

    state parse_security_master_change_message_security_eligibility_per_market {
        packet.extract(hdr.security_master_change_message_security_eligibility_per_market.next);
        meta.security_master_change_message_security_eligibility_per_market_remaining = meta.security_master_change_message_security_eligibility_per_market_remaining - 1;
        transition select(meta.security_master_change_message_security_eligibility_per_market_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_security_master_change_message_security_eligibility_per_market;
        }
    }

    state parse_participant_master_change_message {
        packet.extract(hdr.participant_master_change_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_security_status_change_message {
        packet.extract(hdr.security_status_change_message.next);
        meta.dispatched = 1;
        meta.security_status_change_message_token_and_eligibility_remaining = 16w25;
        transition parse_security_status_change_message_token_and_eligibility;
    }

    state parse_security_status_change_message_token_and_eligibility {
        packet.extract(hdr.security_status_change_message_token_and_eligibility.next);
        meta.security_status_change_message_token_and_eligibility_remaining = meta.security_status_change_message_token_and_eligibility_remaining - 1;
        transition select(meta.security_status_change_message_token_and_eligibility_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_security_status_change_message_token_and_eligibility;
        }
    }

    state parse_security_status_change_preopen_message {
        packet.extract(hdr.security_status_change_preopen_message.next);
        meta.dispatched = 1;
        meta.security_status_change_preopen_message_token_and_eligibility_remaining = 16w25;
        transition parse_security_status_change_preopen_message_token_and_eligibility;
    }

    state parse_security_status_change_preopen_message_token_and_eligibility {
        packet.extract(hdr.security_status_change_preopen_message_token_and_eligibility.next);
        meta.security_status_change_preopen_message_token_and_eligibility_remaining = meta.security_status_change_preopen_message_token_and_eligibility_remaining - 1;
        transition select(meta.security_status_change_preopen_message_token_and_eligibility_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_security_status_change_preopen_message_token_and_eligibility;
        }
    }

    state parse_turnover_exceeded_message {
        packet.extract(hdr.turnover_exceeded_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_broker_reactivated_message {
        packet.extract(hdr.broker_reactivated_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_auction_inquiry_message {
        packet.extract(hdr.auction_inquiry_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_auction_status_change_message {
        packet.extract(hdr.auction_status_change_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_preopen_shutdown_message {
        packet.extract(hdr.preopen_shutdown_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_preopen_market_order_restricted_message {
        packet.extract(hdr.preopen_market_order_restricted_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_normal_market_preopen_ended_message {
        packet.extract(hdr.normal_market_preopen_ended_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_market_open_message {
        packet.extract(hdr.market_open_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_cts_close_for_cas_message {
        packet.extract(hdr.cts_close_for_cas_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_revised_price_band_completed_message {
        packet.extract(hdr.revised_price_band_completed_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_cas_start_message {
        packet.extract(hdr.cas_start_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_market_order_restricted_message {
        packet.extract(hdr.market_order_restricted_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_cas_end_message {
        packet.extract(hdr.cas_end_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_market_close_message {
        packet.extract(hdr.market_close_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_closing_start_message {
        packet.extract(hdr.closing_start_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_closing_end_message {
        packet.extract(hdr.closing_end_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_symbol_status_change_action_message {
        packet.extract(hdr.symbol_status_change_action_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_ticker_and_market_index_message {
        packet.extract(hdr.ticker_and_market_index_message.next);
        meta.dispatched = 1;
        meta.ticker_and_market_index_message_ticker_index_information_remaining = 16w28;
        transition parse_ticker_and_market_index_message_ticker_index_information;
    }

    state parse_ticker_and_market_index_message_ticker_index_information {
        packet.extract(hdr.ticker_and_market_index_message_ticker_index_information.next);
        meta.ticker_and_market_index_message_ticker_index_information_remaining = meta.ticker_and_market_index_message_ticker_index_information_remaining - 1;
        transition select(meta.ticker_and_market_index_message_ticker_index_information_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_ticker_and_market_index_message_ticker_index_information;
        }
    }

    state parse_market_by_order_and_market_by_price_message {
        packet.extract(hdr.market_by_order_and_market_by_price_message.next);
        meta.dispatched = 1;
        meta.market_by_order_and_market_by_price_message_mbo_information_remaining = 16w10;
        transition parse_market_by_order_and_market_by_price_message_mbo_information;
    }

    state parse_market_by_order_and_market_by_price_message_mbo_information {
        packet.extract(hdr.market_by_order_and_market_by_price_message_mbo_information.next);
        meta.market_by_order_and_market_by_price_message_mbo_information_remaining = meta.market_by_order_and_market_by_price_message_mbo_information_remaining - 1;
        transition select(meta.market_by_order_and_market_by_price_message_mbo_information_remaining) {
            16w0: read_market_by_order_and_market_by_price_message_mbp_information;
            default: parse_market_by_order_and_market_by_price_message_mbo_information;
        }
    }

    state read_market_by_order_and_market_by_price_message_mbp_information {
        meta.market_by_order_and_market_by_price_message_mbp_information_remaining = 16w10;
        transition parse_market_by_order_and_market_by_price_message_mbp_information;
    }

    state parse_market_by_order_and_market_by_price_message_mbp_information {
        packet.extract(hdr.market_by_order_and_market_by_price_message_mbp_information.next);
        meta.market_by_order_and_market_by_price_message_mbp_information_remaining = meta.market_by_order_and_market_by_price_message_mbp_information_remaining - 1;
        transition select(meta.market_by_order_and_market_by_price_message_mbp_information_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_by_order_and_market_by_price_message_mbp_information;
        }
    }

    state parse_only_market_by_price_message {
        packet.extract(hdr.only_market_by_price_message.next);
        meta.dispatched = 1;
        meta.only_market_by_price_message_interactive_only_mbp_data_remaining = 16w2;
        transition parse_only_market_by_price_message_interactive_only_mbp_data;
    }

    state parse_only_market_by_price_message_interactive_only_mbp_data {
        packet.extract(hdr.only_market_by_price_message_interactive_only_mbp_data.next);
        meta.only_market_by_price_message_interactive_only_mbp_data_remaining = meta.only_market_by_price_message_interactive_only_mbp_data_remaining - 1;
        transition select(meta.only_market_by_price_message_interactive_only_mbp_data_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_only_market_by_price_message_interactive_only_mbp_data;
        }
    }

    state parse_market_watch_round_robin_message {
        packet.extract(hdr.market_watch_round_robin_message.next);
        meta.dispatched = 1;
        meta.market_watch_round_robin_message_marketwatchbroadcast_remaining = 16w4;
        transition parse_market_watch_round_robin_message_marketwatchbroadcast;
    }

    state parse_market_watch_round_robin_message_marketwatchbroadcast {
        packet.extract(hdr.market_watch_round_robin_message_marketwatchbroadcast.next);
        meta.market_watch_round_robin_message_marketwatchbroadcast_remaining = meta.market_watch_round_robin_message_marketwatchbroadcast_remaining - 1;
        transition select(meta.market_watch_round_robin_message_marketwatchbroadcast_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_watch_round_robin_message_marketwatchbroadcast;
        }
    }

    state parse_call_auction_market_by_price_message {
        packet.extract(hdr.call_auction_market_by_price_message.next);
        meta.dispatched = 1;
        meta.call_auction_market_by_price_message_interactive_call_auction_mbp_data_remaining = 16w2;
        transition parse_call_auction_market_by_price_message_interactive_call_auction_mbp_data;
    }

    state parse_call_auction_market_by_price_message_interactive_call_auction_mbp_data {
        packet.extract(hdr.call_auction_market_by_price_message_interactive_call_auction_mbp_data.next);
        meta.call_auction_market_by_price_message_interactive_call_auction_mbp_data_remaining = meta.call_auction_market_by_price_message_interactive_call_auction_mbp_data_remaining - 1;
        transition select(meta.call_auction_market_by_price_message_interactive_call_auction_mbp_data_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_call_auction_market_by_price_message_interactive_call_auction_mbp_data;
        }
    }

    state parse_call_auction_market_watch_message {
        packet.extract(hdr.call_auction_market_watch_message.next);
        meta.dispatched = 1;
        meta.call_auction_market_watch_message_ca_marketwatchbroadcast_remaining = 16w11;
        transition parse_call_auction_market_watch_message_ca_marketwatchbroadcast;
    }

    state parse_call_auction_market_watch_message_ca_marketwatchbroadcast {
        packet.extract(hdr.call_auction_market_watch_message_ca_marketwatchbroadcast.next);
        meta.call_auction_market_watch_message_ca_marketwatchbroadcast_remaining = meta.call_auction_market_watch_message_ca_marketwatchbroadcast_remaining - 1;
        transition select(meta.call_auction_market_watch_message_ca_marketwatchbroadcast_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_call_auction_market_watch_message_ca_marketwatchbroadcast;
        }
    }

    state parse_security_open_price_message {
        packet.extract(hdr.security_open_price_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_circuit_check_message {
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_indices_message {
        packet.extract(hdr.indices_message.next);
        meta.dispatched = 1;
        meta.indices_message_indices_remaining = 16w6;
        transition parse_indices_message_indices;
    }

    state parse_indices_message_indices {
        packet.extract(hdr.indices_message_indices.next);
        meta.indices_message_indices_remaining = meta.indices_message_indices_remaining - 1;
        transition select(meta.indices_message_indices_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_indices_message_indices;
        }
    }

    state parse_indicative_indices_message {
        packet.extract(hdr.indicative_indices_message.next);
        meta.dispatched = 1;
        meta.indicative_indices_message_indicative_indices_remaining = 16w6;
        transition parse_indicative_indices_message_indicative_indices;
    }

    state parse_indicative_indices_message_indicative_indices {
        packet.extract(hdr.indicative_indices_message_indicative_indices.next);
        meta.indicative_indices_message_indicative_indices_remaining = meta.indicative_indices_message_indicative_indices_remaining - 1;
        transition select(meta.indicative_indices_message_indicative_indices_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_indicative_indices_message_indicative_indices;
        }
    }

    state parse_indices_vix_message {
        packet.extract(hdr.indices_vix_message.next);
        meta.dispatched = 1;
        meta.indices_vix_message_indices_remaining = 16w6;
        transition parse_indices_vix_message_indices;
    }

    state parse_indices_vix_message_indices {
        packet.extract(hdr.indices_vix_message_indices.next);
        meta.indices_vix_message_indices_remaining = meta.indices_vix_message_indices_remaining - 1;
        transition select(meta.indices_vix_message_indices_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_indices_vix_message_indices;
        }
    }

    state parse_industry_indices_message {
        packet.extract(hdr.industry_indices_message.next);
        meta.dispatched = 1;
        meta.industry_indices_message_industry_indices_remaining = 16w17;
        transition parse_industry_indices_message_industry_indices;
    }

    state parse_industry_indices_message_industry_indices {
        packet.extract(hdr.industry_indices_message_industry_indices.next);
        meta.industry_indices_message_industry_indices_remaining = meta.industry_indices_message_industry_indices_remaining - 1;
        transition select(meta.industry_indices_message_industry_indices_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_industry_indices_message_industry_indices;
        }
    }

    state parse_buy_back_message {
        packet.extract(hdr.buy_back_message.next);
        meta.dispatched = 1;
        meta.buy_back_message_buybackdata_remaining = 16w6;
        transition parse_buy_back_message_buybackdata;
    }

    state parse_buy_back_message_buybackdata {
        packet.extract(hdr.buy_back_message_buybackdata.next);
        meta.buy_back_message_buybackdata_remaining = meta.buy_back_message_buybackdata_remaining - 1;
        transition select(meta.buy_back_message_buybackdata_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_buy_back_message_buybackdata;
        }
    }

    state parse_call_auction_order_cancel_update_message {
        packet.extract(hdr.call_auction_order_cancel_update_message.next);
        meta.dispatched = 1;
        meta.call_auction_order_cancel_update_message_interactive_ord_cxl_details_remaining = 16w8;
        transition parse_call_auction_order_cancel_update_message_interactive_ord_cxl_details;
    }

    state parse_call_auction_order_cancel_update_message_interactive_ord_cxl_details {
        packet.extract(hdr.call_auction_order_cancel_update_message_interactive_ord_cxl_details.next);
        meta.call_auction_order_cancel_update_message_interactive_ord_cxl_details_remaining = meta.call_auction_order_cancel_update_message_interactive_ord_cxl_details_remaining - 1;
        transition select(meta.call_auction_order_cancel_update_message_interactive_ord_cxl_details_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_call_auction_order_cancel_update_message_interactive_ord_cxl_details;
        }
    }

    state parse_cas_reference_price_message {
        packet.extract(hdr.cas_reference_price_message.next);
        meta.dispatched = 1;
        meta.cas_reference_price_message_token_and_refprice_remaining = 16w20;
        transition parse_cas_reference_price_message_token_and_refprice;
    }

    state parse_cas_reference_price_message_token_and_refprice {
        packet.extract(hdr.cas_reference_price_message_token_and_refprice.next);
        meta.cas_reference_price_message_token_and_refprice_remaining = meta.cas_reference_price_message_token_and_refprice_remaining - 1;
        transition select(meta.cas_reference_price_message_token_and_refprice_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_cas_reference_price_message_token_and_refprice;
        }
    }

    state parse_bcast_header_packed_packet_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmBroadcastVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmBroadcastIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmBroadcastEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmBroadcastComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmBroadcastDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.bcast_header);
        packet.emit(hdr.bcast_header_packed_packet);
        packet.emit(hdr.broadcast_journal_vct_message);
        packet.emit(hdr.security_master_change_message);
        packet.emit(hdr.security_master_change_message_security_eligibility_per_market);
        packet.emit(hdr.participant_master_change_message);
        packet.emit(hdr.security_status_change_message);
        packet.emit(hdr.security_status_change_message_token_and_eligibility);
        packet.emit(hdr.security_status_change_preopen_message);
        packet.emit(hdr.security_status_change_preopen_message_token_and_eligibility);
        packet.emit(hdr.turnover_exceeded_message);
        packet.emit(hdr.broker_reactivated_message);
        packet.emit(hdr.auction_inquiry_message);
        packet.emit(hdr.auction_status_change_message);
        packet.emit(hdr.preopen_shutdown_message);
        packet.emit(hdr.preopen_market_order_restricted_message);
        packet.emit(hdr.normal_market_preopen_ended_message);
        packet.emit(hdr.market_open_message);
        packet.emit(hdr.cts_close_for_cas_message);
        packet.emit(hdr.revised_price_band_completed_message);
        packet.emit(hdr.cas_start_message);
        packet.emit(hdr.market_order_restricted_message);
        packet.emit(hdr.cas_end_message);
        packet.emit(hdr.market_close_message);
        packet.emit(hdr.closing_start_message);
        packet.emit(hdr.closing_end_message);
        packet.emit(hdr.symbol_status_change_action_message);
        packet.emit(hdr.ticker_and_market_index_message);
        packet.emit(hdr.ticker_and_market_index_message_ticker_index_information);
        packet.emit(hdr.market_by_order_and_market_by_price_message);
        packet.emit(hdr.market_by_order_and_market_by_price_message_mbo_information);
        packet.emit(hdr.market_by_order_and_market_by_price_message_mbp_information);
        packet.emit(hdr.only_market_by_price_message);
        packet.emit(hdr.only_market_by_price_message_interactive_only_mbp_data);
        packet.emit(hdr.market_watch_round_robin_message);
        packet.emit(hdr.market_watch_round_robin_message_marketwatchbroadcast);
        packet.emit(hdr.call_auction_market_by_price_message);
        packet.emit(hdr.call_auction_market_by_price_message_interactive_call_auction_mbp_data);
        packet.emit(hdr.call_auction_market_watch_message);
        packet.emit(hdr.call_auction_market_watch_message_ca_marketwatchbroadcast);
        packet.emit(hdr.security_open_price_message);
        packet.emit(hdr.indices_message);
        packet.emit(hdr.indices_message_indices);
        packet.emit(hdr.indicative_indices_message);
        packet.emit(hdr.indicative_indices_message_indicative_indices);
        packet.emit(hdr.indices_vix_message);
        packet.emit(hdr.indices_vix_message_indices);
        packet.emit(hdr.industry_indices_message);
        packet.emit(hdr.industry_indices_message_industry_indices);
        packet.emit(hdr.buy_back_message);
        packet.emit(hdr.buy_back_message_buybackdata);
        packet.emit(hdr.call_auction_order_cancel_update_message);
        packet.emit(hdr.call_auction_order_cancel_update_message_interactive_ord_cxl_details);
        packet.emit(hdr.cas_reference_price_message);
        packet.emit(hdr.cas_reference_price_message_token_and_refprice);
    }
}

V1Switch(
    NsecmBroadcastParser(),
    NsecmBroadcastVerifyChecksum(),
    NsecmBroadcastIngress(),
    NsecmBroadcastEgress(),
    NsecmBroadcastComputeChecksum(),
    NsecmBroadcastDeparser()
) main;
