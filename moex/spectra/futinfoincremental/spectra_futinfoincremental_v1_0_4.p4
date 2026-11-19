// P4_16 (v1model) definition for: Moex Spectra FutInfoIncremental Simba v1.0.4
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: SIMBA Spectra Futures Instrument Incremental
//   Encoding: SIMBA
//   Version: 1.0.4
//   Date: 11/10/2021
//   Specification: spectra_simba_en.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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

header market_data_packet_header_t {
    bit<32> msg_seq_num;
    bit<16> msg_size;
    bit<16> msg_flags;
    bit<64> sending_time;
    bit<64> transact_time;
    bit<32> exchange_trading_session_id_optional;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header security_status_message_t {
    bit<32> security_id;
    bit<200> symbol;
    bit<8> security_trading_status;
    bit<64> high_limit_px;
    bit<64> low_limit_px;
    bit<64> initial_margin_on_buy;
    bit<64> initial_margin_on_sell;
    bit<64> initial_margin_syntetic;
}

header trading_session_status_message_t {
    bit<64> trad_ses_open_time;
    bit<64> trad_ses_close_time;
    bit<64> trad_ses_interm_clearing_start_time;
    bit<64> trad_ses_interm_clearing_end_time;
    bit<8> trading_session_id;
    bit<32> exchange_trading_session_id_int_32_null_optional;
    bit<8> trad_ses_status;
    bit<8> market_segment_id;
    bit<8> trad_ses_event;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    market_data_packet_header_t market_data_packet_header;
    sequence_reset_message_t sequence_reset_message;
    security_status_message_t security_status_message;
    trading_session_status_message_t trading_session_status_message;
}

parser SpectraFutinfoincrementalParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.market_data_packet_header);
        transition select(hdr.market_data_packet_header.template_id) {
            16w0x100: parse_heartbeat_message;
            16w0x200: parse_sequence_reset_message;
            16w0x900: parse_security_status_message;
            16w0xb00: parse_trading_session_status_message;
            default: accept;
        }
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SpectraFutinfoincrementalVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraFutinfoincrementalIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraFutinfoincrementalEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraFutinfoincrementalComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraFutinfoincrementalDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.market_data_packet_header);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.trading_session_status_message);
    }
}

V1Switch(
    SpectraFutinfoincrementalParser(),
    SpectraFutinfoincrementalVerifyChecksum(),
    SpectraFutinfoincrementalIngress(),
    SpectraFutinfoincrementalEgress(),
    SpectraFutinfoincrementalComputeChecksum(),
    SpectraFutinfoincrementalDeparser()
) main;
