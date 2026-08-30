// P4_16 (v1model) definition for: Nasdaq Utdf Output Utp v3.0.c
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Output
//   Encoding: Utp
//   Version: 3.0.c
//   Date: 02/01/2026
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

header udp_packet_header_t {
    bit<80> udp_session;
    bit<64> udp_sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> version;
    bit<8> message_category;
}

header trade_message_t {
    bit<8> trade_message_type;
}

header trade_report_message_shortform_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<40> symbol_short;
    bit<64> trade_id;
    bit<16> trade_price_short;
    bit<16> trade_volume_short;
    bit<32> sale_condition;
    bit<8> trade_through_exempt_flag;
    bit<8> consolidated_price_change_indicator;
    bit<8> participant_price_change_indicator;
}

header trade_report_message_longform_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> trade_id;
    bit<64> trade_price_long;
    bit<32> trade_volume_long;
    bit<32> sale_condition;
    bit<8> trade_through_exempt_flag;
    bit<16> sellers_sale_days;
    bit<8> consolidated_price_change_indicator;
    bit<8> participant_price_change_indicator;
}

header trade_cancel_error_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<8> trade_cancellation_type;
    bit<64> original_trade_id;
    bit<64> original_trade_price;
    bit<32> original_volume_short;
    bit<32> original_sale_condition;
    bit<8> original_trade_through_exempt_flag;
    bit<16> original_sellers_sale_days;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_last_price;
    bit<64> consolidated_volume;
    bit<8> consolidated_price_change_indicator;
    bit<8> consolidated_last_price_originator;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
    bit<64> market_participant_last_price;
    bit<64> market_participant_volume;
}

header trade_correction_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> original_trade_id;
    bit<64> original_trade_price;
    bit<32> original_volume_short;
    bit<32> original_sale_condition;
    bit<8> original_trade_through_exempt_flag;
    bit<16> original_sellers_sale_days;
    bit<64> corrected_trade_id;
    bit<64> corrected_trade_price;
    bit<32> corrected_volume_short;
    bit<32> corrected_sale_condition;
    bit<8> corrected_trade_through_exempt_flag;
    bit<16> corrected_sellers_sale_days;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_last_price;
    bit<64> consolidated_volume;
    bit<8> consolidated_price_change_indicator;
    bit<8> consolidated_last_price_originator;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
    bit<64> market_participant_last_price;
    bit<64> market_participant_volume;
}

header prior_day_as_of_trade_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> trade_id;
    bit<64> trade_price_long;
    bit<32> trade_volume_long;
    bit<32> sale_condition;
    bit<8> trade_through_exempt_flag;
    bit<16> sellers_sale_days;
    bit<8> as_of_action;
    bit<64> timestamp_of_trade;
}

header fractional_trade_report_message_shortform_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<40> symbol_short;
    bit<64> trade_id;
    bit<16> trade_price_short;
    bit<64> trade_volume;
    bit<32> sale_condition;
    bit<8> trade_through_exempt_flag;
    bit<8> consolidated_price_change_indicator;
    bit<8> participant_price_change_indicator;
}

header fractional_trade_report_message_longform_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> trade_id;
    bit<64> trade_price_long;
    bit<64> trade_volume;
    bit<32> sale_condition;
    bit<8> trade_through_exempt_flag;
    bit<16> sellers_sale_days;
    bit<8> consolidated_price_change_indicator;
    bit<8> participant_price_change_indicator;
}

header fractional_trade_cancel_error_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<8> trade_cancellation_type;
    bit<64> original_trade_id;
    bit<64> original_trade_price;
    bit<64> original_volume_long;
    bit<32> original_sale_condition;
    bit<8> original_trade_through_exempt_flag;
    bit<16> original_sellers_sale_days;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_last_price;
    bit<64> consolidated_volume;
    bit<8> consolidated_price_change_indicator;
    bit<8> consolidated_last_price_originator;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
    bit<64> market_participant_last_price;
    bit<64> market_participant_volume;
}

header fractional_trade_correction_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> original_trade_id;
    bit<64> original_trade_price;
    bit<64> original_volume_long;
    bit<32> original_sale_condition;
    bit<8> original_trade_through_exempt_flag;
    bit<16> original_sellers_sale_days;
    bit<64> corrected_trade_id;
    bit<64> corrected_trade_price;
    bit<64> corrected_volume_long;
    bit<32> corrected_sale_condition;
    bit<8> corrected_trade_through_exempt_flag;
    bit<16> corrected_sellers_sale_days;
    bit<64> consolidated_high_price;
    bit<64> consolidated_low_price;
    bit<64> consolidated_last_price;
    bit<64> consolidated_volume;
    bit<8> consolidated_price_change_indicator;
    bit<8> consolidated_last_price_originator;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
    bit<64> market_participant_last_price;
    bit<64> market_participant_volume;
}

header fractional_as_of_trade_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> trade_id;
    bit<64> trade_price_long;
    bit<64> trade_volume;
    bit<32> sale_condition;
    bit<8> trade_through_exempt_flag;
    bit<16> sellers_sale_days;
    bit<8> as_of_action;
    bit<64> timestamp_of_trade;
}

header administrative_message_t {
    bit<8> administrative_message_type;
}

header general_administrative_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<16> text_length;
}

header cross_sro_trading_action_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> trading_action_code;
    bit<32> trading_action_sequence_number;
    bit<64> action_time;
    bit<48> reason_for_the_trading_action;
}

header market_center_trading_action_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> trading_action_code;
    bit<64> action_time;
    bit<8> market_center_identifier;
}

header issue_symbol_directory_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
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

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> reg_sho_action;
}

header limit_up_limit_down_price_band_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> luld_price_band_indicator;
    bit<64> luld_price_band_effective_time;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
}

header market_wide_circuit_breaker_decline_level_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> mwcb_level_1;
    bit<64> mwcb_level_2;
    bit<64> mwcb_level_3;
}

header market_wide_circuit_breaker_status_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<8> mwcb_status_level_indicator;
}

header auction_collar_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<32> trading_action_sequence_number;
    bit<64> collar_reference_price;
    bit<64> collar_up_price;
    bit<64> collar_down_price;
    bit<8> collar_extension_indicator;
}

header closing_trade_summary_report_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<64> daily_consolidated_high_price;
    bit<64> daily_consolidated_low_price;
    bit<64> daily_consolidated_closing_price;
    bit<8> consolidated_last_price_originator;
    bit<64> consolidated_volume;
    bit<8> trading_action_indicator;
    bit<16> number_of_market_center_attachments;
    bit<8> market_center_identifier;
    bit<64> market_center_closing_price;
    bit<64> market_center_volume;
    bit<8> market_center_close_indicator;
    bit<64> market_participant_high_price;
    bit<64> market_participant_low_price;
}

header total_consolidated_volume_message_t {
    bit<8> total_consolidated_volume_message_type;
}

header total_consolidated_and_market_center_volume_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> total_consolidated_volume;
    bit<16> number_of_market_center_attachments;
    bit<8> market_center_identifier;
    bit<64> market_center_volume;
}

header control_message_t {
    bit<8> control_message_type;
}

header start_of_day_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

header end_of_day_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

header market_session_open_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

header market_session_close_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

header end_of_transmissions_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

header end_of_trade_reporting_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

header end_of_consolidated_last_sale_eligibility_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
}

struct metadata_t {
}

struct headers_t {
    udp_packet_header_t udp_packet_header;
    message_t message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    trade_report_message_shortform_message_t trade_report_message_shortform_message[MAX_MESSAGES];
    trade_report_message_longform_message_t trade_report_message_longform_message[MAX_MESSAGES];
    trade_cancel_error_message_t trade_cancel_error_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    prior_day_as_of_trade_message_t prior_day_as_of_trade_message[MAX_MESSAGES];
    fractional_trade_report_message_shortform_message_t fractional_trade_report_message_shortform_message[MAX_MESSAGES];
    fractional_trade_report_message_longform_message_t fractional_trade_report_message_longform_message[MAX_MESSAGES];
    fractional_trade_cancel_error_message_t fractional_trade_cancel_error_message[MAX_MESSAGES];
    fractional_trade_correction_message_t fractional_trade_correction_message[MAX_MESSAGES];
    fractional_as_of_trade_message_t fractional_as_of_trade_message[MAX_MESSAGES];
    administrative_message_t administrative_message[MAX_MESSAGES];
    general_administrative_message_t general_administrative_message[MAX_MESSAGES];
    cross_sro_trading_action_message_t cross_sro_trading_action_message[MAX_MESSAGES];
    market_center_trading_action_message_t market_center_trading_action_message[MAX_MESSAGES];
    issue_symbol_directory_message_t issue_symbol_directory_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    limit_up_limit_down_price_band_message_t limit_up_limit_down_price_band_message[MAX_MESSAGES];
    market_wide_circuit_breaker_decline_level_message_t market_wide_circuit_breaker_decline_level_message[MAX_MESSAGES];
    market_wide_circuit_breaker_status_message_t market_wide_circuit_breaker_status_message[MAX_MESSAGES];
    auction_collar_message_t auction_collar_message[MAX_MESSAGES];
    closing_trade_summary_report_message_t closing_trade_summary_report_message[MAX_MESSAGES];
    total_consolidated_volume_message_t total_consolidated_volume_message[MAX_MESSAGES];
    total_consolidated_and_market_center_volume_message_t total_consolidated_and_market_center_volume_message[MAX_MESSAGES];
    control_message_t control_message[MAX_MESSAGES];
    start_of_day_message_t start_of_day_message[MAX_MESSAGES];
    end_of_day_message_t end_of_day_message[MAX_MESSAGES];
    market_session_open_message_t market_session_open_message[MAX_MESSAGES];
    market_session_close_message_t market_session_close_message[MAX_MESSAGES];
    end_of_transmissions_message_t end_of_transmissions_message[MAX_MESSAGES];
    end_of_trade_reporting_message_t end_of_trade_reporting_message[MAX_MESSAGES];
    end_of_consolidated_last_sale_eligibility_message_t end_of_consolidated_last_sale_eligibility_message[MAX_MESSAGES];
}

parser NasdaqUtdfOutputParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.udp_packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_category) {
            8w0x54: parse_trade_message;
            8w0x41: parse_administrative_message;
            8w0x56: parse_total_consolidated_volume_message;
            8w0x43: parse_control_message;
            default: accept;
        }
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        transition select(hdr.trade_message.last.trade_message_type) {
            8w0x41: parse_trade_report_message_shortform_message;
            8w0x57: parse_trade_report_message_longform_message;
            8w0x5a: parse_trade_cancel_error_message;
            8w0x59: parse_trade_correction_message;
            8w0x48: parse_prior_day_as_of_trade_message;
            8w0x4d: parse_fractional_trade_report_message_shortform_message;
            8w0x4e: parse_fractional_trade_report_message_longform_message;
            8w0x4f: parse_fractional_trade_cancel_error_message;
            8w0x50: parse_fractional_trade_correction_message;
            8w0x51: parse_fractional_as_of_trade_message;
            default: accept;
        }
    }

    state parse_trade_report_message_shortform_message {
        packet.extract(hdr.trade_report_message_shortform_message.next);
        transition parse_message;
    }

    state parse_trade_report_message_longform_message {
        packet.extract(hdr.trade_report_message_longform_message.next);
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

    state parse_prior_day_as_of_trade_message {
        packet.extract(hdr.prior_day_as_of_trade_message.next);
        transition parse_message;
    }

    state parse_fractional_trade_report_message_shortform_message {
        packet.extract(hdr.fractional_trade_report_message_shortform_message.next);
        transition parse_message;
    }

    state parse_fractional_trade_report_message_longform_message {
        packet.extract(hdr.fractional_trade_report_message_longform_message.next);
        transition parse_message;
    }

    state parse_fractional_trade_cancel_error_message {
        packet.extract(hdr.fractional_trade_cancel_error_message.next);
        transition parse_message;
    }

    state parse_fractional_trade_correction_message {
        packet.extract(hdr.fractional_trade_correction_message.next);
        transition parse_message;
    }

    state parse_fractional_as_of_trade_message {
        packet.extract(hdr.fractional_as_of_trade_message.next);
        transition parse_message;
    }

    state parse_administrative_message {
        packet.extract(hdr.administrative_message.next);
        transition select(hdr.administrative_message.last.administrative_message_type) {
            8w0x41: parse_general_administrative_message;
            8w0x48: parse_cross_sro_trading_action_message;
            8w0x4b: parse_market_center_trading_action_message;
            8w0x42: parse_issue_symbol_directory_message;
            8w0x56: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x50: parse_limit_up_limit_down_price_band_message;
            8w0x43: parse_market_wide_circuit_breaker_decline_level_message;
            8w0x44: parse_market_wide_circuit_breaker_status_message;
            8w0x45: parse_auction_collar_message;
            8w0x55: parse_closing_trade_summary_report_message;
            default: accept;
        }
    }

    state parse_general_administrative_message {
        packet.extract(hdr.general_administrative_message.next);
        transition parse_message;
    }

    state parse_cross_sro_trading_action_message {
        packet.extract(hdr.cross_sro_trading_action_message.next);
        transition parse_message;
    }

    state parse_market_center_trading_action_message {
        packet.extract(hdr.market_center_trading_action_message.next);
        transition parse_message;
    }

    state parse_issue_symbol_directory_message {
        packet.extract(hdr.issue_symbol_directory_message.next);
        transition parse_message;
    }

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message.next);
        transition parse_message;
    }

    state parse_limit_up_limit_down_price_band_message {
        packet.extract(hdr.limit_up_limit_down_price_band_message.next);
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

    state parse_auction_collar_message {
        packet.extract(hdr.auction_collar_message.next);
        transition parse_message;
    }

    state parse_closing_trade_summary_report_message {
        packet.extract(hdr.closing_trade_summary_report_message.next);
        transition parse_message;
    }

    state parse_total_consolidated_volume_message {
        packet.extract(hdr.total_consolidated_volume_message.next);
        transition select(hdr.total_consolidated_volume_message.last.total_consolidated_volume_message_type) {
            8w0x56: parse_total_consolidated_and_market_center_volume_message;
            default: accept;
        }
    }

    state parse_total_consolidated_and_market_center_volume_message {
        packet.extract(hdr.total_consolidated_and_market_center_volume_message.next);
        transition parse_message;
    }

    state parse_control_message {
        packet.extract(hdr.control_message.next);
        transition select(hdr.control_message.last.control_message_type) {
            8w0x49: parse_start_of_day_message;
            8w0x4a: parse_end_of_day_message;
            8w0x4f: parse_market_session_open_message;
            8w0x43: parse_market_session_close_message;
            8w0x5a: parse_end_of_transmissions_message;
            8w0x58: parse_end_of_trade_reporting_message;
            8w0x53: parse_end_of_consolidated_last_sale_eligibility_message;
            default: accept;
        }
    }

    state parse_start_of_day_message {
        packet.extract(hdr.start_of_day_message.next);
        transition parse_message;
    }

    state parse_end_of_day_message {
        packet.extract(hdr.end_of_day_message.next);
        transition parse_message;
    }

    state parse_market_session_open_message {
        packet.extract(hdr.market_session_open_message.next);
        transition parse_message;
    }

    state parse_market_session_close_message {
        packet.extract(hdr.market_session_close_message.next);
        transition parse_message;
    }

    state parse_end_of_transmissions_message {
        packet.extract(hdr.end_of_transmissions_message.next);
        transition parse_message;
    }

    state parse_end_of_trade_reporting_message {
        packet.extract(hdr.end_of_trade_reporting_message.next);
        transition parse_message;
    }

    state parse_end_of_consolidated_last_sale_eligibility_message {
        packet.extract(hdr.end_of_consolidated_last_sale_eligibility_message.next);
        transition parse_message;
    }

}

control NasdaqUtdfOutputVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtdfOutputIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
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
        packet.emit(hdr.udp_packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_report_message_shortform_message);
        packet.emit(hdr.trade_report_message_longform_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.prior_day_as_of_trade_message);
        packet.emit(hdr.fractional_trade_report_message_shortform_message);
        packet.emit(hdr.fractional_trade_report_message_longform_message);
        packet.emit(hdr.fractional_trade_cancel_error_message);
        packet.emit(hdr.fractional_trade_correction_message);
        packet.emit(hdr.fractional_as_of_trade_message);
        packet.emit(hdr.administrative_message);
        packet.emit(hdr.general_administrative_message);
        packet.emit(hdr.cross_sro_trading_action_message);
        packet.emit(hdr.market_center_trading_action_message);
        packet.emit(hdr.issue_symbol_directory_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.limit_up_limit_down_price_band_message);
        packet.emit(hdr.market_wide_circuit_breaker_decline_level_message);
        packet.emit(hdr.market_wide_circuit_breaker_status_message);
        packet.emit(hdr.auction_collar_message);
        packet.emit(hdr.closing_trade_summary_report_message);
        packet.emit(hdr.total_consolidated_volume_message);
        packet.emit(hdr.total_consolidated_and_market_center_volume_message);
        packet.emit(hdr.control_message);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.market_session_open_message);
        packet.emit(hdr.market_session_close_message);
        packet.emit(hdr.end_of_transmissions_message);
        packet.emit(hdr.end_of_trade_reporting_message);
        packet.emit(hdr.end_of_consolidated_last_sale_eligibility_message);
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
