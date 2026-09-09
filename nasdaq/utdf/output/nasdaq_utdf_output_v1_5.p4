// P4_16 (v1model) definition for: Nasdaq Utdf Output Utp v1.5
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Output
//   Encoding: Unlisted Trading Privilege
//   Version: 1.5
//   Date: 5/01/2020
//   Specification: UtpBinaryOutputSpec.pdf
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

header message_header_t {
    bit<80> session;
    bit<64> sequence;
    bit<16> count;
    bit<16> message_length;
    bit<8> version;
    bit<8> message_category;
}

header trade_message_t {
    bit<8> trade_message_type;
}

header trade_report_message_short_form_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<40> symbol_short;
    bit<64> trade_id;
    bit<16> trade_price_short;
    bit<16> trade_volume_short;
    bit<8> level_1;
    bit<8> level_2;
    bit<8> level_3;
    bit<8> level_4;
    bit<8> trade_through_exempt_flag;
    bit<8> consolidated_price_change_indicator;
    bit<8> participant_price_change_indicator;
}

header trade_report_message_long_form_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<88> symbol_long;
    bit<64> trade_id;
    bit<64> trade_price;
    bit<32> trade_volume;
    bit<8> level_1;
    bit<8> level_2;
    bit<8> level_3;
    bit<8> level_4;
    bit<8> trade_through_exempt_flag;
    bit<16> sellers_sale_days;
    bit<8> consolidated_price_change_indicator;
    bit<8> participant_price_change_indicator;
}

header trade_cancel_error_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<88> symbol_long;
    bit<8> trade_cancellation_type;
    bit<64> original_trade_id;
    bit<64> original_trade_price;
    bit<32> original_volume;
    bit<8> level_1;
    bit<8> level_2;
    bit<8> level_3;
    bit<8> level_4;
    bit<8> original_trade_through_exempt_flag;
    bit<16> original_sellers_sale_days;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_last_price;
    bit<64> consolidated_volume;
    bit<8> consolidated_price_change_indicator;
    bit<8> market_center_originator_id_2;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
    bit<64> market_participant_last_price;
    bit<64> market_participant_volume;
}

header trade_correction_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<88> symbol_long;
    bit<64> original_trade_id;
    bit<64> original_trade_price;
    bit<32> original_volume;
    bit<8> level_1;
    bit<8> level_2;
    bit<8> level_3;
    bit<8> level_4;
    bit<8> original_trade_through_exempt_flag;
    bit<16> original_sellers_sale_days;
    bit<64> corrected_trade_id;
    bit<64> corrected_trade_price;
    bit<32> corrected_volume;
    bit<8> level_1_2;
    bit<8> level_2_2;
    bit<8> level_3_2;
    bit<8> level_4_2;
    bit<8> corrected_trade_through_exempt_flag;
    bit<16> corrected_sellers_sale_days;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_last_price;
    bit<64> consolidated_volume;
    bit<8> consolidated_price_change_indicator;
    bit<8> market_center_originator_id_2;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
    bit<64> market_participant_last_price;
    bit<64> market_participant_volume;
}

header prior_day_as_of_trade_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<88> symbol_long;
    bit<64> trade_id;
    bit<64> trade_price;
    bit<32> trade_volume;
    bit<8> level_1;
    bit<8> level_2;
    bit<8> level_3;
    bit<8> level_4;
    bit<8> trade_through_exempt_flag;
    bit<16> sellers_sale_days;
    bit<8> as_of_action;
    bit<64> timestamp_of_trade;
}

header administrative_message_t {
    bit<8> administrative_message_type;
}

header general_administrative_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<16> text_length;
}

header cross_sro_trading_action_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> trading_action_code;
    bit<32> trading_action_sequence_number;
    bit<64> action_timestamp;
    bit<48> trading_action_reason;
}

header market_center_trading_action_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> trading_action_code;
    bit<64> action_timestamp;
    bit<8> market_center_identifier;
}

header issue_symbol_directory_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<88> old_symbol;
    bit<240> issue_name;
    bit<8> issue_type;
    bit<16> issue_subtype;
    bit<8> market_tier;
    bit<8> authenticity;
    bit<8> short_sale_threshold_indicator;
    bit<16> round_lot_size;
    bit<8> financial_status_indicator;
}

header regulation_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<40> symbol_short;
    bit<8> reg_sho_action;
}

header limit_up_limit_down_price_band_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> luld_price_band_indicator;
    bit<64> luld_timestamp;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
}

header market_wide_circuit_breaker_decline_level_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> mwcb_level_1;
    bit<64> mwcb_level_2;
    bit<64> mwcb_level_3;
}

header market_wide_circuit_breaker_status_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<8> mwcb_status_level_indicator;
}

header auction_collar_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<32> trading_action_sequence_number;
    bit<64> collar_reference_price;
    bit<64> collar_up_price;
    bit<64> collar_down_price;
    bit<8> collar_extension_indicator;
}

header closing_trade_summary_report_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<64> daily_consolidated_high_price;
    bit<64> daily_consolidated_low_price;
    bit<64> daily_consolidated_closing_price;
    bit<8> market_center_originator_id_2;
    bit<64> consolidated_volume;
    bit<8> trading_action_indicator;
    bit<16> number_of_market_center_summaries;
}

header closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_t {
    bit<8> market_center_identifier;
    bit<64> market_center_closing_price;
    bit<64> market_center_volume;
    bit<8> market_center_close_indicator;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
}

header volume_message_t {
    bit<8> volume_message_type;
}

header total_consolidated_and_market_center_volume_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> total_consolidated_volume;
    bit<16> number_of_market_center_volumes;
}

header total_consolidated_and_market_center_volume_message_market_center_volume_attachment_t {
    bit<8> market_center_identifier;
    bit<64> current_market_center_volume;
}

header control_message_t {
    bit<8> control_message_type;
}

header start_of_day_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

header end_of_day_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

header market_session_open_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

header market_session_close_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

header end_of_transmissions_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

header end_of_trade_reporting_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

header end_of_consolidated_last_sale_eligibility_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_remaining;
    bit<16> total_consolidated_and_market_center_volume_message_market_center_volume_attachment_remaining;
}

struct headers_t {
    message_header_t message_header;
    trade_message_t trade_message;
    trade_report_message_short_form_message_t trade_report_message_short_form_message;
    trade_report_message_long_form_message_t trade_report_message_long_form_message;
    trade_cancel_error_message_t trade_cancel_error_message;
    trade_correction_message_t trade_correction_message;
    prior_day_as_of_trade_message_t prior_day_as_of_trade_message;
    administrative_message_t administrative_message;
    general_administrative_message_t general_administrative_message;
    cross_sro_trading_action_message_t cross_sro_trading_action_message;
    market_center_trading_action_message_t market_center_trading_action_message;
    issue_symbol_directory_message_t issue_symbol_directory_message;
    regulation_sho_short_sale_price_test_restricted_indicator_message_t regulation_sho_short_sale_price_test_restricted_indicator_message;
    limit_up_limit_down_price_band_message_t limit_up_limit_down_price_band_message;
    market_wide_circuit_breaker_decline_level_message_t market_wide_circuit_breaker_decline_level_message;
    market_wide_circuit_breaker_status_message_t market_wide_circuit_breaker_status_message;
    auction_collar_message_t auction_collar_message;
    closing_trade_summary_report_message_t closing_trade_summary_report_message;
    closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_t closing_trade_summary_report_message_market_center_closing_price_and_volume_summary[MAX_MESSAGES];
    volume_message_t volume_message;
    total_consolidated_and_market_center_volume_message_t total_consolidated_and_market_center_volume_message;
    total_consolidated_and_market_center_volume_message_market_center_volume_attachment_t total_consolidated_and_market_center_volume_message_market_center_volume_attachment[MAX_MESSAGES];
    control_message_t control_message;
    start_of_day_message_t start_of_day_message;
    end_of_day_message_t end_of_day_message;
    market_session_open_message_t market_session_open_message;
    market_session_close_message_t market_session_close_message;
    end_of_transmissions_message_t end_of_transmissions_message;
    end_of_trade_reporting_message_t end_of_trade_reporting_message;
    end_of_consolidated_last_sale_eligibility_t end_of_consolidated_last_sale_eligibility;
}

parser NasdaqUtdfOutputParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_category) {
            8w0x54: parse_trade_message;
            8w0x41: parse_administrative_message;
            8w0x56: parse_volume_message;
            8w0x43: parse_control_message;
            default: accept;
        }
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition select(hdr.trade_message.trade_message_type) {
            8w0x41: parse_trade_report_message_short_form_message;
            8w0x57: parse_trade_report_message_long_form_message;
            8w0x5a: parse_trade_cancel_error_message;
            8w0x59: parse_trade_correction_message;
            8w0x48: parse_prior_day_as_of_trade_message;
            default: accept;
        }
    }

    state parse_trade_report_message_short_form_message {
        packet.extract(hdr.trade_report_message_short_form_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_report_message_long_form_message {
        packet.extract(hdr.trade_report_message_long_form_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancel_error_message {
        packet.extract(hdr.trade_cancel_error_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_prior_day_as_of_trade_message {
        packet.extract(hdr.prior_day_as_of_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_administrative_message {
        packet.extract(hdr.administrative_message);
        meta.dispatched = 1;
        transition select(hdr.administrative_message.administrative_message_type) {
            8w0x41: parse_general_administrative_message;
            8w0x48: parse_cross_sro_trading_action_message;
            8w0x4b: parse_market_center_trading_action_message;
            8w0x42: parse_issue_symbol_directory_message;
            8w0x56: parse_regulation_sho_short_sale_price_test_restricted_indicator_message;
            8w0x50: parse_limit_up_limit_down_price_band_message;
            8w0x43: parse_market_wide_circuit_breaker_decline_level_message;
            8w0x44: parse_market_wide_circuit_breaker_status_message;
            8w0x45: parse_auction_collar_message;
            8w0x5a: parse_closing_trade_summary_report_message;
            default: accept;
        }
    }

    state parse_general_administrative_message {
        packet.extract(hdr.general_administrative_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cross_sro_trading_action_message {
        packet.extract(hdr.cross_sro_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_center_trading_action_message {
        packet.extract(hdr.market_center_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_issue_symbol_directory_message {
        packet.extract(hdr.issue_symbol_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_regulation_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.regulation_sho_short_sale_price_test_restricted_indicator_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_limit_up_limit_down_price_band_message {
        packet.extract(hdr.limit_up_limit_down_price_band_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_wide_circuit_breaker_decline_level_message {
        packet.extract(hdr.market_wide_circuit_breaker_decline_level_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_wide_circuit_breaker_status_message {
        packet.extract(hdr.market_wide_circuit_breaker_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_collar_message {
        packet.extract(hdr.auction_collar_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_closing_trade_summary_report_message {
        packet.extract(hdr.closing_trade_summary_report_message);
        meta.dispatched = 1;
        meta.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_remaining = hdr.closing_trade_summary_report_message.number_of_market_center_summaries;
        transition select(meta.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_remaining) {
            16w0: accept;
            default: parse_closing_trade_summary_report_message_market_center_closing_price_and_volume_summary;
        }
    }

    state parse_closing_trade_summary_report_message_market_center_closing_price_and_volume_summary {
        packet.extract(hdr.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary.next);
        meta.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_remaining = meta.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_remaining - 1;
        transition select(meta.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary_remaining) {
            16w0: accept;
            default: parse_closing_trade_summary_report_message_market_center_closing_price_and_volume_summary;
        }
    }

    state parse_volume_message {
        packet.extract(hdr.volume_message);
        meta.dispatched = 1;
        transition select(hdr.volume_message.volume_message_type) {
            8w0x4d: parse_total_consolidated_and_market_center_volume_message;
            default: accept;
        }
    }

    state parse_total_consolidated_and_market_center_volume_message {
        packet.extract(hdr.total_consolidated_and_market_center_volume_message);
        meta.dispatched = 1;
        meta.total_consolidated_and_market_center_volume_message_market_center_volume_attachment_remaining = hdr.total_consolidated_and_market_center_volume_message.number_of_market_center_volumes;
        transition select(meta.total_consolidated_and_market_center_volume_message_market_center_volume_attachment_remaining) {
            16w0: accept;
            default: parse_total_consolidated_and_market_center_volume_message_market_center_volume_attachment;
        }
    }

    state parse_total_consolidated_and_market_center_volume_message_market_center_volume_attachment {
        packet.extract(hdr.total_consolidated_and_market_center_volume_message_market_center_volume_attachment.next);
        meta.total_consolidated_and_market_center_volume_message_market_center_volume_attachment_remaining = meta.total_consolidated_and_market_center_volume_message_market_center_volume_attachment_remaining - 1;
        transition select(meta.total_consolidated_and_market_center_volume_message_market_center_volume_attachment_remaining) {
            16w0: accept;
            default: parse_total_consolidated_and_market_center_volume_message_market_center_volume_attachment;
        }
    }

    state parse_control_message {
        packet.extract(hdr.control_message);
        meta.dispatched = 1;
        transition select(hdr.control_message.control_message_type) {
            8w0x49: parse_start_of_day_message;
            8w0x4a: parse_end_of_day_message;
            8w0x4f: parse_market_session_open_message;
            8w0x43: parse_market_session_close_message;
            8w0x5a: parse_end_of_transmissions_message;
            8w0x58: parse_end_of_trade_reporting_message;
            8w0x53: parse_end_of_consolidated_last_sale_eligibility;
            default: accept;
        }
    }

    state parse_start_of_day_message {
        packet.extract(hdr.start_of_day_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_day_message {
        packet.extract(hdr.end_of_day_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_session_open_message {
        packet.extract(hdr.market_session_open_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_session_close_message {
        packet.extract(hdr.market_session_close_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_transmissions_message {
        packet.extract(hdr.end_of_transmissions_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_trade_reporting_message {
        packet.extract(hdr.end_of_trade_reporting_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_consolidated_last_sale_eligibility {
        packet.extract(hdr.end_of_consolidated_last_sale_eligibility);
        meta.dispatched = 1;
        transition accept;
    }

}

control NasdaqUtdfOutputVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtdfOutputIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NasdaqUtdfOutputEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqUtdfOutputComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtdfOutputDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_report_message_short_form_message);
        packet.emit(hdr.trade_report_message_long_form_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.prior_day_as_of_trade_message);
        packet.emit(hdr.administrative_message);
        packet.emit(hdr.general_administrative_message);
        packet.emit(hdr.cross_sro_trading_action_message);
        packet.emit(hdr.market_center_trading_action_message);
        packet.emit(hdr.issue_symbol_directory_message);
        packet.emit(hdr.regulation_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.limit_up_limit_down_price_band_message);
        packet.emit(hdr.market_wide_circuit_breaker_decline_level_message);
        packet.emit(hdr.market_wide_circuit_breaker_status_message);
        packet.emit(hdr.auction_collar_message);
        packet.emit(hdr.closing_trade_summary_report_message);
        packet.emit(hdr.closing_trade_summary_report_message_market_center_closing_price_and_volume_summary);
        packet.emit(hdr.volume_message);
        packet.emit(hdr.total_consolidated_and_market_center_volume_message);
        packet.emit(hdr.total_consolidated_and_market_center_volume_message_market_center_volume_attachment);
        packet.emit(hdr.control_message);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.market_session_open_message);
        packet.emit(hdr.market_session_close_message);
        packet.emit(hdr.end_of_transmissions_message);
        packet.emit(hdr.end_of_trade_reporting_message);
        packet.emit(hdr.end_of_consolidated_last_sale_eligibility);
    }
}

V1Switch(
    NasdaqUtdfOutputParser(),
    NasdaqUtdfOutputVerifyChecksum(),
    NasdaqUtdfOutputIngress(),
    NasdaqUtdfOutputEgress(),
    NasdaqUtdfOutputComputeChecksum(),
    NasdaqUtdfOutputDeparser()
) main;
