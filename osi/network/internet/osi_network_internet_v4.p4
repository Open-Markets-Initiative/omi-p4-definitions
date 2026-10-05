// P4_16 (v1model) definition for: Osi Network Internet Ip v4
// 
// Protocol:
//   Organization: Open Systems Interconnection
//   Protocol: Internet
//   Encoding: Internet Protocol
//   Version: 4
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

header version_and_header_length_t {
    bit<4> ip_header_length;
    bit<4> ip_version;
    bit<2> congestion_notification;
    bit<6> differentiated_services;
    bit<16> total_length;
    bit<16> identification;
    bit<13> fragment_offset;
    bit<1> more_fragments;
    bit<1> dont_fragment;
    bit<1> ip_reserved;
    bit<8> time_to_live;
    bit<8> ip_protocol;
    bit<16> ip_header_checksum;
    bit<32> source_address;
    bit<32> destination_address;
}

header version_and_header_length_ip_options_t {
    varbit<2048> ip_options;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    version_and_header_length_t version_and_header_length;
    version_and_header_length_ip_options_t version_and_header_length_ip_options;
}

parser OsiNetworkInternetParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.version_and_header_length);
        packet.extract(hdr.version_and_header_length_ip_options, (bit<32>)hdr.version_and_header_length.ip_header_length * 8);
        transition accept;
    }

}

control OsiNetworkInternetVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkInternetIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control OsiNetworkInternetEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsiNetworkInternetComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkInternetDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.version_and_header_length);
        packet.emit(hdr.version_and_header_length_ip_options);
    }
}

V1Switch(
    OsiNetworkInternetParser(),
    OsiNetworkInternetVerifyChecksum(),
    OsiNetworkInternetIngress(),
    OsiNetworkInternetEgress(),
    OsiNetworkInternetComputeChecksum(),
    OsiNetworkInternetDeparser()
) main;
