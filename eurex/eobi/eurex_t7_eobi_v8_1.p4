// P4_16 (v1model) definition for: Eurex T7 Eobi Fbe v8.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Enhanced Order Book Interface
//   Encoding: Flat Binary Encoding
//   Version: 8.1
//   Date: 3/23/2020
//   Specification: T7_EOBI_Manual_v.8.1.0.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_comp_t {
    bit<16> body_len;
    bit<16> template_id;
    bit<32> msg_seq_num;
    bit<64> appl_seq_num;
    bit<32> market_segment_id;
    bit<8> partition_id;
    bit<8> completion_indicator;
    bit<8> appl_seq_reset_indicator;
    bit<8> pad_1;
    bit<64> transact_time;
    bit<16> body_len_2;
    bit<16> template_id_2;
    bit<32> msg_seq_num_2;
}

header add_complex_instrument_t {
    bit<64> security_id;
    bit<64> transact_time;
    bit<32> security_sub_type;
    bit<8> product_complex;
    bit<8> implied_market_indicator;
    bit<8> no_legs;
    bit<8> pad1;
    bit<32> leg_symbol;
    bit<32> pad4;
    bit<64> leg_security_id;
    bit<64> leg_price;
    bit<32> leg_ratio_qty;
    bit<8> leg_security_type;
    bit<8> leg_side;
    bit<16> pad2;
}

header auction_bbo_t {
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> bid_size;
    bit<64> offer_size;
    bit<8> potential_security_trading_event;
    bit<8> bid_ord_type;
    bit<8> offer_ord_type;
    bit<8> pad_1;
}

header auction_clearing_price_t {
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> imbalance_qty;
    bit<8> security_trading_status;
    bit<8> potential_security_trading_event;
    bit<48> pad6;
}

header cross_request_t {
    bit<64> security_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<8> side;
    bit<8> cross_request_type;
    bit<8> input_source;
    bit<8> pad_1;
    bit<64> transact_time;
}

header execution_summary_t {
    bit<64> security_id;
    bit<64> aggressor_time;
    bit<64> request_time;
    bit<64> exec_id;
    bit<64> last_qty;
    bit<8> aggressor_side;
    bit<8> pad1;
    bit<16> trade_condition;
    bit<32> pad4;
    bit<64> last_px;
    bit<64> resting_hidden_qty;
    bit<64> resting_cxl_qty;
}

header full_order_execution_t {
    bit<8> side;
    bit<8> ord_type;
    bit<8> algorithmic_trade_indicator;
    bit<8> pad1;
    bit<32> trd_match_id;
    bit<64> price;
    bit<64> trd_reg_ts_time_priority;
    bit<64> security_id;
    bit<64> last_qty;
    bit<64> last_px;
}

header heartbeat_t {
    bit<32> last_msg_seq_num_processed;
    bit<32> pad4;
}

header instrument_state_change_t {
    bit<64> security_id;
    bit<8> security_status;
    bit<8> security_trading_status;
    bit<8> market_condition;
    bit<8> fast_market_indicator;
    bit<8> security_trading_event;
    bit<8> sold_out_indicator;
    bit<16> pad2;
    bit<64> transact_time;
}

header instrument_summary_t {
    bit<64> security_id;
    bit<64> last_update_time;
    bit<64> trd_reg_ts_execution_time;
    bit<16> tot_no_orders;
    bit<8> security_status;
    bit<8> security_trading_status;
    bit<8> market_condition;
    bit<8> fast_market_indicator;
    bit<8> security_trading_event;
    bit<8> sold_out_indicator;
    bit<8> product_complex;
    bit<8> no_md_entries;
    bit<48> pad6;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<8> md_entry_type;
    bit<8> pad1;
    bit<16> trade_condition;
    bit<32> pad4;
}

header mass_instrument_state_change_t {
    bit<8> instrument_scope_product_complex;
    bit<8> security_mass_status;
    bit<8> security_mass_trading_status;
    bit<8> mass_market_condition;
    bit<8> fast_market_indicator;
    bit<8> security_mass_trading_event;
    bit<8> mass_sold_out_indicator;
    bit<8> pad1;
    bit<64> transact_time;
    bit<8> last_fragment;
    bit<8> no_related_sym;
    bit<48> pad6;
    bit<64> security_id;
    bit<8> security_status;
    bit<8> security_trading_status;
    bit<8> market_condition;
    bit<8> security_trading_event;
    bit<8> sold_out_indicator;
    bit<24> pad3;
}

header order_add_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<48> pad6;
    bit<64> price;
}

header order_delete_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<48> pad6;
    bit<64> price;
}

header order_mass_delete_t {
    bit<64> security_id;
    bit<64> transact_time;
}

header order_modify_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_prev_time_priority;
    bit<64> prev_price;
    bit<64> prev_display_qty;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<48> pad6;
    bit<64> price;
}

header order_modify_same_prio_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> transact_time;
    bit<64> prev_display_qty;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<48> pad6;
    bit<64> price;
}

header partial_order_execution_t {
    bit<8> side;
    bit<8> ord_type;
    bit<8> algorithmic_trade_indicator;
    bit<8> pad1;
    bit<32> trd_match_id;
    bit<64> price;
    bit<64> trd_reg_ts_time_priority;
    bit<64> security_id;
    bit<64> last_qty;
    bit<64> last_px;
}

header product_state_change_t {
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> trad_ses_status;
    bit<8> market_condition;
    bit<8> fast_market_indicator;
    bit<24> pad3;
    bit<64> transact_time;
}

header product_summary_t {
    bit<32> last_msg_seq_num_processed;
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> trad_ses_status;
    bit<8> market_condition;
    bit<8> fast_market_indicator;
    bit<56> pad7;
}

header quote_request_t {
    bit<64> security_id;
    bit<64> last_qty;
    bit<8> side;
    bit<56> pad7;
    bit<64> transact_time;
}

header snapshot_order_t {
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<48> pad6;
    bit<64> price;
}

header top_of_book_t {
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> bid_size;
    bit<64> offer_size;
}

header trade_report_t {
    bit<64> security_id;
    bit<64> transact_time;
    bit<64> last_qty;
    bit<64> last_px;
    bit<32> trd_match_id;
    bit<8> match_type;
    bit<8> match_sub_type;
    bit<8> algorithmic_trade_indicator;
    bit<8> pad1;
    bit<16> trade_condition;
    bit<48> pad6;
}

header trade_reversal_t {
    bit<64> security_id;
    bit<64> transact_time;
    bit<64> last_qty;
    bit<64> last_px;
    bit<64> trd_reg_ts_execution_time;
    bit<32> trd_match_id;
    bit<16> trade_condition;
    bit<16> pad2;
    bit<8> no_md_entries;
    bit<56> pad7;
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<8> md_entry_type;
    bit<56> pad7_2;
}

struct metadata_t {
}

struct headers_t {
    message_header_comp_t message_header_comp;
    add_complex_instrument_t add_complex_instrument;
    auction_bbo_t auction_bbo;
    auction_clearing_price_t auction_clearing_price;
    cross_request_t cross_request;
    execution_summary_t execution_summary;
    full_order_execution_t full_order_execution;
    heartbeat_t heartbeat;
    instrument_state_change_t instrument_state_change;
    instrument_summary_t instrument_summary;
    mass_instrument_state_change_t mass_instrument_state_change;
    order_add_t order_add;
    order_delete_t order_delete;
    order_mass_delete_t order_mass_delete;
    order_modify_t order_modify;
    order_modify_same_prio_t order_modify_same_prio;
    partial_order_execution_t partial_order_execution;
    product_state_change_t product_state_change;
    product_summary_t product_summary;
    quote_request_t quote_request;
    snapshot_order_t snapshot_order;
    top_of_book_t top_of_book;
    trade_report_t trade_report;
    trade_reversal_t trade_reversal;
}

parser EurexT7EobiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header_comp);
        transition select(hdr.message_header_comp.template_id_2) {
            16w13400: parse_add_complex_instrument;
            16w13500: parse_auction_bbo;
            16w13501: parse_auction_clearing_price;
            16w13502: parse_cross_request;
            16w13202: parse_execution_summary;
            16w13104: parse_full_order_execution;
            16w13001: parse_heartbeat;
            16w13301: parse_instrument_state_change;
            16w13601: parse_instrument_summary;
            16w13302: parse_mass_instrument_state_change;
            16w13100: parse_order_add;
            16w13102: parse_order_delete;
            16w13103: parse_order_mass_delete;
            16w13101: parse_order_modify;
            16w13106: parse_order_modify_same_prio;
            16w13105: parse_partial_order_execution;
            16w13300: parse_product_state_change;
            16w13600: parse_product_summary;
            16w13503: parse_quote_request;
            16w13602: parse_snapshot_order;
            16w13504: parse_top_of_book;
            16w13201: parse_trade_report;
            16w13200: parse_trade_reversal;
            default: accept;
        }
    }

    state parse_add_complex_instrument {
        packet.extract(hdr.add_complex_instrument);
        transition accept;
    }

    state parse_auction_bbo {
        packet.extract(hdr.auction_bbo);
        transition accept;
    }

    state parse_auction_clearing_price {
        packet.extract(hdr.auction_clearing_price);
        transition accept;
    }

    state parse_cross_request {
        packet.extract(hdr.cross_request);
        transition accept;
    }

    state parse_execution_summary {
        packet.extract(hdr.execution_summary);
        transition accept;
    }

    state parse_full_order_execution {
        packet.extract(hdr.full_order_execution);
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        transition accept;
    }

    state parse_instrument_state_change {
        packet.extract(hdr.instrument_state_change);
        transition accept;
    }

    state parse_instrument_summary {
        packet.extract(hdr.instrument_summary);
        transition accept;
    }

    state parse_mass_instrument_state_change {
        packet.extract(hdr.mass_instrument_state_change);
        transition accept;
    }

    state parse_order_add {
        packet.extract(hdr.order_add);
        transition accept;
    }

    state parse_order_delete {
        packet.extract(hdr.order_delete);
        transition accept;
    }

    state parse_order_mass_delete {
        packet.extract(hdr.order_mass_delete);
        transition accept;
    }

    state parse_order_modify {
        packet.extract(hdr.order_modify);
        transition accept;
    }

    state parse_order_modify_same_prio {
        packet.extract(hdr.order_modify_same_prio);
        transition accept;
    }

    state parse_partial_order_execution {
        packet.extract(hdr.partial_order_execution);
        transition accept;
    }

    state parse_product_state_change {
        packet.extract(hdr.product_state_change);
        transition accept;
    }

    state parse_product_summary {
        packet.extract(hdr.product_summary);
        transition accept;
    }

    state parse_quote_request {
        packet.extract(hdr.quote_request);
        transition accept;
    }

    state parse_snapshot_order {
        packet.extract(hdr.snapshot_order);
        transition accept;
    }

    state parse_top_of_book {
        packet.extract(hdr.top_of_book);
        transition accept;
    }

    state parse_trade_report {
        packet.extract(hdr.trade_report);
        transition accept;
    }

    state parse_trade_reversal {
        packet.extract(hdr.trade_reversal);
        transition accept;
    }

}

control EurexT7EobiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EobiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7EobiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7EobiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7EobiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header_comp);
        packet.emit(hdr.add_complex_instrument);
        packet.emit(hdr.auction_bbo);
        packet.emit(hdr.auction_clearing_price);
        packet.emit(hdr.cross_request);
        packet.emit(hdr.execution_summary);
        packet.emit(hdr.full_order_execution);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.instrument_state_change);
        packet.emit(hdr.instrument_summary);
        packet.emit(hdr.mass_instrument_state_change);
        packet.emit(hdr.order_add);
        packet.emit(hdr.order_delete);
        packet.emit(hdr.order_mass_delete);
        packet.emit(hdr.order_modify);
        packet.emit(hdr.order_modify_same_prio);
        packet.emit(hdr.partial_order_execution);
        packet.emit(hdr.product_state_change);
        packet.emit(hdr.product_summary);
        packet.emit(hdr.quote_request);
        packet.emit(hdr.snapshot_order);
        packet.emit(hdr.top_of_book);
        packet.emit(hdr.trade_report);
        packet.emit(hdr.trade_reversal);
    }
}

V1Switch(
    EurexT7EobiParser(),
    EurexT7EobiVerifyChecksum(),
    EurexT7EobiIngress(),
    EurexT7EobiEgress(),
    EurexT7EobiComputeChecksum(),
    EurexT7EobiDeparser()
) main;
