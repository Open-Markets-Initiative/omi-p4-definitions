// P4_16 (v1model) definition for: Osi Network Transport Tcp v1
// 
// Protocol:
//   Organization: Open Systems Interconnection
//   Protocol: Transport
//   Encoding: Transmission Control Protocol
//   Version: 1
//   Date: 10/5/2026
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

header offset_and_flags_t {
    bit<16> tcp_source_port;
    bit<16> tcp_destination_port;
    bit<32> tcp_sequence_number;
    bit<32> acknowledgment_number;
    bit<1> fin_flag;
    bit<1> syn_flag;
    bit<1> rst_flag;
    bit<1> psh_flag;
    bit<1> ack_flag;
    bit<1> urg_flag;
    bit<1> ece_flag;
    bit<1> cwr_flag;
    bit<1> ns_flag;
    bit<3> tcp_reserved;
    bit<4> data_offset;
    bit<16> window_size;
    bit<16> tcp_checksum;
    bit<16> urgent_pointer;
}

header offset_and_flags_tcp_options_t {
    varbit<2048> tcp_options;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    offset_and_flags_t offset_and_flags;
    offset_and_flags_tcp_options_t offset_and_flags_tcp_options;
}

parser OsiNetworkTransportParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.offset_and_flags);
        packet.extract(hdr.offset_and_flags_tcp_options, (bit<32>)hdr.offset_and_flags.data_offset * 8);
        transition accept;
    }

}

control OsiNetworkTransportVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkTransportIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control OsiNetworkTransportEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsiNetworkTransportComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkTransportDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.offset_and_flags);
        packet.emit(hdr.offset_and_flags_tcp_options);
    }
}

V1Switch(
    OsiNetworkTransportParser(),
    OsiNetworkTransportVerifyChecksum(),
    OsiNetworkTransportIngress(),
    OsiNetworkTransportEgress(),
    OsiNetworkTransportComputeChecksum(),
    OsiNetworkTransportDeparser()
) main;
