// P4_16 (v1model) definition for: Aquis AquisEquities Snapshot Amd v4.1
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Aquis Market Data Snapshot
//   Encoding: Aquis Market Data Protocol
//   Version: 4.1
//   Date: 1/1/2026
//   Specification: Unknown
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
    bit<8> message_count;
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
    bit<1> trading;
    bit<1> mac_open;
    bit<1> mac_run;
    bit<5> reserved;
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

header ma_c_book_entry_message_t {
    bit<16> security_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    snapshot_start_message_t snapshot_start_message;
    book_status_message_t book_status_message;
    book_entry_message_t book_entry_message;
    ma_c_book_entry_message_t ma_c_book_entry_message;
}

parser AquisequitiesSnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w10: parse_snapshot_start_message;
            8w11: parse_book_status_message;
            8w12: parse_book_entry_message;
            8w18: parse_ma_c_book_entry_message;
            default: accept;
        }
    }

    state parse_snapshot_start_message {
        packet.extract(hdr.snapshot_start_message);
        transition accept;
    }

    state parse_book_status_message {
        packet.extract(hdr.book_status_message);
        transition accept;
    }

    state parse_book_entry_message {
        packet.extract(hdr.book_entry_message);
        transition accept;
    }

    state parse_ma_c_book_entry_message {
        packet.extract(hdr.ma_c_book_entry_message);
        transition accept;
    }

}

control AquisequitiesSnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesSnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AquisequitiesSnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisequitiesSnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesSnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.snapshot_start_message);
        packet.emit(hdr.book_status_message);
        packet.emit(hdr.book_entry_message);
        packet.emit(hdr.ma_c_book_entry_message);
    }
}

V1Switch(
    AquisequitiesSnapshotParser(),
    AquisequitiesSnapshotVerifyChecksum(),
    AquisequitiesSnapshotIngress(),
    AquisequitiesSnapshotEgress(),
    AquisequitiesSnapshotComputeChecksum(),
    AquisequitiesSnapshotDeparser()
) main;
