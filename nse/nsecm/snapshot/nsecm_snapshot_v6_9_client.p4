// P4_16 (v1model) definition for: Nse NseCm Snapshot Binary v6.9
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Mtbt Order Book Snapshot Recovery
//   Encoding: Binary
//   Version: 6.9
//   Date: 4/1/2026
//   Specification: MTBT_CM_NNF_PROTOCOL_6_9_20260717161001.pdf
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
    bit<8> client_message_type;
}

header order_book_snapshot_recovery_request_message_t {
    bit<16> stream_id;
    bit<32> start_sequence_number;
    bit<32> end_sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    order_book_snapshot_recovery_request_message_t order_book_snapshot_recovery_request_message;
}

parser NsecmSnapshotClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.client_message_type) {
            8w0x4f: parse_order_book_snapshot_recovery_request_message;
            default: accept;
        }
    }

    state parse_order_book_snapshot_recovery_request_message {
        packet.extract(hdr.order_book_snapshot_recovery_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmSnapshotClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmSnapshotClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmSnapshotClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmSnapshotClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmSnapshotClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.order_book_snapshot_recovery_request_message);
    }
}

V1Switch(
    NsecmSnapshotClientParser(),
    NsecmSnapshotClientVerifyChecksum(),
    NsecmSnapshotClientIngress(),
    NsecmSnapshotClientEgress(),
    NsecmSnapshotClientComputeChecksum(),
    NsecmSnapshotClientDeparser()
) main;
