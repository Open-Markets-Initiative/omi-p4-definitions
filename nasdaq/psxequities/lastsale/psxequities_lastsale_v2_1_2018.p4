// P4_16 (v1model) definition for: Nasdaq PsxEquities LastSale Itch v2.1.2018
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Last Sale
//   Encoding: Itch
//   Version: 2.1.2018
//   Date: 05/03/2018
//   Specification: PLSSpecification2.1.pdf
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
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> message_type;
}

header system_event_message_t {
    bit<8> event_code;
}

header trade_report_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> trade_control_number;
    bit<32> trade_price;
    bit<32> trade_size;
    bit<8> sale_condition_modifier_level_1;
    bit<8> sale_condition_modifier_level_2;
    bit<8> sale_condition_modifier_level_3;
    bit<8> sale_condition_modifier_level_4;
}

header next_shares_trade_report_message_t {
    bit<8> market_center_identifier;
    bit<64> next_shares_symbol;
    bit<8> security_class;
    bit<80> trade_control_number;
    bit<32> proxy_price;
    bit<32> trade_size;
    bit<32> nav_premium_discount_amount;
    bit<8> sale_condition_modifier_level_1;
    bit<8> sale_condition_modifier_level_2;
    bit<8> sale_condition_modifier_level_3;
    bit<8> sale_condition_modifier_level_4;
}

header trade_cancel_error_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<32> original_trade_price;
    bit<32> original_trade_size;
    bit<32> original_sale_condition_modifier;
}

header trade_cancel_error_for_next_shares_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<32> original_trade_price;
    bit<32> original_nav_premium_discount_amount;
    bit<32> original_trade_size;
    bit<32> original_sale_condition_modifier;
}

header trade_correction_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<32> original_trade_price;
    bit<32> original_trade_size;
    bit<32> original_sale_condition_modifier;
    bit<80> corrected_trade_control_number;
    bit<32> corrected_trade_price;
    bit<32> corrected_trade_size;
    bit<32> corrected_sale_condition_modifier;
}

header trade_correction_for_next_shares_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<32> original_trade_price;
    bit<32> original_nav_premium_discount_amount;
    bit<32> original_trade_size;
    bit<32> original_sale_condition_modifier;
    bit<80> corrected_trade_control_number;
    bit<32> corrected_trade_price;
    bit<32> corrected_nav_premium_discount_amount;
    bit<32> corrected_trade_size;
    bit<32> corrected_sale_condition_modifier;
}

header trading_action_message_t {
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<8> current_trading_state;
    bit<32> trading_action_reason;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<64> stock;
    bit<8> reg_sho_action;
}

header stock_directory_message_t {
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
    bit<64> level_1;
    bit<64> level_2;
    bit<64> level_3;
}

header mwcb_breach_message_t {
    bit<8> breached_level;
}

header operational_halt_message_t {
    bit<64> stock;
    bit<8> market_code;
    bit<8> operational_halt_action;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_header_t message_header[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    next_shares_trade_report_message_t next_shares_trade_report_message[MAX_MESSAGES];
    trade_cancel_error_message_t trade_cancel_error_message[MAX_MESSAGES];
    trade_cancel_error_for_next_shares_message_t trade_cancel_error_for_next_shares_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    trade_correction_for_next_shares_message_t trade_correction_for_next_shares_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    mwcb_decline_level_message_t mwcb_decline_level_message[MAX_MESSAGES];
    mwcb_breach_message_t mwcb_breach_message[MAX_MESSAGES];
    operational_halt_message_t operational_halt_message[MAX_MESSAGES];
}

parser PsxequitiesLastsaleParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message_header.next);
        transition select(hdr.message_header.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x54: parse_trade_report_message;
            8w0x4d: parse_next_shares_trade_report_message;
            8w0x58: parse_trade_cancel_error_message;
            8w0x4f: parse_trade_cancel_error_for_next_shares_message;
            8w0x43: parse_trade_correction_message;
            8w0x5a: parse_trade_correction_for_next_shares_message;
            8w0x48: parse_trading_action_message;
            8w0x59: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x52: parse_stock_directory_message;
            8w0x56: parse_mwcb_decline_level_message;
            8w0x57: parse_mwcb_breach_message;
            8w0x68: parse_operational_halt_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        transition parse_message;
    }

    state parse_next_shares_trade_report_message {
        packet.extract(hdr.next_shares_trade_report_message.next);
        transition parse_message;
    }

    state parse_trade_cancel_error_message {
        packet.extract(hdr.trade_cancel_error_message.next);
        transition parse_message;
    }

    state parse_trade_cancel_error_for_next_shares_message {
        packet.extract(hdr.trade_cancel_error_for_next_shares_message.next);
        transition parse_message;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message.next);
        transition parse_message;
    }

    state parse_trade_correction_for_next_shares_message {
        packet.extract(hdr.trade_correction_for_next_shares_message.next);
        transition parse_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        transition parse_message;
    }

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message.next);
        transition parse_message;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        transition parse_message;
    }

    state parse_mwcb_decline_level_message {
        packet.extract(hdr.mwcb_decline_level_message.next);
        transition parse_message;
    }

    state parse_mwcb_breach_message {
        packet.extract(hdr.mwcb_breach_message.next);
        transition parse_message;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message.next);
        transition parse_message;
    }

}

control PsxequitiesLastsaleVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PsxequitiesLastsaleIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PsxequitiesLastsaleEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PsxequitiesLastsaleComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PsxequitiesLastsaleDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message_header);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.next_shares_trade_report_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_cancel_error_for_next_shares_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.trade_correction_for_next_shares_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.mwcb_decline_level_message);
        packet.emit(hdr.mwcb_breach_message);
        packet.emit(hdr.operational_halt_message);
    }
}

V1Switch(
    PsxequitiesLastsaleParser(),
    PsxequitiesLastsaleVerifyChecksum(),
    PsxequitiesLastsaleIngress(),
    PsxequitiesLastsaleEgress(),
    PsxequitiesLastsaleComputeChecksum(),
    PsxequitiesLastsaleDeparser()
) main;
