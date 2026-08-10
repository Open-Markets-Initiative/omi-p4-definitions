// P4_16 (v1model) definition for: Nasdaq Uqdf Output Utp v1.5
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
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

header quote_t {
    bit<8> quote_message_type;
}

header quote_short_form_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<40> symbol_short;
    bit<16> bid_price_short;
    bit<16> bid_size_short;
    bit<16> ask_price_short;
    bit<16> ask_size_short;
    bit<8> quote_condition;
    bit<8> sip_generated_update;
    bit<8> luld_bbo_indicator;
    bit<8> retail_interest_indicator;
    bit<8> nbbo_appendage_indicator;
    bit<8> luld_national_bbo_indicator;
    bit<8> nbbo_quote_condition;
    bit<8> national_best_bid_market_center;
    bit<16> national_best_bid_price_short;
    bit<16> national_best_bid_size_short;
    bit<8> national_best_ask_market_center;
    bit<16> national_best_ask_price_short;
    bit<16> national_best_ask_size_short;
    bit<8> nbbo_quote_condition;
    bit<8> best_bid_market_center;
    bit<64> best_bid_price;
    bit<32> best_bid_size;
    bit<8> best_ask_market_center;
    bit<64> best_ask_price;
    bit<32> best_ask_size;
}

header quote_long_form_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<88> symbol;
    bit<64> bid_price;
    bit<32> bid_size;
    bit<64> ask_price;
    bit<32> ask_size;
    bit<8> quote_condition;
    bit<8> sip_generated_update;
    bit<8> luld_bbo_indicator;
    bit<8> retail_interest_indicator;
    bit<8> nbbo_appendage_indicator;
    bit<8> luld_national_bbo_indicator;
    bit<8> finra_adf_mpid_appendage_indicator;
    bit<8> nbbo_quote_condition;
    bit<8> national_best_bid_market_center;
    bit<16> national_best_bid_price_short;
    bit<16> national_best_bid_size_short;
    bit<8> national_best_ask_market_center;
    bit<16> national_best_ask_price_short;
    bit<16> national_best_ask_size_short;
    bit<8> nbbo_quote_condition;
    bit<8> best_bid_market_center;
    bit<64> best_bid_price;
    bit<32> best_bid_size;
    bit<8> best_ask_market_center;
    bit<64> best_ask_price;
    bit<32> best_ask_size;
    bit<32> bid_adf_mpid;
    bit<32> ask_adf_mpid;
}

header finra_adf_market_participant_quotation_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<64> finra_timestamp;
    bit<88> symbol;
    bit<64> bid_price;
    bit<32> bid_size;
    bit<64> ask_price;
    bit<32> ask_size;
    bit<8> quote_condition;
    bit<32> finra_market_participant;
}

header administrative_t {
    bit<8> administrative_message_type;
}

header general_administrative_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<16> text_length;
    bit<0> text;
}

header cross_sro_trading_action_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol;
    bit<8> trading_action_code;
    bit<32> trading_action_sequence_number;
    bit<64> action_timestamp;
    bit<48> trading_action_reason;
}

header issue_symbol_directory_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol;
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
    bit<88> symbol;
    bit<8> reg_sho_action;
}

header limit_up_limit_down_price_band_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol;
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
    bit<88> symbol;
    bit<32> trading_action_sequence_number;
    bit<64> collar_reference_price;
    bit<64> collar_up_price;
    bit<64> collar_down_price;
    bit<8> collar_extension_indicator;
}

header session_close_recap_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
    bit<88> symbol;
    bit<8> national_best_bid_market_center;
    bit<64> national_best_bid_price;
    bit<64> national_best_bid_size;
    bit<8> national_best_ask_market_center;
    bit<64> national_best_ask_price;
    bit<64> national_best_ask_size;
    bit<8> special_condition;
    bit<16> number_of_market_center_attachments;
    bit<8> market_center_identifier;
    bit<64> market_center_bid_price;
    bit<64> market_center_bid_size;
    bit<64> market_center_ask_price;
    bit<64> market_center_ask_size;
}

header control__t {
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

header quote_wipe_out_message_t {
    bit<8> market_center_originator_id;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> participant_timestamp;
    bit<64> participant_token;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    quote_t quote;
    quote_short_form_message_t quote_short_form_message;
    quote_long_form_message_t quote_long_form_message;
    finra_adf_market_participant_quotation_message_t finra_adf_market_participant_quotation_message;
    administrative_t administrative;
    general_administrative_message_t general_administrative_message;
    cross_sro_trading_action_message_t cross_sro_trading_action_message;
    issue_symbol_directory_message_t issue_symbol_directory_message;
    regulation_sho_short_sale_price_test_restricted_indicator_message_t regulation_sho_short_sale_price_test_restricted_indicator_message;
    limit_up_limit_down_price_band_message_t limit_up_limit_down_price_band_message;
    market_wide_circuit_breaker_decline_level_message_t market_wide_circuit_breaker_decline_level_message;
    market_wide_circuit_breaker_status_message_t market_wide_circuit_breaker_status_message;
    auction_collar_message_t auction_collar_message;
    session_close_recap_message_t session_close_recap_message;
    control__t control_;
    start_of_day_message_t start_of_day_message;
    end_of_day_message_t end_of_day_message;
    market_session_open_message_t market_session_open_message;
    market_session_close_message_t market_session_close_message;
    end_of_transmissions_message_t end_of_transmissions_message;
    quote_wipe_out_message_t quote_wipe_out_message;
}

parser NasdaqUqdfOutputParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_category) {
            8w0x51: parse_quote;
            8w0x41: parse_administrative;
            8w0x43: parse_control;
            default: accept;
        }
    }

    state parse_quote {
        packet.extract(hdr.quote);
        transition select(hdr.quote.quote_message_type) {
            8w0x45: parse_quote_short_form_message;
            8w0x46: parse_quote_long_form_message;
            8w0x4d: parse_finra_adf_market_participant_quotation_message;
            default: accept;
        }
    }

    state parse_quote_short_form_message {
        packet.extract(hdr.quote_short_form_message);
        transition accept;
    }

    state parse_quote_long_form_message {
        packet.extract(hdr.quote_long_form_message);
        transition accept;
    }

    state parse_finra_adf_market_participant_quotation_message {
        packet.extract(hdr.finra_adf_market_participant_quotation_message);
        transition accept;
    }

    state parse_administrative {
        packet.extract(hdr.administrative);
        transition select(hdr.administrative.administrative_message_type) {
            8w0x41: parse_general_administrative_message;
            8w0x48: parse_cross_sro_trading_action_message;
            8w0x42: parse_issue_symbol_directory_message;
            8w0x56: parse_regulation_sho_short_sale_price_test_restricted_indicator_message;
            8w0x50: parse_limit_up_limit_down_price_band_message;
            8w0x43: parse_market_wide_circuit_breaker_decline_level_message;
            8w0x44: parse_market_wide_circuit_breaker_status_message;
            8w0x45: parse_auction_collar_message;
            8w0x52: parse_session_close_recap_message;
            default: accept;
        }
    }

    state parse_general_administrative_message {
        packet.extract(hdr.general_administrative_message);
        transition accept;
    }

    state parse_cross_sro_trading_action_message {
        packet.extract(hdr.cross_sro_trading_action_message);
        transition accept;
    }

    state parse_issue_symbol_directory_message {
        packet.extract(hdr.issue_symbol_directory_message);
        transition accept;
    }

    state parse_regulation_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.regulation_sho_short_sale_price_test_restricted_indicator_message);
        transition accept;
    }

    state parse_limit_up_limit_down_price_band_message {
        packet.extract(hdr.limit_up_limit_down_price_band_message);
        transition accept;
    }

    state parse_market_wide_circuit_breaker_decline_level_message {
        packet.extract(hdr.market_wide_circuit_breaker_decline_level_message);
        transition accept;
    }

    state parse_market_wide_circuit_breaker_status_message {
        packet.extract(hdr.market_wide_circuit_breaker_status_message);
        transition accept;
    }

    state parse_auction_collar_message {
        packet.extract(hdr.auction_collar_message);
        transition accept;
    }

    state parse_session_close_recap_message {
        packet.extract(hdr.session_close_recap_message);
        transition accept;
    }

    state parse_control {
        packet.extract(hdr.control_);
        transition select(hdr.control_.control_message_type) {
            8w0x49: parse_start_of_day_message;
            8w0x4a: parse_end_of_day_message;
            8w0x4f: parse_market_session_open_message;
            8w0x43: parse_market_session_close_message;
            8w0x5a: parse_end_of_transmissions_message;
            8w0x50: parse_quote_wipe_out_message;
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

    state parse_market_session_open_message {
        packet.extract(hdr.market_session_open_message);
        transition accept;
    }

    state parse_market_session_close_message {
        packet.extract(hdr.market_session_close_message);
        transition accept;
    }

    state parse_end_of_transmissions_message {
        packet.extract(hdr.end_of_transmissions_message);
        transition accept;
    }

    state parse_quote_wipe_out_message {
        packet.extract(hdr.quote_wipe_out_message);
        transition accept;
    }

}

control NasdaqUqdfOutputVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUqdfOutputIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NasdaqUqdfOutputEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqUqdfOutputComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUqdfOutputDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.quote);
        packet.emit(hdr.quote_short_form_message);
        packet.emit(hdr.quote_long_form_message);
        packet.emit(hdr.finra_adf_market_participant_quotation_message);
        packet.emit(hdr.administrative);
        packet.emit(hdr.general_administrative_message);
        packet.emit(hdr.cross_sro_trading_action_message);
        packet.emit(hdr.issue_symbol_directory_message);
        packet.emit(hdr.regulation_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.limit_up_limit_down_price_band_message);
        packet.emit(hdr.market_wide_circuit_breaker_decline_level_message);
        packet.emit(hdr.market_wide_circuit_breaker_status_message);
        packet.emit(hdr.auction_collar_message);
        packet.emit(hdr.session_close_recap_message);
        packet.emit(hdr.control_);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.market_session_open_message);
        packet.emit(hdr.market_session_close_message);
        packet.emit(hdr.end_of_transmissions_message);
        packet.emit(hdr.quote_wipe_out_message);
    }
}

V1Switch(
    NasdaqUqdfOutputParser(),
    NasdaqUqdfOutputVerifyChecksum(),
    NasdaqUqdfOutputIngress(),
    NasdaqUqdfOutputEgress(),
    NasdaqUqdfOutputComputeChecksum(),
    NasdaqUqdfOutputDeparser()
) main;
