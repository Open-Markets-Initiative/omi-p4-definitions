// P4_16 (v1model) definition for: Aquis AquisEquities RealTime Amd v4.0
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Real Time Market Data Feed
//   Encoding: Aquis Market Data Protocol
//   Version: 4.0
//   Date: 8/1/2025
//   Specification: Unknown
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

header order_add_t {
    bit<16> security_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<64> timestamp;
    bit<1> unrestricted_liquidity_indicator;
    bit<7> reserved_7;
}

header order_cancel_t {
    bit<16> security_id;
    bit<32> order_ref;
    bit<64> timestamp;
    bit<1> unrestricted_liquidity_indicator;
    bit<7> reserved_7;
}

header order_modify_t {
    bit<16> security_id;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<64> timestamp;
    bit<1> unrestricted_liquidity_indicator;
    bit<7> reserved_7;
}

header trade_t {
    bit<16> security_id;
    bit<8> trade_type;
    bit<32> quantity;
    bit<64> price;
    bit<32> order_ref;
    bit<32> trade_ref;
    bit<64> timestamp;
    bit<3> market_mechanism;
    bit<4> trading_mode;
    bit<3> transaction_category;
    bit<3> negotiation_indicator_or_pre_trade_transparency_waiver;
    bit<1> crossing_trade;
    bit<2> modification_indicator;
    bit<2> benchmark_reference_price_indicator;
    bit<1> dividend;
    bit<2> off_book_automation;
    bit<3> price_formation_discovery_process;
    bit<1> algorithmic_indicator;
    bit<3> publication_mode_post_trade_deferral;
    bit<1> deferral_type;
    bit<1> duplicative_indicator;
    bit<2> spare;
    bit<1> unrestricted_liquidity_indicator;
    bit<7> reserved_7;
}

header trade_bust_message_t {
    bit<16> security_id;
    bit<32> quantity;
    bit<64> price;
    bit<32> trade_ref;
    bit<64> timestamp;
    bit<3> market_mechanism;
    bit<4> trading_mode;
    bit<3> transaction_category;
    bit<3> negotiation_indicator_or_pre_trade_transparency_waiver;
    bit<1> crossing_trade;
    bit<2> modification_indicator;
    bit<2> benchmark_reference_price_indicator;
    bit<1> dividend;
    bit<2> off_book_automation;
    bit<3> price_formation_discovery_process;
    bit<1> algorithmic_indicator;
    bit<3> publication_mode_post_trade_deferral;
    bit<1> deferral_type;
    bit<1> duplicative_indicator;
    bit<2> spare;
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
    bit<1> mac_enabled;
    bit<1> test_stock;
    bit<1> illiquid;
    bit<1> reserved_1;
    bit<1> aod_enabled;
    bit<2> reserved_2;
    bit<1> avx_enabled;
    bit<8> reserved_8;
    bit<160> reserved_char_2020;
    bit<64> lot_size;
    bit<8> lot_size_decimal;
}

header security_status_message_t {
    bit<16> security_id;
    bit<8> trading_status;
    bit<1> trading;
    bit<1> mac_open;
    bit<1> mac_run;
    bit<5> reserved_5;
    bit<64> timestamp;
    bit<8> trading_phase;
}

header ao_d_update_message_t {
    bit<16> security_id;
    bit<64> indicative_price;
    bit<32> match_vol;
    bit<64> timestamp;
}

header ma_c_update_message_t {
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
    order_add_t order_add;
    order_cancel_t order_cancel;
    order_modify_t order_modify;
    trade_t trade;
    trade_bust_message_t trade_bust_message;
    tick_table_data_message_t tick_table_data_message;
    security_definition_message_t security_definition_message;
    security_status_message_t security_status_message;
    ao_d_update_message_t ao_d_update_message;
    ma_c_update_message_t ma_c_update_message;
}

parser AquisequitiesRealtimeParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w2: parse_order_add;
            8w3: parse_order_cancel;
            8w4: parse_order_modify;
            8w5: parse_trade;
            8w6: parse_trade_bust_message;
            8w7: parse_tick_table_data_message;
            8w8: parse_security_definition_message;
            8w9: parse_security_status_message;
            8w17: parse_ao_d_update_message;
            8w16: parse_ma_c_update_message;
            default: accept;
        }
    }

    state parse_order_add {
        packet.extract(hdr.order_add);
        transition accept;
    }

    state parse_order_cancel {
        packet.extract(hdr.order_cancel);
        transition accept;
    }

    state parse_order_modify {
        packet.extract(hdr.order_modify);
        transition accept;
    }

    state parse_trade {
        packet.extract(hdr.trade);
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

    state parse_ao_d_update_message {
        packet.extract(hdr.ao_d_update_message);
        transition accept;
    }

    state parse_ma_c_update_message {
        packet.extract(hdr.ma_c_update_message);
        transition accept;
    }

}

control AquisequitiesRealtimeVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesRealtimeIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AquisequitiesRealtimeEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisequitiesRealtimeComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesRealtimeDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.order_add);
        packet.emit(hdr.order_cancel);
        packet.emit(hdr.order_modify);
        packet.emit(hdr.trade);
        packet.emit(hdr.trade_bust_message);
        packet.emit(hdr.tick_table_data_message);
        packet.emit(hdr.security_definition_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.ao_d_update_message);
        packet.emit(hdr.ma_c_update_message);
    }
}

V1Switch(
    AquisequitiesRealtimeParser(),
    AquisequitiesRealtimeVerifyChecksum(),
    AquisequitiesRealtimeIngress(),
    AquisequitiesRealtimeEgress(),
    AquisequitiesRealtimeComputeChecksum(),
    AquisequitiesRealtimeDeparser()
) main;
