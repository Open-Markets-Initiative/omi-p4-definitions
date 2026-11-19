// P4_16 (v1model) definition for: Nse NseIx Broadcast NnfBcast v1.12
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: 
//   Encoding: Non-Neat Front End Broadcast
//   Version: 1.12
//   Date: 10/1/2025
//   Specification: NSEIFSC_Trimmed_NNF_PROTOCOL_20260925143827.pdf
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

header broadcast_journal_vct_message_t {
    bit<16> branch_number;
    bit<40> broker_number;
    bit<24> action_code;
    bit<1> trader_workstation;
    bit<1> control_workstation;
    bit<1> tandem;
    bit<1> journaling_required;
    bit<12> reserved_112;
    bit<208> reserved_26;
    bit<16> broadcast_message_length;
    bit<1912> broadcast_message;
}

header security_master_change_message_t {
    bit<32> token;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<16> series;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<16> permitted_to_trade;
    bit<64> issued_capital;
    bit<32> warning_quantity;
    bit<32> freeze_quantity;
    bit<96> credit_rating;
}

header security_master_change_message_st_sec_eligibility_per_market_t {
    bit<1> eligibility;
    bit<7> reserved_17;
    bit<8> reserved_1;
    bit<16> status;
}

header instrument_master_change_message_t {
    bit<16> instrument_id;
    bit<48> instrument_name;
    bit<208> instrument_description;
    bit<32> instrument_update_date_time;
    bit<8> delete_flag;
}

header participant_master_change_message_t {
    bit<96> participant_id;
    bit<200> participant_name;
    bit<8> participant_status;
    bit<32> participant_update_date_time;
    bit<8> delete_flag;
}

header security_status_change_message_t {
    bit<16> number_of_records;
}

header security_status_change_message_token_and_eligibility_t {
    bit<32> token;
}

header turnover_exceeded_message_t {
    bit<40> broker_code;
    bit<40> counter_broker_code;
    bit<16> warning_type;
    bit<32> token;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<32> trade_number;
    bit<32> trade_price;
    bit<32> trade_volume;
    bit<8> final;
    bit<8> c_filler;
}

header market_status_message_t {
    bit<32> token;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<16> series;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<16> market_type;
    bit<32> reserved_4;
    bit<1> trader_workstation;
    bit<1> control_workstation;
    bit<1> tandem;
    bit<1> journaling_required;
    bit<12> reserved_112;
    bit<16> broadcast_message_length;
    bit<1872> market_status_broadcast_message;
}

header ticker_and_market_index_message_t {
    bit<16> number_of_records;
}

header ticker_and_market_index_message_st_ticker_index_info_t {
    bit<32> token;
    bit<16> market_type;
    bit<32> fill_price;
    bit<32> fill_volume;
    bit<32> open_interest;
    bit<32> day_hi_oi;
    bit<32> day_lo_oi;
}

header market_by_order_and_market_by_price_message_t {
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

header market_by_order_and_market_by_price_message_st_mbo_info_t {
    bit<32> trader_id;
    bit<32> qty;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<14> reserved_114;
    bit<32> min_fill_qty;
}

header market_by_order_and_market_by_price_message_st_mbp_info_t {
    bit<32> qty;
    bit<32> price;
    bit<16> no_of_orders;
}

header only_market_by_price_message_t {
    bit<16> no_of_records;
}

header only_market_by_price_message_interactive_only_mbp_data_t {
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

header market_watch_round_robin_message_t {
    bit<16> no_of_records;
}

header market_watch_round_robin_message_st_market_watch_bcast_t {
    bit<32> token;
}

header currency_assets_message_t {
    bit<32> token;
    bit<32> bid_price;
    bit<32> ask_price;
    bit<32> deal_price;
    bit<80> symbol;
    bit<48> instrument;
    bit<32> closing_price;
}

header interest_rate_assets_message_t {
    bit<32> token;
    bit<80> symbol;
}

header interest_rate_assets_message_mbp_buy_level_t {
    bit<32> order_count;
    bit<32> order_price;
    bit<32> yield_rate;
    bit<64> order_quantity;
}

header interest_rate_assets_message_mbp_sell_level_t {
    bit<32> order_count;
    bit<32> order_price;
    bit<32> yield_rate;
    bit<64> order_quantity;
}

header spread_market_by_price_delta_message_t {
    bit<32> token_1;
    bit<32> token_2;
    bit<16> mbp_buy;
    bit<16> mbp_sell;
    bit<32> last_active_time;
    bit<32> traded_volume;
    bit<64> total_traded_value;
}

header spread_market_by_price_delta_message_mbp_buys_t {
    bit<16> no_orders;
    bit<32> volume;
    bit<32> price;
}

header spread_market_by_price_delta_message_mbp_sells_t {
    bit<16> no_orders;
    bit<32> volume;
    bit<32> price;
}

header asset_open_interest_message_asset_open_interest_t {
    bit<32> token_no;
    bit<32> current_oi;
}

header asset_interest_rate_change_message_t {
    bit<32> token;
    bit<16> foreign_interest_rate;
    bit<32> volatility;
    bit<16> domestic_interest_rate;
}

header trade_execution_range_message_t {
    bit<32> msg_count;
}

header trade_execution_range_message_trade_execution_range_details_t {
    bit<32> token_number;
    bit<32> high_exec_band;
    bit<32> low_exec_band;
}

header market_by_aggregate_delta_message_t {
    bit<32> token;
    bit<16> no_of_records;
    bit<32> market_buy_price;
    bit<32> market_sell_price;
    bit<32> ideal_price;
}

header market_by_aggregate_delta_message_mba_data_t {
    bit<32> cumulative_quantity_of_orders;
    bit<32> wap;
    bit<64> total_value;
    bit<32> impact_cost;
    bit<32> order_price;
    bit<32> cumulative_quantity_of_orders_2;
    bit<32> wap_2;
    bit<64> total_value_2;
    bit<32> impact_cost_2;
    bit<32> order_price_2;
}

header spread_combination_master_change_message_t {
    bit<32> token_1;
    bit<32> token_2;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<16> series;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<48> instrument_name_2;
    bit<80> symbol_2;
    bit<16> series_2;
    bit<32> expiry_date_2;
    bit<32> strike_price_2;
    bit<16> option_type_2;
    bit<16> ca_level_2;
    bit<32> reference_price;
    bit<32> day_low_price_diff_range;
    bit<32> day_high_price_diff_range;
    bit<32> op_low_price_diff_range;
    bit<32> op_high_price_diff_range;
    bit<1> eligibility;
    bit<7> reserved_17;
    bit<8> reserved_1;
    bit<8> delete_flag;
    bit<8> second_reserved_1;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> security_master_change_message_st_sec_eligibility_per_market_remaining;
    bit<16> security_status_change_message_token_and_eligibility_remaining;
    bit<16> ticker_and_market_index_message_st_ticker_index_info_remaining;
    bit<16> market_by_order_and_market_by_price_message_st_mbo_info_remaining;
    bit<16> market_by_order_and_market_by_price_message_st_mbp_info_remaining;
    bit<16> only_market_by_price_message_interactive_only_mbp_data_remaining;
    bit<16> market_watch_round_robin_message_st_market_watch_bcast_remaining;
    bit<16> interest_rate_assets_message_mbp_buy_level_remaining;
    bit<16> interest_rate_assets_message_mbp_sell_level_remaining;
    bit<16> spread_market_by_price_delta_message_mbp_buys_remaining;
    bit<16> spread_market_by_price_delta_message_mbp_sells_remaining;
    bit<16> asset_open_interest_message_asset_open_interest_remaining;
    bit<16> trade_execution_range_message_trade_execution_range_details_remaining;
    bit<16> market_by_aggregate_delta_message_mba_data_remaining;
}

struct headers_t {
    bcast_header_t bcast_header;
    bcast_header_packed_packet_t bcast_header_packed_packet[MAX_MESSAGES];
    broadcast_journal_vct_message_t broadcast_journal_vct_message[MAX_MESSAGES];
    security_master_change_message_t security_master_change_message[MAX_MESSAGES];
    security_master_change_message_st_sec_eligibility_per_market_t security_master_change_message_st_sec_eligibility_per_market[MAX_MESSAGES];
    instrument_master_change_message_t instrument_master_change_message[MAX_MESSAGES];
    participant_master_change_message_t participant_master_change_message[MAX_MESSAGES];
    security_status_change_message_t security_status_change_message[MAX_MESSAGES];
    security_status_change_message_token_and_eligibility_t security_status_change_message_token_and_eligibility[MAX_MESSAGES];
    turnover_exceeded_message_t turnover_exceeded_message[MAX_MESSAGES];
    market_status_message_t market_status_message[MAX_MESSAGES];
    ticker_and_market_index_message_t ticker_and_market_index_message[MAX_MESSAGES];
    ticker_and_market_index_message_st_ticker_index_info_t ticker_and_market_index_message_st_ticker_index_info[MAX_MESSAGES];
    market_by_order_and_market_by_price_message_t market_by_order_and_market_by_price_message[MAX_MESSAGES];
    market_by_order_and_market_by_price_message_st_mbo_info_t market_by_order_and_market_by_price_message_st_mbo_info[MAX_MESSAGES];
    market_by_order_and_market_by_price_message_st_mbp_info_t market_by_order_and_market_by_price_message_st_mbp_info[MAX_MESSAGES];
    only_market_by_price_message_t only_market_by_price_message[MAX_MESSAGES];
    only_market_by_price_message_interactive_only_mbp_data_t only_market_by_price_message_interactive_only_mbp_data[MAX_MESSAGES];
    market_watch_round_robin_message_t market_watch_round_robin_message[MAX_MESSAGES];
    market_watch_round_robin_message_st_market_watch_bcast_t market_watch_round_robin_message_st_market_watch_bcast[MAX_MESSAGES];
    currency_assets_message_t currency_assets_message[MAX_MESSAGES];
    interest_rate_assets_message_t interest_rate_assets_message[MAX_MESSAGES];
    interest_rate_assets_message_mbp_buy_level_t interest_rate_assets_message_mbp_buy_level[MAX_MESSAGES];
    interest_rate_assets_message_mbp_sell_level_t interest_rate_assets_message_mbp_sell_level[MAX_MESSAGES];
    spread_market_by_price_delta_message_t spread_market_by_price_delta_message[MAX_MESSAGES];
    spread_market_by_price_delta_message_mbp_buys_t spread_market_by_price_delta_message_mbp_buys[MAX_MESSAGES];
    spread_market_by_price_delta_message_mbp_sells_t spread_market_by_price_delta_message_mbp_sells[MAX_MESSAGES];
    asset_open_interest_message_asset_open_interest_t asset_open_interest_message_asset_open_interest[MAX_MESSAGES];
    asset_interest_rate_change_message_t asset_interest_rate_change_message[MAX_MESSAGES];
    trade_execution_range_message_t trade_execution_range_message[MAX_MESSAGES];
    trade_execution_range_message_trade_execution_range_details_t trade_execution_range_message_trade_execution_range_details[MAX_MESSAGES];
    market_by_aggregate_delta_message_t market_by_aggregate_delta_message[MAX_MESSAGES];
    market_by_aggregate_delta_message_mba_data_t market_by_aggregate_delta_message_mba_data[MAX_MESSAGES];
    spread_combination_master_change_message_t spread_combination_master_change_message[MAX_MESSAGES];
}

parser NseixBroadcastParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w7305: parse_security_master_change_message;
            16w7340: parse_security_master_change_message;
            16w7324: parse_instrument_master_change_message;
            16w7306: parse_participant_master_change_message;
            16w7320: parse_security_status_change_message;
            16w7210: parse_security_status_change_message;
            16w9010: parse_turnover_exceeded_message;
            16w9011: parse_turnover_exceeded_message;
            16w6511: parse_market_status_message;
            16w6521: parse_market_status_message;
            16w6522: parse_market_status_message;
            16w6531: parse_market_status_message;
            16w6551: parse_market_status_message;
            16w6571: parse_market_status_message;
            16w7202: parse_ticker_and_market_index_message;
            16w7200: parse_market_by_order_and_market_by_price_message;
            16w7208: parse_only_market_by_price_message;
            16w7343: parse_only_market_by_price_message;
            16w7201: parse_market_watch_round_robin_message;
            16w7213: parse_currency_assets_message;
            16w7214: parse_interest_rate_assets_message;
            16w6541: parse_circuit_check_message;
            16w7211: parse_spread_market_by_price_delta_message;
            16w7130: parse_asset_open_interest_message;
            16w6503: parse_asset_interest_rate_change_message;
            16w7220: parse_trade_execution_range_message;
            16w7221: parse_trade_execution_range_message;
            16w7342: parse_trade_execution_range_message;
            16w7215: parse_market_by_aggregate_delta_message;
            16w7216: parse_market_by_aggregate_delta_message;
            16w7309: parse_spread_combination_master_change_message;
            16w7341: parse_spread_combination_master_change_message;
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
        meta.security_master_change_message_st_sec_eligibility_per_market_remaining = 16w4;
        transition parse_security_master_change_message_st_sec_eligibility_per_market;
    }

    state parse_security_master_change_message_st_sec_eligibility_per_market {
        packet.extract(hdr.security_master_change_message_st_sec_eligibility_per_market.next);
        meta.security_master_change_message_st_sec_eligibility_per_market_remaining = meta.security_master_change_message_st_sec_eligibility_per_market_remaining - 1;
        transition select(meta.security_master_change_message_st_sec_eligibility_per_market_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_security_master_change_message_st_sec_eligibility_per_market;
        }
    }

    state parse_instrument_master_change_message {
        packet.extract(hdr.instrument_master_change_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_participant_master_change_message {
        packet.extract(hdr.participant_master_change_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_security_status_change_message {
        packet.extract(hdr.security_status_change_message.next);
        meta.dispatched = 1;
        meta.security_status_change_message_token_and_eligibility_remaining = 16w35;
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

    state parse_turnover_exceeded_message {
        packet.extract(hdr.turnover_exceeded_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_market_status_message {
        packet.extract(hdr.market_status_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_ticker_and_market_index_message {
        packet.extract(hdr.ticker_and_market_index_message.next);
        meta.dispatched = 1;
        meta.ticker_and_market_index_message_st_ticker_index_info_remaining = 16w17;
        transition parse_ticker_and_market_index_message_st_ticker_index_info;
    }

    state parse_ticker_and_market_index_message_st_ticker_index_info {
        packet.extract(hdr.ticker_and_market_index_message_st_ticker_index_info.next);
        meta.ticker_and_market_index_message_st_ticker_index_info_remaining = meta.ticker_and_market_index_message_st_ticker_index_info_remaining - 1;
        transition select(meta.ticker_and_market_index_message_st_ticker_index_info_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_ticker_and_market_index_message_st_ticker_index_info;
        }
    }

    state parse_market_by_order_and_market_by_price_message {
        packet.extract(hdr.market_by_order_and_market_by_price_message.next);
        meta.dispatched = 1;
        meta.market_by_order_and_market_by_price_message_st_mbo_info_remaining = 16w10;
        transition parse_market_by_order_and_market_by_price_message_st_mbo_info;
    }

    state parse_market_by_order_and_market_by_price_message_st_mbo_info {
        packet.extract(hdr.market_by_order_and_market_by_price_message_st_mbo_info.next);
        meta.market_by_order_and_market_by_price_message_st_mbo_info_remaining = meta.market_by_order_and_market_by_price_message_st_mbo_info_remaining - 1;
        transition select(meta.market_by_order_and_market_by_price_message_st_mbo_info_remaining) {
            16w0: read_market_by_order_and_market_by_price_message_st_mbp_info;
            default: parse_market_by_order_and_market_by_price_message_st_mbo_info;
        }
    }

    state read_market_by_order_and_market_by_price_message_st_mbp_info {
        meta.market_by_order_and_market_by_price_message_st_mbp_info_remaining = 16w10;
        transition parse_market_by_order_and_market_by_price_message_st_mbp_info;
    }

    state parse_market_by_order_and_market_by_price_message_st_mbp_info {
        packet.extract(hdr.market_by_order_and_market_by_price_message_st_mbp_info.next);
        meta.market_by_order_and_market_by_price_message_st_mbp_info_remaining = meta.market_by_order_and_market_by_price_message_st_mbp_info_remaining - 1;
        transition select(meta.market_by_order_and_market_by_price_message_st_mbp_info_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_by_order_and_market_by_price_message_st_mbp_info;
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
        meta.market_watch_round_robin_message_st_market_watch_bcast_remaining = 16w5;
        transition parse_market_watch_round_robin_message_st_market_watch_bcast;
    }

    state parse_market_watch_round_robin_message_st_market_watch_bcast {
        packet.extract(hdr.market_watch_round_robin_message_st_market_watch_bcast.next);
        meta.market_watch_round_robin_message_st_market_watch_bcast_remaining = meta.market_watch_round_robin_message_st_market_watch_bcast_remaining - 1;
        transition select(meta.market_watch_round_robin_message_st_market_watch_bcast_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_watch_round_robin_message_st_market_watch_bcast;
        }
    }

    state parse_currency_assets_message {
        packet.extract(hdr.currency_assets_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_interest_rate_assets_message {
        packet.extract(hdr.interest_rate_assets_message.next);
        meta.dispatched = 1;
        meta.interest_rate_assets_message_mbp_buy_level_remaining = 16w5;
        transition parse_interest_rate_assets_message_mbp_buy_level;
    }

    state parse_interest_rate_assets_message_mbp_buy_level {
        packet.extract(hdr.interest_rate_assets_message_mbp_buy_level.next);
        meta.interest_rate_assets_message_mbp_buy_level_remaining = meta.interest_rate_assets_message_mbp_buy_level_remaining - 1;
        transition select(meta.interest_rate_assets_message_mbp_buy_level_remaining) {
            16w0: read_interest_rate_assets_message_mbp_sell_level;
            default: parse_interest_rate_assets_message_mbp_buy_level;
        }
    }

    state read_interest_rate_assets_message_mbp_sell_level {
        meta.interest_rate_assets_message_mbp_sell_level_remaining = 16w5;
        transition parse_interest_rate_assets_message_mbp_sell_level;
    }

    state parse_interest_rate_assets_message_mbp_sell_level {
        packet.extract(hdr.interest_rate_assets_message_mbp_sell_level.next);
        meta.interest_rate_assets_message_mbp_sell_level_remaining = meta.interest_rate_assets_message_mbp_sell_level_remaining - 1;
        transition select(meta.interest_rate_assets_message_mbp_sell_level_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_interest_rate_assets_message_mbp_sell_level;
        }
    }

    state parse_circuit_check_message {
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_spread_market_by_price_delta_message {
        packet.extract(hdr.spread_market_by_price_delta_message.next);
        meta.dispatched = 1;
        meta.spread_market_by_price_delta_message_mbp_buys_remaining = 16w5;
        transition parse_spread_market_by_price_delta_message_mbp_buys;
    }

    state parse_spread_market_by_price_delta_message_mbp_buys {
        packet.extract(hdr.spread_market_by_price_delta_message_mbp_buys.next);
        meta.spread_market_by_price_delta_message_mbp_buys_remaining = meta.spread_market_by_price_delta_message_mbp_buys_remaining - 1;
        transition select(meta.spread_market_by_price_delta_message_mbp_buys_remaining) {
            16w0: read_spread_market_by_price_delta_message_mbp_sells;
            default: parse_spread_market_by_price_delta_message_mbp_buys;
        }
    }

    state read_spread_market_by_price_delta_message_mbp_sells {
        meta.spread_market_by_price_delta_message_mbp_sells_remaining = 16w5;
        transition parse_spread_market_by_price_delta_message_mbp_sells;
    }

    state parse_spread_market_by_price_delta_message_mbp_sells {
        packet.extract(hdr.spread_market_by_price_delta_message_mbp_sells.next);
        meta.spread_market_by_price_delta_message_mbp_sells_remaining = meta.spread_market_by_price_delta_message_mbp_sells_remaining - 1;
        transition select(meta.spread_market_by_price_delta_message_mbp_sells_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_spread_market_by_price_delta_message_mbp_sells;
        }
    }

    state parse_asset_open_interest_message {
        meta.dispatched = 1;
        meta.asset_open_interest_message_asset_open_interest_remaining = 16w58;
        transition parse_asset_open_interest_message_asset_open_interest;
    }

    state parse_asset_open_interest_message_asset_open_interest {
        packet.extract(hdr.asset_open_interest_message_asset_open_interest.next);
        meta.asset_open_interest_message_asset_open_interest_remaining = meta.asset_open_interest_message_asset_open_interest_remaining - 1;
        transition select(meta.asset_open_interest_message_asset_open_interest_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_asset_open_interest_message_asset_open_interest;
        }
    }

    state parse_asset_interest_rate_change_message {
        packet.extract(hdr.asset_interest_rate_change_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_trade_execution_range_message {
        packet.extract(hdr.trade_execution_range_message.next);
        meta.dispatched = 1;
        meta.trade_execution_range_message_trade_execution_range_details_remaining = 16w25;
        transition parse_trade_execution_range_message_trade_execution_range_details;
    }

    state parse_trade_execution_range_message_trade_execution_range_details {
        packet.extract(hdr.trade_execution_range_message_trade_execution_range_details.next);
        meta.trade_execution_range_message_trade_execution_range_details_remaining = meta.trade_execution_range_message_trade_execution_range_details_remaining - 1;
        transition select(meta.trade_execution_range_message_trade_execution_range_details_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_trade_execution_range_message_trade_execution_range_details;
        }
    }

    state parse_market_by_aggregate_delta_message {
        packet.extract(hdr.market_by_aggregate_delta_message.next);
        meta.dispatched = 1;
        meta.market_by_aggregate_delta_message_mba_data_remaining = 16w5;
        transition parse_market_by_aggregate_delta_message_mba_data;
    }

    state parse_market_by_aggregate_delta_message_mba_data {
        packet.extract(hdr.market_by_aggregate_delta_message_mba_data.next);
        meta.market_by_aggregate_delta_message_mba_data_remaining = meta.market_by_aggregate_delta_message_mba_data_remaining - 1;
        transition select(meta.market_by_aggregate_delta_message_mba_data_remaining) {
            16w0: parse_bcast_header_packed_packet;
            default: parse_market_by_aggregate_delta_message_mba_data;
        }
    }

    state parse_spread_combination_master_change_message {
        packet.extract(hdr.spread_combination_master_change_message.next);
        meta.dispatched = 1;
        transition parse_bcast_header_packed_packet;
    }

    state parse_bcast_header_packed_packet_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control NseixBroadcastVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseixBroadcastIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NseixBroadcastEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NseixBroadcastComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseixBroadcastDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.bcast_header);
        packet.emit(hdr.bcast_header_packed_packet);
        packet.emit(hdr.broadcast_journal_vct_message);
        packet.emit(hdr.security_master_change_message);
        packet.emit(hdr.security_master_change_message_st_sec_eligibility_per_market);
        packet.emit(hdr.instrument_master_change_message);
        packet.emit(hdr.participant_master_change_message);
        packet.emit(hdr.security_status_change_message);
        packet.emit(hdr.security_status_change_message_token_and_eligibility);
        packet.emit(hdr.turnover_exceeded_message);
        packet.emit(hdr.market_status_message);
        packet.emit(hdr.ticker_and_market_index_message);
        packet.emit(hdr.ticker_and_market_index_message_st_ticker_index_info);
        packet.emit(hdr.market_by_order_and_market_by_price_message);
        packet.emit(hdr.market_by_order_and_market_by_price_message_st_mbo_info);
        packet.emit(hdr.market_by_order_and_market_by_price_message_st_mbp_info);
        packet.emit(hdr.only_market_by_price_message);
        packet.emit(hdr.only_market_by_price_message_interactive_only_mbp_data);
        packet.emit(hdr.market_watch_round_robin_message);
        packet.emit(hdr.market_watch_round_robin_message_st_market_watch_bcast);
        packet.emit(hdr.currency_assets_message);
        packet.emit(hdr.interest_rate_assets_message);
        packet.emit(hdr.interest_rate_assets_message_mbp_buy_level);
        packet.emit(hdr.interest_rate_assets_message_mbp_sell_level);
        packet.emit(hdr.spread_market_by_price_delta_message);
        packet.emit(hdr.spread_market_by_price_delta_message_mbp_buys);
        packet.emit(hdr.spread_market_by_price_delta_message_mbp_sells);
        packet.emit(hdr.asset_open_interest_message_asset_open_interest);
        packet.emit(hdr.asset_interest_rate_change_message);
        packet.emit(hdr.trade_execution_range_message);
        packet.emit(hdr.trade_execution_range_message_trade_execution_range_details);
        packet.emit(hdr.market_by_aggregate_delta_message);
        packet.emit(hdr.market_by_aggregate_delta_message_mba_data);
        packet.emit(hdr.spread_combination_master_change_message);
    }
}

V1Switch(
    NseixBroadcastParser(),
    NseixBroadcastVerifyChecksum(),
    NseixBroadcastIngress(),
    NseixBroadcastEgress(),
    NseixBroadcastComputeChecksum(),
    NseixBroadcastDeparser()
) main;
