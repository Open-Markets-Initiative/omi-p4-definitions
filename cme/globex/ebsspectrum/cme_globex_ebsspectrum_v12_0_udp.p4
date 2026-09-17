// P4_16 (v1model) definition for: Cme Globex EbsSpectrum Sbe v12.0
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Ebs Spectrum Market Data
//   Encoding: Simple Binary Encoding
//   Version: 12.0
//   Date: 4/8/2022
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

header binary_packet_header_t {
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
    bit<1> end_of_event;
    bit<1> recovery_message;
    bit<1> unused_event_indicator_5;
    bit<1> unused_event_indicator_4;
    bit<1> unused_event_indicator_3;
    bit<1> unused_event_indicator_2;
    bit<1> unused_event_indicator_1;
    bit<1> unused_event_indicator_0;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_t {
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
    bit<1> end_of_event;
    bit<1> recovery_message;
    bit<1> unused_event_indicator_5;
    bit<1> unused_event_indicator_4;
    bit<1> unused_event_indicator_3;
    bit<1> unused_event_indicator_2;
    bit<1> unused_event_indicator_1;
    bit<1> unused_event_indicator_0;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_incremental_refresh_ticker_incremental_refresh_ticker_group_t {
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
    bit<1> end_of_event;
    bit<1> recovery_message;
    bit<1> unused_event_indicator_5;
    bit<1> unused_event_indicator_4;
    bit<1> unused_event_indicator_3;
    bit<1> unused_event_indicator_2;
    bit<1> unused_event_indicator_1;
    bit<1> unused_event_indicator_0;
    bit<280> financial_instrument_full_name;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_t {
    bit<8> md_entry_type_spectrum_entry_type;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<64> md_entry_time;
}

header md_snapshot_refresh_ticker_t {
    bit<64> transact_time;
    bit<1> end_of_event;
    bit<1> recovery_message;
    bit<1> unused_event_indicator_5;
    bit<1> unused_event_indicator_4;
    bit<1> unused_event_indicator_3;
    bit<1> unused_event_indicator_2;
    bit<1> unused_event_indicator_1;
    bit<1> unused_event_indicator_0;
    bit<280> financial_instrument_full_name;
    bit<160> symbol;
    bit<64> instrument_guid;
    bit<32> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
}

header md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_t {
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
    bit<1> dispatched;
    bit<8> md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_remaining;
    bit<8> md_incremental_refresh_ticker_incremental_refresh_ticker_group_remaining;
    bit<8> md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_remaining;
    bit<8> md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_remaining;
}

struct headers_t {
    binary_packet_header_t binary_packet_header;
    md_incremental_refresh_spectrum_t md_incremental_refresh_spectrum;
    md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_t md_incremental_refresh_spectrum_incremental_refresh_spectrum_group[MAX_MESSAGES];
    md_incremental_refresh_ticker_t md_incremental_refresh_ticker;
    md_incremental_refresh_ticker_incremental_refresh_ticker_group_t md_incremental_refresh_ticker_incremental_refresh_ticker_group[MAX_MESSAGES];
    md_snapshot_refresh_spectrum_t md_snapshot_refresh_spectrum;
    md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_t md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group[MAX_MESSAGES];
    md_snapshot_refresh_ticker_t md_snapshot_refresh_ticker;
    md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_t md_snapshot_refresh_ticker_snapshot_refresh_ticker_group[MAX_MESSAGES];
    global_day_roll_t global_day_roll;
}

parser CmeGlobexEbsspectrumUdpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.binary_packet_header);
        transition select(hdr.binary_packet_header.template_id) {
            16w0x2e01: parse_admin_heartbeat;
            16w0x2f01: parse_md_incremental_refresh_spectrum;
            16w0x3001: parse_md_incremental_refresh_ticker;
            16w0x3101: parse_md_snapshot_refresh_spectrum;
            16w0x3201: parse_md_snapshot_refresh_ticker;
            16w0x3301: parse_global_day_roll;
            default: accept;
        }
    }

    state parse_admin_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_md_incremental_refresh_spectrum {
        packet.extract(hdr.md_incremental_refresh_spectrum);
        meta.dispatched = 1;
        meta.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_remaining = hdr.md_incremental_refresh_spectrum.num_in_group;
        transition select(meta.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_spectrum_incremental_refresh_spectrum_group;
        }
    }

    state parse_md_incremental_refresh_spectrum_incremental_refresh_spectrum_group {
        packet.extract(hdr.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group.next);
        meta.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_remaining = meta.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_remaining - 1;
        transition select(meta.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_spectrum_incremental_refresh_spectrum_group;
        }
    }

    state parse_md_incremental_refresh_ticker {
        packet.extract(hdr.md_incremental_refresh_ticker);
        meta.dispatched = 1;
        meta.md_incremental_refresh_ticker_incremental_refresh_ticker_group_remaining = hdr.md_incremental_refresh_ticker.num_in_group;
        transition select(meta.md_incremental_refresh_ticker_incremental_refresh_ticker_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_ticker_incremental_refresh_ticker_group;
        }
    }

    state parse_md_incremental_refresh_ticker_incremental_refresh_ticker_group {
        packet.extract(hdr.md_incremental_refresh_ticker_incremental_refresh_ticker_group.next);
        meta.md_incremental_refresh_ticker_incremental_refresh_ticker_group_remaining = meta.md_incremental_refresh_ticker_incremental_refresh_ticker_group_remaining - 1;
        transition select(meta.md_incremental_refresh_ticker_incremental_refresh_ticker_group_remaining) {
            8w0: accept;
            default: parse_md_incremental_refresh_ticker_incremental_refresh_ticker_group;
        }
    }

    state parse_md_snapshot_refresh_spectrum {
        packet.extract(hdr.md_snapshot_refresh_spectrum);
        meta.dispatched = 1;
        meta.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_remaining = hdr.md_snapshot_refresh_spectrum.num_in_group;
        transition select(meta.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_remaining) {
            8w0: accept;
            default: parse_md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group;
        }
    }

    state parse_md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group {
        packet.extract(hdr.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group.next);
        meta.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_remaining = meta.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_remaining - 1;
        transition select(meta.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group_remaining) {
            8w0: accept;
            default: parse_md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group;
        }
    }

    state parse_md_snapshot_refresh_ticker {
        packet.extract(hdr.md_snapshot_refresh_ticker);
        meta.dispatched = 1;
        meta.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_remaining = hdr.md_snapshot_refresh_ticker.num_in_group;
        transition select(meta.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_remaining) {
            8w0: accept;
            default: parse_md_snapshot_refresh_ticker_snapshot_refresh_ticker_group;
        }
    }

    state parse_md_snapshot_refresh_ticker_snapshot_refresh_ticker_group {
        packet.extract(hdr.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group.next);
        meta.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_remaining = meta.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_remaining - 1;
        transition select(meta.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group_remaining) {
            8w0: accept;
            default: parse_md_snapshot_refresh_ticker_snapshot_refresh_ticker_group;
        }
    }

    state parse_global_day_roll {
        packet.extract(hdr.global_day_roll);
        meta.dispatched = 1;
        transition accept;
    }

}

control CmeGlobexEbsspectrumUdpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexEbsspectrumUdpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control CmeGlobexEbsspectrumUdpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexEbsspectrumUdpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexEbsspectrumUdpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.binary_packet_header);
        packet.emit(hdr.md_incremental_refresh_spectrum);
        packet.emit(hdr.md_incremental_refresh_spectrum_incremental_refresh_spectrum_group);
        packet.emit(hdr.md_incremental_refresh_ticker);
        packet.emit(hdr.md_incremental_refresh_ticker_incremental_refresh_ticker_group);
        packet.emit(hdr.md_snapshot_refresh_spectrum);
        packet.emit(hdr.md_snapshot_refresh_spectrum_snapshot_refresh_spectrum_group);
        packet.emit(hdr.md_snapshot_refresh_ticker);
        packet.emit(hdr.md_snapshot_refresh_ticker_snapshot_refresh_ticker_group);
        packet.emit(hdr.global_day_roll);
    }
}

V1Switch(
    CmeGlobexEbsspectrumUdpParser(),
    CmeGlobexEbsspectrumUdpVerifyChecksum(),
    CmeGlobexEbsspectrumUdpIngress(),
    CmeGlobexEbsspectrumUdpEgress(),
    CmeGlobexEbsspectrumUdpComputeChecksum(),
    CmeGlobexEbsspectrumUdpDeparser()
) main;
