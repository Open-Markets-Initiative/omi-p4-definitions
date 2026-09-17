// P4_16 (v1model) definition for: Biva BivaEquities TotalView Glimpse v1.12
// 
// Protocol:
//   Organization: Bolsa Institucional de Valores
//   Protocol: Total View
//   Encoding: Glimpse
//   Version: 1.12
//   Date: 1/1/2022
//   Specification: BIVA_X-Stream_External_ITCH_Specification_v1.12.0.pdf
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

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<64> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header time_stamp_seconds_message_t {
    bit<32> second;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<64> group;
    bit<8> event_code;
    bit<32> orderbook;
}

header price_tick_size_message_t {
    bit<32> nanoseconds;
    bit<32> tick_size_table_id;
    bit<32> price_tick_size;
    bit<32> price_start;
}

header quantity_tick_size_message_t {
    bit<32> nanoseconds;
    bit<32> tick_size_table_id;
    bit<64> quantity_tick_size;
    bit<64> quantity_start;
}

header orderbook_directory_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook;
    bit<96> isin;
    bit<120> sec_code;
    bit<24> currency;
    bit<64> group;
    bit<64> minimum_quantity;
    bit<32> quantity_tick_size_table_id;
    bit<32> quantity_decimals;
    bit<32> price_tick_size_table_id;
    bit<32> price_decimals;
    bit<32> delisting_or_maturity_date;
    bit<32> delisting_time;
    bit<8> turnover_ratio;
    bit<24> quotation_basis;
    bit<96> instrument;
    bit<8> listing_type;
    bit<32> listing_exchange;
}

header participant_directory_message_t {
    bit<32> nanoseconds;
    bit<32> participant_id;
    bit<96> participant_code;
}

header orderbook_trading_action_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook;
    bit<8> trading_state;
    bit<8> trading_action_reason;
}

header orderbook_reference_price_message_t {
    bit<32> nanoseconds;
    bit<32> orderbook;
    bit<32> reference_price;
    bit<8> price_type;
    bit<8> reference_price_reason;
}

header add_order_message_t {
    bit<32> nanoseconds;
    bit<64> order_number;
    bit<8> order_verb;
    bit<64> quantity;
    bit<32> orderbook;
    bit<32> price;
    bit<32> participant_id;
}

header indicative_price_quantity_message_t {
    bit<32> nanoseconds;
    bit<64> theoretical_opening_quantity;
    bit<32> orderbook;
    bit<32> best_bid;
    bit<32> best_offer;
    bit<32> theoretical_opening_price;
    bit<8> cross_type;
}

header glimpse_snapshot_message_t {
    bit<64> sequence_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    time_stamp_seconds_message_t time_stamp_seconds_message;
    system_event_message_t system_event_message;
    price_tick_size_message_t price_tick_size_message;
    quantity_tick_size_message_t quantity_tick_size_message;
    orderbook_directory_message_t orderbook_directory_message;
    participant_directory_message_t participant_directory_message;
    orderbook_trading_action_message_t orderbook_trading_action_message;
    orderbook_reference_price_message_t orderbook_reference_price_message;
    add_order_message_t add_order_message;
    indicative_price_quantity_message_t indicative_price_quantity_message;
    glimpse_snapshot_message_t glimpse_snapshot_message;
}

parser BivaequitiesTotalviewServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
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
            8w0x54: parse_time_stamp_seconds_message;
            8w0x53: parse_system_event_message;
            8w0x4c: parse_price_tick_size_message;
            8w0x4d: parse_quantity_tick_size_message;
            8w0x52: parse_orderbook_directory_message;
            8w0x46: parse_participant_directory_message;
            8w0x48: parse_orderbook_trading_action_message;
            8w0x58: parse_orderbook_reference_price_message;
            8w0x41: parse_add_order_message;
            8w0x49: parse_indicative_price_quantity_message;
            8w0x47: parse_glimpse_snapshot_message;
            default: accept;
        }
    }

    state parse_time_stamp_seconds_message {
        packet.extract(hdr.time_stamp_seconds_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_tick_size_message {
        packet.extract(hdr.price_tick_size_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quantity_tick_size_message {
        packet.extract(hdr.quantity_tick_size_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_orderbook_directory_message {
        packet.extract(hdr.orderbook_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_participant_directory_message {
        packet.extract(hdr.participant_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_orderbook_trading_action_message {
        packet.extract(hdr.orderbook_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_orderbook_reference_price_message {
        packet.extract(hdr.orderbook_reference_price_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indicative_price_quantity_message {
        packet.extract(hdr.indicative_price_quantity_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_glimpse_snapshot_message {
        packet.extract(hdr.glimpse_snapshot_message);
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

control BivaequitiesTotalviewServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesTotalviewServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BivaequitiesTotalviewServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BivaequitiesTotalviewServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BivaequitiesTotalviewServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.time_stamp_seconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.price_tick_size_message);
        packet.emit(hdr.quantity_tick_size_message);
        packet.emit(hdr.orderbook_directory_message);
        packet.emit(hdr.participant_directory_message);
        packet.emit(hdr.orderbook_trading_action_message);
        packet.emit(hdr.orderbook_reference_price_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.indicative_price_quantity_message);
        packet.emit(hdr.glimpse_snapshot_message);
    }
}

V1Switch(
    BivaequitiesTotalviewServerParser(),
    BivaequitiesTotalviewServerVerifyChecksum(),
    BivaequitiesTotalviewServerIngress(),
    BivaequitiesTotalviewServerEgress(),
    BivaequitiesTotalviewServerComputeChecksum(),
    BivaequitiesTotalviewServerDeparser()
) main;
