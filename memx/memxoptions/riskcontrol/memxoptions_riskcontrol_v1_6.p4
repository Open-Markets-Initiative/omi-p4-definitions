// P4_16 (v1model) definition for: Memx MemxOptions RiskControl Sbe v1.6
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Risk Control
//   Encoding: Simple Binary Encoding
//   Version: 1.6
//   Date: 11/15/23
//   Specification: Risk Control for US Options SBE-v1_6.pdf
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

header common_header_t {
    bit<8> message_type;
    bit<16> message_length;
}

header login_request_message_t {
    bit<8> token_type;
    bit<8> token;
}

header replay_request_message_t {
    bit<64> session_id;
    bit<64> next_sequence_number;
    bit<32> count;
}

header replay_all_request_message_t {
    bit<64> session_id;
}

header stream_request_message_t {
    bit<64> session_id;
    bit<64> next_sequence_number;
}

header unsequenced_message_t {
    bit<16> block_length;
    bit<8> template_id;
    bit<8> schema_id;
    bit<16> version;
}

header risk_settings_query_message_t {
    bit<160> clordid;
}

header active_risk_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<32> threshold_quantity;
}

header active_risk_acknowledgement_req_message_t {
    bit<160> clordid;
    bit<48> underlier;
    bit<32> efid;
    bit<32> quantity;
}

header cp_volume_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> volume;
    bit<32> period_in_milli_seconds;
}

header cp_executed_notional_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
    bit<32> period_in_milli_seconds;
}

header cp_total_executions_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> total_executions;
    bit<32> period_in_milli_seconds;
}

header cp_percent_outstanding_contracts_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<32> percent;
    bit<32> period_in_milli_seconds;
}

header cp_breach_count_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> count;
    bit<32> period_in_milli_seconds;
}

header manual_cp_breach_trigger_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<8> send_cancels;
}

header cp_clear_breach_req_message_t {
    bit<160> clordid;
    bit<64> breach_id_optional;
}

header single_order_allow_iso_orders_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_iso_orders;
}

header single_order_allow_orders_in_crossed_market_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_orders;
}

header single_order_max_notional_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> max_notional_in_dollars;
}

header single_order_max_contracts_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> max_contracts;
}

header cp_gross_notional_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_market_order_gross_notional_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_net_notional_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_market_order_net_notional_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_duplicate_order_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> max_dup_orders;
    bit<8> use_order_price_in_dup_check_optional;
    bit<32> period_in_milli_seconds;
}

header cp_order_rate_threshold_change_req_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> max_order_msgs;
    bit<32> period_in_milli_seconds;
}

header active_risk_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier;
    bit<32> efid;
    bit<32> threshold_quantity;
    bit<32> unacked_quantity;
}

header active_risk_threshold_change_rej_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<32> threshold_quantity;
    bit<16> reject_reason;
}

header active_risk_acknowledged_message_t {
    bit<160> clordid;
    bit<48> underlier;
    bit<32> efid;
    bit<32> quantity;
    bit<32> unacked_quantity;
}

header active_risk_acknowledge_rej_message_t {
    bit<160> clordid;
    bit<48> underlier;
    bit<32> efid;
    bit<32> threshold_quantity;
    bit<16> reject_reason;
}

header active_risk_quantity_update_notification_message_t {
    bit<64> sending_time;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> trd_match_id;
    bit<32> efid;
    bit<48> underlier;
    bit<64> option_security_id;
    bit<8> side;
    bit<64> last_px;
    bit<32> last_qty;
    bit<32> unacked_quantity;
}

header cp_volume_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> volume;
    bit<32> period_in_milli_seconds;
}

header cp_executed_notional_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
    bit<32> period_in_milli_seconds;
}

header cp_total_executions_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> total_executions;
    bit<32> period_in_milli_seconds;
}

header cp_percent_outstanding_contracts_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<32> percent;
    bit<32> period_in_milli_seconds;
}

header cp_breach_count_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> count;
    bit<32> period_in_milli_seconds;
}

header manual_cp_breach_trigger_pending_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> breach_id;
}

header manual_cp_breach_trigger_done_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> breach_id;
    bit<32> total_affected_orders;
}

header risk_threshold_update_rej_message_t {
    bit<160> clordid;
    bit<8> risk_type;
    bit<16> reject_reason;
}

header passive_risk_threshold_notification_message_t {
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<8> rule_type;
    bit<8> latest_percentage;
    bit<64> breach_id_optional;
    bit<64> transact_time;
}

header single_order_allow_iso_orders_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_iso_orders;
}

header single_order_allow_orders_in_crossed_market_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_orders;
}

header single_order_max_notional_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> max_notional_in_dollars;
}

header single_order_max_contracts_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> max_contracts;
}

header risk_settings_query_done_message_t {
    bit<160> clordid;
    bit<32> number_msgs_sent;
}

header risk_settings_query_rej_message_t {
    bit<160> clordid;
    bit<16> reject_reason;
}

header manual_cp_breach_trigger_rej_message_t {
    bit<160> clordid;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<16> reject_reason;
}

header breach_clear_rej_message_t {
    bit<160> clordid;
    bit<64> breach_id_optional;
    bit<16> reject_reason;
}

header breach_cleared_message_t {
    bit<160> clordid_optional;
    bit<64> breach_id_optional;
}

header cp_gross_notional_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_market_order_gross_notional_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_net_notional_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_market_order_net_notional_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_duplicate_order_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> max_dup_orders;
    bit<8> use_order_price_in_dup_check;
    bit<32> period_in_milli_seconds;
}

header cp_order_rate_threshold_state_message_t {
    bit<160> clordid_optional;
    bit<48> underlier_optional;
    bit<32> efid_optional;
    bit<16> risk_group_id;
    bit<32> max_order_msgs;
    bit<32> period_in_milli_seconds;
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

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    login_request_message_t login_request_message;
    replay_request_message_t replay_request_message;
    replay_all_request_message_t replay_all_request_message;
    stream_request_message_t stream_request_message;
    unsequenced_message_t unsequenced_message;
    risk_settings_query_message_t risk_settings_query_message;
    active_risk_threshold_change_req_message_t active_risk_threshold_change_req_message;
    active_risk_acknowledgement_req_message_t active_risk_acknowledgement_req_message;
    cp_volume_threshold_change_req_message_t cp_volume_threshold_change_req_message;
    cp_executed_notional_threshold_change_req_message_t cp_executed_notional_threshold_change_req_message;
    cp_total_executions_threshold_change_req_message_t cp_total_executions_threshold_change_req_message;
    cp_percent_outstanding_contracts_threshold_change_req_message_t cp_percent_outstanding_contracts_threshold_change_req_message;
    cp_breach_count_threshold_change_req_message_t cp_breach_count_threshold_change_req_message;
    manual_cp_breach_trigger_req_message_t manual_cp_breach_trigger_req_message;
    cp_clear_breach_req_message_t cp_clear_breach_req_message;
    single_order_allow_iso_orders_change_req_message_t single_order_allow_iso_orders_change_req_message;
    single_order_allow_orders_in_crossed_market_change_req_message_t single_order_allow_orders_in_crossed_market_change_req_message;
    single_order_max_notional_change_req_message_t single_order_max_notional_change_req_message;
    single_order_max_contracts_change_req_message_t single_order_max_contracts_change_req_message;
    cp_gross_notional_threshold_change_req_message_t cp_gross_notional_threshold_change_req_message;
    cp_market_order_gross_notional_threshold_change_req_message_t cp_market_order_gross_notional_threshold_change_req_message;
    cp_net_notional_threshold_change_req_message_t cp_net_notional_threshold_change_req_message;
    cp_market_order_net_notional_threshold_change_req_message_t cp_market_order_net_notional_threshold_change_req_message;
    cp_duplicate_order_threshold_change_req_message_t cp_duplicate_order_threshold_change_req_message;
    cp_order_rate_threshold_change_req_message_t cp_order_rate_threshold_change_req_message;
    active_risk_threshold_state_message_t active_risk_threshold_state_message;
    active_risk_threshold_change_rej_message_t active_risk_threshold_change_rej_message;
    active_risk_acknowledged_message_t active_risk_acknowledged_message;
    active_risk_acknowledge_rej_message_t active_risk_acknowledge_rej_message;
    active_risk_quantity_update_notification_message_t active_risk_quantity_update_notification_message;
    cp_volume_threshold_state_message_t cp_volume_threshold_state_message;
    cp_executed_notional_threshold_state_message_t cp_executed_notional_threshold_state_message;
    cp_total_executions_threshold_state_message_t cp_total_executions_threshold_state_message;
    cp_percent_outstanding_contracts_threshold_state_message_t cp_percent_outstanding_contracts_threshold_state_message;
    cp_breach_count_threshold_state_message_t cp_breach_count_threshold_state_message;
    manual_cp_breach_trigger_pending_message_t manual_cp_breach_trigger_pending_message;
    manual_cp_breach_trigger_done_message_t manual_cp_breach_trigger_done_message;
    risk_threshold_update_rej_message_t risk_threshold_update_rej_message;
    passive_risk_threshold_notification_message_t passive_risk_threshold_notification_message;
    single_order_allow_iso_orders_state_message_t single_order_allow_iso_orders_state_message;
    single_order_allow_orders_in_crossed_market_state_message_t single_order_allow_orders_in_crossed_market_state_message;
    single_order_max_notional_threshold_state_message_t single_order_max_notional_threshold_state_message;
    single_order_max_contracts_threshold_state_message_t single_order_max_contracts_threshold_state_message;
    risk_settings_query_done_message_t risk_settings_query_done_message;
    risk_settings_query_rej_message_t risk_settings_query_rej_message;
    manual_cp_breach_trigger_rej_message_t manual_cp_breach_trigger_rej_message;
    breach_clear_rej_message_t breach_clear_rej_message;
    breach_cleared_message_t breach_cleared_message;
    cp_gross_notional_threshold_state_message_t cp_gross_notional_threshold_state_message;
    cp_market_order_gross_notional_threshold_state_message_t cp_market_order_gross_notional_threshold_state_message;
    cp_net_notional_threshold_state_message_t cp_net_notional_threshold_state_message;
    cp_market_order_net_notional_threshold_state_message_t cp_market_order_net_notional_threshold_state_message;
    cp_duplicate_order_threshold_state_message_t cp_duplicate_order_threshold_state_message;
    cp_order_rate_threshold_state_message_t cp_order_rate_threshold_state_message;
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
}

parser MemxoptionsRiskcontrolParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w100: parse_login_request_message;
            8w101: parse_replay_request_message;
            8w102: parse_replay_all_request_message;
            8w103: parse_stream_request_message;
            8w104: parse_unsequenced_message;
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

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        transition accept;
    }

    state parse_replay_all_request_message {
        packet.extract(hdr.replay_all_request_message);
        transition accept;
    }

    state parse_stream_request_message {
        packet.extract(hdr.stream_request_message);
        transition accept;
    }

    state parse_unsequenced_message {
        packet.extract(hdr.unsequenced_message);
        transition select(hdr.unsequenced_message.template_id) {
            8w1: parse_risk_settings_query_message;
            8w2: parse_active_risk_threshold_change_req_message;
            8w3: parse_active_risk_acknowledgement_req_message;
            8w4: parse_cp_volume_threshold_change_req_message;
            8w5: parse_cp_executed_notional_threshold_change_req_message;
            8w6: parse_cp_total_executions_threshold_change_req_message;
            8w7: parse_cp_percent_outstanding_contracts_threshold_change_req_message;
            8w8: parse_cp_breach_count_threshold_change_req_message;
            8w9: parse_manual_cp_breach_trigger_req_message;
            8w10: parse_cp_clear_breach_req_message;
            8w11: parse_single_order_allow_iso_orders_change_req_message;
            8w12: parse_single_order_allow_orders_in_crossed_market_change_req_message;
            8w13: parse_single_order_max_notional_change_req_message;
            8w14: parse_single_order_max_contracts_change_req_message;
            8w18: parse_cp_gross_notional_threshold_change_req_message;
            8w19: parse_cp_market_order_gross_notional_threshold_change_req_message;
            8w20: parse_cp_net_notional_threshold_change_req_message;
            8w21: parse_cp_market_order_net_notional_threshold_change_req_message;
            8w22: parse_cp_duplicate_order_threshold_change_req_message;
            8w23: parse_cp_order_rate_threshold_change_req_message;
            8w30: parse_active_risk_threshold_state_message;
            8w31: parse_active_risk_threshold_change_rej_message;
            8w32: parse_active_risk_acknowledged_message;
            8w33: parse_active_risk_acknowledge_rej_message;
            8w34: parse_active_risk_quantity_update_notification_message;
            8w35: parse_cp_volume_threshold_state_message;
            8w36: parse_cp_executed_notional_threshold_state_message;
            8w37: parse_cp_total_executions_threshold_state_message;
            8w38: parse_cp_percent_outstanding_contracts_threshold_state_message;
            8w39: parse_cp_breach_count_threshold_state_message;
            8w40: parse_manual_cp_breach_trigger_pending_message;
            8w41: parse_manual_cp_breach_trigger_done_message;
            8w42: parse_risk_threshold_update_rej_message;
            8w43: parse_passive_risk_threshold_notification_message;
            8w44: parse_single_order_allow_iso_orders_state_message;
            8w45: parse_single_order_allow_orders_in_crossed_market_state_message;
            8w46: parse_single_order_max_notional_threshold_state_message;
            8w47: parse_single_order_max_contracts_threshold_state_message;
            8w48: parse_risk_settings_query_done_message;
            8w49: parse_risk_settings_query_rej_message;
            8w50: parse_manual_cp_breach_trigger_rej_message;
            8w51: parse_breach_clear_rej_message;
            8w52: parse_breach_cleared_message;
            8w60: parse_cp_gross_notional_threshold_state_message;
            8w61: parse_cp_market_order_gross_notional_threshold_state_message;
            8w62: parse_cp_net_notional_threshold_state_message;
            8w63: parse_cp_market_order_net_notional_threshold_state_message;
            8w64: parse_cp_duplicate_order_threshold_state_message;
            8w65: parse_cp_order_rate_threshold_state_message;
            default: accept;
        }
    }

    state parse_risk_settings_query_message {
        packet.extract(hdr.risk_settings_query_message);
        transition accept;
    }

    state parse_active_risk_threshold_change_req_message {
        packet.extract(hdr.active_risk_threshold_change_req_message);
        transition accept;
    }

    state parse_active_risk_acknowledgement_req_message {
        packet.extract(hdr.active_risk_acknowledgement_req_message);
        transition accept;
    }

    state parse_cp_volume_threshold_change_req_message {
        packet.extract(hdr.cp_volume_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_executed_notional_threshold_change_req_message {
        packet.extract(hdr.cp_executed_notional_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_total_executions_threshold_change_req_message {
        packet.extract(hdr.cp_total_executions_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_percent_outstanding_contracts_threshold_change_req_message {
        packet.extract(hdr.cp_percent_outstanding_contracts_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_breach_count_threshold_change_req_message {
        packet.extract(hdr.cp_breach_count_threshold_change_req_message);
        transition accept;
    }

    state parse_manual_cp_breach_trigger_req_message {
        packet.extract(hdr.manual_cp_breach_trigger_req_message);
        transition accept;
    }

    state parse_cp_clear_breach_req_message {
        packet.extract(hdr.cp_clear_breach_req_message);
        transition accept;
    }

    state parse_single_order_allow_iso_orders_change_req_message {
        packet.extract(hdr.single_order_allow_iso_orders_change_req_message);
        transition accept;
    }

    state parse_single_order_allow_orders_in_crossed_market_change_req_message {
        packet.extract(hdr.single_order_allow_orders_in_crossed_market_change_req_message);
        transition accept;
    }

    state parse_single_order_max_notional_change_req_message {
        packet.extract(hdr.single_order_max_notional_change_req_message);
        transition accept;
    }

    state parse_single_order_max_contracts_change_req_message {
        packet.extract(hdr.single_order_max_contracts_change_req_message);
        transition accept;
    }

    state parse_cp_gross_notional_threshold_change_req_message {
        packet.extract(hdr.cp_gross_notional_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_market_order_gross_notional_threshold_change_req_message {
        packet.extract(hdr.cp_market_order_gross_notional_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_net_notional_threshold_change_req_message {
        packet.extract(hdr.cp_net_notional_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_market_order_net_notional_threshold_change_req_message {
        packet.extract(hdr.cp_market_order_net_notional_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_duplicate_order_threshold_change_req_message {
        packet.extract(hdr.cp_duplicate_order_threshold_change_req_message);
        transition accept;
    }

    state parse_cp_order_rate_threshold_change_req_message {
        packet.extract(hdr.cp_order_rate_threshold_change_req_message);
        transition accept;
    }

    state parse_active_risk_threshold_state_message {
        packet.extract(hdr.active_risk_threshold_state_message);
        transition accept;
    }

    state parse_active_risk_threshold_change_rej_message {
        packet.extract(hdr.active_risk_threshold_change_rej_message);
        transition accept;
    }

    state parse_active_risk_acknowledged_message {
        packet.extract(hdr.active_risk_acknowledged_message);
        transition accept;
    }

    state parse_active_risk_acknowledge_rej_message {
        packet.extract(hdr.active_risk_acknowledge_rej_message);
        transition accept;
    }

    state parse_active_risk_quantity_update_notification_message {
        packet.extract(hdr.active_risk_quantity_update_notification_message);
        transition accept;
    }

    state parse_cp_volume_threshold_state_message {
        packet.extract(hdr.cp_volume_threshold_state_message);
        transition accept;
    }

    state parse_cp_executed_notional_threshold_state_message {
        packet.extract(hdr.cp_executed_notional_threshold_state_message);
        transition accept;
    }

    state parse_cp_total_executions_threshold_state_message {
        packet.extract(hdr.cp_total_executions_threshold_state_message);
        transition accept;
    }

    state parse_cp_percent_outstanding_contracts_threshold_state_message {
        packet.extract(hdr.cp_percent_outstanding_contracts_threshold_state_message);
        transition accept;
    }

    state parse_cp_breach_count_threshold_state_message {
        packet.extract(hdr.cp_breach_count_threshold_state_message);
        transition accept;
    }

    state parse_manual_cp_breach_trigger_pending_message {
        packet.extract(hdr.manual_cp_breach_trigger_pending_message);
        transition accept;
    }

    state parse_manual_cp_breach_trigger_done_message {
        packet.extract(hdr.manual_cp_breach_trigger_done_message);
        transition accept;
    }

    state parse_risk_threshold_update_rej_message {
        packet.extract(hdr.risk_threshold_update_rej_message);
        transition accept;
    }

    state parse_passive_risk_threshold_notification_message {
        packet.extract(hdr.passive_risk_threshold_notification_message);
        transition accept;
    }

    state parse_single_order_allow_iso_orders_state_message {
        packet.extract(hdr.single_order_allow_iso_orders_state_message);
        transition accept;
    }

    state parse_single_order_allow_orders_in_crossed_market_state_message {
        packet.extract(hdr.single_order_allow_orders_in_crossed_market_state_message);
        transition accept;
    }

    state parse_single_order_max_notional_threshold_state_message {
        packet.extract(hdr.single_order_max_notional_threshold_state_message);
        transition accept;
    }

    state parse_single_order_max_contracts_threshold_state_message {
        packet.extract(hdr.single_order_max_contracts_threshold_state_message);
        transition accept;
    }

    state parse_risk_settings_query_done_message {
        packet.extract(hdr.risk_settings_query_done_message);
        transition accept;
    }

    state parse_risk_settings_query_rej_message {
        packet.extract(hdr.risk_settings_query_rej_message);
        transition accept;
    }

    state parse_manual_cp_breach_trigger_rej_message {
        packet.extract(hdr.manual_cp_breach_trigger_rej_message);
        transition accept;
    }

    state parse_breach_clear_rej_message {
        packet.extract(hdr.breach_clear_rej_message);
        transition accept;
    }

    state parse_breach_cleared_message {
        packet.extract(hdr.breach_cleared_message);
        transition accept;
    }

    state parse_cp_gross_notional_threshold_state_message {
        packet.extract(hdr.cp_gross_notional_threshold_state_message);
        transition accept;
    }

    state parse_cp_market_order_gross_notional_threshold_state_message {
        packet.extract(hdr.cp_market_order_gross_notional_threshold_state_message);
        transition accept;
    }

    state parse_cp_net_notional_threshold_state_message {
        packet.extract(hdr.cp_net_notional_threshold_state_message);
        transition accept;
    }

    state parse_cp_market_order_net_notional_threshold_state_message {
        packet.extract(hdr.cp_market_order_net_notional_threshold_state_message);
        transition accept;
    }

    state parse_cp_duplicate_order_threshold_state_message {
        packet.extract(hdr.cp_duplicate_order_threshold_state_message);
        transition accept;
    }

    state parse_cp_order_rate_threshold_state_message {
        packet.extract(hdr.cp_order_rate_threshold_state_message);
        transition accept;
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
            8w1: parse_risk_settings_query_message;
            8w2: parse_active_risk_threshold_change_req_message;
            8w3: parse_active_risk_acknowledgement_req_message;
            8w4: parse_cp_volume_threshold_change_req_message;
            8w5: parse_cp_executed_notional_threshold_change_req_message;
            8w6: parse_cp_total_executions_threshold_change_req_message;
            8w7: parse_cp_percent_outstanding_contracts_threshold_change_req_message;
            8w8: parse_cp_breach_count_threshold_change_req_message;
            8w9: parse_manual_cp_breach_trigger_req_message;
            8w10: parse_cp_clear_breach_req_message;
            8w11: parse_single_order_allow_iso_orders_change_req_message;
            8w12: parse_single_order_allow_orders_in_crossed_market_change_req_message;
            8w13: parse_single_order_max_notional_change_req_message;
            8w14: parse_single_order_max_contracts_change_req_message;
            8w18: parse_cp_gross_notional_threshold_change_req_message;
            8w19: parse_cp_market_order_gross_notional_threshold_change_req_message;
            8w20: parse_cp_net_notional_threshold_change_req_message;
            8w21: parse_cp_market_order_net_notional_threshold_change_req_message;
            8w22: parse_cp_duplicate_order_threshold_change_req_message;
            8w23: parse_cp_order_rate_threshold_change_req_message;
            8w30: parse_active_risk_threshold_state_message;
            8w31: parse_active_risk_threshold_change_rej_message;
            8w32: parse_active_risk_acknowledged_message;
            8w33: parse_active_risk_acknowledge_rej_message;
            8w34: parse_active_risk_quantity_update_notification_message;
            8w35: parse_cp_volume_threshold_state_message;
            8w36: parse_cp_executed_notional_threshold_state_message;
            8w37: parse_cp_total_executions_threshold_state_message;
            8w38: parse_cp_percent_outstanding_contracts_threshold_state_message;
            8w39: parse_cp_breach_count_threshold_state_message;
            8w40: parse_manual_cp_breach_trigger_pending_message;
            8w41: parse_manual_cp_breach_trigger_done_message;
            8w42: parse_risk_threshold_update_rej_message;
            8w43: parse_passive_risk_threshold_notification_message;
            8w44: parse_single_order_allow_iso_orders_state_message;
            8w45: parse_single_order_allow_orders_in_crossed_market_state_message;
            8w46: parse_single_order_max_notional_threshold_state_message;
            8w47: parse_single_order_max_contracts_threshold_state_message;
            8w48: parse_risk_settings_query_done_message;
            8w49: parse_risk_settings_query_rej_message;
            8w50: parse_manual_cp_breach_trigger_rej_message;
            8w51: parse_breach_clear_rej_message;
            8w52: parse_breach_cleared_message;
            8w60: parse_cp_gross_notional_threshold_state_message;
            8w61: parse_cp_market_order_gross_notional_threshold_state_message;
            8w62: parse_cp_net_notional_threshold_state_message;
            8w63: parse_cp_market_order_net_notional_threshold_state_message;
            8w64: parse_cp_duplicate_order_threshold_state_message;
            8w65: parse_cp_order_rate_threshold_state_message;
            default: accept;
        }
    }

}

control MemxoptionsRiskcontrolVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsRiskcontrolIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxoptionsRiskcontrolEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxoptionsRiskcontrolComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsRiskcontrolDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.unsequenced_message);
        packet.emit(hdr.risk_settings_query_message);
        packet.emit(hdr.active_risk_threshold_change_req_message);
        packet.emit(hdr.active_risk_acknowledgement_req_message);
        packet.emit(hdr.cp_volume_threshold_change_req_message);
        packet.emit(hdr.cp_executed_notional_threshold_change_req_message);
        packet.emit(hdr.cp_total_executions_threshold_change_req_message);
        packet.emit(hdr.cp_percent_outstanding_contracts_threshold_change_req_message);
        packet.emit(hdr.cp_breach_count_threshold_change_req_message);
        packet.emit(hdr.manual_cp_breach_trigger_req_message);
        packet.emit(hdr.cp_clear_breach_req_message);
        packet.emit(hdr.single_order_allow_iso_orders_change_req_message);
        packet.emit(hdr.single_order_allow_orders_in_crossed_market_change_req_message);
        packet.emit(hdr.single_order_max_notional_change_req_message);
        packet.emit(hdr.single_order_max_contracts_change_req_message);
        packet.emit(hdr.cp_gross_notional_threshold_change_req_message);
        packet.emit(hdr.cp_market_order_gross_notional_threshold_change_req_message);
        packet.emit(hdr.cp_net_notional_threshold_change_req_message);
        packet.emit(hdr.cp_market_order_net_notional_threshold_change_req_message);
        packet.emit(hdr.cp_duplicate_order_threshold_change_req_message);
        packet.emit(hdr.cp_order_rate_threshold_change_req_message);
        packet.emit(hdr.active_risk_threshold_state_message);
        packet.emit(hdr.active_risk_threshold_change_rej_message);
        packet.emit(hdr.active_risk_acknowledged_message);
        packet.emit(hdr.active_risk_acknowledge_rej_message);
        packet.emit(hdr.active_risk_quantity_update_notification_message);
        packet.emit(hdr.cp_volume_threshold_state_message);
        packet.emit(hdr.cp_executed_notional_threshold_state_message);
        packet.emit(hdr.cp_total_executions_threshold_state_message);
        packet.emit(hdr.cp_percent_outstanding_contracts_threshold_state_message);
        packet.emit(hdr.cp_breach_count_threshold_state_message);
        packet.emit(hdr.manual_cp_breach_trigger_pending_message);
        packet.emit(hdr.manual_cp_breach_trigger_done_message);
        packet.emit(hdr.risk_threshold_update_rej_message);
        packet.emit(hdr.passive_risk_threshold_notification_message);
        packet.emit(hdr.single_order_allow_iso_orders_state_message);
        packet.emit(hdr.single_order_allow_orders_in_crossed_market_state_message);
        packet.emit(hdr.single_order_max_notional_threshold_state_message);
        packet.emit(hdr.single_order_max_contracts_threshold_state_message);
        packet.emit(hdr.risk_settings_query_done_message);
        packet.emit(hdr.risk_settings_query_rej_message);
        packet.emit(hdr.manual_cp_breach_trigger_rej_message);
        packet.emit(hdr.breach_clear_rej_message);
        packet.emit(hdr.breach_cleared_message);
        packet.emit(hdr.cp_gross_notional_threshold_state_message);
        packet.emit(hdr.cp_market_order_gross_notional_threshold_state_message);
        packet.emit(hdr.cp_net_notional_threshold_state_message);
        packet.emit(hdr.cp_market_order_net_notional_threshold_state_message);
        packet.emit(hdr.cp_duplicate_order_threshold_state_message);
        packet.emit(hdr.cp_order_rate_threshold_state_message);
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
    }
}

V1Switch(
    MemxoptionsRiskcontrolParser(),
    MemxoptionsRiskcontrolVerifyChecksum(),
    MemxoptionsRiskcontrolIngress(),
    MemxoptionsRiskcontrolEgress(),
    MemxoptionsRiskcontrolComputeChecksum(),
    MemxoptionsRiskcontrolDeparser()
) main;
