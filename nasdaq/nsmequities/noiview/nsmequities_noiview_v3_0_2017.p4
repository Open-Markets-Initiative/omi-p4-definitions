// P4_16 (v1model) definition for: Nasdaq NsmEquities NoiView Itch v3.0.2017
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Net Order Imbalance View
//   Encoding: Itch
//   Version: 3.0.2017
//   Date: 9/12/2017
//   Specification: NOIViewSpecification.pdf
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
    bit<8> current_trading_state;
    bit<32> reason;
}

header reg_sho_restriction_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> reg_sho_action;
}

header noii_message_t {
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

header cross_trade_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> shares;
    bit<64> stock;
    bit<32> cross_price;
    bit<64> match_number;
    bit<8> cross_type;
}

header ipo_quoting_period_update_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<32> ipo_quotation_release_time;
    bit<8> ipo_quotation_release_qualifier;
    bit<32> ipo_price;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    stock_trading_action_message_t stock_trading_action_message[MAX_MESSAGES];
    reg_sho_restriction_message_t reg_sho_restriction_message[MAX_MESSAGES];
    noii_message_t noii_message[MAX_MESSAGES];
    cross_trade_message_t cross_trade_message[MAX_MESSAGES];
    ipo_quoting_period_update_message_t ipo_quoting_period_update_message[MAX_MESSAGES];
}

parser NsmequitiesNoiviewParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x59: parse_reg_sho_restriction_message;
            8w0x49: parse_noii_message;
            8w0x51: parse_cross_trade_message;
            8w0x4b: parse_ipo_quoting_period_update_message;
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

    state parse_reg_sho_restriction_message {
        packet.extract(hdr.reg_sho_restriction_message.next);
        transition parse_message;
    }

    state parse_noii_message {
        packet.extract(hdr.noii_message.next);
        transition parse_message;
    }

    state parse_cross_trade_message {
        packet.extract(hdr.cross_trade_message.next);
        transition parse_message;
    }

    state parse_ipo_quoting_period_update_message {
        packet.extract(hdr.ipo_quoting_period_update_message.next);
        transition parse_message;
    }

}

control NsmequitiesNoiviewVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNoiviewIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesNoiviewEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesNoiviewComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNoiviewDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_restriction_message);
        packet.emit(hdr.noii_message);
        packet.emit(hdr.cross_trade_message);
        packet.emit(hdr.ipo_quoting_period_update_message);
    }
}

V1Switch(
    NsmequitiesNoiviewParser(),
    NsmequitiesNoiviewVerifyChecksum(),
    NsmequitiesNoiviewIngress(),
    NsmequitiesNoiviewEgress(),
    NsmequitiesNoiviewComputeChecksum(),
    NsmequitiesNoiviewDeparser()
) main;
