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
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header server_tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header sequenced_data_packet_t {
    bit<8> version;
    bit<8> message_category;
}

header administrative_message_t {
    bit<8> administrative_message_type;
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

header quote_message_t {
    bit<8> quote_message_type;
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
    server_tcp_packet_header_t server_tcp_packet_header;
    sequenced_data_packet_t sequenced_data_packet;
    administrative_message_t administrative_message;
    issue_symbol_directory_message_t issue_symbol_directory_message;
    enhanced_issue_symbol_directory_message_t enhanced_issue_symbol_directory_message;
    reg_sho_short_sale_price_test_restricted_indicator_message_t reg_sho_short_sale_price_test_restricted_indicator_message;
    cross_sro_trading_action_message_t cross_sro_trading_action_message;
    market_center_trading_action_message_t market_center_trading_action_message;
    market_wide_circuit_breaker_decline_level_message_t market_wide_circuit_breaker_decline_level_message;
    limit_up_limit_down_price_band_message_t limit_up_limit_down_price_band_message;
    auction_collar_message_t auction_collar_message;
    snapshot_sequence_message_t snapshot_sequence_message;
    control_message_t control_message;
    start_of_day_message_t start_of_day_message;
    market_session_open_message_t market_session_open_message;
    market_session_close_message_t market_session_close_message;
    end_of_day_message_t end_of_day_message;
    end_of_transmissions_message_t end_of_transmissions_message;
    quote_message_t quote_message;
    utp_combined_quote_message_long_form_t utp_combined_quote_message_long_form;
    odd_lot_quote_message_long_form_t odd_lot_quote_message_long_form;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
}

parser NasdaqUtpSnapshotServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_tcp_packet_header);
        transition select(hdr.server_tcp_packet_header.server_packet_type) {
            8w0x53: parse_sequenced_data_packet;
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            default: accept;
        }
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        transition select(hdr.sequenced_data_packet.message_category) {
            8w0x41: parse_administrative_message;
            8w0x43: parse_control_message;
            8w0x51: parse_quote_message;
            default: accept;
        }
    }

    state parse_administrative_message {
        packet.extract(hdr.administrative_message);
        transition select(hdr.administrative_message.administrative_message_type) {
            8w0x42: parse_issue_symbol_directory_message;
            8w0x46: parse_enhanced_issue_symbol_directory_message;
            8w0x56: parse_reg_sho_short_sale_price_test_restricted_indicator_message;
            8w0x48: parse_cross_sro_trading_action_message;
            8w0x4b: parse_market_center_trading_action_message;
            8w0x43: parse_market_wide_circuit_breaker_decline_level_message;
            8w0x50: parse_limit_up_limit_down_price_band_message;
            8w0x45: parse_auction_collar_message;
            8w0x53: parse_snapshot_sequence_message;
            default: accept;
        }
    }

    state parse_issue_symbol_directory_message {
        packet.extract(hdr.issue_symbol_directory_message);
        transition accept;
    }

    state parse_enhanced_issue_symbol_directory_message {
        packet.extract(hdr.enhanced_issue_symbol_directory_message);
        transition accept;
    }

    state parse_reg_sho_short_sale_price_test_restricted_indicator_message {
        packet.extract(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        transition accept;
    }

    state parse_cross_sro_trading_action_message {
        packet.extract(hdr.cross_sro_trading_action_message);
        transition accept;
    }

    state parse_market_center_trading_action_message {
        packet.extract(hdr.market_center_trading_action_message);
        transition accept;
    }

    state parse_market_wide_circuit_breaker_decline_level_message {
        packet.extract(hdr.market_wide_circuit_breaker_decline_level_message);
        transition accept;
    }

    state parse_limit_up_limit_down_price_band_message {
        packet.extract(hdr.limit_up_limit_down_price_band_message);
        transition accept;
    }

    state parse_auction_collar_message {
        packet.extract(hdr.auction_collar_message);
        transition accept;
    }

    state parse_snapshot_sequence_message {
        packet.extract(hdr.snapshot_sequence_message);
        transition accept;
    }

    state parse_control_message {
        packet.extract(hdr.control_message);
        transition select(hdr.control_message.control_message_type) {
            8w0x49: parse_start_of_day_message;
            8w0x4f: parse_market_session_open_message;
            8w0x43: parse_market_session_close_message;
            8w0x4a: parse_end_of_day_message;
            8w0x5a: parse_end_of_transmissions_message;
            default: accept;
        }
    }

    state parse_start_of_day_message {
        packet.extract(hdr.start_of_day_message);
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

    state parse_end_of_day_message {
        packet.extract(hdr.end_of_day_message);
        transition accept;
    }

    state parse_end_of_transmissions_message {
        packet.extract(hdr.end_of_transmissions_message);
        transition accept;
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message);
        transition select(hdr.quote_message.quote_message_type) {
            8w0x44: parse_utp_combined_quote_message_long_form;
            8w0x42: parse_odd_lot_quote_message_long_form;
            default: accept;
        }
    }

    state parse_utp_combined_quote_message_long_form {
        packet.extract(hdr.utp_combined_quote_message_long_form);
        transition accept;
    }

    state parse_odd_lot_quote_message_long_form {
        packet.extract(hdr.odd_lot_quote_message_long_form);
        transition accept;
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        transition accept;
    }

}

control NasdaqUtpSnapshotServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpSnapshotServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NasdaqUtpSnapshotServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqUtpSnapshotServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqUtpSnapshotServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_tcp_packet_header);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.administrative_message);
        packet.emit(hdr.issue_symbol_directory_message);
        packet.emit(hdr.enhanced_issue_symbol_directory_message);
        packet.emit(hdr.reg_sho_short_sale_price_test_restricted_indicator_message);
        packet.emit(hdr.cross_sro_trading_action_message);
        packet.emit(hdr.market_center_trading_action_message);
        packet.emit(hdr.market_wide_circuit_breaker_decline_level_message);
        packet.emit(hdr.limit_up_limit_down_price_band_message);
        packet.emit(hdr.auction_collar_message);
        packet.emit(hdr.snapshot_sequence_message);
        packet.emit(hdr.control_message);
        packet.emit(hdr.start_of_day_message);
        packet.emit(hdr.market_session_open_message);
        packet.emit(hdr.market_session_close_message);
        packet.emit(hdr.end_of_day_message);
        packet.emit(hdr.end_of_transmissions_message);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.utp_combined_quote_message_long_form);
        packet.emit(hdr.odd_lot_quote_message_long_form);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
    }
}

V1Switch(
    NasdaqUtpSnapshotServerParser(),
    NasdaqUtpSnapshotServerVerifyChecksum(),
    NasdaqUtpSnapshotServerIngress(),
    NasdaqUtpSnapshotServerEgress(),
    NasdaqUtpSnapshotServerComputeChecksum(),
    NasdaqUtpSnapshotServerDeparser()
) main;
