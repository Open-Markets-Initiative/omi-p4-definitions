// P4_16 (v1model) definition for: Memx MemxOptions Memo Sbe v1.5.b
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Members Orders
//   Encoding: Simple Binary Encoding
//   Version: 1.5.b
//   Date: 2/2/2024
//   Specification: MEMO SBE for Options-v1_5b
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

header common_header_t {
    bit<8> message_type;
    bit<16> message_length;
}

header login_accepted_message_t {
    bit<8> supported_request_mode;
}

header login_rejected_message_t {
    bit<8> login_reject_code;
}

header start_of_session_message_t {
    bit<64> session_id;
}

header replay_begin_message_t {
    bit<64> next_sequence_number;
    bit<32> pending_message_count;
}

header replay_rejected_message_t {
    bit<8> replay_reject_code;
}

header replay_complete_message_t {
    bit<64> message_count;
}

header stream_begin_message_t {
    bit<64> next_sequence_number;
    bit<64> max_sequence_number;
}

header stream_rejected_message_t {
    bit<8> stream_reject_code;
}

header stream_complete_message_t {
    bit<64> total_sequence_count;
}

header sequenced_message_t {
    bit<16> block_length;
    bit<8> template_id;
    bit<8> schema_id;
    bit<16> version;
}

header new_order_single_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<64> security_id;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price_optional;
    bit<8> time_in_force;
    bit<8> position_effect_optional;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<8> reprice_frequency;
    bit<8> reprice_behavior;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
}

header short_two_sided_bulk_quote_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<8> time_in_force;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<8> list_seq_no;
    bit<64> security_id;
    bit<16> bid_size;
    bit<16> bid_px;
    bit<16> offer_size;
    bit<16> offer_px;
}

header long_two_sided_bulk_quote_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<8> time_in_force;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<8> list_seq_no;
    bit<64> security_id;
    bit<16> bid_size;
    bit<16> bid_px;
    bit<16> offer_size;
    bit<16> offer_px;
}

header short_one_sided_bulk_quote_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<8> time_in_force;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<8> list_seq_no;
    bit<64> security_id;
    bit<8> side;
    bit<16> quantity;
    bit<16> price_short;
}

header long_one_sided_bulk_quote_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<8> time_in_force;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<8> list_seq_no;
    bit<64> security_id;
    bit<8> side;
    bit<16> quantity;
    bit<16> price_short;
}

header order_cancel_replace_request_message_t {
    bit<64> sending_time;
    bit<64> order_id_optional;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<160> origclordid;
    bit<64> security_id;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price_optional;
}

header order_cancel_request_message_t {
    bit<64> sending_time;
    bit<64> order_id_optional;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<160> origclordid_optional;
    bit<64> security_id;
    bit<8> side_optional;
}

header mass_cancel_request_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<32> efid_optional;
    bit<8> underlying_or_series;
    bit<48> underlier;
    bit<64> options_security_id_optional;
    bit<16> cancel_group_id;
    bit<1> lockout;
    bit<1> send_cancels;
    bit<1> cancel_orders_from_this_port_only;
    bit<5> reserved_5;
}

header mass_cancel_clear_lockout_request_message_t {
    bit<64> sending_time;
    bit<160> clordid;
    bit<64> lockout_id;
}

header allocation_instruction_message_t {
    bit<64> sending_time;
    bit<160> alloc_id;
    bit<8> alloc_type;
    bit<8> alloc_trans_type;
    bit<160> ref_alloc_id_optional;
    bit<64> security_id;
    bit<8> side;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<64> trade_id;
    bit<32> last_qty;
    bit<64> last_px;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<32> alloc_qty;
    bit<8> alloc_position_effect;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
    bit<128> nested_party_id;
    bit<8> nested_party_id_source;
    bit<8> nested_party_role;
}

header execution_report_new_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price_optional;
    bit<8> time_in_force;
    bit<8> position_effect_optional;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<8> reprice_frequency;
    bit<8> reprice_behavior;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
    bit<64> transact_time;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
}

header execution_report_bulk_quote_pending_new_message_t {
    bit<160> clordid;
    bit<48> symbol;
    bit<8> time_in_force;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<8> trading_capacity;
    bit<64> sending_time;
    bit<64> transact_time;
    bit<16> mtp_group_id;
    bit<8> match_trade_prevention;
    bit<16> cancel_group_id;
    bit<16> risk_group_id;
    bit<8> number_of_orders;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
}

header execution_report_bulk_quote_component_new_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> side;
    bit<32> order_qty;
    bit<64> price_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
    bit<64> transact_time;
}

header execution_report_rejected_message_t {
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<16> order_reject_reason;
    bit<64> security_id;
    bit<8> side;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
}

header execution_report_trade_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<64> trd_match_id;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> side;
    bit<32> last_qty;
    bit<64> last_px;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
    bit<64> transact_time;
    bit<8> last_liquidity_ind;
    bit<32> last_mkt;
    bit<8> position_effect;
    bit<8> trading_capacity;
    bit<8> contra_trading_capacity;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<128> party_id;
    bit<8> party_id_source;
    bit<8> party_role;
}

header execution_report_pending_cancel_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<160> origclordid;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> side_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
}

header execution_report_canceled_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<160> origclordid_optional;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<8> cancel_reason;
    bit<64> security_id;
    bit<8> side_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
    bit<64> transact_time;
}

header execution_report_pending_replace_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<160> origclordid;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
}

header execution_report_replaced_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<160> origclordid;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
    bit<64> transact_time;
}

header execution_report_trade_correction_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<64> trd_match_id;
    bit<64> exec_id;
    bit<64> exec_ref_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<32> last_qty;
    bit<64> last_px;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
}

header execution_report_trade_break_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<64> trd_match_id;
    bit<64> exec_id;
    bit<64> exec_ref_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
}

header execution_report_restatement_message_t {
    bit<64> order_id;
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> security_id;
    bit<8> exec_restatement_reason;
    bit<8> extended_restatement_reason;
    bit<8> side;
    bit<64> last_px;
    bit<32> last_qty_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> sending_time;
    bit<64> transact_time;
}

header pending_mass_cancel_message_t {
    bit<160> clordid;
    bit<1> lockout;
    bit<1> send_cancels;
    bit<1> cancel_orders_from_this_port_only;
    bit<5> reserved_5;
    bit<64> lockout_id_optional;
    bit<32> efid_optional;
    bit<8> underlying_or_series;
    bit<48> underlier;
    bit<64> options_security_id_optional;
    bit<16> cancel_group_id;
    bit<64> sending_time;
}

header mass_cancel_reject_message_t {
    bit<160> clordid;
    bit<16> mass_cancel_reject_reason;
    bit<32> efid_optional;
    bit<8> underlying_or_series_optional;
    bit<48> underlier_optional;
    bit<64> options_security_id_optional;
    bit<16> cancel_group_id;
    bit<1> lockout;
    bit<1> send_cancels;
    bit<1> cancel_orders_from_this_port_only;
    bit<5> reserved_5;
    bit<64> sending_time;
}

header mass_cancel_done_message_t {
    bit<160> clordid;
    bit<32> total_affected_orders;
    bit<64> sending_time;
}

header order_cancel_reject_message_t {
    bit<160> clordid;
    bit<8> list_seq_no;
    bit<8> cxl_rej_response_to;
    bit<16> cxl_rej_reason;
    bit<64> options_security_id_optional;
    bit<8> side_optional;
    bit<64> sending_time;
}

header allocation_instruction_ack_message_t {
    bit<64> sending_time;
    bit<160> alloc_id;
    bit<8> alloc_type;
    bit<8> alloc_trans_type;
    bit<160> secondary_alloc_id;
    bit<160> ref_alloc_id_optional;
    bit<8> alloc_status;
    bit<16> alloc_rej_code;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<32> alloc_qty;
    bit<8> alloc_position_effect;
    bit<160> alloc_id_2;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<128> nested_party_id;
    bit<8> nested_party_id_source;
    bit<8> nested_party_role;
}

header allocation_instruction_alert_message_t {
    bit<64> sending_time;
    bit<160> alloc_id;
    bit<8> alloc_type;
    bit<8> alloc_trans_type;
    bit<160> ref_alloc_id_optional;
    bit<16> alloc_canc_replace_reason;
    bit<8> side;
    bit<64> security_id;
    bit<64> trade_date;
    bit<8> block_length_short;
    bit<8> num_in_group;
    bit<64> trade_id;
    bit<32> last_qty;
    bit<64> last_px;
    bit<8> block_length_short_2;
    bit<8> num_in_group_2;
    bit<32> alloc_qty;
    bit<8> alloc_position_effect;
    bit<160> alloc_id_2;
    bit<8> block_length_short_3;
    bit<8> num_in_group_3;
    bit<128> nested_party_id;
    bit<8> nested_party_id_source;
    bit<8> nested_party_role;
}

header user_notification_message_t {
    bit<64> sending_time;
    bit<8> user_status;
}

header mass_cancel_clear_lockout_reject_message_t {
    bit<160> clordid;
    bit<64> lockout_id;
    bit<16> rej_reason;
    bit<64> sending_time;
}

header mass_cancel_clear_lockout_done_message_t {
    bit<160> clordid;
    bit<64> lockout_id;
    bit<64> sending_time;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    login_accepted_message_t login_accepted_message;
    login_rejected_message_t login_rejected_message;
    start_of_session_message_t start_of_session_message;
    replay_begin_message_t replay_begin_message;
    replay_rejected_message_t replay_rejected_message;
    replay_complete_message_t replay_complete_message;
    stream_begin_message_t stream_begin_message;
    stream_rejected_message_t stream_rejected_message;
    stream_complete_message_t stream_complete_message;
    sequenced_message_t sequenced_message;
    new_order_single_message_t new_order_single_message;
    short_two_sided_bulk_quote_message_t short_two_sided_bulk_quote_message;
    long_two_sided_bulk_quote_message_t long_two_sided_bulk_quote_message;
    short_one_sided_bulk_quote_message_t short_one_sided_bulk_quote_message;
    long_one_sided_bulk_quote_message_t long_one_sided_bulk_quote_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    mass_cancel_request_message_t mass_cancel_request_message;
    mass_cancel_clear_lockout_request_message_t mass_cancel_clear_lockout_request_message;
    allocation_instruction_message_t allocation_instruction_message;
    execution_report_new_message_t execution_report_new_message;
    execution_report_bulk_quote_pending_new_message_t execution_report_bulk_quote_pending_new_message;
    execution_report_bulk_quote_component_new_message_t execution_report_bulk_quote_component_new_message;
    execution_report_rejected_message_t execution_report_rejected_message;
    execution_report_trade_message_t execution_report_trade_message;
    execution_report_pending_cancel_message_t execution_report_pending_cancel_message;
    execution_report_canceled_message_t execution_report_canceled_message;
    execution_report_pending_replace_message_t execution_report_pending_replace_message;
    execution_report_replaced_message_t execution_report_replaced_message;
    execution_report_trade_correction_message_t execution_report_trade_correction_message;
    execution_report_trade_break_message_t execution_report_trade_break_message;
    execution_report_restatement_message_t execution_report_restatement_message;
    pending_mass_cancel_message_t pending_mass_cancel_message;
    mass_cancel_reject_message_t mass_cancel_reject_message;
    mass_cancel_done_message_t mass_cancel_done_message;
    order_cancel_reject_message_t order_cancel_reject_message;
    allocation_instruction_ack_message_t allocation_instruction_ack_message;
    allocation_instruction_alert_message_t allocation_instruction_alert_message;
    user_notification_message_t user_notification_message;
    mass_cancel_clear_lockout_reject_message_t mass_cancel_clear_lockout_reject_message;
    mass_cancel_clear_lockout_done_message_t mass_cancel_clear_lockout_done_message;
}

parser MemxoptionsMemoServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w1: parse_login_accepted_message;
            8w2: parse_login_rejected_message;
            8w3: parse_start_of_session_message;
            8w5: parse_replay_begin_message;
            8w6: parse_replay_rejected_message;
            8w7: parse_replay_complete_message;
            8w8: parse_stream_begin_message;
            8w9: parse_stream_rejected_message;
            8w10: parse_stream_complete_message;
            8w11: parse_sequenced_message;
            default: accept;
        }
    }

    state parse_login_accepted_message {
        packet.extract(hdr.login_accepted_message);
        transition accept;
    }

    state parse_login_rejected_message {
        packet.extract(hdr.login_rejected_message);
        transition accept;
    }

    state parse_start_of_session_message {
        packet.extract(hdr.start_of_session_message);
        transition accept;
    }

    state parse_replay_begin_message {
        packet.extract(hdr.replay_begin_message);
        transition accept;
    }

    state parse_replay_rejected_message {
        packet.extract(hdr.replay_rejected_message);
        transition accept;
    }

    state parse_replay_complete_message {
        packet.extract(hdr.replay_complete_message);
        transition accept;
    }

    state parse_stream_begin_message {
        packet.extract(hdr.stream_begin_message);
        transition accept;
    }

    state parse_stream_rejected_message {
        packet.extract(hdr.stream_rejected_message);
        transition accept;
    }

    state parse_stream_complete_message {
        packet.extract(hdr.stream_complete_message);
        transition accept;
    }

    state parse_sequenced_message {
        packet.extract(hdr.sequenced_message);
        transition select(hdr.sequenced_message.template_id) {
            8w1: parse_new_order_single_message;
            8w2: parse_short_two_sided_bulk_quote_message;
            8w3: parse_long_two_sided_bulk_quote_message;
            8w4: parse_short_one_sided_bulk_quote_message;
            8w5: parse_long_one_sided_bulk_quote_message;
            8w6: parse_order_cancel_replace_request_message;
            8w7: parse_order_cancel_request_message;
            8w8: parse_mass_cancel_request_message;
            8w9: parse_mass_cancel_clear_lockout_request_message;
            8w10: parse_allocation_instruction_message;
            8w11: parse_execution_report_new_message;
            8w12: parse_execution_report_bulk_quote_pending_new_message;
            8w13: parse_execution_report_bulk_quote_component_new_message;
            8w14: parse_execution_report_rejected_message;
            8w15: parse_execution_report_trade_message;
            8w16: parse_execution_report_pending_cancel_message;
            8w17: parse_execution_report_canceled_message;
            8w18: parse_execution_report_pending_replace_message;
            8w19: parse_execution_report_replaced_message;
            8w20: parse_execution_report_trade_correction_message;
            8w21: parse_execution_report_trade_break_message;
            8w22: parse_execution_report_restatement_message;
            8w23: parse_pending_mass_cancel_message;
            8w24: parse_mass_cancel_reject_message;
            8w25: parse_mass_cancel_done_message;
            8w26: parse_order_cancel_reject_message;
            8w27: parse_allocation_instruction_ack_message;
            8w28: parse_allocation_instruction_alert_message;
            8w29: parse_user_notification_message;
            8w30: parse_mass_cancel_clear_lockout_reject_message;
            8w31: parse_mass_cancel_clear_lockout_done_message;
            default: accept;
        }
    }

    state parse_new_order_single_message {
        packet.extract(hdr.new_order_single_message);
        transition accept;
    }

    state parse_short_two_sided_bulk_quote_message {
        packet.extract(hdr.short_two_sided_bulk_quote_message);
        transition accept;
    }

    state parse_long_two_sided_bulk_quote_message {
        packet.extract(hdr.long_two_sided_bulk_quote_message);
        transition accept;
    }

    state parse_short_one_sided_bulk_quote_message {
        packet.extract(hdr.short_one_sided_bulk_quote_message);
        transition accept;
    }

    state parse_long_one_sided_bulk_quote_message {
        packet.extract(hdr.long_one_sided_bulk_quote_message);
        transition accept;
    }

    state parse_order_cancel_replace_request_message {
        packet.extract(hdr.order_cancel_replace_request_message);
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        transition accept;
    }

    state parse_mass_cancel_request_message {
        packet.extract(hdr.mass_cancel_request_message);
        transition accept;
    }

    state parse_mass_cancel_clear_lockout_request_message {
        packet.extract(hdr.mass_cancel_clear_lockout_request_message);
        transition accept;
    }

    state parse_allocation_instruction_message {
        packet.extract(hdr.allocation_instruction_message);
        transition accept;
    }

    state parse_execution_report_new_message {
        packet.extract(hdr.execution_report_new_message);
        transition accept;
    }

    state parse_execution_report_bulk_quote_pending_new_message {
        packet.extract(hdr.execution_report_bulk_quote_pending_new_message);
        transition accept;
    }

    state parse_execution_report_bulk_quote_component_new_message {
        packet.extract(hdr.execution_report_bulk_quote_component_new_message);
        transition accept;
    }

    state parse_execution_report_rejected_message {
        packet.extract(hdr.execution_report_rejected_message);
        transition accept;
    }

    state parse_execution_report_trade_message {
        packet.extract(hdr.execution_report_trade_message);
        transition accept;
    }

    state parse_execution_report_pending_cancel_message {
        packet.extract(hdr.execution_report_pending_cancel_message);
        transition accept;
    }

    state parse_execution_report_canceled_message {
        packet.extract(hdr.execution_report_canceled_message);
        transition accept;
    }

    state parse_execution_report_pending_replace_message {
        packet.extract(hdr.execution_report_pending_replace_message);
        transition accept;
    }

    state parse_execution_report_replaced_message {
        packet.extract(hdr.execution_report_replaced_message);
        transition accept;
    }

    state parse_execution_report_trade_correction_message {
        packet.extract(hdr.execution_report_trade_correction_message);
        transition accept;
    }

    state parse_execution_report_trade_break_message {
        packet.extract(hdr.execution_report_trade_break_message);
        transition accept;
    }

    state parse_execution_report_restatement_message {
        packet.extract(hdr.execution_report_restatement_message);
        transition accept;
    }

    state parse_pending_mass_cancel_message {
        packet.extract(hdr.pending_mass_cancel_message);
        transition accept;
    }

    state parse_mass_cancel_reject_message {
        packet.extract(hdr.mass_cancel_reject_message);
        transition accept;
    }

    state parse_mass_cancel_done_message {
        packet.extract(hdr.mass_cancel_done_message);
        transition accept;
    }

    state parse_order_cancel_reject_message {
        packet.extract(hdr.order_cancel_reject_message);
        transition accept;
    }

    state parse_allocation_instruction_ack_message {
        packet.extract(hdr.allocation_instruction_ack_message);
        transition accept;
    }

    state parse_allocation_instruction_alert_message {
        packet.extract(hdr.allocation_instruction_alert_message);
        transition accept;
    }

    state parse_user_notification_message {
        packet.extract(hdr.user_notification_message);
        transition accept;
    }

    state parse_mass_cancel_clear_lockout_reject_message {
        packet.extract(hdr.mass_cancel_clear_lockout_reject_message);
        transition accept;
    }

    state parse_mass_cancel_clear_lockout_done_message {
        packet.extract(hdr.mass_cancel_clear_lockout_done_message);
        transition accept;
    }

}

control MemxoptionsMemoServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxoptionsMemoServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxoptionsMemoServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_accepted_message);
        packet.emit(hdr.login_rejected_message);
        packet.emit(hdr.start_of_session_message);
        packet.emit(hdr.replay_begin_message);
        packet.emit(hdr.replay_rejected_message);
        packet.emit(hdr.replay_complete_message);
        packet.emit(hdr.stream_begin_message);
        packet.emit(hdr.stream_rejected_message);
        packet.emit(hdr.stream_complete_message);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.short_two_sided_bulk_quote_message);
        packet.emit(hdr.long_two_sided_bulk_quote_message);
        packet.emit(hdr.short_one_sided_bulk_quote_message);
        packet.emit(hdr.long_one_sided_bulk_quote_message);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.mass_cancel_request_message);
        packet.emit(hdr.mass_cancel_clear_lockout_request_message);
        packet.emit(hdr.allocation_instruction_message);
        packet.emit(hdr.execution_report_new_message);
        packet.emit(hdr.execution_report_bulk_quote_pending_new_message);
        packet.emit(hdr.execution_report_bulk_quote_component_new_message);
        packet.emit(hdr.execution_report_rejected_message);
        packet.emit(hdr.execution_report_trade_message);
        packet.emit(hdr.execution_report_pending_cancel_message);
        packet.emit(hdr.execution_report_canceled_message);
        packet.emit(hdr.execution_report_pending_replace_message);
        packet.emit(hdr.execution_report_replaced_message);
        packet.emit(hdr.execution_report_trade_correction_message);
        packet.emit(hdr.execution_report_trade_break_message);
        packet.emit(hdr.execution_report_restatement_message);
        packet.emit(hdr.pending_mass_cancel_message);
        packet.emit(hdr.mass_cancel_reject_message);
        packet.emit(hdr.mass_cancel_done_message);
        packet.emit(hdr.order_cancel_reject_message);
        packet.emit(hdr.allocation_instruction_ack_message);
        packet.emit(hdr.allocation_instruction_alert_message);
        packet.emit(hdr.user_notification_message);
        packet.emit(hdr.mass_cancel_clear_lockout_reject_message);
        packet.emit(hdr.mass_cancel_clear_lockout_done_message);
    }
}

V1Switch(
    MemxoptionsMemoServerParser(),
    MemxoptionsMemoServerVerifyChecksum(),
    MemxoptionsMemoServerIngress(),
    MemxoptionsMemoServerEgress(),
    MemxoptionsMemoServerComputeChecksum(),
    MemxoptionsMemoServerDeparser()
) main;
