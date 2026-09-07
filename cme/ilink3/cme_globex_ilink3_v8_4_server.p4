// P4_16 (v1model) definition for: Cme Globex iLink3 Sbe v8.4
// 
// Protocol:
//   Organization: CME Group
//   Protocol: iLink 3
//   Encoding: Simple Binary Encoding
//   Version: 8.4
//   Date: 02/11/2020
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

header negotiation_response_t {
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<16> secret_key_secure_id_expiration;
    bit<8> fault_tolerance_indicator;
    bit<8> split_msg;
    bit<32> previous_seq_no;
    bit<64> previous_uuid;
    bit<16> credentials_length;
}

header negotiation_reject_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<16> error_codes;
    bit<8> fault_tolerance_indicator;
    bit<8> split_msg;
}

header establishment_ack_t {
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<32> next_seq_no;
    bit<32> previous_seq_no;
    bit<64> previous_uuid;
    bit<16> keep_alive_interval;
    bit<16> secret_key_secure_id_expiration;
    bit<8> fault_tolerance_indicator;
    bit<8> split_msg;
}

header establishment_reject_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<32> next_seq_no;
    bit<16> error_codes;
    bit<8> fault_tolerance_indicator;
    bit<8> split_msg;
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

header retransmission_t {
    bit<64> uuid;
    bit<64> last_uuid;
    bit<64> request_timestamp;
    bit<32> from_seq_no;
    bit<16> msg_count_16;
    bit<8> split_msg;
}

header retransmit_reject_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> last_uuid;
    bit<64> request_timestamp;
    bit<16> error_codes;
    bit<8> split_msg;
}

header not_applied_t {
    bit<64> uuid;
    bit<32> from_seq_no;
    bit<32> msg_count;
    bit<8> split_msg;
}

header party_details_definition_request_ack_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<600> memo;
    bit<160> avg_px_group_id;
    bit<64> party_details_list_req_id;
    bit<64> sending_time_epoch;
    bit<64> self_match_prevention_id;
    bit<8> party_detail_request_status;
    bit<8> cust_order_capacity;
    bit<8> clearing_account_type;
    bit<8> self_match_prevention_instruction;
    bit<8> avg_px_indicator;
    bit<8> clearing_trade_price_type;
    bit<8> cmta_giveup_cd;
    bit<8> cust_order_handling_inst;
    bit<8> list_update_action;
    bit<8> party_detail_definition_status;
    bit<64> executor;
    bit<64> idm_short_code;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<16> block_length;
    bit<8> num_in_group;
}

header party_details_definition_request_ack_party_details_group_t {
    bit<160> party_detail_id;
    bit<16> party_detail_role;
}

header party_details_definition_request_ack_trd_reg_publications_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header party_details_definition_request_ack_trd_reg_publications_group_t {
    bit<8> trd_reg_publication_type;
    bit<8> trd_reg_publication_reason;
}

header business_reject_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<160> sender_id_optional;
    bit<64> party_details_list_req_id_optional;
    bit<64> sending_time_epoch;
    bit<64> business_reject_ref_id;
    bit<40> location_optional;
    bit<32> ref_seq_num;
    bit<16> ref_tag_id;
    bit<16> business_reject_reason;
    bit<16> ref_msg_type;
    bit<8> poss_retrans_flag;
    bit<8> manual_order_indicator_optional;
    bit<8> split_msg;
}

header execution_report_new_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<16> delay_duration;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<8> cross_type;
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
    bit<64> delay_to_time;
}

header execution_report_reject_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> ord_rej_reason;
    bit<16> expire_date;
    bit<16> delay_duration;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<8> cross_type;
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
    bit<64> delay_to_time;
}

header execution_report_elimination_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> cum_qty;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> cross_type;
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
}

header execution_report_trade_outright_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> last_px;
    bit<64> order_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> sec_exec_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> last_qty;
    bit<32> cum_qty;
    bit<32> md_trade_entry_id;
    bit<32> side_trade_id;
    bit<32> trade_link_id;
    bit<32> leaves_qty;
    bit<16> trade_date;
    bit<16> expire_date;
    bit<8> ord_status_trd;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> aggressor_indicator;
    bit<8> cross_type;
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
    bit<8> ownership;
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_outright_fills_group_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<16> fill_exec_id;
    bit<8> fill_yield_type;
}

header execution_report_trade_outright_outright_order_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_outright_outright_order_events_group_t {
    bit<64> order_event_px;
    bit<40> order_event_text;
    bit<32> order_event_exec_id;
    bit<32> order_event_qty;
    bit<8> order_event_type;
    bit<8> order_event_reason;
}

header execution_report_trade_spread_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> last_px;
    bit<64> order_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> sec_exec_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> last_qty;
    bit<32> cum_qty;
    bit<32> md_trade_entry_id;
    bit<32> side_trade_id;
    bit<32> leaves_qty;
    bit<16> trade_date;
    bit<16> expire_date;
    bit<8> ord_status_trd;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> aggressor_indicator;
    bit<8> cross_type;
    bit<8> total_num_securities;
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
    bit<8> short_sale_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_spread_fills_group_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<16> fill_exec_id;
    bit<8> fill_yield_type;
}

header execution_report_trade_spread_trade_legs_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_spread_trade_legs_group_t {
    bit<64> leg_exec_id;
    bit<64> leg_last_px;
    bit<32> leg_security_id;
    bit<32> leg_trade_id;
    bit<32> leg_last_qty;
    bit<8> leg_side;
}

header execution_report_trade_spread_spread_order_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_spread_spread_order_events_group_t {
    bit<64> order_event_px;
    bit<40> order_event_text;
    bit<32> order_event_exec_id;
    bit<32> order_event_qty;
    bit<8> order_event_type;
    bit<8> order_event_reason;
}

header execution_report_trade_spread_leg_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> mantissa;
    bit<8> exponent;
    bit<64> party_details_list_req_id;
    bit<64> last_px;
    bit<64> order_id;
    bit<64> underlying_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> sec_exec_id;
    bit<40> location;
    bit<32> mantissa_32;
    bit<8> exponent_2;
    bit<32> mantissa_32_2;
    bit<8> exponent_3;
    bit<32> mantissa_32_3;
    bit<8> exponent_4;
    bit<32> security_id;
    bit<32> last_qty;
    bit<32> cum_qty;
    bit<32> side_trade_id;
    bit<16> trade_date;
    bit<8> ord_status_trd;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> poss_retrans_flag;
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_spread_leg_fills_group_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<16> fill_exec_id;
    bit<8> fill_yield_type;
}

header execution_report_trade_spread_leg_spread_leg_order_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_spread_leg_spread_leg_order_events_group_t {
    bit<64> order_event_px;
    bit<40> order_event_text;
    bit<32> order_event_exec_id;
    bit<32> order_event_qty;
    bit<8> order_event_type;
    bit<8> order_event_reason;
}

header execution_report_modify_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> cum_qty;
    bit<32> leaves_qty;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<16> delay_duration;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<8> cross_type;
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
    bit<64> delay_to_time;
}

header execution_report_status_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> ord_status_req_id_optional;
    bit<64> mass_status_req_id_optional;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> cum_qty;
    bit<32> leaves_qty;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<8> ord_status;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> last_rpt_requested;
    bit<8> cross_type;
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
}

header execution_report_cancel_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> price;
    bit<64> stop_px;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> cross_id_optional;
    bit<64> host_cross_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> cum_qty;
    bit<32> min_qty;
    bit<32> display_qty;
    bit<16> expire_date;
    bit<16> delay_duration;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> time_in_force;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<8> exec_restatement_reason;
    bit<8> cross_type;
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
    bit<64> delay_to_time;
}

header order_cancel_reject_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<40> location;
    bit<16> cxl_rej_reason;
    bit<16> delay_duration;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<8> liquidity_flag;
    bit<64> delay_to_time;
}

header order_cancel_replace_reject_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<40> location;
    bit<16> cxl_rej_reason;
    bit<16> delay_duration;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<8> liquidity_flag;
    bit<64> delay_to_time;
}

header party_details_list_report_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<160> avg_px_group_id;
    bit<64> party_details_list_req_id;
    bit<64> party_details_list_report_id;
    bit<64> sending_time_epoch;
    bit<64> self_match_prevention_id;
    bit<16> tot_num_parties;
    bit<8> request_result;
    bit<8> last_fragment;
    bit<8> cust_order_capacity;
    bit<8> clearing_account_type;
    bit<8> self_match_prevention_instruction;
    bit<8> avg_px_indicator;
    bit<8> clearing_trade_price_type;
    bit<8> cmta_giveup_cd;
    bit<8> cust_order_handling_inst;
    bit<64> executor;
    bit<64> idm_short_code;
    bit<8> poss_retrans_flag;
    bit<8> split_msg;
    bit<16> block_length;
    bit<8> num_in_group;
}

header party_details_list_report_party_details_group_t {
    bit<160> party_detail_id;
    bit<16> party_detail_role;
}

header party_details_list_report_trd_reg_publications_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header party_details_list_report_trd_reg_publications_group_t {
    bit<8> trd_reg_publication_type;
    bit<8> trd_reg_publication_reason;
}

header execution_ack_t {
    bit<64> party_details_list_req_id;
    bit<64> order_id;
    bit<8> exec_ack_status;
    bit<32> seq_num;
    bit<160> clordid;
    bit<64> sec_exec_id;
    bit<64> last_px;
    bit<32> security_id;
    bit<32> last_qty;
    bit<8> dk_reason;
    bit<8> side;
    bit<160> sender_id;
}

header mass_quote_ack_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<160> sender_id;
    bit<64> party_details_list_req_id;
    bit<64> request_time;
    bit<64> sending_time_epoch;
    bit<64> quote_req_id_optional;
    bit<40> location;
    bit<32> quote_id;
    bit<16> quote_reject_reason;
    bit<16> delay_duration;
    bit<8> quote_ack_status;
    bit<8> manual_order_indicator;
    bit<8> no_processed_entries;
    bit<8> mm_protection_reset;
    bit<8> split_msg;
    bit<8> liquidity_flag;
    bit<8> short_sale_type;
    bit<8> tot_no_quote_entries_optional;
    bit<8> poss_retrans_flag;
    bit<64> delay_to_time;
    bit<16> block_length;
    bit<8> num_in_group;
}

header mass_quote_ack_quote_ack_entries_group_t {
    bit<32> quote_entry_id;
    bit<32> security_id;
    bit<16> quote_set_id;
    bit<8> quote_entry_reject_reason;
}

header request_for_quote_ack_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<160> sender_id;
    bit<136> exchange_quote_req_id;
    bit<64> party_details_list_req_id;
    bit<64> request_time;
    bit<64> sending_time_epoch;
    bit<64> quote_req_id;
    bit<40> location;
    bit<16> quote_reject_reason;
    bit<16> delay_duration;
    bit<8> quote_ack_status;
    bit<8> manual_order_indicator;
    bit<8> split_msg;
    bit<8> poss_retrans_flag;
    bit<64> delay_to_time;
}

header quote_cancel_ack_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<160> sender_id;
    bit<64> party_details_list_req_id;
    bit<64> request_time;
    bit<64> sending_time_epoch;
    bit<48> cancelled_symbol;
    bit<40> location;
    bit<32> quote_id;
    bit<16> quote_reject_reason;
    bit<16> delay_duration;
    bit<8> manual_order_indicator;
    bit<8> quote_cxl_status;
    bit<8> no_processed_entries;
    bit<8> mm_protection_reset;
    bit<8> unsolicited_cancel_type;
    bit<8> split_msg;
    bit<8> tot_no_quote_entries_optional;
    bit<8> liquidity_flag;
    bit<8> poss_retrans_flag;
    bit<64> delay_to_time;
    bit<16> block_length;
    bit<8> num_in_group;
}

header quote_cancel_ack_quote_cancel_ack_entries_group_t {
    bit<32> quote_entry_id;
    bit<32> security_id;
    bit<8> quote_entry_reject_reason;
}

header quote_cancel_ack_quote_cancel_ack_sets_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header quote_cancel_ack_quote_cancel_ack_sets_group_t {
    bit<16> quote_set_id;
    bit<16> quote_error_code;
}

header execution_report_trade_addendum_outright_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> last_px;
    bit<64> order_id;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> sec_exec_id;
    bit<64> orig_secondary_execution_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> last_qty;
    bit<32> side_trade_id;
    bit<32> orig_side_trade_id;
    bit<16> trade_date;
    bit<8> ord_status_trd_cxl;
    bit<8> exec_type;
    bit<8> side;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
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
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_outright_fills_group_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<16> fill_exec_id;
    bit<8> fill_yield_type;
}

header execution_report_trade_addendum_outright_outright_trade_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_outright_outright_trade_events_group_t {
    bit<64> order_event_px;
    bit<40> order_event_text;
    bit<32> order_event_exec_id;
    bit<32> order_event_qty;
    bit<8> trade_addendum;
    bit<8> order_event_reason;
    bit<32> original_order_event_exec_id;
}

header execution_report_trade_addendum_spread_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> last_px;
    bit<64> order_id;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> sec_exec_id;
    bit<64> orig_secondary_execution_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> md_trade_entry_id;
    bit<32> last_qty;
    bit<32> side_trade_id;
    bit<32> orig_side_trade_id;
    bit<16> trade_date;
    bit<8> ord_status_trd_cxl;
    bit<8> exec_type;
    bit<8> ord_type_optional;
    bit<8> side;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<8> total_num_securities;
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
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_spread_fills_group_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<16> fill_exec_id;
    bit<8> fill_yield_type;
}

header execution_report_trade_addendum_spread_trade_addendum_legs_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_spread_trade_addendum_legs_group_t {
    bit<64> leg_exec_id;
    bit<64> leg_last_px;
    bit<64> leg_exec_ref_id;
    bit<32> leg_trade_id;
    bit<32> leg_trade_ref_id;
    bit<32> leg_security_id;
    bit<32> leg_last_qty;
    bit<8> leg_side;
}

header execution_report_trade_addendum_spread_spread_trade_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_spread_spread_trade_events_group_t {
    bit<64> order_event_px;
    bit<40> order_event_text;
    bit<32> order_event_exec_id;
    bit<32> order_event_qty;
    bit<8> trade_addendum;
    bit<8> order_event_reason;
    bit<32> original_order_event_exec_id;
}

header execution_report_trade_addendum_spread_leg_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<320> exec_id;
    bit<160> sender_id;
    bit<160> clordid;
    bit<64> party_details_list_req_id;
    bit<64> last_px;
    bit<64> order_id;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> sec_exec_id;
    bit<64> orig_secondary_execution_id;
    bit<40> location;
    bit<32> security_id;
    bit<32> last_qty;
    bit<32> side_trade_id;
    bit<32> orig_side_trade_id;
    bit<16> trade_date;
    bit<8> ord_status_trd_cxl;
    bit<8> exec_type;
    bit<8> manual_order_indicator;
    bit<8> poss_retrans_flag;
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_spread_leg_fills_group_t {
    bit<64> fill_px;
    bit<32> fill_qty;
    bit<16> fill_exec_id;
    bit<8> fill_yield_type;
}

header execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_t {
    bit<64> order_event_px;
    bit<40> order_event_text;
    bit<32> order_event_exec_id;
    bit<32> order_event_qty;
    bit<8> trade_addendum;
    bit<8> order_event_reason;
    bit<32> original_order_event_exec_id;
}

header order_mass_action_report_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<160> sender_id;
    bit<64> party_details_list_req_id;
    bit<64> transact_time;
    bit<64> sending_time_epoch;
    bit<64> order_request_id;
    bit<64> mass_action_report_id;
    bit<48> security_group;
    bit<40> location;
    bit<32> security_id_optional;
    bit<16> delay_duration;
    bit<8> mass_action_response;
    bit<8> manual_order_indicator;
    bit<8> mass_action_scope;
    bit<8> total_affected_orders;
    bit<8> last_fragment;
    bit<8> mass_action_reject_reason;
    bit<8> market_segment_id;
    bit<8> mass_cancel_request_type;
    bit<8> side_optional;
    bit<8> mass_action_ord_typ;
    bit<8> mass_cancel_tif;
    bit<8> split_msg;
    bit<8> liquidity_flag;
    bit<8> poss_retrans_flag;
    bit<64> delay_to_time;
    bit<16> block_length;
    bit<8> num_in_group;
}

header order_mass_action_report_affected_orders_group_t {
    bit<160> origclordid;
    bit<64> affected_order_id;
    bit<32> cxl_quantity;
}

header security_definition_response_t {
    bit<32> seq_num;
    bit<64> uuid;
    bit<2048> text;
    bit<280> financial_instrument_full_name;
    bit<160> sender_id;
    bit<160> symbol;
    bit<64> party_details_list_req_id;
    bit<64> security_req_id;
    bit<64> security_response_id;
    bit<64> sending_time_epoch;
    bit<48> security_group;
    bit<48> security_type;
    bit<40> location;
    bit<32> security_id_optional;
    bit<24> currency;
    bit<16> year;
    bit<8> month;
    bit<8> day;
    bit<8> week;
    bit<16> delay_duration;
    bit<16> start_date;
    bit<16> end_date;
    bit<8> max_no_of_substitutions;
    bit<32> source_repo_id;
    bit<64> termination_type;
    bit<8> security_response_type;
    bit<8> expiration_cycle;
    bit<8> manual_order_indicator;
    bit<8> split_msg;
    bit<8> auto_quote_request;
    bit<8> poss_retrans_flag;
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_definition_response_response_legs_group_t {
    bit<64> leg_price;
    bit<32> mantissa_32;
    bit<8> exponent;
    bit<32> leg_security_id;
    bit<8> leg_side;
    bit<8> leg_ratio_qty;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> party_details_definition_request_ack_party_details_group_remaining;
    bit<8> party_details_definition_request_ack_trd_reg_publications_group_remaining;
    bit<8> execution_report_trade_outright_fills_group_remaining;
    bit<8> execution_report_trade_outright_outright_order_events_group_remaining;
    bit<8> execution_report_trade_spread_fills_group_remaining;
    bit<8> execution_report_trade_spread_trade_legs_group_remaining;
    bit<8> execution_report_trade_spread_spread_order_events_group_remaining;
    bit<8> execution_report_trade_spread_leg_fills_group_remaining;
    bit<8> execution_report_trade_spread_leg_spread_leg_order_events_group_remaining;
    bit<8> party_details_list_report_party_details_group_remaining;
    bit<8> party_details_list_report_trd_reg_publications_group_remaining;
    bit<8> mass_quote_ack_quote_ack_entries_group_remaining;
    bit<8> quote_cancel_ack_quote_cancel_ack_entries_group_remaining;
    bit<8> quote_cancel_ack_quote_cancel_ack_sets_group_remaining;
    bit<8> execution_report_trade_addendum_outright_fills_group_remaining;
    bit<8> execution_report_trade_addendum_outright_outright_trade_events_group_remaining;
    bit<8> execution_report_trade_addendum_spread_fills_group_remaining;
    bit<8> execution_report_trade_addendum_spread_trade_addendum_legs_group_remaining;
    bit<8> execution_report_trade_addendum_spread_spread_trade_events_group_remaining;
    bit<8> execution_report_trade_addendum_spread_leg_fills_group_remaining;
    bit<8> execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_remaining;
    bit<8> order_mass_action_report_affected_orders_group_remaining;
    bit<8> security_definition_response_response_legs_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    negotiation_response_t negotiation_response;
    negotiation_reject_t negotiation_reject;
    establishment_ack_t establishment_ack;
    establishment_reject_t establishment_reject;
    sequence_t sequence;
    terminate_t terminate;
    retransmission_t retransmission;
    retransmit_reject_t retransmit_reject;
    not_applied_t not_applied;
    party_details_definition_request_ack_t party_details_definition_request_ack;
    party_details_definition_request_ack_party_details_group_t party_details_definition_request_ack_party_details_group[MAX_MESSAGES];
    party_details_definition_request_ack_trd_reg_publications_group_header_t party_details_definition_request_ack_trd_reg_publications_group_header;
    party_details_definition_request_ack_trd_reg_publications_group_t party_details_definition_request_ack_trd_reg_publications_group[MAX_MESSAGES];
    business_reject_t business_reject;
    execution_report_new_t execution_report_new;
    execution_report_reject_t execution_report_reject;
    execution_report_elimination_t execution_report_elimination;
    execution_report_trade_outright_t execution_report_trade_outright;
    execution_report_trade_outright_fills_group_t execution_report_trade_outright_fills_group[MAX_MESSAGES];
    execution_report_trade_outright_outright_order_events_group_header_t execution_report_trade_outright_outright_order_events_group_header;
    execution_report_trade_outright_outright_order_events_group_t execution_report_trade_outright_outright_order_events_group[MAX_MESSAGES];
    execution_report_trade_spread_t execution_report_trade_spread;
    execution_report_trade_spread_fills_group_t execution_report_trade_spread_fills_group[MAX_MESSAGES];
    execution_report_trade_spread_trade_legs_group_header_t execution_report_trade_spread_trade_legs_group_header;
    execution_report_trade_spread_trade_legs_group_t execution_report_trade_spread_trade_legs_group[MAX_MESSAGES];
    execution_report_trade_spread_spread_order_events_group_header_t execution_report_trade_spread_spread_order_events_group_header;
    execution_report_trade_spread_spread_order_events_group_t execution_report_trade_spread_spread_order_events_group[MAX_MESSAGES];
    execution_report_trade_spread_leg_t execution_report_trade_spread_leg;
    execution_report_trade_spread_leg_fills_group_t execution_report_trade_spread_leg_fills_group[MAX_MESSAGES];
    execution_report_trade_spread_leg_spread_leg_order_events_group_header_t execution_report_trade_spread_leg_spread_leg_order_events_group_header;
    execution_report_trade_spread_leg_spread_leg_order_events_group_t execution_report_trade_spread_leg_spread_leg_order_events_group[MAX_MESSAGES];
    execution_report_modify_t execution_report_modify;
    execution_report_status_t execution_report_status;
    execution_report_cancel_t execution_report_cancel;
    order_cancel_reject_t order_cancel_reject;
    order_cancel_replace_reject_t order_cancel_replace_reject;
    party_details_list_report_t party_details_list_report;
    party_details_list_report_party_details_group_t party_details_list_report_party_details_group[MAX_MESSAGES];
    party_details_list_report_trd_reg_publications_group_header_t party_details_list_report_trd_reg_publications_group_header;
    party_details_list_report_trd_reg_publications_group_t party_details_list_report_trd_reg_publications_group[MAX_MESSAGES];
    execution_ack_t execution_ack;
    mass_quote_ack_t mass_quote_ack;
    mass_quote_ack_quote_ack_entries_group_t mass_quote_ack_quote_ack_entries_group[MAX_MESSAGES];
    request_for_quote_ack_t request_for_quote_ack;
    quote_cancel_ack_t quote_cancel_ack;
    quote_cancel_ack_quote_cancel_ack_entries_group_t quote_cancel_ack_quote_cancel_ack_entries_group[MAX_MESSAGES];
    quote_cancel_ack_quote_cancel_ack_sets_group_header_t quote_cancel_ack_quote_cancel_ack_sets_group_header;
    quote_cancel_ack_quote_cancel_ack_sets_group_t quote_cancel_ack_quote_cancel_ack_sets_group[MAX_MESSAGES];
    execution_report_trade_addendum_outright_t execution_report_trade_addendum_outright;
    execution_report_trade_addendum_outright_fills_group_t execution_report_trade_addendum_outright_fills_group[MAX_MESSAGES];
    execution_report_trade_addendum_outright_outright_trade_events_group_header_t execution_report_trade_addendum_outright_outright_trade_events_group_header;
    execution_report_trade_addendum_outright_outright_trade_events_group_t execution_report_trade_addendum_outright_outright_trade_events_group[MAX_MESSAGES];
    execution_report_trade_addendum_spread_t execution_report_trade_addendum_spread;
    execution_report_trade_addendum_spread_fills_group_t execution_report_trade_addendum_spread_fills_group[MAX_MESSAGES];
    execution_report_trade_addendum_spread_trade_addendum_legs_group_header_t execution_report_trade_addendum_spread_trade_addendum_legs_group_header;
    execution_report_trade_addendum_spread_trade_addendum_legs_group_t execution_report_trade_addendum_spread_trade_addendum_legs_group[MAX_MESSAGES];
    execution_report_trade_addendum_spread_spread_trade_events_group_header_t execution_report_trade_addendum_spread_spread_trade_events_group_header;
    execution_report_trade_addendum_spread_spread_trade_events_group_t execution_report_trade_addendum_spread_spread_trade_events_group[MAX_MESSAGES];
    execution_report_trade_addendum_spread_leg_t execution_report_trade_addendum_spread_leg;
    execution_report_trade_addendum_spread_leg_fills_group_t execution_report_trade_addendum_spread_leg_fills_group[MAX_MESSAGES];
    execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_header_t execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_header;
    execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_t execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group[MAX_MESSAGES];
    order_mass_action_report_t order_mass_action_report;
    order_mass_action_report_affected_orders_group_t order_mass_action_report_affected_orders_group[MAX_MESSAGES];
    security_definition_response_t security_definition_response;
    security_definition_response_response_legs_group_t security_definition_response_response_legs_group[MAX_MESSAGES];
}

parser CmeGlobexIlink3ServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0xf501: parse_negotiation_response;
            16w0xf601: parse_negotiation_reject;
            16w0xf801: parse_establishment_ack;
            16w0xf901: parse_establishment_reject;
            16w0xfa01: parse_sequence;
            16w0xfb01: parse_terminate;
            16w0xfd01: parse_retransmission;
            16w0xfe01: parse_retransmit_reject;
            16w0x102: parse_not_applied;
            16w0x702: parse_party_details_definition_request_ack;
            16w0x902: parse_business_reject;
            16w0xa02: parse_execution_report_new;
            16w0xb02: parse_execution_report_reject;
            16w0xc02: parse_execution_report_elimination;
            16w0xd02: parse_execution_report_trade_outright;
            16w0xe02: parse_execution_report_trade_spread;
            16w0xf02: parse_execution_report_trade_spread_leg;
            16w0x1302: parse_execution_report_modify;
            16w0x1402: parse_execution_report_status;
            16w0x1602: parse_execution_report_cancel;
            16w0x1702: parse_order_cancel_reject;
            16w0x1802: parse_order_cancel_replace_reject;
            16w0x1a02: parse_party_details_list_report;
            16w0x1b02: parse_execution_ack;
            16w0x2102: parse_mass_quote_ack;
            16w0x2202: parse_request_for_quote_ack;
            16w0x2302: parse_quote_cancel_ack;
            16w0x2402: parse_execution_report_trade_addendum_outright;
            16w0x2502: parse_execution_report_trade_addendum_spread;
            16w0x2602: parse_execution_report_trade_addendum_spread_leg;
            16w0x2e02: parse_order_mass_action_report;
            16w0x3102: parse_security_definition_response;
            default: accept;
        }
    }

    state parse_negotiation_response {
        packet.extract(hdr.negotiation_response);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_negotiation_reject {
        packet.extract(hdr.negotiation_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_establishment_ack {
        packet.extract(hdr.establishment_ack);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_establishment_reject {
        packet.extract(hdr.establishment_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequence {
        packet.extract(hdr.sequence);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_terminate {
        packet.extract(hdr.terminate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmission {
        packet.extract(hdr.retransmission);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_reject {
        packet.extract(hdr.retransmit_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_not_applied {
        packet.extract(hdr.not_applied);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_party_details_definition_request_ack {
        packet.extract(hdr.party_details_definition_request_ack);
        meta.dispatched = 1;
        meta.party_details_definition_request_ack_party_details_group_remaining = hdr.party_details_definition_request_ack.num_in_group;
        transition select(meta.party_details_definition_request_ack_party_details_group_remaining) {
            8w0: read_party_details_definition_request_ack_trd_reg_publications_group;
            default: parse_party_details_definition_request_ack_party_details_group;
        }
    }

    state parse_party_details_definition_request_ack_party_details_group {
        packet.extract(hdr.party_details_definition_request_ack_party_details_group.next);
        meta.party_details_definition_request_ack_party_details_group_remaining = meta.party_details_definition_request_ack_party_details_group_remaining - 1;
        transition select(meta.party_details_definition_request_ack_party_details_group_remaining) {
            8w0: read_party_details_definition_request_ack_trd_reg_publications_group;
            default: parse_party_details_definition_request_ack_party_details_group;
        }
    }

    state read_party_details_definition_request_ack_trd_reg_publications_group {
        packet.extract(hdr.party_details_definition_request_ack_trd_reg_publications_group_header);
        meta.party_details_definition_request_ack_trd_reg_publications_group_remaining = hdr.party_details_definition_request_ack_trd_reg_publications_group_header.num_in_group;
        transition select(meta.party_details_definition_request_ack_trd_reg_publications_group_remaining) {
            8w0: accept;
            default: parse_party_details_definition_request_ack_trd_reg_publications_group;
        }
    }

    state parse_party_details_definition_request_ack_trd_reg_publications_group {
        packet.extract(hdr.party_details_definition_request_ack_trd_reg_publications_group.next);
        meta.party_details_definition_request_ack_trd_reg_publications_group_remaining = meta.party_details_definition_request_ack_trd_reg_publications_group_remaining - 1;
        transition select(meta.party_details_definition_request_ack_trd_reg_publications_group_remaining) {
            8w0: accept;
            default: parse_party_details_definition_request_ack_trd_reg_publications_group;
        }
    }

    state parse_business_reject {
        packet.extract(hdr.business_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_new {
        packet.extract(hdr.execution_report_new);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_reject {
        packet.extract(hdr.execution_report_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_elimination {
        packet.extract(hdr.execution_report_elimination);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_trade_outright {
        packet.extract(hdr.execution_report_trade_outright);
        meta.dispatched = 1;
        meta.execution_report_trade_outright_fills_group_remaining = hdr.execution_report_trade_outright.num_in_group;
        transition select(meta.execution_report_trade_outright_fills_group_remaining) {
            8w0: read_execution_report_trade_outright_outright_order_events_group;
            default: parse_execution_report_trade_outright_fills_group;
        }
    }

    state parse_execution_report_trade_outright_fills_group {
        packet.extract(hdr.execution_report_trade_outright_fills_group.next);
        meta.execution_report_trade_outright_fills_group_remaining = meta.execution_report_trade_outright_fills_group_remaining - 1;
        transition select(meta.execution_report_trade_outright_fills_group_remaining) {
            8w0: read_execution_report_trade_outright_outright_order_events_group;
            default: parse_execution_report_trade_outright_fills_group;
        }
    }

    state read_execution_report_trade_outright_outright_order_events_group {
        packet.extract(hdr.execution_report_trade_outright_outright_order_events_group_header);
        meta.execution_report_trade_outright_outright_order_events_group_remaining = hdr.execution_report_trade_outright_outright_order_events_group_header.num_in_group;
        transition select(meta.execution_report_trade_outright_outright_order_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_outright_outright_order_events_group;
        }
    }

    state parse_execution_report_trade_outright_outright_order_events_group {
        packet.extract(hdr.execution_report_trade_outright_outright_order_events_group.next);
        meta.execution_report_trade_outright_outright_order_events_group_remaining = meta.execution_report_trade_outright_outright_order_events_group_remaining - 1;
        transition select(meta.execution_report_trade_outright_outright_order_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_outright_outright_order_events_group;
        }
    }

    state parse_execution_report_trade_spread {
        packet.extract(hdr.execution_report_trade_spread);
        meta.dispatched = 1;
        meta.execution_report_trade_spread_fills_group_remaining = hdr.execution_report_trade_spread.num_in_group;
        transition select(meta.execution_report_trade_spread_fills_group_remaining) {
            8w0: read_execution_report_trade_spread_trade_legs_group;
            default: parse_execution_report_trade_spread_fills_group;
        }
    }

    state parse_execution_report_trade_spread_fills_group {
        packet.extract(hdr.execution_report_trade_spread_fills_group.next);
        meta.execution_report_trade_spread_fills_group_remaining = meta.execution_report_trade_spread_fills_group_remaining - 1;
        transition select(meta.execution_report_trade_spread_fills_group_remaining) {
            8w0: read_execution_report_trade_spread_trade_legs_group;
            default: parse_execution_report_trade_spread_fills_group;
        }
    }

    state read_execution_report_trade_spread_trade_legs_group {
        packet.extract(hdr.execution_report_trade_spread_trade_legs_group_header);
        meta.execution_report_trade_spread_trade_legs_group_remaining = hdr.execution_report_trade_spread_trade_legs_group_header.num_in_group;
        transition select(meta.execution_report_trade_spread_trade_legs_group_remaining) {
            8w0: read_execution_report_trade_spread_spread_order_events_group;
            default: parse_execution_report_trade_spread_trade_legs_group;
        }
    }

    state parse_execution_report_trade_spread_trade_legs_group {
        packet.extract(hdr.execution_report_trade_spread_trade_legs_group.next);
        meta.execution_report_trade_spread_trade_legs_group_remaining = meta.execution_report_trade_spread_trade_legs_group_remaining - 1;
        transition select(meta.execution_report_trade_spread_trade_legs_group_remaining) {
            8w0: read_execution_report_trade_spread_spread_order_events_group;
            default: parse_execution_report_trade_spread_trade_legs_group;
        }
    }

    state read_execution_report_trade_spread_spread_order_events_group {
        packet.extract(hdr.execution_report_trade_spread_spread_order_events_group_header);
        meta.execution_report_trade_spread_spread_order_events_group_remaining = hdr.execution_report_trade_spread_spread_order_events_group_header.num_in_group;
        transition select(meta.execution_report_trade_spread_spread_order_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_spread_spread_order_events_group;
        }
    }

    state parse_execution_report_trade_spread_spread_order_events_group {
        packet.extract(hdr.execution_report_trade_spread_spread_order_events_group.next);
        meta.execution_report_trade_spread_spread_order_events_group_remaining = meta.execution_report_trade_spread_spread_order_events_group_remaining - 1;
        transition select(meta.execution_report_trade_spread_spread_order_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_spread_spread_order_events_group;
        }
    }

    state parse_execution_report_trade_spread_leg {
        packet.extract(hdr.execution_report_trade_spread_leg);
        meta.dispatched = 1;
        meta.execution_report_trade_spread_leg_fills_group_remaining = hdr.execution_report_trade_spread_leg.num_in_group;
        transition select(meta.execution_report_trade_spread_leg_fills_group_remaining) {
            8w0: read_execution_report_trade_spread_leg_spread_leg_order_events_group;
            default: parse_execution_report_trade_spread_leg_fills_group;
        }
    }

    state parse_execution_report_trade_spread_leg_fills_group {
        packet.extract(hdr.execution_report_trade_spread_leg_fills_group.next);
        meta.execution_report_trade_spread_leg_fills_group_remaining = meta.execution_report_trade_spread_leg_fills_group_remaining - 1;
        transition select(meta.execution_report_trade_spread_leg_fills_group_remaining) {
            8w0: read_execution_report_trade_spread_leg_spread_leg_order_events_group;
            default: parse_execution_report_trade_spread_leg_fills_group;
        }
    }

    state read_execution_report_trade_spread_leg_spread_leg_order_events_group {
        packet.extract(hdr.execution_report_trade_spread_leg_spread_leg_order_events_group_header);
        meta.execution_report_trade_spread_leg_spread_leg_order_events_group_remaining = hdr.execution_report_trade_spread_leg_spread_leg_order_events_group_header.num_in_group;
        transition select(meta.execution_report_trade_spread_leg_spread_leg_order_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_spread_leg_spread_leg_order_events_group;
        }
    }

    state parse_execution_report_trade_spread_leg_spread_leg_order_events_group {
        packet.extract(hdr.execution_report_trade_spread_leg_spread_leg_order_events_group.next);
        meta.execution_report_trade_spread_leg_spread_leg_order_events_group_remaining = meta.execution_report_trade_spread_leg_spread_leg_order_events_group_remaining - 1;
        transition select(meta.execution_report_trade_spread_leg_spread_leg_order_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_spread_leg_spread_leg_order_events_group;
        }
    }

    state parse_execution_report_modify {
        packet.extract(hdr.execution_report_modify);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_status {
        packet.extract(hdr.execution_report_status);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_report_cancel {
        packet.extract(hdr.execution_report_cancel);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_reject {
        packet.extract(hdr.order_cancel_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_replace_reject {
        packet.extract(hdr.order_cancel_replace_reject);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_party_details_list_report {
        packet.extract(hdr.party_details_list_report);
        meta.dispatched = 1;
        meta.party_details_list_report_party_details_group_remaining = hdr.party_details_list_report.num_in_group;
        transition select(meta.party_details_list_report_party_details_group_remaining) {
            8w0: read_party_details_list_report_trd_reg_publications_group;
            default: parse_party_details_list_report_party_details_group;
        }
    }

    state parse_party_details_list_report_party_details_group {
        packet.extract(hdr.party_details_list_report_party_details_group.next);
        meta.party_details_list_report_party_details_group_remaining = meta.party_details_list_report_party_details_group_remaining - 1;
        transition select(meta.party_details_list_report_party_details_group_remaining) {
            8w0: read_party_details_list_report_trd_reg_publications_group;
            default: parse_party_details_list_report_party_details_group;
        }
    }

    state read_party_details_list_report_trd_reg_publications_group {
        packet.extract(hdr.party_details_list_report_trd_reg_publications_group_header);
        meta.party_details_list_report_trd_reg_publications_group_remaining = hdr.party_details_list_report_trd_reg_publications_group_header.num_in_group;
        transition select(meta.party_details_list_report_trd_reg_publications_group_remaining) {
            8w0: accept;
            default: parse_party_details_list_report_trd_reg_publications_group;
        }
    }

    state parse_party_details_list_report_trd_reg_publications_group {
        packet.extract(hdr.party_details_list_report_trd_reg_publications_group.next);
        meta.party_details_list_report_trd_reg_publications_group_remaining = meta.party_details_list_report_trd_reg_publications_group_remaining - 1;
        transition select(meta.party_details_list_report_trd_reg_publications_group_remaining) {
            8w0: accept;
            default: parse_party_details_list_report_trd_reg_publications_group;
        }
    }

    state parse_execution_ack {
        packet.extract(hdr.execution_ack);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_quote_ack {
        packet.extract(hdr.mass_quote_ack);
        meta.dispatched = 1;
        meta.mass_quote_ack_quote_ack_entries_group_remaining = hdr.mass_quote_ack.num_in_group;
        transition select(meta.mass_quote_ack_quote_ack_entries_group_remaining) {
            8w0: accept;
            default: parse_mass_quote_ack_quote_ack_entries_group;
        }
    }

    state parse_mass_quote_ack_quote_ack_entries_group {
        packet.extract(hdr.mass_quote_ack_quote_ack_entries_group.next);
        meta.mass_quote_ack_quote_ack_entries_group_remaining = meta.mass_quote_ack_quote_ack_entries_group_remaining - 1;
        transition select(meta.mass_quote_ack_quote_ack_entries_group_remaining) {
            8w0: accept;
            default: parse_mass_quote_ack_quote_ack_entries_group;
        }
    }

    state parse_request_for_quote_ack {
        packet.extract(hdr.request_for_quote_ack);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_cancel_ack {
        packet.extract(hdr.quote_cancel_ack);
        meta.dispatched = 1;
        meta.quote_cancel_ack_quote_cancel_ack_entries_group_remaining = hdr.quote_cancel_ack.num_in_group;
        transition select(meta.quote_cancel_ack_quote_cancel_ack_entries_group_remaining) {
            8w0: read_quote_cancel_ack_quote_cancel_ack_sets_group;
            default: parse_quote_cancel_ack_quote_cancel_ack_entries_group;
        }
    }

    state parse_quote_cancel_ack_quote_cancel_ack_entries_group {
        packet.extract(hdr.quote_cancel_ack_quote_cancel_ack_entries_group.next);
        meta.quote_cancel_ack_quote_cancel_ack_entries_group_remaining = meta.quote_cancel_ack_quote_cancel_ack_entries_group_remaining - 1;
        transition select(meta.quote_cancel_ack_quote_cancel_ack_entries_group_remaining) {
            8w0: read_quote_cancel_ack_quote_cancel_ack_sets_group;
            default: parse_quote_cancel_ack_quote_cancel_ack_entries_group;
        }
    }

    state read_quote_cancel_ack_quote_cancel_ack_sets_group {
        packet.extract(hdr.quote_cancel_ack_quote_cancel_ack_sets_group_header);
        meta.quote_cancel_ack_quote_cancel_ack_sets_group_remaining = hdr.quote_cancel_ack_quote_cancel_ack_sets_group_header.num_in_group;
        transition select(meta.quote_cancel_ack_quote_cancel_ack_sets_group_remaining) {
            8w0: accept;
            default: parse_quote_cancel_ack_quote_cancel_ack_sets_group;
        }
    }

    state parse_quote_cancel_ack_quote_cancel_ack_sets_group {
        packet.extract(hdr.quote_cancel_ack_quote_cancel_ack_sets_group.next);
        meta.quote_cancel_ack_quote_cancel_ack_sets_group_remaining = meta.quote_cancel_ack_quote_cancel_ack_sets_group_remaining - 1;
        transition select(meta.quote_cancel_ack_quote_cancel_ack_sets_group_remaining) {
            8w0: accept;
            default: parse_quote_cancel_ack_quote_cancel_ack_sets_group;
        }
    }

    state parse_execution_report_trade_addendum_outright {
        packet.extract(hdr.execution_report_trade_addendum_outright);
        meta.dispatched = 1;
        meta.execution_report_trade_addendum_outright_fills_group_remaining = hdr.execution_report_trade_addendum_outright.num_in_group;
        transition select(meta.execution_report_trade_addendum_outright_fills_group_remaining) {
            8w0: read_execution_report_trade_addendum_outright_outright_trade_events_group;
            default: parse_execution_report_trade_addendum_outright_fills_group;
        }
    }

    state parse_execution_report_trade_addendum_outright_fills_group {
        packet.extract(hdr.execution_report_trade_addendum_outright_fills_group.next);
        meta.execution_report_trade_addendum_outright_fills_group_remaining = meta.execution_report_trade_addendum_outright_fills_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_outright_fills_group_remaining) {
            8w0: read_execution_report_trade_addendum_outright_outright_trade_events_group;
            default: parse_execution_report_trade_addendum_outright_fills_group;
        }
    }

    state read_execution_report_trade_addendum_outright_outright_trade_events_group {
        packet.extract(hdr.execution_report_trade_addendum_outright_outright_trade_events_group_header);
        meta.execution_report_trade_addendum_outright_outright_trade_events_group_remaining = hdr.execution_report_trade_addendum_outright_outright_trade_events_group_header.num_in_group;
        transition select(meta.execution_report_trade_addendum_outright_outright_trade_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_addendum_outright_outright_trade_events_group;
        }
    }

    state parse_execution_report_trade_addendum_outright_outright_trade_events_group {
        packet.extract(hdr.execution_report_trade_addendum_outright_outright_trade_events_group.next);
        meta.execution_report_trade_addendum_outright_outright_trade_events_group_remaining = meta.execution_report_trade_addendum_outright_outright_trade_events_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_outright_outright_trade_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_addendum_outright_outright_trade_events_group;
        }
    }

    state parse_execution_report_trade_addendum_spread {
        packet.extract(hdr.execution_report_trade_addendum_spread);
        meta.dispatched = 1;
        meta.execution_report_trade_addendum_spread_fills_group_remaining = hdr.execution_report_trade_addendum_spread.num_in_group;
        transition select(meta.execution_report_trade_addendum_spread_fills_group_remaining) {
            8w0: read_execution_report_trade_addendum_spread_trade_addendum_legs_group;
            default: parse_execution_report_trade_addendum_spread_fills_group;
        }
    }

    state parse_execution_report_trade_addendum_spread_fills_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_fills_group.next);
        meta.execution_report_trade_addendum_spread_fills_group_remaining = meta.execution_report_trade_addendum_spread_fills_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_spread_fills_group_remaining) {
            8w0: read_execution_report_trade_addendum_spread_trade_addendum_legs_group;
            default: parse_execution_report_trade_addendum_spread_fills_group;
        }
    }

    state read_execution_report_trade_addendum_spread_trade_addendum_legs_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_trade_addendum_legs_group_header);
        meta.execution_report_trade_addendum_spread_trade_addendum_legs_group_remaining = hdr.execution_report_trade_addendum_spread_trade_addendum_legs_group_header.num_in_group;
        transition select(meta.execution_report_trade_addendum_spread_trade_addendum_legs_group_remaining) {
            8w0: read_execution_report_trade_addendum_spread_spread_trade_events_group;
            default: parse_execution_report_trade_addendum_spread_trade_addendum_legs_group;
        }
    }

    state parse_execution_report_trade_addendum_spread_trade_addendum_legs_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_trade_addendum_legs_group.next);
        meta.execution_report_trade_addendum_spread_trade_addendum_legs_group_remaining = meta.execution_report_trade_addendum_spread_trade_addendum_legs_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_spread_trade_addendum_legs_group_remaining) {
            8w0: read_execution_report_trade_addendum_spread_spread_trade_events_group;
            default: parse_execution_report_trade_addendum_spread_trade_addendum_legs_group;
        }
    }

    state read_execution_report_trade_addendum_spread_spread_trade_events_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_spread_trade_events_group_header);
        meta.execution_report_trade_addendum_spread_spread_trade_events_group_remaining = hdr.execution_report_trade_addendum_spread_spread_trade_events_group_header.num_in_group;
        transition select(meta.execution_report_trade_addendum_spread_spread_trade_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_addendum_spread_spread_trade_events_group;
        }
    }

    state parse_execution_report_trade_addendum_spread_spread_trade_events_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_spread_trade_events_group.next);
        meta.execution_report_trade_addendum_spread_spread_trade_events_group_remaining = meta.execution_report_trade_addendum_spread_spread_trade_events_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_spread_spread_trade_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_addendum_spread_spread_trade_events_group;
        }
    }

    state parse_execution_report_trade_addendum_spread_leg {
        packet.extract(hdr.execution_report_trade_addendum_spread_leg);
        meta.dispatched = 1;
        meta.execution_report_trade_addendum_spread_leg_fills_group_remaining = hdr.execution_report_trade_addendum_spread_leg.num_in_group;
        transition select(meta.execution_report_trade_addendum_spread_leg_fills_group_remaining) {
            8w0: read_execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group;
            default: parse_execution_report_trade_addendum_spread_leg_fills_group;
        }
    }

    state parse_execution_report_trade_addendum_spread_leg_fills_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_leg_fills_group.next);
        meta.execution_report_trade_addendum_spread_leg_fills_group_remaining = meta.execution_report_trade_addendum_spread_leg_fills_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_spread_leg_fills_group_remaining) {
            8w0: read_execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group;
            default: parse_execution_report_trade_addendum_spread_leg_fills_group;
        }
    }

    state read_execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_header);
        meta.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_remaining = hdr.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_header.num_in_group;
        transition select(meta.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group;
        }
    }

    state parse_execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group {
        packet.extract(hdr.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group.next);
        meta.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_remaining = meta.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_remaining - 1;
        transition select(meta.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_remaining) {
            8w0: accept;
            default: parse_execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group;
        }
    }

    state parse_order_mass_action_report {
        packet.extract(hdr.order_mass_action_report);
        meta.dispatched = 1;
        meta.order_mass_action_report_affected_orders_group_remaining = hdr.order_mass_action_report.num_in_group;
        transition select(meta.order_mass_action_report_affected_orders_group_remaining) {
            8w0: accept;
            default: parse_order_mass_action_report_affected_orders_group;
        }
    }

    state parse_order_mass_action_report_affected_orders_group {
        packet.extract(hdr.order_mass_action_report_affected_orders_group.next);
        meta.order_mass_action_report_affected_orders_group_remaining = meta.order_mass_action_report_affected_orders_group_remaining - 1;
        transition select(meta.order_mass_action_report_affected_orders_group_remaining) {
            8w0: accept;
            default: parse_order_mass_action_report_affected_orders_group;
        }
    }

    state parse_security_definition_response {
        packet.extract(hdr.security_definition_response);
        meta.dispatched = 1;
        meta.security_definition_response_response_legs_group_remaining = hdr.security_definition_response.num_in_group;
        transition select(meta.security_definition_response_response_legs_group_remaining) {
            8w0: accept;
            default: parse_security_definition_response_response_legs_group;
        }
    }

    state parse_security_definition_response_response_legs_group {
        packet.extract(hdr.security_definition_response_response_legs_group.next);
        meta.security_definition_response_response_legs_group_remaining = meta.security_definition_response_response_legs_group_remaining - 1;
        transition select(meta.security_definition_response_response_legs_group_remaining) {
            8w0: accept;
            default: parse_security_definition_response_response_legs_group;
        }
    }

}

control CmeGlobexIlink3ServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexIlink3ServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control CmeGlobexIlink3ServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexIlink3ServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexIlink3ServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.negotiation_response);
        packet.emit(hdr.negotiation_reject);
        packet.emit(hdr.establishment_ack);
        packet.emit(hdr.establishment_reject);
        packet.emit(hdr.sequence);
        packet.emit(hdr.terminate);
        packet.emit(hdr.retransmission);
        packet.emit(hdr.retransmit_reject);
        packet.emit(hdr.not_applied);
        packet.emit(hdr.party_details_definition_request_ack);
        packet.emit(hdr.party_details_definition_request_ack_party_details_group);
        packet.emit(hdr.party_details_definition_request_ack_trd_reg_publications_group_header);
        packet.emit(hdr.party_details_definition_request_ack_trd_reg_publications_group);
        packet.emit(hdr.business_reject);
        packet.emit(hdr.execution_report_new);
        packet.emit(hdr.execution_report_reject);
        packet.emit(hdr.execution_report_elimination);
        packet.emit(hdr.execution_report_trade_outright);
        packet.emit(hdr.execution_report_trade_outright_fills_group);
        packet.emit(hdr.execution_report_trade_outright_outright_order_events_group_header);
        packet.emit(hdr.execution_report_trade_outright_outright_order_events_group);
        packet.emit(hdr.execution_report_trade_spread);
        packet.emit(hdr.execution_report_trade_spread_fills_group);
        packet.emit(hdr.execution_report_trade_spread_trade_legs_group_header);
        packet.emit(hdr.execution_report_trade_spread_trade_legs_group);
        packet.emit(hdr.execution_report_trade_spread_spread_order_events_group_header);
        packet.emit(hdr.execution_report_trade_spread_spread_order_events_group);
        packet.emit(hdr.execution_report_trade_spread_leg);
        packet.emit(hdr.execution_report_trade_spread_leg_fills_group);
        packet.emit(hdr.execution_report_trade_spread_leg_spread_leg_order_events_group_header);
        packet.emit(hdr.execution_report_trade_spread_leg_spread_leg_order_events_group);
        packet.emit(hdr.execution_report_modify);
        packet.emit(hdr.execution_report_status);
        packet.emit(hdr.execution_report_cancel);
        packet.emit(hdr.order_cancel_reject);
        packet.emit(hdr.order_cancel_replace_reject);
        packet.emit(hdr.party_details_list_report);
        packet.emit(hdr.party_details_list_report_party_details_group);
        packet.emit(hdr.party_details_list_report_trd_reg_publications_group_header);
        packet.emit(hdr.party_details_list_report_trd_reg_publications_group);
        packet.emit(hdr.execution_ack);
        packet.emit(hdr.mass_quote_ack);
        packet.emit(hdr.mass_quote_ack_quote_ack_entries_group);
        packet.emit(hdr.request_for_quote_ack);
        packet.emit(hdr.quote_cancel_ack);
        packet.emit(hdr.quote_cancel_ack_quote_cancel_ack_entries_group);
        packet.emit(hdr.quote_cancel_ack_quote_cancel_ack_sets_group_header);
        packet.emit(hdr.quote_cancel_ack_quote_cancel_ack_sets_group);
        packet.emit(hdr.execution_report_trade_addendum_outright);
        packet.emit(hdr.execution_report_trade_addendum_outright_fills_group);
        packet.emit(hdr.execution_report_trade_addendum_outright_outright_trade_events_group_header);
        packet.emit(hdr.execution_report_trade_addendum_outright_outright_trade_events_group);
        packet.emit(hdr.execution_report_trade_addendum_spread);
        packet.emit(hdr.execution_report_trade_addendum_spread_fills_group);
        packet.emit(hdr.execution_report_trade_addendum_spread_trade_addendum_legs_group_header);
        packet.emit(hdr.execution_report_trade_addendum_spread_trade_addendum_legs_group);
        packet.emit(hdr.execution_report_trade_addendum_spread_spread_trade_events_group_header);
        packet.emit(hdr.execution_report_trade_addendum_spread_spread_trade_events_group);
        packet.emit(hdr.execution_report_trade_addendum_spread_leg);
        packet.emit(hdr.execution_report_trade_addendum_spread_leg_fills_group);
        packet.emit(hdr.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group_header);
        packet.emit(hdr.execution_report_trade_addendum_spread_leg_spread_leg_trade_events_group);
        packet.emit(hdr.order_mass_action_report);
        packet.emit(hdr.order_mass_action_report_affected_orders_group);
        packet.emit(hdr.security_definition_response);
        packet.emit(hdr.security_definition_response_response_legs_group);
    }
}

V1Switch(
    CmeGlobexIlink3ServerParser(),
    CmeGlobexIlink3ServerVerifyChecksum(),
    CmeGlobexIlink3ServerIngress(),
    CmeGlobexIlink3ServerEgress(),
    CmeGlobexIlink3ServerComputeChecksum(),
    CmeGlobexIlink3ServerDeparser()
) main;
