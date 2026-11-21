// P4_16 (v1model) definition for: Nasdaq Index Gids Itch v1.0.i
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Global Index Data Service
//   Encoding: Itch
//   Version: 1.0.i
//   Date: 4/8/2022
//   Specification: globalindex2-0.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
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
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header timestamp_seconds_message_t {
    bit<32> second;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<8> event_code;
    bit<24> schedule;
}

header index_directory_message_t {
    bit<32> nanoseconds;
    bit<144> instrument_id;
    bit<8> dissemination_flag;
    bit<8> financial_product_type;
    bit<16> brand;
    bit<24> series;
    bit<24> strategy;
    bit<16> asset_type;
    bit<8> market_cap_size;
    bit<24> currency;
    bit<32> geography;
    bit<8> index_settlement_type;
    bit<24> index_calculation_method;
    bit<8> state_;
    bit<8> index_usage;
    bit<24> schedule;
    bit<32> frequency;
    bit<32> number_of_issue_participation_messages;
    bit<64> base_value;
    bit<32> base_date;
    bit<16> name_length;
}

header issue_symbol_participation_message_t {
    bit<32> nanoseconds;
    bit<144> instrument_id;
    bit<144> issue_symbol;
    bit<32> issue_mic;
    bit<16> name_length;
}

header intraday_index_value_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<16> brand;
    bit<24> series;
    bit<144> instrument_id;
    bit<64> tick_value;
    bit<8> tick_direction;
    bit<24> currency;
}

header settlement_value_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<16> brand;
    bit<24> series;
    bit<144> instrument_id;
    bit<64> settlement_value;
    bit<8> settlement_type;
    bit<24> currency;
}

header equities_summary_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<16> brand;
    bit<24> series;
    bit<144> instrument_id;
    bit<24> summary_type;
    bit<64> sod_value;
    bit<64> high;
    bit<64> low;
    bit<64> eod_value;
    bit<64> net_change;
    bit<32> effective_date;
    bit<24> currency;
}

header fixed_income_summary_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<16> brand;
    bit<24> series;
    bit<144> instrument_id;
    bit<24> summary_type;
    bit<64> sod_value;
    bit<64> high;
    bit<64> low;
    bit<64> eod_value;
    bit<64> net_change;
    bit<32> effective_date;
    bit<64> yield;
    bit<64> duration;
    bit<64> coupon;
    bit<24> currency;
}

header commodity_summary_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<16> brand;
    bit<24> series;
    bit<144> instrument_id;
    bit<24> summary_type;
    bit<64> sod_value;
    bit<64> high;
    bit<64> low;
    bit<64> eod_value;
    bit<64> net_change;
    bit<32> effective_date;
    bit<24> currency;
}

header etp_directory_and_daily_valuation_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<32> industry_mic;
    bit<144> etp_trading_symbol;
    bit<144> etp_ipv_symbol;
    bit<24> schedule;
    bit<32> frequency;
    bit<8> state_;
    bit<144> nav_symbol;
    bit<64> nav;
    bit<144> estimated_cash_per_cu_symbol;
    bit<64> ecu;
    bit<144> total_cash_per_cu_symbol;
    bit<64> total_cash_per_cu;
    bit<144> estimated_cash_per_share_symbol;
    bit<64> ecs;
    bit<144> tso_symbol;
    bit<64> tso_outstanding;
    bit<32> effective_date;
    bit<64> yield;
    bit<64> coupon;
    bit<32> maturity_date;
    bit<24> currency;
    bit<16> etp_name_length;
}

header etp_intra_day_valuation_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<144> ipv_symbol;
    bit<64> ipv_value;
    bit<24> currency;
}

header etp_summary_message_t {
    bit<32> nanoseconds;
    bit<8> financial_product_type;
    bit<24> summary_type;
    bit<144> ipv_or_iiv_symbol;
    bit<64> sod_value;
    bit<64> high;
    bit<64> low;
    bit<64> eod_value;
    bit<64> net_change;
    bit<32> effective_date;
    bit<24> currency;
}

header index_directory_message_instrument_name_t {
    varbit<2048> instrument_name;
}

header issue_symbol_participation_message_issue_name_t {
    varbit<2048> issue_name;
}

header etp_directory_and_daily_valuation_message_etp_name_t {
    varbit<2048> etp_name;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    timestamp_seconds_message_t timestamp_seconds_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    index_directory_message_t index_directory_message[MAX_MESSAGES];
    issue_symbol_participation_message_t issue_symbol_participation_message[MAX_MESSAGES];
    intraday_index_value_message_t intraday_index_value_message[MAX_MESSAGES];
    settlement_value_message_t settlement_value_message[MAX_MESSAGES];
    equities_summary_message_t equities_summary_message[MAX_MESSAGES];
    fixed_income_summary_message_t fixed_income_summary_message[MAX_MESSAGES];
    commodity_summary_message_t commodity_summary_message[MAX_MESSAGES];
    etp_directory_and_daily_valuation_message_t etp_directory_and_daily_valuation_message[MAX_MESSAGES];
    etp_intra_day_valuation_message_t etp_intra_day_valuation_message[MAX_MESSAGES];
    etp_summary_message_t etp_summary_message[MAX_MESSAGES];
    index_directory_message_instrument_name_t index_directory_message_instrument_name;
    issue_symbol_participation_message_issue_name_t issue_symbol_participation_message_issue_name;
    etp_directory_and_daily_valuation_message_etp_name_t etp_directory_and_daily_valuation_message_etp_name;
}

parser NasdaqIndexGidsParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            16w65535: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_timestamp_seconds_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_index_directory_message;
            8w0x50: parse_issue_symbol_participation_message;
            8w0x49: parse_intraday_index_value_message;
            8w0x41: parse_settlement_value_message;
            8w0x46: parse_equities_summary_message;
            8w0x42: parse_fixed_income_summary_message;
            8w0x43: parse_commodity_summary_message;
            8w0x44: parse_etp_directory_and_daily_valuation_message;
            8w0x45: parse_etp_intra_day_valuation_message;
            8w0x56: parse_etp_summary_message;
            default: accept;
        }
    }

    state parse_timestamp_seconds_message {
        packet.extract(hdr.timestamp_seconds_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_index_directory_message {
        packet.extract(hdr.index_directory_message.next);
        meta.dispatched = 1;
        packet.extract(hdr.index_directory_message_instrument_name, (bit<32>)hdr.index_directory_message.last.name_length * 8);
        transition parse_message;
    }

    state parse_issue_symbol_participation_message {
        packet.extract(hdr.issue_symbol_participation_message.next);
        meta.dispatched = 1;
        packet.extract(hdr.issue_symbol_participation_message_issue_name, (bit<32>)hdr.issue_symbol_participation_message.last.name_length * 8);
        transition parse_message;
    }

    state parse_intraday_index_value_message {
        packet.extract(hdr.intraday_index_value_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_settlement_value_message {
        packet.extract(hdr.settlement_value_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_equities_summary_message {
        packet.extract(hdr.equities_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_fixed_income_summary_message {
        packet.extract(hdr.fixed_income_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_commodity_summary_message {
        packet.extract(hdr.commodity_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_etp_directory_and_daily_valuation_message {
        packet.extract(hdr.etp_directory_and_daily_valuation_message.next);
        meta.dispatched = 1;
        packet.extract(hdr.etp_directory_and_daily_valuation_message_etp_name, (bit<32>)hdr.etp_directory_and_daily_valuation_message.last.etp_name_length * 8);
        transition parse_message;
    }

    state parse_etp_intra_day_valuation_message {
        packet.extract(hdr.etp_intra_day_valuation_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_etp_summary_message {
        packet.extract(hdr.etp_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NasdaqIndexGidsVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqIndexGidsIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NasdaqIndexGidsEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqIndexGidsComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqIndexGidsDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.timestamp_seconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.index_directory_message);
        packet.emit(hdr.index_directory_message_instrument_name);
        packet.emit(hdr.issue_symbol_participation_message);
        packet.emit(hdr.issue_symbol_participation_message_issue_name);
        packet.emit(hdr.intraday_index_value_message);
        packet.emit(hdr.settlement_value_message);
        packet.emit(hdr.equities_summary_message);
        packet.emit(hdr.fixed_income_summary_message);
        packet.emit(hdr.commodity_summary_message);
        packet.emit(hdr.etp_directory_and_daily_valuation_message);
        packet.emit(hdr.etp_directory_and_daily_valuation_message_etp_name);
        packet.emit(hdr.etp_intra_day_valuation_message);
        packet.emit(hdr.etp_summary_message);
    }
}

V1Switch(
    NasdaqIndexGidsParser(),
    NasdaqIndexGidsVerifyChecksum(),
    NasdaqIndexGidsIngress(),
    NasdaqIndexGidsEgress(),
    NasdaqIndexGidsComputeChecksum(),
    NasdaqIndexGidsDeparser()
) main;
