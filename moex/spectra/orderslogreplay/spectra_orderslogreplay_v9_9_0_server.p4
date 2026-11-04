// P4_16 (v1model) definition for: Moex Spectra OrdersLogReplay Simba v9.9.0
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: SIMBA Spectra Orders Log Historical Replay
//   Encoding: SIMBA
//   Version: 9.9.0
//   Date: 07/16/2026
//   Specification: MOEX Spectra SIMBA Market Data (SBE) (9.9.0).pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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

header msg_flags_t {
    bit<32> msg_seq_num;
    bit<16> msg_size;
    bit<16> msg_flags;
    bit<64> sending_time;
}

header server_session_t {
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header logout_message_t {
    bit<2048> text;
}

header server_replay_t {
    bit<64> transact_time;
    bit<32> exchange_trading_session_id;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header best_prices_message_t {
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header best_prices_message_best_prices_message_no_m_d_entries_group_t {
    bit<64> mkt_bid_px;
    bit<64> mkt_offer_px;
    bit<64> mkt_bid_size;
    bit<64> mkt_offer_size;
    bit<32> security_id;
}

header empty_book_message_t {
    bit<32> last_msg_seq_num_processed_u_int_32_null_optional;
}

header order_update_message_t {
    bit<64> md_entry_id_int_64;
    bit<64> md_entry_px_decimal_5;
    bit<64> md_entry_size_int_64;
    bit<64> md_flags;
    bit<64> md_flags_2;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<8> md_update_action;
    bit<8> md_entry_type;
}

header order_execution_message_t {
    bit<64> md_entry_id_int_64;
    bit<64> md_entry_px_decimal_5_null_optional;
    bit<64> md_entry_size_int_64_null_optional;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> trade_id_int_64;
    bit<64> md_flags;
    bit<64> md_flags_2;
    bit<32> security_id;
    bit<32> rpt_seq;
    bit<8> md_update_action;
    bit<8> md_entry_type;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> best_prices_message_best_prices_message_no_m_d_entries_group_remaining;
}

struct headers_t {
    msg_flags_t msg_flags;
    server_session_t server_session;
    logout_message_t logout_message;
    server_replay_t server_replay;
    best_prices_message_t best_prices_message;
    best_prices_message_best_prices_message_no_m_d_entries_group_t best_prices_message_best_prices_message_no_m_d_entries_group[MAX_MESSAGES];
    empty_book_message_t empty_book_message;
    order_update_message_t order_update_message;
    order_execution_message_t order_execution_message;
}

parser SpectraOrderslogreplayServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.msg_flags);
        transition select(packet.lookahead<bit<1>>()) {
            1w0: parse_server_session;
            1w1: parse_server_replay;
            default: accept;
        }
    }

    state parse_server_session {
        packet.extract(hdr.server_session);
        meta.dispatched = 1;
        transition select(hdr.server_session.template_id) {
            16w0x100: parse_heartbeat_message;
            16w0xe803: parse_logon_message;
            16w0xe903: parse_logout_message;
            default: accept;
        }
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_replay {
        packet.extract(hdr.server_replay);
        meta.dispatched = 1;
        transition select(hdr.server_replay.template_id) {
            16w0x100: parse_heartbeat_message;
            16w0xe00: parse_best_prices_message;
            16w0x400: parse_empty_book_message;
            16w0xf00: parse_order_update_message;
            16w0x1000: parse_order_execution_message;
            default: accept;
        }
    }

    state parse_best_prices_message {
        packet.extract(hdr.best_prices_message);
        meta.dispatched = 1;
        meta.best_prices_message_best_prices_message_no_m_d_entries_group_remaining = hdr.best_prices_message.num_in_group_uint_8;
        transition select(meta.best_prices_message_best_prices_message_no_m_d_entries_group_remaining) {
            8w0: accept;
            default: parse_best_prices_message_best_prices_message_no_m_d_entries_group;
        }
    }

    state parse_best_prices_message_best_prices_message_no_m_d_entries_group {
        packet.extract(hdr.best_prices_message_best_prices_message_no_m_d_entries_group.next);
        meta.best_prices_message_best_prices_message_no_m_d_entries_group_remaining = meta.best_prices_message_best_prices_message_no_m_d_entries_group_remaining - 1;
        transition select(meta.best_prices_message_best_prices_message_no_m_d_entries_group_remaining) {
            8w0: accept;
            default: parse_best_prices_message_best_prices_message_no_m_d_entries_group;
        }
    }

    state parse_empty_book_message {
        packet.extract(hdr.empty_book_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_update_message {
        packet.extract(hdr.order_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_execution_message {
        packet.extract(hdr.order_execution_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SpectraOrderslogreplayServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderslogreplayServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraOrderslogreplayServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraOrderslogreplayServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderslogreplayServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.msg_flags);
        packet.emit(hdr.server_session);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.server_replay);
        packet.emit(hdr.best_prices_message);
        packet.emit(hdr.best_prices_message_best_prices_message_no_m_d_entries_group);
        packet.emit(hdr.empty_book_message);
        packet.emit(hdr.order_update_message);
        packet.emit(hdr.order_execution_message);
    }
}

V1Switch(
    SpectraOrderslogreplayServerParser(),
    SpectraOrderslogreplayServerVerifyChecksum(),
    SpectraOrderslogreplayServerIngress(),
    SpectraOrderslogreplayServerEgress(),
    SpectraOrderslogreplayServerComputeChecksum(),
    SpectraOrderslogreplayServerDeparser()
) main;
