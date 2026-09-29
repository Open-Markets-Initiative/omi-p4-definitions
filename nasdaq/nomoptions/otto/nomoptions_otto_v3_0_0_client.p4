// P4_16 (v1model) definition for: Nasdaq NomOptions Otto Ouch v3.0.0
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_t {
    bit<8> unsequenced_message_type;
}

header new_order_long_form_message_t {
    bit<32> firm_id;
    bit<32> instrument_id;
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
    bit<32> auction_duration;
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
    bit<8> session_eligibility;
    bit<64> reserved_8;
    bit<8> number_of_flex_legs;
}

header new_order_long_form_message_flex_leg_prices_t {
    bit<64> leg_prices;
    bit<64> reserved_8;
}

header new_order_short_form_message_t {
    bit<32> firm_id;
    bit<32> instrument_id;
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

header replace_order_message_t {
    bit<32> firm_id;
    bit<128> orig_cl_ord_id;
    bit<128> cl_ord_id;
    bit<32> quantity;
    bit<8> order_type;
    bit<64> price;
    bit<8> tif;
    bit<80> cust_acct;
    bit<8> price_protection;
}

header cancel_order_message_t {
    bit<32> firm_id;
    bit<128> cl_ord_id;
}

header mass_cancel_message_t {
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<8> instrument_type;
    bit<8> scope;
    bit<16> product_id;
    bit<32> instrument_id;
    bit<104> underlying_symbol;
}

header new_cross_order_message_t {
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<8> cross_type;
    bit<8> auction_type;
    bit<8> auction_alloc_pct;
    bit<8> side;
    bit<8> iso;
    bit<8> price_protection;
    bit<64> effective_time;
    bit<8> disclosure_mask;
    bit<32> auction_duration;
    bit<72> reserved_9;
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
    bit<8> primary_stock_capacity;
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
    bit<8> contra_stock_capacity;
    bit<8> number_of_flex_legs;
}

header new_cross_order_message_flex_leg_prices_t {
    bit<64> leg_prices;
    bit<64> reserved_8;
}

header add_complex_instrument_message_t {
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<16> product_id;
    bit<104> product_name;
    bit<8> num_legs;
}

header add_complex_instrument_message_complex_instrument_legs_t {
    bit<8> leg_type;
    bit<32> leg_instrument_id;
    bit<8> leg_side;
    bit<16> leg_ratio;
}

header modify_trade_message_t {
    bit<32> firm_id;
    bit<32> instrument_id;
    bit<128> cl_request_id;
    bit<128> cl_ord_id;
    bit<32> cross_id;
    bit<32> match_id;
    bit<8> side;
    bit<32> quantity;
    bit<16> num_splits;
}

header modify_trade_message_trade_splits_t {
    bit<32> alloc_qty;
    bit<32> cmta;
    bit<32> clearing_account;
    bit<32> occ_account;
    bit<80> cust_acct;
    bit<32> stock_leg_mpid;
    bit<8> capacity;
    bit<8> open_close;
    bit<8> stock_capacity;
}

header member_kill_switch_request_message_t {
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<32> target_firm_id;
    bit<8> kill_action;
}

header subscription_request_message_t {
    bit<32> firm_id;
    bit<128> cl_request_id;
    bit<128> subscription;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> new_order_long_form_message_flex_leg_prices_remaining;
    bit<8> new_cross_order_message_flex_leg_prices_remaining;
    bit<8> add_complex_instrument_message_complex_instrument_legs_remaining;
    bit<16> modify_trade_message_trade_splits_remaining;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    new_order_long_form_message_t new_order_long_form_message;
    new_order_long_form_message_flex_leg_prices_t new_order_long_form_message_flex_leg_prices[MAX_MESSAGES];
    new_order_short_form_message_t new_order_short_form_message;
    replace_order_message_t replace_order_message;
    cancel_order_message_t cancel_order_message;
    mass_cancel_message_t mass_cancel_message;
    new_cross_order_message_t new_cross_order_message;
    new_cross_order_message_flex_leg_prices_t new_cross_order_message_flex_leg_prices[MAX_MESSAGES];
    add_complex_instrument_message_t add_complex_instrument_message;
    add_complex_instrument_message_complex_instrument_legs_t add_complex_instrument_message_complex_instrument_legs[MAX_MESSAGES];
    modify_trade_message_t modify_trade_message;
    modify_trade_message_trade_splits_t modify_trade_message_trade_splits[MAX_MESSAGES];
    member_kill_switch_request_message_t member_kill_switch_request_message;
    subscription_request_message_t subscription_request_message;
}

parser NomoptionsOttoClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat_packet;
            8w0x4f: parse_logout_request_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            8w0x41: parse_new_order_long_form_message;
            8w0x42: parse_new_order_short_form_message;
            8w0x52: parse_replace_order_message;
            8w0x43: parse_cancel_order_message;
            8w0x55: parse_mass_cancel_message;
            8w0x58: parse_new_cross_order_message;
            8w0x53: parse_add_complex_instrument_message;
            8w0x4d: parse_modify_trade_message;
            8w0x4b: parse_member_kill_switch_request_message;
            8w0x46: parse_subscription_request_message;
            default: accept;
        }
    }

    state parse_new_order_long_form_message {
        packet.extract(hdr.new_order_long_form_message);
        meta.dispatched = 1;
        meta.new_order_long_form_message_flex_leg_prices_remaining = hdr.new_order_long_form_message.number_of_flex_legs;
        transition select(meta.new_order_long_form_message_flex_leg_prices_remaining) {
            8w0: accept;
            default: parse_new_order_long_form_message_flex_leg_prices;
        }
    }

    state parse_new_order_long_form_message_flex_leg_prices {
        packet.extract(hdr.new_order_long_form_message_flex_leg_prices.next);
        meta.new_order_long_form_message_flex_leg_prices_remaining = meta.new_order_long_form_message_flex_leg_prices_remaining - 1;
        transition select(meta.new_order_long_form_message_flex_leg_prices_remaining) {
            8w0: accept;
            default: parse_new_order_long_form_message_flex_leg_prices;
        }
    }

    state parse_new_order_short_form_message {
        packet.extract(hdr.new_order_short_form_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replace_order_message {
        packet.extract(hdr.replace_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order_message {
        packet.extract(hdr.cancel_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_message {
        packet.extract(hdr.mass_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_cross_order_message {
        packet.extract(hdr.new_cross_order_message);
        meta.dispatched = 1;
        meta.new_cross_order_message_flex_leg_prices_remaining = hdr.new_cross_order_message.number_of_flex_legs;
        transition select(meta.new_cross_order_message_flex_leg_prices_remaining) {
            8w0: accept;
            default: parse_new_cross_order_message_flex_leg_prices;
        }
    }

    state parse_new_cross_order_message_flex_leg_prices {
        packet.extract(hdr.new_cross_order_message_flex_leg_prices.next);
        meta.new_cross_order_message_flex_leg_prices_remaining = meta.new_cross_order_message_flex_leg_prices_remaining - 1;
        transition select(meta.new_cross_order_message_flex_leg_prices_remaining) {
            8w0: accept;
            default: parse_new_cross_order_message_flex_leg_prices;
        }
    }

    state parse_add_complex_instrument_message {
        packet.extract(hdr.add_complex_instrument_message);
        meta.dispatched = 1;
        meta.add_complex_instrument_message_complex_instrument_legs_remaining = hdr.add_complex_instrument_message.num_legs;
        transition select(meta.add_complex_instrument_message_complex_instrument_legs_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_message_complex_instrument_legs;
        }
    }

    state parse_add_complex_instrument_message_complex_instrument_legs {
        packet.extract(hdr.add_complex_instrument_message_complex_instrument_legs.next);
        meta.add_complex_instrument_message_complex_instrument_legs_remaining = meta.add_complex_instrument_message_complex_instrument_legs_remaining - 1;
        transition select(meta.add_complex_instrument_message_complex_instrument_legs_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_message_complex_instrument_legs;
        }
    }

    state parse_modify_trade_message {
        packet.extract(hdr.modify_trade_message);
        meta.dispatched = 1;
        meta.modify_trade_message_trade_splits_remaining = hdr.modify_trade_message.num_splits;
        transition select(meta.modify_trade_message_trade_splits_remaining) {
            16w0: accept;
            default: parse_modify_trade_message_trade_splits;
        }
    }

    state parse_modify_trade_message_trade_splits {
        packet.extract(hdr.modify_trade_message_trade_splits.next);
        meta.modify_trade_message_trade_splits_remaining = meta.modify_trade_message_trade_splits_remaining - 1;
        transition select(meta.modify_trade_message_trade_splits_remaining) {
            16w0: accept;
            default: parse_modify_trade_message_trade_splits;
        }
    }

    state parse_member_kill_switch_request_message {
        packet.extract(hdr.member_kill_switch_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscription_request_message {
        packet.extract(hdr.subscription_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat_packet {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request_packet {
        meta.dispatched = 1;
        transition accept;
    }

}

control NomoptionsOttoClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsOttoClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NomoptionsOttoClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NomoptionsOttoClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsOttoClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.new_order_long_form_message);
        packet.emit(hdr.new_order_long_form_message_flex_leg_prices);
        packet.emit(hdr.new_order_short_form_message);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.cancel_order_message);
        packet.emit(hdr.mass_cancel_message);
        packet.emit(hdr.new_cross_order_message);
        packet.emit(hdr.new_cross_order_message_flex_leg_prices);
        packet.emit(hdr.add_complex_instrument_message);
        packet.emit(hdr.add_complex_instrument_message_complex_instrument_legs);
        packet.emit(hdr.modify_trade_message);
        packet.emit(hdr.modify_trade_message_trade_splits);
        packet.emit(hdr.member_kill_switch_request_message);
        packet.emit(hdr.subscription_request_message);
    }
}

V1Switch(
    NomoptionsOttoClientParser(),
    NomoptionsOttoClientVerifyChecksum(),
    NomoptionsOttoClientIngress(),
    NomoptionsOttoClientEgress(),
    NomoptionsOttoClientComputeChecksum(),
    NomoptionsOttoClientDeparser()
) main;
