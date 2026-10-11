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

header subsession_leave_message_t {
    bit<64> subsession_id;
}

header new_order_single_message_t {
    bit<128> account_account;
    bit<32> instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<8> customer_or_firm;
    bit<8> open_close;
    bit<8> attributed_quote;
    bit<8> time_in_force;
    bit<8> cancel_instead_of_slide;
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
    bit<32> instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<64> orig_cl_ord_id;
    bit<8> customer_or_firm;
    bit<8> open_close;
    bit<8> attributed_quote;
    bit<8> time_in_force;
    bit<8> cancel_instead_of_slide_optional;
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
    bit<32> instrument_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
}

header new_bulk_quote_message_t {
    bit<32> market_participant_id;
    bit<16> custom_group_id;
    bit<64> cl_ord_id;
    bit<32> clearing_account;
    bit<8> cancel_instead_of_slide_optional;
    bit<64> send_time;
    bit<24> aiq;
    bit<8> time_in_force;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_t {
    bit<32> instrument_id;
    bit<8> side;
    bit<32> price_price_4_optional;
    bit<32> order_qty_quantity_zero_optional;
    bit<8> quote_type;
    bit<8> reserved;
}

header mass_cancel_request_message_t {
    bit<32> underlying_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> send_time;
    bit<8> ack_style_mass_cancel_ack_style;
    bit<8> mpid_filter;
    bit<8> bulk_action;
}

header purge_request_message_t {
    bit<32> underlying_id;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<64> send_time;
    bit<8> ack_style_purge_request_ack_style;
    bit<8> bulk_action;
    bit<8> block_length_short;
    bit<8> num_in_group;
}

header purge_request_message_purge_request_message_custom_group_ids_group_t {
    bit<16> custom_group_id;
}

header risk_limit_update_request_message_t {
    bit<32> underlying_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<8> risk_control_optional;
    bit<8> risk_control_status_optional;
    bit<64> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> ioc_attribution;
    bit<8> cust_capacity_weight_optional;
}

header risk_action_request_message_t {
    bit<32> underlying_id_optional;
    bit<32> market_participant_id;
    bit<64> cl_ord_id;
    bit<8> risk_control;
    bit<8> risk_action;
    bit<16> custom_group_id_optional;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_remaining;
    bit<8> purge_request_message_purge_request_message_custom_group_ids_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    login_request_message_t login_request_message;
    sequenced_message_header_message_t sequenced_message_header_message;
    subsession_join_message_t subsession_join_message;
    subsession_leave_message_t subsession_leave_message;
    new_order_single_message_t new_order_single_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    new_bulk_quote_message_t new_bulk_quote_message;
    new_bulk_quote_message_new_bulk_quote_message_quote_updates_group_t new_bulk_quote_message_new_bulk_quote_message_quote_updates_group[MAX_MESSAGES];
    mass_cancel_request_message_t mass_cancel_request_message;
    purge_request_message_t purge_request_message;
    purge_request_message_purge_request_message_custom_group_ids_group_t purge_request_message_purge_request_message_custom_group_ids_group[MAX_MESSAGES];
    risk_limit_update_request_message_t risk_limit_update_request_message;
    risk_action_request_message_t risk_action_request_message;
}

parser IexoptionsBinaryorderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.schema_id) {
            16w0x204e: parse_client_session_message;
            16w0x214e: parse_client_business_message;
            default: accept;
        }
    }

    state parse_client_session_message {
        meta.dispatched = 1;
        transition select(hdr.message_header.template_id) {
            16w0x100: parse_login_request_message;
            16w0x400: parse_client_heartbeat_message;
            16w0x500: parse_logout_request_message;
            16w0x700: parse_sequenced_message_header_message;
            16w0x800: parse_subsession_join_message;
            16w0xa00: parse_subsession_leave_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request_message {
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

    state parse_subsession_leave_message {
        packet.extract(hdr.subsession_leave_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_business_message {
        meta.dispatched = 1;
        transition select(hdr.message_header.template_id) {
            16w0x100: parse_new_order_single_message;
            16w0x200: parse_order_cancel_replace_request_message;
            16w0x300: parse_order_cancel_request_message;
            16w0x400: parse_new_bulk_quote_message;
            16w0x500: parse_mass_cancel_request_message;
            16w0x600: parse_purge_request_message;
            16w0x3300: parse_risk_limit_update_request_message;
            16w0x3400: parse_risk_action_request_message;
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

}

control IexoptionsBinaryorderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsBinaryorderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IexoptionsBinaryorderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IexoptionsBinaryorderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsBinaryorderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.sequenced_message_header_message);
        packet.emit(hdr.subsession_join_message);
        packet.emit(hdr.subsession_leave_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.new_bulk_quote_message);
        packet.emit(hdr.new_bulk_quote_message_new_bulk_quote_message_quote_updates_group);
        packet.emit(hdr.mass_cancel_request_message);
        packet.emit(hdr.purge_request_message);
        packet.emit(hdr.purge_request_message_purge_request_message_custom_group_ids_group);
        packet.emit(hdr.risk_limit_update_request_message);
        packet.emit(hdr.risk_action_request_message);
    }
}

V1Switch(
    IexoptionsBinaryorderentryClientParser(),
    IexoptionsBinaryorderentryClientVerifyChecksum(),
    IexoptionsBinaryorderentryClientIngress(),
    IexoptionsBinaryorderentryClientEgress(),
    IexoptionsBinaryorderentryClientComputeChecksum(),
    IexoptionsBinaryorderentryClientDeparser()
) main;
