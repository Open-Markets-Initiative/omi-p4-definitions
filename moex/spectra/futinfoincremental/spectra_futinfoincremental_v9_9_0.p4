// P4_16 (v1model) definition for: Moex Spectra FutInfoIncremental Simba v9.9.0
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: SIMBA Spectra Futures Instrument Incremental
//   Encoding: SIMBA
//   Version: 9.9.0
//   Date: 07/16/2026
//   Specification: MOEX Spectra SIMBA Market Data (SBE) (9.9.0).pdf
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
    bit<32> exchange_trading_session_id;
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
    bit<64> high_limit_px_weekend;
    bit<64> low_limit_px_weekend;
}

header trading_session_status_message_t {
    bit<64> trad_ses_open_time;
    bit<64> trad_ses_close_time;
    bit<8> trading_session_id;
    bit<32> exchange_trading_session_id_int_32_null_optional;
    bit<8> trad_ses_status;
    bit<8> market_segment_id;
    bit<8> trad_ses_event;
    bit<64> trade_period_id;
    bit<64> settl_sess_begin;
    bit<64> clr_sess_begin;
}

header discrete_auction_message_t {
    bit<64> trad_ses_open_time;
    bit<64> trad_ses_close_time_from;
    bit<64> trad_ses_close_time_till;
    bit<64> auction_id;
    bit<32> exchange_trading_session_id_int_32;
    bit<32> event_id_open;
    bit<32> event_id_close;
    bit<64> trade_period_id;
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header discrete_auction_message_discrete_auction_message_no_underlyings_group_t {
    bit<16> underlying_symbol_text_length;
}

header security_mass_status_message_t {
    bit<16> block_length;
    bit<16> num_in_group_uint_16;
}

header security_mass_status_message_security_mass_status_message_no_related_sym_group_t {
    bit<32> security_id;
    bit<8> security_trading_status;
}

header security_group_status_message_t {
    bit<64> security_group_id;
    bit<8> halt_type;
    bit<32> trade_mode_mask;
    bit<64> group_mask_int_64_null_optional;
    bit<32> section_id_int_32_null_optional;
    bit<32> base_contract_id_int_32_null_optional;
    bit<8> security_trading_status;
    bit<64> status_change_time;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining;
    bit<16> security_mass_status_message_security_mass_status_message_no_related_sym_group_remaining;
}

struct headers_t {
    market_data_packet_header_t market_data_packet_header;
    sequence_reset_message_t sequence_reset_message;
    security_status_message_t security_status_message;
    trading_session_status_message_t trading_session_status_message;
    discrete_auction_message_t discrete_auction_message;
    discrete_auction_message_discrete_auction_message_no_underlyings_group_t discrete_auction_message_discrete_auction_message_no_underlyings_group[MAX_MESSAGES];
    security_mass_status_message_t security_mass_status_message;
    security_mass_status_message_security_mass_status_message_no_related_sym_group_t security_mass_status_message_security_mass_status_message_no_related_sym_group[MAX_MESSAGES];
    security_group_status_message_t security_group_status_message;
}

parser SpectraFutinfoincrementalParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.market_data_packet_header);
        transition select(hdr.market_data_packet_header.template_id) {
            16w0x100: parse_heartbeat_message;
            16w0x200: parse_sequence_reset_message;
            16w0x1c00: parse_security_status_message;
            16w0x1a00: parse_trading_session_status_message;
            16w0x1800: parse_discrete_auction_message;
            16w0x1300: parse_security_mass_status_message;
            16w0x1600: parse_security_group_status_message;
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

    state parse_discrete_auction_message {
        packet.extract(hdr.discrete_auction_message);
        meta.dispatched = 1;
        meta.discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining = hdr.discrete_auction_message.num_in_group_uint_8;
        transition select(meta.discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining) {
            8w0: accept;
            default: parse_discrete_auction_message_discrete_auction_message_no_underlyings_group;
        }
    }

    state parse_discrete_auction_message_discrete_auction_message_no_underlyings_group {
        packet.extract(hdr.discrete_auction_message_discrete_auction_message_no_underlyings_group.next);
        meta.discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining = meta.discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining - 1;
        transition select(meta.discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining) {
            8w0: accept;
            default: parse_discrete_auction_message_discrete_auction_message_no_underlyings_group;
        }
    }

    state parse_security_mass_status_message {
        packet.extract(hdr.security_mass_status_message);
        meta.dispatched = 1;
        meta.security_mass_status_message_security_mass_status_message_no_related_sym_group_remaining = hdr.security_mass_status_message.num_in_group_uint_16;
        transition select(meta.security_mass_status_message_security_mass_status_message_no_related_sym_group_remaining) {
            16w0: accept;
            default: parse_security_mass_status_message_security_mass_status_message_no_related_sym_group;
        }
    }

    state parse_security_mass_status_message_security_mass_status_message_no_related_sym_group {
        packet.extract(hdr.security_mass_status_message_security_mass_status_message_no_related_sym_group.next);
        meta.security_mass_status_message_security_mass_status_message_no_related_sym_group_remaining = meta.security_mass_status_message_security_mass_status_message_no_related_sym_group_remaining - 1;
        transition select(meta.security_mass_status_message_security_mass_status_message_no_related_sym_group_remaining) {
            16w0: accept;
            default: parse_security_mass_status_message_security_mass_status_message_no_related_sym_group;
        }
    }

    state parse_security_group_status_message {
        packet.extract(hdr.security_group_status_message);
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
        packet.emit(hdr.discrete_auction_message);
        packet.emit(hdr.discrete_auction_message_discrete_auction_message_no_underlyings_group);
        packet.emit(hdr.security_mass_status_message);
        packet.emit(hdr.security_mass_status_message_security_mass_status_message_no_related_sym_group);
        packet.emit(hdr.security_group_status_message);
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
