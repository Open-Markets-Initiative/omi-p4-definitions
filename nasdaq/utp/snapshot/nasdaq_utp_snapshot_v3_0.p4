// P4_16 (v1model) definition for: Nasdaq Utp Snapshot Utp v3.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Snapshot
//   Encoding: Utp
//   Version: 3.0
//   Date: 06/01/2026
//   Specification: UTPSnapShotSpec.pdf
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

header issue_symbol_directory_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
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

header enhanced_issue_symbol_directory_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
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
    bit<8> etp_indicator;
    bit<8> new_issue_indicator;
    bit<8> mpi_tick;
    bit<8> trading_state;
    bit<48> halt_reason;
    bit<8> reg_sho_action;
    bit<64> consolidated_prior_day_close_price;
    bit<64> listing_market_official_prior_day_close_price;
}

header reg_sho_short_sale_price_test_restricted_indicator_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol;
    bit<8> reg_sho_action;
}

header cross_sro_trading_action_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol;
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
    bit<88> symbol;
    bit<8> trading_action_code;
    bit<64> action_time;
    bit<8> market_center_identifier;
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

header limit_up_limit_down_price_band_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol;
    bit<8> luld_price_band_indicator;
    bit<64> luld_price_band_effective_time;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
}

header auction_collar_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<88> symbol;
    bit<32> trading_action_sequence_number;
    bit<64> collar_reference_price;
    bit<64> collar_up_price;
    bit<64> collar_down_price;
    bit<8> collar_extension_indicator;
}

header snapshot_sequence_message_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> sequence_number;
}

header start_of_day_message_t {
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

header end_of_day_message_t {
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

header utp_combined_quote_message_long_form_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> finra_adf_timestamp;
    bit<88> symbol;
    bit<64> bid_price;
    bit<32> bid_size;
    bit<64> ask_price;
    bit<32> ask_size;
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
    bit<64> national_best_bid_price;
    bit<32> national_best_bid_size;
    bit<8> national_best_ask_market_center;
    bit<64> national_best_ask_price;
    bit<32> national_best_ask_size;
    bit<32> bid_adf_mpid;
    bit<32> ask_adf_mpid;
    bit<8> bolo_best_bid_market_center;
    bit<64> bolo_bid_price;
    bit<16> bolo_bid_size;
    bit<8> bolo_best_ask_market_center;
    bit<64> bolo_ask_price;
    bit<16> bolo_ask_size;
    bit<32> bolo_best_bid_market_participant_identifier;
    bit<32> bolo_best_ask_market_participant_identifier;
}

header odd_lot_quote_message_long_form_t {
    bit<8> market_center_originator;
    bit<8> sub_market_center_id;
    bit<64> sip_timestamp;
    bit<64> timestamp_1;
    bit<64> participant_token;
    bit<64> adf_timestamp;
    bit<88> symbol;
    bit<8> sip_generated_update_flag;
    bit<8> bolo_appendage_indicator;
    bit<8> odd_lot_attachment_type;
    bit<16> odd_lot_attachment_count;
    bit<8> bolo_best_bid_market_center;
    bit<64> bolo_bid_price;
    bit<16> bolo_bid_size;
    bit<8> bolo_best_ask_market_center;
    bit<64> bolo_ask_price;
    bit<16> bolo_ask_size;
    bit<32> bolo_best_bid_market_participant_identifier;
    bit<32> bolo_best_ask_market_participant_identifier;
}

header debug_packet_t {
    bit<8> text;
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
    issue_symbol_directory_message_t issue_symbol_directory_message[MAX_MESSAGES];
    enhanced_issue_symbol_directory_message_t enhanced_issue_symbol_directory_message[MAX_MESSAGES];
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message[MAX_MESSAGES];
    cross_sro_trading_action_message_t cross_sro_trading_action_message[MAX_MESSAGES];
    market_center_trading_action_message_t market_center_trading_action_message[MAX_MESSAGES];
    market_wide_circuit_breaker_decline_level_message_t market_wide_circuit_breaker_decline_level_message[MAX_MESSAGES];
    limit_up_limit_down_price_band_message_t limit_up_limit_down_price_band_message[MAX_MESSAGES];
    auction_collar_message_t auction_collar_message[MAX_MESSAGES];
    snapshot_sequence_message_t snapshot_sequence_message[MAX_MESSAGES];
    start_of_day_message_t start_of_day_message[MAX_MESSAGES];
    market_session_open_message_t market_session_open_message[MAX_MESSAGES];
    market_session_close_message_t market_session_close_message[MAX_MESSAGES];
    end_of_day_message_t end_of_day_message[MAX_MESSAGES];
    end_of_transmissions_message_t end_of_transmissions_message[MAX_MESSAGES];
    utp_combined_quote_message_long_form_t utp_combined_quote_message_long_form[MAX_MESSAGES];
    odd_lot_quote_message_long_form_t odd_lot_quote_message_long_form[MAX_MESSAGES];
    debug_packet_t debug_packet[MAX_MESSAGES];
    login_request_packet_t login_request_packet[MAX_MESSAGES];
    login_accepted_packet_t login_accepted_packet[MAX_MESSAGES];
    login_rejected_packet_t login_rejected_packet[MAX_MESSAGES];
}

parser NasdaqUtpSnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.tcp_packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message_header.next);
        transition select(hdr.message_header.last.message_category) {
            8w0x41: parse_administrative_message;
            8w0x43: parse_control_message;
            8w0x51: parse_quote_message;
            default: accept;
        }
    }

    state parse_administrative_message {
        packet.extract(hdr.administrative_message.next);
        transition parse_message;
    }

    state parse_control_message {
        packet.extract(hdr.control_message.next);
        transition parse_message;
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message.next);
        transition parse_message;
    }

}

control NasdaqUtpSnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpSnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NasdaqUtpSnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqUtpSnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpSnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.tcp_packet_header);
        packet.emit(hdr.message_header);
        packet.emit(hdr.issue_symbol_directory_message);
        packet.emit(hdr.enhanced_issue_symbol_directory_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.cross_sro_trading_action_message);
        packet.emit(hdr.market_center_trading_action_message);
        packet.emit(hdr.market_wide_circuit_breaker_decline_level_message);
        packet.emit(hdr.limit_up_limit_down_price_band_message);
        packet.emit(hdr.auction_collar_message);
        packet.emit(hdr.snapshot_sequence_message);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.market_session_open_message);
        packet.emit(hdr.market_session_close_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.end_of_transmissions_message);
        packet.emit(hdr.utp_combined_quote_message_long_form);
        packet.emit(hdr.odd_lot_quote_message_long_form);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
    }
}

V1Switch(
    NasdaqUtpSnapshotParser(),
    NasdaqUtpSnapshotVerifyChecksum(),
    NasdaqUtpSnapshotIngress(),
    NasdaqUtpSnapshotEgress(),
    NasdaqUtpSnapshotComputeChecksum(),
    NasdaqUtpSnapshotDeparser()
) main;
