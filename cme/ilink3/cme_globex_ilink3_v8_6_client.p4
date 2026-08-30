// P4_16 (v1model) definition for: Cme Globex iLink3 Sbe v8.6
// 
// Protocol:
//   Organization: CME Group
//   Protocol: iLink 3
//   Encoding: Simple Binary Encoding
//   Version: 8.6
//   Date: 10/13/2020
//   Specification: Unknown
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<16> message_length;
    bit<16> encoding_type;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header negotiate_t {
    bit<256> hmac_signature;
    bit<160> access_key_id;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<24> session;
    bit<40> firm;
    bit<16> credentials_length;
}

header establish_t {
    bit<256> hmac_signature;
    bit<160> access_key_id;
    bit<240> trading_system_name;
    bit<80> trading_system_version;
    bit<80> trading_system_vendor;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<32> next_seq_no;
    bit<24> session;
    bit<40> firm;
    bit<16> keep_alive_interval;
    bit<16> credentials_length;
}

header sequence_t {
    bit<64> uuid;
    bit<32> next_seq_no;
    bit<8> fault_tolerance_indicator;
    bit<8> keep_alive_interval_lapsed;
}

header terminate_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<16> error_codes;
    bit<8> split_msg;
}

header retransmit_request_t {
    bit<64> uuid;
    bit<64> last_uuid;
    bit<64> request_timestamp;
    bit<32> from_seq_no;
    bit<16> msg_count_16;
}

header new_order_single_t {
    bit<64> price_optional;
    bit<32> order_qty;
    bit<32> security_id;
    bit<8> side;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_request_id;
    bit<64> sending_time_epoch;
    bit<64> stop_px;
    bit<40> location;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<8> ord_type;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<1> aon;
    bit<1> ob;
    bit<1> nh;
    bit<1> reserved_1;
    bit<1> reserved_2;
    bit<1> reserved_3;
    bit<1> reserved_4;
    bit<1> reserved_5;
    bit<8> execution_mode;
    bit<8> liquidity_flag;
    bit<8> managed_order;
    bit<8> short_sale_type;
    bit<64> discretion_price;
}

header order_cancel_replace_request_t {
    bit<64> price_optional;
    bit<32> order_qty;
    bit<32> security_id;
    bit<8> side;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id_optional;
    bit<64> stop_px;
    bit<64> order_request_id;
    bit<64> sending_time_epoch;
    bit<40> location;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<8> ord_type;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> ofm_override;
    bit<1> aon;
    bit<1> ob;
    bit<1> nh;
    bit<1> reserved_1;
    bit<1> reserved_2;
    bit<1> reserved_3;
    bit<1> reserved_4;
    bit<1> reserved_5;
    bit<8> execution_mode;
    bit<8> liquidity_flag;
    bit<8> managed_order;
    bit<8> short_sale_type;
    bit<64> discretion_price;
}

header order_cancel_request_t {
    bit<64> order_id_optional;
    bit<64> party_details_list_req_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> order_request_id;
    bit<64> sending_time_epoch;
    bit<40> location;
    bit<32> security_id;
    bit<8> side;
    bit<8> liquidity_flag;
}

header mass_quote_t {
    bit<64> party_details_list_req_id;
    bit<64> sending_time_epoch;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<64> quote_req_id_optional;
    bit<40> location;
    bit<32> quote_id;
    bit<8> tot_no_quote_entries;
    bit<8> mm_protection_reset;
    bit<8> liquidity_flag;
    bit<8> short_sale_type;
    bit<240> reserved;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> bid_px;
    bit<64> offer_px;
    bit<32> quote_entry_id;
    bit<32> security_id;
    bit<32> bid_size;
    bit<32> offer_size;
    bit<32> underlying_security_id;
    bit<16> quote_set_id;
}

header party_details_definition_request_t {
    bit<64> party_details_list_req_id;
    bit<64> sending_time_epoch;
    bit<8> list_update_action;
    bit<32> seq_num;
    bit<600> memo;
    bit<160> avg_px_group_id;
    bit<64> self_match_prevention_id;
    bit<8> cmta_giveup_cd;
    bit<8> cust_order_capacity;
    bit<8> clearing_account_type;
    bit<8> self_match_prevention_instruction;
    bit<8> avg_px_indicator;
    bit<8> clearing_trade_price_type;
    bit<8> cust_order_handling_inst;
    bit<64> executor;
    bit<64> idm_short_code;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<160> party_detail_id;
    bit<16> party_detail_role;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<8> trd_reg_publication_type;
    bit<8> trd_reg_publication_reason;
}

header quote_cancel_t {
    bit<64> party_details_list_req_id;
    bit<64> sending_time_epoch;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<40> location;
    bit<32> quote_id;
    bit<8> quote_cancel_type;
    bit<8> liquidity_flag;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<48> security_group;
    bit<32> security_id_optional;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<32> bid_size;
    bit<32> offer_size;
    bit<16> quote_set_id;
}

header order_mass_action_request_t {
    bit<64> party_details_list_req_id;
    bit<64> order_request_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<64> sending_time_epoch;
    bit<48> security_group;
    bit<40> location;
    bit<32> security_id_optional;
    bit<8> mass_action_scope;
    bit<8> market_segment_id;
    bit<8> mass_cancel_request_type;
    bit<8> side_optional;
    bit<8> mass_action_ord_typ;
    bit<8> mass_cancel_tif;
    bit<8> liquidity_flag;
}

header order_mass_status_request_t {
    bit<64> party_details_list_req_id;
    bit<64> mass_status_req_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<64> sending_time_epoch;
    bit<48> security_group;
    bit<40> location;
    bit<32> security_id_optional;
    bit<8> mass_status_req_type;
    bit<8> ord_status_req_type;
    bit<8> mass_status_tif;
    bit<8> market_segment_id;
}

header order_status_request_t {
    bit<64> party_details_list_req_id;
    bit<64> ord_status_req_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<64> order_id;
    bit<64> sending_time_epoch;
    bit<40> location;
}

header party_details_list_request_t {
    bit<64> party_details_list_req_id;
    bit<64> sending_time_epoch;
    bit<32> seq_num;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<40> requesting_party_id;
    bit<8> requesting_party_id_source;
    bit<8> requesting_party_role;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<64> party_id;
    bit<8> party_id_source;
    bit<16> party_role;
}

header request_for_quote_t {
    bit<64> party_details_list_req_id;
    bit<64> quote_req_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<64> sending_time_epoch;
    bit<40> location;
    bit<8> quote_type;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<32> security_id;
    bit<32> order_qty_optional;
    bit<8> rfq_side;
}

header new_order_cross_t {
    bit<64> cross_id;
    bit<64> order_request_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id;
    bit<64> price;
    bit<64> trans_bkd_time;
    bit<64> sending_time_epoch;
    bit<40> location;
    bit<32> security_id;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<32> order_qty;
    bit<8> side;
    bit<8> side_time_in_force;
}

header security_definition_request_t {
    bit<64> party_details_list_req_id;
    bit<64> security_req_id;
    bit<8> manual_order_indicator;
    bit<32> seq_num;
    bit<160> sender_id_optional;
    bit<64> sending_time_epoch;
    bit<64> security_sub_type;
    bit<40> location;
    bit<16> start_date;
    bit<16> end_date;
    bit<8> max_no_of_substitutions;
    bit<32> source_repo_id;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<64> leg_price;
    bit<32> leg_security_id;
    bit<32> mantissa_32;
    bit<8> exponent;
    bit<8> leg_side;
    bit<8> leg_ratio_qty;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    negotiate_t negotiate;
    establish_t establish;
    sequence_t sequence;
    terminate_t terminate;
    retransmit_request_t retransmit_request;
    new_order_single_t new_order_single;
    order_cancel_replace_request_t order_cancel_replace_request;
    order_cancel_request_t order_cancel_request;
    mass_quote_t mass_quote;
    party_details_definition_request_t party_details_definition_request;
    quote_cancel_t quote_cancel;
    order_mass_action_request_t order_mass_action_request;
    order_mass_status_request_t order_mass_status_request;
    order_status_request_t order_status_request;
    party_details_list_request_t party_details_list_request;
    request_for_quote_t request_for_quote;
    new_order_cross_t new_order_cross;
    security_definition_request_t security_definition_request;
}

parser CmeGlobexIlink3ClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w500: parse_negotiate;
            16w503: parse_establish;
            16w506: parse_sequence;
            16w507: parse_terminate;
            16w508: parse_retransmit_request;
            16w514: parse_new_order_single;
            16w515: parse_order_cancel_replace_request;
            16w516: parse_order_cancel_request;
            16w517: parse_mass_quote;
            16w518: parse_party_details_definition_request;
            16w528: parse_quote_cancel;
            16w529: parse_order_mass_action_request;
            16w530: parse_order_mass_status_request;
            16w533: parse_order_status_request;
            16w537: parse_party_details_list_request;
            16w543: parse_request_for_quote;
            16w544: parse_new_order_cross;
            16w560: parse_security_definition_request;
            default: accept;
        }
    }

    state parse_negotiate {
        packet.extract(hdr.negotiate);
        transition accept;
    }

    state parse_establish {
        packet.extract(hdr.establish);
        transition accept;
    }

    state parse_sequence {
        packet.extract(hdr.sequence);
        transition accept;
    }

    state parse_terminate {
        packet.extract(hdr.terminate);
        transition accept;
    }

    state parse_retransmit_request {
        packet.extract(hdr.retransmit_request);
        transition accept;
    }

    state parse_new_order_single {
        packet.extract(hdr.new_order_single);
        transition accept;
    }

    state parse_order_cancel_replace_request {
        packet.extract(hdr.order_cancel_replace_request);
        transition accept;
    }

    state parse_order_cancel_request {
        packet.extract(hdr.order_cancel_request);
        transition accept;
    }

    state parse_mass_quote {
        packet.extract(hdr.mass_quote);
        transition accept;
    }

    state parse_party_details_definition_request {
        packet.extract(hdr.party_details_definition_request);
        transition accept;
    }

    state parse_quote_cancel {
        packet.extract(hdr.quote_cancel);
        transition accept;
    }

    state parse_order_mass_action_request {
        packet.extract(hdr.order_mass_action_request);
        transition accept;
    }

    state parse_order_mass_status_request {
        packet.extract(hdr.order_mass_status_request);
        transition accept;
    }

    state parse_order_status_request {
        packet.extract(hdr.order_status_request);
        transition accept;
    }

    state parse_party_details_list_request {
        packet.extract(hdr.party_details_list_request);
        transition accept;
    }

    state parse_request_for_quote {
        packet.extract(hdr.request_for_quote);
        transition accept;
    }

    state parse_new_order_cross {
        packet.extract(hdr.new_order_cross);
        transition accept;
    }

    state parse_security_definition_request {
        packet.extract(hdr.security_definition_request);
        transition accept;
    }

}

control CmeGlobexIlink3ClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexIlink3ClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CmeGlobexIlink3ClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexIlink3ClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexIlink3ClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.negotiate);
        packet.emit(hdr.establish);
        packet.emit(hdr.sequence);
        packet.emit(hdr.terminate);
        packet.emit(hdr.retransmit_request);
        packet.emit(hdr.new_order_single);
        packet.emit(hdr.order_cancel_replace_request);
        packet.emit(hdr.order_cancel_request);
        packet.emit(hdr.mass_quote);
        packet.emit(hdr.party_details_definition_request);
        packet.emit(hdr.quote_cancel);
        packet.emit(hdr.order_mass_action_request);
        packet.emit(hdr.order_mass_status_request);
        packet.emit(hdr.order_status_request);
        packet.emit(hdr.party_details_list_request);
        packet.emit(hdr.request_for_quote);
        packet.emit(hdr.new_order_cross);
        packet.emit(hdr.security_definition_request);
    }
}

V1Switch(
    CmeGlobexIlink3ClientParser(),
    CmeGlobexIlink3ClientVerifyChecksum(),
    CmeGlobexIlink3ClientIngress(),
    CmeGlobexIlink3ClientEgress(),
    CmeGlobexIlink3ClientComputeChecksum(),
    CmeGlobexIlink3ClientDeparser()
) main;
