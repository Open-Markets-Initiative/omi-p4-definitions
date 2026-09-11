// P4_16 (v1model) definition for: Nyse NyseEquities IntegratedFeed Pillar v2.5.g
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Integrated Feed
//   Encoding: Pillar
//   Version: 2.5.g
//   Date: 10/23/2025
//   Specification: NYSE_Pillar_Integrated_Feed_Client_Specification.pdf
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

header packet_header_t {
    bit<16> pkt_size;
    bit<8> delivery_flag;
    bit<8> number_msgs;
    bit<32> seq_num;
    bit<32> seconds;
    bit<32> nanoseconds;
}

header message_t {
    bit<16> message_size;
    bit<16> message_type;
}

header sequence_number_reset_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<8> product_id;
    bit<8> channel_id;
}

header source_time_reference_message_t {
    bit<32> id;
    bit<32> symbol_seq_num;
    bit<32> source_time;
}

header symbol_index_mapping_message_t {
    bit<32> symbol_index;
    bit<88> symbol;
    bit<8> reserved_1;
    bit<16> market_id;
    bit<8> system_id;
    bit<8> exchange_code;
    bit<8> price_scale_code;
    bit<8> security_type;
    bit<16> lot_size;
    bit<32> prev_close_price;
    bit<32> prev_close_volume;
    bit<8> price_resolution;
    bit<8> round_lot;
    bit<16> mpv;
    bit<16> unit_of_trade;
    bit<8> late_close_eligible;
    bit<8> eth_eligible;
}

header symbol_clear_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> next_source_seq_num;
}

header security_status_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<8> security_status;
    bit<8> halt_condition;
    bit<32> reserved_4;
    bit<32> price_1;
    bit<32> price_2;
    bit<8> ssr_triggering_exchange_id;
    bit<32> ssr_triggering_volume;
    bit<32> time;
    bit<8> ssr_state;
    bit<8> market_state;
    bit<8> session_state;
}

header add_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<64> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<40> firm_id;
    bit<8> reserved_1;
}

header modify_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<64> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> position_change;
    bit<8> side;
    bit<8> reserved_1;
}

header delete_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<64> order_id;
    bit<8> reserved_1;
}

header order_execution_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<64> order_id;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume;
    bit<8> printable_flag;
    bit<8> reserved_1;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<8> trade_cond_3;
    bit<8> trade_cond_4;
}

header replace_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<64> order_id;
    bit<64> new_order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<8> reserved_1;
}

header imbalance_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> reference_price;
    bit<32> paired_qty;
    bit<32> total_imbalance_qty;
    bit<32> market_imbalance_qty;
    bit<16> auction_time;
    bit<8> auction_type;
    bit<8> imbalance_side;
    bit<32> continuous_book_clearing_price;
    bit<32> auction_interest_clearing_price;
    bit<32> ssr_filing_price;
    bit<32> indicative_match_price;
    bit<32> upper_collar;
    bit<32> lower_collar;
    bit<8> auction_status;
    bit<8> freeze_status;
    bit<8> num_extensions;
    bit<32> unpaired_qty;
    bit<8> unpaired_side;
    bit<8> reserved_1;
}

header add_order_refresh_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<64> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<40> firm_id;
    bit<8> reserved_1;
}

header non_displayed_trade_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
    bit<32> price;
    bit<32> volume;
    bit<8> printable_flag;
    bit<8> trade_cond_1;
    bit<8> trade_cond_2;
    bit<8> trade_cond_3;
    bit<8> trade_cond_4;
}

header cross_trade_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> cross_id;
    bit<32> price;
    bit<32> volume;
    bit<8> cross_type;
}

header trade_cancel_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> trade_id;
}

header cross_correction_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> cross_id;
    bit<32> volume;
}

header retail_price_improvement_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<8> rpi_indicator;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    sequence_number_reset_message_t sequence_number_reset_message[MAX_MESSAGES];
    source_time_reference_message_t source_time_reference_message[MAX_MESSAGES];
    symbol_index_mapping_message_t symbol_index_mapping_message[MAX_MESSAGES];
    symbol_clear_message_t symbol_clear_message[MAX_MESSAGES];
    security_status_message_t security_status_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    modify_order_message_t modify_order_message[MAX_MESSAGES];
    delete_order_message_t delete_order_message[MAX_MESSAGES];
    order_execution_message_t order_execution_message[MAX_MESSAGES];
    replace_order_message_t replace_order_message[MAX_MESSAGES];
    imbalance_message_t imbalance_message[MAX_MESSAGES];
    add_order_refresh_message_t add_order_refresh_message[MAX_MESSAGES];
    non_displayed_trade_message_t non_displayed_trade_message[MAX_MESSAGES];
    cross_trade_message_t cross_trade_message[MAX_MESSAGES];
    trade_cancel_message_t trade_cancel_message[MAX_MESSAGES];
    cross_correction_message_t cross_correction_message[MAX_MESSAGES];
    retail_price_improvement_message_t retail_price_improvement_message[MAX_MESSAGES];
}

parser NyseequitiesIntegratedfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.delivery_flag) {
            8w1: parse_heartbeat;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            16w0x100: parse_sequence_number_reset_message;
            16w0x200: parse_source_time_reference_message;
            16w0x300: parse_symbol_index_mapping_message;
            16w0x2000: parse_symbol_clear_message;
            16w0x2200: parse_security_status_message;
            16w0x6400: parse_add_order_message;
            16w0x6500: parse_modify_order_message;
            16w0x6600: parse_delete_order_message;
            16w0x6700: parse_order_execution_message;
            16w0x6800: parse_replace_order_message;
            16w0x6900: parse_imbalance_message;
            16w0x6a00: parse_add_order_refresh_message;
            16w0x6e00: parse_non_displayed_trade_message;
            16w0x6f00: parse_cross_trade_message;
            16w0x7000: parse_trade_cancel_message;
            16w0x7100: parse_cross_correction_message;
            16w0x7200: parse_retail_price_improvement_message;
            default: accept;
        }
    }

    state parse_sequence_number_reset_message {
        packet.extract(hdr.sequence_number_reset_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_source_time_reference_message {
        packet.extract(hdr.source_time_reference_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_symbol_index_mapping_message {
        packet.extract(hdr.symbol_index_mapping_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_symbol_clear_message {
        packet.extract(hdr.symbol_clear_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_security_status_message {
        packet.extract(hdr.security_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_modify_order_message {
        packet.extract(hdr.modify_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_delete_order_message {
        packet.extract(hdr.delete_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_execution_message {
        packet.extract(hdr.order_execution_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_replace_order_message {
        packet.extract(hdr.replace_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_imbalance_message {
        packet.extract(hdr.imbalance_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_refresh_message {
        packet.extract(hdr.add_order_refresh_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_non_displayed_trade_message {
        packet.extract(hdr.non_displayed_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_cross_trade_message {
        packet.extract(hdr.cross_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_cancel_message {
        packet.extract(hdr.trade_cancel_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_cross_correction_message {
        packet.extract(hdr.cross_correction_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_retail_price_improvement_message {
        packet.extract(hdr.retail_price_improvement_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NyseequitiesIntegratedfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseequitiesIntegratedfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NyseequitiesIntegratedfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NyseequitiesIntegratedfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseequitiesIntegratedfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.sequence_number_reset_message);
        packet.emit(hdr.source_time_reference_message);
        packet.emit(hdr.symbol_index_mapping_message);
        packet.emit(hdr.symbol_clear_message);
        packet.emit(hdr.security_status_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.modify_order_message);
        packet.emit(hdr.delete_order_message);
        packet.emit(hdr.order_execution_message);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.imbalance_message);
        packet.emit(hdr.add_order_refresh_message);
        packet.emit(hdr.non_displayed_trade_message);
        packet.emit(hdr.cross_trade_message);
        packet.emit(hdr.trade_cancel_message);
        packet.emit(hdr.cross_correction_message);
        packet.emit(hdr.retail_price_improvement_message);
    }
}

V1Switch(
    NyseequitiesIntegratedfeedParser(),
    NyseequitiesIntegratedfeedVerifyChecksum(),
    NyseequitiesIntegratedfeedIngress(),
    NyseequitiesIntegratedfeedEgress(),
    NyseequitiesIntegratedfeedComputeChecksum(),
    NyseequitiesIntegratedfeedDeparser()
) main;
