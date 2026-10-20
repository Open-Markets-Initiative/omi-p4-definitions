// P4_16 (v1model) definition for: Jpx OseDerivatives GeniumInet Glimpse v2.2
// 
// Protocol:
//   Organization: Japan Exchange Group
//   Protocol: Genium Inet
//   Encoding: Glimpse
//   Version: 2.2
//   Date: 10/31/2025
//   Specification: J-GATE3.0_ITCH_Connectivity_Manual_V2.2.pdf
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

header series_information_basic_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<256> symbol;
    bit<256> long_name;
    bit<96> reserved_12;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<16> number_of_decimals_in_price;
    bit<16> number_of_decimals_in_nominal_value;
    bit<32> odd_lot_size;
    bit<32> round_lot_size;
    bit<32> block_lot_size;
    bit<64> nominal_value;
    bit<8> number_of_legs;
    bit<32> underlying_order_book_id;
    bit<32> strike_price;
    bit<32> expiration_date;
    bit<16> number_of_decimals_in_strike_price;
    bit<8> put_or_call;
}

header series_information_basic_combination_message_t {
    bit<32> nanoseconds;
    bit<32> combination_order_book_id;
    bit<32> leg_order_book_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header tick_size_data_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> tick_size;
    bit<32> price_from;
    bit<32> price_to;
}

header system_event_data_message_t {
    bit<32> nanoseconds;
    bit<8> event_code;
}

header trading_status_data_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<160> state_name;
}

header new_order_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<32> order_book_position;
    bit<64> quantity;
    bit<32> price;
    bit<16> order_attributes;
    bit<8> lot_type;
}

header execution_notice_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<56> reserved_7_a;
    bit<56> reserved_7_b;
}

header execution_notice_with_trade_information_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> executed_quantity;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<56> reserved_7_a;
    bit<56> reserved_7_b;
    bit<32> trade_price;
    bit<8> occurred_at_cross;
    bit<8> printable;
}

header deleted_order_message_t {
    bit<32> nanoseconds;
    bit<64> order_id;
    bit<32> order_book_id;
    bit<8> side;
}

header ep_message_t {
    bit<32> nanoseconds;
    bit<32> order_book_id;
    bit<64> available_bid_quantity_at_equilibrium_price;
    bit<64> available_ask_quantity_at_equilibrium_price;
    bit<32> equilibrium_price;
    bit<32> reserved_4_a;
    bit<32> reserved_4_b;
    bit<64> reserved_8_a;
    bit<64> reserved_8_b;
}

header snapshot_completion_message_t {
    bit<160> sequence;
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
    series_information_basic_message_t series_information_basic_message;
    series_information_basic_combination_message_t series_information_basic_combination_message;
    tick_size_data_message_t tick_size_data_message;
    system_event_data_message_t system_event_data_message;
    trading_status_data_message_t trading_status_data_message;
    new_order_message_t new_order_message;
    execution_notice_message_t execution_notice_message;
    execution_notice_with_trade_information_message_t execution_notice_with_trade_information_message;
    deleted_order_message_t deleted_order_message;
    ep_message_t ep_message;
    snapshot_completion_message_t snapshot_completion_message;
    debug_packet_debug_text_t debug_packet_debug_text;
}

parser OsederivativesGeniuminetServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x52: parse_series_information_basic_message;
            8w0x4d: parse_series_information_basic_combination_message;
            8w0x4c: parse_tick_size_data_message;
            8w0x53: parse_system_event_data_message;
            8w0x4f: parse_trading_status_data_message;
            8w0x41: parse_new_order_message;
            8w0x45: parse_execution_notice_message;
            8w0x43: parse_execution_notice_with_trade_information_message;
            8w0x44: parse_deleted_order_message;
            8w0x5a: parse_ep_message;
            8w0x47: parse_snapshot_completion_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_series_information_basic_message {
        packet.extract(hdr.series_information_basic_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_series_information_basic_combination_message {
        packet.extract(hdr.series_information_basic_combination_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tick_size_data_message {
        packet.extract(hdr.tick_size_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_data_message {
        packet.extract(hdr.system_event_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trading_status_data_message {
        packet.extract(hdr.trading_status_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_notice_message {
        packet.extract(hdr.execution_notice_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_notice_with_trade_information_message {
        packet.extract(hdr.execution_notice_with_trade_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_deleted_order_message {
        packet.extract(hdr.deleted_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ep_message {
        packet.extract(hdr.ep_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_completion_message {
        packet.extract(hdr.snapshot_completion_message);
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

control OsederivativesGeniuminetServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesGeniuminetServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control OsederivativesGeniuminetServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsederivativesGeniuminetServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesGeniuminetServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet_debug_text);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.series_information_basic_message);
        packet.emit(hdr.series_information_basic_combination_message);
        packet.emit(hdr.tick_size_data_message);
        packet.emit(hdr.system_event_data_message);
        packet.emit(hdr.trading_status_data_message);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.execution_notice_message);
        packet.emit(hdr.execution_notice_with_trade_information_message);
        packet.emit(hdr.deleted_order_message);
        packet.emit(hdr.ep_message);
        packet.emit(hdr.snapshot_completion_message);
    }
}

V1Switch(
    OsederivativesGeniuminetServerParser(),
    OsederivativesGeniuminetServerVerifyChecksum(),
    OsederivativesGeniuminetServerIngress(),
    OsederivativesGeniuminetServerEgress(),
    OsederivativesGeniuminetServerComputeChecksum(),
    OsederivativesGeniuminetServerDeparser()
) main;
