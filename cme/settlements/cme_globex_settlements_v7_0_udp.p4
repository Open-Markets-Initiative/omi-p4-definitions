// P4_16 (v1model) definition for: Cme Globex Settlements Sbe v7.0
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Settlements
//   Encoding: Simple Binary Encoding
//   Version: 7.0
//   Date: 12/03/2018
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

header md_incremental_refresh_settle_t {
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> md_update_action;
    bit<8> md_entry_type;
    bit<64> product_guid;
    bit<96> clearing_product_code;
    bit<48> security_type;
    bit<64> security_exchange;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<8> put_or_call;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> underlying_product_guid;
    bit<96> underlying_clearing_product_code;
    bit<48> underlying_security_type;
    bit<64> underlying_security_exchange;
    bit<16> year_2;
    bit<8> month_2;
    bit<8> day_2;
    bit<8> week_2;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<64> md_entry_px;
    bit<1> final_daily;
    bit<1> actual;
    bit<1> rounded;
    bit<1> intraday;
    bit<1> cabinet;
    bit<1> reserved_bits;
    bit<1> unused_settl_price_type_6;
    bit<1> null_value;
    bit<16> trading_reference_date;
    bit<320> md_statistic_desc;
}

header md_incremental_refresh_voi_t {
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> product_guid;
    bit<96> clearing_product_code;
    bit<48> security_type;
    bit<64> security_exchange;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<8> put_or_call;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> underlying_product_guid;
    bit<96> underlying_clearing_product_code;
    bit<48> underlying_security_type;
    bit<64> underlying_security_exchange;
    bit<16> year_2;
    bit<8> month_2;
    bit<8> day_2;
    bit<8> week_2;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<32> cleared_volume;
    bit<32> open_interest_qty;
    bit<8> open_close_settl_flag;
    bit<16> trading_reference_date;
}

header md_incremental_refresh_high_low_t {
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> product_guid;
    bit<96> clearing_product_code;
    bit<48> security_type;
    bit<64> security_exchange;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<8> put_or_call;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> underlying_product_guid;
    bit<96> underlying_clearing_product_code;
    bit<48> underlying_security_type;
    bit<64> underlying_security_exchange;
    bit<16> year_2;
    bit<8> month_2;
    bit<8> day_2;
    bit<8> week_2;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<64> mantissa_2;
    bit<8> exponent_2;
    bit<8> low_px_ind;
    bit<64> mantissa_3;
    bit<8> exponent_3;
    bit<8> high_px_ind;
    bit<16> trading_reference_date;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    md_incremental_refresh_settle_t md_incremental_refresh_settle;
    md_incremental_refresh_voi_t md_incremental_refresh_voi;
    md_incremental_refresh_high_low_t md_incremental_refresh_high_low;
}

parser CmeGlobexSettlementsUdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w401: parse_md_incremental_refresh_settle;
            16w402: parse_md_incremental_refresh_voi;
            16w403: parse_md_incremental_refresh_high_low;
            default: accept;
        }
    }

    state parse_md_incremental_refresh_settle {
        packet.extract(hdr.md_incremental_refresh_settle);
        transition accept;
    }

    state parse_md_incremental_refresh_voi {
        packet.extract(hdr.md_incremental_refresh_voi);
        transition accept;
    }

    state parse_md_incremental_refresh_high_low {
        packet.extract(hdr.md_incremental_refresh_high_low);
        transition accept;
    }

}

control CmeGlobexSettlementsUdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexSettlementsUdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CmeGlobexSettlementsUdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexSettlementsUdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexSettlementsUdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.md_incremental_refresh_settle);
        packet.emit(hdr.md_incremental_refresh_voi);
        packet.emit(hdr.md_incremental_refresh_high_low);
    }
}

V1Switch(
    CmeGlobexSettlementsUdpParser(),
    CmeGlobexSettlementsUdpVerifyChecksum(),
    CmeGlobexSettlementsUdpIngress(),
    CmeGlobexSettlementsUdpEgress(),
    CmeGlobexSettlementsUdpComputeChecksum(),
    CmeGlobexSettlementsUdpDeparser()
) main;
