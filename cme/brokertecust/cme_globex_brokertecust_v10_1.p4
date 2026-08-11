// P4_16 (v1model) definition for: Cme Globex BrokerTecUst Sbe v10.1
// 
// Protocol:
//   Organization: CME Group
//   Protocol: BrokerTec Us Treasuries
//   Encoding: Simple Binary Encoding
//   Version: 10.1
//   Date: 4/13/2023
//   Specification: Unknown
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<32> packet_sequence_number;
    bit<64> sending_time;
    bit<16> message_size;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header md_incremental_refresh_btec_t {
    bit<16> trade_date;
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> md_update_action;
    bit<8> md_entry_type;
    bit<64> mantissa;
    bit<8> exponent;
    bit<32> md_entry_size;
    bit<8> md_price_level;
    bit<32> trade_volume;
    bit<160> symbol;
    bit<16> maturity_date;
    bit<96> security_alt_id;
    bit<8> security_alt_id_source;
    bit<32> mantissa_32;
    bit<8> exponent_2;
    bit<8> trade_condition;
    bit<8> price_type;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    md_incremental_refresh_btec_t md_incremental_refresh_btec;
}

parser CmeGlobexBrokertecustParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w405: parse_md_incremental_refresh_btec;
            default: accept;
        }
    }

    state parse_md_incremental_refresh_btec {
        packet.extract(hdr.md_incremental_refresh_btec);
        transition accept;
    }

}

control CmeGlobexBrokertecustVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexBrokertecustIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CmeGlobexBrokertecustEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexBrokertecustComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexBrokertecustDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.md_incremental_refresh_btec);
    }
}

V1Switch(
    CmeGlobexBrokertecustParser(),
    CmeGlobexBrokertecustVerifyChecksum(),
    CmeGlobexBrokertecustIngress(),
    CmeGlobexBrokertecustEgress(),
    CmeGlobexBrokertecustComputeChecksum(),
    CmeGlobexBrokertecustDeparser()
) main;
