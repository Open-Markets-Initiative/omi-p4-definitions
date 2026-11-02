// P4_16 (v1model) definition for: Aquis Snapshot Amd v1.2.3
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Snapshot
//   Encoding: Aquis Market Data Protocol
//   Version: 1.2.3
//   Date: 4/23/2024
//   Specification: Aquis Stock Exchange Multicast Market Data Specification v1.2.3 (2024).pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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
    bit<8> message_count;
}

header packet_header_message_t {
    bit<8> msg_type;
    bit<8> msg_length;
    bit<32> seq_no;
}

header snapshot_start_message_t {
    bit<32> stream_seq_no;
    bit<16> security_count;
    bit<64> timestamp;
}

header book_status_message_t {
    bit<16> security_id;
    bit<8> trading_status;
    bit<4> unused_4;
    bit<1> pre_open_close;
    bit<2> unused_2;
    bit<1> trading;
    bit<16> entries;
    bit<32> closing_buy_qty;
    bit<32> closing_sell_qty;
    bit<64> indicative_price;
}

header book_entry_message_t {
    bit<16> security_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    snapshot_start_message_t snapshot_start_message[MAX_MESSAGES];
    book_status_message_t book_status_message[MAX_MESSAGES];
    book_entry_message_t book_entry_message[MAX_MESSAGES];
}

parser AquisstockexchangeSnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.msg_type) {
            8w10: parse_snapshot_start_message;
            8w11: parse_book_status_message;
            8w12: parse_book_entry_message;
            default: accept;
        }
    }

    state parse_snapshot_start_message {
        packet.extract(hdr.snapshot_start_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_book_status_message {
        packet.extract(hdr.book_status_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_book_entry_message {
        packet.extract(hdr.book_entry_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control AquisstockexchangeSnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisstockexchangeSnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AquisstockexchangeSnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisstockexchangeSnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisstockexchangeSnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.snapshot_start_message);
        packet.emit(hdr.book_status_message);
        packet.emit(hdr.book_entry_message);
    }
}

V1Switch(
    AquisstockexchangeSnapshotParser(),
    AquisstockexchangeSnapshotVerifyChecksum(),
    AquisstockexchangeSnapshotIngress(),
    AquisstockexchangeSnapshotEgress(),
    AquisstockexchangeSnapshotComputeChecksum(),
    AquisstockexchangeSnapshotDeparser()
) main;
