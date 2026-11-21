// P4_16 (v1model) definition for: AsiaNext AsiaNextDerivatives Snapshot Amd v1.3
// 
// Protocol:
//   Organization: AsiaNext
//   Protocol: Market Data Snapshot
//   Encoding: Aquis Market Data Protocol
//   Version: 1.3
//   Date: 11/6/2026
//   Specification: AsiaNext-Market-Data-Technical-Specification-v1.3.pdf
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
    bit<8> message_count;
}

header packet_header_message_t {
    bit<8> msg_type;
    bit<8> msg_length;
    bit<32> seq_no;
}

header snapshot_start_message_t {
    bit<32> stream_seq_no;
    bit<32> security_count;
    bit<64> timestamp;
}

header book_status_message_t {
    bit<32> security_id;
    bit<8> trading_status;
    bit<5> unused_5;
    bit<1> mac_run;
    bit<1> mac_open;
    bit<1> trading;
    bit<16> entries;
    bit<64> closing_buy_qty;
    bit<64> closing_sell_qty;
    bit<64> indicative_price;
}

header book_entry_message_t {
    bit<32> security_id;
    bit<8> side;
    bit<64> quantity;
    bit<64> price;
    bit<64> order_ref;
}

header tick_table_data_message_t {
    bit<8> tick_table_id;
    bit<80> name;
    bit<64> threshold;
    bit<64> tick_size;
}

header security_definition_message_t {
    bit<32> security_id;
    bit<48> umtf;
    bit<96> isin;
    bit<24> currency;
    bit<32> mic;
    bit<8> tick_table_id;
    bit<16> flags;
    bit<160> exchange_symbol;
    bit<64> lot_size;
    bit<8> lot_size_decimal;
}

header security_definition_futures_message_t {
    bit<32> security_id;
    bit<48> umtf;
    bit<96> isin;
    bit<24> currency;
    bit<32> mic;
    bit<8> tick_table_id;
    bit<16> futures_flags;
    bit<160> exchange_symbol;
    bit<64> lot_size;
    bit<8> lot_size_decimal;
    bit<64> maturity_date;
    bit<8> settlement_type;
    bit<64> contract_size;
    bit<8> contract_size_decimals;
    bit<160> underlying;
}

header security_definition_options_message_t {
    bit<32> security_id;
    bit<48> umtf;
    bit<96> isin;
    bit<24> currency;
    bit<32> mic;
    bit<8> tick_table_id;
    bit<16> options_flags;
    bit<160> exchange_symbol;
    bit<64> lot_size;
    bit<8> lot_size_decimal;
    bit<64> maturity_date;
    bit<8> settlement_type;
    bit<64> contract_size;
    bit<8> contract_size_decimals;
    bit<160> underlying;
    bit<8> option_type;
    bit<8> exercise_style;
    bit<64> strike_price;
}

header security_status_message_t {
    bit<32> security_id;
    bit<8> trading_status;
    bit<5> unused_5;
    bit<1> mac_run;
    bit<1> mac_open;
    bit<1> trading;
    bit<64> timestamp;
    bit<8> trading_phase;
}

header sequence_number_reset_message_t {
    bit<32> next_seq_no;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    snapshot_start_message_t snapshot_start_message[MAX_MESSAGES];
    book_status_message_t book_status_message[MAX_MESSAGES];
    book_entry_message_t book_entry_message[MAX_MESSAGES];
    tick_table_data_message_t tick_table_data_message[MAX_MESSAGES];
    security_definition_message_t security_definition_message[MAX_MESSAGES];
    security_definition_futures_message_t security_definition_futures_message[MAX_MESSAGES];
    security_definition_options_message_t security_definition_options_message[MAX_MESSAGES];
    security_status_message_t security_status_message[MAX_MESSAGES];
    sequence_number_reset_message_t sequence_number_reset_message[MAX_MESSAGES];
}

parser AsianextderivativesSnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.msg_type) {
            8w10: parse_snapshot_start_message;
            8w11: parse_book_status_message;
            8w12: parse_book_entry_message;
            8w7: parse_tick_table_data_message;
            8w8: parse_security_definition_message;
            8w30: parse_security_definition_futures_message;
            8w32: parse_security_definition_options_message;
            8w9: parse_security_status_message;
            8w29: parse_sequence_number_reset_message;
            default: accept;
        }
    }

    state parse_snapshot_start_message {
        packet.extract(hdr.snapshot_start_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_book_status_message {
        packet.extract(hdr.book_status_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_book_entry_message {
        packet.extract(hdr.book_entry_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_tick_table_data_message {
        packet.extract(hdr.tick_table_data_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_security_definition_message {
        packet.extract(hdr.security_definition_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_security_definition_futures_message {
        packet.extract(hdr.security_definition_futures_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_security_definition_options_message {
        packet.extract(hdr.security_definition_options_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control AsianextderivativesSnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsianextderivativesSnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AsianextderivativesSnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsianextderivativesSnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsianextderivativesSnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.snapshot_start_message);
        packet.emit(hdr.book_status_message);
        packet.emit(hdr.book_entry_message);
        packet.emit(hdr.tick_table_data_message);
        packet.emit(hdr.security_definition_message);
        packet.emit(hdr.security_definition_futures_message);
        packet.emit(hdr.security_definition_options_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.sequence_number_reset_message);
    }
}

V1Switch(
    AsianextderivativesSnapshotParser(),
    AsianextderivativesSnapshotVerifyChecksum(),
    AsianextderivativesSnapshotIngress(),
    AsianextderivativesSnapshotEgress(),
    AsianextderivativesSnapshotComputeChecksum(),
    AsianextderivativesSnapshotDeparser()
) main;
