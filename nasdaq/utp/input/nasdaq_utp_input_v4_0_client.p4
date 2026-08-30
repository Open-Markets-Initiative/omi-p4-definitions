// P4_16 (v1model) definition for: Nasdaq Utp Input Utp v4.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: 
//   Encoding: Utp
//   Version: 4.0
//   Date: 06/01/2026
//   Specification: UtpBinaryInputSpec.pdf
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

header client_tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header unsequenced_data_packet_t {
    bit<8> version;
    bit<8> message_category;
}

header inbound_quote_messages_message_t {
    bit<8> inbound_quote_messages_message_type;
}

header protected_exchange_quote_message_shortform_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<40> symbol_byte_5;
    bit<16> bid_short_2;
    bit<16> bid_size_short_2;
    bit<16> ask_short_2;
    bit<16> ask_size_short_2;
    bit<8> cond;
    bit<8> rii;
}

header protected_exchange_quote_message_longform_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<64> bid_long_8;
    bit<32> bid_size_int_4;
    bit<64> ask_long_8;
    bit<32> ask_size_int_4;
    bit<8> cond;
    bit<8> rii;
}

header exchange_odd_lot_quote_message_short_form_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<40> symbol_byte_5;
    bit<16> ol_bid_level_count;
    bit<16> ol_ask_level_count;
    bit<16> ol_price_short_2;
    bit<16> ol_size;
    bit<16> ol_price_short_2_2;
    bit<16> ol_size_2;
}

header exchange_odd_lot_quote_message_long_form_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<16> ol_bid_level_count;
    bit<16> ol_ask_level_count;
    bit<64> ol_price_long_8;
    bit<16> ol_size;
    bit<64> ol_price_long_8_2;
    bit<16> ol_size_2;
}

header exchange_combined_quote_message_short_form_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<40> symbol_byte_5;
    bit<16> bid_short_2;
    bit<16> bid_size_short_2;
    bit<16> ask_short_2;
    bit<16> ask_size_short_2;
    bit<8> cond;
    bit<8> rii;
    bit<16> ol_bid_level_count;
    bit<16> ol_ask_level_count;
    bit<16> ol_price_short_2;
    bit<16> ol_size;
    bit<16> ol_price_short_2_2;
    bit<16> ol_size_2;
}

header exchange_combined_quote_message_long_form_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<64> bid_long_8;
    bit<32> bid_size_int_4;
    bit<64> ask_long_8;
    bit<32> ask_size_int_4;
    bit<8> cond;
    bit<8> rii;
    bit<16> ol_bid_level_count;
    bit<16> ol_ask_level_count;
    bit<64> ol_price_long_8;
    bit<16> ol_size;
    bit<64> ol_price_long_8_2;
    bit<16> ol_size_2;
}

header finra_protected_quote_message_with_bbo_info_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<64> bid_long_8;
    bit<32> bid_size_int_4;
    bit<64> ask_long_8;
    bit<32> ask_size_int_4;
    bit<8> cond;
    bit<32> mpid;
    bit<64> bbo_bid;
    bit<32> bbo_bid_size;
    bit<32> bbo_bid_mpid;
    bit<64> bbo_ask;
    bit<32> bbo_ask_size;
    bit<32> bbo_ask_mpid;
    bit<8> bbo_cond;
}

header finra_protected_quote_message_without_bbo_info_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<64> bid_long_8;
    bit<32> bid_size_int_4;
    bit<64> ask_long_8;
    bit<32> ask_size_int_4;
    bit<8> cond;
    bit<32> mpid;
    bit<8> bbo_indicator;
}

header finra_adf_odd_lot_quotation_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<16> ol_bid_level_count;
    bit<16> ol_ask_level_count;
    bit<64> ol_price_long_8;
    bit<16> ol_size;
    bit<32> mpid;
    bit<64> ol_price_long_8_2;
    bit<16> ol_size_2;
    bit<32> mpid_2;
}

header finra_adf_combined_quote_message_with_bbo_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<64> bid_long_8;
    bit<32> bid_size_int_4;
    bit<64> ask_long_8;
    bit<32> ask_size_int_4;
    bit<8> cond;
    bit<32> mpid;
    bit<8> rii;
    bit<64> bbo_bid_price;
    bit<32> bbo_bid_size;
    bit<32> bbo_bid_mpid;
    bit<64> bbo_ask_price;
    bit<32> bbo_ask_size;
    bit<32> bbo_ask_mpid;
    bit<8> bbo_cond;
    bit<16> ol_bid_level_count;
    bit<16> ol_ask_level_count;
    bit<64> ol_price_long_8;
    bit<16> ol_size;
    bit<32> mpid_2;
    bit<64> ol_price_long_8_2;
    bit<16> ol_size_2;
    bit<32> mpid_3;
}

header inbound_trade_messages_message_t {
    bit<8> inbound_trade_messages_message_type;
}

header regular_trade_report_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<32> trade_id;
    bit<8> tt_exempt;
    bit<32> trcond;
    bit<16> ssday;
    bit<8> side;
    bit<64> price;
    bit<32> volume_int_4;
}

header trade_cancel_error_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<8> cancel_type;
    bit<32> orig_trade_id;
    bit<8> orig_tt_exempt;
    bit<32> orig_trcond;
    bit<16> orig_ssday;
    bit<8> orig_side;
    bit<64> orig_price;
    bit<32> orig_volume_int_4;
}

header trade_correction_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<8> orig_tt_exempt;
    bit<32> orig_trcond;
    bit<16> orig_ssday;
    bit<8> side;
    bit<64> orig_price;
    bit<32> orig_volume_int_4;
    bit<8> new_tt_exempt;
    bit<32> new_trcond;
    bit<16> new_ssday;
    bit<64> new_price;
    bit<32> new_volume_int_4;
}

header as_of_trade_report_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<32> trade_id;
    bit<8> tt_exempt;
    bit<32> trcond;
    bit<16> ssday;
    bit<8> side;
    bit<64> price;
    bit<32> volume_int_4;
    bit<64> trade_time;
    bit<8> reversal;
}

header fractional_regular_trade_report_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<32> trade_id;
    bit<8> tt_exempt;
    bit<32> trcond;
    bit<16> ssday;
    bit<8> side;
    bit<64> price;
    bit<64> volume_long_8;
}

header fractional_trade_cancel_error_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<8> cancel_type;
    bit<32> orig_trade_id;
    bit<8> orig_tt_exempt;
    bit<32> orig_trcond;
    bit<16> orig_ssday;
    bit<8> orig_side;
    bit<64> orig_price;
    bit<64> orig_volume_long_8;
}

header fractional_trade_correction_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<64> timestamp_2;
    bit<88> symbol_byte_11;
    bit<32> trade_id;
    bit<32> orig_trade_id;
    bit<8> orig_tt_exempt;
    bit<32> orig_trcond;
    bit<16> orig_ssday;
    bit<8> side;
    bit<64> orig_price;
    bit<64> orig_volume_long_8;
    bit<8> new_tt_exempt;
    bit<32> new_trcond;
    bit<16> new_ssday;
    bit<64> new_price;
    bit<64> new_volume_long_8;
}

header fractional_as_of_trade_report_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<32> trade_id;
    bit<8> tt_exempt;
    bit<32> trcond;
    bit<16> ssday;
    bit<8> side;
    bit<64> price;
    bit<64> volume_long_8;
    bit<64> trade_time;
    bit<8> reversal;
}

header inbound_administrative_messages_message_t {
    bit<8> inbound_administrative_messages_message_type;
}

header general_administrative_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<16> text_len;
}

header trading_action_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<8> action_;
    bit<32> action_sequence;
    bit<64> action_time;
    bit<48> reason;
}

header market_center_trading_action_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<8> action_;
    bit<64> action_time;
}

header market_center_mass_trading_action_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> first_security;
    bit<88> last_security;
    bit<8> action_;
    bit<64> action_time;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<8> action_;
}

header opening_reference_midpoint_price_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<64> price;
}

header t_1_adjusted_closing_price_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<64> price;
}

header market_open_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
}

header market_closed_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
}

header auction_collar_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
    bit<32> action_sequence;
    bit<64> collar_reference_price;
    bit<64> collar_up_price;
    bit<64> collar_down_price;
    bit<8> collar_extension;
}

header inbound_control_messages_message_t {
    bit<8> inbound_control_messages_message_type;
}

header sequence_inquiry_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
}

header symbol_state_inquiry_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<88> symbol_byte_11;
}

header end_of_participant_reporting_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
}

header return_administrative_messages_message_t {
    bit<8> return_administrative_messages_message_type;
}

header return_general_administrative_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<16> text_len;
}

header return_market_center_trading_action_acknowledgement_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<88> symbol_byte_11;
    bit<8> action_;
    bit<64> action_time;
}

header return_market_open_message_t {
    bit<16> orig;
    bit<64> sip_time;
}

header return_market_closed_message_t {
    bit<16> orig;
    bit<64> sip_time;
}

header reject_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<16> reject_code;
    bit<8> syntax_violation;
}

header sequence_acknowledgement_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<64> feed_sequence;
    bit<64> part_token;
}

header participant_input_warning_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<16> warning_code;
    bit<88> symbol_byte_11;
    bit<8> ol_attachmen_type;
    bit<16> ol_attachment_count;
}

header return_control_messages_message_t {
    bit<8> return_control_messages_message_type;
}

header start_of_day_message_t {
    bit<16> orig;
    bit<64> sip_time;
}

header end_of_day_message_t {
    bit<16> orig;
    bit<64> sip_time;
}

header sequence_inquiry_response_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<8> sip_state;
}

header symbol_state_inquiry_response_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<88> symbol_byte_11;
    bit<32> next_trade_id;
    bit<32> next_action_sequence;
    bit<8> symbol_state;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

struct metadata_t {
}

struct headers_t {
    client_tcp_packet_header_t client_tcp_packet_header;
    unsequenced_data_packet_t unsequenced_data_packet;
    inbound_quote_messages_message_t inbound_quote_messages_message;
    protected_exchange_quote_message_shortform_message_t protected_exchange_quote_message_shortform_message;
    protected_exchange_quote_message_longform_message_t protected_exchange_quote_message_longform_message;
    exchange_odd_lot_quote_message_short_form_message_t exchange_odd_lot_quote_message_short_form_message;
    exchange_odd_lot_quote_message_long_form_message_t exchange_odd_lot_quote_message_long_form_message;
    exchange_combined_quote_message_short_form_message_t exchange_combined_quote_message_short_form_message;
    exchange_combined_quote_message_long_form_message_t exchange_combined_quote_message_long_form_message;
    finra_protected_quote_message_with_bbo_info_message_t finra_protected_quote_message_with_bbo_info_message;
    finra_protected_quote_message_without_bbo_info_message_t finra_protected_quote_message_without_bbo_info_message;
    finra_adf_odd_lot_quotation_message_t finra_adf_odd_lot_quotation_message;
    finra_adf_combined_quote_message_with_bbo_t finra_adf_combined_quote_message_with_bbo;
    inbound_trade_messages_message_t inbound_trade_messages_message;
    regular_trade_report_message_t regular_trade_report_message;
    trade_cancel_error_message_t trade_cancel_error_message;
    trade_correction_message_t trade_correction_message;
    as_of_trade_report_message_t as_of_trade_report_message;
    fractional_regular_trade_report_message_t fractional_regular_trade_report_message;
    fractional_trade_cancel_error_message_t fractional_trade_cancel_error_message;
    fractional_trade_correction_message_t fractional_trade_correction_message;
    fractional_as_of_trade_report_message_t fractional_as_of_trade_report_message;
    inbound_administrative_messages_message_t inbound_administrative_messages_message;
    general_administrative_message_t general_administrative_message;
    trading_action_message_t trading_action_message;
    market_center_trading_action_message_t market_center_trading_action_message;
    market_center_mass_trading_action_message_t market_center_mass_trading_action_message;
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message;
    opening_reference_midpoint_price_message_t opening_reference_midpoint_price_message;
    t_1_adjusted_closing_price_message_t t_1_adjusted_closing_price_message;
    market_open_message_t market_open_message;
    market_closed_message_t market_closed_message;
    auction_collar_message_t auction_collar_message;
    inbound_control_messages_message_t inbound_control_messages_message;
    sequence_inquiry_message_t sequence_inquiry_message;
    symbol_state_inquiry_message_t symbol_state_inquiry_message;
    end_of_participant_reporting_message_t end_of_participant_reporting_message;
    return_administrative_messages_message_t return_administrative_messages_message;
    return_general_administrative_message_t return_general_administrative_message;
    return_market_center_trading_action_acknowledgement_message_t return_market_center_trading_action_acknowledgement_message;
    return_market_open_message_t return_market_open_message;
    return_market_closed_message_t return_market_closed_message;
    reject_message_t reject_message;
    sequence_acknowledgement_message_t sequence_acknowledgement_message;
    participant_input_warning_message_t participant_input_warning_message;
    return_control_messages_message_t return_control_messages_message;
    start_of_day_message_t start_of_day_message;
    end_of_day_message_t end_of_day_message;
    sequence_inquiry_response_message_t sequence_inquiry_response_message;
    symbol_state_inquiry_response_message_t symbol_state_inquiry_response_message;
    login_request_packet_t login_request_packet;
}

parser NasdaqUtpInputClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_tcp_packet_header);
        transition select(hdr.client_tcp_packet_header.client_packet_type) {
            8w0x55: parse_unsequenced_data_packet;
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            default: accept;
        }
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        transition select(hdr.unsequenced_data_packet.message_category) {
            8w0x51: parse_inbound_quote_messages_message;
            8w0x54: parse_inbound_trade_messages_message;
            8w0x41: parse_inbound_administrative_messages_message;
            8w0x43: parse_inbound_control_messages_message;
            8w0x61: parse_return_administrative_messages_message;
            8w0x63: parse_return_control_messages_message;
            default: accept;
        }
    }

    state parse_inbound_quote_messages_message {
        packet.extract(hdr.inbound_quote_messages_message);
        transition select(hdr.inbound_quote_messages_message.inbound_quote_messages_message_type) {
            8w0x51: parse_protected_exchange_quote_message_shortform_message;
            8w0x4c: parse_protected_exchange_quote_message_longform_message;
            8w0x4f: parse_exchange_odd_lot_quote_message_short_form_message;
            8w0x4a: parse_exchange_odd_lot_quote_message_long_form_message;
            8w0x50: parse_exchange_combined_quote_message_short_form_message;
            8w0x4b: parse_exchange_combined_quote_message_long_form_message;
            8w0x47: parse_finra_protected_quote_message_with_bbo_info_message;
            8w0x46: parse_finra_protected_quote_message_without_bbo_info_message;
            8w0x48: parse_finra_adf_odd_lot_quotation_message;
            8w0x52: parse_finra_adf_combined_quote_message_with_bbo;
            default: accept;
        }
    }

    state parse_protected_exchange_quote_message_shortform_message {
        packet.extract(hdr.protected_exchange_quote_message_shortform_message);
        transition accept;
    }

    state parse_protected_exchange_quote_message_longform_message {
        packet.extract(hdr.protected_exchange_quote_message_longform_message);
        transition accept;
    }

    state parse_exchange_odd_lot_quote_message_short_form_message {
        packet.extract(hdr.exchange_odd_lot_quote_message_short_form_message);
        transition accept;
    }

    state parse_exchange_odd_lot_quote_message_long_form_message {
        packet.extract(hdr.exchange_odd_lot_quote_message_long_form_message);
        transition accept;
    }

    state parse_exchange_combined_quote_message_short_form_message {
        packet.extract(hdr.exchange_combined_quote_message_short_form_message);
        transition accept;
    }

    state parse_exchange_combined_quote_message_long_form_message {
        packet.extract(hdr.exchange_combined_quote_message_long_form_message);
        transition accept;
    }

    state parse_finra_protected_quote_message_with_bbo_info_message {
        packet.extract(hdr.finra_protected_quote_message_with_bbo_info_message);
        transition accept;
    }

    state parse_finra_protected_quote_message_without_bbo_info_message {
        packet.extract(hdr.finra_protected_quote_message_without_bbo_info_message);
        transition accept;
    }

    state parse_finra_adf_odd_lot_quotation_message {
        packet.extract(hdr.finra_adf_odd_lot_quotation_message);
        transition accept;
    }

    state parse_finra_adf_combined_quote_message_with_bbo {
        packet.extract(hdr.finra_adf_combined_quote_message_with_bbo);
        transition accept;
    }

    state parse_inbound_trade_messages_message {
        packet.extract(hdr.inbound_trade_messages_message);
        transition select(hdr.inbound_trade_messages_message.inbound_trade_messages_message_type) {
            8w0x45: parse_regular_trade_report_message;
            8w0x49: parse_trade_cancel_error_message;
            8w0x4a: parse_trade_correction_message;
            8w0x48: parse_as_of_trade_report_message;
            8w0x4b: parse_fractional_regular_trade_report_message;
            8w0x4f: parse_fractional_trade_cancel_error_message;
            8w0x50: parse_fractional_trade_correction_message;
            8w0x51: parse_fractional_as_of_trade_report_message;
            default: accept;
        }
    }

    state parse_regular_trade_report_message {
        packet.extract(hdr.regular_trade_report_message);
        transition accept;
    }

    state parse_trade_cancel_error_message {
        packet.extract(hdr.trade_cancel_error_message);
        transition accept;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message);
        transition accept;
    }

    state parse_as_of_trade_report_message {
        packet.extract(hdr.as_of_trade_report_message);
        transition accept;
    }

    state parse_fractional_regular_trade_report_message {
        packet.extract(hdr.fractional_regular_trade_report_message);
        transition accept;
    }

    state parse_fractional_trade_cancel_error_message {
        packet.extract(hdr.fractional_trade_cancel_error_message);
        transition accept;
    }

    state parse_fractional_trade_correction_message {
        packet.extract(hdr.fractional_trade_correction_message);
        transition accept;
    }

    state parse_fractional_as_of_trade_report_message {
        packet.extract(hdr.fractional_as_of_trade_report_message);
        transition accept;
    }

    state parse_inbound_administrative_messages_message {
        packet.extract(hdr.inbound_administrative_messages_message);
        transition select(hdr.inbound_administrative_messages_message.inbound_administrative_messages_message_type) {
            8w0x41: parse_general_administrative_message;
            8w0x4f: parse_trading_action_message;
            8w0x4a: parse_market_center_trading_action_message;
            8w0x55: parse_market_center_mass_trading_action_message;
            8w0x56: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x4d: parse_opening_reference_midpoint_price_message;
            8w0x4e: parse_t_1_adjusted_closing_price_message;
            8w0x58: parse_market_open_message;
            8w0x59: parse_market_closed_message;
            8w0x45: parse_auction_collar_message;
            default: accept;
        }
    }

    state parse_general_administrative_message {
        packet.extract(hdr.general_administrative_message);
        transition accept;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message);
        transition accept;
    }

    state parse_market_center_trading_action_message {
        packet.extract(hdr.market_center_trading_action_message);
        transition accept;
    }

    state parse_market_center_mass_trading_action_message {
        packet.extract(hdr.market_center_mass_trading_action_message);
        transition accept;
    }

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        transition accept;
    }

    state parse_opening_reference_midpoint_price_message {
        packet.extract(hdr.opening_reference_midpoint_price_message);
        transition accept;
    }

    state parse_t_1_adjusted_closing_price_message {
        packet.extract(hdr.t_1_adjusted_closing_price_message);
        transition accept;
    }

    state parse_market_open_message {
        packet.extract(hdr.market_open_message);
        transition accept;
    }

    state parse_market_closed_message {
        packet.extract(hdr.market_closed_message);
        transition accept;
    }

    state parse_auction_collar_message {
        packet.extract(hdr.auction_collar_message);
        transition accept;
    }

    state parse_inbound_control_messages_message {
        packet.extract(hdr.inbound_control_messages_message);
        transition select(hdr.inbound_control_messages_message.inbound_control_messages_message_type) {
            8w0x43: parse_sequence_inquiry_message;
            8w0x53: parse_symbol_state_inquiry_message;
            8w0x47: parse_end_of_participant_reporting_message;
            default: accept;
        }
    }

    state parse_sequence_inquiry_message {
        packet.extract(hdr.sequence_inquiry_message);
        transition accept;
    }

    state parse_symbol_state_inquiry_message {
        packet.extract(hdr.symbol_state_inquiry_message);
        transition accept;
    }

    state parse_end_of_participant_reporting_message {
        packet.extract(hdr.end_of_participant_reporting_message);
        transition accept;
    }

    state parse_return_administrative_messages_message {
        packet.extract(hdr.return_administrative_messages_message);
        transition select(hdr.return_administrative_messages_message.return_administrative_messages_message_type) {
            8w0x41: parse_return_general_administrative_message;
            8w0x4a: parse_return_market_center_trading_action_acknowledgement_message;
            8w0x58: parse_return_market_open_message;
            8w0x59: parse_return_market_closed_message;
            8w0x52: parse_reject_message;
            8w0x4b: parse_sequence_acknowledgement_message;
            8w0x57: parse_participant_input_warning_message;
            default: accept;
        }
    }

    state parse_return_general_administrative_message {
        packet.extract(hdr.return_general_administrative_message);
        transition accept;
    }

    state parse_return_market_center_trading_action_acknowledgement_message {
        packet.extract(hdr.return_market_center_trading_action_acknowledgement_message);
        transition accept;
    }

    state parse_return_market_open_message {
        packet.extract(hdr.return_market_open_message);
        transition accept;
    }

    state parse_return_market_closed_message {
        packet.extract(hdr.return_market_closed_message);
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        transition accept;
    }

    state parse_sequence_acknowledgement_message {
        packet.extract(hdr.sequence_acknowledgement_message);
        transition accept;
    }

    state parse_participant_input_warning_message {
        packet.extract(hdr.participant_input_warning_message);
        transition accept;
    }

    state parse_return_control_messages_message {
        packet.extract(hdr.return_control_messages_message);
        transition select(hdr.return_control_messages_message.return_control_messages_message_type) {
            8w0x45: parse_start_of_day_message;
            8w0x46: parse_end_of_day_message;
            8w0x43: parse_sequence_inquiry_response_message;
            8w0x53: parse_symbol_state_inquiry_response_message;
            default: accept;
        }
    }

    state parse_start_of_day_message {
        packet.extract(hdr.start_of_day_message);
        transition accept;
    }

    state parse_end_of_day_message {
        packet.extract(hdr.end_of_day_message);
        transition accept;
    }

    state parse_sequence_inquiry_response_message {
        packet.extract(hdr.sequence_inquiry_response_message);
        transition accept;
    }

    state parse_symbol_state_inquiry_response_message {
        packet.extract(hdr.symbol_state_inquiry_response_message);
        transition accept;
    }

    state parse_debug_packet {
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        transition accept;
    }

}

control NasdaqUtpInputClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpInputClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NasdaqUtpInputClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqUtpInputClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpInputClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_tcp_packet_header);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.inbound_quote_messages_message);
        packet.emit(hdr.protected_exchange_quote_message_shortform_message);
        packet.emit(hdr.protected_exchange_quote_message_longform_message);
        packet.emit(hdr.exchange_odd_lot_quote_message_short_form_message);
        packet.emit(hdr.exchange_odd_lot_quote_message_long_form_message);
        packet.emit(hdr.exchange_combined_quote_message_short_form_message);
        packet.emit(hdr.exchange_combined_quote_message_long_form_message);
        packet.emit(hdr.finra_protected_quote_message_with_bbo_info_message);
        packet.emit(hdr.finra_protected_quote_message_without_bbo_info_message);
        packet.emit(hdr.finra_adf_odd_lot_quotation_message);
        packet.emit(hdr.finra_adf_combined_quote_message_with_bbo);
        packet.emit(hdr.inbound_trade_messages_message);
        packet.emit(hdr.regular_trade_report_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.as_of_trade_report_message);
        packet.emit(hdr.fractional_regular_trade_report_message);
        packet.emit(hdr.fractional_trade_cancel_error_message);
        packet.emit(hdr.fractional_trade_correction_message);
        packet.emit(hdr.fractional_as_of_trade_report_message);
        packet.emit(hdr.inbound_administrative_messages_message);
        packet.emit(hdr.general_administrative_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.market_center_trading_action_message);
        packet.emit(hdr.market_center_mass_trading_action_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.opening_reference_midpoint_price_message);
        packet.emit(hdr.t_1_adjusted_closing_price_message);
        packet.emit(hdr.market_open_message);
        packet.emit(hdr.market_closed_message);
        packet.emit(hdr.auction_collar_message);
        packet.emit(hdr.inbound_control_messages_message);
        packet.emit(hdr.sequence_inquiry_message);
        packet.emit(hdr.symbol_state_inquiry_message);
        packet.emit(hdr.end_of_participant_reporting_message);
        packet.emit(hdr.return_administrative_messages_message);
        packet.emit(hdr.return_general_administrative_message);
        packet.emit(hdr.return_market_center_trading_action_acknowledgement_message);
        packet.emit(hdr.return_market_open_message);
        packet.emit(hdr.return_market_closed_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.sequence_acknowledgement_message);
        packet.emit(hdr.participant_input_warning_message);
        packet.emit(hdr.return_control_messages_message);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.sequence_inquiry_response_message);
        packet.emit(hdr.symbol_state_inquiry_response_message);
        packet.emit(hdr.login_request_packet);
    }
}

V1Switch(
    NasdaqUtpInputClientParser(),
    NasdaqUtpInputClientVerifyChecksum(),
    NasdaqUtpInputClientIngress(),
    NasdaqUtpInputClientEgress(),
    NasdaqUtpInputClientComputeChecksum(),
    NasdaqUtpInputClientDeparser()
) main;
