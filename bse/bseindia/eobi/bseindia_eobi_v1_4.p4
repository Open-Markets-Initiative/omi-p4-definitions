// P4_16 (v1model) definition for: Bse BseIndia Eobi Fbe v1.4
// 
// Protocol:
//   Organization: BSE Limited
//   Protocol: Enhanced Order Book Interface
//   Encoding: Flat Binary Encoding
//   Version: 1.4
//   Date: 7/14/2025
//   Specification: EOBI_Data_Manual_V1.4.pdf
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
    bit<16> body_len;
    bit<16> template_id;
    bit<32> msg_seq_num;
    bit<32> appl_seq_num;
    bit<32> market_segment_id;
    bit<8> partition_id;
    bit<8> completion_indicator;
    bit<8> appl_seq_reset_indicator;
    bit<40> pad_5;
    bit<64> transact_time;
    bit<16> body_len_2;
    bit<16> template_id_2;
    bit<32> msg_seq_num_2;
}

header heartbeat_message_t {
    bit<32> last_msg_seq_num_processed;
    bit<32> pad_4;
}

header product_summary_message_t {
    bit<32> last_msg_seq_num_processed;
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> trad_ses_status;
    bit<8> fast_market_indicator;
}

header snapshot_order_message_t {
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
}

header instrument_summary_message_t {
    bit<64> security_id;
    bit<64> last_update_time;
    bit<64> trd_reg_ts_execution_time;
    bit<32> tot_no_orders;
    bit<8> security_status;
    bit<8> security_trading_status;
    bit<8> fast_market_indicator;
    bit<8> no_md_entries;
    bit<64> trade_volume;
    bit<32> no_of_trades;
    bit<32> pad_4;
}

header instrument_summary_message_md_instrument_entry_grp_t {
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<8> md_entry_type;
    bit<56> pad_7;
}

header auction_best_bid_offer_message_t {
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
}

header auction_clearing_price_message_t {
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> last_px;
    bit<64> last_qty;
}

header top_of_book_message_t {
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
}

header order_add_message_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
}

header order_modify_message_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> trd_reg_ts_prev_time_priority;
    bit<64> prev_price;
    bit<64> prev_display_qty;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
}

header order_modify_same_priority_message_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> transact_time;
    bit<64> prev_display_qty;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
}

header order_delete_message_t {
    bit<64> trd_reg_ts_time_in;
    bit<64> transact_time;
    bit<64> security_id;
    bit<64> trd_reg_ts_time_priority;
    bit<64> display_qty;
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
}

header order_mass_delete_message_t {
    bit<64> security_id;
    bit<64> transact_time;
}

header partial_order_execution_message_t {
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
    bit<64> trd_reg_ts_time_priority;
    bit<64> security_id;
    bit<32> trd_match_id;
    bit<32> pad_4;
    bit<64> last_qty;
    bit<64> last_px;
}

header full_order_execution_message_t {
    bit<8> side;
    bit<56> pad_7;
    bit<64> price;
    bit<64> trd_reg_ts_time_priority;
    bit<64> security_id;
    bit<32> trd_match_id;
    bit<32> pad_4;
    bit<64> last_qty;
    bit<64> last_px;
}

header trade_reversal_message_t {
    bit<64> security_id;
    bit<64> transact_time;
    bit<32> trd_match_id;
    bit<32> pad_4;
    bit<64> last_qty;
    bit<64> last_px;
    bit<64> trd_reg_ts_execution_time;
    bit<8> no_md_entries;
    bit<56> pad_7;
}

header trade_reversal_message_md_trade_entry_grp_t {
    bit<64> md_entry_px;
    bit<64> md_entry_size;
    bit<8> md_entry_type;
    bit<56> pad_7;
}

header execution_summary_message_t {
    bit<64> security_id;
    bit<64> aggressor_timestamp;
    bit<64> exec_id;
    bit<64> last_qty;
    bit<8> aggressor_side;
    bit<8> trade_condition;
    bit<48> pad_6;
    bit<64> last_px;
    bit<64> resting_hidden_qty;
}

header instrument_info_message_t {
    bit<64> security_id;
    bit<64> close_price;
    bit<64> prev_close_price;
    bit<64> upper_ckt_limit;
    bit<64> lower_ckt_limit;
}

header lpp_range_message_t {
    bit<64> security_id;
    bit<64> upper_exec_limit;
    bit<64> lower_exec_limit;
}

header product_state_change_message_t {
    bit<8> trading_session_id;
    bit<8> trading_session_sub_id;
    bit<8> trad_ses_status;
    bit<8> fast_market_indicator;
    bit<32> pad_4;
    bit<64> transact_time;
}

header instrument_state_change_message_t {
    bit<64> security_id;
    bit<8> security_status;
    bit<8> security_trading_status;
    bit<8> fast_market_indicator;
    bit<40> pad_5;
    bit<64> transact_time;
}

header add_complex_instrument_message_t {
    bit<64> security_id;
    bit<64> transact_time;
    bit<32> security_sub_type;
    bit<8> product_complex;
    bit<8> implied_market_indicator;
    bit<8> no_legs;
    bit<8> pad_1;
}

header add_complex_instrument_message_instrmt_leg_grp_t {
    bit<64> leg_security_id;
    bit<32> leg_ratio_qty;
    bit<8> leg_side;
    bit<24> pad_3;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> instrument_summary_message_md_instrument_entry_grp_remaining;
    bit<8> trade_reversal_message_md_trade_entry_grp_remaining;
    bit<8> add_complex_instrument_message_instrmt_leg_grp_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    heartbeat_message_t heartbeat_message;
    product_summary_message_t product_summary_message;
    snapshot_order_message_t snapshot_order_message;
    instrument_summary_message_t instrument_summary_message;
    instrument_summary_message_md_instrument_entry_grp_t instrument_summary_message_md_instrument_entry_grp[MAX_MESSAGES];
    auction_best_bid_offer_message_t auction_best_bid_offer_message;
    auction_clearing_price_message_t auction_clearing_price_message;
    top_of_book_message_t top_of_book_message;
    order_add_message_t order_add_message;
    order_modify_message_t order_modify_message;
    order_modify_same_priority_message_t order_modify_same_priority_message;
    order_delete_message_t order_delete_message;
    order_mass_delete_message_t order_mass_delete_message;
    partial_order_execution_message_t partial_order_execution_message;
    full_order_execution_message_t full_order_execution_message;
    trade_reversal_message_t trade_reversal_message;
    trade_reversal_message_md_trade_entry_grp_t trade_reversal_message_md_trade_entry_grp[MAX_MESSAGES];
    execution_summary_message_t execution_summary_message;
    instrument_info_message_t instrument_info_message;
    lpp_range_message_t lpp_range_message;
    product_state_change_message_t product_state_change_message;
    instrument_state_change_message_t instrument_state_change_message;
    add_complex_instrument_message_t add_complex_instrument_message;
    add_complex_instrument_message_instrmt_leg_grp_t add_complex_instrument_message_instrmt_leg_grp[MAX_MESSAGES];
}

parser BseindiaEobiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.template_id_2) {
            16w0xc932: parse_heartbeat_message;
            16w0x2035: parse_product_summary_message;
            16w0x2235: parse_snapshot_order_message;
            16w0x2135: parse_instrument_summary_message;
            16w0xbc34: parse_auction_best_bid_offer_message;
            16w0xbd34: parse_auction_clearing_price_message;
            16w0xc034: parse_top_of_book_message;
            16w0x2c33: parse_order_add_message;
            16w0x2d33: parse_order_modify_message;
            16w0x3233: parse_order_modify_same_priority_message;
            16w0x2e33: parse_order_delete_message;
            16w0x2f33: parse_order_mass_delete_message;
            16w0x3133: parse_partial_order_execution_message;
            16w0x3033: parse_full_order_execution_message;
            16w0x9033: parse_trade_reversal_message;
            16w0x9233: parse_execution_summary_message;
            16w0x9333: parse_instrument_info_message;
            16w0x9433: parse_lpp_range_message;
            16w0xf433: parse_product_state_change_message;
            16w0xf533: parse_instrument_state_change_message;
            16w0x5834: parse_add_complex_instrument_message;
            default: accept;
        }
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_product_summary_message {
        packet.extract(hdr.product_summary_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_snapshot_order_message {
        packet.extract(hdr.snapshot_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_summary_message {
        packet.extract(hdr.instrument_summary_message);
        meta.dispatched = 1;
        meta.instrument_summary_message_md_instrument_entry_grp_remaining = hdr.instrument_summary_message.no_md_entries;
        transition select(meta.instrument_summary_message_md_instrument_entry_grp_remaining) {
            8w0: accept;
            default: parse_instrument_summary_message_md_instrument_entry_grp;
        }
    }

    state parse_instrument_summary_message_md_instrument_entry_grp {
        packet.extract(hdr.instrument_summary_message_md_instrument_entry_grp.next);
        meta.instrument_summary_message_md_instrument_entry_grp_remaining = meta.instrument_summary_message_md_instrument_entry_grp_remaining - 1;
        transition select(meta.instrument_summary_message_md_instrument_entry_grp_remaining) {
            8w0: accept;
            default: parse_instrument_summary_message_md_instrument_entry_grp;
        }
    }

    state parse_auction_best_bid_offer_message {
        packet.extract(hdr.auction_best_bid_offer_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_clearing_price_message {
        packet.extract(hdr.auction_clearing_price_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_top_of_book_message {
        packet.extract(hdr.top_of_book_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_add_message {
        packet.extract(hdr.order_add_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_message {
        packet.extract(hdr.order_modify_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_same_priority_message {
        packet.extract(hdr.order_modify_same_priority_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_delete_message {
        packet.extract(hdr.order_mass_delete_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_partial_order_execution_message {
        packet.extract(hdr.partial_order_execution_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_full_order_execution_message {
        packet.extract(hdr.full_order_execution_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_reversal_message {
        packet.extract(hdr.trade_reversal_message);
        meta.dispatched = 1;
        meta.trade_reversal_message_md_trade_entry_grp_remaining = hdr.trade_reversal_message.no_md_entries;
        transition select(meta.trade_reversal_message_md_trade_entry_grp_remaining) {
            8w0: accept;
            default: parse_trade_reversal_message_md_trade_entry_grp;
        }
    }

    state parse_trade_reversal_message_md_trade_entry_grp {
        packet.extract(hdr.trade_reversal_message_md_trade_entry_grp.next);
        meta.trade_reversal_message_md_trade_entry_grp_remaining = meta.trade_reversal_message_md_trade_entry_grp_remaining - 1;
        transition select(meta.trade_reversal_message_md_trade_entry_grp_remaining) {
            8w0: accept;
            default: parse_trade_reversal_message_md_trade_entry_grp;
        }
    }

    state parse_execution_summary_message {
        packet.extract(hdr.execution_summary_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_info_message {
        packet.extract(hdr.instrument_info_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_lpp_range_message {
        packet.extract(hdr.lpp_range_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_product_state_change_message {
        packet.extract(hdr.product_state_change_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_state_change_message {
        packet.extract(hdr.instrument_state_change_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_complex_instrument_message {
        packet.extract(hdr.add_complex_instrument_message);
        meta.dispatched = 1;
        meta.add_complex_instrument_message_instrmt_leg_grp_remaining = hdr.add_complex_instrument_message.no_legs;
        transition select(meta.add_complex_instrument_message_instrmt_leg_grp_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_message_instrmt_leg_grp;
        }
    }

    state parse_add_complex_instrument_message_instrmt_leg_grp {
        packet.extract(hdr.add_complex_instrument_message_instrmt_leg_grp.next);
        meta.add_complex_instrument_message_instrmt_leg_grp_remaining = meta.add_complex_instrument_message_instrmt_leg_grp_remaining - 1;
        transition select(meta.add_complex_instrument_message_instrmt_leg_grp_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_message_instrmt_leg_grp;
        }
    }

}

control BseindiaEobiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BseindiaEobiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BseindiaEobiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BseindiaEobiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BseindiaEobiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.heartbeat_message);
        packet.emit(hdr.product_summary_message);
        packet.emit(hdr.snapshot_order_message);
        packet.emit(hdr.instrument_summary_message);
        packet.emit(hdr.instrument_summary_message_md_instrument_entry_grp);
        packet.emit(hdr.auction_best_bid_offer_message);
        packet.emit(hdr.auction_clearing_price_message);
        packet.emit(hdr.top_of_book_message);
        packet.emit(hdr.order_add_message);
        packet.emit(hdr.order_modify_message);
        packet.emit(hdr.order_modify_same_priority_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_mass_delete_message);
        packet.emit(hdr.partial_order_execution_message);
        packet.emit(hdr.full_order_execution_message);
        packet.emit(hdr.trade_reversal_message);
        packet.emit(hdr.trade_reversal_message_md_trade_entry_grp);
        packet.emit(hdr.execution_summary_message);
        packet.emit(hdr.instrument_info_message);
        packet.emit(hdr.lpp_range_message);
        packet.emit(hdr.product_state_change_message);
        packet.emit(hdr.instrument_state_change_message);
        packet.emit(hdr.add_complex_instrument_message);
        packet.emit(hdr.add_complex_instrument_message_instrmt_leg_grp);
    }
}

V1Switch(
    BseindiaEobiParser(),
    BseindiaEobiVerifyChecksum(),
    BseindiaEobiIngress(),
    BseindiaEobiEgress(),
    BseindiaEobiComputeChecksum(),
    BseindiaEobiDeparser()
) main;
