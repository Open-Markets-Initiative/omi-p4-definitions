// P4_16 (v1model) definition for: Gpw Wse ReplayFullDepth Wats v1.7.6.20
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: Warsaw Stock Exchange Full Depth Replay
//   Encoding: Warsaw Automated Trading System
//   Version: 1.7.6.20
//   Date: 10/05/2026
//   Specification: GPW_WATS_3.01_Market_Data_Protocol_v1.7.6.20.pdf
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

header replay_request_header_t {
    bit<16> replay_message_length;
    bit<16> replay_message_type;
}

header replay_request_t {
    bit<32> seq_num;
    bit<32> end_seq_num;
    bit<8> stream_id;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    replay_request_header_t replay_request_header;
    replay_request_t replay_request;
}

parser WseReplayfulldepthReplayrequestParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.replay_request_header);
        transition select(hdr.replay_request_header.replay_message_type) {
            16w0x100: parse_replay_request;
            default: accept;
        }
    }

    state parse_replay_request {
        packet.extract(hdr.replay_request);
        meta.dispatched = 1;
        transition accept;
    }

}

control WseReplayfulldepthReplayrequestVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseReplayfulldepthReplayrequestIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control WseReplayfulldepthReplayrequestEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control WseReplayfulldepthReplayrequestComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseReplayfulldepthReplayrequestDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.replay_request_header);
        packet.emit(hdr.replay_request);
    }
}

V1Switch(
    WseReplayfulldepthReplayrequestParser(),
    WseReplayfulldepthReplayrequestVerifyChecksum(),
    WseReplayfulldepthReplayrequestIngress(),
    WseReplayfulldepthReplayrequestEgress(),
    WseReplayfulldepthReplayrequestComputeChecksum(),
    WseReplayfulldepthReplayrequestDeparser()
) main;
