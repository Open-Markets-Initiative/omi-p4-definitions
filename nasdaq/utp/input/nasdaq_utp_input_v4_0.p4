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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> packet_type;
}

header message_header_t {
    bit<8> version;
    bit<8> message_category;
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
    bit<16> ol_price_short_2;
    bit<16> ol_size;
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
    bit<64> ol_price_long_8;
    bit<16> ol_size;
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
    bit<16> ol_price_short_2;
    bit<16> ol_size;
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
    bit<64> ol_price_long_8;
    bit<16> ol_size;
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
    bit<64> ol_price_long_8;
    bit<16> ol_size;
    bit<32> mpid;
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
    bit<32> mpid;
    bit<64> ol_price_long_8;
    bit<16> ol_size;
    bit<32> mpid;
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

header general_administrative_message_t {
    bit<16> orig;
    bit<64> timestamp_1;
    bit<64> feed_sequence;
    bit<64> part_token;
    bit<16> text_len;
    bit<0> text;
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

header return_general_administrative_message_t {
    bit<16> orig;
    bit<64> sip_time;
    bit<16> text_len;
    bit<0> text;
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

header debug_packet_t {
    bit<0> text;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

struct metadata_t {
}

struct headers_t {
    tcp_packet_header_t tcp_packet_header;
    message_header_t message_header[MAX_MESSAGES];
    protected_exchange_quote_message_shortform_message_t protected_exchange_quote_message_shortform_message[MAX_MESSAGES];
    protected_exchange_quote_message_longform_message_t protected_exchange_quote_message_longform_message[MAX_MESSAGES];
    exchange_odd_lot_quote_message_short_form_message_t exchange_odd_lot_quote_message_short_form_message[MAX_MESSAGES];
    exchange_odd_lot_quote_message_long_form_message_t exchange_odd_lot_quote_message_long_form_message[MAX_MESSAGES];
    exchange_combined_quote_message_short_form_message_t exchange_combined_quote_message_short_form_message[MAX_MESSAGES];
    exchange_combined_quote_message_long_form_message_t exchange_combined_quote_message_long_form_message[MAX_MESSAGES];
    finra_protected_quote_message_with_bbo_info_message_t finra_protected_quote_message_with_bbo_info_message[MAX_MESSAGES];
    finra_protected_quote_message_without_bbo_info_message_t finra_protected_quote_message_without_bbo_info_message[MAX_MESSAGES];
    finra_adf_odd_lot_quotation_message_t finra_adf_odd_lot_quotation_message[MAX_MESSAGES];
    finra_adf_combined_quote_message_with_bbo_t finra_adf_combined_quote_message_with_bbo[MAX_MESSAGES];
    regular_trade_report_message_t regular_trade_report_message[MAX_MESSAGES];
    trade_cancel_error_message_t trade_cancel_error_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    as_of_trade_report_message_t as_of_trade_report_message[MAX_MESSAGES];
    fractional_regular_trade_report_message_t fractional_regular_trade_report_message[MAX_MESSAGES];
    fractional_trade_cancel_error_message_t fractional_trade_cancel_error_message[MAX_MESSAGES];
    fractional_trade_correction_message_t fractional_trade_correction_message[MAX_MESSAGES];
    fractional_as_of_trade_report_message_t fractional_as_of_trade_report_message[MAX_MESSAGES];
    general_administrative_message_t general_administrative_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    market_center_trading_action_message_t market_center_trading_action_message[MAX_MESSAGES];
    market_center_mass_trading_action_message_t market_center_mass_trading_action_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    opening_reference_midpoint_price_message_t opening_reference_midpoint_price_message[MAX_MESSAGES];
    t_1_adjusted_closing_price_message_t t_1_adjusted_closing_price_message[MAX_MESSAGES];
    market_open_message_t market_open_message[MAX_MESSAGES];
    market_closed_message_t market_closed_message[MAX_MESSAGES];
    auction_collar_message_t auction_collar_message[MAX_MESSAGES];
    sequence_inquiry_message_t sequence_inquiry_message[MAX_MESSAGES];
    symbol_state_inquiry_message_t symbol_state_inquiry_message[MAX_MESSAGES];
    end_of_participant_reporting_message_t end_of_participant_reporting_message[MAX_MESSAGES];
    return_general_administrative_message_t return_general_administrative_message[MAX_MESSAGES];
    return_market_center_trading_action_acknowledgement_message_t return_market_center_trading_action_acknowledgement_message[MAX_MESSAGES];
    return_market_open_message_t return_market_open_message[MAX_MESSAGES];
    return_market_closed_message_t return_market_closed_message[MAX_MESSAGES];
    reject_message_t reject_message[MAX_MESSAGES];
    sequence_acknowledgement_message_t sequence_acknowledgement_message[MAX_MESSAGES];
    participant_input_warning_message_t participant_input_warning_message[MAX_MESSAGES];
    start_of_day_message_t start_of_day_message[MAX_MESSAGES];
    end_of_day_message_t end_of_day_message[MAX_MESSAGES];
    sequence_inquiry_response_message_t sequence_inquiry_response_message[MAX_MESSAGES];
    symbol_state_inquiry_response_message_t symbol_state_inquiry_response_message[MAX_MESSAGES];
    debug_packet_t debug_packet[MAX_MESSAGES];
    login_request_packet_t login_request_packet[MAX_MESSAGES];
    login_accepted_packet_t login_accepted_packet[MAX_MESSAGES];
    login_rejected_packet_t login_rejected_packet[MAX_MESSAGES];
}

parser NasdaqUtpInputParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.tcp_packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message_header.next);
        transition select(hdr.message_header.last.message_category) {
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
        packet.extract(hdr.inbound_quote_messages_message.next);
        transition parse_message;
    }

    state parse_inbound_trade_messages_message {
        packet.extract(hdr.inbound_trade_messages_message.next);
        transition parse_message;
    }

    state parse_inbound_administrative_messages_message {
        packet.extract(hdr.inbound_administrative_messages_message.next);
        transition parse_message;
    }

    state parse_inbound_control_messages_message {
        packet.extract(hdr.inbound_control_messages_message.next);
        transition parse_message;
    }

    state parse_return_administrative_messages_message {
        packet.extract(hdr.return_administrative_messages_message.next);
        transition parse_message;
    }

    state parse_return_control_messages_message {
        packet.extract(hdr.return_control_messages_message.next);
        transition parse_message;
    }

}

control NasdaqUtpInputVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpInputIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NasdaqUtpInputEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqUtpInputComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpInputDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.tcp_packet_header);
        packet.emit(hdr.message_header);
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
        packet.emit(hdr.regular_trade_report_message);
        packet.emit(hdr.trade_cancel_error_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.as_of_trade_report_message);
        packet.emit(hdr.fractional_regular_trade_report_message);
        packet.emit(hdr.fractional_trade_cancel_error_message);
        packet.emit(hdr.fractional_trade_correction_message);
        packet.emit(hdr.fractional_as_of_trade_report_message);
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
        packet.emit(hdr.sequence_inquiry_message);
        packet.emit(hdr.symbol_state_inquiry_message);
        packet.emit(hdr.end_of_participant_reporting_message);
        packet.emit(hdr.return_general_administrative_message);
        packet.emit(hdr.return_market_center_trading_action_acknowledgement_message);
        packet.emit(hdr.return_market_open_message);
        packet.emit(hdr.return_market_closed_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.sequence_acknowledgement_message);
        packet.emit(hdr.participant_input_warning_message);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.sequence_inquiry_response_message);
        packet.emit(hdr.symbol_state_inquiry_response_message);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
    }
}

V1Switch(
    NasdaqUtpInputParser(),
    NasdaqUtpInputVerifyChecksum(),
    NasdaqUtpInputIngress(),
    NasdaqUtpInputEgress(),
    NasdaqUtpInputComputeChecksum(),
    NasdaqUtpInputDeparser()
) main;
