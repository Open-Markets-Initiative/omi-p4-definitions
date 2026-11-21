// P4_16 (v1model) definition for: Neeq NeeqSecurities TcpMarketData BjseBinary v1.1
// 
// Protocol:
//   Organization: National Equities Exchange and Quotations
//   Protocol: Neeq Tcp Market Data
//   Encoding: Bjse Binary Market Data Feed
//   Version: 1.1
//   Date: 12/31/2025
//   Specification: 20251231194517_82kitaljxu.pdf
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
    bit<64> orig_time;
}

header retransmission_message_t {
    bit<8> resend_type;
    bit<16> channel_no;
    bit<64> appl_beg_seq_num;
    bit<64> appl_end_seq_num;
    bit<128> news_id;
    bit<8> resend_status;
    bit<128> reject_text;
}

header snapshot_channel_statistics_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<32> no_md_stream_id;
}

header snapshot_channel_statistics_message_md_stream_i_ds_t {
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

header security_real_time_status_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<320> security_symbol;
    bit<32> no_switch;
}

header security_real_time_status_message_switch_t {
    bit<16> security_switch_type;
    bit<16> security_switch_status;
}

header announcement_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<128> news_id;
    bit<1024> headline;
    bit<8> news_type;
    bit<64> raw_data_format;
    bit<32> raw_data_length;
}

header bond_spot_trading_snapshot_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> pre_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header bond_spot_trading_snapshot_message_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<16> md_price_level;
    bit<64> number_of_orders;
    bit<32> no_orders;
}

header bond_spot_trading_snapshot_message_sub_trading_phase_codes_header_t {
    bit<32> no_sub_trading_phase_codes;
}

header bond_spot_trading_snapshot_message_sub_trading_phase_codes_t {
    bit<64> sub_trading_phase_code;
    bit<8> trading_type;
}

header auction_trading_snapshot_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> pre_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header auction_trading_snapshot_message_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<16> md_price_level;
    bit<64> number_of_orders;
    bit<32> no_orders;
}

header index_snapshot_message_t {
    bit<64> orig_time;
    bit<16> channel_no;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> trading_phase_code;
    bit<64> pre_close_px;
    bit<64> num_trades;
    bit<64> total_volume_trade;
    bit<64> total_value_trade;
    bit<32> no_md_entries;
}

header index_snapshot_message_index_md_entries_t {
    bit<16> md_entry_type;
    bit<64> md_entry_px;
}

header bond_spot_matching_large_order_tick_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transact_time;
    bit<8> ord_type;
    bit<8> settl_type;
    bit<8> settl_period;
}

header agreement_trading_order_tick_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transact_time;
    bit<32> confirm_id;
}

header securities_lending_order_tick_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> price;
    bit<64> order_qty;
    bit<8> side;
    bit<64> transact_time;
    bit<16> expiration_days;
    bit<8> expiration_type;
}

header bond_spot_matching_large_trade_tick_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> bid_appl_seq_num;
    bit<64> ask_appl_seq_num;
    bit<64> trade_price;
    bit<64> trade_qty;
    bit<64> trade_money;
    bit<8> exec_type;
    bit<64> transact_time;
    bit<8> settl_period;
    bit<8> settl_type;
}

header bond_spot_negotiated_trade_tick_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> bid_appl_seq_num;
    bit<64> ask_appl_seq_num;
    bit<64> trade_price;
    bit<64> trade_qty;
    bit<64> trade_money;
    bit<8> exec_type;
    bit<64> transact_time;
    bit<8> settl_period;
    bit<8> settl_type;
}

header securities_lending_trade_tick_message_t {
    bit<16> channel_no;
    bit<64> appl_seq_num;
    bit<24> md_stream_id;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> bid_appl_seq_num;
    bit<64> ask_appl_seq_num;
    bit<64> trade_price;
    bit<64> trade_qty;
    bit<64> trade_money;
    bit<8> exec_type;
    bit<64> transact_time;
}

header announcement_message_raw_data_t {
    varbit<2048> raw_data;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> snapshot_channel_statistics_message_md_stream_i_ds_remaining;
    bit<32> security_real_time_status_message_switch_remaining;
    bit<32> bond_spot_trading_snapshot_message_md_entries_remaining;
    bit<32> bond_spot_trading_snapshot_message_sub_trading_phase_codes_remaining;
    bit<32> auction_trading_snapshot_message_md_entries_remaining;
    bit<32> index_snapshot_message_index_md_entries_remaining;
}

struct headers_t {
    message_header_t message_header;
    logon_message_t logon_message;
    logout_message_t logout_message;
    channel_heartbeat_message_t channel_heartbeat_message;
    retransmission_message_t retransmission_message;
    snapshot_channel_statistics_message_t snapshot_channel_statistics_message;
    snapshot_channel_statistics_message_md_stream_i_ds_t snapshot_channel_statistics_message_md_stream_i_ds[MAX_MESSAGES];
    business_reject_message_t business_reject_message;
    security_real_time_status_message_t security_real_time_status_message;
    security_real_time_status_message_switch_t security_real_time_status_message_switch[MAX_MESSAGES];
    announcement_message_t announcement_message;
    bond_spot_trading_snapshot_message_t bond_spot_trading_snapshot_message;
    bond_spot_trading_snapshot_message_md_entries_t bond_spot_trading_snapshot_message_md_entries[MAX_MESSAGES];
    bond_spot_trading_snapshot_message_sub_trading_phase_codes_header_t bond_spot_trading_snapshot_message_sub_trading_phase_codes_header;
    bond_spot_trading_snapshot_message_sub_trading_phase_codes_t bond_spot_trading_snapshot_message_sub_trading_phase_codes[MAX_MESSAGES];
    auction_trading_snapshot_message_t auction_trading_snapshot_message;
    auction_trading_snapshot_message_md_entries_t auction_trading_snapshot_message_md_entries[MAX_MESSAGES];
    index_snapshot_message_t index_snapshot_message;
    index_snapshot_message_index_md_entries_t index_snapshot_message_index_md_entries[MAX_MESSAGES];
    bond_spot_matching_large_order_tick_message_t bond_spot_matching_large_order_tick_message;
    agreement_trading_order_tick_message_t agreement_trading_order_tick_message;
    securities_lending_order_tick_message_t securities_lending_order_tick_message;
    bond_spot_matching_large_trade_tick_message_t bond_spot_matching_large_trade_tick_message;
    bond_spot_negotiated_trade_tick_message_t bond_spot_negotiated_trade_tick_message;
    securities_lending_trade_tick_message_t securities_lending_trade_tick_message;
    announcement_message_raw_data_t announcement_message_raw_data;
}

parser NeeqsecuritiesTcpmarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            32w1: parse_logon_message;
            32w2: parse_logout_message;
            32w3: parse_heartbeat_message;
            32w301000: parse_channel_heartbeat_message;
            32w302000: parse_retransmission_message;
            32w303000: parse_snapshot_channel_statistics_message;
            32w8: parse_business_reject_message;
            32w304000: parse_security_real_time_status_message;
            32w305000: parse_announcement_message;
            32w306001: parse_bond_spot_trading_snapshot_message;
            32w306002: parse_auction_trading_snapshot_message;
            32w306003: parse_index_snapshot_message;
            32w307011: parse_bond_spot_matching_large_order_tick_message;
            32w307021: parse_agreement_trading_order_tick_message;
            32w307023: parse_securities_lending_order_tick_message;
            32w308011: parse_bond_spot_matching_large_trade_tick_message;
            32w308012: parse_bond_spot_negotiated_trade_tick_message;
            32w308023: parse_securities_lending_trade_tick_message;
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

    state parse_retransmission_message {
        packet.extract(hdr.retransmission_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_channel_statistics_message {
        packet.extract(hdr.snapshot_channel_statistics_message);
        meta.dispatched = 1;
        meta.snapshot_channel_statistics_message_md_stream_i_ds_remaining = hdr.snapshot_channel_statistics_message.no_md_stream_id;
        transition select(meta.snapshot_channel_statistics_message_md_stream_i_ds_remaining) {
            32w0: accept;
            default: parse_snapshot_channel_statistics_message_md_stream_i_ds;
        }
    }

    state parse_snapshot_channel_statistics_message_md_stream_i_ds {
        packet.extract(hdr.snapshot_channel_statistics_message_md_stream_i_ds.next);
        meta.snapshot_channel_statistics_message_md_stream_i_ds_remaining = meta.snapshot_channel_statistics_message_md_stream_i_ds_remaining - 1;
        transition select(meta.snapshot_channel_statistics_message_md_stream_i_ds_remaining) {
            32w0: accept;
            default: parse_snapshot_channel_statistics_message_md_stream_i_ds;
        }
    }

    state parse_business_reject_message {
        packet.extract(hdr.business_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_real_time_status_message {
        packet.extract(hdr.security_real_time_status_message);
        meta.dispatched = 1;
        meta.security_real_time_status_message_switch_remaining = hdr.security_real_time_status_message.no_switch;
        transition select(meta.security_real_time_status_message_switch_remaining) {
            32w0: accept;
            default: parse_security_real_time_status_message_switch;
        }
    }

    state parse_security_real_time_status_message_switch {
        packet.extract(hdr.security_real_time_status_message_switch.next);
        meta.security_real_time_status_message_switch_remaining = meta.security_real_time_status_message_switch_remaining - 1;
        transition select(meta.security_real_time_status_message_switch_remaining) {
            32w0: accept;
            default: parse_security_real_time_status_message_switch;
        }
    }

    state parse_announcement_message {
        packet.extract(hdr.announcement_message);
        meta.dispatched = 1;
        packet.extract(hdr.announcement_message_raw_data, (bit<32>)hdr.announcement_message.raw_data_length * 8);
        transition accept;
    }

    state parse_bond_spot_trading_snapshot_message {
        packet.extract(hdr.bond_spot_trading_snapshot_message);
        meta.dispatched = 1;
        meta.bond_spot_trading_snapshot_message_md_entries_remaining = hdr.bond_spot_trading_snapshot_message.no_md_entries;
        transition select(meta.bond_spot_trading_snapshot_message_md_entries_remaining) {
            32w0: read_bond_spot_trading_snapshot_message_sub_trading_phase_codes;
            default: parse_bond_spot_trading_snapshot_message_md_entries;
        }
    }

    state parse_bond_spot_trading_snapshot_message_md_entries {
        packet.extract(hdr.bond_spot_trading_snapshot_message_md_entries.next);
        meta.bond_spot_trading_snapshot_message_md_entries_remaining = meta.bond_spot_trading_snapshot_message_md_entries_remaining - 1;
        transition select(meta.bond_spot_trading_snapshot_message_md_entries_remaining) {
            32w0: read_bond_spot_trading_snapshot_message_sub_trading_phase_codes;
            default: parse_bond_spot_trading_snapshot_message_md_entries;
        }
    }

    state read_bond_spot_trading_snapshot_message_sub_trading_phase_codes {
        packet.extract(hdr.bond_spot_trading_snapshot_message_sub_trading_phase_codes_header);
        meta.bond_spot_trading_snapshot_message_sub_trading_phase_codes_remaining = hdr.bond_spot_trading_snapshot_message_sub_trading_phase_codes_header.no_sub_trading_phase_codes;
        transition select(meta.bond_spot_trading_snapshot_message_sub_trading_phase_codes_remaining) {
            32w0: accept;
            default: parse_bond_spot_trading_snapshot_message_sub_trading_phase_codes;
        }
    }

    state parse_bond_spot_trading_snapshot_message_sub_trading_phase_codes {
        packet.extract(hdr.bond_spot_trading_snapshot_message_sub_trading_phase_codes.next);
        meta.bond_spot_trading_snapshot_message_sub_trading_phase_codes_remaining = meta.bond_spot_trading_snapshot_message_sub_trading_phase_codes_remaining - 1;
        transition select(meta.bond_spot_trading_snapshot_message_sub_trading_phase_codes_remaining) {
            32w0: accept;
            default: parse_bond_spot_trading_snapshot_message_sub_trading_phase_codes;
        }
    }

    state parse_auction_trading_snapshot_message {
        packet.extract(hdr.auction_trading_snapshot_message);
        meta.dispatched = 1;
        meta.auction_trading_snapshot_message_md_entries_remaining = hdr.auction_trading_snapshot_message.no_md_entries;
        transition select(meta.auction_trading_snapshot_message_md_entries_remaining) {
            32w0: accept;
            default: parse_auction_trading_snapshot_message_md_entries;
        }
    }

    state parse_auction_trading_snapshot_message_md_entries {
        packet.extract(hdr.auction_trading_snapshot_message_md_entries.next);
        meta.auction_trading_snapshot_message_md_entries_remaining = meta.auction_trading_snapshot_message_md_entries_remaining - 1;
        transition select(meta.auction_trading_snapshot_message_md_entries_remaining) {
            32w0: accept;
            default: parse_auction_trading_snapshot_message_md_entries;
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

    state parse_bond_spot_matching_large_order_tick_message {
        packet.extract(hdr.bond_spot_matching_large_order_tick_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_agreement_trading_order_tick_message {
        packet.extract(hdr.agreement_trading_order_tick_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_securities_lending_order_tick_message {
        packet.extract(hdr.securities_lending_order_tick_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_matching_large_trade_tick_message {
        packet.extract(hdr.bond_spot_matching_large_trade_tick_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_negotiated_trade_tick_message {
        packet.extract(hdr.bond_spot_negotiated_trade_tick_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_securities_lending_trade_tick_message {
        packet.extract(hdr.securities_lending_trade_tick_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NeeqsecuritiesTcpmarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NeeqsecuritiesTcpmarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NeeqsecuritiesTcpmarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NeeqsecuritiesTcpmarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NeeqsecuritiesTcpmarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.channel_heartbeat_message);
        packet.emit(hdr.retransmission_message);
        packet.emit(hdr.snapshot_channel_statistics_message);
        packet.emit(hdr.snapshot_channel_statistics_message_md_stream_i_ds);
        packet.emit(hdr.business_reject_message);
        packet.emit(hdr.security_real_time_status_message);
        packet.emit(hdr.security_real_time_status_message_switch);
        packet.emit(hdr.announcement_message);
        packet.emit(hdr.announcement_message_raw_data);
        packet.emit(hdr.bond_spot_trading_snapshot_message);
        packet.emit(hdr.bond_spot_trading_snapshot_message_md_entries);
        packet.emit(hdr.bond_spot_trading_snapshot_message_sub_trading_phase_codes_header);
        packet.emit(hdr.bond_spot_trading_snapshot_message_sub_trading_phase_codes);
        packet.emit(hdr.auction_trading_snapshot_message);
        packet.emit(hdr.auction_trading_snapshot_message_md_entries);
        packet.emit(hdr.index_snapshot_message);
        packet.emit(hdr.index_snapshot_message_index_md_entries);
        packet.emit(hdr.bond_spot_matching_large_order_tick_message);
        packet.emit(hdr.agreement_trading_order_tick_message);
        packet.emit(hdr.securities_lending_order_tick_message);
        packet.emit(hdr.bond_spot_matching_large_trade_tick_message);
        packet.emit(hdr.bond_spot_negotiated_trade_tick_message);
        packet.emit(hdr.securities_lending_trade_tick_message);
    }
}

V1Switch(
    NeeqsecuritiesTcpmarketdataParser(),
    NeeqsecuritiesTcpmarketdataVerifyChecksum(),
    NeeqsecuritiesTcpmarketdataIngress(),
    NeeqsecuritiesTcpmarketdataEgress(),
    NeeqsecuritiesTcpmarketdataComputeChecksum(),
    NeeqsecuritiesTcpmarketdataDeparser()
) main;
