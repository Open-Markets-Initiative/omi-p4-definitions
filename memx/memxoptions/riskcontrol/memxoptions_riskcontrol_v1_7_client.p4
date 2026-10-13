// P4_16 (v1model) definition for: Memx MemxOptions RiskControl Sbe v1.7
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Risk Control
//   Encoding: Simple Binary Encoding
//   Version: 1.7
//   Date: 4/17/24
//   Specification: Risk Control for US Options SBE-v1_7a.pdf
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

header active_risk_threshold_change_request_message_t {
    bit<160> cl_ord_id_active_risk_threshold_change_request_cl_ord_id;
    bit<48> underlier_active_risk_threshold_change_request_underlier_optional;
    bit<32> efid_active_risk_threshold_change_request_efid_optional;
    bit<32> threshold_quantity;
}

header active_risk_acknowledgement_request_message_t {
    bit<160> cl_ord_id_active_risk_acknowledgement_request_cl_ord_id;
    bit<48> underlier_active_risk_acknowledgement_request_underlier;
    bit<32> efid_active_risk_acknowledgement_request_efid;
    bit<32> quantity;
}

header cp_volume_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_volume_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_volume_threshold_change_request_underlier_optional;
    bit<32> efid_cp_volume_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> volume;
    bit<32> period_in_milli_seconds;
}

header cp_executed_notional_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_executed_notional_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_executed_notional_threshold_change_request_underlier_optional;
    bit<32> efid_cp_executed_notional_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
    bit<32> period_in_milli_seconds;
}

header cp_total_executions_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_total_executions_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_total_executions_threshold_change_request_underlier_optional;
    bit<32> efid_cp_total_executions_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<32> total_executions;
    bit<32> period_in_milli_seconds;
}

header cp_percent_outstanding_contracts_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_percent_outstanding_contracts_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_percent_outstanding_contracts_threshold_change_request_underlier_optional;
    bit<32> efid_cp_percent_outstanding_contracts_threshold_change_request_efid_optional;
    bit<32> percent;
    bit<32> period_in_milli_seconds;
}

header cp_breach_count_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_breach_count_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_breach_count_threshold_change_request_underlier_optional;
    bit<32> efid_cp_breach_count_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<32> count;
    bit<32> period_in_milli_seconds;
}

header manual_cp_breach_trigger_request_message_t {
    bit<160> cl_ord_id_manual_cp_breach_trigger_request_cl_ord_id;
    bit<48> underlier_manual_cp_breach_trigger_request_underlier_optional;
    bit<32> efid_manual_cp_breach_trigger_request_efid_optional;
    bit<16> risk_group_id;
    bit<8> send_cancels;
}

header cp_clear_breach_request_message_t {
    bit<160> cl_ord_id_cp_clear_breach_request_cl_ord_id;
    bit<64> breach_id;
}

header single_order_allow_iso_orders_change_request_message_t {
    bit<160> cl_ord_id_single_order_allow_iso_orders_change_request_cl_ord_id;
    bit<48> underlier_single_order_allow_iso_orders_change_request_underlier_optional;
    bit<32> efid_single_order_allow_iso_orders_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_iso_orders;
}

header single_order_allow_orders_in_crossed_market_change_request_message_t {
    bit<160> cl_ord_id_single_order_allow_orders_in_crossed_market_change_request_cl_ord_id;
    bit<48> underlier_single_order_allow_orders_in_crossed_market_change_request_underlier_optional;
    bit<32> efid_single_order_allow_orders_in_crossed_market_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_orders;
}

header single_order_max_notional_change_request_message_t {
    bit<160> cl_ord_id_single_order_max_notional_change_request_cl_ord_id;
    bit<48> underlier_single_order_max_notional_change_request_underlier_optional;
    bit<32> efid_single_order_max_notional_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> max_notional_in_dollars;
}

header single_order_max_contracts_change_request_message_t {
    bit<160> cl_ord_id_single_order_max_contracts_change_request_cl_ord_id;
    bit<48> underlier_single_order_max_contracts_change_request_underlier_optional;
    bit<32> efid_single_order_max_contracts_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<32> max_contracts;
}

header single_order_allow_market_orders_change_request_message_t {
    bit<160> cl_ord_id_single_order_allow_market_orders_change_request_cl_ord_id;
    bit<48> underlier_single_order_allow_market_orders_change_request_underlier_optional;
    bit<32> efid_single_order_allow_market_orders_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<8> allow_market_orders;
}

header single_order_restricted_underlier_change_request_message_t {
    bit<160> cl_ord_id_single_order_restricted_underlier_change_request_cl_ord_id;
    bit<48> underlier_single_order_restricted_underlier_change_request_underlier;
    bit<32> efid_single_order_restricted_underlier_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<8> restricted;
}

header cp_gross_notional_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_gross_notional_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_gross_notional_threshold_change_request_underlier_optional;
    bit<32> efid_cp_gross_notional_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_market_order_gross_notional_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_market_order_gross_notional_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_market_order_gross_notional_threshold_change_request_underlier_optional;
    bit<32> efid_cp_market_order_gross_notional_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_net_notional_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_net_notional_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_net_notional_threshold_change_request_underlier_optional;
    bit<32> efid_cp_net_notional_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_market_order_net_notional_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_market_order_net_notional_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_market_order_net_notional_threshold_change_request_underlier_optional;
    bit<32> efid_cp_market_order_net_notional_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<64> price_in_dollars;
}

header cp_duplicate_order_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_duplicate_order_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_duplicate_order_threshold_change_request_underlier_optional;
    bit<32> efid_cp_duplicate_order_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<32> max_dup_orders;
    bit<8> use_order_price_in_dup_check_optional;
    bit<32> period_in_milli_seconds;
}

header cp_order_rate_threshold_change_request_message_t {
    bit<160> cl_ord_id_cp_order_rate_threshold_change_request_cl_ord_id;
    bit<48> underlier_cp_order_rate_threshold_change_request_underlier_optional;
    bit<32> efid_cp_order_rate_threshold_change_request_efid_optional;
    bit<16> risk_group_id;
    bit<32> max_order_msgs;
    bit<32> period_in_milli_seconds;
}

header cp_clear_all_breaches_request_message_t {
    bit<160> cl_ord_id_cp_clear_all_breaches_request_cl_ord_id;
}

header cp_clear_all_breaches_by_efid_or_underlier_request_message_t {
    bit<160> cl_ord_id_cp_clear_all_breaches_by_efid_or_underlier_request_cl_ord_id;
    bit<48> underlier_cp_clear_all_breaches_by_efid_or_underlier_request_underlier_optional;
    bit<32> efid_cp_clear_all_breaches_by_efid_or_underlier_request_efid_optional;
}

header active_risk_acknowledge_all_request_message_t {
    bit<160> cl_ord_id_active_risk_acknowledge_all_request_cl_ord_id;
    bit<48> underlier_active_risk_acknowledge_all_request_underlier;
    bit<32> efid_active_risk_acknowledge_all_request_efid;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    common_header_t common_header;
    login_request_message_t login_request_message;
    replay_request_message_t replay_request_message;
    replay_all_request_message_t replay_all_request_message;
    stream_request_message_t stream_request_message;
    unsequenced_message_t unsequenced_message;
    risk_settings_query_message_t risk_settings_query_message;
    active_risk_threshold_change_request_message_t active_risk_threshold_change_request_message;
    active_risk_acknowledgement_request_message_t active_risk_acknowledgement_request_message;
    cp_volume_threshold_change_request_message_t cp_volume_threshold_change_request_message;
    cp_executed_notional_threshold_change_request_message_t cp_executed_notional_threshold_change_request_message;
    cp_total_executions_threshold_change_request_message_t cp_total_executions_threshold_change_request_message;
    cp_percent_outstanding_contracts_threshold_change_request_message_t cp_percent_outstanding_contracts_threshold_change_request_message;
    cp_breach_count_threshold_change_request_message_t cp_breach_count_threshold_change_request_message;
    manual_cp_breach_trigger_request_message_t manual_cp_breach_trigger_request_message;
    cp_clear_breach_request_message_t cp_clear_breach_request_message;
    single_order_allow_iso_orders_change_request_message_t single_order_allow_iso_orders_change_request_message;
    single_order_allow_orders_in_crossed_market_change_request_message_t single_order_allow_orders_in_crossed_market_change_request_message;
    single_order_max_notional_change_request_message_t single_order_max_notional_change_request_message;
    single_order_max_contracts_change_request_message_t single_order_max_contracts_change_request_message;
    single_order_allow_market_orders_change_request_message_t single_order_allow_market_orders_change_request_message;
    single_order_restricted_underlier_change_request_message_t single_order_restricted_underlier_change_request_message;
    cp_gross_notional_threshold_change_request_message_t cp_gross_notional_threshold_change_request_message;
    cp_market_order_gross_notional_threshold_change_request_message_t cp_market_order_gross_notional_threshold_change_request_message;
    cp_net_notional_threshold_change_request_message_t cp_net_notional_threshold_change_request_message;
    cp_market_order_net_notional_threshold_change_request_message_t cp_market_order_net_notional_threshold_change_request_message;
    cp_duplicate_order_threshold_change_request_message_t cp_duplicate_order_threshold_change_request_message;
    cp_order_rate_threshold_change_request_message_t cp_order_rate_threshold_change_request_message;
    cp_clear_all_breaches_request_message_t cp_clear_all_breaches_request_message;
    cp_clear_all_breaches_by_efid_or_underlier_request_message_t cp_clear_all_breaches_by_efid_or_underlier_request_message;
    active_risk_acknowledge_all_request_message_t active_risk_acknowledge_all_request_message;
}

parser MemxoptionsRiskcontrolClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w100: parse_login_request_message;
            8w101: parse_replay_request_message;
            8w102: parse_replay_all_request_message;
            8w103: parse_stream_request_message;
            8w104: parse_unsequenced_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_request_message {
        packet.extract(hdr.replay_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replay_all_request_message {
        packet.extract(hdr.replay_all_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stream_request_message {
        packet.extract(hdr.stream_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_message {
        packet.extract(hdr.unsequenced_message);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_message.template_id) {
            8w1: parse_risk_settings_query_message;
            8w2: parse_active_risk_threshold_change_request_message;
            8w3: parse_active_risk_acknowledgement_request_message;
            8w4: parse_cp_volume_threshold_change_request_message;
            8w5: parse_cp_executed_notional_threshold_change_request_message;
            8w6: parse_cp_total_executions_threshold_change_request_message;
            8w7: parse_cp_percent_outstanding_contracts_threshold_change_request_message;
            8w8: parse_cp_breach_count_threshold_change_request_message;
            8w9: parse_manual_cp_breach_trigger_request_message;
            8w10: parse_cp_clear_breach_request_message;
            8w11: parse_single_order_allow_iso_orders_change_request_message;
            8w12: parse_single_order_allow_orders_in_crossed_market_change_request_message;
            8w13: parse_single_order_max_notional_change_request_message;
            8w14: parse_single_order_max_contracts_change_request_message;
            8w15: parse_single_order_allow_market_orders_change_request_message;
            8w16: parse_single_order_restricted_underlier_change_request_message;
            8w18: parse_cp_gross_notional_threshold_change_request_message;
            8w19: parse_cp_market_order_gross_notional_threshold_change_request_message;
            8w20: parse_cp_net_notional_threshold_change_request_message;
            8w21: parse_cp_market_order_net_notional_threshold_change_request_message;
            8w22: parse_cp_duplicate_order_threshold_change_request_message;
            8w23: parse_cp_order_rate_threshold_change_request_message;
            8w24: parse_cp_clear_all_breaches_request_message;
            8w25: parse_cp_clear_all_breaches_by_efid_or_underlier_request_message;
            8w26: parse_active_risk_acknowledge_all_request_message;
            default: accept;
        }
    }

    state parse_risk_settings_query_message {
        packet.extract(hdr.risk_settings_query_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_risk_threshold_change_request_message {
        packet.extract(hdr.active_risk_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_risk_acknowledgement_request_message {
        packet.extract(hdr.active_risk_acknowledgement_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_volume_threshold_change_request_message {
        packet.extract(hdr.cp_volume_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_executed_notional_threshold_change_request_message {
        packet.extract(hdr.cp_executed_notional_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_total_executions_threshold_change_request_message {
        packet.extract(hdr.cp_total_executions_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_percent_outstanding_contracts_threshold_change_request_message {
        packet.extract(hdr.cp_percent_outstanding_contracts_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_breach_count_threshold_change_request_message {
        packet.extract(hdr.cp_breach_count_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_manual_cp_breach_trigger_request_message {
        packet.extract(hdr.manual_cp_breach_trigger_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_clear_breach_request_message {
        packet.extract(hdr.cp_clear_breach_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_single_order_allow_iso_orders_change_request_message {
        packet.extract(hdr.single_order_allow_iso_orders_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_single_order_allow_orders_in_crossed_market_change_request_message {
        packet.extract(hdr.single_order_allow_orders_in_crossed_market_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_single_order_max_notional_change_request_message {
        packet.extract(hdr.single_order_max_notional_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_single_order_max_contracts_change_request_message {
        packet.extract(hdr.single_order_max_contracts_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_single_order_allow_market_orders_change_request_message {
        packet.extract(hdr.single_order_allow_market_orders_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_single_order_restricted_underlier_change_request_message {
        packet.extract(hdr.single_order_restricted_underlier_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_gross_notional_threshold_change_request_message {
        packet.extract(hdr.cp_gross_notional_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_market_order_gross_notional_threshold_change_request_message {
        packet.extract(hdr.cp_market_order_gross_notional_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_net_notional_threshold_change_request_message {
        packet.extract(hdr.cp_net_notional_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_market_order_net_notional_threshold_change_request_message {
        packet.extract(hdr.cp_market_order_net_notional_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_duplicate_order_threshold_change_request_message {
        packet.extract(hdr.cp_duplicate_order_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_order_rate_threshold_change_request_message {
        packet.extract(hdr.cp_order_rate_threshold_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_clear_all_breaches_request_message {
        packet.extract(hdr.cp_clear_all_breaches_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cp_clear_all_breaches_by_efid_or_underlier_request_message {
        packet.extract(hdr.cp_clear_all_breaches_by_efid_or_underlier_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_risk_acknowledge_all_request_message {
        packet.extract(hdr.active_risk_acknowledge_all_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control MemxoptionsRiskcontrolClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsRiskcontrolClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control MemxoptionsRiskcontrolClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxoptionsRiskcontrolClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsRiskcontrolClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.unsequenced_message);
        packet.emit(hdr.risk_settings_query_message);
        packet.emit(hdr.active_risk_threshold_change_request_message);
        packet.emit(hdr.active_risk_acknowledgement_request_message);
        packet.emit(hdr.cp_volume_threshold_change_request_message);
        packet.emit(hdr.cp_executed_notional_threshold_change_request_message);
        packet.emit(hdr.cp_total_executions_threshold_change_request_message);
        packet.emit(hdr.cp_percent_outstanding_contracts_threshold_change_request_message);
        packet.emit(hdr.cp_breach_count_threshold_change_request_message);
        packet.emit(hdr.manual_cp_breach_trigger_request_message);
        packet.emit(hdr.cp_clear_breach_request_message);
        packet.emit(hdr.single_order_allow_iso_orders_change_request_message);
        packet.emit(hdr.single_order_allow_orders_in_crossed_market_change_request_message);
        packet.emit(hdr.single_order_max_notional_change_request_message);
        packet.emit(hdr.single_order_max_contracts_change_request_message);
        packet.emit(hdr.single_order_allow_market_orders_change_request_message);
        packet.emit(hdr.single_order_restricted_underlier_change_request_message);
        packet.emit(hdr.cp_gross_notional_threshold_change_request_message);
        packet.emit(hdr.cp_market_order_gross_notional_threshold_change_request_message);
        packet.emit(hdr.cp_net_notional_threshold_change_request_message);
        packet.emit(hdr.cp_market_order_net_notional_threshold_change_request_message);
        packet.emit(hdr.cp_duplicate_order_threshold_change_request_message);
        packet.emit(hdr.cp_order_rate_threshold_change_request_message);
        packet.emit(hdr.cp_clear_all_breaches_request_message);
        packet.emit(hdr.cp_clear_all_breaches_by_efid_or_underlier_request_message);
        packet.emit(hdr.active_risk_acknowledge_all_request_message);
    }
}

V1Switch(
    MemxoptionsRiskcontrolClientParser(),
    MemxoptionsRiskcontrolClientVerifyChecksum(),
    MemxoptionsRiskcontrolClientIngress(),
    MemxoptionsRiskcontrolClientEgress(),
    MemxoptionsRiskcontrolClientComputeChecksum(),
    MemxoptionsRiskcontrolClientDeparser()
) main;
