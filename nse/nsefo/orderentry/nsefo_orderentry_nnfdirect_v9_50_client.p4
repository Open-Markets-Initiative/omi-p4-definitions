// P4_16 (v1model) definition for: Nse NseFo OrderEntry NnfDirect v9.50
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End Direct Interface
//   Version: 9.50
//   Date: 7/27/2026
//   Specification: TP_FO_Trimmed_NNF_PROTOCOL_9.50_20260820170606.pdf
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

header message_header_t {
    bit<16> packet_length;
    bit<32> packet_sequence_number;
    bit<128> checksum;
    bit<16> transaction_code;
    bit<32> log_time;
    bit<16> alpha_char;
    bit<32> trader_id;
    bit<16> error_code;
    bit<64> header_timestamp;
    bit<64> time_stamp_1;
    bit<64> time_stamp_2;
    bit<16> message_length;
}

header sign_on_request_in_message_t {
    bit<32> user_id;
    bit<64> reserved_8;
    bit<64> password;
    bit<64> second_reserved_8;
    bit<64> new_password;
    bit<208> trader_name;
    bit<32> last_password_change_date;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<16> branch_id;
    bit<32> version_number;
    bit<32> batch_2_start_time;
    bit<8> host_switch_context;
    bit<400> colour;
    bit<8> second_reserved_1;
    bit<16> user_type;
    bit<64> sequence_number;
    bit<112> ws_class_name;
    bit<8> broker_status;
    bit<8> show_index;
    bit<1> normal_market;
    bit<1> oddlot_market;
    bit<1> spot_market;
    bit<1> auction_market;
    bit<11> reserved_212;
    bit<1> pre_open;
    bit<16> member_type;
    bit<8> clearing_status;
    bit<200> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header system_information_in_message_t {
    bit<32> last_update_portfolio_t_ime;
}

header gateway_router_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
}

header update_local_database_in_message_t {
    bit<32> last_update_security_time;
    bit<32> last_update_participant_time;
    bit<32> last_update_instrument_time;
    bit<32> last_update_index_time;
    bit<8> request_for_open_orders;
    bit<8> reserved_1;
    bit<16> market_status_normal;
    bit<16> market_status_oddlot;
    bit<16> market_status_spot;
    bit<16> market_status_auction;
    bit<16> ex_market_status_normal;
    bit<16> ex_market_status_oddlot;
    bit<16> ex_market_status_spot;
    bit<16> ex_market_status_auction;
    bit<16> pl_market_status_normal;
    bit<16> pl_market_status_oddlot;
    bit<16> pl_market_status_spot;
    bit<16> pl_market_status_auction;
}

header download_request_message_t {
    bit<64> sequence_number;
}

header order_entry_request_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> modified_cancelled_by;
    bit<8> second_reserved_1;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> counter_party_broker_id;
    bit<8> third_reserved_1;
    bit<16> reserved_2;
    bit<8> closeout_flag;
    bit<8> fourth_reserved_1;
    bit<16> order_type;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell_indicator;
    bit<32> disclosed_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> total_volume_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> minimum_fill_aon_volume;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> fifth_reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_modification_request_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> modified_cancelled_by;
    bit<8> second_reserved_1;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> counter_party_broker_id;
    bit<8> third_reserved_1;
    bit<16> reserved_2;
    bit<8> closeout_flag;
    bit<8> fourth_reserved_1;
    bit<16> order_type;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell_indicator;
    bit<32> disclosed_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> total_volume_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> minimum_fill_aon_volume;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> fifth_reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_cancellation_request_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> modified_cancelled_by;
    bit<8> second_reserved_1;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> counter_party_broker_id;
    bit<8> third_reserved_1;
    bit<16> reserved_2;
    bit<8> closeout_flag;
    bit<8> fourth_reserved_1;
    bit<16> order_type;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell_indicator;
    bit<32> disclosed_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> total_volume_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> minimum_fill_aon_volume;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> fifth_reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_confirmation_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> modified_cancelled_by;
    bit<8> second_reserved_1;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> counter_party_broker_id;
    bit<8> third_reserved_1;
    bit<16> reserved_2;
    bit<8> closeout_flag;
    bit<8> fourth_reserved_1;
    bit<16> order_type;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell_indicator;
    bit<32> disclosed_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> total_volume_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> minimum_fill_aon_volume;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> fifth_reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_modification_confirmation_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> modified_cancelled_by;
    bit<8> second_reserved_1;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> counter_party_broker_id;
    bit<8> third_reserved_1;
    bit<16> reserved_2;
    bit<8> closeout_flag;
    bit<8> fourth_reserved_1;
    bit<16> order_type;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell_indicator;
    bit<32> disclosed_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> total_volume_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> minimum_fill_aon_volume;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> fifth_reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_entry_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> modified_cancelled_by;
    bit<8> second_reserved_1;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> counter_party_broker_id;
    bit<8> third_reserved_1;
    bit<16> reserved_2;
    bit<8> closeout_flag;
    bit<8> fourth_reserved_1;
    bit<16> order_type;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell_indicator;
    bit<32> disclosed_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> total_volume_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> minimum_fill_aon_volume;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> fifth_reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header price_modification_message_t {
    bit<32> token_no;
    bit<32> trader_id;
    bit<64> order_number;
    bit<16> buy_sell;
    bit<32> price;
    bit<32> volume;
    bit<32> last_modified;
    bit<32> reference;
    bit<64> last_activity_reference;
    bit<192> reserved_24;
}

header trade_inquiry_message_t {
    bit<32> token_no;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<32> fill_number;
    bit<32> fill_quantity;
    bit<32> fill_price;
    bit<8> mkt_type;
    bit<8> buy_open_close;
    bit<32> reserved_4;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<8> requested_by;
    bit<8> sell_open_close;
    bit<80> buy_account_number;
    bit<80> sell_account_number;
    bit<192> reserved_24;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<80> buy_pan;
    bit<80> sell_pan;
    bit<480> reserved_60;
}

header spread_order_entry_message_t {
    bit<8> participant_type_1;
    bit<8> filler_1;
    bit<16> competitor_period_1;
    bit<16> solicitor_period_1;
    bit<8> mod_cxl_by_1;
    bit<8> filler_9;
    bit<16> reason_code_1;
    bit<16> start_alpha_1;
    bit<16> end_alpha_1;
    bit<32> token_1;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> op_broker_id_1;
    bit<8> fillerx_1;
    bit<24> filler_options_1;
    bit<8> fillery_1;
    bit<16> order_type_1;
    bit<64> order_number_1;
    bit<80> account_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> disclosed_vol_1;
    bit<32> disclosed_vol_remaining_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<32> volume_filled_today_1;
    bit<32> price_1;
    bit<32> trigger_price_1;
    bit<32> good_till_date_1;
    bit<32> entry_date_time_1;
    bit<32> min_fill_aon_1;
    bit<32> last_modified_1;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> reserved_1;
    bit<16> filler_116;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
    bit<32> price_diff;
}

header spread_order_entry_message_ms_spd_leg_info_t {
    bit<32> token_2;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<40> op_broker_id_2;
    bit<8> fillerx_2;
    bit<16> order_type_2;
    bit<16> buy_sell_2;
    bit<32> disclosed_vol_2;
    bit<32> disclosed_vol_remaining_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<32> volume_filled_today_2;
    bit<32> price_2;
    bit<32> trigger_price_2;
    bit<32> min_fill_aon_2;
    bit<1> ato;
    bit<1> market;
    bit<1> sl;
    bit<1> mit;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> order_pre_open;
    bit<2> reserved_12;
    bit<8> open_close_2;
    bit<3> reserved_68;
    bit<1> stpc;
    bit<2> reserved_34;
    bit<1> col;
    bit<1> boc;
    bit<8> reserved_1;
    bit<8> filler_y;
}

header secure_box_registration_request_in_message_t {
    bit<16> box_id;
}

header box_sign_on_request_in_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<40> reserved_5;
    bit<64> session_key;
}

header box_sign_off_message_t {
    bit<16> box_id;
}

header branch_order_value_limit_update_message_t {
    bit<40> broker_id;
    bit<200> reserved_25;
    bit<16> branch_id;
}

header branch_order_value_limit_update_message_branch_limits_t {
    bit<64> branch_buy_value_limit;
    bit<64> branch_sell_value_limit;
    bit<128> reserved_16;
}

header user_order_value_limit_update_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<16> branch_id;
    bit<208> reserved_26;
    bit<32> user_id;
    bit<16> reserved_2;
}

header user_order_value_limit_update_message_user_limits_t {
    bit<256> reserved_32;
    bit<64> user_order_buy_value_limit;
    bit<64> user_order_sell_value_limit;
    bit<128> reserved_16;
}

header normal_order_limit_update_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> user_id;
    bit<64> order_qty_limit;
    bit<64> order_val_limit;
}

header reset_user_password_message_t {
    bit<32> user_id;
    bit<112> reserved_14;
}

header collateral_user_status_change_request_message_t {
    bit<32> user_id;
    bit<8> col_user_bit;
    bit<56> reserved_7;
}

header user_trade_modify_cancel_status_change_request_message_t {
    bit<32> user_id;
    bit<8> trd_mod_cxl_bit;
    bit<56> reserved_7;
}

header user_address_unlock_request_message_t {
    bit<32> user_id;
    bit<560> reserved_70;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> spread_order_entry_message_ms_spd_leg_info_remaining;
    bit<16> branch_order_value_limit_update_message_branch_limits_remaining;
    bit<16> user_order_value_limit_update_message_user_limits_remaining;
}

struct headers_t {
    message_header_t message_header;
    sign_on_request_in_message_t sign_on_request_in_message;
    system_information_in_message_t system_information_in_message;
    gateway_router_request_message_t gateway_router_request_message;
    update_local_database_in_message_t update_local_database_in_message;
    download_request_message_t download_request_message;
    order_entry_request_message_t order_entry_request_message;
    order_modification_request_message_t order_modification_request_message;
    order_cancellation_request_message_t order_cancellation_request_message;
    order_confirmation_message_t order_confirmation_message;
    order_modification_confirmation_message_t order_modification_confirmation_message;
    order_entry_message_t order_entry_message;
    price_modification_message_t price_modification_message;
    trade_inquiry_message_t trade_inquiry_message;
    spread_order_entry_message_t spread_order_entry_message;
    spread_order_entry_message_ms_spd_leg_info_t spread_order_entry_message_ms_spd_leg_info[MAX_MESSAGES];
    secure_box_registration_request_in_message_t secure_box_registration_request_in_message;
    box_sign_on_request_in_message_t box_sign_on_request_in_message;
    box_sign_off_message_t box_sign_off_message;
    branch_order_value_limit_update_message_t branch_order_value_limit_update_message;
    branch_order_value_limit_update_message_branch_limits_t branch_order_value_limit_update_message_branch_limits[MAX_MESSAGES];
    user_order_value_limit_update_message_t user_order_value_limit_update_message;
    user_order_value_limit_update_message_user_limits_t user_order_value_limit_update_message_user_limits[MAX_MESSAGES];
    normal_order_limit_update_message_t normal_order_limit_update_message;
    reset_user_password_message_t reset_user_password_message;
    collateral_user_status_change_request_message_t collateral_user_status_change_request_message;
    user_trade_modify_cancel_status_change_request_message_t user_trade_modify_cancel_status_change_request_message;
    user_address_unlock_request_message_t user_address_unlock_request_message;
}

parser NsefoOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w2300: parse_sign_on_request_in_message;
            16w1600: parse_system_information_in_message;
            16w2400: parse_gateway_router_request_message;
            16w2320: parse_sign_off_request_in_message;
            16w7300: parse_update_local_database_in_message;
            16w7000: parse_download_request_message;
            16w2000: parse_order_entry_request_message;
            16w2040: parse_order_modification_request_message;
            16w2070: parse_order_cancellation_request_message;
            16w2073: parse_order_confirmation_message;
            16w2074: parse_order_modification_confirmation_message;
            16w2012: parse_order_entry_message;
            16w2042: parse_order_entry_message;
            16w2062: parse_order_entry_message;
            16w2072: parse_order_entry_message;
            16w2170: parse_order_entry_message;
            16w2231: parse_order_entry_message;
            16w9002: parse_order_entry_message;
            16w2013: parse_price_modification_message;
            16w20406: parse_price_modification_message;
            16w5445: parse_trade_inquiry_message;
            16w5440: parse_trade_inquiry_message;
            16w5441: parse_trade_inquiry_message;
            16w2223: parse_trade_inquiry_message;
            16w2100: parse_spread_order_entry_message;
            16w2102: parse_spread_order_entry_message;
            16w2104: parse_spread_order_entry_message;
            16w2106: parse_spread_order_entry_message;
            16w2118: parse_spread_order_entry_message;
            16w2124: parse_spread_order_entry_message;
            16w2125: parse_spread_order_entry_message;
            16w2126: parse_spread_order_entry_message;
            16w2127: parse_spread_order_entry_message;
            16w2130: parse_spread_order_entry_message;
            16w2131: parse_spread_order_entry_message;
            16w2132: parse_spread_order_entry_message;
            16w2133: parse_spread_order_entry_message;
            16w2136: parse_spread_order_entry_message;
            16w2154: parse_spread_order_entry_message;
            16w2155: parse_spread_order_entry_message;
            16w2156: parse_spread_order_entry_message;
            16w9004: parse_spread_order_entry_message;
            16w20408: parse_spread_order_entry_message;
            16w20410: parse_spread_order_entry_message;
            16w20412: parse_spread_order_entry_message;
            16w20414: parse_spread_order_entry_message;
            16w20416: parse_spread_order_entry_message;
            16w23008: parse_secure_box_registration_request_in_message;
            16w23000: parse_box_sign_on_request_in_message;
            16w23506: parse_heartbeat_message;
            16w20322: parse_box_sign_off_message;
            16w5716: parse_branch_order_value_limit_update_message;
            16w5730: parse_user_order_value_limit_update_message;
            16w5732: parse_normal_order_limit_update_message;
            16w5740: parse_reset_user_password_message;
            16w5744: parse_collateral_user_status_change_request_message;
            16w5738: parse_user_trade_modify_cancel_status_change_request_message;
            16w5427: parse_user_address_unlock_request_message;
            default: accept;
        }
    }

    state parse_sign_on_request_in_message {
        packet.extract(hdr.sign_on_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_information_in_message {
        packet.extract(hdr.system_information_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_router_request_message {
        packet.extract(hdr.gateway_router_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sign_off_request_in_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_in_message {
        packet.extract(hdr.update_local_database_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_download_request_message {
        packet.extract(hdr.download_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_entry_request_message {
        packet.extract(hdr.order_entry_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_request_message {
        packet.extract(hdr.order_modification_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_request_message {
        packet.extract(hdr.order_cancellation_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_confirmation_message {
        packet.extract(hdr.order_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_confirmation_message {
        packet.extract(hdr.order_modification_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_entry_message {
        packet.extract(hdr.order_entry_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_modification_message {
        packet.extract(hdr.price_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_inquiry_message {
        packet.extract(hdr.trade_inquiry_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_order_entry_message {
        packet.extract(hdr.spread_order_entry_message);
        meta.dispatched = 1;
        meta.spread_order_entry_message_ms_spd_leg_info_remaining = 16w2;
        transition parse_spread_order_entry_message_ms_spd_leg_info;
    }

    state parse_spread_order_entry_message_ms_spd_leg_info {
        packet.extract(hdr.spread_order_entry_message_ms_spd_leg_info.next);
        meta.spread_order_entry_message_ms_spd_leg_info_remaining = meta.spread_order_entry_message_ms_spd_leg_info_remaining - 1;
        transition select(meta.spread_order_entry_message_ms_spd_leg_info_remaining) {
            16w0: accept;
            default: parse_spread_order_entry_message_ms_spd_leg_info;
        }
    }

    state parse_secure_box_registration_request_in_message {
        packet.extract(hdr.secure_box_registration_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_on_request_in_message {
        packet.extract(hdr.box_sign_on_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_off_message {
        packet.extract(hdr.box_sign_off_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_branch_order_value_limit_update_message {
        packet.extract(hdr.branch_order_value_limit_update_message);
        meta.dispatched = 1;
        meta.branch_order_value_limit_update_message_branch_limits_remaining = 16w2;
        transition parse_branch_order_value_limit_update_message_branch_limits;
    }

    state parse_branch_order_value_limit_update_message_branch_limits {
        packet.extract(hdr.branch_order_value_limit_update_message_branch_limits.next);
        meta.branch_order_value_limit_update_message_branch_limits_remaining = meta.branch_order_value_limit_update_message_branch_limits_remaining - 1;
        transition select(meta.branch_order_value_limit_update_message_branch_limits_remaining) {
            16w0: accept;
            default: parse_branch_order_value_limit_update_message_branch_limits;
        }
    }

    state parse_user_order_value_limit_update_message {
        packet.extract(hdr.user_order_value_limit_update_message);
        meta.dispatched = 1;
        meta.user_order_value_limit_update_message_user_limits_remaining = 16w2;
        transition parse_user_order_value_limit_update_message_user_limits;
    }

    state parse_user_order_value_limit_update_message_user_limits {
        packet.extract(hdr.user_order_value_limit_update_message_user_limits.next);
        meta.user_order_value_limit_update_message_user_limits_remaining = meta.user_order_value_limit_update_message_user_limits_remaining - 1;
        transition select(meta.user_order_value_limit_update_message_user_limits_remaining) {
            16w0: accept;
            default: parse_user_order_value_limit_update_message_user_limits;
        }
    }

    state parse_normal_order_limit_update_message {
        packet.extract(hdr.normal_order_limit_update_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reset_user_password_message {
        packet.extract(hdr.reset_user_password_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_collateral_user_status_change_request_message {
        packet.extract(hdr.collateral_user_status_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_trade_modify_cancel_status_change_request_message {
        packet.extract(hdr.user_trade_modify_cancel_status_change_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_address_unlock_request_message {
        packet.extract(hdr.user_address_unlock_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsefoOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsefoOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsefoOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.sign_on_request_in_message);
        packet.emit(hdr.system_information_in_message);
        packet.emit(hdr.gateway_router_request_message);
        packet.emit(hdr.update_local_database_in_message);
        packet.emit(hdr.download_request_message);
        packet.emit(hdr.order_entry_request_message);
        packet.emit(hdr.order_modification_request_message);
        packet.emit(hdr.order_cancellation_request_message);
        packet.emit(hdr.order_confirmation_message);
        packet.emit(hdr.order_modification_confirmation_message);
        packet.emit(hdr.order_entry_message);
        packet.emit(hdr.price_modification_message);
        packet.emit(hdr.trade_inquiry_message);
        packet.emit(hdr.spread_order_entry_message);
        packet.emit(hdr.spread_order_entry_message_ms_spd_leg_info);
        packet.emit(hdr.secure_box_registration_request_in_message);
        packet.emit(hdr.box_sign_on_request_in_message);
        packet.emit(hdr.box_sign_off_message);
        packet.emit(hdr.branch_order_value_limit_update_message);
        packet.emit(hdr.branch_order_value_limit_update_message_branch_limits);
        packet.emit(hdr.user_order_value_limit_update_message);
        packet.emit(hdr.user_order_value_limit_update_message_user_limits);
        packet.emit(hdr.normal_order_limit_update_message);
        packet.emit(hdr.reset_user_password_message);
        packet.emit(hdr.collateral_user_status_change_request_message);
        packet.emit(hdr.user_trade_modify_cancel_status_change_request_message);
        packet.emit(hdr.user_address_unlock_request_message);
    }
}

V1Switch(
    NsefoOrderentryClientParser(),
    NsefoOrderentryClientVerifyChecksum(),
    NsefoOrderentryClientIngress(),
    NsefoOrderentryClientEgress(),
    NsefoOrderentryClientComputeChecksum(),
    NsefoOrderentryClientDeparser()
) main;
