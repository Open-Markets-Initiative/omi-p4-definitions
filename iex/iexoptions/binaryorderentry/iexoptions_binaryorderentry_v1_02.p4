// P4_16 (v1model) definition for: Iex IexOptions BinaryOrderEntry Sbe v1.02
// 
// Protocol:
//   Organization: Investors Exchange
//   Protocol: Binary Order Entry
//   Encoding: Simple Binary Encoding
//   Version: 1.02
//   Date: 6/1/2026
//   Specification: IEX Binary Options Protocol Specification
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
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<16> packet_length;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header login_request_message_t {
    bit<128> logon_id;
    bit<256> token;
}

header login_response_message_t {
    bit<128> logon_id;
    bit<8> status;
}

header gateway_heartbeat_message_t {
    bit<8> keep_alive;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
}

header gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_t {
    bit<8> subsession_type;
    bit<64> subsession_id;
    bit<8> joined;
    bit<32> next_seq_no;
}

header terminate_message_t {
    bit<8> reason;
}

header sequenced_message_header_message_t {
    bit<64> subsession_id;
    bit<32> sequence;
    bit<64> timestamp;
}

header subsession_join_message_t {
    bit<64> subsession_id;
    bit<32> start_sequence;
    bit<32> end_sequence;
}

header subsession_join_response_message_t {
    bit<64> subsession_id;
    bit<8> status;
}

header subsession_leave_message_t {
    bit<64> subsession_id;
}

header subsession_leave_response_message_t {
    bit<64> subsession_id;
    bit<8> reason;
}

header new_order_single_message_t {
    bit<128> account_account;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<8> customer_or_firm;
    bit<8> open_close;
    bit<8> attributed_quote;
    bit<8> time_in_force;
    bit<8> cancel_instead_of_slide_cancel_instead_of_slide;
    bit<8> display_inst;
    bit<8> exec_inst;
    bit<8> ord_type;
    bit<32> target_party_id;
    bit<32> auction_id;
    bit<32> clearing_firm;
    bit<128> optional_data;
    bit<32> routing_firm_id;
    bit<24> aiq;
    bit<8> side;
    bit<64> price_price_8;
    bit<32> order_qty_quantity_non_zero;
}

header order_cancel_replace_request_message_t {
    bit<128> account_account;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<64> orig_cl_ord_id;
    bit<8> customer_or_firm;
    bit<8> open_close;
    bit<8> attributed_quote;
    bit<8> time_in_force;
    bit<8> cancel_instead_of_slide_cancel_instead_of_slide_optional;
    bit<8> display_inst;
    bit<8> exec_inst;
    bit<8> ord_type;
    bit<32> target_party_id;
    bit<32> auction_id;
    bit<32> clearing_firm;
    bit<128> optional_data;
    bit<32> routing_firm_id;
    bit<24> aiq;
    bit<8> side;
    bit<64> price_price_8;
    bit<32> order_qty_quantity_non_zero;
}

header order_cancel_request_message_t {
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
}

header new_bulk_quote_message_t {
    bit<32> market_participant_id;
    bit<16> custom_group_id_uint_16;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<8> cancel_instead_of_slide_cancel_instead_of_slide_optional;
    bit<64> send_time;
    bit<24> aiq;
    bit<8> time_in_force;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
}

header new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_t {
    bit<32> instrument_id_instrument_id;
    bit<8> side;
    bit<32> price_price_4_optional;
    bit<32> order_qty_quantity_zero_optional;
    bit<8> quote_type;
    bit<8> reserved;
}

header mass_cancel_request_message_t {
    bit<32> underlying_id_instrument_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> send_time;
    bit<8> ack_style_mass_cancel_ack_style;
    bit<8> mpid_filter;
    bit<8> bulk_action;
}

header purge_request_message_t {
    bit<32> underlying_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> send_time;
    bit<8> ack_style_purge_request_ack_style;
    bit<8> bulk_action;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
}

header purge_request_message_purge_request_message_custom_group_ids_group_t {
    bit<16> custom_group_id_uint_16;
}

header order_ack_message_t {
    bit<128> account_account;
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<64> orig_cl_ord_id;
    bit<64> order_id;
    bit<8> customer_or_firm;
    bit<8> open_close;
    bit<8> attributed_quote;
    bit<8> time_in_force;
    bit<8> cancel_instead_of_slide_cancel_instead_of_slide;
    bit<8> display_inst;
    bit<8> exec_inst;
    bit<8> ord_type;
    bit<32> target_party_id;
    bit<32> auction_id;
    bit<32> clearing_firm;
    bit<128> optional_data;
    bit<32> routing_firm_id;
    bit<24> aiq;
    bit<8> side;
    bit<64> price_price_8;
    bit<32> order_qty_quantity_non_zero;
    bit<32> leaves_qty;
    bit<64> effective_limit_price;
    bit<64> display_price;
    bit<8> reason_code;
    bit<8> ack_type;
    bit<8> throttle_indicator;
}

header unsolicited_modify_ack_message_t {
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> orig_cl_ord_id;
    bit<64> order_id;
    bit<64> price_price_8;
    bit<32> order_qty_quantity_non_zero;
    bit<32> leaves_qty;
    bit<64> effective_limit_price;
    bit<64> display_price;
    bit<8> restatement_reason;
    bit<8> reason_code;
    bit<8> ack_type;
}

header order_cancel_ack_message_t {
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> order_id;
    bit<64> price_price_8;
    bit<32> leaves_qty;
    bit<8> reason_code;
    bit<8> ack_type;
    bit<8> throttle_indicator;
}

header mass_cancel_ack_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_instrument_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<8> reason_code;
    bit<8> ack_style_mass_cancel_ack_style;
    bit<8> mpid_filter;
    bit<8> bulk_action;
    bit<32> cancel_count;
    bit<8> throttle_indicator;
}

header bulk_quote_ack_message_t {
    bit<64> transact_time;
    bit<32> market_participant_id;
    bit<16> custom_group_id_uint_16;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<24> aiq;
    bit<8> throttle_indicator;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
}

header bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_t {
    bit<32> instrument_id_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<8> ack_type;
    bit<32> price_price_4_optional;
    bit<32> order_qty_quantity_zero_optional;
    bit<8> reason_code;
}

header new_ioc_quote_ack_message_t {
    bit<64> transact_time;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<24> aiq;
    bit<32> instrument_id_instrument_id;
    bit<8> side;
    bit<64> order_id;
    bit<8> ack_type;
    bit<32> price_price_4;
    bit<32> order_qty_quantity_non_zero;
    bit<8> reason_code;
    bit<8> throttle_indicator;
}

header quote_restated_message_t {
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<8> side;
    bit<64> price_price_8;
    bit<8> reason_code;
    bit<8> ack_type;
    bit<32> delta;
}

header quote_canceled_message_t {
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<8> side;
    bit<8> reason_code;
    bit<8> ack_type;
    bit<32> delta;
}

header purge_ack_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<8> ack_style_purge_request_ack_style;
    bit<8> bulk_action;
    bit<32> cancel_count;
    bit<8> throttle_indicator;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
}

header purge_ack_message_purge_ack_message_custom_group_ids_group_t {
    bit<16> custom_group_id_uint_16;
}

header execution_report_message_t {
    bit<128> account_account;
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<8> customer_or_firm;
    bit<64> order_id;
    bit<64> exec_id;
    bit<64> trade_id;
    bit<64> last_px;
    bit<8> open_close;
    bit<8> side;
    bit<32> target_party_id;
    bit<32> auction_id;
    bit<32> clearing_firm;
    bit<128> optional_data;
    bit<32> routing_firm_id;
    bit<24> aiq;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> last_qty;
    bit<8> trade_liquidity_indicator;
    bit<16> fee_code;
    bit<8> reason_code;
    bit<40> occ_id;
    bit<32> contra_clearing_account;
    bit<32> contra_clearing_firm;
    bit<32> contra_mpid;
    bit<8> contra_open_close;
    bit<8> contra_customer_or_firm;
    bit<40> contra_occ_id;
}

header trade_bust_correct_message_t {
    bit<64> transact_time;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<64> exec_id;
    bit<64> trade_id;
    bit<64> trade_ref_id;
    bit<64> last_px;
    bit<128> account_account;
    bit<32> last_qty;
    bit<8> reason_code;
    bit<8> bust_or_correction;
}

header application_layer_reject_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_instrument_id;
    bit<32> instrument_id_instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<128> account_string_16;
    bit<8> reason_code;
    bit<8> reject_type;
    bit<8> throttle_indicator;
}

header risk_limit_update_request_message_t {
    bit<32> underlying_id_instrument_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<8> risk_control_risk_control_optional;
    bit<8> risk_control_status_risk_control_status_optional;
    bit<64> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> ioc_attribution;
    bit<8> cust_capacity_weight_uint_8_optional;
}

header risk_action_request_message_t {
    bit<32> underlying_id_instrument_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<8> risk_control_risk_control;
    bit<8> risk_action;
    bit<16> custom_group_id_uint_16_optional;
}

header underlying_ref_data_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_uint_32;
    bit<64> underlying_symbol;
    bit<32> mic;
    bit<8> mpv_group;
}

header instrument_ref_data_message_t {
    bit<64> transact_time;
    bit<32> instrument_id_uint_32;
    bit<32> underlying_id_uint_32;
    bit<168> osi_symbol;
    bit<64> maturity_date;
    bit<8> option_type;
    bit<64> strike_price;
    bit<8> closing_only;
    bit<8> orp_enabled;
    bit<8> trading_ring;
    bit<16> matching_unit;
}

header mpid_configuration_acknowledgement_message_t {
    bit<64> transact_time;
    bit<32> market_participant_id;
    bit<8> mpid_status;
    bit<64> member;
    bit<32> max_qty;
    bit<64> max_notional;
    bit<128> default_account;
    bit<128> default_optional_data;
    bit<32> default_clearing_account;
    bit<8> allow_market_orders;
    bit<8> allow_isoioc;
    bit<8> allow_iso_day;
    bit<32> max_duplicative;
}

header market_maker_symbol_appointment_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_instrument_id;
    bit<32> market_participant_id;
    bit<8> appointment_type;
    bit<8> appointment_status;
    bit<32> max_allowable_width;
    bit<32> quote_relief_mult;
}

header session_configuration_acknowledgement_message_t {
    bit<64> transact_time;
    bit<8> user_session_type;
    bit<8> user_session_status;
    bit<64> member;
    bit<32> default_mpid;
    bit<32> mic;
    bit<8> cancel_on_disconnect;
    bit<24> aiq_default;
    bit<8> order_unsolicited_ack_subscription;
    bit<8> quote_unsolicited_ack_subscription;
    bit<8> default_attributed_quote;
    bit<8> default_cancel_instead_of_slide;
    bit<8> trading_ring;
}

header risk_control_acknowledgment_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_instrument_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<16> custom_group_id_uint_16_optional;
    bit<8> risk_ack_type;
    bit<8> risk_control_status_risk_control_status;
    bit<8> risk_control_risk_control;
    bit<8> risk_action;
    bit<64> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> ioc_attribution;
    bit<8> blocked_by_breach_indicator;
    bit<8> cust_capacity_weight_uint_8;
    bit<8> throttle_indicator;
}

header risk_control_alert_message_t {
    bit<64> transact_time;
    bit<32> underlying_id_instrument_id_optional;
    bit<32> market_participant_id;
    bit<8> risk_control_risk_control;
    bit<64> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> notification_reason;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_remaining;
    bit<8> new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining;
    bit<8> purge_request_message_purge_request_message_custom_group_ids_group_remaining;
    bit<8> bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_remaining;
    bit<8> purge_ack_message_purge_ack_message_custom_group_ids_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    login_request_message_t login_request_message;
    login_response_message_t login_response_message;
    gateway_heartbeat_message_t gateway_heartbeat_message;
    gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_t gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group[MAX_MESSAGES];
    terminate_message_t terminate_message;
    sequenced_message_header_message_t sequenced_message_header_message;
    subsession_join_message_t subsession_join_message;
    subsession_join_response_message_t subsession_join_response_message;
    subsession_leave_message_t subsession_leave_message;
    subsession_leave_response_message_t subsession_leave_response_message;
    new_order_single_message_t new_order_single_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    new_bulk_quote_message_t new_bulk_quote_message;
    new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_t new_bulk_quote_message_new_bulk_quote_message_quote_updates_group[MAX_MESSAGES];
    mass_cancel_request_message_t mass_cancel_request_message;
    purge_request_message_t purge_request_message;
    purge_request_message_purge_request_message_custom_group_ids_group_t purge_request_message_purge_request_message_custom_group_ids_group[MAX_MESSAGES];
    order_ack_message_t order_ack_message;
    unsolicited_modify_ack_message_t unsolicited_modify_ack_message;
    order_cancel_ack_message_t order_cancel_ack_message;
    mass_cancel_ack_message_t mass_cancel_ack_message;
    bulk_quote_ack_message_t bulk_quote_ack_message;
    bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_t bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group[MAX_MESSAGES];
    new_ioc_quote_ack_message_t new_ioc_quote_ack_message;
    quote_restated_message_t quote_restated_message;
    quote_canceled_message_t quote_canceled_message;
    purge_ack_message_t purge_ack_message;
    purge_ack_message_purge_ack_message_custom_group_ids_group_t purge_ack_message_purge_ack_message_custom_group_ids_group[MAX_MESSAGES];
    execution_report_message_t execution_report_message;
    trade_bust_correct_message_t trade_bust_correct_message;
    application_layer_reject_message_t application_layer_reject_message;
    risk_limit_update_request_message_t risk_limit_update_request_message;
    risk_action_request_message_t risk_action_request_message;
    underlying_ref_data_message_t underlying_ref_data_message;
    instrument_ref_data_message_t instrument_ref_data_message;
    mpid_configuration_acknowledgement_message_t mpid_configuration_acknowledgement_message;
    market_maker_symbol_appointment_message_t market_maker_symbol_appointment_message;
    session_configuration_acknowledgement_message_t session_configuration_acknowledgement_message;
    risk_control_acknowledgment_message_t risk_control_acknowledgment_message;
    risk_control_alert_message_t risk_control_alert_message;
}

parser IexoptionsBinaryorderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.schema_id) {
            16w0x204e: parse_session_message;
            16w0x214e: parse_business_message;
            default: accept;
        }
    }

    state parse_session_message {
        meta.dispatched = 1;
        transition select(hdr.message_header.template_id) {
            16w0x100: parse_login_request_message;
            16w0x200: parse_login_response_message;
            16w0x300: parse_gateway_heartbeat_message;
            16w0x400: parse_client_heartbeat_message;
            16w0x500: parse_logout_request_message;
            16w0x600: parse_terminate_message;
            16w0x700: parse_sequenced_message_header_message;
            16w0x800: parse_subsession_join_message;
            16w0x900: parse_subsession_join_response_message;
            16w0xa00: parse_subsession_leave_message;
            16w0xb00: parse_subsession_leave_response_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_heartbeat_message {
        packet.extract(hdr.gateway_heartbeat_message);
        meta.dispatched = 1;
        meta.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_remaining = hdr.gateway_heartbeat_message.num_in_group;
        transition select(meta.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_remaining) {
            8w0: accept;
            default: parse_gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group;
        }
    }

    state parse_gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group {
        packet.extract(hdr.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group.next);
        meta.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_remaining = meta.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_remaining - 1;
        transition select(meta.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group_remaining) {
            8w0: accept;
            default: parse_gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group;
        }
    }

    state parse_client_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_terminate_message {
        packet.extract(hdr.terminate_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_message_header_message {
        packet.extract(hdr.sequenced_message_header_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subsession_join_message {
        packet.extract(hdr.subsession_join_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subsession_join_response_message {
        packet.extract(hdr.subsession_join_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subsession_leave_message {
        packet.extract(hdr.subsession_leave_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subsession_leave_response_message {
        packet.extract(hdr.subsession_leave_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_business_message {
        meta.dispatched = 1;
        transition select(hdr.message_header.template_id) {
            16w0x100: parse_new_order_single_message;
            16w0x200: parse_order_cancel_replace_request_message;
            16w0x300: parse_order_cancel_request_message;
            16w0x400: parse_new_bulk_quote_message;
            16w0x500: parse_mass_cancel_request_message;
            16w0x600: parse_purge_request_message;
            16w0x6500: parse_order_ack_message;
            16w0x6600: parse_unsolicited_modify_ack_message;
            16w0x6700: parse_order_cancel_ack_message;
            16w0x6800: parse_mass_cancel_ack_message;
            16w0x6900: parse_bulk_quote_ack_message;
            16w0x6a00: parse_new_ioc_quote_ack_message;
            16w0x6b00: parse_quote_restated_message;
            16w0x6c00: parse_quote_canceled_message;
            16w0x6d00: parse_purge_ack_message;
            16w0x6e00: parse_execution_report_message;
            16w0x6f00: parse_trade_bust_correct_message;
            16w0x7000: parse_application_layer_reject_message;
            16w0x3300: parse_risk_limit_update_request_message;
            16w0x3400: parse_risk_action_request_message;
            16w0x9700: parse_underlying_ref_data_message;
            16w0x9800: parse_instrument_ref_data_message;
            16w0x9900: parse_mpid_configuration_acknowledgement_message;
            16w0x9a00: parse_market_maker_symbol_appointment_message;
            16w0x9b00: parse_session_configuration_acknowledgement_message;
            16w0x9c00: parse_risk_control_acknowledgment_message;
            16w0x9d00: parse_risk_control_alert_message;
            default: accept;
        }
    }

    state parse_new_order_single_message {
        packet.extract(hdr.new_order_single_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_replace_request_message {
        packet.extract(hdr.order_cancel_replace_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_bulk_quote_message {
        packet.extract(hdr.new_bulk_quote_message);
        meta.dispatched = 1;
        meta.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining = hdr.new_bulk_quote_message.num_in_group;
        transition select(meta.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining) {
            8w0: accept;
            default: parse_new_bulk_quote_message_new_bulk_quote_message_quote_updates_group;
        }
    }

    state parse_new_bulk_quote_message_new_bulk_quote_message_quote_updates_group {
        packet.extract(hdr.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group.next);
        meta.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining = meta.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining - 1;
        transition select(meta.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining) {
            8w0: accept;
            default: parse_new_bulk_quote_message_new_bulk_quote_message_quote_updates_group;
        }
    }

    state parse_mass_cancel_request_message {
        packet.extract(hdr.mass_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_purge_request_message {
        packet.extract(hdr.purge_request_message);
        meta.dispatched = 1;
        meta.purge_request_message_purge_request_message_custom_group_ids_group_remaining = hdr.purge_request_message.num_in_group;
        transition select(meta.purge_request_message_purge_request_message_custom_group_ids_group_remaining) {
            8w0: accept;
            default: parse_purge_request_message_purge_request_message_custom_group_ids_group;
        }
    }

    state parse_purge_request_message_purge_request_message_custom_group_ids_group {
        packet.extract(hdr.purge_request_message_purge_request_message_custom_group_ids_group.next);
        meta.purge_request_message_purge_request_message_custom_group_ids_group_remaining = meta.purge_request_message_purge_request_message_custom_group_ids_group_remaining - 1;
        transition select(meta.purge_request_message_purge_request_message_custom_group_ids_group_remaining) {
            8w0: accept;
            default: parse_purge_request_message_purge_request_message_custom_group_ids_group;
        }
    }

    state parse_order_ack_message {
        packet.extract(hdr.order_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsolicited_modify_ack_message {
        packet.extract(hdr.unsolicited_modify_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_ack_message {
        packet.extract(hdr.order_cancel_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_ack_message {
        packet.extract(hdr.mass_cancel_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bulk_quote_ack_message {
        packet.extract(hdr.bulk_quote_ack_message);
        meta.dispatched = 1;
        meta.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_remaining = hdr.bulk_quote_ack_message.num_in_group;
        transition select(meta.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_remaining) {
            8w0: accept;
            default: parse_bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group;
        }
    }

    state parse_bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group {
        packet.extract(hdr.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group.next);
        meta.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_remaining = meta.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_remaining - 1;
        transition select(meta.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group_remaining) {
            8w0: accept;
            default: parse_bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group;
        }
    }

    state parse_new_ioc_quote_ack_message {
        packet.extract(hdr.new_ioc_quote_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_restated_message {
        packet.extract(hdr.quote_restated_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_canceled_message {
        packet.extract(hdr.quote_canceled_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_purge_ack_message {
        packet.extract(hdr.purge_ack_message);
        meta.dispatched = 1;
        meta.purge_ack_message_purge_ack_message_custom_group_ids_group_remaining = hdr.purge_ack_message.num_in_group;
        transition select(meta.purge_ack_message_purge_ack_message_custom_group_ids_group_remaining) {
            8w0: accept;
            default: parse_purge_ack_message_purge_ack_message_custom_group_ids_group;
        }
    }

    state parse_purge_ack_message_purge_ack_message_custom_group_ids_group {
        packet.extract(hdr.purge_ack_message_purge_ack_message_custom_group_ids_group.next);
        meta.purge_ack_message_purge_ack_message_custom_group_ids_group_remaining = meta.purge_ack_message_purge_ack_message_custom_group_ids_group_remaining - 1;
        transition select(meta.purge_ack_message_purge_ack_message_custom_group_ids_group_remaining) {
            8w0: accept;
            default: parse_purge_ack_message_purge_ack_message_custom_group_ids_group;
        }
    }

    state parse_execution_report_message {
        packet.extract(hdr.execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_bust_correct_message {
        packet.extract(hdr.trade_bust_correct_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_application_layer_reject_message {
        packet.extract(hdr.application_layer_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_risk_limit_update_request_message {
        packet.extract(hdr.risk_limit_update_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_risk_action_request_message {
        packet.extract(hdr.risk_action_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_underlying_ref_data_message {
        packet.extract(hdr.underlying_ref_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_ref_data_message {
        packet.extract(hdr.instrument_ref_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mpid_configuration_acknowledgement_message {
        packet.extract(hdr.mpid_configuration_acknowledgement_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_maker_symbol_appointment_message {
        packet.extract(hdr.market_maker_symbol_appointment_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_configuration_acknowledgement_message {
        packet.extract(hdr.session_configuration_acknowledgement_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_risk_control_acknowledgment_message {
        packet.extract(hdr.risk_control_acknowledgment_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_risk_control_alert_message {
        packet.extract(hdr.risk_control_alert_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control IexoptionsBinaryorderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsBinaryorderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IexoptionsBinaryorderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IexoptionsBinaryorderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsBinaryorderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.login_response_message);
        packet.emit(hdr.gateway_heartbeat_message);
        packet.emit(hdr.gateway_heartbeat_message_gateway_heartbeat_message_sub_sessions_group);
        packet.emit(hdr.terminate_message);
        packet.emit(hdr.sequenced_message_header_message);
        packet.emit(hdr.subsession_join_message);
        packet.emit(hdr.subsession_join_response_message);
        packet.emit(hdr.subsession_leave_message);
        packet.emit(hdr.subsession_leave_response_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.new_bulk_quote_message);
        packet.emit(hdr.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group);
        packet.emit(hdr.mass_cancel_request_message);
        packet.emit(hdr.purge_request_message);
        packet.emit(hdr.purge_request_message_purge_request_message_custom_group_ids_group);
        packet.emit(hdr.order_ack_message);
        packet.emit(hdr.unsolicited_modify_ack_message);
        packet.emit(hdr.order_cancel_ack_message);
        packet.emit(hdr.mass_cancel_ack_message);
        packet.emit(hdr.bulk_quote_ack_message);
        packet.emit(hdr.bulk_quote_ack_message_bulk_quote_ack_message_quote_acks_group);
        packet.emit(hdr.new_ioc_quote_ack_message);
        packet.emit(hdr.quote_restated_message);
        packet.emit(hdr.quote_canceled_message);
        packet.emit(hdr.purge_ack_message);
        packet.emit(hdr.purge_ack_message_purge_ack_message_custom_group_ids_group);
        packet.emit(hdr.execution_report_message);
        packet.emit(hdr.trade_bust_correct_message);
        packet.emit(hdr.application_layer_reject_message);
        packet.emit(hdr.risk_limit_update_request_message);
        packet.emit(hdr.risk_action_request_message);
        packet.emit(hdr.underlying_ref_data_message);
        packet.emit(hdr.instrument_ref_data_message);
        packet.emit(hdr.mpid_configuration_acknowledgement_message);
        packet.emit(hdr.market_maker_symbol_appointment_message);
        packet.emit(hdr.session_configuration_acknowledgement_message);
        packet.emit(hdr.risk_control_acknowledgment_message);
        packet.emit(hdr.risk_control_alert_message);
    }
}

V1Switch(
    IexoptionsBinaryorderentryParser(),
    IexoptionsBinaryorderentryVerifyChecksum(),
    IexoptionsBinaryorderentryIngress(),
    IexoptionsBinaryorderentryEgress(),
    IexoptionsBinaryorderentryComputeChecksum(),
    IexoptionsBinaryorderentryDeparser()
) main;
