// P4_16 (v1model) definition for: Nasdaq NordicEquities TotalView Glimpse v3.00.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nordic Equity TotalView
//   Encoding: Glimpse
//   Version: 3.00.1
//   Date: 12/01/2015
//   Specification: Nasdaq Nordic INET Equity GLIMPSE (3.00.1).pdf
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
    bit<160> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
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
    bit<1> wi_when_issued;
    bit<1> ul_un_listed;
    bit<1> sr_excluding_comb_split_and_issue_rights;
    bit<1> ud_under_drawing;
    bit<1> po_company_subject_to_public_offer;
    bit<1> sp_excluding_participating_in_split;
    bit<1> xr_excluding_participating_in_rights;
    bit<1> nm_new_market_company;
    bit<1> bs_excluding_comb_bonus_split;
    bit<1> rs_reversed_split;
    bit<1> cs_cent_shares;
    bit<1> to_a_significant_reverse_takeover_pending;
    bit<1> sl_other_surveillance_list_reason;
    bit<1> rl_removal_from_listing_in_process;
    bit<1> su_suspension;
    bit<1> br_company_bankruptcy;
    bit<1> kb_knock_out_buy_back;
    bit<1> sk_soft_knock;
    bit<1> so_sold_out_buy_back;
    bit<1> fe_foreign_non_eueea_entity;
    bit<1> xd_excluding_dividend;
    bit<1> ob_observation_status;
    bit<1> fn_first_north_company;
    bit<1> ss_excluding_comb_split_redemption_share;
    bit<1> ew_marketwide_exceptional_circumstance;
    bit<1> sm_stressed_market;
    bit<1> pd_price_discrepancy_historical_average_share_classes;
    bit<1> reserved_5;
    bit<1> ce_capped_by_esma;
    bit<2> reserved_23;
    bit<1> bb_buy_back;
    bit<4> reserved_58;
    bit<1> kn_knockout_buy_back_into_next_trading_day;
    bit<1> da_digital_asset;
    bit<1> un_underlying_not_quoted;
    bit<1> em_exceptional_circumstances_related_to_market_maker;
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

header end_of_snapshot_message_t {
    bit<160> sequence_number;
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
    system_event_message_t system_event_message;
    order_book_trading_action_message_t order_book_trading_action_message;
    order_book_directory_message_t order_book_directory_message;
    add_order_message_t add_order_message;
    add_order_mpid_attribution_message_t add_order_mpid_attribution_message;
    end_of_snapshot_message_t end_of_snapshot_message;
}

parser NordicequitiesTotalviewServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x53: parse_system_event_message;
            8w0x48: parse_order_book_trading_action_message;
            8w0x52: parse_order_book_directory_message;
            8w0x41: parse_add_order_message;
            8w0x46: parse_add_order_mpid_attribution_message;
            8w0x47: parse_end_of_snapshot_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_trading_action_message {
        packet.extract(hdr.order_book_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_book_directory_message {
        packet.extract(hdr.order_book_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_mpid_attribution_message {
        packet.extract(hdr.add_order_mpid_attribution_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_snapshot_message {
        packet.extract(hdr.end_of_snapshot_message);
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

control NordicequitiesTotalviewServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesTotalviewServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicequitiesTotalviewServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicequitiesTotalviewServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesTotalviewServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.order_book_trading_action_message);
        packet.emit(hdr.order_book_directory_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.add_order_mpid_attribution_message);
        packet.emit(hdr.end_of_snapshot_message);
    }
}

V1Switch(
    NordicequitiesTotalviewServerParser(),
    NordicequitiesTotalviewServerVerifyChecksum(),
    NordicequitiesTotalviewServerIngress(),
    NordicequitiesTotalviewServerEgress(),
    NordicequitiesTotalviewServerComputeChecksum(),
    NordicequitiesTotalviewServerDeparser()
) main;
