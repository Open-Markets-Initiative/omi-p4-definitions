// P4_16 (v1model) definition for: Memx MemxOptions Memo Sbe v1.6.a
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Members Orders
//   Encoding: Simple Binary Encoding
//   Version: 1.6.a
//   Date: 11/13/2023
//   Specification: MEMO for US Options - SBE-v1_6b
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
    bit<48> underlier_optional;
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
    short_two_sided_bulk_quote_message_t short_two_sided_bulk_quote_message;
    long_two_sided_bulk_quote_message_t long_two_sided_bulk_quote_message;
    short_one_sided_bulk_quote_message_t short_one_sided_bulk_quote_message;
    long_one_sided_bulk_quote_message_t long_one_sided_bulk_quote_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    mass_cancel_request_message_t mass_cancel_request_message;
    mass_cancel_clear_lockout_request_message_t mass_cancel_clear_lockout_request_message;
    allocation_instruction_message_t allocation_instruction_message;
}

parser MemxoptionsMemoClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w2: parse_short_two_sided_bulk_quote_message;
            8w3: parse_long_two_sided_bulk_quote_message;
            8w4: parse_short_one_sided_bulk_quote_message;
            8w5: parse_long_one_sided_bulk_quote_message;
            8w6: parse_order_cancel_replace_request_message;
            8w7: parse_order_cancel_request_message;
            8w8: parse_mass_cancel_request_message;
            8w9: parse_mass_cancel_clear_lockout_request_message;
            8w10: parse_allocation_instruction_message;
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

}

control MemxoptionsMemoClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxoptionsMemoClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxoptionsMemoClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.replay_request_message);
        packet.emit(hdr.replay_all_request_message);
        packet.emit(hdr.stream_request_message);
        packet.emit(hdr.unsequenced_message);
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
    }
}

V1Switch(
    MemxoptionsMemoClientParser(),
    MemxoptionsMemoClientVerifyChecksum(),
    MemxoptionsMemoClientIngress(),
    MemxoptionsMemoClientEgress(),
    MemxoptionsMemoClientComputeChecksum(),
    MemxoptionsMemoClientDeparser()
) main;
