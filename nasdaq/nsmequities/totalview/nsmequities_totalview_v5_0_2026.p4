// P4_16 (v1model) definition for: Nasdaq NsmEquities TotalView Itch v5.0.2026
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: TotalView Itch
//   Encoding: Itch
//   Version: 5.0.2026
//   Date: 2/19/2026
//   Specification: NQTVITCHSpecification.pdf
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
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> event_code;
}

header stock_directory_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> market_category;
    bit<8> financial_status_indicator;
    bit<32> round_lot_size;
    bit<8> round_lots_only;
    bit<8> issue_classification;
    bit<16> issue_sub_type;
    bit<8> authenticity;
    bit<8> short_sale_threshold_indicator;
    bit<8> ipo_flag;
    bit<8> luld_reference_price_tier;
    bit<8> etp_flag;
    bit<32> etp_leverage_factor;
    bit<8> inverse_indicator;
}

header stock_trading_action_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> trading_state;
    bit<8> reserved;
    bit<32> reason_code;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<16> locate_code;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> reg_sho_action;
}

header market_participant_position_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> mpid;
    bit<64> stock;
    bit<8> primary_market_maker;
    bit<8> market_maker_mode;
    bit<8> market_participant_state;
}

header mwcb_decline_level_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> level_1;
    bit<64> level_2;
    bit<64> level_3;
}

header mwcb_status_level_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> breached_level;
}

header ipo_quoting_period_update_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<32> ipo_quotation_release_time;
    bit<8> ipo_quotation_release_qualifier;
    bit<32> ipo_price;
}

header luld_auction_collar_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<32> auction_collar_reference_price;
    bit<32> upper_auction_collar_price;
    bit<32> lower_auction_collar_price;
    bit<32> auction_collar_extension;
}

header operational_halt_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> market_code;
    bit<8> operational_halt_action;
}

header add_order_no_mpid_attribution_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
}

header add_order_with_mpid_attribution_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
    bit<32> attribution;
}

header order_executed_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<32> executed_shares;
    bit<64> match_number;
}

header order_executed_with_price_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<32> executed_shares;
    bit<64> match_number;
    bit<8> printable;
    bit<32> execution_price;
}

header order_cancel_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<32> canceled_shares;
}

header order_delete_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
}

header order_replace_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> original_order_reference_number;
    bit<64> new_order_reference_number;
    bit<32> shares;
    bit<32> price;
}

header non_cross_trade_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
    bit<64> match_number;
}

header cross_trade_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> cross_shares;
    bit<64> stock;
    bit<32> cross_price;
    bit<64> match_number;
    bit<8> cross_type;
}

header broken_trade_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> match_number;
}

header net_order_imbalance_indicator_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> paired_shares;
    bit<64> imbalance_shares;
    bit<8> imbalance_direction;
    bit<64> stock;
    bit<32> far_price;
    bit<32> near_price;
    bit<32> current_reference_price;
    bit<8> cross_type;
    bit<8> price_variation_indicator;
}

header retail_price_improvement_indicator_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> interest_flag;
}

header direct_listing_with_capital_raise_price_discovery_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> open_eligibility_status;
    bit<32> minimum_allowable_price;
    bit<32> maximum_allowable_price;
    bit<32> near_execution_price;
    bit<64> near_execution_time;
    bit<32> lower_price_range_collar;
    bit<32> upper_price_range_collar;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    stock_trading_action_message_t stock_trading_action_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    market_participant_position_message_t market_participant_position_message[MAX_MESSAGES];
    mwcb_decline_level_message_t mwcb_decline_level_message[MAX_MESSAGES];
    mwcb_status_level_message_t mwcb_status_level_message[MAX_MESSAGES];
    ipo_quoting_period_update_t ipo_quoting_period_update[MAX_MESSAGES];
    luld_auction_collar_message_t luld_auction_collar_message[MAX_MESSAGES];
    operational_halt_message_t operational_halt_message[MAX_MESSAGES];
    add_order_no_mpid_attribution_message_t add_order_no_mpid_attribution_message[MAX_MESSAGES];
    add_order_with_mpid_attribution_message_t add_order_with_mpid_attribution_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_message_t order_executed_with_price_message[MAX_MESSAGES];
    order_cancel_message_t order_cancel_message[MAX_MESSAGES];
    order_delete_message_t order_delete_message[MAX_MESSAGES];
    order_replace_message_t order_replace_message[MAX_MESSAGES];
    non_cross_trade_message_t non_cross_trade_message[MAX_MESSAGES];
    cross_trade_message_t cross_trade_message[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    net_order_imbalance_indicator_message_t net_order_imbalance_indicator_message[MAX_MESSAGES];
    retail_price_improvement_indicator_message_t retail_price_improvement_indicator_message[MAX_MESSAGES];
    direct_listing_with_capital_raise_price_discovery_message_t direct_listing_with_capital_raise_price_discovery_message[MAX_MESSAGES];
}

parser NsmequitiesTotalviewParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x59: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x4c: parse_market_participant_position_message;
            8w0x56: parse_mwcb_decline_level_message;
            8w0x57: parse_mwcb_status_level_message;
            8w0x4b: parse_ipo_quoting_period_update;
            8w0x4a: parse_luld_auction_collar_message;
            8w0x68: parse_operational_halt_message;
            8w0x41: parse_add_order_no_mpid_attribution_message;
            8w0x46: parse_add_order_with_mpid_attribution_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x58: parse_order_cancel_message;
            8w0x44: parse_order_delete_message;
            8w0x55: parse_order_replace_message;
            8w0x50: parse_non_cross_trade_message;
            8w0x51: parse_cross_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x49: parse_net_order_imbalance_indicator_message;
            8w0x4e: parse_retail_price_improvement_indicator_message;
            8w0x4f: parse_direct_listing_with_capital_raise_price_discovery_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        transition parse_message;
    }

    state parse_stock_trading_action_message {
        packet.extract(hdr.stock_trading_action_message.next);
        transition parse_message;
    }

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message.next);
        transition parse_message;
    }

    state parse_market_participant_position_message {
        packet.extract(hdr.market_participant_position_message.next);
        transition parse_message;
    }

    state parse_mwcb_decline_level_message {
        packet.extract(hdr.mwcb_decline_level_message.next);
        transition parse_message;
    }

    state parse_mwcb_status_level_message {
        packet.extract(hdr.mwcb_status_level_message.next);
        transition parse_message;
    }

    state parse_ipo_quoting_period_update {
        packet.extract(hdr.ipo_quoting_period_update.next);
        transition parse_message;
    }

    state parse_luld_auction_collar_message {
        packet.extract(hdr.luld_auction_collar_message.next);
        transition parse_message;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message.next);
        transition parse_message;
    }

    state parse_add_order_no_mpid_attribution_message {
        packet.extract(hdr.add_order_no_mpid_attribution_message.next);
        transition parse_message;
    }

    state parse_add_order_with_mpid_attribution_message {
        packet.extract(hdr.add_order_with_mpid_attribution_message.next);
        transition parse_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        transition parse_message;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message.next);
        transition parse_message;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message.next);
        transition parse_message;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message.next);
        transition parse_message;
    }

    state parse_order_replace_message {
        packet.extract(hdr.order_replace_message.next);
        transition parse_message;
    }

    state parse_non_cross_trade_message {
        packet.extract(hdr.non_cross_trade_message.next);
        transition parse_message;
    }

    state parse_cross_trade_message {
        packet.extract(hdr.cross_trade_message.next);
        transition parse_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        transition parse_message;
    }

    state parse_net_order_imbalance_indicator_message {
        packet.extract(hdr.net_order_imbalance_indicator_message.next);
        transition parse_message;
    }

    state parse_retail_price_improvement_indicator_message {
        packet.extract(hdr.retail_price_improvement_indicator_message.next);
        transition parse_message;
    }

    state parse_direct_listing_with_capital_raise_price_discovery_message {
        packet.extract(hdr.direct_listing_with_capital_raise_price_discovery_message.next);
        transition parse_message;
    }

}

control NsmequitiesTotalviewVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesTotalviewEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesTotalviewComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.market_participant_position_message);
        packet.emit(hdr.mwcb_decline_level_message);
        packet.emit(hdr.mwcb_status_level_message);
        packet.emit(hdr.ipo_quoting_period_update);
        packet.emit(hdr.luld_auction_collar_message);
        packet.emit(hdr.operational_halt_message);
        packet.emit(hdr.add_order_no_mpid_attribution_message);
        packet.emit(hdr.add_order_with_mpid_attribution_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_replace_message);
        packet.emit(hdr.non_cross_trade_message);
        packet.emit(hdr.cross_trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.net_order_imbalance_indicator_message);
        packet.emit(hdr.retail_price_improvement_indicator_message);
        packet.emit(hdr.direct_listing_with_capital_raise_price_discovery_message);
    }
}

V1Switch(
    NsmequitiesTotalviewParser(),
    NsmequitiesTotalviewVerifyChecksum(),
    NsmequitiesTotalviewIngress(),
    NsmequitiesTotalviewEgress(),
    NsmequitiesTotalviewComputeChecksum(),
    NsmequitiesTotalviewDeparser()
) main;
