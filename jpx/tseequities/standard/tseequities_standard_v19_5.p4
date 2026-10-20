// P4_16 (v1model) definition for: Jpx TseEquities Standard Flex v19.5
// 
// Protocol:
//   Organization: Japan Exchange Group
//   Protocol: Standard
//   Encoding: Flex
//   Version: 19.5
//   Date: 09/25/2026
//   Specification: 02_FLEX Connection Specification Realtime Message (Standard) DS.19.3.pdf
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

header message_serial_no_t {
    bit<8> start_of_message;
    bit<48> message_length;
    bit<24> multicast_group_number;
    bit<64> sequence_number;
    bit<8> message_type_large_classification;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_serial_no_t message_serial_no;
}

parser TseequitiesStandardParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_serial_no);
        transition select(hdr.message_serial_no.message_type_large_classification) {
            8w0x31: parse_issue_realtime_medium_classification;
            8w0x32: parse_statistics_medium_classification;
            8w0x33: parse_index_medium_classification;
            8w0x34: parse_issue_basic_medium_classification;
            8w0x39: parse_control_medium_classification;
            default: accept;
        }
    }

    state parse_issue_realtime_medium_classification {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_statistics_medium_classification {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_index_medium_classification {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_issue_basic_medium_classification {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_control_medium_classification {
        meta.dispatched = 1;
        transition accept;
    }

}

control TseequitiesStandardVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control TseequitiesStandardIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control TseequitiesStandardEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control TseequitiesStandardComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control TseequitiesStandardDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_serial_no);
    }
}

V1Switch(
    TseequitiesStandardParser(),
    TseequitiesStandardVerifyChecksum(),
    TseequitiesStandardIngress(),
    TseequitiesStandardEgress(),
    TseequitiesStandardComputeChecksum(),
    TseequitiesStandardDeparser()
) main;
