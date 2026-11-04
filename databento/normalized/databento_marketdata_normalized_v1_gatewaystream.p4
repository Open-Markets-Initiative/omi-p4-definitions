// P4_16 (v1model) definition for: Databento Normalized Dbn v1
// 
// Protocol:
//   Organization: Databento
//   Protocol: Normalized
//   Encoding: Databento Binary Encoding
//   Version: 1
//   Date: 10/4/2026
//   Specification: Unknown
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

header greeting_t {
    bit<24> magic;
    bit<8> version;
    bit<32> metadata_length;
    bit<128> dataset;
    bit<16> schema;
    bit<64> start;
    bit<64> end;
    bit<64> limit;
    bit<64> metadata_reserved_8;
    bit<8> stype_in;
    bit<8> stype_out;
    bit<8> ts_out;
    bit<376> metadata_reserved;
    bit<32> schema_definition_length;
    bit<32> symbols_count;
    bit<176> symbol;
    bit<32> partial_count;
    bit<176> partial_symbol;
    bit<32> not_found_count;
    bit<176> not_found_symbol;
    bit<32> mappings_count;
}

header trade_msg_t {
    bit<64> price;
    bit<32> size;
    bit<8> action_;
    bit<8> side;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> depth;
    bit<64> ts_recv;
    bit<32> ts_in_delta;
    bit<32> sequence;
}

header mbp_1_msg_t {
    bit<64> price;
    bit<32> size;
    bit<8> action_;
    bit<8> side;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> depth;
    bit<64> ts_recv;
    bit<32> ts_in_delta;
    bit<32> sequence;
    bit<64> bid_px;
    bit<64> ask_px;
    bit<32> bid_sz;
    bit<32> ask_sz;
    bit<32> bid_ct;
    bit<32> ask_ct;
}

header mbp_10_msg_t {
    bit<64> price;
    bit<32> size;
    bit<8> action_;
    bit<8> side;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> depth;
    bit<64> ts_recv;
    bit<32> ts_in_delta;
    bit<32> sequence;
}

header mbp_10_msg_bid_ask_pair_t {
    bit<64> bid_px;
    bit<64> ask_px;
    bit<32> bid_sz;
    bit<32> ask_sz;
    bit<32> bid_ct;
    bit<32> ask_ct;
}

header ohlcv_msg_t {
    bit<64> open;
    bit<64> high;
    bit<64> low;
    bit<64> close;
    bit<64> volume;
}

header status_msg_t {
    bit<64> ts_recv;
    bit<16> status_action;
    bit<16> status_reason;
    bit<16> trading_event;
    bit<8> is_trading;
    bit<8> is_quoting;
    bit<8> is_short_sell_restricted;
    bit<56> reserved_7;
}

header instrument_def_msg_t {
    bit<64> ts_recv;
    bit<64> min_price_increment;
    bit<64> display_factor;
    bit<64> expiration;
    bit<64> activation;
    bit<64> high_limit_price;
    bit<64> low_limit_price;
    bit<64> max_price_variation;
    bit<64> trading_reference_price;
    bit<64> unit_of_measure_qty;
    bit<64> min_price_increment_amount;
    bit<64> price_ratio;
    bit<32> inst_attrib_value;
    bit<32> underlying_id;
    bit<32> raw_instrument_id;
    bit<32> market_depth_implied;
    bit<32> market_depth;
    bit<32> market_segment_id;
    bit<32> max_trade_vol;
    bit<32> min_lot_size;
    bit<32> min_lot_size_block;
    bit<32> min_lot_size_round_lot;
    bit<32> min_trade_vol;
    bit<32> reserved_4;
    bit<32> contract_multiplier;
    bit<32> decay_quantity;
    bit<32> original_contract_size;
    bit<32> second_reserved_4;
    bit<16> trading_reference_date;
    bit<16> appl_id;
    bit<16> maturity_year;
    bit<16> decay_start_date;
    bit<16> channel;
    bit<32> currency;
    bit<32> settl_currency;
    bit<48> secsubtype;
    bit<176> raw_symbol;
    bit<168> group;
    bit<40> exchange;
    bit<56> asset;
    bit<56> cfi;
    bit<56> security_type;
    bit<248> unit_of_measure;
    bit<168> underlying;
    bit<32> strike_price_currency;
    bit<8> instrument_class;
    bit<16> reserved_2;
    bit<64> strike_price;
    bit<48> reserved_6;
    bit<8> match_algorithm;
    bit<8> md_security_trading_status;
    bit<8> main_fraction;
    bit<8> price_display_format;
    bit<8> settl_price_type;
    bit<8> sub_fraction;
    bit<8> underlying_product;
    bit<8> security_update_action;
    bit<8> maturity_month;
    bit<8> maturity_day;
    bit<8> maturity_week;
    bit<8> user_defined_instrument;
    bit<8> contract_multiplier_unit;
    bit<8> flow_schedule_type;
    bit<8> tick_rule;
    bit<24> dummy_3;
}

header imbalance_msg_t {
    bit<64> ts_recv;
    bit<64> ref_price;
    bit<64> auction_time;
    bit<64> cont_book_clr_price;
    bit<64> auct_interest_clr_price;
    bit<64> ssr_filling_price;
    bit<64> ind_match_price;
    bit<64> upper_collar;
    bit<64> lower_collar;
    bit<32> paired_qty;
    bit<32> total_imbalance_qty;
    bit<32> market_imbalance_qty;
    bit<32> unpaired_qty;
    bit<8> auction_type;
    bit<8> side;
    bit<8> auction_status;
    bit<8> freeze_status;
    bit<8> num_extensions;
    bit<8> unpaired_side;
    bit<8> significant_imbalance;
    bit<8> reserved_1;
}

header error_msg_t {
    bit<512> err;
}

header symbol_mapping_msg_t {
    bit<176> stype_in_symbol;
    bit<176> stype_out_symbol;
    bit<32> dummy_4;
    bit<64> start_ts;
    bit<64> end_ts;
}

header system_msg_t {
    bit<512> msg;
}

header stat_msg_t {
    bit<64> ts_recv;
    bit<64> ts_ref;
    bit<64> price;
    bit<32> quantity;
    bit<32> sequence;
    bit<32> ts_in_delta;
    bit<16> stat_type;
    bit<16> channel;
    bit<8> update_action;
    bit<8> stat_flags;
    bit<48> reserved_6;
}

header mbo_msg_t {
    bit<64> order_id;
    bit<64> price;
    bit<32> size;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> channel_id;
    bit<8> action_;
    bit<8> side;
    bit<64> ts_recv;
    bit<32> ts_in_delta;
    bit<32> sequence;
}

header cmbp_1_msg_t {
    bit<64> price;
    bit<32> size;
    bit<8> action_;
    bit<8> side;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> reserved_1;
    bit<64> ts_recv;
    bit<32> ts_in_delta;
    bit<32> reserved_4;
    bit<64> bid_px;
    bit<64> ask_px;
    bit<32> bid_sz;
    bit<32> ask_sz;
    bit<16> bid_pb;
    bit<16> reserved_2;
    bit<16> ask_pb;
    bit<16> second_reserved_2;
}

header cbbo_msg_t {
    bit<64> price;
    bit<32> size;
    bit<8> reserved_1;
    bit<8> side;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> second_reserved_1;
    bit<64> ts_recv;
    bit<64> reserved_8;
    bit<64> bid_px;
    bit<64> ask_px;
    bit<32> bid_sz;
    bit<32> ask_sz;
    bit<16> bid_pb;
    bit<16> reserved_2;
    bit<16> ask_pb;
    bit<16> second_reserved_2;
}

header bbo_msg_t {
    bit<64> price;
    bit<32> size;
    bit<8> reserved_1;
    bit<8> side;
    bit<1> last;
    bit<1> tob;
    bit<1> snapshot;
    bit<1> mbp;
    bit<1> bad_ts_recv;
    bit<1> maybe_bad_book;
    bit<1> publisher_specific;
    bit<1> reserved_flag;
    bit<8> second_reserved_1;
    bit<64> ts_recv;
    bit<32> reserved_4;
    bit<32> sequence;
    bit<64> bid_px;
    bit<64> ask_px;
    bit<32> bid_sz;
    bit<32> ask_sz;
    bit<32> bid_ct;
    bit<32> ask_ct;
}

header greeting_schema_definition_t {
    varbit<2048> schema_definition;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> mbp_10_msg_bid_ask_pair_remaining;
}

struct headers_t {
    greeting_t greeting;
    trade_msg_t trade_msg;
    mbp_1_msg_t mbp_1_msg;
    mbp_10_msg_t mbp_10_msg;
    mbp_10_msg_bid_ask_pair_t mbp_10_msg_bid_ask_pair[MAX_MESSAGES];
    ohlcv_msg_t ohlcv_msg;
    status_msg_t status_msg;
    instrument_def_msg_t instrument_def_msg;
    imbalance_msg_t imbalance_msg;
    error_msg_t error_msg;
    symbol_mapping_msg_t symbol_mapping_msg;
    system_msg_t system_msg;
    stat_msg_t stat_msg;
    mbo_msg_t mbo_msg;
    cmbp_1_msg_t cmbp_1_msg;
    cbbo_msg_t cbbo_msg;
    bbo_msg_t bbo_msg;
    greeting_schema_definition_t greeting_schema_definition;
}

parser DatabentoMarketdataNormalizedGatewaystreamParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.greeting);
        packet.extract(hdr.greeting_schema_definition, (bit<32>)hdr.greeting.schema_definition_length * 8);
        transition select(packet.lookahead<bit<8>>()) {
            8w0: parse_trade_msg;
            8w1: parse_mbp_1_msg;
            8w10: parse_mbp_10_msg;
            8w17: parse_ohlcv_msg;
            8w18: parse_status_msg;
            8w19: parse_instrument_def_msg;
            8w20: parse_imbalance_msg;
            8w21: parse_error_msg;
            8w22: parse_symbol_mapping_msg;
            8w23: parse_system_msg;
            8w24: parse_stat_msg;
            8w32: parse_ohlcv_msg;
            8w33: parse_ohlcv_msg;
            8w34: parse_ohlcv_msg;
            8w35: parse_ohlcv_msg;
            8w36: parse_ohlcv_msg;
            8w160: parse_mbo_msg;
            8w177: parse_cmbp_1_msg;
            8w192: parse_cbbo_msg;
            8w193: parse_cbbo_msg;
            8w194: parse_cmbp_1_msg;
            8w195: parse_bbo_msg;
            8w196: parse_bbo_msg;
            default: accept;
        }
    }

    state parse_trade_msg {
        packet.extract(hdr.trade_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mbp_1_msg {
        packet.extract(hdr.mbp_1_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mbp_10_msg {
        packet.extract(hdr.mbp_10_msg);
        meta.dispatched = 1;
        meta.mbp_10_msg_bid_ask_pair_remaining = 16w10;
        transition parse_mbp_10_msg_bid_ask_pair;
    }

    state parse_mbp_10_msg_bid_ask_pair {
        packet.extract(hdr.mbp_10_msg_bid_ask_pair.next);
        meta.mbp_10_msg_bid_ask_pair_remaining = meta.mbp_10_msg_bid_ask_pair_remaining - 1;
        transition select(meta.mbp_10_msg_bid_ask_pair_remaining) {
            16w0: accept;
            default: parse_mbp_10_msg_bid_ask_pair;
        }
    }

    state parse_ohlcv_msg {
        packet.extract(hdr.ohlcv_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_status_msg {
        packet.extract(hdr.status_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_def_msg {
        packet.extract(hdr.instrument_def_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_imbalance_msg {
        packet.extract(hdr.imbalance_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_error_msg {
        packet.extract(hdr.error_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_symbol_mapping_msg {
        packet.extract(hdr.symbol_mapping_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_msg {
        packet.extract(hdr.system_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stat_msg {
        packet.extract(hdr.stat_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mbo_msg {
        packet.extract(hdr.mbo_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cmbp_1_msg {
        packet.extract(hdr.cmbp_1_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cbbo_msg {
        packet.extract(hdr.cbbo_msg);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bbo_msg {
        packet.extract(hdr.bbo_msg);
        meta.dispatched = 1;
        transition accept;
    }

}

control DatabentoMarketdataNormalizedGatewaystreamVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DatabentoMarketdataNormalizedGatewaystreamIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control DatabentoMarketdataNormalizedGatewaystreamEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control DatabentoMarketdataNormalizedGatewaystreamComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control DatabentoMarketdataNormalizedGatewaystreamDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.greeting);
        packet.emit(hdr.greeting_schema_definition);
        packet.emit(hdr.trade_msg);
        packet.emit(hdr.mbp_1_msg);
        packet.emit(hdr.mbp_10_msg);
        packet.emit(hdr.mbp_10_msg_bid_ask_pair);
        packet.emit(hdr.ohlcv_msg);
        packet.emit(hdr.status_msg);
        packet.emit(hdr.instrument_def_msg);
        packet.emit(hdr.imbalance_msg);
        packet.emit(hdr.error_msg);
        packet.emit(hdr.symbol_mapping_msg);
        packet.emit(hdr.system_msg);
        packet.emit(hdr.stat_msg);
        packet.emit(hdr.mbo_msg);
        packet.emit(hdr.cmbp_1_msg);
        packet.emit(hdr.cbbo_msg);
        packet.emit(hdr.bbo_msg);
    }
}

V1Switch(
    DatabentoMarketdataNormalizedGatewaystreamParser(),
    DatabentoMarketdataNormalizedGatewaystreamVerifyChecksum(),
    DatabentoMarketdataNormalizedGatewaystreamIngress(),
    DatabentoMarketdataNormalizedGatewaystreamEgress(),
    DatabentoMarketdataNormalizedGatewaystreamComputeChecksum(),
    DatabentoMarketdataNormalizedGatewaystreamDeparser()
) main;
