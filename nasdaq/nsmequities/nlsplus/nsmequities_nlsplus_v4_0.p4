// P4_16 (v1model) definition for: Nasdaq NsmEquities NlsPlus Itch v4.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Last Sale Plus
//   Encoding: Itch
//   Version: 4.0
//   Date: 2/19/2026
//   Specification: NLS4.0_02132026.pdf
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

header trade_report_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<48> client_timestamp;
    bit<8> originating_market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> trade_control_number;
    bit<64> trade_price;
    bit<64> trade_size;
    bit<32> sale_condition_modifier;
    bit<64> consolidated_volume;
}

header trade_cancel_error_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<48> client_timestamp;
    bit<8> originating_market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<64> original_trade_price;
    bit<64> original_trade_size;
    bit<32> original_sale_condition_modifier;
    bit<64> consolidated_volume;
}

header trade_correction_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<48> client_timestamp;
    bit<8> originating_market_center_identifier;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<80> original_trade_control_number;
    bit<64> original_trade_price;
    bit<64> original_trade_size;
    bit<32> original_sale_condition_modifier;
    bit<80> corrected_trade_control_number;
    bit<64> corrected_trade_price;
    bit<64> corrected_trade_size;
    bit<32> corrected_sale_condition_modifier;
    bit<64> consolidated_volume;
}

header stock_trading_action_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<8> current_trading_state;
    bit<32> reason;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> issue_symbol;
    bit<8> reg_sho_action;
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
    bit<96> bloomberg_id;
}

header adjusted_closing_price_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<64> adjusted_closing_price;
}

header end_of_day_trade_summary_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_closing_price;
    bit<64> consolidated_volume;
    bit<64> consolidated_open_price;
}

header ipo_information_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> issue_symbol;
    bit<8> security_class;
    bit<8> reference_for_net_change;
    bit<64> reference_price;
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

header ipo_quoting_period_update_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<32> ipo_quotation_release_time;
    bit<8> ipo_quotation_release_qualifier;
    bit<64> ipo_price;
}

header operational_halt_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock_alpha_8;
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
    trade_cancel_error_message_t trade_cancel_error_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    stock_trading_action_message_t stock_trading_action_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    stock_directory_message_t stock_directory_message[MAX_MESSAGES];
    adjusted_closing_price_message_t adjusted_closing_price_message[MAX_MESSAGES];
    end_of_day_trade_summary_message_t end_of_day_trade_summary_message[MAX_MESSAGES];
    ipo_information_message_t ipo_information_message[MAX_MESSAGES];
    mwcb_decline_level_message_t mwcb_decline_level_message[MAX_MESSAGES];
    mwcb_status_message_t mwcb_status_message[MAX_MESSAGES];
    ipo_quoting_period_update_message_t ipo_quoting_period_update_message[MAX_MESSAGES];
    operational_halt_message_t operational_halt_message[MAX_MESSAGES];
}

parser NsmequitiesNlsplusParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message_header.next);
        transition select(hdr.message_header.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x65: parse_trade_report_message;
            8w0x6f: parse_trade_cancel_error_message;
            8w0x62: parse_trade_correction_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x59: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x52: parse_stock_directory_message;
            8w0x67: parse_adjusted_closing_price_message;
            8w0x70: parse_end_of_day_trade_summary_message;
            8w0x69: parse_ipo_information_message;
            8w0x56: parse_mwcb_decline_level_message;
            8w0x57: parse_mwcb_status_message;
            8w0x6b: parse_ipo_quoting_period_update_message;
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

    state parse_trade_cancel_error_message {
        packet.extract(hdr.trade_cancel_error_message.next);
        transition parse_message;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message.next);
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

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message.next);
        transition parse_message;
    }

    state parse_adjusted_closing_price_message {
        packet.extract(hdr.adjusted_closing_price_message.next);
        transition parse_message;
    }

    state parse_end_of_day_trade_summary_message {
        packet.extract(hdr.end_of_day_trade_summary_message.next);
        transition parse_message;
    }

    state parse_ipo_information_message {
        packet.extract(hdr.ipo_information_message.next);
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

    state parse_ipo_quoting_period_update_message {
        packet.extract(hdr.ipo_quoting_period_update_message.next);
        transition parse_message;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message.next);
        transition parse_message;
    }

}

control NsmequitiesNlsplusVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNlsplusIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsmequitiesNlsplusEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesNlsplusComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesNlsplusDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message_header);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.adjusted_closing_price_message);
        packet.emit(hdr.end_of_day_trade_summary_message);
        packet.emit(hdr.ipo_information_message);
        packet.emit(hdr.mwcb_decline_level_message);
        packet.emit(hdr.mwcb_status_message);
        packet.emit(hdr.ipo_quoting_period_update_message);
        packet.emit(hdr.operational_halt_message);
    }
}

V1Switch(
    NsmequitiesNlsplusParser(),
    NsmequitiesNlsplusVerifyChecksum(),
    NsmequitiesNlsplusIngress(),
    NsmequitiesNlsplusEgress(),
    NsmequitiesNlsplusComputeChecksum(),
    NsmequitiesNlsplusDeparser()
) main;
