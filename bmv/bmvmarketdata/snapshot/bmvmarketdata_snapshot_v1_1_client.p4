// P4_16 (v1model) definition for: Bmv BmvMarketData Snapshot Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Snapshot
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Connection_Appendix_6.pdf
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

header client_message_header_t {
    bit<8> client_length;
    bit<8> client_message_type;
}

header login_message_t {
    bit<8> market_data_group;
    bit<48> user;
    bit<80> password;
}

header replay_request_message_t {
    bit<8> market_data_group;
    bit<32> first_message;
    bit<16> quantity;
}

header snapshot_request_message_t {
    bit<8> market_data_group;
    bit<32> instrument_id;
    bit<8> snapshot_type;
}

header snapshot_indices_request_message_t {
    bit<8> market_data_group;
    bit<16> component;
    bit<64> recovery_hour;
}

header snapshot_consolidated_feed_request_message_t {
    bit<8> market_data_group;
    bit<32> instrument_id;
    bit<8> snapshot_type;
    bit<8> origin;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_message_header_t client_message_header;
    login_message_t login_message;
    replay_request_message_t replay_request_message;
    snapshot_request_message_t snapshot_request_message;
    snapshot_indices_request_message_t snapshot_indices_request_message;
    snapshot_consolidated_feed_request_message_t snapshot_consolidated_feed_request_message;
}

parser BmvmarketdataSnapshotClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_message_header);
        transition select(hdr.client_message_header.client_message_type) {
            8w0x21: parse_login_message;
            8w0x23: parse_replay_request_message;
            8w0x24: parse_snapshot_request_message;
            8w0x2D: parse_snapshot_indices_request_message;
            8w0x5F: parse_snapshot_consolidated_feed_request_message;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_request_message {
        packet.extract(hdr.snapshot_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_indices_request_message {
        packet.extract(hdr.snapshot_indices_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_consolidated_feed_request_message {
        packet.extract(hdr.snapshot_consolidated_feed_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataSnapshotClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataSnapshotClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataSnapshotClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataSnapshotClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataSnapshotClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_message_header);
        packet.emit(hdr.login_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.snapshot_request_message);
        packet.emit(hdr.snapshot_indices_request_message);
        packet.emit(hdr.snapshot_consolidated_feed_request_message);
    }
}

V1Switch(
    BmvmarketdataSnapshotClientParser(),
    BmvmarketdataSnapshotClientVerifyChecksum(),
    BmvmarketdataSnapshotClientIngress(),
    BmvmarketdataSnapshotClientEgress(),
    BmvmarketdataSnapshotClientComputeChecksum(),
    BmvmarketdataSnapshotClientDeparser()
) main;
