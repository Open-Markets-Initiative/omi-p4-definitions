// P4_16 (v1model) definition for: Memx MemxEquities CommonHeader Udp v1.1
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Common Header
//   Encoding: User Datagram Protocol
//   Version: 1.1
//   Date: 2025-10-23
//   Specification: MEMX-UDP-v1_1.pdf
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

header common_header_t {
    bit<8> message_type;
    bit<8> header_length;
    bit<64> session_id;
    bit<64> sequence_number;
}

header sequenced_message_t {
    bit<16> message_count;
}

header sequenced_message_message_t {
    bit<16> message_length;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> sequenced_message_message_remaining;
}

struct headers_t {
    common_header_t common_header;
    sequenced_message_t sequenced_message;
    sequenced_message_message_t sequenced_message_message[MAX_MESSAGES];
}

parser MemxequitiesCommonheaderParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w0: parse_heartbeat;
            8w1: parse_session_shutdown;
            8w2: parse_sequenced_message;
            default: accept;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_shutdown {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_message {
        packet.extract(hdr.sequenced_message);
        meta.dispatched = 1;
        meta.sequenced_message_message_remaining = hdr.sequenced_message.message_count;
        transition select(meta.sequenced_message_message_remaining) {
            16w0: accept;
            default: parse_sequenced_message_message;
        }
    }

    state parse_sequenced_message_message {
        packet.extract(hdr.sequenced_message_message.next);
        meta.sequenced_message_message_remaining = meta.sequenced_message_message_remaining - 1;
        transition select(meta.sequenced_message_message_remaining) {
            16w0: accept;
            default: parse_sequenced_message_message;
        }
    }

}

control MemxequitiesCommonheaderVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesCommonheaderIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control MemxequitiesCommonheaderEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxequitiesCommonheaderComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesCommonheaderDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.sequenced_message_message);
    }
}

V1Switch(
    MemxequitiesCommonheaderParser(),
    MemxequitiesCommonheaderVerifyChecksum(),
    MemxequitiesCommonheaderIngress(),
    MemxequitiesCommonheaderEgress(),
    MemxequitiesCommonheaderComputeChecksum(),
    MemxequitiesCommonheaderDeparser()
) main;
