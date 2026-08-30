// P4_16 (v1model) definition for: Nasdaq PsxEquities Bbo Itch v2.1.2018
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Best Bid And Offer
//   Encoding: Itch
//   Version: 2.1.2018
//   Date: 05/03/2018
//   Specification: PSXbboSpecification2.1.pdf
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
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> event_code;
}

header stock_directory_message_t {
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
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> security_class;
    bit<8> current_trading_state;
    bit<32> reason;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> reg_sho_action;
}

header mwcb_decline_level_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> level_1;
    bit<64> level_2;
    bit<64> level_3;
}

header mwcb_status_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> breached_level;
}

header operational_halt_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> market_code;
    bit<8> operational_halt_action;
}

header quotation_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> security_class;
    bit<32> psx_best_bid_price;
    bit<32> psx_best_bid_size;
    bit<32> psx_best_offer_price;
    bit<32> psx_best_offer_size;
}

header next_shares_quotation_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> next_shares_symbol;
    bit<8> security_class;
    bit<32> nasdaq_best_bid;
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
    mwcb_decline_level_message_t mwcb_decline_level_message[MAX_MESSAGES];
    mwcb_status_message_t mwcb_status_message[MAX_MESSAGES];
    operational_halt_message_t operational_halt_message[MAX_MESSAGES];
    quotation_message_t quotation_message[MAX_MESSAGES];
    next_shares_quotation_message_t next_shares_quotation_message[MAX_MESSAGES];
}

parser PsxequitiesBboParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x56: parse_mwcb_decline_level_message;
            8w0x57: parse_mwcb_status_message;
            8w0x68: parse_operational_halt_message;
            8w0x51: parse_quotation_message;
            8w0x41: parse_next_shares_quotation_message;
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

    state parse_mwcb_decline_level_message {
        packet.extract(hdr.mwcb_decline_level_message.next);
        transition parse_message;
    }

    state parse_mwcb_status_message {
        packet.extract(hdr.mwcb_status_message.next);
        transition parse_message;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message.next);
        transition parse_message;
    }

    state parse_quotation_message {
        packet.extract(hdr.quotation_message.next);
        transition parse_message;
    }

    state parse_next_shares_quotation_message {
        packet.extract(hdr.next_shares_quotation_message.next);
        transition parse_message;
    }

}

control PsxequitiesBboVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PsxequitiesBboIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PsxequitiesBboEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PsxequitiesBboComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PsxequitiesBboDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.mwcb_decline_level_message);
        packet.emit(hdr.mwcb_status_message);
        packet.emit(hdr.operational_halt_message);
        packet.emit(hdr.quotation_message);
        packet.emit(hdr.next_shares_quotation_message);
    }
}

V1Switch(
    PsxequitiesBboParser(),
    PsxequitiesBboVerifyChecksum(),
    PsxequitiesBboIngress(),
    PsxequitiesBboEgress(),
    PsxequitiesBboComputeChecksum(),
    PsxequitiesBboDeparser()
) main;
