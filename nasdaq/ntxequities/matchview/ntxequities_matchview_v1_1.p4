// P4_16 (v1model) definition for: Nasdaq NtxEquities MatchView Itch v1.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Match View
//   Encoding: Itch
//   Version: 1.1
//   Date: 02/13/2026
//   Specification: NTXMatchView_v1_1.pdf
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

header packet_header_t {
    bit<80> session;
    bit<32> sequence;
    bit<16> count;
}

header message_t {
    bit<16> length;
    bit<64> timestamp;
    bit<8> message_type;
}

header quote_update_message_t {
    bit<64> stock;
    bit<80> bid_price;
    bit<80> ask_price;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    quote_update_message_t quote_update_message[MAX_MESSAGES];
}

parser NtxequitiesMatchviewParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.count) {
            16w0x0: parse_heartbeat;
            16w0xffff: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x55: parse_quote_update_message;
            default: accept;
        }
    }

    state parse_quote_update_message {
        packet.extract(hdr.quote_update_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NtxequitiesMatchviewVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxequitiesMatchviewIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NtxequitiesMatchviewEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NtxequitiesMatchviewComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxequitiesMatchviewDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.quote_update_message);
    }
}

V1Switch(
    NtxequitiesMatchviewParser(),
    NtxequitiesMatchviewVerifyChecksum(),
    NtxequitiesMatchviewIngress(),
    NtxequitiesMatchviewEgress(),
    NtxequitiesMatchviewComputeChecksum(),
    NtxequitiesMatchviewDeparser()
) main;
