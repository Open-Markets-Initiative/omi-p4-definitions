// P4_16 (v1model) definition for: Nasdaq NsmEquities BasicPlus Itch v1.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Basic Plus
//   Encoding: Itch
//   Version: 1.0
//   Date: 5/29/2026
//   Specification: Nasdaq Basic Plus_vF.pdf
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
    bit<8> event_code;
}

header consolidated_quotation_message_t {
    bit<64> timestamp;
    bit<64> stock;
    bit<64> best_bid_price;
    bit<32> best_bid_size;
    bit<64> best_offer_price;
    bit<32> best_offer_size;
    bit<8> best_bid_exchanges;
    bit<8> best_offer_exchanges;
}

header retail_price_improvement_message_t {
    bit<64> timestamp;
    bit<64> stock;
    bit<8> buy_side_rpi_exchanges;
    bit<8> sell_side_rpi_exchanges;
}

header trading_action_message_t {
    bit<64> timestamp;
    bit<64> stock;
    bit<8> trading_state;
    bit<32> reason_code;
}

header reg_sho_restriction_message_t {
    bit<64> timestamp;
    bit<64> stock;
    bit<8> reg_sho_action;
}

header stock_directory_message_t {
    bit<64> timestamp;
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

header mwcb_decline_level_message_t {
    bit<64> timestamp;
    bit<64> level_1;
    bit<64> level_2;
    bit<64> level_3;
}

header mwcb_status_message_t {
    bit<64> timestamp;
    bit<8> breached_level;
}

header ipo_quoting_period_update_t {
    bit<64> timestamp;
    bit<64> stock;
    bit<32> ipo_quotation_release_time;
    bit<8> ipo_quotation_release_qualifier;
    bit<64> ipo_price;
}

header operational_halt_message_t {
    bit<64> timestamp;
    bit<64> stock;
    bit<8> market_code;
    bit<8> operational_halt_action;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    consolidated_quotation_message_t consolidated_quotation_message[MAX_MESSAGES];
    retail_price_improvement_message_t retail_price_improvement_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    reg_sho_restriction_message_t reg_sho_restriction_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    mwcb_decline_level_message_t mwcb_decline_level_message[MAX_MESSAGES];
    mwcb_status_message_t mwcb_status_message[MAX_MESSAGES];
    ipo_quoting_period_update_t ipo_quoting_period_update[MAX_MESSAGES];
    operational_halt_message_t operational_halt_message[MAX_MESSAGES];
}

parser NsmequitiesBasicplusParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x51: parse_consolidated_quotation_message;
            8w0x4e: parse_retail_price_improvement_message;
            8w0x48: parse_trading_action_message;
            8w0x59: parse_reg_sho_restriction_message;
            8w0x52: parse_stock_directory_message;
            8w0x56: parse_mwcb_decline_level_message;
            8w0x57: parse_mwcb_status_message;
            8w0x4b: parse_ipo_quoting_period_update;
            8w0x68: parse_operational_halt_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_consolidated_quotation_message {
        packet.extract(hdr.consolidated_quotation_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_retail_price_improvement_message {
        packet.extract(hdr.retail_price_improvement_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_reg_sho_restriction_message {
        packet.extract(hdr.reg_sho_restriction_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_mwcb_decline_level_message {
        packet.extract(hdr.mwcb_decline_level_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_mwcb_status_message {
        packet.extract(hdr.mwcb_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_ipo_quoting_period_update {
        packet.extract(hdr.ipo_quoting_period_update.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NsmequitiesBasicplusVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesBasicplusIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesBasicplusEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesBasicplusComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesBasicplusDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.consolidated_quotation_message);
        packet.emit(hdr.retail_price_improvement_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.reg_sho_restriction_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.mwcb_decline_level_message);
        packet.emit(hdr.mwcb_status_message);
        packet.emit(hdr.ipo_quoting_period_update);
        packet.emit(hdr.operational_halt_message);
    }
}

V1Switch(
    NsmequitiesBasicplusParser(),
    NsmequitiesBasicplusVerifyChecksum(),
    NsmequitiesBasicplusIngress(),
    NsmequitiesBasicplusEgress(),
    NsmequitiesBasicplusComputeChecksum(),
    NsmequitiesBasicplusDeparser()
) main;
