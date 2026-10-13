// P4_16 (v1model) definition for: Szse SzseSecurities TcpMarketData SzseBinary v1.17
// 
// Protocol:
//   Organization: Shenzhen Stock Exchange
//   Protocol: Szse Tcp Market Data
//   Encoding: Szse Binary Market Data Feed
//   Version: 1.17
//   Date: 04/01/2025
//   Specification: SZSE Interface Specification of BINARY Market Data Feed (Ver1.17).pdf
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

header message_header_t {
    bit<32> msg_type;
    bit<32> body_length;
}

header logon_message_t {
    bit<160> sender_comp_id;
    bit<160> target_comp_id;
    bit<32> heart_bt_int;
    bit<128> password;
    bit<256> default_appl_ver_id;
}

header logout_message_t {
    bit<32> session_status;
    bit<1600> text;
}

header channel_heartbeat_message_t {
    bit<16> channel_no;
    bit<64> appl_last_seq_num;
    bit<16> end_of_channel;
}

header retransmitting_message_t {
    bit<8> resend_type;
    bit<16> channel_no;
    bit<64> appl_beg_seq_num;
    bit<64> appl_end_seq_num;
    bit<64> news_id;
    bit<8> resend_status;
    bit<128> reject_text;
}

header client_user_information_reporting_message_t {
    bit<64> orig_time;
    bit<128> version_code;
    bit<16> user_num;
}

header statistics_of_snapshot_data_channel_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<32> no_md_stream_id;
}

header statistics_of_snapshot_data_channel_message_md_stream_i_ds_t {
    bit<24> md_stream_id;
    bit<32> stock_num;
    bit<64> trading_phase_code;
}

header business_reject_message_t {
    bit<64> ref_seq_num;
    bit<32> ref_msg_type;
    bit<80> business_reject_ref_id;
    bit<16> business_reject_reason;
    bit<400> business_reject_text;
}

header real_time_market_status_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<64> market_id;
    bit<64> market_segment_id;
    bit<32> trading_session_id;
    bit<32> trading_session_sub_id;
    bit<16> trad_ses_status;
    bit<64> trad_ses_start_time;
    bit<64> trad_ses_end_time;
    bit<64> thredhold_amount;
    bit<64> pos_amt;
    bit<8> amounts_status;
}

header real_time_status_of_security_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> financial_status;
    bit<32> no_switch;
}

header real_time_status_of_security_message_switch_t {
    bit<16> security_switch_type;
    bit<16> security_switch_status;
}

header announcements_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<64> news_id;
    bit<1024> headline;
    bit<64> raw_data_format;
    bit<32> raw_data_length;
}

header snapshot_data_of_cash_auction_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header snapshot_data_of_cash_auction_message_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<16> md_price_level;
    bit<64> number_of_orders;
    bit<32> no_orders;
}

header snapshot_data_of_spot_bond_trading_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header snapshot_data_of_spot_bond_trading_message_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<16> md_price_level;
    bit<64> number_of_orders;
    bit<32> no_orders;
}

header snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_header_t {
    bit<32> no_sub_trading_phase_codes;
}

header snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_t {
    bit<64> sub_trading_phase_code;
    bit<8> trading_type;
}

header snapshot_data_of_after_hour_trading_block_trade_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
}

header snapshot_data_of_after_hour_trading_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header snapshot_data_of_after_hour_trading_message_trade_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
}

header snapshot_data_of_eligible_hk_stocks_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<16> md_price_level;
}

header snapshot_data_of_eligible_hk_stocks_message_complex_event_times_header_t {
    bit<32> no_complex_event_times;
}

header snapshot_data_of_eligible_hk_stocks_message_complex_event_times_t {
    bit<64> complex_event_start_time;
    bit<64> complex_event_end_time;
}

header index_snapshot_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header index_snapshot_message_index_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
}

header statistic_indicator_snapshot_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> stock_num;
}

header real_time_reference_net_value_of_funds_snapshot_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> prev_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
}

header order_tick_data_in_call_auction_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transac_time;
    bit<8> ord_type;
}

header order_tick_data_of_negotiable_trade_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transac_time;
    bit<64> confirm_id;
    bit<96> contactor;
    bit<240> contact_info;
}

header order_tick_data_of_security_lending_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transac_time;
    bit<16> expiration_days;
    bit<8> expiration_type;
}

header order_tick_data_of_spot_bond_trading_matching_deal_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transac_time;
    bit<8> ord_type;
}

header order_tick_data_of_spot_bond_trading_quotation_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transac_time;
    bit<80> quote_id;
    bit<48> member_id;
    bit<16> investor_type;
    bit<80> investor_id;
    bit<960> investor_name;
    bit<64> trader_code;
    bit<8> settl_period;
    bit<16> settl_type;
    bit<1280> memo;
    bit<64> min_qty;
}

header order_tick_data_of_bid_quotation_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transac_time;
    bit<48> member_id;
    bit<16> investor_type;
    bit<80> investor_id;
    bit<960> investor_name;
    bit<64> trader_code;
    bit<8> settl_period;
    bit<16> settl_type;
    bit<1280> memo;
    bit<128> secondary_order_id;
    bit<16> bid_trans_type;
    bit<16> bid_exec_inst_type;
    bit<64> low_limit_price;
    bit<64> high_limit_price;
    bit<64> min_qty;
    bit<32> trade_date;
}

header transaction_tick_data_in_call_auction_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> bid_appl_seq_num;
    bit<64> offer_appl_seq_num;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> exec_type;
    bit<64> transac_time;
}

header transaction_tick_data_of_negotiable_trade_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> bid_appl_seq_num;
    bit<64> offer_appl_seq_num;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> exec_type;
    bit<64> transac_time;
}

header transaction_tick_data_of_security_lending_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> bid_appl_seq_num;
    bit<64> offer_appl_seq_num;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> exec_type;
    bit<64> transac_time;
}

header transaction_tick_data_of_bond_general_pledged_repo_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> bid_appl_seq_num;
    bit<64> offer_appl_seq_num;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> exec_type;
    bit<64> transac_time;
}

header transaction_tick_data_of_spot_bond_trading_quotation_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> bid_appl_seq_num;
    bit<64> offer_appl_seq_num;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> exec_type;
    bit<64> transac_time;
    bit<8> settl_period;
    bit<16> settl_type;
}

header transaction_tick_data_of_bid_quotation_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> bid_appl_seq_num;
    bit<64> offer_appl_seq_num;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> exec_type;
    bit<64> transac_time;
    bit<8> settl_period;
    bit<16> settl_type;
    bit<128> secondary_order_id;
    bit<16> bid_exec_inst_type;
    bit<64> margin_price;
}

header announcements_message_raw_data_t {
    varbit<2048> raw_data;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> statistics_of_snapshot_data_channel_message_md_stream_i_ds_remaining;
    bit<32> real_time_status_of_security_message_switch_remaining;
    bit<32> snapshot_data_of_cash_auction_message_md_entries_remaining;
    bit<32> snapshot_data_of_spot_bond_trading_message_md_entries_remaining;
    bit<32> snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_remaining;
    bit<32> snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_remaining;
    bit<32> snapshot_data_of_after_hour_trading_message_trade_md_entries_remaining;
    bit<32> snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_remaining;
    bit<32> snapshot_data_of_eligible_hk_stocks_message_complex_event_times_remaining;
    bit<32> index_snapshot_message_index_md_entries_remaining;
    bit<32> real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_remaining;
}

struct headers_t {
    message_header_t message_header;
    logon_message_t logon_message;
    logout_message_t logout_message;
    channel_heartbeat_message_t channel_heartbeat_message;
    retransmitting_message_t retransmitting_message;
    client_user_information_reporting_message_t client_user_information_reporting_message;
    statistics_of_snapshot_data_channel_message_t statistics_of_snapshot_data_channel_message;
    statistics_of_snapshot_data_channel_message_md_stream_i_ds_t statistics_of_snapshot_data_channel_message_md_stream_i_ds[MAX_MESSAGES];
    business_reject_message_t business_reject_message;
    real_time_market_status_message_t real_time_market_status_message;
    real_time_status_of_security_message_t real_time_status_of_security_message;
    real_time_status_of_security_message_switch_t real_time_status_of_security_message_switch[MAX_MESSAGES];
    announcements_message_t announcements_message;
    snapshot_data_of_cash_auction_message_t snapshot_data_of_cash_auction_message;
    snapshot_data_of_cash_auction_message_md_entries_t snapshot_data_of_cash_auction_message_md_entries[MAX_MESSAGES];
    snapshot_data_of_spot_bond_trading_message_t snapshot_data_of_spot_bond_trading_message;
    snapshot_data_of_spot_bond_trading_message_md_entries_t snapshot_data_of_spot_bond_trading_message_md_entries[MAX_MESSAGES];
    snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_header_t snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_header;
    snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_t snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes[MAX_MESSAGES];
    snapshot_data_of_after_hour_trading_block_trade_message_t snapshot_data_of_after_hour_trading_block_trade_message;
    snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_t snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries[MAX_MESSAGES];
    snapshot_data_of_after_hour_trading_message_t snapshot_data_of_after_hour_trading_message;
    snapshot_data_of_after_hour_trading_message_trade_md_entries_t snapshot_data_of_after_hour_trading_message_trade_md_entries[MAX_MESSAGES];
    snapshot_data_of_eligible_hk_stocks_message_t snapshot_data_of_eligible_hk_stocks_message;
    snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_t snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries[MAX_MESSAGES];
    snapshot_data_of_eligible_hk_stocks_message_complex_event_times_header_t snapshot_data_of_eligible_hk_stocks_message_complex_event_times_header;
    snapshot_data_of_eligible_hk_stocks_message_complex_event_times_t snapshot_data_of_eligible_hk_stocks_message_complex_event_times[MAX_MESSAGES];
    index_snapshot_message_t index_snapshot_message;
    index_snapshot_message_index_md_entries_t index_snapshot_message_index_md_entries[MAX_MESSAGES];
    statistic_indicator_snapshot_message_t statistic_indicator_snapshot_message;
    real_time_reference_net_value_of_funds_snapshot_message_t real_time_reference_net_value_of_funds_snapshot_message;
    real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_t real_time_reference_net_value_of_funds_snapshot_message_index_md_entries[MAX_MESSAGES];
    order_tick_data_in_call_auction_message_t order_tick_data_in_call_auction_message;
    order_tick_data_of_negotiable_trade_message_t order_tick_data_of_negotiable_trade_message;
    order_tick_data_of_security_lending_message_t order_tick_data_of_security_lending_message;
    order_tick_data_of_spot_bond_trading_matching_deal_message_t order_tick_data_of_spot_bond_trading_matching_deal_message;
    order_tick_data_of_spot_bond_trading_quotation_message_t order_tick_data_of_spot_bond_trading_quotation_message;
    order_tick_data_of_bid_quotation_message_t order_tick_data_of_bid_quotation_message;
    transaction_tick_data_in_call_auction_message_t transaction_tick_data_in_call_auction_message;
    transaction_tick_data_of_negotiable_trade_message_t transaction_tick_data_of_negotiable_trade_message;
    transaction_tick_data_of_security_lending_message_t transaction_tick_data_of_security_lending_message;
    transaction_tick_data_of_bond_general_pledged_repo_message_t transaction_tick_data_of_bond_general_pledged_repo_message;
    transaction_tick_data_of_spot_bond_trading_quotation_message_t transaction_tick_data_of_spot_bond_trading_quotation_message;
    transaction_tick_data_of_bid_quotation_message_t transaction_tick_data_of_bid_quotation_message;
    announcements_message_raw_data_t announcements_message_raw_data;
}

parser SzsesecuritiesTcpmarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            32w1: parse_logon_message;
            32w2: parse_logout_message;
            32w3: parse_heartbeat_message;
            32w390095: parse_channel_heartbeat_message;
            32w390094: parse_retransmitting_message;
            32w390093: parse_client_user_information_reporting_message;
            32w390090: parse_statistics_of_snapshot_data_channel_message;
            32w8: parse_business_reject_message;
            32w390019: parse_real_time_market_status_message;
            32w390013: parse_real_time_status_of_security_message;
            32w390012: parse_announcements_message;
            32w300111: parse_snapshot_data_of_cash_auction_message;
            32w300211: parse_snapshot_data_of_spot_bond_trading_message;
            32w300611: parse_snapshot_data_of_after_hour_trading_block_trade_message;
            32w303711: parse_snapshot_data_of_after_hour_trading_message;
            32w306311: parse_snapshot_data_of_eligible_hk_stocks_message;
            32w309011: parse_index_snapshot_message;
            32w309111: parse_statistic_indicator_snapshot_message;
            32w309211: parse_real_time_reference_net_value_of_funds_snapshot_message;
            32w300192: parse_order_tick_data_in_call_auction_message;
            32w300592: parse_order_tick_data_of_negotiable_trade_message;
            32w300792: parse_order_tick_data_of_security_lending_message;
            32w300292: parse_order_tick_data_of_spot_bond_trading_matching_deal_message;
            32w300392: parse_order_tick_data_of_spot_bond_trading_quotation_message;
            32w300492: parse_order_tick_data_of_bid_quotation_message;
            32w300191: parse_transaction_tick_data_in_call_auction_message;
            32w300591: parse_transaction_tick_data_of_negotiable_trade_message;
            32w300791: parse_transaction_tick_data_of_security_lending_message;
            32w300291: parse_transaction_tick_data_of_bond_general_pledged_repo_message;
            32w300391: parse_transaction_tick_data_of_spot_bond_trading_quotation_message;
            32w300491: parse_transaction_tick_data_of_bid_quotation_message;
            default: accept;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_channel_heartbeat_message {
        packet.extract(hdr.channel_heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmitting_message {
        packet.extract(hdr.retransmitting_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_user_information_reporting_message {
        packet.extract(hdr.client_user_information_reporting_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_statistics_of_snapshot_data_channel_message {
        packet.extract(hdr.statistics_of_snapshot_data_channel_message);
        meta.dispatched = 1;
        meta.statistics_of_snapshot_data_channel_message_md_stream_i_ds_remaining = hdr.statistics_of_snapshot_data_channel_message.no_md_stream_id;
        transition select(meta.statistics_of_snapshot_data_channel_message_md_stream_i_ds_remaining) {
            32w0: accept;
            default: parse_statistics_of_snapshot_data_channel_message_md_stream_i_ds;
        }
    }

    state parse_statistics_of_snapshot_data_channel_message_md_stream_i_ds {
        packet.extract(hdr.statistics_of_snapshot_data_channel_message_md_stream_i_ds.next);
        meta.statistics_of_snapshot_data_channel_message_md_stream_i_ds_remaining = meta.statistics_of_snapshot_data_channel_message_md_stream_i_ds_remaining - 1;
        transition select(meta.statistics_of_snapshot_data_channel_message_md_stream_i_ds_remaining) {
            32w0: accept;
            default: parse_statistics_of_snapshot_data_channel_message_md_stream_i_ds;
        }
    }

    state parse_business_reject_message {
        packet.extract(hdr.business_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_real_time_market_status_message {
        packet.extract(hdr.real_time_market_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_real_time_status_of_security_message {
        packet.extract(hdr.real_time_status_of_security_message);
        meta.dispatched = 1;
        meta.real_time_status_of_security_message_switch_remaining = hdr.real_time_status_of_security_message.no_switch;
        transition select(meta.real_time_status_of_security_message_switch_remaining) {
            32w0: accept;
            default: parse_real_time_status_of_security_message_switch;
        }
    }

    state parse_real_time_status_of_security_message_switch {
        packet.extract(hdr.real_time_status_of_security_message_switch.next);
        meta.real_time_status_of_security_message_switch_remaining = meta.real_time_status_of_security_message_switch_remaining - 1;
        transition select(meta.real_time_status_of_security_message_switch_remaining) {
            32w0: accept;
            default: parse_real_time_status_of_security_message_switch;
        }
    }

    state parse_announcements_message {
        packet.extract(hdr.announcements_message);
        meta.dispatched = 1;
        packet.extract(hdr.announcements_message_raw_data, (bit<32>)hdr.announcements_message.raw_data_length * 8);
        transition accept;
    }

    state parse_snapshot_data_of_cash_auction_message {
        packet.extract(hdr.snapshot_data_of_cash_auction_message);
        meta.dispatched = 1;
        meta.snapshot_data_of_cash_auction_message_md_entries_remaining = hdr.snapshot_data_of_cash_auction_message.no_md_entries;
        transition select(meta.snapshot_data_of_cash_auction_message_md_entries_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_cash_auction_message_md_entries;
        }
    }

    state parse_snapshot_data_of_cash_auction_message_md_entries {
        packet.extract(hdr.snapshot_data_of_cash_auction_message_md_entries.next);
        meta.snapshot_data_of_cash_auction_message_md_entries_remaining = meta.snapshot_data_of_cash_auction_message_md_entries_remaining - 1;
        transition select(meta.snapshot_data_of_cash_auction_message_md_entries_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_cash_auction_message_md_entries;
        }
    }

    state parse_snapshot_data_of_spot_bond_trading_message {
        packet.extract(hdr.snapshot_data_of_spot_bond_trading_message);
        meta.dispatched = 1;
        meta.snapshot_data_of_spot_bond_trading_message_md_entries_remaining = hdr.snapshot_data_of_spot_bond_trading_message.no_md_entries;
        transition select(meta.snapshot_data_of_spot_bond_trading_message_md_entries_remaining) {
            32w0: read_snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes;
            default: parse_snapshot_data_of_spot_bond_trading_message_md_entries;
        }
    }

    state parse_snapshot_data_of_spot_bond_trading_message_md_entries {
        packet.extract(hdr.snapshot_data_of_spot_bond_trading_message_md_entries.next);
        meta.snapshot_data_of_spot_bond_trading_message_md_entries_remaining = meta.snapshot_data_of_spot_bond_trading_message_md_entries_remaining - 1;
        transition select(meta.snapshot_data_of_spot_bond_trading_message_md_entries_remaining) {
            32w0: read_snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes;
            default: parse_snapshot_data_of_spot_bond_trading_message_md_entries;
        }
    }

    state read_snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes {
        packet.extract(hdr.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_header);
        meta.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_remaining = hdr.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_header.no_sub_trading_phase_codes;
        transition select(meta.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes;
        }
    }

    state parse_snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes {
        packet.extract(hdr.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes.next);
        meta.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_remaining = meta.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_remaining - 1;
        transition select(meta.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes;
        }
    }

    state parse_snapshot_data_of_after_hour_trading_block_trade_message {
        packet.extract(hdr.snapshot_data_of_after_hour_trading_block_trade_message);
        meta.dispatched = 1;
        meta.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_remaining = hdr.snapshot_data_of_after_hour_trading_block_trade_message.no_md_entries;
        transition select(meta.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries;
        }
    }

    state parse_snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries {
        packet.extract(hdr.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries.next);
        meta.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_remaining = meta.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_remaining - 1;
        transition select(meta.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries;
        }
    }

    state parse_snapshot_data_of_after_hour_trading_message {
        packet.extract(hdr.snapshot_data_of_after_hour_trading_message);
        meta.dispatched = 1;
        meta.snapshot_data_of_after_hour_trading_message_trade_md_entries_remaining = hdr.snapshot_data_of_after_hour_trading_message.no_md_entries;
        transition select(meta.snapshot_data_of_after_hour_trading_message_trade_md_entries_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_after_hour_trading_message_trade_md_entries;
        }
    }

    state parse_snapshot_data_of_after_hour_trading_message_trade_md_entries {
        packet.extract(hdr.snapshot_data_of_after_hour_trading_message_trade_md_entries.next);
        meta.snapshot_data_of_after_hour_trading_message_trade_md_entries_remaining = meta.snapshot_data_of_after_hour_trading_message_trade_md_entries_remaining - 1;
        transition select(meta.snapshot_data_of_after_hour_trading_message_trade_md_entries_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_after_hour_trading_message_trade_md_entries;
        }
    }

    state parse_snapshot_data_of_eligible_hk_stocks_message {
        packet.extract(hdr.snapshot_data_of_eligible_hk_stocks_message);
        meta.dispatched = 1;
        meta.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_remaining = hdr.snapshot_data_of_eligible_hk_stocks_message.no_md_entries;
        transition select(meta.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_remaining) {
            32w0: read_snapshot_data_of_eligible_hk_stocks_message_complex_event_times;
            default: parse_snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries;
        }
    }

    state parse_snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries {
        packet.extract(hdr.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries.next);
        meta.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_remaining = meta.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_remaining - 1;
        transition select(meta.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries_remaining) {
            32w0: read_snapshot_data_of_eligible_hk_stocks_message_complex_event_times;
            default: parse_snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries;
        }
    }

    state read_snapshot_data_of_eligible_hk_stocks_message_complex_event_times {
        packet.extract(hdr.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_header);
        meta.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_remaining = hdr.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_header.no_complex_event_times;
        transition select(meta.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_eligible_hk_stocks_message_complex_event_times;
        }
    }

    state parse_snapshot_data_of_eligible_hk_stocks_message_complex_event_times {
        packet.extract(hdr.snapshot_data_of_eligible_hk_stocks_message_complex_event_times.next);
        meta.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_remaining = meta.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_remaining - 1;
        transition select(meta.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_remaining) {
            32w0: accept;
            default: parse_snapshot_data_of_eligible_hk_stocks_message_complex_event_times;
        }
    }

    state parse_index_snapshot_message {
        packet.extract(hdr.index_snapshot_message);
        meta.dispatched = 1;
        meta.index_snapshot_message_index_md_entries_remaining = hdr.index_snapshot_message.no_md_entries;
        transition select(meta.index_snapshot_message_index_md_entries_remaining) {
            32w0: accept;
            default: parse_index_snapshot_message_index_md_entries;
        }
    }

    state parse_index_snapshot_message_index_md_entries {
        packet.extract(hdr.index_snapshot_message_index_md_entries.next);
        meta.index_snapshot_message_index_md_entries_remaining = meta.index_snapshot_message_index_md_entries_remaining - 1;
        transition select(meta.index_snapshot_message_index_md_entries_remaining) {
            32w0: accept;
            default: parse_index_snapshot_message_index_md_entries;
        }
    }

    state parse_statistic_indicator_snapshot_message {
        packet.extract(hdr.statistic_indicator_snapshot_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_real_time_reference_net_value_of_funds_snapshot_message {
        packet.extract(hdr.real_time_reference_net_value_of_funds_snapshot_message);
        meta.dispatched = 1;
        meta.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_remaining = hdr.real_time_reference_net_value_of_funds_snapshot_message.no_md_entries;
        transition select(meta.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_remaining) {
            32w0: accept;
            default: parse_real_time_reference_net_value_of_funds_snapshot_message_index_md_entries;
        }
    }

    state parse_real_time_reference_net_value_of_funds_snapshot_message_index_md_entries {
        packet.extract(hdr.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries.next);
        meta.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_remaining = meta.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_remaining - 1;
        transition select(meta.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries_remaining) {
            32w0: accept;
            default: parse_real_time_reference_net_value_of_funds_snapshot_message_index_md_entries;
        }
    }

    state parse_order_tick_data_in_call_auction_message {
        packet.extract(hdr.order_tick_data_in_call_auction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_tick_data_of_negotiable_trade_message {
        packet.extract(hdr.order_tick_data_of_negotiable_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_tick_data_of_security_lending_message {
        packet.extract(hdr.order_tick_data_of_security_lending_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_tick_data_of_spot_bond_trading_matching_deal_message {
        packet.extract(hdr.order_tick_data_of_spot_bond_trading_matching_deal_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_tick_data_of_spot_bond_trading_quotation_message {
        packet.extract(hdr.order_tick_data_of_spot_bond_trading_quotation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_tick_data_of_bid_quotation_message {
        packet.extract(hdr.order_tick_data_of_bid_quotation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_transaction_tick_data_in_call_auction_message {
        packet.extract(hdr.transaction_tick_data_in_call_auction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_transaction_tick_data_of_negotiable_trade_message {
        packet.extract(hdr.transaction_tick_data_of_negotiable_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_transaction_tick_data_of_security_lending_message {
        packet.extract(hdr.transaction_tick_data_of_security_lending_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_transaction_tick_data_of_bond_general_pledged_repo_message {
        packet.extract(hdr.transaction_tick_data_of_bond_general_pledged_repo_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_transaction_tick_data_of_spot_bond_trading_quotation_message {
        packet.extract(hdr.transaction_tick_data_of_spot_bond_trading_quotation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_transaction_tick_data_of_bid_quotation_message {
        packet.extract(hdr.transaction_tick_data_of_bid_quotation_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SzsesecuritiesTcpmarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SzsesecuritiesTcpmarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SzsesecuritiesTcpmarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SzsesecuritiesTcpmarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SzsesecuritiesTcpmarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.channel_heartbeat_message);
        packet.emit(hdr.retransmitting_message);
        packet.emit(hdr.client_user_information_reporting_message);
        packet.emit(hdr.statistics_of_snapshot_data_channel_message);
        packet.emit(hdr.statistics_of_snapshot_data_channel_message_md_stream_i_ds);
        packet.emit(hdr.business_reject_message);
        packet.emit(hdr.real_time_market_status_message);
        packet.emit(hdr.real_time_status_of_security_message);
        packet.emit(hdr.real_time_status_of_security_message_switch);
        packet.emit(hdr.announcements_message);
        packet.emit(hdr.announcements_message_raw_data);
        packet.emit(hdr.snapshot_data_of_cash_auction_message);
        packet.emit(hdr.snapshot_data_of_cash_auction_message_md_entries);
        packet.emit(hdr.snapshot_data_of_spot_bond_trading_message);
        packet.emit(hdr.snapshot_data_of_spot_bond_trading_message_md_entries);
        packet.emit(hdr.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes_header);
        packet.emit(hdr.snapshot_data_of_spot_bond_trading_message_sub_trading_phase_codes);
        packet.emit(hdr.snapshot_data_of_after_hour_trading_block_trade_message);
        packet.emit(hdr.snapshot_data_of_after_hour_trading_block_trade_message_trade_md_entries);
        packet.emit(hdr.snapshot_data_of_after_hour_trading_message);
        packet.emit(hdr.snapshot_data_of_after_hour_trading_message_trade_md_entries);
        packet.emit(hdr.snapshot_data_of_eligible_hk_stocks_message);
        packet.emit(hdr.snapshot_data_of_eligible_hk_stocks_message_hk_stocks_md_entries);
        packet.emit(hdr.snapshot_data_of_eligible_hk_stocks_message_complex_event_times_header);
        packet.emit(hdr.snapshot_data_of_eligible_hk_stocks_message_complex_event_times);
        packet.emit(hdr.index_snapshot_message);
        packet.emit(hdr.index_snapshot_message_index_md_entries);
        packet.emit(hdr.statistic_indicator_snapshot_message);
        packet.emit(hdr.real_time_reference_net_value_of_funds_snapshot_message);
        packet.emit(hdr.real_time_reference_net_value_of_funds_snapshot_message_index_md_entries);
        packet.emit(hdr.order_tick_data_in_call_auction_message);
        packet.emit(hdr.order_tick_data_of_negotiable_trade_message);
        packet.emit(hdr.order_tick_data_of_security_lending_message);
        packet.emit(hdr.order_tick_data_of_spot_bond_trading_matching_deal_message);
        packet.emit(hdr.order_tick_data_of_spot_bond_trading_quotation_message);
        packet.emit(hdr.order_tick_data_of_bid_quotation_message);
        packet.emit(hdr.transaction_tick_data_in_call_auction_message);
        packet.emit(hdr.transaction_tick_data_of_negotiable_trade_message);
        packet.emit(hdr.transaction_tick_data_of_security_lending_message);
        packet.emit(hdr.transaction_tick_data_of_bond_general_pledged_repo_message);
        packet.emit(hdr.transaction_tick_data_of_spot_bond_trading_quotation_message);
        packet.emit(hdr.transaction_tick_data_of_bid_quotation_message);
    }
}

V1Switch(
    SzsesecuritiesTcpmarketdataParser(),
    SzsesecuritiesTcpmarketdataVerifyChecksum(),
    SzsesecuritiesTcpmarketdataIngress(),
    SzsesecuritiesTcpmarketdataEgress(),
    SzsesecuritiesTcpmarketdataComputeChecksum(),
    SzsesecuritiesTcpmarketdataDeparser()
) main;
