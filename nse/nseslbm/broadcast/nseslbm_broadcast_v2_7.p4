// P4_16 (v1model) definition for: Nse NseSlbm Broadcast NnfBcast v2.7
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: 
//   Encoding: Non-Neat Front End Broadcast
//   Version: 2.7
//   Date: 11/10/2024
//   Specification: Proto_SLBM_NNF_PROTOCOL_2.7.pdf
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

header general_message_broadcast_message_t {
    bit<16> branch_number;
    bit<40> broker_number;
    bit<24> action_code;
    bit<32> reserved_4;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header change_in_system_status_parameters_message_t {
    bit<16> normal;
    bit<16> oddlot;
    bit<16> spot;
    bit<16> auction;
    bit<32> market_index;
    bit<16> default_settlement_period_normal;
    bit<16> default_settlement_period_spot;
    bit<16> default_settlement_period_auction;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> warning_percent;
    bit<16> volume_freeze_percent;
    bit<16> reserved_2;
    bit<16> terminal_idle_time;
    bit<32> board_lot_quantity;
    bit<32> tick_size;
    bit<16> maximum_gtc_days;
    bit<1> aon;
    bit<1> minimum_fill;
    bit<1> books_merged;
    bit<13> reserved_113;
    bit<16> disclosed_quantity_percent_allowed;
    bit<32> reserved_4;
}

header change_in_security_master_message_t {
    bit<32> token;
    bit<80> symbol;
    bit<16> series;
    bit<16> instrument_type;
    bit<16> permitted_to_trade;
    bit<64> issued_capital;
    bit<16> warning_percent;
    bit<16> freeze_percent;
    bit<136> credit_rating;
}

header change_in_security_master_message_security_eligibility_per_market_t {
    bit<1> eligibility;
    bit<7> reserved_17;
    bit<16> status;
}

header change_participant_status_message_t {
    bit<96> participant_id;
    bit<200> participant_name;
    bit<8> participant_status;
    bit<32> participant_update_date_time;
    bit<8> delete_flag;
}

header change_of_security_status_message_t {
    bit<16> number_of_records;
}

header change_of_security_status_message_token_and_eligibility_t {
    bit<32> token;
}

header change_of_security_status_preopen_message_t {
    bit<16> number_of_records;
}

header change_of_security_status_preopen_message_token_and_eligibility_t {
    bit<32> token;
}

header turnover_limit_exceeded_message_t {
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

header auction_activity_message_t {
    bit<32> token;
    bit<16> auction_number;
    bit<16> auction_status;
    bit<16> initiator_type;
    bit<32> total_buy_qty;
    bit<32> best_buy_price;
    bit<32> total_sell_qty;
    bit<32> best_sell_price;
    bit<32> auction_price;
    bit<32> auction_qty;
    bit<16> settlement_period;
}

header change_of_auction_status_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<8> auction_status_char;
    bit<24> action_code;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header market_open_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header market_close_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header preopen_shutdown_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header normal_market_preopen_ended_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> market_type;
    bit<1> trader_ws;
    bit<15> reserved_115;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header ticker_and_market_index_message_t {
    bit<16> number_of_records;
}

header ticker_and_market_index_message_ticker_index_information_t {
    bit<32> token;
    bit<16> market_type;
    bit<32> fill_price;
    bit<32> fill_volume;
    bit<32> market_index_value;
}

header market_by_order_market_by_price_update_message_t {
    bit<32> token;
    bit<16> book_type;
    bit<16> trading_status;
    bit<32> volume_traded_today;
    bit<32> last_traded_price;
    bit<8> net_change_indicator;
    bit<8> reserved_1;
    bit<32> net_price_change_from_closing_price;
    bit<32> last_trade_quantity;
    bit<32> last_trade_time;
    bit<32> average_trade_price;
    bit<16> auction_number;
    bit<16> auction_status;
    bit<16> initiator_type;
    bit<32> initiator_price;
    bit<32> initiator_quantity;
    bit<32> auction_price;
    bit<32> auction_quantity;
}

header market_by_order_market_by_price_update_message_mbo_information_t {
    bit<32> trader_id;
    bit<32> qty;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<14> reserved_114;
    bit<32> min_fill_qty;
}

header market_by_order_market_by_price_update_message_mbp_information_t {
    bit<32> quantity;
    bit<32> price;
    bit<16> number_of_orders;
    bit<16> bb_buy_sell_flag;
}

header only_market_by_price_update_message_t {
    bit<16> no_of_records;
}

header only_market_by_price_update_message_interactive_only_mbp_data_t {
    bit<32> token;
    bit<16> book_type;
    bit<16> trading_status;
    bit<32> volume_traded_today;
    bit<32> last_traded_price;
    bit<8> net_change_indicator;
    bit<32> net_price_change_from_closing_price;
    bit<32> last_trade_quantity;
    bit<32> last_trade_time;
    bit<32> average_trade_price;
    bit<16> auction_number;
    bit<16> auction_status;
    bit<16> initiator_type;
    bit<32> initiator_price;
    bit<32> initiator_quantity;
    bit<32> auction_price;
    bit<32> auction_quantity;
}

header market_watch_update_message_t {
    bit<16> no_of_records;
}

header market_watch_update_message_marketwatchbroadcast_t {
    bit<32> token;
}

header security_open_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> token;
    bit<32> opening_price;
}

header multiple_index_broadcast_message_t {
    bit<16> number_of_records;
}

header multiple_index_broadcast_message_indices_t {
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
    bit<8> filler;
}

header broadcast_industry_index_message_t {
    bit<16> number_of_records;
}

header broadcast_industry_index_message_industry_indices_t {
    bit<168> index_name;
    bit<32> index_value;
}

header broadcast_buy_back_information_message_t {
    bit<16> number_of_records;
}

header broadcast_buy_back_information_message_buybackdata_t {
    bit<32> token;
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

header market_statistics_report_message_t {
    bit<8> message_type;
}

header report_header_body_t {
    bit<8> reserved_1;
    bit<32> report_date;
    bit<16> user_type;
    bit<40> broker_id;
    bit<200> broker_name;
    bit<32> trader_number;
    bit<208> trader_name;
}

header report_statistics_body_t {
    bit<8> reserved_1;
    bit<16> number_of_records;
}

header report_statistics_body_market_statistics_data_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> reverse_leg_settl_date;
    bit<16> market_type;
    bit<32> open_price;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> closing_price;
    bit<32> total_quantity_traded;
    bit<64> total_value_traded;
    bit<32> previous_close_price;
    bit<32> life_time_high;
    bit<32> l_ife_time_low;
    bit<32> corporate_action_indicator;
}

header report_trailer_body_t {
    bit<32> number_of_records_long;
    bit<8> reserved_1;
}

header contingency_broadcast_message_t {
    bit<16> stream_number;
    bit<16> outage_status;
    bit<1600> reserved_200;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> change_in_security_master_message_security_eligibility_per_market_remaining;
    bit<16> change_of_security_status_message_token_and_eligibility_remaining;
    bit<16> change_of_security_status_preopen_message_token_and_eligibility_remaining;
    bit<16> ticker_and_market_index_message_ticker_index_information_remaining;
    bit<16> market_by_order_market_by_price_update_message_mbo_information_remaining;
    bit<16> market_by_order_market_by_price_update_message_mbp_information_remaining;
    bit<16> only_market_by_price_update_message_interactive_only_mbp_data_remaining;
    bit<16> market_watch_update_message_marketwatchbroadcast_remaining;
    bit<16> multiple_index_broadcast_message_indices_remaining;
    bit<16> broadcast_industry_index_message_industry_indices_remaining;
    bit<16> broadcast_buy_back_information_message_buybackdata_remaining;
    bit<16> report_statistics_body_market_statistics_data_remaining;
}

struct headers_t {
    bcast_header_t bcast_header;
    bcast_header_packed_packet_t bcast_header_packed_packet[MAX_MESSAGES];
    general_message_broadcast_message_t general_message_broadcast_message[MAX_MESSAGES];
    change_in_system_status_parameters_message_t change_in_system_status_parameters_message[MAX_MESSAGES];
    change_in_security_master_message_t change_in_security_master_message[MAX_MESSAGES];
    change_in_security_master_message_security_eligibility_per_market_t change_in_security_master_message_security_eligibility_per_market[MAX_MESSAGES];
    change_participant_status_message_t change_participant_status_message[MAX_MESSAGES];
    change_of_security_status_message_t change_of_security_status_message[MAX_MESSAGES];
    change_of_security_status_message_token_and_eligibility_t change_of_security_status_message_token_and_eligibility[MAX_MESSAGES];
    change_of_security_status_preopen_message_t change_of_security_status_preopen_message[MAX_MESSAGES];
    change_of_security_status_preopen_message_token_and_eligibility_t change_of_security_status_preopen_message_token_and_eligibility[MAX_MESSAGES];
    turnover_limit_exceeded_message_t turnover_limit_exceeded_message[MAX_MESSAGES];
    broker_reactivated_message_t broker_reactivated_message[MAX_MESSAGES];
    auction_activity_message_t auction_activity_message[MAX_MESSAGES];
    change_of_auction_status_message_t change_of_auction_status_message[MAX_MESSAGES];
    market_open_message_t market_open_message[MAX_MESSAGES];
    market_close_message_t market_close_message[MAX_MESSAGES];
    preopen_shutdown_message_t preopen_shutdown_message[MAX_MESSAGES];
    normal_market_preopen_ended_message_t normal_market_preopen_ended_message[MAX_MESSAGES];
    ticker_and_market_index_message_t ticker_and_market_index_message[MAX_MESSAGES];
    ticker_and_market_index_message_ticker_index_information_t ticker_and_market_index_message_ticker_index_information[MAX_MESSAGES];
    market_by_order_market_by_price_update_message_t market_by_order_market_by_price_update_message[MAX_MESSAGES];
    market_by_order_market_by_price_update_message_mbo_information_t market_by_order_market_by_price_update_message_mbo_information[MAX_MESSAGES];
    market_by_order_market_by_price_update_message_mbp_information_t market_by_order_market_by_price_update_message_mbp_information[MAX_MESSAGES];
    only_market_by_price_update_message_t only_market_by_price_update_message[MAX_MESSAGES];
    only_market_by_price_update_message_interactive_only_mbp_data_t only_market_by_price_update_message_interactive_only_mbp_data[MAX_MESSAGES];
    market_watch_update_message_t market_watch_update_message[MAX_MESSAGES];
    market_watch_update_message_marketwatchbroadcast_t market_watch_update_message_marketwatchbroadcast[MAX_MESSAGES];
    security_open_message_t security_open_message[MAX_MESSAGES];
    multiple_index_broadcast_message_t multiple_index_broadcast_message[MAX_MESSAGES];
    multiple_index_broadcast_message_indices_t multiple_index_broadcast_message_indices[MAX_MESSAGES];
    broadcast_industry_index_message_t broadcast_industry_index_message[MAX_MESSAGES];
    broadcast_industry_index_message_industry_indices_t broadcast_industry_index_message_industry_indices[MAX_MESSAGES];
    broadcast_buy_back_information_message_t broadcast_buy_back_information_message[MAX_MESSAGES];
    broadcast_buy_back_information_message_buybackdata_t broadcast_buy_back_information_message_buybackdata[MAX_MESSAGES];
    market_statistics_report_message_t market_statistics_report_message[MAX_MESSAGES];
    report_header_body_t report_header_body[MAX_MESSAGES];
    report_statistics_body_t report_statistics_body[MAX_MESSAGES];
    report_statistics_body_market_statistics_data_t report_statistics_body_market_statistics_data[MAX_MESSAGES];
    report_trailer_body_t report_trailer_body[MAX_MESSAGES];
    contingency_broadcast_message_t contingency_broadcast_message[MAX_MESSAGES];
}

parser NseslbmBroadcastParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w6501: parse_general_message_broadcast_message;
            16w7206: parse_change_in_system_status_parameters_message;
            16w7305: parse_change_in_security_master_message;
            16w7306: parse_change_participant_status_message;
            16w7320: parse_change_of_security_status_message;
            16w7210: parse_change_of_security_status_preopen_message;
            16w9010: parse_turnover_limit_exceeded_message;
            16w9011: parse_broker_reactivated_message;
            16w6582: parse_auction_activity_message;
            16w6581: parse_change_of_auction_status_message;
            16w6511: parse_market_open_message;
            16w6521: parse_market_close_message;
            16w6531: parse_preopen_shutdown_message;
            16w6571: parse_normal_market_preopen_ended_message;
            16w7202: parse_ticker_and_market_index_message;
            16w7200: parse_market_by_order_market_by_price_update_message;
            16w7208: parse_only_market_by_price_update_message;
            16w7201: parse_market_watch_update_message;
            16w6013: parse_security_open_message;
            16w6541: parse_broadcast_circuit_check_message;
            16w7207: parse_multiple_index_broadcast_message;
            16w7203: parse_broadcast_industry_index_message;
            16w7211: parse_broadcast_buy_back_information_message;
            16w1833: parse_market_statistics_report_message;
            16w5294: parse_contingency_broadcast_message;
            default: accept;
        }
    }

    state parse_general_message_broadcast_message {
        packet.extract(hdr.general_message_broadcast_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_change_in_system_status_parameters_message {
        packet.extract(hdr.change_in_system_status_parameters_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_change_in_security_master_message {
        packet.extract(hdr.change_in_security_master_message.next);
        meta.dispatched = 1;
        meta.change_in_security_master_message_security_eligibility_per_market_remaining = 16w4;
        transition parse_change_in_security_master_message_security_eligibility_per_market;
    }

    state parse_change_in_security_master_message_security_eligibility_per_market {
        packet.extract(hdr.change_in_security_master_message_security_eligibility_per_market.next);
        meta.change_in_security_master_message_security_eligibility_per_market_remaining = meta.change_in_security_master_message_security_eligibility_per_market_remaining - 1;
        transition select(meta.change_in_security_master_message_security_eligibility_per_market_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_change_in_security_master_message_security_eligibility_per_market;
        }
    }

    state parse_change_participant_status_message {
        packet.extract(hdr.change_participant_status_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_change_of_security_status_message {
        packet.extract(hdr.change_of_security_status_message.next);
        meta.dispatched = 1;
        meta.change_of_security_status_message_token_and_eligibility_remaining = 16w35;
        transition parse_change_of_security_status_message_token_and_eligibility;
    }

    state parse_change_of_security_status_message_token_and_eligibility {
        packet.extract(hdr.change_of_security_status_message_token_and_eligibility.next);
        meta.change_of_security_status_message_token_and_eligibility_remaining = meta.change_of_security_status_message_token_and_eligibility_remaining - 1;
        transition select(meta.change_of_security_status_message_token_and_eligibility_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_change_of_security_status_message_token_and_eligibility;
        }
    }

    state parse_change_of_security_status_preopen_message {
        packet.extract(hdr.change_of_security_status_preopen_message.next);
        meta.dispatched = 1;
        meta.change_of_security_status_preopen_message_token_and_eligibility_remaining = 16w35;
        transition parse_change_of_security_status_preopen_message_token_and_eligibility;
    }

    state parse_change_of_security_status_preopen_message_token_and_eligibility {
        packet.extract(hdr.change_of_security_status_preopen_message_token_and_eligibility.next);
        meta.change_of_security_status_preopen_message_token_and_eligibility_remaining = meta.change_of_security_status_preopen_message_token_and_eligibility_remaining - 1;
        transition select(meta.change_of_security_status_preopen_message_token_and_eligibility_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_change_of_security_status_preopen_message_token_and_eligibility;
        }
    }

    state parse_turnover_limit_exceeded_message {
        packet.extract(hdr.turnover_limit_exceeded_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_broker_reactivated_message {
        packet.extract(hdr.broker_reactivated_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_auction_activity_message {
        packet.extract(hdr.auction_activity_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_change_of_auction_status_message {
        packet.extract(hdr.change_of_auction_status_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_market_open_message {
        packet.extract(hdr.market_open_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_market_close_message {
        packet.extract(hdr.market_close_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_preopen_shutdown_message {
        packet.extract(hdr.preopen_shutdown_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_normal_market_preopen_ended_message {
        packet.extract(hdr.normal_market_preopen_ended_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_ticker_and_market_index_message {
        packet.extract(hdr.ticker_and_market_index_message.next);
        meta.dispatched = 1;
        meta.ticker_and_market_index_message_ticker_index_information_remaining = 16w25;
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

    state parse_market_by_order_market_by_price_update_message {
        packet.extract(hdr.market_by_order_market_by_price_update_message.next);
        meta.dispatched = 1;
        meta.market_by_order_market_by_price_update_message_mbo_information_remaining = 16w10;
        transition parse_market_by_order_market_by_price_update_message_mbo_information;
    }

    state parse_market_by_order_market_by_price_update_message_mbo_information {
        packet.extract(hdr.market_by_order_market_by_price_update_message_mbo_information.next);
        meta.market_by_order_market_by_price_update_message_mbo_information_remaining = meta.market_by_order_market_by_price_update_message_mbo_information_remaining - 1;
        transition select(meta.market_by_order_market_by_price_update_message_mbo_information_remaining) {
            16w0: read_market_by_order_market_by_price_update_message_mbp_information;
            default: parse_market_by_order_market_by_price_update_message_mbo_information;
        }
    }

    state read_market_by_order_market_by_price_update_message_mbp_information {
        meta.market_by_order_market_by_price_update_message_mbp_information_remaining = 16w10;
        transition parse_market_by_order_market_by_price_update_message_mbp_information;
    }

    state parse_market_by_order_market_by_price_update_message_mbp_information {
        packet.extract(hdr.market_by_order_market_by_price_update_message_mbp_information.next);
        meta.market_by_order_market_by_price_update_message_mbp_information_remaining = meta.market_by_order_market_by_price_update_message_mbp_information_remaining - 1;
        transition select(meta.market_by_order_market_by_price_update_message_mbp_information_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_by_order_market_by_price_update_message_mbp_information;
        }
    }

    state parse_only_market_by_price_update_message {
        packet.extract(hdr.only_market_by_price_update_message.next);
        meta.dispatched = 1;
        meta.only_market_by_price_update_message_interactive_only_mbp_data_remaining = 16w2;
        transition parse_only_market_by_price_update_message_interactive_only_mbp_data;
    }

    state parse_only_market_by_price_update_message_interactive_only_mbp_data {
        packet.extract(hdr.only_market_by_price_update_message_interactive_only_mbp_data.next);
        meta.only_market_by_price_update_message_interactive_only_mbp_data_remaining = meta.only_market_by_price_update_message_interactive_only_mbp_data_remaining - 1;
        transition select(meta.only_market_by_price_update_message_interactive_only_mbp_data_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_only_market_by_price_update_message_interactive_only_mbp_data;
        }
    }

    state parse_market_watch_update_message {
        packet.extract(hdr.market_watch_update_message.next);
        meta.dispatched = 1;
        meta.market_watch_update_message_marketwatchbroadcast_remaining = 16w5;
        transition parse_market_watch_update_message_marketwatchbroadcast;
    }

    state parse_market_watch_update_message_marketwatchbroadcast {
        packet.extract(hdr.market_watch_update_message_marketwatchbroadcast.next);
        meta.market_watch_update_message_marketwatchbroadcast_remaining = meta.market_watch_update_message_marketwatchbroadcast_remaining - 1;
        transition select(meta.market_watch_update_message_marketwatchbroadcast_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_watch_update_message_marketwatchbroadcast;
        }
    }

    state parse_security_open_message {
        packet.extract(hdr.security_open_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_broadcast_circuit_check_message {
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_multiple_index_broadcast_message {
        packet.extract(hdr.multiple_index_broadcast_message.next);
        meta.dispatched = 1;
        meta.multiple_index_broadcast_message_indices_remaining = 16w6;
        transition parse_multiple_index_broadcast_message_indices;
    }

    state parse_multiple_index_broadcast_message_indices {
        packet.extract(hdr.multiple_index_broadcast_message_indices.next);
        meta.multiple_index_broadcast_message_indices_remaining = meta.multiple_index_broadcast_message_indices_remaining - 1;
        transition select(meta.multiple_index_broadcast_message_indices_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_multiple_index_broadcast_message_indices;
        }
    }

    state parse_broadcast_industry_index_message {
        packet.extract(hdr.broadcast_industry_index_message.next);
        meta.dispatched = 1;
        meta.broadcast_industry_index_message_industry_indices_remaining = 16w17;
        transition parse_broadcast_industry_index_message_industry_indices;
    }

    state parse_broadcast_industry_index_message_industry_indices {
        packet.extract(hdr.broadcast_industry_index_message_industry_indices.next);
        meta.broadcast_industry_index_message_industry_indices_remaining = meta.broadcast_industry_index_message_industry_indices_remaining - 1;
        transition select(meta.broadcast_industry_index_message_industry_indices_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_broadcast_industry_index_message_industry_indices;
        }
    }

    state parse_broadcast_buy_back_information_message {
        packet.extract(hdr.broadcast_buy_back_information_message.next);
        meta.dispatched = 1;
        meta.broadcast_buy_back_information_message_buybackdata_remaining = 16w6;
        transition parse_broadcast_buy_back_information_message_buybackdata;
    }

    state parse_broadcast_buy_back_information_message_buybackdata {
        packet.extract(hdr.broadcast_buy_back_information_message_buybackdata.next);
        meta.broadcast_buy_back_information_message_buybackdata_remaining = meta.broadcast_buy_back_information_message_buybackdata_remaining - 1;
        transition select(meta.broadcast_buy_back_information_message_buybackdata_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_broadcast_buy_back_information_message_buybackdata;
        }
    }

    state parse_market_statistics_report_message {
        packet.extract(hdr.market_statistics_report_message.next);
        meta.dispatched = 1;
        transition select(hdr.market_statistics_report_message.last.message_type) {
            8w0x48: parse_report_header_body;
            8w0x52: parse_report_statistics_body;
            8w0x44: parse_report_statistics_body;
            8w0x54: parse_report_trailer_body;
            default: accept;
        }
    }

    state parse_report_header_body {
        packet.extract(hdr.report_header_body.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_report_statistics_body {
        packet.extract(hdr.report_statistics_body.next);
        meta.dispatched = 1;
        meta.report_statistics_body_market_statistics_data_remaining = 16w7;
        transition parse_report_statistics_body_market_statistics_data;
    }

    state parse_report_statistics_body_market_statistics_data {
        packet.extract(hdr.report_statistics_body_market_statistics_data.next);
        meta.report_statistics_body_market_statistics_data_remaining = meta.report_statistics_body_market_statistics_data_remaining - 1;
        transition select(meta.report_statistics_body_market_statistics_data_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_report_statistics_body_market_statistics_data;
        }
    }

    state parse_report_trailer_body {
        packet.extract(hdr.report_trailer_body.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_contingency_broadcast_message {
        packet.extract(hdr.contingency_broadcast_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_bcast_header_packed_packet_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control NseslbmBroadcastVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseslbmBroadcastIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NseslbmBroadcastEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NseslbmBroadcastComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseslbmBroadcastDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.bcast_header);
        packet.emit(hdr.bcast_header_packed_packet);
        packet.emit(hdr.general_message_broadcast_message);
        packet.emit(hdr.change_in_system_status_parameters_message);
        packet.emit(hdr.change_in_security_master_message);
        packet.emit(hdr.change_in_security_master_message_security_eligibility_per_market);
        packet.emit(hdr.change_participant_status_message);
        packet.emit(hdr.change_of_security_status_message);
        packet.emit(hdr.change_of_security_status_message_token_and_eligibility);
        packet.emit(hdr.change_of_security_status_preopen_message);
        packet.emit(hdr.change_of_security_status_preopen_message_token_and_eligibility);
        packet.emit(hdr.turnover_limit_exceeded_message);
        packet.emit(hdr.broker_reactivated_message);
        packet.emit(hdr.auction_activity_message);
        packet.emit(hdr.change_of_auction_status_message);
        packet.emit(hdr.market_open_message);
        packet.emit(hdr.market_close_message);
        packet.emit(hdr.preopen_shutdown_message);
        packet.emit(hdr.normal_market_preopen_ended_message);
        packet.emit(hdr.ticker_and_market_index_message);
        packet.emit(hdr.ticker_and_market_index_message_ticker_index_information);
        packet.emit(hdr.market_by_order_market_by_price_update_message);
        packet.emit(hdr.market_by_order_market_by_price_update_message_mbo_information);
        packet.emit(hdr.market_by_order_market_by_price_update_message_mbp_information);
        packet.emit(hdr.only_market_by_price_update_message);
        packet.emit(hdr.only_market_by_price_update_message_interactive_only_mbp_data);
        packet.emit(hdr.market_watch_update_message);
        packet.emit(hdr.market_watch_update_message_marketwatchbroadcast);
        packet.emit(hdr.security_open_message);
        packet.emit(hdr.multiple_index_broadcast_message);
        packet.emit(hdr.multiple_index_broadcast_message_indices);
        packet.emit(hdr.broadcast_industry_index_message);
        packet.emit(hdr.broadcast_industry_index_message_industry_indices);
        packet.emit(hdr.broadcast_buy_back_information_message);
        packet.emit(hdr.broadcast_buy_back_information_message_buybackdata);
        packet.emit(hdr.market_statistics_report_message);
        packet.emit(hdr.report_header_body);
        packet.emit(hdr.report_statistics_body);
        packet.emit(hdr.report_statistics_body_market_statistics_data);
        packet.emit(hdr.report_trailer_body);
        packet.emit(hdr.contingency_broadcast_message);
    }
}

V1Switch(
    NseslbmBroadcastParser(),
    NseslbmBroadcastVerifyChecksum(),
    NseslbmBroadcastIngress(),
    NseslbmBroadcastEgress(),
    NseslbmBroadcastComputeChecksum(),
    NseslbmBroadcastDeparser()
) main;
