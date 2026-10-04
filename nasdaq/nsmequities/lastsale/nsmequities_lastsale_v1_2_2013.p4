// P4_16 (v1model) definition for: Nasdaq NsmEquities LastSale AsciiItch v1.2.2013
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Last Sale
//   Encoding: Ascii Itch
//   Version: 1.2.2013
//   Date: 11/01/2013
//   Specification: NQLastSale-V1_1.pdf
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
    bit<32> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<64> timestamp;
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
    bit<80> trade_price;
    bit<72> trade_size;
    bit<8> settlement_type;
    bit<8> trade_through_exemption;
    bit<8> extended_hours_or_sold_code;
    bit<8> special_sale_condition;
}

header trade_cancel_error_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<80> original_trade_price;
    bit<72> original_trade_size;
    bit<8> original_settlement_type;
    bit<8> original_trade_through_exemption;
    bit<8> original_extended_hours_or_sold_code;
    bit<8> original_special_sale_condition;
}

header trade_correction_message_t {
    bit<8> market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<80> original_trade_price;
    bit<72> original_trade_size;
    bit<8> original_settlement_type;
    bit<8> original_trade_through_exemption;
    bit<8> original_extended_hours_or_sold_code;
    bit<8> original_special_sale_condition;
    bit<80> corrected_trade_control_number;
    bit<80> corrected_trade_price;
    bit<72> corrected_trade_size;
    bit<8> corrected_settlement_type;
    bit<8> corrected_trade_through_exemption;
    bit<8> corrected_extended_hours_or_sold_code;
    bit<8> corrected_special_sale_condition;
}

header stock_trading_action_message_t {
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<8> current_trading_state;
    bit<32> reason;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<64> stock;
    bit<8> reg_sho_action;
}

header stock_directory_message_t {
    bit<64> issue_symbol;
    bit<8> market_category;
    bit<8> financial_status_indicator;
}

header adjusted_closing_price_message_t {
    bit<64> stock;
    bit<8> security_class;
    bit<80> adjusted_closing_price;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    trade_cancel_error_message_t trade_cancel_error_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    stock_trading_action_message_t stock_trading_action_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    adjusted_closing_price_message_t adjusted_closing_price_message[MAX_MESSAGES];
}

parser NsmequitiesLastsaleParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0x0: parse_heartbeat;
            16w0xffff: parse_end_of_session;
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
            8w0x54: parse_trade_report_message;
            8w0x58: parse_trade_cancel_error_message;
            8w0x43: parse_trade_correction_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x59: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x52: parse_stock_directory_message;
            8w0x47: parse_adjusted_closing_price_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_cancel_error_message {
        packet.extract(hdr.trade_cancel_error_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_trading_action_message {
        packet.extract(hdr.stock_trading_action_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_adjusted_closing_price_message {
        packet.extract(hdr.adjusted_closing_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NsmequitiesLastsaleVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesLastsaleIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesLastsaleEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesLastsaleComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesLastsaleDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.adjusted_closing_price_message);
    }
}

V1Switch(
    NsmequitiesLastsaleParser(),
    NsmequitiesLastsaleVerifyChecksum(),
    NsmequitiesLastsaleIngress(),
    NsmequitiesLastsaleEgress(),
    NsmequitiesLastsaleComputeChecksum(),
    NsmequitiesLastsaleDeparser()
) main;
