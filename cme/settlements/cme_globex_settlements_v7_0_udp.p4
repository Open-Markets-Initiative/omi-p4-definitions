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
}

header md_incremental_refresh_settle_incremental_refresh_settle_group_t {
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
}

header md_incremental_refresh_voi_incremental_refresh_voi_group_t {
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
}

header md_incremental_refresh_high_low_incremental_refresh_high_low_group_t {
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
    bit<1> dispatched;
    bit<8> md_incremental_refresh_settle_incremental_refresh_settle_group_remaining;
    bit<8> md_incremental_refresh_voi_incremental_refresh_voi_group_remaining;
    bit<8> md_incremental_refresh_high_low_incremental_refresh_high_low_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    md_incremental_refresh_settle_t md_incremental_refresh_settle;
    md_incremental_refresh_settle_incremental_refresh_settle_group_t md_incremental_refresh_settle_incremental_refresh_settle_group[MAX_MESSAGES];
    md_incremental_refresh_voi_t md_incremental_refresh_voi;
    md_incremental_refresh_voi_incremental_refresh_voi_group_t md_incremental_refresh_voi_incremental_refresh_voi_group[MAX_MESSAGES];
    md_incremental_refresh_high_low_t md_incremental_refresh_high_low;
    md_incremental_refresh_high_low_incremental_refresh_high_low_group_t md_incremental_refresh_high_low_incremental_refresh_high_low_group[MAX_MESSAGES];
}

parser CmeGlobexSettlementsUdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x9101: parse_md_incremental_refresh_settle;
            16w0x9201: parse_md_incremental_refresh_voi;
            16w0x9301: parse_md_incremental_refresh_high_low;
            16w0x9701: parse_admin_heartbeat;
            default: accept;
        }
    }

    state parse_md_incremental_refresh_settle {
        packet.extract(hdr.md_incremental_refresh_settle);
        meta.dispatched = 1;
        meta.md_incremental_refresh_settle_incremental_refresh_settle_group_remaining = hdr.md_incremental_refresh_settle.num_in_group;
        transition select(meta.md_incremental_refresh_settle_incremental_refresh_settle_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_settle_incremental_refresh_settle_group;
        }
    }

    state parse_md_incremental_refresh_settle_incremental_refresh_settle_group {
        packet.extract(hdr.md_incremental_refresh_settle_incremental_refresh_settle_group.next);
        meta.md_incremental_refresh_settle_incremental_refresh_settle_group_remaining = meta.md_incremental_refresh_settle_incremental_refresh_settle_group_remaining - 1;
        transition select(meta.md_incremental_refresh_settle_incremental_refresh_settle_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_settle_incremental_refresh_settle_group;
        }
    }

    state parse_md_incremental_refresh_voi {
        packet.extract(hdr.md_incremental_refresh_voi);
        meta.dispatched = 1;
        meta.md_incremental_refresh_voi_incremental_refresh_voi_group_remaining = hdr.md_incremental_refresh_voi.num_in_group;
        transition select(meta.md_incremental_refresh_voi_incremental_refresh_voi_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_voi_incremental_refresh_voi_group;
        }
    }

    state parse_md_incremental_refresh_voi_incremental_refresh_voi_group {
        packet.extract(hdr.md_incremental_refresh_voi_incremental_refresh_voi_group.next);
        meta.md_incremental_refresh_voi_incremental_refresh_voi_group_remaining = meta.md_incremental_refresh_voi_incremental_refresh_voi_group_remaining - 1;
        transition select(meta.md_incremental_refresh_voi_incremental_refresh_voi_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_voi_incremental_refresh_voi_group;
        }
    }

    state parse_md_incremental_refresh_high_low {
        packet.extract(hdr.md_incremental_refresh_high_low);
        meta.dispatched = 1;
        meta.md_incremental_refresh_high_low_incremental_refresh_high_low_group_remaining = hdr.md_incremental_refresh_high_low.num_in_group;
        transition select(meta.md_incremental_refresh_high_low_incremental_refresh_high_low_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_high_low_incremental_refresh_high_low_group;
        }
    }

    state parse_md_incremental_refresh_high_low_incremental_refresh_high_low_group {
        packet.extract(hdr.md_incremental_refresh_high_low_incremental_refresh_high_low_group.next);
        meta.md_incremental_refresh_high_low_incremental_refresh_high_low_group_remaining = meta.md_incremental_refresh_high_low_incremental_refresh_high_low_group_remaining - 1;
        transition select(meta.md_incremental_refresh_high_low_incremental_refresh_high_low_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_high_low_incremental_refresh_high_low_group;
        }
    }

    state parse_admin_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

}

control CmeGlobexSettlementsUdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexSettlementsUdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
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
        packet.emit(hdr.md_incremental_refresh_settle_incremental_refresh_settle_group);
        packet.emit(hdr.md_incremental_refresh_voi);
        packet.emit(hdr.md_incremental_refresh_voi_incremental_refresh_voi_group);
        packet.emit(hdr.md_incremental_refresh_high_low);
        packet.emit(hdr.md_incremental_refresh_high_low_incremental_refresh_high_low_group);
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
