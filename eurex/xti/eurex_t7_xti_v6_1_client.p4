// P4_16 (v1model) definition for: Eurex T7 Xti Fbe v6.1
// 
// Protocol:
//   Organization: Eurex Exchange
//   Protocol: Cash Enhanced Trading Interface
//   Encoding: Flat Binary Encoding
//   Version: 6.1
//   Date: 05/16/2018
//   Specification: T7-Enhanced-Trading-Interface-Manual.pdf
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

header cross_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> order_qty;
}

header delete_all_order_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<32> target_party_id_executing_trader;
    bit<8> side;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> pad1;
}

header delete_all_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<48> pad6;
}

header delete_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<160> fix_cl_ord_id;
    bit<16> pad2v2;
}

header enter_best_quote_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> quote_id;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<64> peg_offset_value_bid_px;
    bit<64> peg_offset_value_offer_px;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> bid_size;
    bit<32> offer_size;
    bit<32> reserved_bid_size;
    bit<32> reserved_offer_size;
    bit<32> market_segment_id;
    bit<16> enrichment_rule_id;
    bit<8> order_attribute_liquidity_provision;
    bit<8> value_check_type_quantity;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<48> pad6;
}

header gateway_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<32> party_id_session_id;
    bit<16> partition_id;
    bit<240> default_cstm_appl_ver_id;
    bit<256> password;
    bit<32> pad4;
}

header heartbeat_t {
    bit<64> network_msg_id;
    bit<16> pad2;
}

header inquire_enrichment_rule_id_list_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<128> last_entity_processed;
}

header inquire_session_list_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
}

header inquire_user_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<128> last_entity_processed;
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
    bit<64> quote_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> quote_size_type;
    bit<8> order_attribute_liquidity_provision;
    bit<8> no_quote_entries;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<48> pad6;
    bit<64> security_id;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<32> bid_size;
    bit<32> offer_size;
}

header modify_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> volume_discovery_price;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_low_qty;
    bit<32> display_high_qty;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<32> target_party_id_session_id;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> stop_px_indicator;
    bit<8> trading_capacity;
    bit<8> ex_destination_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<8> ownership_indicator;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<160> fix_cl_ord_id;
    bit<32> pad4;
}

header modify_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> side;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> appl_seq_indicator;
    bit<8> exec_inst;
    bit<8> trading_capacity;
    bit<8> ex_destination_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<16> pad2v2;
}

header new_order_single_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> volume_discovery_price;
    bit<64> peg_offset_value_abs;
    bit<64> peg_offset_value_pct;
    bit<64> cl_ord_id;
    bit<64> security_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_low_qty;
    bit<32> display_high_qty;
    bit<32> expire_date;
    bit<32> market_segment_id;
    bit<32> match_inst_cross_id;
    bit<8> appl_seq_indicator;
    bit<8> side;
    bit<8> ord_type;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_session_sub_id;
    bit<8> trading_capacity;
    bit<8> ex_destination_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<96> free_text_1;
    bit<96> free_text_2;
    bit<128> free_text_4;
    bit<160> fix_cl_ord_id;
    bit<16> pad2v2;
}

header new_order_single_short_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<64> price;
    bit<64> cl_ord_id;
    bit<64> party_id_client_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> order_qty;
    bit<32> match_inst_cross_id;
    bit<16> enrichment_rule_id;
    bit<8> side;
    bit<8> appl_seq_indicator;
    bit<8> price_validity_check_type;
    bit<8> value_check_type_value;
    bit<8> value_check_type_quantity;
    bit<8> order_attribute_liquidity_provision;
    bit<8> time_in_force;
    bit<8> exec_inst;
    bit<8> trading_capacity;
    bit<8> ex_destination_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<16> pad2v2;
}

header quote_activation_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> party_id_investment_decision_maker;
    bit<64> executing_trader;
    bit<32> market_segment_id;
    bit<32> target_party_id_session_id;
    bit<8> mass_action_type;
    bit<8> party_id_investment_decision_maker_qualifier;
    bit<8> executing_trader_qualifier;
    bit<40> pad5;
}

header rfq_request_t {
    bit<64> network_msg_id;
    bit<16> pad2;
    bit<32> msg_seq_num;
    bit<32> sender_sub_id;
    bit<64> security_id;
    bit<32> market_segment_id;
    bit<32> order_qty;
    bit<8> rfq_publish_indicator;
    bit<8> rfq_requester_disclosure_instruction;
    bit<8> side;
    bit<40> pad5;
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
    bit<16> partition_id;
    bit<8> ref_appl_id;
    bit<40> pad5;
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

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    cross_request_t cross_request;
    delete_all_order_request_t delete_all_order_request;
    delete_all_quote_request_t delete_all_quote_request;
    delete_order_single_request_t delete_order_single_request;
    enter_best_quote_request_t enter_best_quote_request;
    gateway_request_t gateway_request;
    heartbeat_t heartbeat;
    inquire_enrichment_rule_id_list_request_t inquire_enrichment_rule_id_list_request;
    inquire_session_list_request_t inquire_session_list_request;
    inquire_user_request_t inquire_user_request;
    logon_request_t logon_request;
    logout_request_t logout_request;
    mass_quote_request_t mass_quote_request;
    modify_order_single_request_t modify_order_single_request;
    modify_order_single_short_request_t modify_order_single_short_request;
    new_order_single_request_t new_order_single_request;
    new_order_single_short_request_t new_order_single_short_request;
    quote_activation_request_t quote_activation_request;
    rfq_request_t rfq_request;
    retransmit_me_message_request_t retransmit_me_message_request;
    retransmit_request_t retransmit_request;
    subscribe_request_t subscribe_request;
    unsubscribe_request_t unsubscribe_request;
    user_login_request_t user_login_request;
    user_logout_request_t user_logout_request;
}

parser EurexT7XtiClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10118: parse_cross_request;
            16w10120: parse_delete_all_order_request;
            16w10408: parse_delete_all_quote_request;
            16w10109: parse_delete_order_single_request;
            16w10412: parse_enter_best_quote_request;
            16w10020: parse_gateway_request;
            16w10011: parse_heartbeat;
            16w10040: parse_inquire_enrichment_rule_id_list_request;
            16w10035: parse_inquire_session_list_request;
            16w10038: parse_inquire_user_request;
            16w10000: parse_logon_request;
            16w10002: parse_logout_request;
            16w10405: parse_mass_quote_request;
            16w10106: parse_modify_order_single_request;
            16w10126: parse_modify_order_single_short_request;
            16w10100: parse_new_order_single_request;
            16w10125: parse_new_order_single_short_request;
            16w10403: parse_quote_activation_request;
            16w10401: parse_rfq_request;
            16w10026: parse_retransmit_me_message_request;
            16w10008: parse_retransmit_request;
            16w10025: parse_subscribe_request;
            16w10006: parse_unsubscribe_request;
            16w10018: parse_user_login_request;
            16w10029: parse_user_logout_request;
            default: accept;
        }
    }

    state parse_cross_request {
        packet.extract(hdr.cross_request);
        transition accept;
    }

    state parse_delete_all_order_request {
        packet.extract(hdr.delete_all_order_request);
        transition accept;
    }

    state parse_delete_all_quote_request {
        packet.extract(hdr.delete_all_quote_request);
        transition accept;
    }

    state parse_delete_order_single_request {
        packet.extract(hdr.delete_order_single_request);
        transition accept;
    }

    state parse_enter_best_quote_request {
        packet.extract(hdr.enter_best_quote_request);
        transition accept;
    }

    state parse_gateway_request {
        packet.extract(hdr.gateway_request);
        transition accept;
    }

    state parse_heartbeat {
        packet.extract(hdr.heartbeat);
        transition accept;
    }

    state parse_inquire_enrichment_rule_id_list_request {
        packet.extract(hdr.inquire_enrichment_rule_id_list_request);
        transition accept;
    }

    state parse_inquire_session_list_request {
        packet.extract(hdr.inquire_session_list_request);
        transition accept;
    }

    state parse_inquire_user_request {
        packet.extract(hdr.inquire_user_request);
        transition accept;
    }

    state parse_logon_request {
        packet.extract(hdr.logon_request);
        transition accept;
    }

    state parse_logout_request {
        packet.extract(hdr.logout_request);
        transition accept;
    }

    state parse_mass_quote_request {
        packet.extract(hdr.mass_quote_request);
        transition accept;
    }

    state parse_modify_order_single_request {
        packet.extract(hdr.modify_order_single_request);
        transition accept;
    }

    state parse_modify_order_single_short_request {
        packet.extract(hdr.modify_order_single_short_request);
        transition accept;
    }

    state parse_new_order_single_request {
        packet.extract(hdr.new_order_single_request);
        transition accept;
    }

    state parse_new_order_single_short_request {
        packet.extract(hdr.new_order_single_short_request);
        transition accept;
    }

    state parse_quote_activation_request {
        packet.extract(hdr.quote_activation_request);
        transition accept;
    }

    state parse_rfq_request {
        packet.extract(hdr.rfq_request);
        transition accept;
    }

    state parse_retransmit_me_message_request {
        packet.extract(hdr.retransmit_me_message_request);
        transition accept;
    }

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        transition accept;
    }

    state parse_subscribe_request {
        packet.extract(hdr.subscribe_request);
        transition accept;
    }

    state parse_unsubscribe_request {
        packet.extract(hdr.unsubscribe_request);
        transition accept;
    }

    state parse_user_login_request {
        packet.extract(hdr.user_login_request);
        transition accept;
    }

    state parse_user_logout_request {
        packet.extract(hdr.user_logout_request);
        transition accept;
    }

}

control EurexT7XtiClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control EurexT7XtiClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control EurexT7XtiClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control EurexT7XtiClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.cross_request);
        packet.emit(hdr.delete_all_order_request);
        packet.emit(hdr.delete_all_quote_request);
        packet.emit(hdr.delete_order_single_request);
        packet.emit(hdr.enter_best_quote_request);
        packet.emit(hdr.gateway_request);
        packet.emit(hdr.heartbeat);
        packet.emit(hdr.inquire_enrichment_rule_id_list_request);
        packet.emit(hdr.inquire_session_list_request);
        packet.emit(hdr.inquire_user_request);
        packet.emit(hdr.logon_request);
        packet.emit(hdr.logout_request);
        packet.emit(hdr.mass_quote_request);
        packet.emit(hdr.modify_order_single_request);
        packet.emit(hdr.modify_order_single_short_request);
        packet.emit(hdr.new_order_single_request);
        packet.emit(hdr.new_order_single_short_request);
        packet.emit(hdr.quote_activation_request);
        packet.emit(hdr.rfq_request);
        packet.emit(hdr.retransmit_me_message_request);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.subscribe_request);
        packet.emit(hdr.unsubscribe_request);
        packet.emit(hdr.user_login_request);
        packet.emit(hdr.user_logout_request);
    }
}

V1Switch(
    EurexT7XtiClientParser(),
    EurexT7XtiClientVerifyChecksum(),
    EurexT7XtiClientIngress(),
    EurexT7XtiClientEgress(),
    EurexT7XtiClientComputeChecksum(),
    EurexT7XtiClientDeparser()
) main;
