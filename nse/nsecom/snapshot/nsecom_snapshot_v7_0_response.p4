// P4_16 (v1model) definition for: Nse NseCom Snapshot Binary v7.0
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Mtbt Order Book Snapshot Recovery
//   Encoding: Binary
//   Version: 7.0
//   Date: 8/1/2026
//   Specification: MTBT_CO_NNF_PROTOCOL_7.0_20260817172111.pdf
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

header stream_header_t {
    bit<16> message_length;
    bit<16> stream_id;
    bit<32> sequence_number;
    bit<8> response_message_type;
}

header order_book_snapshot_recovery_response_message_t {
    bit<8> request_status;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    stream_header_t stream_header;
    order_book_snapshot_recovery_response_message_t order_book_snapshot_recovery_response_message;
}

parser NsecomSnapshotResponseParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.stream_header);
        transition select(hdr.stream_header.response_message_type) {
            8w0x42: parse_order_book_snapshot_recovery_response_message;
            default: accept;
        }
    }

    state parse_order_book_snapshot_recovery_response_message {
        packet.extract(hdr.order_book_snapshot_recovery_response_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecomSnapshotResponseVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecomSnapshotResponseIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecomSnapshotResponseEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecomSnapshotResponseComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecomSnapshotResponseDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.stream_header);
        packet.emit(hdr.order_book_snapshot_recovery_response_message);
    }
}

V1Switch(
    NsecomSnapshotResponseParser(),
    NsecomSnapshotResponseVerifyChecksum(),
    NsecomSnapshotResponseIngress(),
    NsecomSnapshotResponseEgress(),
    NsecomSnapshotResponseComputeChecksum(),
    NsecomSnapshotResponseDeparser()
) main;
