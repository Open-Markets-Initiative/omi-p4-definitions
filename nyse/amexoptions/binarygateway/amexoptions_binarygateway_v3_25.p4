// P4_16 (v1model) definition for: Nyse AmexOptions BinaryGateway PillarStream v3.25
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Binary Gateway
//   Encoding: Pillar Stream Protocol
//   Version: 3.25
//   Date: 10/17/2025
//   Specification: NYSE_Pillar_Options_Gateway_Binary_Protocol_Specification.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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
    bit<16> msg_type;
    bit<16> msg_length;
    bit<128> username;
    bit<256> password;
    bit<32> mic;
    bit<160> version;
    bit<16> msg_type_2;
    bit<16> msg_length_2;
    bit<128> username_2;
    bit<8> status;
    bit<16> msg_type_3;
    bit<16> msg_length_3;
    bit<32> sess;
    bit<32> user;
    bit<64> next_seq;
    bit<8> access;
    bit<16> msg_type_4;
    bit<16> msg_length_4;
    bit<16> msg_type_5;
    bit<16> msg_length_5;
    bit<32> sess_2;
    bit<32> user_2;
    bit<64> start_seq;
    bit<64> end_seq;
    bit<8> access_2;
    bit<8> mode;
    bit<16> msg_type_6;
    bit<16> msg_length_6;
    bit<32> sess_3;
    bit<32> user_3;
    bit<8> status_2;
    bit<8> access_3;
    bit<16> msg_type_7;
    bit<16> msg_length_7;
    bit<32> sess_4;
    bit<32> user_4;
    bit<16> msg_type_8;
    bit<16> msg_length_8;
    bit<32> sess_5;
    bit<32> user_5;
    bit<8> status_3;
    bit<16> msg_type_9;
    bit<16> msg_length_9;
    bit<32> sess_6;
    bit<32> user_6;
    bit<64> seq;
    bit<32> reserved_4;
    bit<64> timestamp;
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
}

header session_configuration_request_message_t {
    bit<128> username;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header new_order_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<128> bitfield_order_instructions;
    bit<64> price;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<80> user_data;
    bit<64> leg_open_close;
    bit<64> auction_id;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header order_cancel_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
}

header order_modify_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<32> order_qty;
    bit<8> side_u_81;
    bit<8> locate_reqd_u_81;
}

header new_bulk_quote_type_243_message_t {
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> sub_id;
    bit<64> cl_ord_id;
    bit<8> self_trade_type_u_81;
    bit<32> group_id;
    bit<64> mm_sent_time;
}

header new_bulk_quote_type_259_message_t {
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> sub_id;
    bit<64> cl_ord_id;
    bit<8> self_trade_type_u_81;
    bit<32> group_id;
    bit<64> mm_sent_time;
}

header new_order_cross_message_t {
    bit<64> cross_id;
    bit<8> allocation_pct;
    bit<40> clearing_firm_exposed;
    bit<40> clearing_account_exposed;
    bit<128> optional_data_exposed;
    bit<40> clearing_firm_covered;
    bit<40> clearing_account_covered;
    bit<128> optional_data_covered;
    bit<128> reserved_16;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<128> bitfield_order_instructions;
    bit<64> price;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<80> user_data;
    bit<64> leg_open_close;
    bit<64> auction_id;
    bit<16> sub_msg_type_2;
    bit<16> sub_msg_length_2;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
    bit<16> sub_msg_type_3;
    bit<16> sub_msg_length_3;
    bit<32> symbol_id_2;
    bit<32> mpid_2;
    bit<80> market_maker_2;
    bit<32> mp_sub_id_2;
    bit<64> cl_ord_id_2;
    bit<64> orig_cl_ord_id_2;
    bit<128> bitfield_order_instructions_2;
    bit<64> price_2;
    bit<32> order_qty_2;
    bit<32> min_qty_2;
    bit<80> user_data_2;
    bit<64> leg_open_close_2;
    bit<64> auction_id_2;
    bit<16> sub_msg_type_4;
    bit<16> sub_msg_length_4;
    bit<64> stop_px_2;
    bit<32> max_floor_2;
    bit<40> deliver_to_comp_id_2;
    bit<40> clearing_firm_2;
    bit<128> optional_data_2;
    bit<40> clearing_account_2;
}

header bulk_cancel_request_type_223_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<64> cl_ord_id;
    bit<64> mm_sent_time;
    bit<8> side_u_81;
    bit<32> group_id;
    bit<128> target_cancel_username;
    bit<8> bulk_action;
    bit<8> cancel_scope;
    bit<32> target_cancel_mpid;
}

header bulk_cancel_request_type_224_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<8> side_u_81;
    bit<128> target_cancel_username;
    bit<8> bulk_action;
    bit<32> target_cancel_mpid;
    bit<160> reserved_20;
}

header risk_limit_update_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_request;
    bit<8> ioc_attribution;
    bit<8> risk_range_id;
    bit<64> risk_minimum_value;
    bit<8> price_scale;
    bit<1520> reserved_190;
}

header risk_action_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_action_type;
    bit<8> risk_range_id;
    bit<1592> reserved_199;
}

header new_complex_series_request_message_t {
    bit<64> cl_ord_id;
    bit<32> mpid;
    bit<32> leg_symbol_id;
    bit<16> leg_ratio_qty;
    bit<8> leg_side;
}

header underlying_symbol_reference_data_message_t {
    bit<64> transact_time_u_648;
    bit<32> symbol_id;
    bit<192> nyse_symbol;
    bit<32> listed_mic;
    bit<8> underlying_type;
    bit<64> max_order_price;
    bit<16> mpv_class_id;
    bit<8> test_symbol_indicator;
    bit<8> channel_id;
    bit<8> legal_width_multiplier;
}

header series_reference_data_message_t {
    bit<64> transact_time_u_648;
    bit<32> series_index;
    bit<32> symbol_id;
    bit<192> occ_symbol_root;
    bit<8> put_or_call;
    bit<64> strike_price;
    bit<64> maturity_date;
    bit<32> contract_multiplier;
    bit<8> series_type;
    bit<8> closing_only_indicator;
}

header minimum_price_variant_class_reference_data_message_t {
    bit<64> transact_time_timestamp_8;
    bit<160> mpv_class_name;
    bit<16> mpv_class_id;
}

header minimum_price_variant_level_reference_data_message_t {
    bit<64> transact_time_timestamp_8;
    bit<192> mpv_level_name;
    bit<64> order_entry_limit_price;
    bit<64> quoting_mpv;
    bit<64> trading_mpv;
    bit<16> mpv_class_id;
}

header mpid_configuration_message_t {
    bit<64> transact_time_timestamp_8;
    bit<8> mpid_status;
    bit<32> mpid;
    bit<128> username;
    bit<400> reserved_50;
}

header options_market_maker_symbol_appointment_reference_data_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> symbol_id;
    bit<192> nyse_symbol;
    bit<80> market_maker;
    bit<32> mpid;
    bit<8> mm_type;
    bit<8> appointment_status;
    bit<400> reserved_50;
}

header session_configuration_acknowledgement_message_t {
    bit<64> transact_time_timestamp_8;
    bit<8> user_session_type;
    bit<8> user_session_status;
    bit<128> username;
    bit<32> mic;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<16> throttle_window;
    bit<16> throttle_threshold;
    bit<8> symbol_eligibility;
    bit<32> max_order_quantity;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> ack_status;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header order_and_cancel_replace_acknowledgement_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<128> bitfield_order_instructions;
    bit<64> price;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<80> user_data;
    bit<64> transact_time_timestamp_8;
    bit<64> order_id;
    bit<32> leaves_qty;
    bit<64> working_price;
    bit<8> working_away_from_display;
    bit<32> pre_liquidity_indicator;
    bit<16> reason_code;
    bit<8> ack_type;
    bit<1> throttled;
    bit<7> unused_7;
    bit<64> leg_open_close;
    bit<64> auction_id;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header bulk_quote_acknowledgment_type_294_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> sub_id;
    bit<64> cl_ord_id;
    bit<1> throttled;
    bit<7> unused_7;
    bit<8> self_trade_type_u_81;
    bit<32> group_id;
    bit<8> repeating_groups;
}

header bulk_quote_acknowledgment_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> sub_id;
    bit<64> cl_ord_id;
    bit<1> throttled;
    bit<7> unused_7;
    bit<8> self_trade_type_u_81;
    bit<32> group_id;
    bit<8> repeating_groups;
}

header order_single_complex_modify_cancel_request_acknowledgment_and_urout_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> ref_cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<32> order_qty;
    bit<32> leaves_qty;
    bit<8> side_u_81;
    bit<8> locate_reqd_u_81;
    bit<16> reason_code;
    bit<8> ack_type;
    bit<1> throttled;
    bit<7> unused_7;
    bit<80> user_data;
    bit<32> group_id;
    bit<80> market_maker;
    bit<128> target_cancel_username;
    bit<32> target_cancel_mpid;
    bit<8> bulk_action;
    bit<8> cancel_scope;
}

header order_priority_update_acknowledgment_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> working_price;
    bit<32> order_qty;
    bit<8> working_away_from_display;
    bit<32> pre_liquidity_indicator;
    bit<8> ack_type;
    bit<80> user_data;
}

header execution_report_message_t {
    bit<64> transact_time_u_648;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> deal_id;
    bit<64> last_px;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> last_qty;
    bit<32> liquidity_indicator;
    bit<8> multileg_reporting_type;
    bit<8> reserved_1;
    bit<16> reserved_2;
    bit<8> locate_reqd_u_81;
    bit<8> participant_type;
    bit<16> reason_code;
    bit<80> user_data;
    bit<8> side_u_81;
    bit<80> market_maker;
    bit<80> contra_market_maker;
    bit<40> contra_clearing_firm;
    bit<32> contra_mpid;
    bit<8> contra_open_close;
    bit<8> contra_customer_or_firm;
    bit<40> contra_clearing_account;
    bit<16> contra_cross_type;
    bit<8> contra_covered_or_uncovered;
    bit<8> covered_or_uncovered;
    bit<64> cross_id;
    bit<8> open_close_u_81;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<32> max_floor;
    bit<40> deliver_to_comp_id;
    bit<40> clearing_firm;
    bit<128> optional_data;
    bit<40> clearing_account;
}

header trade_bust_correct_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<32> sess;
    bit<32> user;
    bit<64> seq;
    bit<64> deal_id;
    bit<64> last_px;
    bit<32> last_qty;
    bit<16> reason_code;
    bit<80> user_data;
    bit<8> bust_correct_indicator;
}

header application_layer_reject_message_t {
    bit<64> transact_time_timestamp_8;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<16> reason_code;
    bit<8> reject_type;
    bit<80> user_data;
    bit<32> reserved_4;
}

header risk_control_acknowledgement_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<8> risk_ack_type;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<8> risk_action_type;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_response;
    bit<8> ioc_attribution;
    bit<64> usd_calculation_1;
    bit<64> usd_calculation_2;
    bit<64> usd_calculation_3;
    bit<64> usd_calculation_4;
    bit<32> count_calculation;
    bit<8> blocked_by_breach_indicator;
    bit<8> blocked_by_kill_switch_indicator;
    bit<8> reinstatement_required_by_self;
    bit<8> reinstatement_required_by_other;
    bit<8> risk_range_id;
    bit<64> risk_minimum_value;
    bit<8> price_scale;
    bit<1520> reserved_190;
}

header risk_control_alert_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker;
    bit<32> mp_sub_id;
    bit<40> clearing_number;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_response;
    bit<8> ioc_attribution;
    bit<64> usd_calculation_1;
    bit<64> usd_calculation_2;
    bit<64> usd_calculation_3;
    bit<64> usd_calculation_4;
    bit<32> count_calculation;
    bit<8> risk_action_type;
    bit<8> threshold_breach_level;
    bit<8> blocked_by_breach_indicator;
    bit<8> blocked_by_kill_switch_indicator;
    bit<8> reinstatement_required_by_self;
    bit<8> reinstatement_required_by_other;
    bit<1600> reserved_200;
}

header complex_series_request_acknowledgement_message_t {
    bit<64> transact_time_timestamp_8;
    bit<64> cl_ord_id;
    bit<16> reason_code;
    bit<32> symbol_id;
    bit<8> side_u_81;
    bit<8> repeating_groups;
    bit<32> leg_symbol_id;
    bit<16> leg_ratio_qty;
    bit<8> leg_side;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    session_configuration_request_message_t session_configuration_request_message;
    new_order_message_t new_order_message;
    order_cancel_request_message_t order_cancel_request_message;
    order_modify_request_message_t order_modify_request_message;
    new_bulk_quote_type_243_message_t new_bulk_quote_type_243_message;
    new_bulk_quote_type_259_message_t new_bulk_quote_type_259_message;
    new_order_cross_message_t new_order_cross_message;
    bulk_cancel_request_type_223_message_t bulk_cancel_request_type_223_message;
    bulk_cancel_request_type_224_message_t bulk_cancel_request_type_224_message;
    risk_limit_update_request_message_t risk_limit_update_request_message;
    risk_action_request_message_t risk_action_request_message;
    new_complex_series_request_message_t new_complex_series_request_message;
    underlying_symbol_reference_data_message_t underlying_symbol_reference_data_message;
    series_reference_data_message_t series_reference_data_message;
    minimum_price_variant_class_reference_data_message_t minimum_price_variant_class_reference_data_message;
    minimum_price_variant_level_reference_data_message_t minimum_price_variant_level_reference_data_message;
    mpid_configuration_message_t mpid_configuration_message;
    options_market_maker_symbol_appointment_reference_data_message_t options_market_maker_symbol_appointment_reference_data_message;
    session_configuration_acknowledgement_message_t session_configuration_acknowledgement_message;
    order_and_cancel_replace_acknowledgement_message_t order_and_cancel_replace_acknowledgement_message;
    bulk_quote_acknowledgment_type_294_message_t bulk_quote_acknowledgment_type_294_message;
    bulk_quote_acknowledgment_message_t bulk_quote_acknowledgment_message;
    order_single_complex_modify_cancel_request_acknowledgment_and_urout_message_t order_single_complex_modify_cancel_request_acknowledgment_and_urout_message;
    order_priority_update_acknowledgment_message_t order_priority_update_acknowledgment_message;
    execution_report_message_t execution_report_message;
    trade_bust_correct_message_t trade_bust_correct_message;
    application_layer_reject_message_t application_layer_reject_message;
    risk_control_acknowledgement_message_t risk_control_acknowledgement_message;
    risk_control_alert_message_t risk_control_alert_message;
    complex_series_request_acknowledgement_message_t complex_series_request_acknowledgement_message;
}

parser AmexoptionsBinarygatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.seq_msg_type) {
            16w0x0220: parse_session_configuration_request_message;
            16w0x0248: parse_new_order_message;
            16w0x0250: parse_order_cancel_request_message;
            16w0x0251: parse_order_modify_request_message;
            16w0x0243: parse_new_bulk_quote_type_243_message;
            16w0x0259: parse_new_bulk_quote_type_259_message;
            16w0x0222: parse_new_order_cross_message;
            16w0x0223: parse_bulk_cancel_request_type_223_message;
            16w0x0224: parse_bulk_cancel_request_type_224_message;
            16w0x0330: parse_risk_limit_update_request_message;
            16w0x0331: parse_risk_action_request_message;
            16w0x0357: parse_new_complex_series_request_message;
            16w0x0233: parse_underlying_symbol_reference_data_message;
            16w0x0234: parse_series_reference_data_message;
            16w0x0230: parse_minimum_price_variant_class_reference_data_message;
            16w0x0231: parse_minimum_price_variant_level_reference_data_message;
            16w0x0272: parse_mpid_configuration_message;
            16w0x0833: parse_options_market_maker_symbol_appointment_reference_data_message;
            16w0x0221: parse_session_configuration_acknowledgement_message;
            16w0x0269: parse_order_and_cancel_replace_acknowledgement_message;
            16w0x0294: parse_bulk_quote_acknowledgment_type_294_message;
            16w0x0308: parse_bulk_quote_acknowledgment_message;
            16w0x0278: parse_order_single_complex_modify_cancel_request_acknowledgment_and_urout_message;
            16w0x0268: parse_order_priority_update_acknowledgment_message;
            16w0x0295: parse_execution_report_message;
            16w0x0293: parse_trade_bust_correct_message;
            16w0x0267: parse_application_layer_reject_message;
            16w0x0332: parse_risk_control_acknowledgement_message;
            16w0x0333: parse_risk_control_alert_message;
            16w0x0358: parse_complex_series_request_acknowledgement_message;
            default: accept;
        }
    }

    state parse_session_configuration_request_message {
        packet.extract(hdr.session_configuration_request_message);
        transition accept;
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        transition accept;
    }

    state parse_order_modify_request_message {
        packet.extract(hdr.order_modify_request_message);
        transition accept;
    }

    state parse_new_bulk_quote_type_243_message {
        packet.extract(hdr.new_bulk_quote_type_243_message);
        transition accept;
    }

    state parse_new_bulk_quote_type_259_message {
        packet.extract(hdr.new_bulk_quote_type_259_message);
        transition accept;
    }

    state parse_new_order_cross_message {
        packet.extract(hdr.new_order_cross_message);
        transition accept;
    }

    state parse_bulk_cancel_request_type_223_message {
        packet.extract(hdr.bulk_cancel_request_type_223_message);
        transition accept;
    }

    state parse_bulk_cancel_request_type_224_message {
        packet.extract(hdr.bulk_cancel_request_type_224_message);
        transition accept;
    }

    state parse_risk_limit_update_request_message {
        packet.extract(hdr.risk_limit_update_request_message);
        transition accept;
    }

    state parse_risk_action_request_message {
        packet.extract(hdr.risk_action_request_message);
        transition accept;
    }

    state parse_new_complex_series_request_message {
        packet.extract(hdr.new_complex_series_request_message);
        transition accept;
    }

    state parse_underlying_symbol_reference_data_message {
        packet.extract(hdr.underlying_symbol_reference_data_message);
        transition accept;
    }

    state parse_series_reference_data_message {
        packet.extract(hdr.series_reference_data_message);
        transition accept;
    }

    state parse_minimum_price_variant_class_reference_data_message {
        packet.extract(hdr.minimum_price_variant_class_reference_data_message);
        transition accept;
    }

    state parse_minimum_price_variant_level_reference_data_message {
        packet.extract(hdr.minimum_price_variant_level_reference_data_message);
        transition accept;
    }

    state parse_mpid_configuration_message {
        packet.extract(hdr.mpid_configuration_message);
        transition accept;
    }

    state parse_options_market_maker_symbol_appointment_reference_data_message {
        packet.extract(hdr.options_market_maker_symbol_appointment_reference_data_message);
        transition accept;
    }

    state parse_session_configuration_acknowledgement_message {
        packet.extract(hdr.session_configuration_acknowledgement_message);
        transition accept;
    }

    state parse_order_and_cancel_replace_acknowledgement_message {
        packet.extract(hdr.order_and_cancel_replace_acknowledgement_message);
        transition accept;
    }

    state parse_bulk_quote_acknowledgment_type_294_message {
        packet.extract(hdr.bulk_quote_acknowledgment_type_294_message);
        transition accept;
    }

    state parse_bulk_quote_acknowledgment_message {
        packet.extract(hdr.bulk_quote_acknowledgment_message);
        transition accept;
    }

    state parse_order_single_complex_modify_cancel_request_acknowledgment_and_urout_message {
        packet.extract(hdr.order_single_complex_modify_cancel_request_acknowledgment_and_urout_message);
        transition accept;
    }

    state parse_order_priority_update_acknowledgment_message {
        packet.extract(hdr.order_priority_update_acknowledgment_message);
        transition accept;
    }

    state parse_execution_report_message {
        packet.extract(hdr.execution_report_message);
        transition accept;
    }

    state parse_trade_bust_correct_message {
        packet.extract(hdr.trade_bust_correct_message);
        transition accept;
    }

    state parse_application_layer_reject_message {
        packet.extract(hdr.application_layer_reject_message);
        transition accept;
    }

    state parse_risk_control_acknowledgement_message {
        packet.extract(hdr.risk_control_acknowledgement_message);
        transition accept;
    }

    state parse_risk_control_alert_message {
        packet.extract(hdr.risk_control_alert_message);
        transition accept;
    }

    state parse_complex_series_request_acknowledgement_message {
        packet.extract(hdr.complex_series_request_acknowledgement_message);
        transition accept;
    }

}

control AmexoptionsBinarygatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexoptionsBinarygatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AmexoptionsBinarygatewayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AmexoptionsBinarygatewayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AmexoptionsBinarygatewayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.session_configuration_request_message);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.order_modify_request_message);
        packet.emit(hdr.new_bulk_quote_type_243_message);
        packet.emit(hdr.new_bulk_quote_type_259_message);
        packet.emit(hdr.new_order_cross_message);
        packet.emit(hdr.bulk_cancel_request_type_223_message);
        packet.emit(hdr.bulk_cancel_request_type_224_message);
        packet.emit(hdr.risk_limit_update_request_message);
        packet.emit(hdr.risk_action_request_message);
        packet.emit(hdr.new_complex_series_request_message);
        packet.emit(hdr.underlying_symbol_reference_data_message);
        packet.emit(hdr.series_reference_data_message);
        packet.emit(hdr.minimum_price_variant_class_reference_data_message);
        packet.emit(hdr.minimum_price_variant_level_reference_data_message);
        packet.emit(hdr.mpid_configuration_message);
        packet.emit(hdr.options_market_maker_symbol_appointment_reference_data_message);
        packet.emit(hdr.session_configuration_acknowledgement_message);
        packet.emit(hdr.order_and_cancel_replace_acknowledgement_message);
        packet.emit(hdr.bulk_quote_acknowledgment_type_294_message);
        packet.emit(hdr.bulk_quote_acknowledgment_message);
        packet.emit(hdr.order_single_complex_modify_cancel_request_acknowledgment_and_urout_message);
        packet.emit(hdr.order_priority_update_acknowledgment_message);
        packet.emit(hdr.execution_report_message);
        packet.emit(hdr.trade_bust_correct_message);
        packet.emit(hdr.application_layer_reject_message);
        packet.emit(hdr.risk_control_acknowledgement_message);
        packet.emit(hdr.risk_control_alert_message);
        packet.emit(hdr.complex_series_request_acknowledgement_message);
    }
}

V1Switch(
    AmexoptionsBinarygatewayParser(),
    AmexoptionsBinarygatewayVerifyChecksum(),
    AmexoptionsBinarygatewayIngress(),
    AmexoptionsBinarygatewayEgress(),
    AmexoptionsBinarygatewayComputeChecksum(),
    AmexoptionsBinarygatewayDeparser()
) main;
