// P4_16 (v1model) definition for: Nasdaq IseOptions Otto Ouch v3.0.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Ouch to Trade Options
//   Encoding: Ouch
//   Version: 3.0.0
//   Date: 08/17/2026
//   Specification: Options_ETH_OTTO.pdf
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

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<64> timestamp;
    bit<8> event_code;
    bit<8> version;
    bit<8> subversion;
}

header simple_instrument_directory_message_t {
    bit<64> timestamp;
    bit<16> product_id;
    bit<104> product_name;
    bit<32> instrument_id;
    bit<8> expir_year;
    bit<8> expir_mon;
    bit<8> expir_day;
    bit<64> strike_price;
    bit<8> option_type;
    bit<8> closing_type;
    bit<8> tradable;
    bit<8> closing_only;
    bit<16> contract_size;
    bit<8> mpv;
    bit<64> security_symbol;
    bit<128> reserved_16;
}

header complex_instrument_directory_message_t {
    bit<64> timestamp;
    bit<16> product_id;
    bit<104> product_name;
    bit<32> instrument_id;
    bit<8> reserved_1;
    bit<8> num_legs;
}

header complex_instrument_directory_message_complex_directory_legs_t {
    bit<8> leg_type;
    bit<32> leg_instrument_id;
    bit<8> leg_side;
    bit<16> leg_ratio;
    bit<8> leg_id;
}

header instrument_trading_action_message_t {
    bit<64> timestamp;
    bit<16> product_id;
    bit<32> instrument_id;
    bit<8> trading_state;
}

header auction_notification_message_t {
    bit<64> timestamp;
    bit<8> instrument_type;
    bit<32> instrument_id;
    bit<32> auction_id;
    bit<8> order_type;
    bit<8> side;
    bit<64> price;
    bit<32> quantity;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<32> firm_id;
    bit<32> occ_account;
    bit<32> cmta;
    bit<8> auction_event;
    bit<8> auction_type;
    bit<32> auction_duration;
    bit<64> best_response_price;
    bit<32> best_response_size;
    bit<72> reserved_9;
    bit<8> number_of_flex_dac_legs;
}

header auction_notification_message_flex_dac_legs_t {
    bit<64> reserved_8;
}

header order_accepted_long_form_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<128> cl_ord_id;
    bit<32> cmta;
    bit<32> clearing_account;
    bit<32> occ_account;
    bit<80> cust_acct;
    bit<24> preferred_party;
    bit<8> alo_inst;
    bit<8> iso;
    bit<8> side;
    bit<8> order_type;
    bit<64> price;
    bit<32> quantity;
    bit<32> min_qty;
    bit<8> tif;
    bit<8> capacity;
    bit<8> auction_type;
    bit<32> auction_id;
    bit<8> disclosure_mask;
    bit<8> price_protection;
    bit<16> display_qty;
    bit<8> display_when;
    bit<8> display_method;
    bit<16> display_low_qty;
    bit<16> display_high_qty;
    bit<16> position_effect_mask;
    bit<8> stock_leg_short_sale;
    bit<32> stock_leg_mpid;
    bit<8> stock_capacity;
    bit<72> reserved_9;
    bit<8> number_of_flex_legs;
}

header order_accepted_long_form_message_flex_legs_t {
    bit<64> reserved_8;
}

header order_accepted_short_form_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<128> cl_ord_id;
    bit<8> alo_inst;
    bit<8> iso;
    bit<8> side;
    bit<8> order_type;
    bit<64> price;
    bit<16> quantity_short;
    bit<8> tif;
    bit<8> capacity;
    bit<8> auction_type;
    bit<32> auction_id;
    bit<8> price_protection;
    bit<16> position_effect_mask;
    bit<8> stock_capacity;
}

header order_replaced_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<64> orig_order_id;
    bit<64> order_id;
    bit<128> orig_cl_ord_id;
    bit<128> cl_ord_id;
    bit<8> alo_inst;
    bit<8> iso;
    bit<8> side;
    bit<8> order_type;
    bit<64> price;
    bit<32> quantity;
    bit<8> tif;
    bit<80> cust_acct;
    bit<8> capacity;
    bit<8> auction_type;
    bit<32> auction_id;
    bit<16> position_effect_mask;
    bit<8> price_protection;
}

header order_canceled_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<128> cl_ord_id;
    bit<8> cancel_reason;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<16> product_id;
    bit<8> ord_exec_type;
    bit<32> instrument_id;
    bit<32> leg_instrument_id;
    bit<8> leg_id;
    bit<8> auction_type;
    bit<64> order_id;
    bit<128> cl_ord_id;
    bit<32> cross_id;
    bit<32> match_id;
    bit<8> side;
    bit<8> stock_leg_short_sale;
    bit<64> price;
    bit<32> quantity;
    bit<8> liquidity_ind;
}

header trade_details_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<16> product_id;
    bit<8> ord_exec_type;
    bit<32> instrument_id;
    bit<32> leg_instrument_id;
    bit<8> leg_id;
    bit<8> trans_type;
    bit<8> event_source;
    bit<8> auction_type;
    bit<64> order_id;
    bit<128> cl_ord_id;
    bit<32> cross_id;
    bit<32> match_id;
    bit<32> ref_match_id;
    bit<8> side;
    bit<8> stock_leg_short_sale;
    bit<64> price;
    bit<32> quantity;
    bit<8> liquidity_ind;
    bit<32> cmta;
    bit<32> clearing_account;
    bit<32> occ_account;
    bit<80> cust_acct;
    bit<8> stock_venue;
    bit<32> stock_leg_mpid;
    bit<8> capacity;
    bit<8> open_close;
}

header cross_order_accepted_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<8> cross_type;
    bit<8> auction_type;
    bit<32> auction_id;
    bit<8> auction_alloc_pct;
    bit<8> side;
    bit<8> iso;
    bit<8> price_protection;
    bit<64> effective_time;
    bit<8> disclosure_mask;
    bit<64> primary_order_id;
    bit<128> primary_cl_ord_id;
    bit<32> primary_cmta;
    bit<32> primary_clearing_account;
    bit<32> primary_occ_account;
    bit<80> primary_cust_acct;
    bit<64> primary_price;
    bit<32> primary_quantity;
    bit<8> primary_capacity;
    bit<16> primary_position_effect_mask;
    bit<8> primary_stock_leg_short_sale;
    bit<32> primary_stock_leg_mpid;
    bit<64> contra_order_id;
    bit<128> contra_cl_ord_id;
    bit<32> contra_cmta;
    bit<32> contra_clearing_account;
    bit<32> contra_occ_account;
    bit<80> contra_cust_acct;
    bit<8> contra_order_type;
    bit<64> contra_price;
    bit<32> contra_quantity;
    bit<8> contra_capacity;
    bit<16> contra_position_effect_mask;
    bit<8> contra_stock_leg_short_sale;
    bit<32> contra_stock_leg_mpid;
    bit<8> reserved_1;
}

header member_kill_switch_notification_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<32> target_firm_id;
    bit<8> kill_action;
}

header mass_cancel_response_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<32> num_canceled;
    bit<32> num_pending;
}

header add_complex_instrument_response_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<32> instrument_id;
}

header modify_trade_response_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<128> cl_request_id;
    bit<128> cl_ord_id;
    bit<32> cross_id;
    bit<32> match_id;
}

header subscription_response_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<128> cl_request_id;
}

header reject_message_t {
    bit<64> timestamp;
    bit<8> reject_msg_type;
    bit<128> cl_ord_id;
    bit<16> reject_code;
}

header pending_response_message_t {
    bit<64> timestamp;
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<8> pending_msg_type;
    bit<128> cl_ord_id;
    bit<8> pending_reason;
}

header debug_packet_debug_text_t {
    varbit<2048> debug_text;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> complex_instrument_directory_message_complex_directory_legs_remaining;
    bit<8> auction_notification_message_flex_dac_legs_remaining;
    bit<8> order_accepted_long_form_message_flex_legs_remaining;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    simple_instrument_directory_message_t simple_instrument_directory_message;
    complex_instrument_directory_message_t complex_instrument_directory_message;
    complex_instrument_directory_message_complex_directory_legs_t complex_instrument_directory_message_complex_directory_legs[MAX_MESSAGES];
    instrument_trading_action_message_t instrument_trading_action_message;
    auction_notification_message_t auction_notification_message;
    auction_notification_message_flex_dac_legs_t auction_notification_message_flex_dac_legs[MAX_MESSAGES];
    order_accepted_long_form_message_t order_accepted_long_form_message;
    order_accepted_long_form_message_flex_legs_t order_accepted_long_form_message_flex_legs[MAX_MESSAGES];
    order_accepted_short_form_message_t order_accepted_short_form_message;
    order_replaced_message_t order_replaced_message;
    order_canceled_message_t order_canceled_message;
    order_executed_message_t order_executed_message;
    trade_details_message_t trade_details_message;
    cross_order_accepted_message_t cross_order_accepted_message;
    member_kill_switch_notification_message_t member_kill_switch_notification_message;
    mass_cancel_response_message_t mass_cancel_response_message;
    add_complex_instrument_response_message_t add_complex_instrument_response_message;
    modify_trade_response_message_t modify_trade_response_message;
    subscription_response_message_t subscription_response_message;
    reject_message_t reject_message;
    pending_response_message_t pending_response_message;
    debug_packet_debug_text_t debug_packet_debug_text;
}

parser IseoptionsOttoServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat_packet;
            8w0x5a: parse_end_of_session_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        meta.dispatched = 1;
        packet.extract(hdr.debug_packet_debug_text, (bit<32>)hdr.server_packet_header.packet_length * 8);
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x7a: parse_system_event_message;
            8w0x6f: parse_simple_instrument_directory_message;
            8w0x73: parse_complex_instrument_directory_message;
            8w0x69: parse_instrument_trading_action_message;
            8w0x6e: parse_auction_notification_message;
            8w0x61: parse_order_accepted_long_form_message;
            8w0x62: parse_order_accepted_short_form_message;
            8w0x72: parse_order_replaced_message;
            8w0x63: parse_order_canceled_message;
            8w0x65: parse_order_executed_message;
            8w0x74: parse_trade_details_message;
            8w0x78: parse_cross_order_accepted_message;
            8w0x6b: parse_member_kill_switch_notification_message;
            8w0x75: parse_mass_cancel_response_message;
            8w0x64: parse_add_complex_instrument_response_message;
            8w0x6d: parse_modify_trade_response_message;
            8w0x66: parse_subscription_response_message;
            8w0x6a: parse_reject_message;
            8w0x70: parse_pending_response_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_instrument_directory_message {
        packet.extract(hdr.simple_instrument_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_instrument_directory_message {
        packet.extract(hdr.complex_instrument_directory_message);
        meta.dispatched = 1;
        meta.complex_instrument_directory_message_complex_directory_legs_remaining = hdr.complex_instrument_directory_message.num_legs;
        transition select(meta.complex_instrument_directory_message_complex_directory_legs_remaining) {
            8w0: accept;
            default: parse_complex_instrument_directory_message_complex_directory_legs;
        }
    }

    state parse_complex_instrument_directory_message_complex_directory_legs {
        packet.extract(hdr.complex_instrument_directory_message_complex_directory_legs.next);
        meta.complex_instrument_directory_message_complex_directory_legs_remaining = meta.complex_instrument_directory_message_complex_directory_legs_remaining - 1;
        transition select(meta.complex_instrument_directory_message_complex_directory_legs_remaining) {
            8w0: accept;
            default: parse_complex_instrument_directory_message_complex_directory_legs;
        }
    }

    state parse_instrument_trading_action_message {
        packet.extract(hdr.instrument_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_notification_message {
        packet.extract(hdr.auction_notification_message);
        meta.dispatched = 1;
        meta.auction_notification_message_flex_dac_legs_remaining = hdr.auction_notification_message.number_of_flex_dac_legs;
        transition select(meta.auction_notification_message_flex_dac_legs_remaining) {
            8w0: accept;
            default: parse_auction_notification_message_flex_dac_legs;
        }
    }

    state parse_auction_notification_message_flex_dac_legs {
        packet.extract(hdr.auction_notification_message_flex_dac_legs.next);
        meta.auction_notification_message_flex_dac_legs_remaining = meta.auction_notification_message_flex_dac_legs_remaining - 1;
        transition select(meta.auction_notification_message_flex_dac_legs_remaining) {
            8w0: accept;
            default: parse_auction_notification_message_flex_dac_legs;
        }
    }

    state parse_order_accepted_long_form_message {
        packet.extract(hdr.order_accepted_long_form_message);
        meta.dispatched = 1;
        meta.order_accepted_long_form_message_flex_legs_remaining = hdr.order_accepted_long_form_message.number_of_flex_legs;
        transition select(meta.order_accepted_long_form_message_flex_legs_remaining) {
            8w0: accept;
            default: parse_order_accepted_long_form_message_flex_legs;
        }
    }

    state parse_order_accepted_long_form_message_flex_legs {
        packet.extract(hdr.order_accepted_long_form_message_flex_legs.next);
        meta.order_accepted_long_form_message_flex_legs_remaining = meta.order_accepted_long_form_message_flex_legs_remaining - 1;
        transition select(meta.order_accepted_long_form_message_flex_legs_remaining) {
            8w0: accept;
            default: parse_order_accepted_long_form_message_flex_legs;
        }
    }

    state parse_order_accepted_short_form_message {
        packet.extract(hdr.order_accepted_short_form_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_canceled_message {
        packet.extract(hdr.order_canceled_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_details_message {
        packet.extract(hdr.trade_details_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cross_order_accepted_message {
        packet.extract(hdr.cross_order_accepted_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_member_kill_switch_notification_message {
        packet.extract(hdr.member_kill_switch_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_response_message {
        packet.extract(hdr.mass_cancel_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_complex_instrument_response_message {
        packet.extract(hdr.add_complex_instrument_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_trade_response_message {
        packet.extract(hdr.modify_trade_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscription_response_message {
        packet.extract(hdr.subscription_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_pending_response_message {
        packet.extract(hdr.pending_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat_packet {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session_packet {
        meta.dispatched = 1;
        transition accept;
    }

}

control IseoptionsOttoServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsOttoServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control IseoptionsOttoServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IseoptionsOttoServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsOttoServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet_debug_text);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.simple_instrument_directory_message);
        packet.emit(hdr.complex_instrument_directory_message);
        packet.emit(hdr.complex_instrument_directory_message_complex_directory_legs);
        packet.emit(hdr.instrument_trading_action_message);
        packet.emit(hdr.auction_notification_message);
        packet.emit(hdr.auction_notification_message_flex_dac_legs);
        packet.emit(hdr.order_accepted_long_form_message);
        packet.emit(hdr.order_accepted_long_form_message_flex_legs);
        packet.emit(hdr.order_accepted_short_form_message);
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.order_canceled_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.trade_details_message);
        packet.emit(hdr.cross_order_accepted_message);
        packet.emit(hdr.member_kill_switch_notification_message);
        packet.emit(hdr.mass_cancel_response_message);
        packet.emit(hdr.add_complex_instrument_response_message);
        packet.emit(hdr.modify_trade_response_message);
        packet.emit(hdr.subscription_response_message);
        packet.emit(hdr.reject_message);
        packet.emit(hdr.pending_response_message);
    }
}

V1Switch(
    IseoptionsOttoServerParser(),
    IseoptionsOttoServerVerifyChecksum(),
    IseoptionsOttoServerIngress(),
    IseoptionsOttoServerEgress(),
    IseoptionsOttoServerComputeChecksum(),
    IseoptionsOttoServerDeparser()
) main;
