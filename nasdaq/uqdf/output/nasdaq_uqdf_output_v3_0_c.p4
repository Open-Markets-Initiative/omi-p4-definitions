// P4_16 (v1model) definition for: Nasdaq Uqdf Output Utp v3.0.c
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

header quote_message_t {
    bit<8> quote_message_type;
}

header utp_quote_shortform_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<40> symbol_short;
    bit<16> bid_price_short;
    bit<16> bid_size_short;
    bit<16> ask_price_short;
    bit<16> ask_size_short;
    bit<8> quote_condition;
    bit<8> sip_generated_update_flag;
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
    bit<8> nbbo_quote_condition_2;
    bit<8> national_best_bid_market_center_2;
    bit<64> national_best_bid_price_long;
    bit<32> national_best_bid_size_long;
    bit<8> national_best_ask_market_center_2;
    bit<64> national_best_ask_price_long;
    bit<32> national_best_ask_size_long;
}

header utp_quote_longform_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> bid_price_long;
    bit<32> bid_size_long;
    bit<64> ask_price_long;
    bit<32> ask_size_long;
    bit<8> quote_condition;
    bit<8> sip_generated_update_flag;
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
    bit<8> nbbo_quote_condition_2;
    bit<8> national_best_bid_market_center_2;
    bit<64> national_best_bid_price_long;
    bit<32> national_best_bid_size_long;
    bit<8> national_best_ask_market_center_2;
    bit<64> national_best_ask_price_long;
    bit<32> national_best_ask_size_long;
}

header finra_adf_market_participant_quotation_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> timestamp_2;
    bit<88> symbol_long;
    bit<64> bid_price_long;
    bit<32> bid_size_long;
    bit<64> ask_price_long;
    bit<32> ask_size_long;
    bit<8> quote_condition;
    bit<32> finra_market_participant;
}

header combined_quote_message_short_form_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<40> symbol_short;
    bit<16> protected_bid_price_short;
    bit<16> protected_bid_size_short;
    bit<16> protected_ask_price_short;
    bit<16> protected_ask_size_short;
    bit<8> quote_condition;
    bit<8> sip_generated_update_flag;
    bit<8> luld_bbo_indicator;
    bit<8> retail_interest_indicator;
    bit<8> nbbo_appendage_indicator;
    bit<8> luld_national_bbo_indicator;
    bit<8> bolo_appendage_indicator;
    bit<8> odd_lot_attachment_type;
    bit<16> odd_lot_attachment_count;
    bit<8> nbbo_quote_condition;
    bit<8> national_best_bid_market_center;
    bit<16> national_best_bid_price_short;
    bit<16> national_best_bid_size_short;
    bit<8> national_best_ask_market_center;
    bit<16> national_best_ask_price_short;
    bit<16> national_best_ask_size_short;
    bit<8> nbbo_quote_condition_2;
    bit<8> national_best_bid_market_center_2;
    bit<64> national_best_bid_price_long;
    bit<32> national_best_bid_size_long;
    bit<8> national_best_ask_market_center_2;
    bit<64> national_best_ask_price_long;
    bit<32> national_best_ask_size_long;
    bit<8> bolo_best_bid_market_center;
    bit<16> bolo_bid_price_short;
    bit<16> bolo_bid_size;
    bit<8> bolo_best_ask_market_center;
    bit<16> bolo_ask_price_short;
    bit<16> bolo_ask_size;
    bit<8> bolo_best_bid_market_center_2;
    bit<64> bolo_bid_price_long;
    bit<16> bolo_bid_size_2;
    bit<8> bolo_best_ask_market_center_2;
    bit<64> bolo_ask_price_long;
    bit<16> bolo_ask_size_2;
    bit<8> bolo_best_bid_market_center_3;
    bit<64> bolo_bid_price_long_2;
    bit<16> bolo_bid_size_3;
    bit<8> bolo_best_ask_market_center_3;
    bit<64> bolo_ask_price_long_2;
    bit<16> bolo_ask_size_3;
    bit<32> bolo_best_bid_market_participant_identifier;
    bit<32> bolo_best_ask_market_participant_identifier;
}

header combined_quote_message_long_form_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> adf_timestamp;
    bit<88> symbol_long;
    bit<64> protected_bid_price_long;
    bit<32> protected_bid_size_long;
    bit<64> protected_ask_price_long;
    bit<32> protected_ask_size_long;
    bit<8> quote_condition;
    bit<8> sip_generated_update_flag;
    bit<8> luld_bbo_indicator;
    bit<8> retail_interest_indicator;
    bit<8> nbbo_appendage_indicator;
    bit<8> luld_national_bbo_indicator;
    bit<8> finra_adf_mpid_appendage_indicator;
    bit<8> bolo_appendage_indicator;
    bit<8> odd_lot_attachment_type;
    bit<16> odd_lot_attachment_count;
    bit<8> nbbo_quote_condition;
    bit<8> national_best_bid_market_center;
    bit<16> national_best_bid_price_short;
    bit<16> national_best_bid_size_short;
    bit<8> national_best_ask_market_center;
    bit<16> national_best_ask_price_short;
    bit<16> national_best_ask_size_short;
    bit<8> nbbo_quote_condition_2;
    bit<8> national_best_bid_market_center_2;
    bit<64> national_best_bid_price_long;
    bit<32> national_best_bid_size_long;
    bit<8> national_best_ask_market_center_2;
    bit<64> national_best_ask_price_long;
    bit<32> national_best_ask_size_long;
    bit<32> bid_adf_mpid;
    bit<32> ask_adf_mpid;
    bit<8> bolo_best_bid_market_center;
    bit<16> bolo_bid_price_short;
    bit<16> bolo_bid_size;
    bit<8> bolo_best_ask_market_center;
    bit<16> bolo_ask_price_short;
    bit<16> bolo_ask_size;
    bit<8> bolo_best_bid_market_center_2;
    bit<64> bolo_bid_price_long;
    bit<16> bolo_bid_size_2;
    bit<8> bolo_best_ask_market_center_2;
    bit<64> bolo_ask_price_long;
    bit<16> bolo_ask_size_2;
    bit<8> bolo_best_bid_market_center_3;
    bit<64> bolo_bid_price_long_2;
    bit<16> bolo_bid_size_3;
    bit<8> bolo_best_ask_market_center_3;
    bit<64> bolo_ask_price_long_2;
    bit<16> bolo_ask_size_3;
    bit<32> bolo_best_bid_market_participant_identifier;
    bit<32> bolo_best_ask_market_participant_identifier;
}

header odd_lot_quote_message_short_form_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<40> symbol_short;
    bit<8> sip_generated_update_flag;
    bit<8> bolo_appendage_indicator;
    bit<8> odd_lot_attachment_type;
    bit<16> odd_lot_attachment_count;
    bit<8> bolo_best_bid_market_center;
    bit<16> bolo_bid_price_short;
    bit<16> bolo_bid_size;
    bit<8> bolo_best_ask_market_center;
    bit<16> bolo_ask_price_short;
    bit<16> bolo_ask_size;
    bit<8> bolo_best_bid_market_center_2;
    bit<64> bolo_bid_price_long;
    bit<16> bolo_bid_size_2;
    bit<8> bolo_best_ask_market_center_2;
    bit<64> bolo_ask_price_long;
    bit<16> bolo_ask_size_2;
    bit<8> bolo_best_bid_market_center_3;
    bit<64> bolo_bid_price_long_2;
    bit<16> bolo_bid_size_3;
    bit<8> bolo_best_ask_market_center_3;
    bit<64> bolo_ask_price_long_2;
    bit<16> bolo_ask_size_3;
    bit<32> bolo_best_bid_market_participant_identifier;
    bit<32> bolo_best_ask_market_participant_identifier;
}

header odd_lot_quote_message_long_form_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> adf_timestamp;
    bit<88> symbol_long;
    bit<8> sip_generated_update_flag;
    bit<8> bolo_appendage_indicator;
    bit<8> odd_lot_attachment_type;
    bit<16> odd_lot_attachment_count;
    bit<8> bolo_best_bid_market_center;
    bit<16> bolo_bid_price_short;
    bit<16> bolo_bid_size;
    bit<8> bolo_best_ask_market_center;
    bit<16> bolo_ask_price_short;
    bit<16> bolo_ask_size;
    bit<8> bolo_best_bid_market_center_2;
    bit<64> bolo_bid_price_long;
    bit<16> bolo_bid_size_2;
    bit<8> bolo_best_ask_market_center_2;
    bit<64> bolo_ask_price_long;
    bit<16> bolo_ask_size_2;
    bit<8> bolo_best_bid_market_center_3;
    bit<64> bolo_bid_price_long_2;
    bit<16> bolo_bid_size_3;
    bit<8> bolo_best_ask_market_center_3;
    bit<64> bolo_ask_price_long_2;
    bit<16> bolo_ask_size_3;
    bit<32> bolo_best_bid_market_participant_identifier;
    bit<32> bolo_best_ask_market_participant_identifier;
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

header session_close_recap_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol_long;
    bit<8> national_best_bid_market_center;
    bit<64> national_best_bid_price_long;
    bit<64> national_best_bid_size;
    bit<8> national_best_ask_market_center;
    bit<64> national_best_ask_price_long;
    bit<64> national_best_ask_size;
    bit<8> special_condition;
    bit<16> number_of_market_center_attachments;
    bit<8> market_center_identifier;
    bit<64> market_center_bid_price;
    bit<64> market_center_bid_size;
    bit<64> market_center_ask_price;
    bit<64> market_center_ask_size;
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

header quote_wipe_out_message_t {
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
    quote_message_t quote_message[MAX_MESSAGES];
    utp_quote_shortform_message_t utp_quote_shortform_message[MAX_MESSAGES];
    utp_quote_longform_message_t utp_quote_longform_message[MAX_MESSAGES];
    finra_adf_market_participant_quotation_message_t finra_adf_market_participant_quotation_message[MAX_MESSAGES];
    combined_quote_message_short_form_message_t combined_quote_message_short_form_message[MAX_MESSAGES];
    combined_quote_message_long_form_message_t combined_quote_message_long_form_message[MAX_MESSAGES];
    odd_lot_quote_message_short_form_message_t odd_lot_quote_message_short_form_message[MAX_MESSAGES];
    odd_lot_quote_message_long_form_message_t odd_lot_quote_message_long_form_message[MAX_MESSAGES];
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
    session_close_recap_message_t session_close_recap_message[MAX_MESSAGES];
    control_message_t control_message[MAX_MESSAGES];
    start_of_day_message_t start_of_day_message[MAX_MESSAGES];
    end_of_day_message_t end_of_day_message[MAX_MESSAGES];
    market_session_open_message_t market_session_open_message[MAX_MESSAGES];
    market_session_close_message_t market_session_close_message[MAX_MESSAGES];
    end_of_transmissions_message_t end_of_transmissions_message[MAX_MESSAGES];
    quote_wipe_out_message_t quote_wipe_out_message[MAX_MESSAGES];
}

parser NasdaqUqdfOutputParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.udp_packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_category) {
            8w0x51: parse_quote_message;
            8w0x41: parse_administrative_message;
            8w0x43: parse_control_message;
            default: accept;
        }
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message.next);
        transition select(hdr.quote_message.last.quote_message_type) {
            8w0x45: parse_utp_quote_shortform_message;
            8w0x46: parse_utp_quote_longform_message;
            8w0x4d: parse_finra_adf_market_participant_quotation_message;
            8w0x43: parse_combined_quote_message_short_form_message;
            8w0x44: parse_combined_quote_message_long_form_message;
            8w0x41: parse_odd_lot_quote_message_short_form_message;
            8w0x42: parse_odd_lot_quote_message_long_form_message;
            default: accept;
        }
    }

    state parse_utp_quote_shortform_message {
        packet.extract(hdr.utp_quote_shortform_message.next);
        transition parse_message;
    }

    state parse_utp_quote_longform_message {
        packet.extract(hdr.utp_quote_longform_message.next);
        transition parse_message;
    }

    state parse_finra_adf_market_participant_quotation_message {
        packet.extract(hdr.finra_adf_market_participant_quotation_message.next);
        transition parse_message;
    }

    state parse_combined_quote_message_short_form_message {
        packet.extract(hdr.combined_quote_message_short_form_message.next);
        transition parse_message;
    }

    state parse_combined_quote_message_long_form_message {
        packet.extract(hdr.combined_quote_message_long_form_message.next);
        transition parse_message;
    }

    state parse_odd_lot_quote_message_short_form_message {
        packet.extract(hdr.odd_lot_quote_message_short_form_message.next);
        transition parse_message;
    }

    state parse_odd_lot_quote_message_long_form_message {
        packet.extract(hdr.odd_lot_quote_message_long_form_message.next);
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
            8w0x52: parse_session_close_recap_message;
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

    state parse_session_close_recap_message {
        packet.extract(hdr.session_close_recap_message.next);
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
            8w0x50: parse_quote_wipe_out_message;
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

    state parse_quote_wipe_out_message {
        packet.extract(hdr.quote_wipe_out_message.next);
        transition parse_message;
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
        packet.emit(hdr.udp_packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.utp_quote_shortform_message);
        packet.emit(hdr.utp_quote_longform_message);
        packet.emit(hdr.finra_adf_market_participant_quotation_message);
        packet.emit(hdr.combined_quote_message_short_form_message);
        packet.emit(hdr.combined_quote_message_long_form_message);
        packet.emit(hdr.odd_lot_quote_message_short_form_message);
        packet.emit(hdr.odd_lot_quote_message_long_form_message);
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
        packet.emit(hdr.session_close_recap_message);
        packet.emit(hdr.control_message);
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
