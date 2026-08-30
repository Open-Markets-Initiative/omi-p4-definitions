// P4_16 (v1model) definition for: B3 B3Derivatives BinaryEntryPoint Sbe v7.1
// 
// Protocol:
//   Organization: Brasil, Bolsa, Balcão
//   Protocol: Binary Entry Point
//   Encoding: Simple Binary Encoding
//   Version: 7.1
//   Date: 9/14/2023
//   Specification: BinaryEntryPoint-MessageReference-7.1.0-enUS.pdf
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

header negotiate_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<64> timestamp;
    bit<32> entering_firm;
    bit<32> onbehalf_firm;
    bit<8> credentials_length;
    bit<8> credentials_data;
    bit<8> client_ip_length;
    bit<8> client_ip_data;
    bit<8> client_app_name_length;
    bit<8> client_app_name_data;
    bit<8> client_app_version_length;
    bit<8> client_app_version_data;
}

header negotiate_response_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<64> request_timestamp;
    bit<32> entering_firm;
}

header negotiate_reject_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<64> request_timestamp;
    bit<32> entering_firm_optional;
    bit<8> negotiation_reject_code;
    bit<24> offset_25_padding_3;
    bit<64> current_session_ver_id;
}

header establish_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<64> timestamp;
    bit<64> keep_alive_interval;
    bit<32> next_seq_no;
    bit<8> cancel_on_disconnect_type;
    bit<8> offset_33_padding_1;
    bit<64> cod_timeout_window;
    bit<8> credentials_length;
    bit<8> credentials_data;
}

header establish_ack_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<64> request_timestamp;
    bit<64> keep_alive_interval;
    bit<32> next_seq_no;
    bit<32> last_incoming_seq_no;
}

header establish_reject_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<64> request_timestamp;
    bit<8> establishment_reject_code;
    bit<8> offset_21_padding_1;
    bit<32> last_incoming_seq_no_optional;
}

header terminate_message_t {
    bit<32> session_id;
    bit<64> session_ver_id;
    bit<8> termination_code;
}

header not_applied_message_t {
    bit<32> from_seq_no;
    bit<32> count;
}

header sequence_message_t {
    bit<32> next_seq_no;
}

header retransmit_request_message_t {
    bit<32> session_id;
    bit<64> timestamp;
    bit<32> from_seq_no;
    bit<32> count;
}

header retransmission_message_t {
    bit<32> session_id;
    bit<64> request_timestamp;
    bit<32> next_seq_no;
    bit<32> count;
}

header retransmit_reject_message_t {
    bit<32> session_id;
    bit<64> request_timestamp;
    bit<8> retransmit_reject_code;
}

header simple_new_order_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<8> ord_tag_id;
    bit<8> mm_protection_reset;
    bit<64> clordid;
    bit<32> account;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<8> self_trade_prevention_instruction;
    bit<64> security_id;
    bit<8> side;
    bit<8> simple_ordtype;
    bit<8> time_in_force_simple;
    bit<8> offset_59_padding_1;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<16> prefix;
    bit<32> document;
    bit<8> routing_instruction;
    bit<8> deprecated_investor_id_length;
    bit<8> deprecated_investor_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header simple_modify_order_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<8> ord_tag_id;
    bit<8> mm_protection_reset;
    bit<64> clordid;
    bit<32> account;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<8> self_trade_prevention_instruction;
    bit<64> security_id;
    bit<8> side;
    bit<8> simple_ordtype;
    bit<8> time_in_force_simple;
    bit<8> offset_59_padding_1;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> order_id_optional;
    bit<64> origclordid;
    bit<16> prefix;
    bit<32> document;
    bit<8> routing_instruction;
    bit<8> deprecated_investor_id_length;
    bit<8> deprecated_investor_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header new_order_single_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<8> ord_tag_id;
    bit<8> mm_protection_reset;
    bit<64> clordid;
    bit<32> account;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<8> self_trade_prevention_instruction;
    bit<64> security_id;
    bit<8> side;
    bit<8> ordtype;
    bit<8> time_in_force;
    bit<8> offset_59_padding_1;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<64> max_floor;
    bit<40> executing_trader_optional;
    bit<8> routing_instruction;
    bit<16> expire_date;
    bit<32> custodian;
    bit<32> custody_account;
    bit<32> custody_allocation_type;
    bit<16> prefix;
    bit<32> document;
    bit<8> deprecated_investor_id_length;
    bit<8> deprecated_investor_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header order_cancel_replace_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<8> ord_tag_id;
    bit<8> mm_protection_reset;
    bit<64> clordid;
    bit<32> account;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<8> self_trade_prevention_instruction;
    bit<64> security_id;
    bit<8> side;
    bit<8> ordtype;
    bit<8> time_in_force_optional;
    bit<8> account_type;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> order_id_optional;
    bit<64> origclordid;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<64> max_floor;
    bit<40> executing_trader_optional;
    bit<8> routing_instruction;
    bit<16> expire_date;
    bit<32> custodian;
    bit<32> custody_account;
    bit<32> custody_allocation_type;
    bit<16> prefix;
    bit<32> document;
    bit<8> deprecated_investor_id_length;
    bit<8> deprecated_investor_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header order_cancel_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<16> offset_18_padding_2;
    bit<64> clordid;
    bit<64> security_id;
    bit<64> order_id_optional;
    bit<64> origclordid;
    bit<8> side;
    bit<8> single_cancel_restatement_reason;
    bit<16> offset_54_padding_2;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<40> executing_trader_optional;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header new_order_cross_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<16> offset_18_padding_2;
    bit<64> crossid;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<40> executing_trader_optional;
    bit<64> security_id;
    bit<64> order_qty;
    bit<64> price;
    bit<16> crossed_indicator;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> side;
    bit<8> offset_1_padding_1;
    bit<32> account;
    bit<32> entering_firm_optional;
    bit<64> clordid;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header execution_report_new_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> side;
    bit<8> ord_status;
    bit<64> clordid;
    bit<64> secondary_order_id;
    bit<64> security_id;
    bit<64> order_id;
    bit<32> account;
    bit<64> exec_id;
    bit<64> transact_time;
    bit<64> market_segment_received_time;
    bit<64> protection_price;
    bit<16> trade_date;
    bit<8> working_indicator;
    bit<8> multi_leg_reporting_type;
    bit<8> ordtype;
    bit<8> time_in_force;
    bit<16> expire_date;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<64> max_floor;
    bit<64> crossid_optional;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header execution_report_modify_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> side;
    bit<8> ord_status;
    bit<64> clordid;
    bit<64> secondary_order_id;
    bit<64> security_id;
    bit<64> leaves_qty;
    bit<32> account;
    bit<64> exec_id;
    bit<64> transact_time;
    bit<64> cum_qty;
    bit<64> market_segment_received_time;
    bit<64> order_id;
    bit<64> origclordid;
    bit<64> protection_price;
    bit<16> trade_date;
    bit<8> working_indicator;
    bit<8> multi_leg_reporting_type;
    bit<8> ordtype;
    bit<8> time_in_force;
    bit<16> expire_date;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<64> max_floor;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header execution_report_cancel_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> side;
    bit<8> ord_status;
    bit<64> clordid;
    bit<64> secondary_order_id;
    bit<64> security_id;
    bit<64> cum_qty;
    bit<32> account;
    bit<64> exec_id;
    bit<64> transact_time;
    bit<64> market_segment_received_time;
    bit<64> order_id;
    bit<64> origclordid;
    bit<16> trade_date;
    bit<8> working_indicator;
    bit<8> exec_restatement_reason;
    bit<32> action_requested_from_session_id;
    bit<64> mass_action_report_id_optional;
    bit<8> ordtype;
    bit<8> time_in_force;
    bit<16> expire_date;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<64> max_floor;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header execution_report_trade_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> side;
    bit<8> ord_status;
    bit<64> clordid_optional;
    bit<64> secondary_order_id;
    bit<64> security_id;
    bit<32> account;
    bit<64> last_qty;
    bit<64> last_px;
    bit<64> exec_id;
    bit<64> transact_time;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> aggressor_indicator;
    bit<8> exec_type;
    bit<8> order_category;
    bit<8> multi_leg_reporting_type;
    bit<32> trade_id;
    bit<32> contra_broker;
    bit<64> order_id;
    bit<16> trade_date;
    bit<8> tot_no_related_sym;
    bit<8> offset_119_padding_1;
    bit<64> secondary_exec_id;
    bit<64> exec_ref_id;
    bit<64> crossid_optional;
    bit<16> crossed_indicator;
    bit<64> order_qty;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header execution_report_reject_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> side;
    bit<8> cxl_rej_response_to;
    bit<64> clordid;
    bit<64> secondary_order_id_optional;
    bit<64> security_id;
    bit<32> ord_rej_reason;
    bit<64> transact_time;
    bit<64> exec_id;
    bit<64> order_id_optional;
    bit<64> origclordid;
    bit<32> account;
    bit<8> ordtype;
    bit<8> time_in_force;
    bit<16> expire_date;
    bit<64> order_qty;
    bit<64> price_optional;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<64> max_floor;
    bit<64> crossid_optional;
    bit<16> crossed_indicator;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
    bit<8> text_length;
    bit<8> text_data;
}

header execution_report_forward_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> side;
    bit<8> ord_status;
    bit<64> clordid_optional;
    bit<64> secondary_order_id;
    bit<64> security_id;
    bit<32> account;
    bit<64> last_qty;
    bit<64> last_px;
    bit<64> exec_id;
    bit<64> transact_time;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<32> trade_id;
    bit<32> contra_broker;
    bit<64> order_id;
    bit<8> aggressor_indicator;
    bit<8> settltype_optional;
    bit<16> trade_date;
    bit<16> days_to_settlement_optional;
    bit<16> offset_118_padding_2;
    bit<64> secondary_exec_id;
    bit<64> exec_ref_id;
    bit<64> fixed_rate_optional;
    bit<64> order_qty;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header business_message_reject_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> ref_msg_type;
    bit<8> offset_19_padding_1;
    bit<32> ref_seq_num;
    bit<64> business_reject_ref_id;
    bit<32> business_reject_reason;
    bit<8> memo_length;
    bit<8> memo_data;
    bit<8> text_length;
    bit<8> text_data;
}

header security_definition_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<64> security_req_id;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<160> leg_symbol;
    bit<64> leg_ratio_qty;
    bit<8> leg_side;
    bit<8> padding_1;
}

header security_definition_response_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<16> offset_18_padding_2;
    bit<64> security_req_id;
    bit<64> security_id;
    bit<8> security_response_type;
    bit<24> security_strategy_type;
    bit<160> symbol;
    bit<64> security_response_id;
    bit<80> sender_location;
    bit<40> entering_trader;
}

header quote_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> market_segment_id_optional;
    bit<8> padding;
    bit<64> security_id;
    bit<64> quote_id_optional;
    bit<32> trade_id_optional;
    bit<32> contra_broker;
    bit<64> transact_time;
    bit<64> price;
    bit<8> settltype;
    bit<8> execute_underlying_trade;
    bit<64> order_qty;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<40> executing_trader;
    bit<64> fixed_rate;
    bit<16> days_to_settlement;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> side;
    bit<32> account;
    bit<8> quote_req_id_length;
    bit<8> quote_req_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header quote_status_report_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> market_segment_id_optional;
    bit<8> padding;
    bit<32> quote_reject_reason;
    bit<64> security_id;
    bit<64> quote_id;
    bit<32> trade_id_optional;
    bit<32> contra_broker;
    bit<64> transact_time;
    bit<8> quote_status;
    bit<8> quote_status_response_to;
    bit<32> account;
    bit<8> side_optional;
    bit<8> settltype_optional;
    bit<64> price_optional;
    bit<64> order_qty;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<40> executing_trader;
    bit<64> fixed_rate_optional;
    bit<8> execute_underlying_trade;
    bit<16> days_to_settlement_optional;
    bit<8> quote_req_id_length;
    bit<8> quote_req_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
    bit<8> text_length;
    bit<8> text_data;
}

header quote_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> market_segment_id_optional;
    bit<8> padding;
    bit<64> security_id;
    bit<64> quote_id;
    bit<64> transact_time;
    bit<64> price_optional;
    bit<64> order_qty;
    bit<8> side;
    bit<8> settltype;
    bit<32> account;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<40> executing_trader;
    bit<64> fixed_rate;
    bit<8> execute_underlying_trade;
    bit<16> days_to_settlement;
    bit<8> quote_req_id_length;
    bit<8> quote_req_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header quote_cancel_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> market_segment_id_optional;
    bit<8> padding;
    bit<64> security_id;
    bit<64> quote_id_optional;
    bit<32> account;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<40> executing_trader;
    bit<8> quote_req_id_length;
    bit<8> quote_req_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header quote_request_reject_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> market_segment_id_optional;
    bit<8> padding;
    bit<32> quote_request_reject_reason;
    bit<64> security_id;
    bit<64> quote_id_optional;
    bit<32> trade_id_optional;
    bit<32> contra_broker;
    bit<64> transact_time;
    bit<40> entering_trader;
    bit<8> settltype_optional;
    bit<64> price_optional;
    bit<64> order_qty_optional;
    bit<80> sender_location;
    bit<40> executing_trader;
    bit<64> fixed_rate_optional;
    bit<16> days_to_settlement_optional;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> side;
    bit<32> account;
    bit<8> quote_req_id_length;
    bit<8> quote_req_id_data;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
    bit<8> text_length;
    bit<8> text_data;
}

header position_maintenance_cancel_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<64> pos_req_id;
    bit<64> security_id;
    bit<64> orig_pos_req_ref_id;
    bit<64> pos_maint_rpt_ref_id;
    bit<80> sender_location;
    bit<40> entering_trader;
}

header position_maintenance_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<64> pos_req_id;
    bit<64> security_id;
    bit<64> threshold_amount;
    bit<32> account;
    bit<80> sender_location;
    bit<8> pos_trans_type;
    bit<16> clearing_business_date;
    bit<8> contrary_instruction_indicator;
    bit<40> entering_trader;
    bit<64> long_qty;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header position_maintenance_report_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<64> pos_req_id_optional;
    bit<64> security_id;
    bit<64> pos_maint_rpt_id;
    bit<8> pos_trans_type;
    bit<8> pos_maint_action;
    bit<8> pos_maint_status;
    bit<32> trade_id_optional;
    bit<64> orig_pos_req_ref_id;
    bit<8> account_type;
    bit<16> clearing_business_date;
    bit<64> threshold_amount;
    bit<64> transact_time;
    bit<32> account;
    bit<80> sender_location;
    bit<32> pos_maint_result;
    bit<8> contrary_instruction_indicator;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<8> pos_type;
    bit<64> long_qty_optional;
    bit<64> short_qty;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
    bit<8> text_length;
    bit<8> text_data;
}

header allocation_instruction_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<64> alloc_id;
    bit<64> security_id;
    bit<8> alloc_trans_type;
    bit<8> alloc_type;
    bit<8> alloc_no_orders_type;
    bit<64> quantity;
    bit<80> sender_location;
    bit<40> entering_trader;
    bit<32> trade_id;
    bit<16> trade_date_optional;
    bit<64> individual_alloc_id;
    bit<32> alloc_account;
    bit<64> alloc_qty;
    bit<8> desk_id_length;
    bit<8> desk_id_data;
    bit<8> memo_length;
    bit<8> memo_data;
}

header allocation_report_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<64> alloc_id;
    bit<64> security_id;
    bit<64> alloc_report_id;
    bit<8> alloc_trans_type;
    bit<8> alloc_report_type;
    bit<8> alloc_no_orders_type;
    bit<32> alloc_rej_code;
    bit<64> quantity;
    bit<8> alloc_status;
    bit<16> trade_date_optional;
    bit<64> transact_time;
    bit<8> side;
    bit<80> sender_location;
    bit<40> entering_trader;
}

header order_mass_action_request_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> market_segment_id;
    bit<8> padding;
    bit<8> mass_action_type;
    bit<8> mass_action_scope;
    bit<64> clordid;
    bit<8> mass_cancel_restatement_reason;
    bit<8> ord_tag_id;
    bit<8> side_optional;
    bit<8> offset_31_padding_1;
    bit<48> asset;
    bit<64> security_id_optional;
    bit<32> action_target_session_id;
    bit<32> action_target_group_id;
}

header order_mass_action_report_message_t {
    bit<32> session_id;
    bit<32> msg_seq_num;
    bit<64> sending_time;
    bit<8> poss_resend;
    bit<8> padding;
    bit<8> mass_action_type;
    bit<8> mass_action_scope;
    bit<64> clordid;
    bit<64> mass_action_report_id;
    bit<64> transact_time;
    bit<8> mass_action_response;
    bit<8> mass_action_reject_reason;
    bit<8> mass_cancel_restatement_reason;
    bit<8> ord_tag_id;
    bit<8> side_optional;
    bit<8> offset_49_padding_1;
    bit<48> asset;
    bit<64> security_id_optional;
    bit<32> action_target_session_id;
    bit<32> action_target_group_id;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<32> ref_comp_id;
    bit<8> text_length;
    bit<8> text_data;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    negotiate_message_t negotiate_message;
    negotiate_response_message_t negotiate_response_message;
    negotiate_reject_message_t negotiate_reject_message;
    establish_message_t establish_message;
    establish_ack_message_t establish_ack_message;
    establish_reject_message_t establish_reject_message;
    terminate_message_t terminate_message;
    not_applied_message_t not_applied_message;
    sequence_message_t sequence_message;
    retransmit_request_message_t retransmit_request_message;
    retransmission_message_t retransmission_message;
    retransmit_reject_message_t retransmit_reject_message;
    simple_new_order_message_t simple_new_order_message;
    simple_modify_order_message_t simple_modify_order_message;
    new_order_single_message_t new_order_single_message;
    order_cancel_replace_request_message_t order_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    new_order_cross_message_t new_order_cross_message;
    execution_report_new_message_t execution_report_new_message;
    execution_report_modify_message_t execution_report_modify_message;
    execution_report_cancel_message_t execution_report_cancel_message;
    execution_report_trade_message_t execution_report_trade_message;
    execution_report_reject_message_t execution_report_reject_message;
    execution_report_forward_message_t execution_report_forward_message;
    business_message_reject_message_t business_message_reject_message;
    security_definition_request_message_t security_definition_request_message;
    security_definition_response_message_t security_definition_response_message;
    quote_request_message_t quote_request_message;
    quote_status_report_message_t quote_status_report_message;
    quote_message_t quote_message;
    quote_cancel_message_t quote_cancel_message;
    quote_request_reject_message_t quote_request_reject_message;
    position_maintenance_cancel_request_message_t position_maintenance_cancel_request_message;
    position_maintenance_request_message_t position_maintenance_request_message;
    position_maintenance_report_message_t position_maintenance_report_message;
    allocation_instruction_message_t allocation_instruction_message;
    allocation_report_message_t allocation_report_message;
    order_mass_action_request_message_t order_mass_action_request_message;
    order_mass_action_report_message_t order_mass_action_report_message;
}

parser B3derivativesBinaryentrypointParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w1: parse_negotiate_message;
            16w2: parse_negotiate_response_message;
            16w3: parse_negotiate_reject_message;
            16w4: parse_establish_message;
            16w5: parse_establish_ack_message;
            16w6: parse_establish_reject_message;
            16w7: parse_terminate_message;
            16w8: parse_not_applied_message;
            16w9: parse_sequence_message;
            16w12: parse_retransmit_request_message;
            16w13: parse_retransmission_message;
            16w14: parse_retransmit_reject_message;
            16w100: parse_simple_new_order_message;
            16w101: parse_simple_modify_order_message;
            16w102: parse_new_order_single_message;
            16w104: parse_order_cancel_replace_request_message;
            16w105: parse_order_cancel_request_message;
            16w106: parse_new_order_cross_message;
            16w200: parse_execution_report_new_message;
            16w201: parse_execution_report_modify_message;
            16w202: parse_execution_report_cancel_message;
            16w203: parse_execution_report_trade_message;
            16w204: parse_execution_report_reject_message;
            16w205: parse_execution_report_forward_message;
            16w206: parse_business_message_reject_message;
            16w300: parse_security_definition_request_message;
            16w301: parse_security_definition_response_message;
            16w401: parse_quote_request_message;
            16w402: parse_quote_status_report_message;
            16w403: parse_quote_message;
            16w404: parse_quote_cancel_message;
            16w405: parse_quote_request_reject_message;
            16w501: parse_position_maintenance_cancel_request_message;
            16w502: parse_position_maintenance_request_message;
            16w503: parse_position_maintenance_report_message;
            16w601: parse_allocation_instruction_message;
            16w602: parse_allocation_report_message;
            16w701: parse_order_mass_action_request_message;
            16w702: parse_order_mass_action_report_message;
            default: accept;
        }
    }

    state parse_negotiate_message {
        packet.extract(hdr.negotiate_message);
        transition accept;
    }

    state parse_negotiate_response_message {
        packet.extract(hdr.negotiate_response_message);
        transition accept;
    }

    state parse_negotiate_reject_message {
        packet.extract(hdr.negotiate_reject_message);
        transition accept;
    }

    state parse_establish_message {
        packet.extract(hdr.establish_message);
        transition accept;
    }

    state parse_establish_ack_message {
        packet.extract(hdr.establish_ack_message);
        transition accept;
    }

    state parse_establish_reject_message {
        packet.extract(hdr.establish_reject_message);
        transition accept;
    }

    state parse_terminate_message {
        packet.extract(hdr.terminate_message);
        transition accept;
    }

    state parse_not_applied_message {
        packet.extract(hdr.not_applied_message);
        transition accept;
    }

    state parse_sequence_message {
        packet.extract(hdr.sequence_message);
        transition accept;
    }

    state parse_retransmit_request_message {
        packet.extract(hdr.retransmit_request_message);
        transition accept;
    }

    state parse_retransmission_message {
        packet.extract(hdr.retransmission_message);
        transition accept;
    }

    state parse_retransmit_reject_message {
        packet.extract(hdr.retransmit_reject_message);
        transition accept;
    }

    state parse_simple_new_order_message {
        packet.extract(hdr.simple_new_order_message);
        transition accept;
    }

    state parse_simple_modify_order_message {
        packet.extract(hdr.simple_modify_order_message);
        transition accept;
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

    state parse_new_order_cross_message {
        packet.extract(hdr.new_order_cross_message);
        transition accept;
    }

    state parse_execution_report_new_message {
        packet.extract(hdr.execution_report_new_message);
        transition accept;
    }

    state parse_execution_report_modify_message {
        packet.extract(hdr.execution_report_modify_message);
        transition accept;
    }

    state parse_execution_report_cancel_message {
        packet.extract(hdr.execution_report_cancel_message);
        transition accept;
    }

    state parse_execution_report_trade_message {
        packet.extract(hdr.execution_report_trade_message);
        transition accept;
    }

    state parse_execution_report_reject_message {
        packet.extract(hdr.execution_report_reject_message);
        transition accept;
    }

    state parse_execution_report_forward_message {
        packet.extract(hdr.execution_report_forward_message);
        transition accept;
    }

    state parse_business_message_reject_message {
        packet.extract(hdr.business_message_reject_message);
        transition accept;
    }

    state parse_security_definition_request_message {
        packet.extract(hdr.security_definition_request_message);
        transition accept;
    }

    state parse_security_definition_response_message {
        packet.extract(hdr.security_definition_response_message);
        transition accept;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message);
        transition accept;
    }

    state parse_quote_status_report_message {
        packet.extract(hdr.quote_status_report_message);
        transition accept;
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message);
        transition accept;
    }

    state parse_quote_cancel_message {
        packet.extract(hdr.quote_cancel_message);
        transition accept;
    }

    state parse_quote_request_reject_message {
        packet.extract(hdr.quote_request_reject_message);
        transition accept;
    }

    state parse_position_maintenance_cancel_request_message {
        packet.extract(hdr.position_maintenance_cancel_request_message);
        transition accept;
    }

    state parse_position_maintenance_request_message {
        packet.extract(hdr.position_maintenance_request_message);
        transition accept;
    }

    state parse_position_maintenance_report_message {
        packet.extract(hdr.position_maintenance_report_message);
        transition accept;
    }

    state parse_allocation_instruction_message {
        packet.extract(hdr.allocation_instruction_message);
        transition accept;
    }

    state parse_allocation_report_message {
        packet.extract(hdr.allocation_report_message);
        transition accept;
    }

    state parse_order_mass_action_request_message {
        packet.extract(hdr.order_mass_action_request_message);
        transition accept;
    }

    state parse_order_mass_action_report_message {
        packet.extract(hdr.order_mass_action_report_message);
        transition accept;
    }

}

control B3derivativesBinaryentrypointVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control B3derivativesBinaryentrypointIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control B3derivativesBinaryentrypointEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control B3derivativesBinaryentrypointComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control B3derivativesBinaryentrypointDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.negotiate_message);
        packet.emit(hdr.negotiate_response_message);
        packet.emit(hdr.negotiate_reject_message);
        packet.emit(hdr.establish_message);
        packet.emit(hdr.establish_ack_message);
        packet.emit(hdr.establish_reject_message);
        packet.emit(hdr.terminate_message);
        packet.emit(hdr.not_applied_message);
        packet.emit(hdr.sequence_message);
        packet.emit(hdr.retransmit_request_message);
        packet.emit(hdr.retransmission_message);
        packet.emit(hdr.retransmit_reject_message);
        packet.emit(hdr.simple_new_order_message);
        packet.emit(hdr.simple_modify_order_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.order_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.new_order_cross_message);
        packet.emit(hdr.execution_report_new_message);
        packet.emit(hdr.execution_report_modify_message);
        packet.emit(hdr.execution_report_cancel_message);
        packet.emit(hdr.execution_report_trade_message);
        packet.emit(hdr.execution_report_reject_message);
        packet.emit(hdr.execution_report_forward_message);
        packet.emit(hdr.business_message_reject_message);
        packet.emit(hdr.security_definition_request_message);
        packet.emit(hdr.security_definition_response_message);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.quote_status_report_message);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.quote_cancel_message);
        packet.emit(hdr.quote_request_reject_message);
        packet.emit(hdr.position_maintenance_cancel_request_message);
        packet.emit(hdr.position_maintenance_request_message);
        packet.emit(hdr.position_maintenance_report_message);
        packet.emit(hdr.allocation_instruction_message);
        packet.emit(hdr.allocation_report_message);
        packet.emit(hdr.order_mass_action_request_message);
        packet.emit(hdr.order_mass_action_report_message);
    }
}

V1Switch(
    B3derivativesBinaryentrypointParser(),
    B3derivativesBinaryentrypointVerifyChecksum(),
    B3derivativesBinaryentrypointIngress(),
    B3derivativesBinaryentrypointEgress(),
    B3derivativesBinaryentrypointComputeChecksum(),
    B3derivativesBinaryentrypointDeparser()
) main;
