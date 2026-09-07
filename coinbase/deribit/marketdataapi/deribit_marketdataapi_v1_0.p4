// P4_16 (v1model) definition for: Coinbase Deribit MarketDataApi Sbe v1.0
// 
// Protocol:
//   Organization: Coinbase
//   Protocol: Market Data Api
//   Encoding: Simple Binary Encoding
//   Version: 1.0
//   Date: 6/8/2026
//   Specification: Unknown
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

header message_flags_t {
    bit<64> sending_time;
    bit<64> seq_num;
    bit<32> channel_id;
    bit<1> incremental_update;
    bit<1> snapshot;
    bit<1> retransmit;
    bit<13> reserved_bits;
    bit<16> message_count;
    bit<16> message_length;
    bit<16> template_id;
    bit<16> schema_version;
    bit<1> start_of_transaction;
    bit<1> end_of_transaction;
    bit<14> reserved_bits_2;
    bit<64> transact_time;
}

header instrument_definition_message_t {
    bit<64> instrument_id;
    bit<1024> name;
    bit<64> index_id;
    bit<512> underlying;
    bit<64> quantity_asset;
    bit<64> price_asset;
    bit<64> expiry_time;
    bit<64> strike_price;
    bit<64> min_order_quantity;
    bit<64> tick_size;
    bit<8> quantity_exponent;
    bit<8> type_;
    bit<1> is_reversed;
    bit<1> is_put_option;
    bit<1> is_perpetual;
    bit<5> reserved_5;
    bit<8> status;
    bit<16> block_length;
    bit<16> num_in_group;
}

header instrument_definition_message_instrument_definition_message_large_tick_sizes_group_t {
    bit<64> large_tick_size;
    bit<64> threshold_price;
}

header instrument_definition_message_instrument_definition_message_legs_group_header_t {
    bit<16> block_length;
    bit<16> num_in_group;
}

header instrument_definition_message_instrument_definition_message_legs_group_t {
    bit<64> leg_instrument_id;
    bit<8> ratio;
}

header index_definition_message_t {
    bit<64> index_id;
    bit<1024> name;
}

header instrument_info_message_t {
    bit<64> instrument_id;
    bit<64> min_sell_price;
    bit<64> max_buy_price;
    bit<64> index_price;
    bit<64> mark_price;
}

header instrument_ref_message_t {
    bit<64> instrument_id;
    bit<64> current_funding;
    bit<64> funding_8h;
    bit<64> estimated_delivery_price;
    bit<64> delivery_price;
    bit<64> settlement_price;
}

header instrument_status_update_message_t {
    bit<64> instrument_id;
    bit<8> trading_status;
}

header bid_put_message_t {
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> quantity_mantissa;
    bit<64> price;
    bit<64> sort_order_id;
}

header ask_put_message_t {
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> quantity_mantissa;
    bit<64> price;
    bit<64> sort_order_id;
}

header bid_qty_reduced_message_t {
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> quantity_mantissa;
}

header ask_qty_reduced_message_t {
    bit<64> order_id;
    bit<64> instrument_id;
    bit<64> quantity_mantissa;
}

header bid_delete_message_t {
    bit<64> order_id;
    bit<64> instrument_id;
}

header ask_delete_message_t {
    bit<64> order_id;
    bit<64> instrument_id;
}

header trade_summary_message_t {
    bit<64> instrument_id;
    bit<64> taker_order_id;
    bit<64> total_filled_mantissa;
    bit<64> deepest_price;
    bit<64> mark_price;
    bit<64> index_price;
    bit<32> trade_count;
    bit<1> is_sell;
    bit<1> is_liquidation;
    bit<30> reserved_30;
}

header trade_message_t {
    bit<64> match_id;
    bit<64> instrument_id;
    bit<64> maker_order_id;
    bit<64> fill_qty_mantissa;
    bit<64> fill_price;
    bit<1> is_sell;
    bit<1> is_liquidation;
    bit<30> reserved_30;
}

header block_trade_message_t {
    bit<64> match_id;
    bit<64> instrument_id;
    bit<64> block_trade_id;
    bit<64> block_rfq_id;
    bit<64> fill_qty_mantissa;
    bit<64> fill_price;
    bit<64> mark_price;
    bit<64> index_price;
    bit<64> implied_volatility;
    bit<1> is_sell;
    bit<1> is_liquidation;
    bit<30> reserved_30;
    bit<16> number_of_legs;
}

header snapshot_header_message_t {
    bit<64> instrument_id;
    bit<64> incremental_timestamp;
    bit<64> incremental_seq_num;
}

header snapshot_trailer_message_t {
    bit<64> instrument_id;
    bit<64> timestamp;
    bit<64> increment_seq_num;
}

header end_of_cycle_message_t {
    bit<32> active_instrument_count;
}

header retransmit_request_message_t {
    bit<64> begin_seq_num;
    bit<8> message_count_uint_8;
}

header retransmit_reject_message_t {
    bit<64> retry_delay_nanos;
    bit<320> details;
    bit<8> reason;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> instrument_definition_message_instrument_definition_message_large_tick_sizes_group_remaining;
    bit<16> instrument_definition_message_instrument_definition_message_legs_group_remaining;
}

struct headers_t {
    message_flags_t message_flags;
    instrument_definition_message_t instrument_definition_message;
    instrument_definition_message_instrument_definition_message_large_tick_sizes_group_t instrument_definition_message_instrument_definition_message_large_tick_sizes_group[MAX_MESSAGES];
    instrument_definition_message_instrument_definition_message_legs_group_header_t instrument_definition_message_instrument_definition_message_legs_group_header;
    instrument_definition_message_instrument_definition_message_legs_group_t instrument_definition_message_instrument_definition_message_legs_group[MAX_MESSAGES];
    index_definition_message_t index_definition_message;
    instrument_info_message_t instrument_info_message;
    instrument_ref_message_t instrument_ref_message;
    instrument_status_update_message_t instrument_status_update_message;
    bid_put_message_t bid_put_message;
    ask_put_message_t ask_put_message;
    bid_qty_reduced_message_t bid_qty_reduced_message;
    ask_qty_reduced_message_t ask_qty_reduced_message;
    bid_delete_message_t bid_delete_message;
    ask_delete_message_t ask_delete_message;
    trade_summary_message_t trade_summary_message;
    trade_message_t trade_message;
    block_trade_message_t block_trade_message;
    snapshot_header_message_t snapshot_header_message;
    snapshot_trailer_message_t snapshot_trailer_message;
    end_of_cycle_message_t end_of_cycle_message;
    retransmit_request_message_t retransmit_request_message;
    retransmit_reject_message_t retransmit_reject_message;
}

parser DeribitMarketdataapiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_flags);
        transition select(hdr.message_flags.template_id) {
            16w0xa00: parse_instrument_definition_message;
            16w0xb00: parse_index_definition_message;
            16w0xe00: parse_instrument_info_message;
            16w0xf00: parse_instrument_ref_message;
            16w0x1000: parse_instrument_status_update_message;
            16w0x1400: parse_bid_put_message;
            16w0x1500: parse_ask_put_message;
            16w0x1600: parse_bid_qty_reduced_message;
            16w0x1700: parse_ask_qty_reduced_message;
            16w0x1800: parse_bid_delete_message;
            16w0x1900: parse_ask_delete_message;
            16w0x1e00: parse_trade_summary_message;
            16w0x1f00: parse_trade_message;
            16w0x2100: parse_block_trade_message;
            16w0x6400: parse_snapshot_header_message;
            16w0x6500: parse_snapshot_trailer_message;
            16w0x7700: parse_end_of_cycle_message;
            16w0xc800: parse_retransmit_request_message;
            16w0xca00: parse_retransmit_reject_message;
            default: accept;
        }
    }

    state parse_instrument_definition_message {
        packet.extract(hdr.instrument_definition_message);
        meta.dispatched = 1;
        meta.instrument_definition_message_instrument_definition_message_large_tick_sizes_group_remaining = hdr.instrument_definition_message.num_in_group;
        transition select(meta.instrument_definition_message_instrument_definition_message_large_tick_sizes_group_remaining) {
            16w0: read_instrument_definition_message_instrument_definition_message_legs_group;
            default: parse_instrument_definition_message_instrument_definition_message_large_tick_sizes_group;
        }
    }

    state parse_instrument_definition_message_instrument_definition_message_large_tick_sizes_group {
        packet.extract(hdr.instrument_definition_message_instrument_definition_message_large_tick_sizes_group.next);
        meta.instrument_definition_message_instrument_definition_message_large_tick_sizes_group_remaining = meta.instrument_definition_message_instrument_definition_message_large_tick_sizes_group_remaining - 1;
        transition select(meta.instrument_definition_message_instrument_definition_message_large_tick_sizes_group_remaining) {
            16w0: read_instrument_definition_message_instrument_definition_message_legs_group;
            default: parse_instrument_definition_message_instrument_definition_message_large_tick_sizes_group;
        }
    }

    state read_instrument_definition_message_instrument_definition_message_legs_group {
        packet.extract(hdr.instrument_definition_message_instrument_definition_message_legs_group_header);
        meta.instrument_definition_message_instrument_definition_message_legs_group_remaining = hdr.instrument_definition_message_instrument_definition_message_legs_group_header.num_in_group;
        transition select(meta.instrument_definition_message_instrument_definition_message_legs_group_remaining) {
            16w0: accept;
            default: parse_instrument_definition_message_instrument_definition_message_legs_group;
        }
    }

    state parse_instrument_definition_message_instrument_definition_message_legs_group {
        packet.extract(hdr.instrument_definition_message_instrument_definition_message_legs_group.next);
        meta.instrument_definition_message_instrument_definition_message_legs_group_remaining = meta.instrument_definition_message_instrument_definition_message_legs_group_remaining - 1;
        transition select(meta.instrument_definition_message_instrument_definition_message_legs_group_remaining) {
            16w0: accept;
            default: parse_instrument_definition_message_instrument_definition_message_legs_group;
        }
    }

    state parse_index_definition_message {
        packet.extract(hdr.index_definition_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_info_message {
        packet.extract(hdr.instrument_info_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_ref_message {
        packet.extract(hdr.instrument_ref_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_status_update_message {
        packet.extract(hdr.instrument_status_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bid_put_message {
        packet.extract(hdr.bid_put_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ask_put_message {
        packet.extract(hdr.ask_put_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bid_qty_reduced_message {
        packet.extract(hdr.bid_qty_reduced_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ask_qty_reduced_message {
        packet.extract(hdr.ask_qty_reduced_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bid_delete_message {
        packet.extract(hdr.bid_delete_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_ask_delete_message {
        packet.extract(hdr.ask_delete_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_summary_message {
        packet.extract(hdr.trade_summary_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_block_trade_message {
        packet.extract(hdr.block_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_header_message {
        packet.extract(hdr.snapshot_header_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_trailer_message {
        packet.extract(hdr.snapshot_trailer_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_cycle_message {
        packet.extract(hdr.end_of_cycle_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_request_message {
        packet.extract(hdr.retransmit_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_reject_message {
        packet.extract(hdr.retransmit_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control DeribitMarketdataapiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DeribitMarketdataapiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control DeribitMarketdataapiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control DeribitMarketdataapiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DeribitMarketdataapiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_flags);
        packet.emit(hdr.instrument_definition_message);
        packet.emit(hdr.instrument_definition_message_instrument_definition_message_large_tick_sizes_group);
        packet.emit(hdr.instrument_definition_message_instrument_definition_message_legs_group_header);
        packet.emit(hdr.instrument_definition_message_instrument_definition_message_legs_group);
        packet.emit(hdr.index_definition_message);
        packet.emit(hdr.instrument_info_message);
        packet.emit(hdr.instrument_ref_message);
        packet.emit(hdr.instrument_status_update_message);
        packet.emit(hdr.bid_put_message);
        packet.emit(hdr.ask_put_message);
        packet.emit(hdr.bid_qty_reduced_message);
        packet.emit(hdr.ask_qty_reduced_message);
        packet.emit(hdr.bid_delete_message);
        packet.emit(hdr.ask_delete_message);
        packet.emit(hdr.trade_summary_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.block_trade_message);
        packet.emit(hdr.snapshot_header_message);
        packet.emit(hdr.snapshot_trailer_message);
        packet.emit(hdr.end_of_cycle_message);
        packet.emit(hdr.retransmit_request_message);
        packet.emit(hdr.retransmit_reject_message);
    }
}

V1Switch(
    DeribitMarketdataapiParser(),
    DeribitMarketdataapiVerifyChecksum(),
    DeribitMarketdataapiIngress(),
    DeribitMarketdataapiEgress(),
    DeribitMarketdataapiComputeChecksum(),
    DeribitMarketdataapiDeparser()
) main;
