// P4_16 (v1model) definition for: Moex Spectra OrdersLogSnapshot Simba v9.12.0
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: SIMBA Spectra Orders Log Snapshot
//   Encoding: SIMBA
//   Version: 9.12.0
//   Date: 10/19/2026
//   Specification: MOEX Spectra SIMBA Market Data (SBE) (9.12.0).pdf
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

header market_data_packet_header_t {
    bit<32> msg_seq_num;
    bit<16> msg_size;
    bit<16> msg_flags;
    bit<64> sending_time;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header order_book_snapshot_message_t {
    bit<32> security_id;
    bit<32> last_msg_seq_num_processed_u_int_32;
    bit<32> rpt_seq;
    bit<32> exchange_trading_session_id;
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_t {
    bit<64> md_entry_id_int_64_null_optional;
    bit<64> transact_time;
    bit<64> md_entry_px_decimal_5_null_optional;
    bit<64> md_entry_size_int_64_null_optional;
    bit<64> trade_id_int_64_null_optional;
    bit<64> md_flags;
    bit<64> md_flags_2;
    bit<8> md_entry_type;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_remaining;
}

struct headers_t {
    market_data_packet_header_t market_data_packet_header;
    sequence_reset_message_t sequence_reset_message;
    order_book_snapshot_message_t order_book_snapshot_message;
    order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_t order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group[MAX_MESSAGES];
}

parser SpectraOrderslogsnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.market_data_packet_header);
        transition select(hdr.market_data_packet_header.template_id) {
            16w0x100: parse_heartbeat_message;
            16w0x200: parse_sequence_reset_message;
            16w0x1100: parse_order_book_snapshot_message;
            default: accept;
        }
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_snapshot_message {
        packet.extract(hdr.order_book_snapshot_message);
        meta.dispatched = 1;
        meta.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_remaining = hdr.order_book_snapshot_message.num_in_group_uint_8;
        transition select(meta.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_remaining) {
            8w0: accept;
            default: parse_order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group;
        }
    }

    state parse_order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group {
        packet.extract(hdr.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group.next);
        meta.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_remaining = meta.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_remaining - 1;
        transition select(meta.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group_remaining) {
            8w0: accept;
            default: parse_order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group;
        }
    }

}

control SpectraOrderslogsnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderslogsnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraOrderslogsnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraOrderslogsnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderslogsnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.market_data_packet_header);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.order_book_snapshot_message);
        packet.emit(hdr.order_book_snapshot_message_order_book_snapshot_message_no_m_d_entries_group);
    }
}

V1Switch(
    SpectraOrderslogsnapshotParser(),
    SpectraOrderslogsnapshotVerifyChecksum(),
    SpectraOrderslogsnapshotIngress(),
    SpectraOrderslogsnapshotEgress(),
    SpectraOrderslogsnapshotComputeChecksum(),
    SpectraOrderslogsnapshotDeparser()
) main;
