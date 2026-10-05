// P4_16 (v1model) definition for: Osi Network Link Ethernet v2
// 
// Protocol:
//   Organization: Open Systems Interconnection
//   Protocol: Link
//   Encoding: Ethernet
//   Version: 2
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

header vlan_tag_t {
    bit<48> destination_mac;
    bit<48> source_mac;
    bit<16> ether_type;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    vlan_tag_t vlan_tag;
}

parser OsiNetworkLinkParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.vlan_tag);
        transition accept;
    }

}

control OsiNetworkLinkVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkLinkIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control OsiNetworkLinkEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsiNetworkLinkComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsiNetworkLinkDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.vlan_tag);
    }
}

V1Switch(
    OsiNetworkLinkParser(),
    OsiNetworkLinkVerifyChecksum(),
    OsiNetworkLinkIngress(),
    OsiNetworkLinkEgress(),
    OsiNetworkLinkComputeChecksum(),
    OsiNetworkLinkDeparser()
) main;
