// P4_16 (v1model) definition for: Aquis RealTime Amd v1.2.3
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Real Time Market Data Feed
//   Encoding: Aquis Market Data Protocol
//   Version: 1.2.3
//   Date: 4/23/2024
//   Specification: Aquis Stock Exchange Multicast Market Data Specification v1.2.3 (2024).pdf
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

header packet_header_t {
    bit<8> message_count;
}

header packet_header_message_t {
    bit<8> msg_type;
    bit<8> msg_length;
    bit<32> seq_no;
}

header order_add_message_t {
    bit<16> security_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<64> timestamp;
}

header order_cancel_message_t {
    bit<16> security_id;
    bit<32> order_ref;
    bit<64> timestamp;
}

header order_modify_message_t {
    bit<16> security_id;
    bit<32> remaining_quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<64> timestamp;
}

header quote_add_replace_message_t {
    bit<16> trader_id;
    bit<16> security_id;
    bit<32> bid_quantity;
    bit<64> bid_price;
    bit<32> offer_quantity;
    bit<64> offer_price;
    bit<64> timestamp;
}

header quote_cancel_message_t {
    bit<16> trader_id;
    bit<16> security_id;
    bit<64> timestamp;
}

header trade_message_t {
    bit<16> security_id;
    bit<8> trade_type;
    bit<32> traded_quantity;
    bit<64> execution_price;
    bit<32> order_ref;
    bit<32> trade_ref;
    bit<64> timestamp;
    bit<32> binary_mmt;
}

header trade_report_message_t {
    bit<16> security_id;
    bit<8> trade_type;
    bit<32> traded_quantity;
    bit<64> execution_price;
    bit<32> trade_ref;
    bit<64> received_timestamp;
    bit<32> binary_mmt;
    bit<64> transact_time;
}

header trade_report_modify_message_t {
    bit<16> security_id;
    bit<8> trade_type;
    bit<32> traded_quantity;
    bit<64> execution_price;
    bit<32> trade_ref;
    bit<64> received_timestamp;
    bit<32> binary_mmt;
    bit<64> transact_time;
    bit<32> orig_trade_ref;
    bit<64> orig_timestamp;
}

header trade_report_cancel_message_t {
    bit<16> orig_security_id;
    bit<8> orig_trade_type;
    bit<32> orig_quantity;
    bit<64> orig_price;
    bit<32> trade_ref;
    bit<64> received_timestamp;
    bit<32> binary_mmt;
    bit<64> transact_time;
    bit<32> orig_trade_ref;
    bit<64> orig_timestamp;
    bit<64> orig_transact_time;
}

header trade_bust_message_t {
    bit<16> security_id;
    bit<32> traded_quantity;
    bit<64> execution_price;
    bit<32> trade_ref;
    bit<64> timestamp;
    bit<32> binary_mmt;
}

header security_statistics_message_t {
    bit<16> security_id;
    bit<64> statistics_price;
    bit<8> price_type;
    bit<64> timestamp;
}

header trader_definition_message_t {
    bit<16> trader_id;
    bit<128> sender_id;
}

header tick_table_data_message_t {
    bit<8> tick_table_id;
    bit<80> name;
    bit<64> threshold;
    bit<64> tick_size;
}

header security_definition_message_t {
    bit<16> security_id;
    bit<48> umtf;
    bit<96> isin;
    bit<24> currency;
    bit<32> mic;
    bit<8> tick_table_id;
}

header security_status_message_t {
    bit<16> security_id;
    bit<8> trading_status;
    bit<4> unused_4;
    bit<1> pre_open_close;
    bit<2> unused_2;
    bit<1> trading;
    bit<64> timestamp;
}

header aod_update_message_t {
    bit<16> security_id;
    bit<64> indicative_price;
    bit<32> match_vol;
    bit<64> timestamp;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    order_add_message_t order_add_message[MAX_MESSAGES];
    order_cancel_message_t order_cancel_message[MAX_MESSAGES];
    order_modify_message_t order_modify_message[MAX_MESSAGES];
    quote_add_replace_message_t quote_add_replace_message[MAX_MESSAGES];
    quote_cancel_message_t quote_cancel_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    trade_report_modify_message_t trade_report_modify_message[MAX_MESSAGES];
    trade_report_cancel_message_t trade_report_cancel_message[MAX_MESSAGES];
    trade_bust_message_t trade_bust_message[MAX_MESSAGES];
    security_statistics_message_t security_statistics_message[MAX_MESSAGES];
    trader_definition_message_t trader_definition_message[MAX_MESSAGES];
    tick_table_data_message_t tick_table_data_message[MAX_MESSAGES];
    security_definition_message_t security_definition_message[MAX_MESSAGES];
    security_status_message_t security_status_message[MAX_MESSAGES];
    aod_update_message_t aod_update_message[MAX_MESSAGES];
}

parser AquisstockexchangeRealtimeParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w1: parse_heartbeat_message;
            8w2: parse_order_add_message;
            8w3: parse_order_cancel_message;
            8w4: parse_order_modify_message;
            8w20: parse_quote_add_replace_message;
            8w21: parse_quote_cancel_message;
            8w5: parse_trade_message;
            8w25: parse_trade_report_message;
            8w26: parse_trade_report_modify_message;
            8w27: parse_trade_report_cancel_message;
            8w6: parse_trade_bust_message;
            8w22: parse_security_statistics_message;
            8w23: parse_trader_definition_message;
            8w7: parse_tick_table_data_message;
            8w8: parse_security_definition_message;
            8w9: parse_security_status_message;
            8w17: parse_aod_update_message;
            default: accept;
        }
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_add_message {
        packet.extract(hdr.order_add_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_order_modify_message {
        packet.extract(hdr.order_modify_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_quote_add_replace_message {
        packet.extract(hdr.quote_add_replace_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_quote_cancel_message {
        packet.extract(hdr.quote_cancel_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_report_modify_message {
        packet.extract(hdr.trade_report_modify_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_report_cancel_message {
        packet.extract(hdr.trade_report_cancel_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_security_statistics_message {
        packet.extract(hdr.security_statistics_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_trader_definition_message {
        packet.extract(hdr.trader_definition_message.next);
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

    state parse_security_status_message {
        packet.extract(hdr.security_status_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_aod_update_message {
        packet.extract(hdr.aod_update_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control AquisstockexchangeRealtimeVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisstockexchangeRealtimeIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AquisstockexchangeRealtimeEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisstockexchangeRealtimeComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisstockexchangeRealtimeDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.order_add_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_modify_message);
        packet.emit(hdr.quote_add_replace_message);
        packet.emit(hdr.quote_cancel_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_report_modify_message);
        packet.emit(hdr.trade_report_cancel_message);
        packet.emit(hdr.trade_bust_message);
        packet.emit(hdr.security_statistics_message);
        packet.emit(hdr.trader_definition_message);
        packet.emit(hdr.tick_table_data_message);
        packet.emit(hdr.security_definition_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.aod_update_message);
    }
}

V1Switch(
    AquisstockexchangeRealtimeParser(),
    AquisstockexchangeRealtimeVerifyChecksum(),
    AquisstockexchangeRealtimeIngress(),
    AquisstockexchangeRealtimeEgress(),
    AquisstockexchangeRealtimeComputeChecksum(),
    AquisstockexchangeRealtimeDeparser()
) main;
