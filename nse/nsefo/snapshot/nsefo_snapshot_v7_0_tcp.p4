// P4_16 (v1model) definition for: Nse NseFo Snapshot Binary v7.0
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Mtbt Order Book Snapshot Recovery
//   Encoding: Binary
//   Version: 7.0
//   Date: 8/1/2026
//   Specification: MTBT_FO_NNF_PROTOCOL_7.0_20260817172155.pdf
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

header snapshot_header_t {
    bit<16> trans_code;
    bit<32> size;
    bit<32> number_of_records;
    bit<32> last_sequence_number;
    bit<16> stream_id;
    bit<8> message_type;
}

header new_order_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header new_spread_order_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    snapshot_header_t snapshot_header;
    new_order_message_t new_order_message;
    new_spread_order_message_t new_spread_order_message;
}

parser NsefoSnapshotTcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.snapshot_header);
        transition select(hdr.snapshot_header.message_type) {
            8w0x4e: parse_new_order_message;
            8w0x47: parse_new_spread_order_message;
            default: accept;
        }
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_spread_order_message {
        packet.extract(hdr.new_spread_order_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsefoSnapshotTcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoSnapshotTcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsefoSnapshotTcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsefoSnapshotTcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoSnapshotTcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.snapshot_header);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.new_spread_order_message);
    }
}

V1Switch(
    NsefoSnapshotTcpParser(),
    NsefoSnapshotTcpVerifyChecksum(),
    NsefoSnapshotTcpIngress(),
    NsefoSnapshotTcpEgress(),
    NsefoSnapshotTcpComputeChecksum(),
    NsefoSnapshotTcpDeparser()
) main;
