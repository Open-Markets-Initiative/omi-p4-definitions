// P4_16 (v1model) definition for: A2X A2XEquities Rtmdf Amd v1.3.2
// 
// Protocol:
//   Organization: A2X Markets
//   Protocol: Real Time Market Data Feed
//   Encoding: A2X Market Data
//   Version: 1.3.2
//   Date: 9/15/2022
//   Specification: A2X712-Market-Data-Techincal-Specification-v1.3.2.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<8> message_count;
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
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<64> timestamp;
}

header trade_message_t {
    bit<16> security_id;
    bit<8> trade_type;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<32> trade_ref;
    bit<64> timestamp;
}

header trade_bust_message_t {
    bit<16> security_id;
    bit<32> quantity;
    bit<64> price;
    bit<32> trade_ref;
    bit<64> timestamp;
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
    bit<10> unused_10;
    bit<1> aod_enabled;
    bit<1> unused_1;
    bit<1> illiquid;
    bit<2> test_stock;
    bit<1> mac_enabled;
}

header security_status_message_t {
    bit<16> security_id;
    bit<8> trading_status;
    bit<5> unused_5;
    bit<1> mac_run;
    bit<1> mac_open;
    bit<1> trading;
    bit<64> timestamp;
}

header auction_on_demand_message_t {
    bit<16> security_id;
    bit<64> indicative_price;
    bit<32> match_vol;
    bit<64> timestamp;
}

header market_at_close_t {
    bit<16> security_id;
    bit<64> indicative_price;
    bit<32> closing_buy_qty;
    bit<32> closing_sell_qty;
    bit<64> timestamp;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    order_add_message_t order_add_message;
    order_cancel_message_t order_cancel_message;
    order_modify_message_t order_modify_message;
    trade_message_t trade_message;
    trade_bust_message_t trade_bust_message;
    tick_table_data_message_t tick_table_data_message;
    security_definition_message_t security_definition_message;
    security_status_message_t security_status_message;
    auction_on_demand_message_t auction_on_demand_message;
    market_at_close_t market_at_close;
}

parser A2xA2xequitiesRtmdfParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w2: parse_order_add_message;
            8w3: parse_order_cancel_message;
            8w4: parse_order_modify_message;
            8w5: parse_trade_message;
            8w6: parse_trade_bust_message;
            8w7: parse_tick_table_data_message;
            8w8: parse_security_definition_message;
            8w9: parse_security_status_message;
            8w17: parse_auction_on_demand_message;
            8w16: parse_market_at_close;
            default: accept;
        }
    }

    state parse_order_add_message {
        packet.extract(hdr.order_add_message);
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        transition accept;
    }

    state parse_order_modify_message {
        packet.extract(hdr.order_modify_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message);
        transition accept;
    }

    state parse_tick_table_data_message {
        packet.extract(hdr.tick_table_data_message);
        transition accept;
    }

    state parse_security_definition_message {
        packet.extract(hdr.security_definition_message);
        transition accept;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message);
        transition accept;
    }

    state parse_auction_on_demand_message {
        packet.extract(hdr.auction_on_demand_message);
        transition accept;
    }

    state parse_market_at_close {
        packet.extract(hdr.market_at_close);
        transition accept;
    }

}

control A2xA2xequitiesRtmdfVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xA2xequitiesRtmdfIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control A2xA2xequitiesRtmdfEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control A2xA2xequitiesRtmdfComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xA2xequitiesRtmdfDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.order_add_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_modify_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_bust_message);
        packet.emit(hdr.tick_table_data_message);
        packet.emit(hdr.security_definition_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.auction_on_demand_message);
        packet.emit(hdr.market_at_close);
    }
}

V1Switch(
    A2xA2xequitiesRtmdfParser(),
    A2xA2xequitiesRtmdfVerifyChecksum(),
    A2xA2xequitiesRtmdfIngress(),
    A2xA2xequitiesRtmdfEgress(),
    A2xA2xequitiesRtmdfComputeChecksum(),
    A2xA2xequitiesRtmdfDeparser()
) main;
