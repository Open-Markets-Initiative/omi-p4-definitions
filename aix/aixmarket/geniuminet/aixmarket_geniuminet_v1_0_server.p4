// P4_16 (v1model) definition for: Aix AixMarket GeniumInet Glimpse v1.0
// 
// Protocol:
//   Organization: Astana International Exchange
//   Protocol: Genium Inet
//   Encoding: Glimpse
//   Version: 1.0
//   Date: 9/26/2025
//   Specification: new_GLIMPSE_ProtSpec_AIX_v1.docx.pdf
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
//   https://patents.google.com/patent/US20240129382A1/en
//   https://patents.google.com/patent/US20240419416A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header seconds_message_t {
    bit<32> second;
}

header order_book_directory_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> isin;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> number_of_decimals_in_price;
    bit<16> number_of_decimals_in_nominal_value;
    bit<32> odd_lot_size;
    bit<32> round_lot_size;
    bit<32> block_lot_size;
    bit<64> nominal_value;
    bit<8> reserved_1;
    bit<32> underlying_order_book_id;
    bit<32> strike_price;
    bit<32> expiration_date;
    bit<16> number_of_decimals_in_strike_price;
    bit<8> put_or_call;
    bit<8> ranking_type;
}

header tick_size_table_entry_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> tick_size;
    bit<32> price_from;
    bit<32> price_to;
}

header short_sell_status_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<8> short_sale_restriction;
}

header order_book_state_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<160> state_name;
}

header add_order_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> ranking_sequence_number;
    bit<64> quantity;
    bit<32> price;
    bit<16> order_attributes;
    bit<8> lot_type;
    bit<64> ranking_time;
}

header end_of_snapshot_message_t {
    bit<160> sequence_number;
}

header debug_packet_debug_text_t {
    varbit<2048> debug_text;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    seconds_message_t seconds_message;
    order_book_directory_message_t order_book_directory_message;
    tick_size_table_entry_message_t tick_size_table_entry_message;
    short_sell_status_message_t short_sell_status_message;
    order_book_state_message_t order_book_state_message;
    add_order_message_t add_order_message;
    end_of_snapshot_message_t end_of_snapshot_message;
    debug_packet_debug_text_t debug_packet_debug_text;
}

parser AixmarketGeniuminetServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat;
            8w0x5a: parse_end_of_session;
            default: accept;
        }
    }

    state parse_debug_packet {
        meta.dispatched = 1;
        packet.extract(hdr.debug_packet_debug_text, (bit<32>)hdr.server_packet_header.packet_length * 8);
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x54: parse_seconds_message;
            8w0x52: parse_order_book_directory_message;
            8w0x4c: parse_tick_size_table_entry_message;
            8w0x56: parse_short_sell_status_message;
            8w0x4f: parse_order_book_state_message;
            8w0x41: parse_add_order_message;
            8w0x47: parse_end_of_snapshot_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_directory_message {
        packet.extract(hdr.order_book_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tick_size_table_entry_message {
        packet.extract(hdr.tick_size_table_entry_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_short_sell_status_message {
        packet.extract(hdr.short_sell_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_state_message {
        packet.extract(hdr.order_book_state_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_snapshot_message {
        packet.extract(hdr.end_of_snapshot_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

}

control AixmarketGeniuminetServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AixmarketGeniuminetServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AixmarketGeniuminetServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AixmarketGeniuminetServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AixmarketGeniuminetServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet_debug_text);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.order_book_directory_message);
        packet.emit(hdr.tick_size_table_entry_message);
        packet.emit(hdr.short_sell_status_message);
        packet.emit(hdr.order_book_state_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.end_of_snapshot_message);
    }
}

V1Switch(
    AixmarketGeniuminetServerParser(),
    AixmarketGeniuminetServerVerifyChecksum(),
    AixmarketGeniuminetServerIngress(),
    AixmarketGeniuminetServerEgress(),
    AixmarketGeniuminetServerComputeChecksum(),
    AixmarketGeniuminetServerDeparser()
) main;
