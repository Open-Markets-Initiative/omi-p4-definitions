// P4_16 (v1model) definition for: Cme Globex Derived Sbe v12.0
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Derived Market Data
//   Encoding: Simple Binary Encoding
//   Version: 12.0
//   Date: 1/04/2020
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

header md_incremental_refresh_spectrum_t {
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> md_entry_type_spectrum_entry_type;
    bit<280> financial_instrument_full_name;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<64> md_entry_time;
}

header md_incremental_refresh_ticker_t {
    bit<64> transact_time;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> md_entry_type_ticker_entry_type;
    bit<32> security_id;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<280> financial_instrument_full_name;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<64> md_entry_time;
    bit<8> open_close_settl_flag;
    bit<8> trading_session_id;
    bit<8> aggressor_side;
}

header md_snapshot_refresh_spectrum_t {
    bit<64> transact_time;
    bit<280> financial_instrument_full_name;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> md_entry_type_spectrum_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<64> md_entry_time;
}

header md_snapshot_refresh_ticker_t {
    bit<64> transact_time;
    bit<280> financial_instrument_full_name;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> md_entry_type_ticker_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<64> md_entry_time;
    bit<8> open_close_settl_flag;
    bit<8> trading_session_id;
    bit<8> aggressor_side;
}

header global_day_roll_t {
    bit<64> transact_time;
    bit<8> security_trading_event;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    md_incremental_refresh_spectrum_t md_incremental_refresh_spectrum;
    md_incremental_refresh_ticker_t md_incremental_refresh_ticker;
    md_snapshot_refresh_spectrum_t md_snapshot_refresh_spectrum;
    md_snapshot_refresh_ticker_t md_snapshot_refresh_ticker;
    global_day_roll_t global_day_roll;
}

parser CmeGlobexDerivedUdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w303: parse_md_incremental_refresh_spectrum;
            16w304: parse_md_incremental_refresh_ticker;
            16w305: parse_md_snapshot_refresh_spectrum;
            16w306: parse_md_snapshot_refresh_ticker;
            16w307: parse_global_day_roll;
            default: accept;
        }
    }

    state parse_md_incremental_refresh_spectrum {
        packet.extract(hdr.md_incremental_refresh_spectrum);
        transition accept;
    }

    state parse_md_incremental_refresh_ticker {
        packet.extract(hdr.md_incremental_refresh_ticker);
        transition accept;
    }

    state parse_md_snapshot_refresh_spectrum {
        packet.extract(hdr.md_snapshot_refresh_spectrum);
        transition accept;
    }

    state parse_md_snapshot_refresh_ticker {
        packet.extract(hdr.md_snapshot_refresh_ticker);
        transition accept;
    }

    state parse_global_day_roll {
        packet.extract(hdr.global_day_roll);
        transition accept;
    }

}

control CmeGlobexDerivedUdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexDerivedUdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CmeGlobexDerivedUdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexDerivedUdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexDerivedUdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.md_incremental_refresh_spectrum);
        packet.emit(hdr.md_incremental_refresh_ticker);
        packet.emit(hdr.md_snapshot_refresh_spectrum);
        packet.emit(hdr.md_snapshot_refresh_ticker);
        packet.emit(hdr.global_day_roll);
    }
}

V1Switch(
    CmeGlobexDerivedUdpParser(),
    CmeGlobexDerivedUdpVerifyChecksum(),
    CmeGlobexDerivedUdpIngress(),
    CmeGlobexDerivedUdpEgress(),
    CmeGlobexDerivedUdpComputeChecksum(),
    CmeGlobexDerivedUdpDeparser()
) main;
