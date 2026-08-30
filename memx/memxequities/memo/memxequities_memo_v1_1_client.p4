// P4_16 (v1model) definition for: Memx MemxEquities Memo Sbe v1.1
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Members Orders
//   Encoding: Simple Binary Encoding
//   Version: 1.1
//   Date: 7/27/2020
//   Specification: MEMO SBE-v1_1.pdf
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

header new_order_single_message_t {
    bit<128> clordid;
    bit<32> mpid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> order_capacity;
    bit<8> cust_order_capacity;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<64> peg_offset_value;
    bit<8> peg_price_type;
    bit<64> expire_time;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<8> display_method;
    bit<8> reserve_replenish_timing;
    bit<32> display_min_incr;
    bit<8> locate_reqd;
    bit<8> reprice_frequency;
    bit<8> reprice_behavior;
    bit<16> cancel_group_id;
    bit<16> stp_group_id;
    bit<8> self_trade_prevention;
    bit<16> risk_group_id;
}

header order_cancel_replace_request_message_t {
    bit<128> origclordid;
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<32> display_qty;
    bit<8> locate_reqd;
}

header order_cancel_request_message_t {
    bit<128> origclordid;
    bit<64> order_id_optional;
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
}

header mass_cancel_request_message_t {
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<64> lower_than_price;
    bit<64> higher_than_price;
    bit<16> cancel_group_id;
}

header execution_report_pending_new_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<64> exec_id;
    bit<32> mpid;
    bit<8> ord_status;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<8> ord_type;
    bit<32> order_qty;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> order_capacity;
    bit<8> cust_order_capacity;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<64> peg_offset_value;
    bit<8> peg_price_type;
    bit<64> expire_time;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<8> display_method;
    bit<8> reserve_replenish_timing;
    bit<32> display_min_incr;
    bit<8> locate_reqd;
    bit<8> reprice_frequency;
    bit<8> reprice_behavior;
    bit<16> cancel_group_id;
    bit<16> stp_group_id;
    bit<8> self_trade_prevention;
    bit<16> risk_group_id;
    bit<32> leaves_qty;
    bit<32> cum_qty;
}

header execution_report_new_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<64> exec_id;
    bit<32> mpid;
    bit<8> ord_status;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<8> ord_type;
    bit<32> order_qty;
    bit<64> price;
    bit<8> time_in_force;
    bit<8> order_capacity;
    bit<8> cust_order_capacity;
    bit<1> participate_do_not_initiate;
    bit<1> intermarket_sweep;
    bit<1> external_routing_not_allowed;
    bit<13> reserved_13;
    bit<64> peg_offset_value;
    bit<8> peg_price_type;
    bit<64> expire_time;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<8> display_method;
    bit<8> reserve_replenish_timing;
    bit<32> display_min_incr;
    bit<8> locate_reqd;
    bit<8> reprice_frequency;
    bit<8> reprice_behavior;
    bit<16> cancel_group_id;
    bit<16> stp_group_id;
    bit<8> self_trade_prevention;
    bit<16> risk_group_id;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> transact_time;
}

header execution_report_rejected_message_t {
    bit<64> sending_time;
    bit<128> clordid;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<8> order_reject_reason;
}

header execution_report_trade_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<32> last_qty;
    bit<64> last_px;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> transact_time;
    bit<8> last_liquidity_ind;
    bit<8> last_mkt;
    bit<64> trd_matching_id;
}

header execution_report_pending_cancel_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<128> origclordid;
    bit<64> exec_id;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> ord_status;
    bit<32> leaves_qty;
    bit<32> cum_qty;
}

header pending_mass_cancel_message_t {
    bit<64> sending_time;
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<64> lower_than_price;
    bit<64> higher_than_price;
    bit<16> cancel_group_id;
}

header execution_report_canceled_message_t {
    bit<64> sending_time;
    bit<128> clordid;
    bit<128> origclordid;
    bit<64> order_id;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<8> cancel_reason;
    bit<64> transact_time;
}

header mass_cancel_done_message_t {
    bit<64> sending_time;
    bit<128> clordid;
}

header execution_report_pending_replace_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<128> origclordid;
    bit<64> exec_id;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<32> display_qty;
    bit<8> locate_reqd;
    bit<8> ord_status;
    bit<32> leaves_qty;
    bit<32> cum_qty;
}

header execution_report_replaced_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<128> origclordid;
    bit<64> exec_id;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<32> order_qty;
    bit<8> ord_type;
    bit<64> price;
    bit<32> display_qty;
    bit<8> locate_reqd;
    bit<8> ord_status;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<64> transact_time;
}

header execution_report_trade_correction_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<64> exec_id;
    bit<64> exec_ref_id;
    bit<64> trd_match_id;
    bit<8> ord_status;
    bit<64> last_px;
    bit<32> last_qty_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
}

header execution_report_trade_break_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<64> exec_id;
    bit<64> exec_ref_id;
    bit<64> trd_match_id;
    bit<8> ord_status;
    bit<32> leaves_qty;
    bit<32> cum_qty;
}

header execution_report_restatement_message_t {
    bit<64> sending_time;
    bit<64> order_id;
    bit<128> clordid;
    bit<64> exec_id;
    bit<8> ord_status;
    bit<64> last_px_optional;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> last_shares;
    bit<8> exec_restatement_reason;
    bit<64> transact_time;
}

header order_cancel_reject_message_t {
    bit<64> sending_time;
    bit<128> clordid;
    bit<8> cxl_rej_response_to;
    bit<8> cxl_rej_reason;
}

header mass_cancel_reject_message_t {
    bit<64> sending_time;
    bit<128> clordid;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<8> side;
    bit<64> lower_than_price;
    bit<64> higher_than_price;
    bit<16> cancel_group_id;
    bit<8> mass_cancel_reject_reason;
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
    new_order_single_message_t new_order_single_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    mass_cancel_request_message_t mass_cancel_request_message;
    execution_report_pending_new_message_t execution_report_pending_new_message;
    execution_report_new_message_t execution_report_new_message;
    execution_report_rejected_message_t execution_report_rejected_message;
    execution_report_trade_message_t execution_report_trade_message;
    execution_report_pending_cancel_message_t execution_report_pending_cancel_message;
    pending_mass_cancel_message_t pending_mass_cancel_message;
    execution_report_canceled_message_t execution_report_canceled_message;
    mass_cancel_done_message_t mass_cancel_done_message;
    execution_report_pending_replace_message_t execution_report_pending_replace_message;
    execution_report_replaced_message_t execution_report_replaced_message;
    execution_report_trade_correction_message_t execution_report_trade_correction_message;
    execution_report_trade_break_message_t execution_report_trade_break_message;
    execution_report_restatement_message_t execution_report_restatement_message;
    order_cancel_reject_message_t order_cancel_reject_message;
    mass_cancel_reject_message_t mass_cancel_reject_message;
}

parser MemxequitiesMemoClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w1: parse_new_order_single_message;
            8w2: parse_order_cancel_replace_request_message;
            8w3: parse_order_cancel_request_message;
            8w4: parse_mass_cancel_request_message;
            8w5: parse_execution_report_pending_new_message;
            8w6: parse_execution_report_new_message;
            8w7: parse_execution_report_rejected_message;
            8w8: parse_execution_report_trade_message;
            8w9: parse_execution_report_pending_cancel_message;
            8w10: parse_pending_mass_cancel_message;
            8w11: parse_execution_report_canceled_message;
            8w12: parse_mass_cancel_done_message;
            8w13: parse_execution_report_pending_replace_message;
            8w14: parse_execution_report_replaced_message;
            8w15: parse_execution_report_trade_correction_message;
            8w16: parse_execution_report_trade_break_message;
            8w17: parse_execution_report_restatement_message;
            8w18: parse_order_cancel_reject_message;
            8w20: parse_mass_cancel_reject_message;
            default: accept;
        }
    }

    state parse_new_order_single_message {
        packet.extract(hdr.new_order_single_message);
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

    state parse_execution_report_pending_new_message {
        packet.extract(hdr.execution_report_pending_new_message);
        transition accept;
    }

    state parse_execution_report_new_message {
        packet.extract(hdr.execution_report_new_message);
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

    state parse_pending_mass_cancel_message {
        packet.extract(hdr.pending_mass_cancel_message);
        transition accept;
    }

    state parse_execution_report_canceled_message {
        packet.extract(hdr.execution_report_canceled_message);
        transition accept;
    }

    state parse_mass_cancel_done_message {
        packet.extract(hdr.mass_cancel_done_message);
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

    state parse_order_cancel_reject_message {
        packet.extract(hdr.order_cancel_reject_message);
        transition accept;
    }

    state parse_mass_cancel_reject_message {
        packet.extract(hdr.mass_cancel_reject_message);
        transition accept;
    }

}

control MemxequitiesMemoClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesMemoClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxequitiesMemoClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxequitiesMemoClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesMemoClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.unsequenced_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.mass_cancel_request_message);
        packet.emit(hdr.execution_report_pending_new_message);
        packet.emit(hdr.execution_report_new_message);
        packet.emit(hdr.execution_report_rejected_message);
        packet.emit(hdr.execution_report_trade_message);
        packet.emit(hdr.execution_report_pending_cancel_message);
        packet.emit(hdr.pending_mass_cancel_message);
        packet.emit(hdr.execution_report_canceled_message);
        packet.emit(hdr.mass_cancel_done_message);
        packet.emit(hdr.execution_report_pending_replace_message);
        packet.emit(hdr.execution_report_replaced_message);
        packet.emit(hdr.execution_report_trade_correction_message);
        packet.emit(hdr.execution_report_trade_break_message);
        packet.emit(hdr.execution_report_restatement_message);
        packet.emit(hdr.order_cancel_reject_message);
        packet.emit(hdr.mass_cancel_reject_message);
    }
}

V1Switch(
    MemxequitiesMemoClientParser(),
    MemxequitiesMemoClientVerifyChecksum(),
    MemxequitiesMemoClientIngress(),
    MemxequitiesMemoClientEgress(),
    MemxequitiesMemoClientComputeChecksum(),
    MemxequitiesMemoClientDeparser()
) main;
