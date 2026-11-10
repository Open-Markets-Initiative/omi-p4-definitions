// P4_16 (v1model) definition for: Neeq NeeqSecurities OrderEntry BjseBinary v1.1
// 
// Protocol:
//   Organization: National Equities Exchange and Quotations
//   Protocol: Neeq Order Entry
//   Encoding: Bjse Binary Market Data Feed
//   Version: 1.1
//   Date: 12/31/2025
//   Specification: 20251231194558_3eigny7no7.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
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
    bit<32> msg_type;
    bit<32> body_length;
}

header logon_message_t {
    bit<160> sender_comp_id;
    bit<160> target_comp_id;
    bit<32> heart_bt_int;
    bit<128> password;
    bit<256> default_appl_ver_id;
}

header logout_message_t {
    bit<32> session_status;
    bit<1600> text;
}

header business_reject_message_t {
    bit<24> appl_id;
    bit<64> transact_time;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<64> ref_seq_num;
    bit<32> ref_msg_type;
    bit<80> business_reject_ref_id;
    bit<16> business_reject_reason;
    bit<400> business_reject_text;
}

header report_synchronization_message_t {
    bit<32> no_partitions;
}

header report_synchronization_message_partition_reports_t {
    bit<32> partition_no;
    bit<64> report_index;
}

header platform_state_info_message_t {
    bit<16> platform_id;
    bit<16> platform_state;
}

header report_finished_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<16> platform_id;
}

header platform_info_message_t {
    bit<16> platform_id;
    bit<32> no_partitions;
}

header platform_info_message_partitions_t {
    bit<32> partition_no;
}

header trading_session_status_message_t {
    bit<64> market_id;
    bit<64> market_segment_id;
    bit<32> trading_session_id;
    bit<32> trading_session_sub_id;
    bit<16> trad_ses_status;
    bit<64> trad_ses_start_time;
    bit<64> trad_ses_end_time;
}

header bond_spot_matching_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<16> max_price_levels;
    bit<8> time_in_force;
    bit<8> cash_margin;
    bit<8> settl_type;
    bit<8> settl_period;
}

header centralized_auction_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<16> max_price_levels;
    bit<8> time_in_force;
    bit<8> cash_margin;
}

header conversion_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
}

header inquiry_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
}

header subscription_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
}

header put_back_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
}

header tender_offer_acceptance_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
}

header refinancing_securities_lending_non_agreed_new_order_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<16> expiration_days;
    bit<8> expiration_type;
    bit<16> share_property;
}

header order_cancel_request_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<128> order_id;
    bit<64> order_qty;
}

header cancel_reject_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<80> account_id;
    bit<16> branch_id;
    bit<8> ord_status;
    bit<16> cxl_rej_reason;
    bit<128> reject_text;
    bit<128> order_id;
}

header bond_spot_matching_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<16> max_price_levels;
    bit<8> time_in_force;
    bit<8> cash_margin;
}

header centralized_auction_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<64> stop_px;
    bit<64> min_qty;
    bit<16> max_price_levels;
    bit<8> time_in_force;
    bit<8> cash_margin;
}

header conversion_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
}

header inquiry_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
}

header subscription_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
}

header put_back_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
}

header tender_offer_acceptance_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
}

header refinancing_securities_lending_non_agreed_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<80> orig_cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<16> ord_rej_reason;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<8> ord_type;
    bit<64> order_qty;
    bit<64> price;
    bit<80> account_id;
    bit<16> branch_id;
    bit<32> order_restrictions;
    bit<16> expiration_days;
    bit<8> expiration_type;
    bit<16> share_property;
}

header bond_spot_matching_trade_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<80> account_id;
    bit<16> branch_id;
    bit<8> cash_margin;
    bit<8> settl_type;
    bit<8> settl_period;
}

header centralized_auction_trade_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<80> account_id;
    bit<16> branch_id;
    bit<8> cash_margin;
}

header refinancing_securities_lending_non_agreed_trade_execution_report_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> order_id;
    bit<80> cl_ord_id;
    bit<128> exec_id;
    bit<8> exec_type;
    bit<8> ord_status;
    bit<64> last_px;
    bit<64> last_qty;
    bit<64> leaves_qty;
    bit<64> cum_qty;
    bit<8> side;
    bit<80> account_id;
    bit<16> branch_id;
    bit<16> expiration_days;
    bit<8> expiration_type;
    bit<32> maturity_date;
    bit<16> share_property;
}

header bond_spot_negotiated_trade_capture_report_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<48> member_id;
    bit<40> trader_code;
    bit<48> counterparty_member_id;
    bit<40> counterparty_trader_code;
    bit<8> settl_type;
    bit<8> settl_period;
    bit<8> cash_margin;
    bit<960> memo;
}

header refinancing_securities_lending_agreed_trade_capture_report_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<16> expiration_days;
    bit<8> expiration_type;
    bit<16> share_property;
}

header mutual_trade_confirmation_trade_capture_report_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
}

header market_making_mutual_trade_confirmation_trade_capture_report_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
}

header after_hours_block_trade_trade_capture_report_message_t {
    bit<24> appl_id;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<8> cash_margin;
}

header bond_spot_negotiated_trade_capture_report_ack_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<8> trd_ack_status;
    bit<8> trd_rpt_status;
    bit<16> trade_report_reject_reason;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<48> member_id;
    bit<40> trader_code;
    bit<48> counterparty_member_id;
    bit<40> counterparty_trader_code;
    bit<8> settl_type;
    bit<8> settl_period;
    bit<8> cash_margin;
    bit<960> memo;
}

header refinancing_securities_lending_agreed_trade_capture_report_ack_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<8> trd_ack_status;
    bit<8> trd_rpt_status;
    bit<16> trade_report_reject_reason;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<16> expiration_days;
    bit<8> expiration_type;
    bit<16> share_property;
}

header mutual_trade_confirmation_trade_capture_report_ack_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<8> trd_ack_status;
    bit<8> trd_rpt_status;
    bit<16> trade_report_reject_reason;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
}

header market_making_mutual_trade_confirmation_trade_capture_report_ack_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<8> trd_ack_status;
    bit<8> trd_rpt_status;
    bit<16> trade_report_reject_reason;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
}

header after_hours_block_trade_trade_capture_report_ack_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<80> trade_report_ref_id;
    bit<8> trd_ack_status;
    bit<8> trd_rpt_status;
    bit<16> trade_report_reject_reason;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<8> cash_margin;
}

header bond_spot_negotiated_trade_capture_report_confirmation_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<48> member_id;
    bit<40> trader_code;
    bit<48> counterparty_member_id;
    bit<40> counterparty_trader_code;
    bit<8> settl_type;
    bit<8> settl_period;
    bit<8> cash_margin;
    bit<960> memo;
}

header refinancing_securities_lending_agreed_trade_capture_report_confirmation_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<16> expiration_days;
    bit<8> expiration_type;
    bit<32> maturity_date;
    bit<16> share_property;
}

header mutual_trade_confirmation_trade_capture_report_confirmation_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
}

header market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
}

header after_hours_block_trade_trade_capture_report_confirmation_message_t {
    bit<32> partition_no;
    bit<64> report_index;
    bit<24> appl_id;
    bit<48> reporting_pbuid;
    bit<48> submitting_pbuid;
    bit<64> security_id;
    bit<32> security_id_source;
    bit<16> owner_type;
    bit<16> clearing_firm;
    bit<64> transact_time;
    bit<256> user_info;
    bit<128> trade_id;
    bit<80> trade_report_id;
    bit<8> trade_report_type;
    bit<8> trade_report_trans_type;
    bit<8> trade_handling_instr;
    bit<64> last_px;
    bit<64> last_qty;
    bit<16> trd_type;
    bit<16> trd_sub_type;
    bit<32> confirm_id;
    bit<128> exec_id;
    bit<8> side;
    bit<48> pbuid;
    bit<80> account_id;
    bit<16> branch_id;
    bit<48> counterparty_pbuid;
    bit<80> counterparty_account_id;
    bit<16> counterparty_branch_id;
    bit<8> cash_margin;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> report_synchronization_message_partition_reports_remaining;
    bit<32> platform_info_message_partitions_remaining;
}

struct headers_t {
    message_header_t message_header;
    logon_message_t logon_message;
    logout_message_t logout_message;
    business_reject_message_t business_reject_message;
    report_synchronization_message_t report_synchronization_message;
    report_synchronization_message_partition_reports_t report_synchronization_message_partition_reports[MAX_MESSAGES];
    platform_state_info_message_t platform_state_info_message;
    report_finished_message_t report_finished_message;
    platform_info_message_t platform_info_message;
    platform_info_message_partitions_t platform_info_message_partitions[MAX_MESSAGES];
    trading_session_status_message_t trading_session_status_message;
    bond_spot_matching_new_order_message_t bond_spot_matching_new_order_message;
    centralized_auction_new_order_message_t centralized_auction_new_order_message;
    conversion_new_order_message_t conversion_new_order_message;
    inquiry_new_order_message_t inquiry_new_order_message;
    subscription_new_order_message_t subscription_new_order_message;
    put_back_new_order_message_t put_back_new_order_message;
    tender_offer_acceptance_new_order_message_t tender_offer_acceptance_new_order_message;
    refinancing_securities_lending_non_agreed_new_order_message_t refinancing_securities_lending_non_agreed_new_order_message;
    order_cancel_request_message_t order_cancel_request_message;
    cancel_reject_message_t cancel_reject_message;
    bond_spot_matching_execution_report_message_t bond_spot_matching_execution_report_message;
    centralized_auction_execution_report_message_t centralized_auction_execution_report_message;
    conversion_execution_report_message_t conversion_execution_report_message;
    inquiry_execution_report_message_t inquiry_execution_report_message;
    subscription_execution_report_message_t subscription_execution_report_message;
    put_back_execution_report_message_t put_back_execution_report_message;
    tender_offer_acceptance_execution_report_message_t tender_offer_acceptance_execution_report_message;
    refinancing_securities_lending_non_agreed_execution_report_message_t refinancing_securities_lending_non_agreed_execution_report_message;
    bond_spot_matching_trade_execution_report_message_t bond_spot_matching_trade_execution_report_message;
    centralized_auction_trade_execution_report_message_t centralized_auction_trade_execution_report_message;
    refinancing_securities_lending_non_agreed_trade_execution_report_message_t refinancing_securities_lending_non_agreed_trade_execution_report_message;
    bond_spot_negotiated_trade_capture_report_message_t bond_spot_negotiated_trade_capture_report_message;
    refinancing_securities_lending_agreed_trade_capture_report_message_t refinancing_securities_lending_agreed_trade_capture_report_message;
    mutual_trade_confirmation_trade_capture_report_message_t mutual_trade_confirmation_trade_capture_report_message;
    market_making_mutual_trade_confirmation_trade_capture_report_message_t market_making_mutual_trade_confirmation_trade_capture_report_message;
    after_hours_block_trade_trade_capture_report_message_t after_hours_block_trade_trade_capture_report_message;
    bond_spot_negotiated_trade_capture_report_ack_message_t bond_spot_negotiated_trade_capture_report_ack_message;
    refinancing_securities_lending_agreed_trade_capture_report_ack_message_t refinancing_securities_lending_agreed_trade_capture_report_ack_message;
    mutual_trade_confirmation_trade_capture_report_ack_message_t mutual_trade_confirmation_trade_capture_report_ack_message;
    market_making_mutual_trade_confirmation_trade_capture_report_ack_message_t market_making_mutual_trade_confirmation_trade_capture_report_ack_message;
    after_hours_block_trade_trade_capture_report_ack_message_t after_hours_block_trade_trade_capture_report_ack_message;
    bond_spot_negotiated_trade_capture_report_confirmation_message_t bond_spot_negotiated_trade_capture_report_confirmation_message;
    refinancing_securities_lending_agreed_trade_capture_report_confirmation_message_t refinancing_securities_lending_agreed_trade_capture_report_confirmation_message;
    mutual_trade_confirmation_trade_capture_report_confirmation_message_t mutual_trade_confirmation_trade_capture_report_confirmation_message;
    market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message_t market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message;
    after_hours_block_trade_trade_capture_report_confirmation_message_t after_hours_block_trade_trade_capture_report_confirmation_message;
}

parser NeeqsecuritiesOrderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            32w1: parse_logon_message;
            32w2: parse_logout_message;
            32w3: parse_heartbeat_message;
            32w4: parse_business_reject_message;
            32w5: parse_report_synchronization_message;
            32w6: parse_platform_state_info_message;
            32w7: parse_report_finished_message;
            32w9: parse_platform_info_message;
            32w10: parse_trading_session_status_message;
            32w101010: parse_bond_spot_matching_new_order_message;
            32w101040: parse_centralized_auction_new_order_message;
            32w101041: parse_conversion_new_order_message;
            32w101042: parse_inquiry_new_order_message;
            32w101043: parse_subscription_new_order_message;
            32w101044: parse_put_back_new_order_message;
            32w101045: parse_tender_offer_acceptance_new_order_message;
            32w101050: parse_refinancing_securities_lending_non_agreed_new_order_message;
            32w102000: parse_order_cancel_request_message;
            32w201000: parse_cancel_reject_message;
            32w202010: parse_bond_spot_matching_execution_report_message;
            32w202040: parse_centralized_auction_execution_report_message;
            32w202041: parse_conversion_execution_report_message;
            32w202042: parse_inquiry_execution_report_message;
            32w202043: parse_subscription_execution_report_message;
            32w202044: parse_put_back_execution_report_message;
            32w202045: parse_tender_offer_acceptance_execution_report_message;
            32w202050: parse_refinancing_securities_lending_non_agreed_execution_report_message;
            32w203010: parse_bond_spot_matching_trade_execution_report_message;
            32w203040: parse_centralized_auction_trade_execution_report_message;
            32w203050: parse_refinancing_securities_lending_non_agreed_trade_execution_report_message;
            32w103031: parse_bond_spot_negotiated_trade_capture_report_message;
            32w103051: parse_refinancing_securities_lending_agreed_trade_capture_report_message;
            32w103060: parse_mutual_trade_confirmation_trade_capture_report_message;
            32w103061: parse_market_making_mutual_trade_confirmation_trade_capture_report_message;
            32w103062: parse_after_hours_block_trade_trade_capture_report_message;
            32w204031: parse_bond_spot_negotiated_trade_capture_report_ack_message;
            32w204051: parse_refinancing_securities_lending_agreed_trade_capture_report_ack_message;
            32w204060: parse_mutual_trade_confirmation_trade_capture_report_ack_message;
            32w204061: parse_market_making_mutual_trade_confirmation_trade_capture_report_ack_message;
            32w204062: parse_after_hours_block_trade_trade_capture_report_ack_message;
            32w205031: parse_bond_spot_negotiated_trade_capture_report_confirmation_message;
            32w205051: parse_refinancing_securities_lending_agreed_trade_capture_report_confirmation_message;
            32w205060: parse_mutual_trade_confirmation_trade_capture_report_confirmation_message;
            32w205061: parse_market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message;
            32w205062: parse_after_hours_block_trade_trade_capture_report_confirmation_message;
            default: accept;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_business_reject_message {
        packet.extract(hdr.business_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_report_synchronization_message {
        packet.extract(hdr.report_synchronization_message);
        meta.dispatched = 1;
        meta.report_synchronization_message_partition_reports_remaining = hdr.report_synchronization_message.no_partitions;
        transition select(meta.report_synchronization_message_partition_reports_remaining) {
            32w0: accept;
            default: parse_report_synchronization_message_partition_reports;
        }
    }

    state parse_report_synchronization_message_partition_reports {
        packet.extract(hdr.report_synchronization_message_partition_reports.next);
        meta.report_synchronization_message_partition_reports_remaining = meta.report_synchronization_message_partition_reports_remaining - 1;
        transition select(meta.report_synchronization_message_partition_reports_remaining) {
            32w0: accept;
            default: parse_report_synchronization_message_partition_reports;
        }
    }

    state parse_platform_state_info_message {
        packet.extract(hdr.platform_state_info_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_report_finished_message {
        packet.extract(hdr.report_finished_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_platform_info_message {
        packet.extract(hdr.platform_info_message);
        meta.dispatched = 1;
        meta.platform_info_message_partitions_remaining = hdr.platform_info_message.no_partitions;
        transition select(meta.platform_info_message_partitions_remaining) {
            32w0: accept;
            default: parse_platform_info_message_partitions;
        }
    }

    state parse_platform_info_message_partitions {
        packet.extract(hdr.platform_info_message_partitions.next);
        meta.platform_info_message_partitions_remaining = meta.platform_info_message_partitions_remaining - 1;
        transition select(meta.platform_info_message_partitions_remaining) {
            32w0: accept;
            default: parse_platform_info_message_partitions;
        }
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_matching_new_order_message {
        packet.extract(hdr.bond_spot_matching_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_centralized_auction_new_order_message {
        packet.extract(hdr.centralized_auction_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_conversion_new_order_message {
        packet.extract(hdr.conversion_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquiry_new_order_message {
        packet.extract(hdr.inquiry_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscription_new_order_message {
        packet.extract(hdr.subscription_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_put_back_new_order_message {
        packet.extract(hdr.put_back_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tender_offer_acceptance_new_order_message {
        packet.extract(hdr.tender_offer_acceptance_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refinancing_securities_lending_non_agreed_new_order_message {
        packet.extract(hdr.refinancing_securities_lending_non_agreed_new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_reject_message {
        packet.extract(hdr.cancel_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_matching_execution_report_message {
        packet.extract(hdr.bond_spot_matching_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_centralized_auction_execution_report_message {
        packet.extract(hdr.centralized_auction_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_conversion_execution_report_message {
        packet.extract(hdr.conversion_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_inquiry_execution_report_message {
        packet.extract(hdr.inquiry_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscription_execution_report_message {
        packet.extract(hdr.subscription_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_put_back_execution_report_message {
        packet.extract(hdr.put_back_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tender_offer_acceptance_execution_report_message {
        packet.extract(hdr.tender_offer_acceptance_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refinancing_securities_lending_non_agreed_execution_report_message {
        packet.extract(hdr.refinancing_securities_lending_non_agreed_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_matching_trade_execution_report_message {
        packet.extract(hdr.bond_spot_matching_trade_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_centralized_auction_trade_execution_report_message {
        packet.extract(hdr.centralized_auction_trade_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refinancing_securities_lending_non_agreed_trade_execution_report_message {
        packet.extract(hdr.refinancing_securities_lending_non_agreed_trade_execution_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_negotiated_trade_capture_report_message {
        packet.extract(hdr.bond_spot_negotiated_trade_capture_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refinancing_securities_lending_agreed_trade_capture_report_message {
        packet.extract(hdr.refinancing_securities_lending_agreed_trade_capture_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mutual_trade_confirmation_trade_capture_report_message {
        packet.extract(hdr.mutual_trade_confirmation_trade_capture_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_making_mutual_trade_confirmation_trade_capture_report_message {
        packet.extract(hdr.market_making_mutual_trade_confirmation_trade_capture_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_after_hours_block_trade_trade_capture_report_message {
        packet.extract(hdr.after_hours_block_trade_trade_capture_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_negotiated_trade_capture_report_ack_message {
        packet.extract(hdr.bond_spot_negotiated_trade_capture_report_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refinancing_securities_lending_agreed_trade_capture_report_ack_message {
        packet.extract(hdr.refinancing_securities_lending_agreed_trade_capture_report_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mutual_trade_confirmation_trade_capture_report_ack_message {
        packet.extract(hdr.mutual_trade_confirmation_trade_capture_report_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_making_mutual_trade_confirmation_trade_capture_report_ack_message {
        packet.extract(hdr.market_making_mutual_trade_confirmation_trade_capture_report_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_after_hours_block_trade_trade_capture_report_ack_message {
        packet.extract(hdr.after_hours_block_trade_trade_capture_report_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_bond_spot_negotiated_trade_capture_report_confirmation_message {
        packet.extract(hdr.bond_spot_negotiated_trade_capture_report_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_refinancing_securities_lending_agreed_trade_capture_report_confirmation_message {
        packet.extract(hdr.refinancing_securities_lending_agreed_trade_capture_report_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mutual_trade_confirmation_trade_capture_report_confirmation_message {
        packet.extract(hdr.mutual_trade_confirmation_trade_capture_report_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message {
        packet.extract(hdr.market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_after_hours_block_trade_trade_capture_report_confirmation_message {
        packet.extract(hdr.after_hours_block_trade_trade_capture_report_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NeeqsecuritiesOrderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NeeqsecuritiesOrderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NeeqsecuritiesOrderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NeeqsecuritiesOrderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NeeqsecuritiesOrderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.business_reject_message);
        packet.emit(hdr.report_synchronization_message);
        packet.emit(hdr.report_synchronization_message_partition_reports);
        packet.emit(hdr.platform_state_info_message);
        packet.emit(hdr.report_finished_message);
        packet.emit(hdr.platform_info_message);
        packet.emit(hdr.platform_info_message_partitions);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.bond_spot_matching_new_order_message);
        packet.emit(hdr.centralized_auction_new_order_message);
        packet.emit(hdr.conversion_new_order_message);
        packet.emit(hdr.inquiry_new_order_message);
        packet.emit(hdr.subscription_new_order_message);
        packet.emit(hdr.put_back_new_order_message);
        packet.emit(hdr.tender_offer_acceptance_new_order_message);
        packet.emit(hdr.refinancing_securities_lending_non_agreed_new_order_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.cancel_reject_message);
        packet.emit(hdr.bond_spot_matching_execution_report_message);
        packet.emit(hdr.centralized_auction_execution_report_message);
        packet.emit(hdr.conversion_execution_report_message);
        packet.emit(hdr.inquiry_execution_report_message);
        packet.emit(hdr.subscription_execution_report_message);
        packet.emit(hdr.put_back_execution_report_message);
        packet.emit(hdr.tender_offer_acceptance_execution_report_message);
        packet.emit(hdr.refinancing_securities_lending_non_agreed_execution_report_message);
        packet.emit(hdr.bond_spot_matching_trade_execution_report_message);
        packet.emit(hdr.centralized_auction_trade_execution_report_message);
        packet.emit(hdr.refinancing_securities_lending_non_agreed_trade_execution_report_message);
        packet.emit(hdr.bond_spot_negotiated_trade_capture_report_message);
        packet.emit(hdr.refinancing_securities_lending_agreed_trade_capture_report_message);
        packet.emit(hdr.mutual_trade_confirmation_trade_capture_report_message);
        packet.emit(hdr.market_making_mutual_trade_confirmation_trade_capture_report_message);
        packet.emit(hdr.after_hours_block_trade_trade_capture_report_message);
        packet.emit(hdr.bond_spot_negotiated_trade_capture_report_ack_message);
        packet.emit(hdr.refinancing_securities_lending_agreed_trade_capture_report_ack_message);
        packet.emit(hdr.mutual_trade_confirmation_trade_capture_report_ack_message);
        packet.emit(hdr.market_making_mutual_trade_confirmation_trade_capture_report_ack_message);
        packet.emit(hdr.after_hours_block_trade_trade_capture_report_ack_message);
        packet.emit(hdr.bond_spot_negotiated_trade_capture_report_confirmation_message);
        packet.emit(hdr.refinancing_securities_lending_agreed_trade_capture_report_confirmation_message);
        packet.emit(hdr.mutual_trade_confirmation_trade_capture_report_confirmation_message);
        packet.emit(hdr.market_making_mutual_trade_confirmation_trade_capture_report_confirmation_message);
        packet.emit(hdr.after_hours_block_trade_trade_capture_report_confirmation_message);
    }
}

V1Switch(
    NeeqsecuritiesOrderentryParser(),
    NeeqsecuritiesOrderentryVerifyChecksum(),
    NeeqsecuritiesOrderentryIngress(),
    NeeqsecuritiesOrderentryEgress(),
    NeeqsecuritiesOrderentryComputeChecksum(),
    NeeqsecuritiesOrderentryDeparser()
) main;
