// P4_16 (v1model) definition for: Gpw Wse Indices Xdp v6.8
// 
// Protocol:
//   Organization: Giełda Papierów Wartościowych w Warszawie
//   Protocol: Warsaw Stock Exchange Indices
//   Encoding: Exchange Data Publisher
//   Version: 6.8
//   Date: 02/11/2020
//   Specification: WSE_CDE_XDP_Message_Specifications_v_68.pdf
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

header packet_header_t {
    bit<16> packet_length;
    bit<16> packet_type;
    bit<32> packet_sequence_number;
    bit<32> send_time;
    bit<16> service_id;
    bit<8> delivery_flag;
    bit<8> number_msg_entries;
}

header packet_header_message_t {
    bit<16> message_size;
    bit<16> message_type;
}

header real_time_index_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> system_id;
    bit<32> index_level;
    bit<32> session_high;
    bit<32> session_low;
    bit<32> ind_index_opening_portfolio;
    bit<32> percent_change_toi;
    bit<32> pct_change_index_val_prev_session;
    bit<32> pct_change_index_val_prev_year;
    bit<32> toi;
    bit<32> point_change;
    bit<64> value_trading;
    bit<32> index_value_bid;
    bit<32> index_value_ask;
    bit<32> mid_spread_index;
    bit<32> difference_central_spread;
    bit<16> num_of_active_instruments;
    bit<16> num_of_instr_of_decreasing_qt;
    bit<16> num_of_instr_of_increasing_qt;
    bit<16> num_of_instr_of_unchanged_qt;
    bit<16> source_time_micro_secs;
    bit<8> level_scale_code;
    bit<48> time_first_high;
    bit<48> time_first_low;
    bit<16> index_status_indicator;
    bit<8> index_level_code;
    bit<8> marker_percent_change_toi;
    bit<8> marker_pct_chg_index_val_prev_sess;
    bit<8> marker_pct_chg_index_val_prev_year;
    bit<8> marker_point_change;
    bit<8> marker_difference_central_spread;
    bit<8> dissemination_frequency_marker;
}

header index_summary_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> system_id;
    bit<32> closing_index_value;
    bit<32> ind_opening_portfolio;
    bit<32> opening_index_value;
    bit<32> session_high;
    bit<32> session_low;
    bit<32> pct_chg_high_index_val_prev_session;
    bit<32> pct_chg_low_index_val_prev_session;
    bit<32> pct_change_index_val_prev_session;
    bit<32> pct_change_index_val_prev_year;
    bit<32> capitalisation_portfolio;
    bit<32> index_adjustment_coefficient;
    bit<16> source_time_micro_secs;
    bit<8> level_scale_code;
    bit<8> capitalisation_scale_code;
    bit<8> index_adjustment_scale_code;
    bit<48> time_closing;
    bit<48> time_opening;
    bit<48> time_full_opening;
    bit<48> time_high;
    bit<48> time_low;
    bit<8> marker_high;
    bit<8> marker_low;
    bit<8> marker_closing_prev_session;
    bit<8> marker_closing_prev_year;
    bit<8> reserved_1;
}

header index_portfolio_message_t {
    bit<32> symbol_index;
    bit<32> source_time;
    bit<32> source_seq_num;
    bit<32> system_id;
    bit<32> index_adjustment_coefficient;
    bit<32> level_cash_portfolio;
    bit<32> value_last_closing_index;
    bit<16> number_of_components;
    bit<16> source_time_micro_secs;
    bit<8> index_adjustment_scale_code;
    bit<8> cash_portfolio_scale_code;
    bit<8> level_scale_code;
}

header index_portfolio_message_index_portfolio_component_t {
    bit<96> instrument_isin;
    bit<80> instrument_abbrev_name;
    bit<80> instrument_packet;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> index_portfolio_message_index_portfolio_component_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    real_time_index_message_t real_time_index_message[MAX_MESSAGES];
    index_summary_message_t index_summary_message[MAX_MESSAGES];
    index_portfolio_message_t index_portfolio_message[MAX_MESSAGES];
    index_portfolio_message_index_portfolio_component_t index_portfolio_message_index_portfolio_component[MAX_MESSAGES];
}

parser WseIndicesParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.number_msg_entries) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.message_type) {
            16w546: parse_real_time_index_message;
            16w547: parse_index_summary_message;
            16w548: parse_index_portfolio_message;
            default: accept;
        }
    }

    state parse_real_time_index_message {
        packet.extract(hdr.real_time_index_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_index_summary_message {
        packet.extract(hdr.index_summary_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_index_portfolio_message {
        packet.extract(hdr.index_portfolio_message.next);
        meta.dispatched = 1;
        meta.index_portfolio_message_index_portfolio_component_remaining = 16w20;
        transition parse_index_portfolio_message_index_portfolio_component;
    }

    state parse_index_portfolio_message_index_portfolio_component {
        packet.extract(hdr.index_portfolio_message_index_portfolio_component.next);
        meta.index_portfolio_message_index_portfolio_component_remaining = meta.index_portfolio_message_index_portfolio_component_remaining - 1;
        transition select(meta.index_portfolio_message_index_portfolio_component_remaining) {
            16w0: parse_packet_header_message;
            default: parse_index_portfolio_message_index_portfolio_component;
        }
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control WseIndicesVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseIndicesIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control WseIndicesEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control WseIndicesComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control WseIndicesDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.real_time_index_message);
        packet.emit(hdr.index_summary_message);
        packet.emit(hdr.index_portfolio_message);
        packet.emit(hdr.index_portfolio_message_index_portfolio_component);
    }
}

V1Switch(
    WseIndicesParser(),
    WseIndicesVerifyChecksum(),
    WseIndicesIngress(),
    WseIndicesEgress(),
    WseIndicesComputeChecksum(),
    WseIndicesDeparser()
) main;
