// P4_16 (v1model) definition for: Bse BseIndia Eti Fbe v1.6.14
// 
// Protocol:
//   Organization: BSE Limited
//   Protocol: Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 1.6.14
//   Date: 3/30/2026
//   Specification: BSE_ETI_Manual_V1.6.14.pdf
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
    bit<32> body_len;
    bit<16> template_id;
}

header debt_inquiry_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> underlying_px;
    bit<64> yield;
    bit<64> security_id;
    bit<32> order_qty;
    bit<32> pad4;
}

header delete_all_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> regulatory_id;
    bit<128> algo_id;
    bit<32> target_party_id_session_id;
    bit<32> target_party_id_executing_trader;
}

header delete_all_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<128> algo_id;
    bit<32> regulatory_id;
    bit<32> pad4;
}

header delete_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> filler1;
    bit<32> message_tag;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> regulatory_id;
    bit<128> algo_id;
}

header delete_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> filler1;
    bit<32> message_tag;
    bit<32> market_segment_id;
    bit<32> simple_security_id;
    bit<32> target_party_id_session_id;
    bit<32> regulatory_id;
    bit<128> algo_id;
    bit<32> pad4;
}

header gateway_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<48> pad6;
}

header heartbeat_t {
    bit<64> network_msg_id;
    bit<16> pad2;
}

header inquire_session_list_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header logon_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> heart_bt_int;
    bit<32> party_id_session_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<8> appl_usage_orders;
    bit<8> appl_usage_quotes;
    bit<8> order_routing_indicator;
    bit<240> fix_engine_name;
    bit<240> fix_engine_version;
    bit<240> fix_engine_vendor;
    bit<240> application_system_name;
    bit<240> application_system_version;
    bit<240> application_system_vendor;
    bit<24> pad3;
}

header logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header mass_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> sender_location_id;
    bit<64> quote_id;
    bit<32> market_segment_id;
    bit<32> regulatory_id;
    bit<16> enrichment_rule_id;
    bit<8> account_type;
    bit<8> price_validity_check_type;
    bit<8> quote_size_type;
    bit<8> stpc_flag;
    bit<8> no_quote_entries;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
    bit<8> pad1;
}

header mass_quote_request_quote_entry_grp_comp_t {
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<32> bid_size;
    bit<32> offer_size;
    bit<32> message_tag;
    bit<32> pad4;
}

header modify_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> max_price_percentage;
    bit<64> sender_location_id;
    bit<64> activity_time;
    bit<64> filler1;
    bit<32> filler2;
    bit<32> market_segment_id;
    bit<32> message_tag;
    bit<32> order_qty;
    bit<32> max_show;
    bit<32> expire_date;
    bit<32> target_party_id_session_id;
    bit<32> regulatory_id;
    bit<16> filler4;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> account_type;
    bit<8> appl_seq_indicator;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> rollover_flag;
    bit<8> trading_capacity;
    bit<8> delta_qty_flag;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> regulatory_text;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
    bit<96> free_text_3;
    bit<8> no_legs;
    bit<16> pad2v2;
}

header modify_order_complex_request_leg_ord_grp_comp_t {
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5;
}

header modify_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> max_price_percentage;
    bit<64> sender_location_id;
    bit<64> activity_time;
    bit<64> filler1;
    bit<32> filler2;
    bit<32> message_tag;
    bit<32> order_qty;
    bit<32> max_show;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> simple_security_id;
    bit<32> target_party_id_session_id;
    bit<32> regulatory_id;
    bit<16> filler4;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> account_type;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> rollover_flag;
    bit<8> trading_session_sub_id;
    bit<8> trading_capacity;
    bit<8> delta_qty_flag;
    bit<16> account;
    bit<8> position_effect;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> regulatory_text;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
    bit<96> free_text_3;
    bit<32> pad4;
}

header modify_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<64> sender_location_id;
    bit<64> activity_time;
    bit<32> order_qty;
    bit<32> max_show;
    bit<32> simple_security_id;
    bit<32> filler2;
    bit<16> filler4;
    bit<8> account_type;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
    bit<8> pad1;
}

header multi_leg_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> sender_location_id;
    bit<64> cl_ord_id;
    bit<8> account_type;
    bit<8> all_or_none_flag;
    bit<8> no_of_multi_leg;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
    bit<40> pad5;
}

header multi_leg_order_request_multi_leg_ord_grp_comp_t {
    bit<64> security_id;
    bit<64> price;
    bit<64> max_price_percentage;
    bit<32> message_tag;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_type;
    bit<8> pad1;
}

header new_order_complex_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> max_price_percentage;
    bit<64> sender_location_id;
    bit<64> price;
    bit<64> filler1;
    bit<32> filler2;
    bit<32> message_tag;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<32> max_show;
    bit<32> expire_date;
    bit<32> regulatory_id;
    bit<16> filler4;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> account_type;
    bit<8> appl_seq_indicator;
    bit<8> product_complex;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> exec_inst;
    bit<8> time_in_force;
    bit<8> stpc_flag;
    bit<8> rollover_flag;
    bit<8> trading_capacity;
    bit<16> party_id_location_id;
    bit<160> regulatory_text;
    bit<128> algo_id;
    bit<8> cust_order_handling_inst;
    bit<96> client_code;
    bit<96> cp_code;
    bit<96> free_text_3;
    bit<8> no_legs;
    bit<48> pad6;
}

header new_order_complex_request_leg_ord_grp_comp_t {
    bit<16> leg_account;
    bit<8> leg_position_effect;
    bit<40> pad5;
}

header new_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> max_price_percentage;
    bit<64> sender_location_id;
    bit<64> cl_ord_id;
    bit<64> filler1;
    bit<32> filler2;
    bit<32> message_tag;
    bit<32> order_qty;
    bit<32> max_show;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> simple_security_id;
    bit<32> regulatory_id;
    bit<16> filler4;
    bit<40> party_id_take_up_trading_firm;
    bit<56> party_id_order_origination_firm;
    bit<72> party_id_beneficiary;
    bit<8> account_type;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> stpc_flag;
    bit<8> rollover_flag;
    bit<8> trading_session_sub_id;
    bit<8> trading_capacity;
    bit<16> account;
    bit<8> position_effect;
    bit<16> party_id_location_id;
    bit<8> cust_order_handling_inst;
    bit<160> regulatory_text;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
    bit<96> free_text_3;
}

header new_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> sender_location_id;
    bit<64> cl_ord_id;
    bit<32> order_qty;
    bit<32> max_show;
    bit<32> simple_security_id;
    bit<32> filler2;
    bit<16> filler4;
    bit<8> account_type;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> time_in_force;
    bit<8> stpc_flag;
    bit<8> exec_inst;
    bit<128> algo_id;
    bit<96> client_code;
    bit<96> cp_code;
}

header retransmit_me_message_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> subscription_scope;
    bit<16> partition_id;
    bit<8> ref_appl_id;
    bit<128> appl_beg_msg_id;
    bit<128> appl_end_msg_id;
    bit<8> pad1;
}

header retransmit_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> appl_beg_seq_num;
    bit<64> appl_end_seq_num;
    bit<32> subscription_scope;
    bit<16> partition_id;
    bit<8> ref_appl_id;
    bit<8> pad1;
}

header session_password_change_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_session_id;
    bit<256> password;
    bit<256> new_password;
    bit<32> pad4;
}

header session_registration_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_session_id;
    bit<32> pad4;
    bit<64> filler1;
}

header subscribe_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> subscription_scope;
    bit<8> ref_appl_id;
    bit<24> pad3;
}

header unsubscribe_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> ref_appl_sub_id;
    bit<32> pad4;
}

header user_login_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<256> password;
    bit<32> pad4;
}

header user_logout_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<32> pad4;
}

header user_password_change_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> username;
    bit<256> password;
    bit<256> new_password;
    bit<32> pad4;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> mass_quote_request_quote_entry_grp_comp_remaining;
    bit<8> modify_order_complex_request_leg_ord_grp_comp_remaining;
    bit<8> multi_leg_order_request_multi_leg_ord_grp_comp_remaining;
    bit<8> new_order_complex_request_leg_ord_grp_comp_remaining;
}

struct headers_t {
    message_header_t message_header;
    debt_inquiry_request_t debt_inquiry_request;
    delete_all_order_request_t delete_all_order_request;
    delete_all_quote_request_t delete_all_quote_request;
    delete_order_complex_request_t delete_order_complex_request;
    delete_order_single_request_t delete_order_single_request;
    gateway_request_t gateway_request;
    heartbeat_t heartbeat;
    inquire_session_list_request_t inquire_session_list_request;
    logon_request_t logon_request;
    logout_request_t logout_request;
    mass_quote_request_t mass_quote_request;
    mass_quote_request_quote_entry_grp_comp_t mass_quote_request_quote_entry_grp_comp[MAX_MESSAGES];
    modify_order_complex_request_t modify_order_complex_request;
    modify_order_complex_request_leg_ord_grp_comp_t modify_order_complex_request_leg_ord_grp_comp[MAX_MESSAGES];
    modify_order_single_request_t modify_order_single_request;
    modify_order_single_short_request_t modify_order_single_short_request;
    multi_leg_order_request_t multi_leg_order_request;
    multi_leg_order_request_multi_leg_ord_grp_comp_t multi_leg_order_request_multi_leg_ord_grp_comp[MAX_MESSAGES];
    new_order_complex_request_t new_order_complex_request;
    new_order_complex_request_leg_ord_grp_comp_t new_order_complex_request_leg_ord_grp_comp[MAX_MESSAGES];
    new_order_single_request_t new_order_single_request;
    new_order_single_short_request_t new_order_single_short_request;
    retransmit_me_message_request_t retransmit_me_message_request;
    retransmit_request_t retransmit_request;
    session_password_change_request_t session_password_change_request;
    session_registration_request_t session_registration_request;
    subscribe_request_t subscribe_request;
    unsubscribe_request_t unsubscribe_request;
    user_login_request_t user_login_request;
    user_logout_request_t user_logout_request;
    user_password_change_request_t user_password_change_request;
}

parser BseindiaEtiClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0x9628: parse_debt_inquiry_request;
            16w0x8827: parse_delete_all_order_request;
            16w0xa828: parse_delete_all_quote_request;
            16w0x8b27: parse_delete_order_complex_request;
            16w0x7d27: parse_delete_order_single_request;
            16w0x2427: parse_gateway_request;
            16w0x1b27: parse_heartbeat;
            16w0x3327: parse_inquire_session_list_request;
            16w0x1027: parse_logon_request;
            16w0x1227: parse_logout_request;
            16w0xa528: parse_mass_quote_request;
            16w0x8227: parse_modify_order_complex_request;
            16w0x7a27: parse_modify_order_single_request;
            16w0x8e27: parse_modify_order_single_short_request;
            16w0xef2a: parse_multi_leg_order_request;
            16w0x8127: parse_new_order_complex_request;
            16w0x7427: parse_new_order_single_request;
            16w0x8d27: parse_new_order_single_short_request;
            16w0x2a27: parse_retransmit_me_message_request;
            16w0x1827: parse_retransmit_request;
            16w0xf52a: parse_session_password_change_request;
            16w0x4527: parse_session_registration_request;
            16w0x2927: parse_subscribe_request;
            16w0x1627: parse_unsubscribe_request;
            16w0x2227: parse_user_login_request;
            16w0x2d27: parse_user_logout_request;
            16w0xf42a: parse_user_password_change_request;
            default: accept;
        }
    }

    state parse_debt_inquiry_request {
        packet.extract(hdr.debt_inquiry_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_order_request {
        packet.extract(hdr.delete_all_order_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_all_quote_request {
        packet.extract(hdr.delete_all_quote_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_complex_request {
        packet.extract(hdr.delete_order_complex_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_single_request {
        packet.extract(hdr.delete_order_single_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_request {
        packet.extract(hdr.gateway_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquire_session_list_request {
        packet.extract(hdr.inquire_session_list_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_request {
        packet.extract(hdr.logon_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_request {
        packet.extract(hdr.mass_quote_request);
        meta.dispatched = 1;
        meta.mass_quote_request_quote_entry_grp_comp_remaining = hdr.mass_quote_request.no_quote_entries;
        transition select(meta.mass_quote_request_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_mass_quote_request_quote_entry_grp_comp;
        }
    }

    state parse_mass_quote_request_quote_entry_grp_comp {
        packet.extract(hdr.mass_quote_request_quote_entry_grp_comp.next);
        meta.mass_quote_request_quote_entry_grp_comp_remaining = meta.mass_quote_request_quote_entry_grp_comp_remaining - 1;
        transition select(meta.mass_quote_request_quote_entry_grp_comp_remaining) {
            8w0: accept;
            default: parse_mass_quote_request_quote_entry_grp_comp;
        }
    }

    state parse_modify_order_complex_request {
        packet.extract(hdr.modify_order_complex_request);
        meta.dispatched = 1;
        meta.modify_order_complex_request_leg_ord_grp_comp_remaining = hdr.modify_order_complex_request.no_legs;
        transition select(meta.modify_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_modify_order_complex_request_leg_ord_grp_comp {
        packet.extract(hdr.modify_order_complex_request_leg_ord_grp_comp.next);
        meta.modify_order_complex_request_leg_ord_grp_comp_remaining = meta.modify_order_complex_request_leg_ord_grp_comp_remaining - 1;
        transition select(meta.modify_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_modify_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_modify_order_single_request {
        packet.extract(hdr.modify_order_single_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_order_single_short_request {
        packet.extract(hdr.modify_order_single_short_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_multi_leg_order_request {
        packet.extract(hdr.multi_leg_order_request);
        meta.dispatched = 1;
        meta.multi_leg_order_request_multi_leg_ord_grp_comp_remaining = hdr.multi_leg_order_request.no_of_multi_leg;
        transition select(meta.multi_leg_order_request_multi_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_multi_leg_order_request_multi_leg_ord_grp_comp;
        }
    }

    state parse_multi_leg_order_request_multi_leg_ord_grp_comp {
        packet.extract(hdr.multi_leg_order_request_multi_leg_ord_grp_comp.next);
        meta.multi_leg_order_request_multi_leg_ord_grp_comp_remaining = meta.multi_leg_order_request_multi_leg_ord_grp_comp_remaining - 1;
        transition select(meta.multi_leg_order_request_multi_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_multi_leg_order_request_multi_leg_ord_grp_comp;
        }
    }

    state parse_new_order_complex_request {
        packet.extract(hdr.new_order_complex_request);
        meta.dispatched = 1;
        meta.new_order_complex_request_leg_ord_grp_comp_remaining = hdr.new_order_complex_request.no_legs;
        transition select(meta.new_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_new_order_complex_request_leg_ord_grp_comp {
        packet.extract(hdr.new_order_complex_request_leg_ord_grp_comp.next);
        meta.new_order_complex_request_leg_ord_grp_comp_remaining = meta.new_order_complex_request_leg_ord_grp_comp_remaining - 1;
        transition select(meta.new_order_complex_request_leg_ord_grp_comp_remaining) {
            8w0: accept;
            default: parse_new_order_complex_request_leg_ord_grp_comp;
        }
    }

    state parse_new_order_single_request {
        packet.extract(hdr.new_order_single_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_single_short_request {
        packet.extract(hdr.new_order_single_short_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_me_message_request {
        packet.extract(hdr.retransmit_me_message_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_password_change_request {
        packet.extract(hdr.session_password_change_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_registration_request {
        packet.extract(hdr.session_registration_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscribe_request {
        packet.extract(hdr.subscribe_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_login_request {
        packet.extract(hdr.user_login_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_password_change_request {
        packet.extract(hdr.user_password_change_request);
        meta.dispatched = 1;
        transition accept;
    }

}

control BseindiaEtiClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BseindiaEtiClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BseindiaEtiClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BseindiaEtiClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BseindiaEtiClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.debt_inquiry_request);
        packet.emit(hdr.delete_all_order_request);
        packet.emit(hdr.delete_all_quote_request);
        packet.emit(hdr.delete_order_complex_request);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.gateway_request);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.mass_quote_request_quote_entry_grp_comp);
        packet.emit(hdr.modify_order_complex_request);
        packet.emit(hdr.modify_order_complex_request_leg_ord_grp_comp);
        packet.emit(hdr.modify_order_single_request);
        packet.emit(hdr.modify_order_single_short_request);
        packet.emit(hdr.multi_leg_order_request);
        packet.emit(hdr.multi_leg_order_request_multi_leg_ord_grp_comp);
        packet.emit(hdr.new_order_complex_request);
        packet.emit(hdr.new_order_complex_request_leg_ord_grp_comp);
        packet.emit(hdr.new_order_single_request);
        packet.emit(hdr.new_order_single_short_request);
        packet.emit(hdr.retransmit_me_message_request);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.session_password_change_request);
        packet.emit(hdr.session_registration_request);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_logout_request);
        packet.emit(hdr.user_password_change_request);
    }
}

V1Switch(
    BseindiaEtiClientParser(),
    BseindiaEtiClientVerifyChecksum(),
    BseindiaEtiClientIngress(),
    BseindiaEtiClientEgress(),
    BseindiaEtiClientComputeChecksum(),
    BseindiaEtiClientDeparser()
) main;
