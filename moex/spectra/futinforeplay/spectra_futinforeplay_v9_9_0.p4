// P4_16 (v1model) definition for: Moex Spectra FutInfoReplay Simba v9.9.0
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: SIMBA Spectra Futures Instrument Replay
//   Encoding: SIMBA
//   Version: 9.9.0
//   Date: 07/16/2026
//   Specification: MOEX Spectra SIMBA Market Data (SBE) (9.9.0).pdf
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

header market_data_packet_header_t {
    bit<32> msg_seq_num;
    bit<16> msg_size;
    bit<16> msg_flags;
    bit<64> sending_time;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header security_definition_message_t {
    bit<32> tot_num_reports;
    bit<200> symbol;
    bit<32> security_id;
    bit<200> security_alt_id;
    bit<8> security_alt_id_source;
    bit<32> security_type;
    bit<48> cfi_code;
    bit<64> strike_price;
    bit<32> contract_multiplier;
    bit<8> security_trading_status;
    bit<24> currency;
    bit<8> market_segment_id;
    bit<8> trading_session_id;
    bit<32> exchange_trading_session_id_int_32_null_optional;
    bit<64> volatility;
    bit<64> high_limit_px;
    bit<64> low_limit_px;
    bit<64> min_price_increment;
    bit<64> min_price_increment_amount;
    bit<64> initial_margin_on_buy;
    bit<64> initial_margin_on_sell;
    bit<64> initial_margin_syntetic;
    bit<64> theor_price;
    bit<64> theor_price_limit;
    bit<64> underlying_qty;
    bit<24> underlying_currency;
    bit<64> flags;
    bit<64> min_price_increment_amount_curr;
    bit<64> settl_price_open;
    bit<32> valuation_method;
    bit<64> risk_free_rate;
    bit<64> fixed_spot_discount;
    bit<64> projected_spot_discount;
    bit<24> settl_currency;
    bit<8> negative_prices;
    bit<32> derivative_contract_multiplier;
    bit<64> interest_rate_risk_up;
    bit<64> interest_rate_risk_down;
    bit<64> risk_free_rate_2;
    bit<64> interest_rate_2_risk_up;
    bit<64> interest_rate_2_risk_down;
    bit<64> settl_price;
    bit<32> trade_mode_id;
    bit<64> group_mask_int_64;
    bit<32> section_id_int_32;
    bit<32> base_contract_id_int_32;
    bit<64> trade_period_access;
    bit<64> high_limit_px_weekend;
    bit<64> low_limit_px_weekend;
    bit<64> clearing_settl_price;
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header security_definition_message_security_definition_message_no_m_d_feed_types_group_t {
    bit<200> md_feed_type;
    bit<32> market_depth;
    bit<32> md_book_type;
}

header security_definition_message_security_definition_message_no_underlyings_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header security_definition_message_security_definition_message_no_underlyings_group_t {
    bit<200> underlying_symbol;
    bit<32> underlying_board;
    bit<32> underlying_security_id;
    bit<32> underlying_future_id;
}

header security_definition_message_security_definition_message_no_legs_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header security_definition_message_security_definition_message_no_legs_group_t {
    bit<200> leg_symbol;
    bit<32> leg_security_id;
    bit<32> leg_ratio_qty;
}

header security_definition_message_security_definition_message_no_instr_attrib_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header security_definition_message_security_definition_message_no_instr_attrib_group_t {
    bit<32> instr_attrib_type;
    bit<248> instr_attrib_value;
}

header security_definition_message_security_definition_message_no_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group_uint_8;
}

header security_definition_message_security_definition_message_no_events_group_t {
    bit<32> event_type;
    bit<32> event_date;
    bit<64> event_time;
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
    bit<8> security_definition_message_security_definition_message_no_m_d_feed_types_group_remaining;
    bit<8> security_definition_message_security_definition_message_no_underlyings_group_remaining;
    bit<8> security_definition_message_security_definition_message_no_legs_group_remaining;
    bit<8> security_definition_message_security_definition_message_no_instr_attrib_group_remaining;
    bit<8> security_definition_message_security_definition_message_no_events_group_remaining;
    bit<8> discrete_auction_message_discrete_auction_message_no_underlyings_group_remaining;
}

struct headers_t {
    market_data_packet_header_t market_data_packet_header;
    sequence_reset_message_t sequence_reset_message;
    security_definition_message_t security_definition_message;
    security_definition_message_security_definition_message_no_m_d_feed_types_group_t security_definition_message_security_definition_message_no_m_d_feed_types_group[MAX_MESSAGES];
    security_definition_message_security_definition_message_no_underlyings_group_header_t security_definition_message_security_definition_message_no_underlyings_group_header;
    security_definition_message_security_definition_message_no_underlyings_group_t security_definition_message_security_definition_message_no_underlyings_group[MAX_MESSAGES];
    security_definition_message_security_definition_message_no_legs_group_header_t security_definition_message_security_definition_message_no_legs_group_header;
    security_definition_message_security_definition_message_no_legs_group_t security_definition_message_security_definition_message_no_legs_group[MAX_MESSAGES];
    security_definition_message_security_definition_message_no_instr_attrib_group_header_t security_definition_message_security_definition_message_no_instr_attrib_group_header;
    security_definition_message_security_definition_message_no_instr_attrib_group_t security_definition_message_security_definition_message_no_instr_attrib_group[MAX_MESSAGES];
    security_definition_message_security_definition_message_no_events_group_header_t security_definition_message_security_definition_message_no_events_group_header;
    security_definition_message_security_definition_message_no_events_group_t security_definition_message_security_definition_message_no_events_group[MAX_MESSAGES];
    trading_session_status_message_t trading_session_status_message;
    discrete_auction_message_t discrete_auction_message;
    discrete_auction_message_discrete_auction_message_no_underlyings_group_t discrete_auction_message_discrete_auction_message_no_underlyings_group[MAX_MESSAGES];
    security_group_status_message_t security_group_status_message;
}

parser SpectraFutinforeplayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.market_data_packet_header);
        transition select(hdr.market_data_packet_header.template_id) {
            16w0x100: parse_heartbeat_message;
            16w0x200: parse_sequence_reset_message;
            16w0x1b00: parse_security_definition_message;
            16w0x1a00: parse_trading_session_status_message;
            16w0x1800: parse_discrete_auction_message;
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

    state parse_security_definition_message {
        packet.extract(hdr.security_definition_message);
        meta.dispatched = 1;
        meta.security_definition_message_security_definition_message_no_m_d_feed_types_group_remaining = hdr.security_definition_message.num_in_group_uint_8;
        transition select(meta.security_definition_message_security_definition_message_no_m_d_feed_types_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_underlyings_group;
            default: parse_security_definition_message_security_definition_message_no_m_d_feed_types_group;
        }
    }

    state parse_security_definition_message_security_definition_message_no_m_d_feed_types_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_m_d_feed_types_group.next);
        meta.security_definition_message_security_definition_message_no_m_d_feed_types_group_remaining = meta.security_definition_message_security_definition_message_no_m_d_feed_types_group_remaining - 1;
        transition select(meta.security_definition_message_security_definition_message_no_m_d_feed_types_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_underlyings_group;
            default: parse_security_definition_message_security_definition_message_no_m_d_feed_types_group;
        }
    }

    state read_security_definition_message_security_definition_message_no_underlyings_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_underlyings_group_header);
        meta.security_definition_message_security_definition_message_no_underlyings_group_remaining = hdr.security_definition_message_security_definition_message_no_underlyings_group_header.num_in_group_uint_8;
        transition select(meta.security_definition_message_security_definition_message_no_underlyings_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_legs_group;
            default: parse_security_definition_message_security_definition_message_no_underlyings_group;
        }
    }

    state parse_security_definition_message_security_definition_message_no_underlyings_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_underlyings_group.next);
        meta.security_definition_message_security_definition_message_no_underlyings_group_remaining = meta.security_definition_message_security_definition_message_no_underlyings_group_remaining - 1;
        transition select(meta.security_definition_message_security_definition_message_no_underlyings_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_legs_group;
            default: parse_security_definition_message_security_definition_message_no_underlyings_group;
        }
    }

    state read_security_definition_message_security_definition_message_no_legs_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_legs_group_header);
        meta.security_definition_message_security_definition_message_no_legs_group_remaining = hdr.security_definition_message_security_definition_message_no_legs_group_header.num_in_group_uint_8;
        transition select(meta.security_definition_message_security_definition_message_no_legs_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_instr_attrib_group;
            default: parse_security_definition_message_security_definition_message_no_legs_group;
        }
    }

    state parse_security_definition_message_security_definition_message_no_legs_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_legs_group.next);
        meta.security_definition_message_security_definition_message_no_legs_group_remaining = meta.security_definition_message_security_definition_message_no_legs_group_remaining - 1;
        transition select(meta.security_definition_message_security_definition_message_no_legs_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_instr_attrib_group;
            default: parse_security_definition_message_security_definition_message_no_legs_group;
        }
    }

    state read_security_definition_message_security_definition_message_no_instr_attrib_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_instr_attrib_group_header);
        meta.security_definition_message_security_definition_message_no_instr_attrib_group_remaining = hdr.security_definition_message_security_definition_message_no_instr_attrib_group_header.num_in_group_uint_8;
        transition select(meta.security_definition_message_security_definition_message_no_instr_attrib_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_events_group;
            default: parse_security_definition_message_security_definition_message_no_instr_attrib_group;
        }
    }

    state parse_security_definition_message_security_definition_message_no_instr_attrib_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_instr_attrib_group.next);
        meta.security_definition_message_security_definition_message_no_instr_attrib_group_remaining = meta.security_definition_message_security_definition_message_no_instr_attrib_group_remaining - 1;
        transition select(meta.security_definition_message_security_definition_message_no_instr_attrib_group_remaining) {
            8w0: read_security_definition_message_security_definition_message_no_events_group;
            default: parse_security_definition_message_security_definition_message_no_instr_attrib_group;
        }
    }

    state read_security_definition_message_security_definition_message_no_events_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_events_group_header);
        meta.security_definition_message_security_definition_message_no_events_group_remaining = hdr.security_definition_message_security_definition_message_no_events_group_header.num_in_group_uint_8;
        transition select(meta.security_definition_message_security_definition_message_no_events_group_remaining) {
            8w0: accept;
            default: parse_security_definition_message_security_definition_message_no_events_group;
        }
    }

    state parse_security_definition_message_security_definition_message_no_events_group {
        packet.extract(hdr.security_definition_message_security_definition_message_no_events_group.next);
        meta.security_definition_message_security_definition_message_no_events_group_remaining = meta.security_definition_message_security_definition_message_no_events_group_remaining - 1;
        transition select(meta.security_definition_message_security_definition_message_no_events_group_remaining) {
            8w0: accept;
            default: parse_security_definition_message_security_definition_message_no_events_group;
        }
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

    state parse_security_group_status_message {
        packet.extract(hdr.security_group_status_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SpectraFutinforeplayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraFutinforeplayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraFutinforeplayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraFutinforeplayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraFutinforeplayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.market_data_packet_header);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.security_definition_message);
        packet.emit(hdr.security_definition_message_security_definition_message_no_m_d_feed_types_group);
        packet.emit(hdr.security_definition_message_security_definition_message_no_underlyings_group_header);
        packet.emit(hdr.security_definition_message_security_definition_message_no_underlyings_group);
        packet.emit(hdr.security_definition_message_security_definition_message_no_legs_group_header);
        packet.emit(hdr.security_definition_message_security_definition_message_no_legs_group);
        packet.emit(hdr.security_definition_message_security_definition_message_no_instr_attrib_group_header);
        packet.emit(hdr.security_definition_message_security_definition_message_no_instr_attrib_group);
        packet.emit(hdr.security_definition_message_security_definition_message_no_events_group_header);
        packet.emit(hdr.security_definition_message_security_definition_message_no_events_group);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.discrete_auction_message);
        packet.emit(hdr.discrete_auction_message_discrete_auction_message_no_underlyings_group);
        packet.emit(hdr.security_group_status_message);
    }
}

V1Switch(
    SpectraFutinforeplayParser(),
    SpectraFutinforeplayVerifyChecksum(),
    SpectraFutinforeplayIngress(),
    SpectraFutinforeplayEgress(),
    SpectraFutinforeplayComputeChecksum(),
    SpectraFutinforeplayDeparser()
) main;
