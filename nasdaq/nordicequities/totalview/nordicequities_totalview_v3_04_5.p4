// P4_16 (v1model) definition for: Nasdaq NordicEquities TotalView Itch v3.04.5
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nordic Equity TotalView
//   Encoding: Itch
//   Version: 3.04.5
//   Date: 11/12/2025
//   Specification: Nasdaq Nordic INET Equity TotalView-ITCH (3.04.5).pdf
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

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header system_event_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<8> event_code;
}

header order_book_trading_action_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> order_book;
    bit<8> symbol_state;
    bit<8> extension;
    bit<32> reason;
}

header order_book_directory_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> order_book;
    bit<128> symbol;
    bit<96> isin;
    bit<8> financial_product;
    bit<24> trading_currency;
    bit<32> mic;
    bit<16> market_segment_id;
    bit<1> nm_new_market_company;
    bit<1> xr_excluding_participating_in_rights;
    bit<1> sp_excluding_participating_in_split;
    bit<1> po_company_subject_to_public_offer;
    bit<1> ud_under_drawing;
    bit<1> sr_excluding_comb_split_and_issue_rights;
    bit<1> ul_un_listed;
    bit<1> wi_when_issued;
    bit<1> br_company_bankruptcy;
    bit<1> su_suspension;
    bit<1> rl_removal_from_listing_in_process;
    bit<1> sl_other_surveillance_list_reason;
    bit<1> to_a_significant_reverse_takeover_pending;
    bit<1> cs_cent_shares;
    bit<1> rs_reversed_split;
    bit<1> bs_excluding_comb_bonus_split;
    bit<1> ss_excluding_comb_split_redemption_share;
    bit<1> fn_first_north_company;
    bit<1> ob_observation_status;
    bit<1> xd_excluding_dividend;
    bit<1> fe_foreign_non_eueea_entity;
    bit<1> so_sold_out_buy_back;
    bit<1> sk_soft_knock;
    bit<1> kb_knock_out_buy_back;
    bit<1> bb_buy_back;
    bit<2> reserved_23;
    bit<1> ce_capped_by_esma;
    bit<1> reserved_5;
    bit<1> pd_price_discrepancy_historical_average_share_classes;
    bit<1> sm_stressed_market;
    bit<1> ew_marketwide_exceptional_circumstance;
    bit<1> em_exceptional_circumstances_related_to_market_maker;
    bit<1> un_underlying_not_quoted;
    bit<1> da_digital_asset;
    bit<1> kn_knockout_buy_back_into_next_trading_day;
    bit<4> reserved_58;
    bit<8> reserved_18;
    bit<8> reserved_18_2;
    bit<8> reserved_18_3;
    bit<32> round_lot_size;
    bit<32> nordic_mid_mic;
    bit<32> aod_mic;
    bit<32> notation_of_qty;
    bit<64> notional_amount;
    bit<24> currency;
    bit<8> price_notation;
    bit<64> multiplier_for_calculating_quantity_in_measurement_unit;
}

header add_order_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> order_book;
    bit<32> price;
}

header add_order_mpid_attribution_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> quantity;
    bit<32> order_book;
    bit<32> price;
    bit<32> attribution;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
    bit<32> executed_quantity;
    bit<32> match_number;
    bit<32> mpid;
    bit<32> mpid_counterparty;
}

header order_executed_with_price_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
    bit<32> executed_quantity;
    bit<32> match_number;
    bit<8> printable;
    bit<32> trade_price;
    bit<32> mpid_owner;
    bit<32> mpid_counterparty;
}

header order_cancel_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
    bit<32> canceled_quantity;
}

header order_delete_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
}

header order_book_flush_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> order_book;
}

header order_replace_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> original_order_reference_number;
    bit<64> new_order_reference_number;
    bit<32> quantity;
    bit<32> price;
}

header trade_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> order_reference_number;
    bit<8> trade_type;
    bit<32> quantity;
    bit<32> order_book;
    bit<32> match_number;
    bit<32> trade_price;
    bit<32> participant_id_buyer;
    bit<32> participant_id_seller;
}

header cross_trade_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> quantity;
    bit<32> order_book;
    bit<32> cross_price;
    bit<32> match_number;
    bit<8> cross_type;
    bit<32> number_of_trades;
}

header broken_trade_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> match_number;
}

header noii_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> paired_quantity;
    bit<64> imbalance_quantity;
    bit<8> imbalance_direction;
    bit<32> order_book;
    bit<32> equilibrium_price;
    bit<8> cross_type;
    bit<32> best_bid_price;
    bit<64> best_bid_quantity;
    bit<32> best_ask_price;
    bit<64> best_ask_quantity;
}

header moii_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<64> paired_quantity;
    bit<32> order_book;
    bit<32> equilibrium_price;
    bit<8> cross_type;
    bit<8> cross_level;
}

header execution_summary_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> order_book;
    bit<8> aggressing_side;
    bit<32> quantity;
    bit<32> hidden_quantity;
    bit<32> stp_cancel_quantity;
    bit<32> far_price;
    bit<32> add_quantity;
    bit<16> number_of_lit_executions;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    order_book_trading_action_message_t order_book_trading_action_message[MAX_MESSAGES];
    order_book_directory_message_t order_book_directory_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    add_order_mpid_attribution_message_t add_order_mpid_attribution_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    order_cancel_message_t order_cancel_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    order_book_flush_message_t order_book_flush_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    cross_trade_message_t cross_trade_message[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    noii_message_t noii_message[MAX_MESSAGES];
    moii_message_t moii_message[MAX_MESSAGES];
    execution_summary_message_t execution_summary_message[MAX_MESSAGES];
}

parser NordicequitiesTotalviewParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            16w65535: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x48: parse_order_book_trading_action_message;
            8w0x52: parse_order_book_directory_message;
            8w0x41: parse_add_order_message;
            8w0x46: parse_add_order_mpid_attribution_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x58: parse_order_cancel_message;
            8w0x44: parse_order_delete_message;
            8w0x59: parse_order_book_flush_message;
            8w0x55: parse_order_replace_message;
            8w0x50: parse_trade_message;
            8w0x51: parse_cross_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x49: parse_noii_message;
            8w0x4a: parse_moii_message;
            8w0x4b: parse_execution_summary_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_trading_action_message {
        packet.extract(hdr.order_book_trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_directory_message {
        packet.extract(hdr.order_book_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_add_order_mpid_attribution_message {
        packet.extract(hdr.add_order_mpid_attribution_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_book_flush_message {
        packet.extract(hdr.order_book_flush_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_order_replace_message {
        packet.extract(hdr.order_replace_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_cross_trade_message {
        packet.extract(hdr.cross_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_noii_message {
        packet.extract(hdr.noii_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_moii_message {
        packet.extract(hdr.moii_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_execution_summary_message {
        packet.extract(hdr.execution_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NordicequitiesTotalviewVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesTotalviewIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicequitiesTotalviewEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicequitiesTotalviewComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesTotalviewDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_trading_action_message);
        packet.emit(hdr.order_book_directory_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.add_order_mpid_attribution_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_book_flush_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.cross_trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.noii_message);
        packet.emit(hdr.moii_message);
        packet.emit(hdr.execution_summary_message);
    }
}

V1Switch(
    NordicequitiesTotalviewParser(),
    NordicequitiesTotalviewVerifyChecksum(),
    NordicequitiesTotalviewIngress(),
    NordicequitiesTotalviewEgress(),
    NordicequitiesTotalviewComputeChecksum(),
    NordicequitiesTotalviewDeparser()
) main;
