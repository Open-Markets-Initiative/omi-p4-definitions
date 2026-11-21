// P4_16 (v1model) definition for: Nasdaq NasdaqCanada Basic Itch v1.6
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nasdaq Basic Canada
//   Encoding: Itch
//   Version: 1.6
//   Date: 8/16/2024
//   Specification: Nasdaq_Basic_Canada_Specification_1.6.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
//   Authors: Omi Developers
// 
// Copyright (c) 2026 Scaled Sources LLC.  https://www.scaledsources.com
// 
// The protocol compiler technologies used to produce this file are the subject of
// patents owned by Scaled Sources LLC.  Those patent rights are retained and are
// not transferred by this contribution:
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
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

header quotation_message_t {
    bit<64> time_stamp;
    bit<80> stock_symbol;
    bit<64> nasdaq_canada_best_bid_price;
    bit<32> nasdaq_canada_best_bid_size;
    bit<32> nasdaq_cxc_best_bid_size;
    bit<32> nasdaq_cx_2_best_bid_size;
    bit<64> nasdaq_canada_best_ask_price;
    bit<32> nasdaq_canada_best_ask_size;
    bit<32> nasdaq_cxc_best_ask_size;
    bit<32> nasdaq_cx_2_best_ask_size;
}

header trade_report_message_t {
    bit<64> time_stamp;
    bit<8> originating_market_center_identifier;
    bit<80> stock_symbol;
    bit<32> trade_number;
    bit<64> trade_price;
    bit<32> trade_size;
    bit<24> broker;
    bit<24> contra_broker;
    bit<8> sale_condition_modifier_level_1;
    bit<8> sales_condition_modifier_level_2;
    bit<8> sales_condition_modifier_level_3;
    bit<8> sales_condition_modifier_level_4;
    bit<64> consolidated_trade_volume;
}

header trade_break_message_t {
    bit<64> time_stamp;
    bit<32> trade_control_number;
    bit<8> originating_market_center_identifier;
}

header trade_correction_message_t {
    bit<64> time_stamp;
    bit<8> originating_market_center_identifier;
    bit<80> stock_symbol;
    bit<32> original_trade_number;
    bit<64> original_trade_price;
    bit<32> original_trade_size;
    bit<64> corrected_trade_price;
    bit<32> corrected_trade_size;
}

header system_event_message_t {
    bit<64> time_stamp;
    bit<8> originating_market_center_identifier;
    bit<8> event_code;
}

header stock_directory_message_t {
    bit<64> time_stamp;
    bit<80> stock_symbol;
    bit<320> stock_display_name;
    bit<8> listing_market;
    bit<32> board_lot_size;
    bit<8> currency;
}

header stock_status_message_t {
    bit<64> time_stamp;
    bit<80> stock_symbol;
    bit<8> market;
    bit<8> system_status;
}

header end_of_day_trade_summary_message_t {
    bit<64> time_stamp;
    bit<80> stock_symbol;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_open_price;
    bit<64> listing_center_open_price;
    bit<64> consolidated_close_price;
    bit<64> listing_center_close_price;
    bit<64> consolidated_volume;
}

header adjusted_closing_price_message_t {
    bit<64> time_stamp;
    bit<80> issue_symbol;
    bit<8> security_class;
    bit<64> adjusted_closing_price;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    quotation_message_t quotation_message[MAX_MESSAGES];
    trade_report_message_t trade_report_message[MAX_MESSAGES];
    trade_break_message_t trade_break_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    stock_status_message_t stock_status_message[MAX_MESSAGES];
    end_of_day_trade_summary_message_t end_of_day_trade_summary_message[MAX_MESSAGES];
    adjusted_closing_price_message_t adjusted_closing_price_message[MAX_MESSAGES];
}

parser NasdaqcanadaBasicParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x43: parse_quotation_message;
            8w0x54: parse_trade_report_message;
            8w0x58: parse_trade_break_message;
            8w0x5a: parse_trade_correction_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x48: parse_stock_status_message;
            8w0x44: parse_end_of_day_trade_summary_message;
            8w0x47: parse_adjusted_closing_price_message;
            default: accept;
        }
    }

    state parse_quotation_message {
        packet.extract(hdr.quotation_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_break_message {
        packet.extract(hdr.trade_break_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_stock_status_message {
        packet.extract(hdr.stock_status_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_end_of_day_trade_summary_message {
        packet.extract(hdr.end_of_day_trade_summary_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_adjusted_closing_price_message {
        packet.extract(hdr.adjusted_closing_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NasdaqcanadaBasicVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqcanadaBasicIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NasdaqcanadaBasicEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqcanadaBasicComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqcanadaBasicDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.quotation_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_break_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_status_message);
        packet.emit(hdr.end_of_day_trade_summary_message);
        packet.emit(hdr.adjusted_closing_price_message);
    }
}

V1Switch(
    NasdaqcanadaBasicParser(),
    NasdaqcanadaBasicVerifyChecksum(),
    NasdaqcanadaBasicIngress(),
    NasdaqcanadaBasicEgress(),
    NasdaqcanadaBasicComputeChecksum(),
    NasdaqcanadaBasicDeparser()
) main;
