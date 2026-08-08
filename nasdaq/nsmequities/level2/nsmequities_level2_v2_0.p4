// P4_16 (v1model) definition for: Nasdaq NsmEquities Level2 Itch v2.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Level 2
//   Encoding: Itch
//   Version: 2.0
//   Date: 2/19/2026
//   Specification: Level2Specification.pdf
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

header message_header_t {
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
    bit<16> issue_subtype;
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

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> reg_sho_action;
}

header market_participant_position_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> mpid;
    bit<64> stock;
    bit<8> primary_market_maker;
    bit<8> market_maker_mode;
    bit<8> market_participant_state;
}

header operational_halt_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> market_code;
    bit<8> operational_halt_action;
}

header market_participant_bid_ask_update_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> market_side;
    bit<32> participant_shares;
    bit<64> stock;
    bit<32> price;
    bit<32> mpid;
}

header retail_price_interest_indicator_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> interest_flag;
}

header market_wide_circuit_breaker_decline_level_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> level_1;
    bit<64> level_2;
    bit<64> level_3;
}

header market_wide_circuit_breaker_status_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> breached_level;
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
    message_header_t message_header[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    stock_trading_action_message_t stock_trading_action_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    market_participant_position_message_t market_participant_position_message[MAX_MESSAGES];
    operational_halt_message_t operational_halt_message[MAX_MESSAGES];
    market_participant_bid_ask_update_message_t market_participant_bid_ask_update_message[MAX_MESSAGES];
    retail_price_interest_indicator_message_t retail_price_interest_indicator_message[MAX_MESSAGES];
    market_wide_circuit_breaker_decline_level_message_t market_wide_circuit_breaker_decline_level_message[MAX_MESSAGES];
    market_wide_circuit_breaker_status_message_t market_wide_circuit_breaker_status_message[MAX_MESSAGES];
    ipo_quoting_period_update_message_t ipo_quoting_period_update_message[MAX_MESSAGES];
}

parser NsmequitiesLevel2Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message_header.next);
        transition select(hdr.message_header.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x59: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x50: parse_market_participant_position_message;
            8w0x68: parse_operational_halt_message;
            8w0x55: parse_market_participant_bid_ask_update_message;
            8w0x4e: parse_retail_price_interest_indicator_message;
            8w0x56: parse_market_wide_circuit_breaker_decline_level_message;
            8w0x57: parse_market_wide_circuit_breaker_status_message;
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

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message.next);
        transition parse_message;
    }

    state parse_market_participant_position_message {
        packet.extract(hdr.market_participant_position_message.next);
        transition parse_message;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message.next);
        transition parse_message;
    }

    state parse_market_participant_bid_ask_update_message {
        packet.extract(hdr.market_participant_bid_ask_update_message.next);
        transition parse_message;
    }

    state parse_retail_price_interest_indicator_message {
        packet.extract(hdr.retail_price_interest_indicator_message.next);
        transition parse_message;
    }

    state parse_market_wide_circuit_breaker_decline_level_message {
        packet.extract(hdr.market_wide_circuit_breaker_decline_level_message.next);
        transition parse_message;
    }

    state parse_market_wide_circuit_breaker_status_message {
        packet.extract(hdr.market_wide_circuit_breaker_status_message.next);
        transition parse_message;
    }

    state parse_ipo_quoting_period_update_message {
        packet.extract(hdr.ipo_quoting_period_update_message.next);
        transition parse_message;
    }

}

control NsmequitiesLevel2VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesLevel2Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesLevel2Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesLevel2ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesLevel2Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message_header);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.market_participant_position_message);
        packet.emit(hdr.operational_halt_message);
        packet.emit(hdr.market_participant_bid_ask_update_message);
        packet.emit(hdr.retail_price_interest_indicator_message);
        packet.emit(hdr.market_wide_circuit_breaker_decline_level_message);
        packet.emit(hdr.market_wide_circuit_breaker_status_message);
        packet.emit(hdr.ipo_quoting_period_update_message);
    }
}

V1Switch(
    NsmequitiesLevel2Parser(),
    NsmequitiesLevel2VerifyChecksum(),
    NsmequitiesLevel2Ingress(),
    NsmequitiesLevel2Egress(),
    NsmequitiesLevel2ComputeChecksum(),
    NsmequitiesLevel2Deparser()
) main;
