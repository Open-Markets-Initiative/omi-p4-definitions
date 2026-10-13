// P4_16 (v1model) definition for: Szse SzseSecurities MulticastMarketData SzseBinary v1.17
// 
// Protocol:
//   Organization: Shenzhen Stock Exchange
//   Protocol: Szse Multicast Market Data
//   Encoding: Szse Binary Market Data Feed
//   Version: 1.17
//   Date: 04/01/2025
//   Specification: SZSE Interface Specification of BINARY Market Data Feed (Ver1.17).pdf
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
    bit<8> protocol;
    bit<8> version;
    bit<8> header_size;
    bit<8> sender_id;
    bit<16> mddp_market_id;
    bit<16> channel;
    bit<64> seq_num;
    bit<16> msg_count;
    bit<7> reserved_06;
    bit<1> msg_header;
    bit<2> encryption;
    bit<2> compress;
    bit<1> resend_by_seq_num;
    bit<2> packet_type;
    bit<1> poss_dup_flag;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
}

parser SzsesecuritiesMulticastmarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.channel) {
            16w0: parse_multicast_heartbeat;
            16w65535: parse_data_flow_end;
            default: parse_message_block;
        }
    }

    state parse_multicast_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_data_flow_end {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_block {
        transition accept;
    }

}

control SzsesecuritiesMulticastmarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SzsesecuritiesMulticastmarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SzsesecuritiesMulticastmarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SzsesecuritiesMulticastmarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SzsesecuritiesMulticastmarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
    }
}

V1Switch(
    SzsesecuritiesMulticastmarketdataParser(),
    SzsesecuritiesMulticastmarketdataVerifyChecksum(),
    SzsesecuritiesMulticastmarketdataIngress(),
    SzsesecuritiesMulticastmarketdataEgress(),
    SzsesecuritiesMulticastmarketdataComputeChecksum(),
    SzsesecuritiesMulticastmarketdataDeparser()
) main;
