// P4_16 (v1model) definition for: Nse NseCom OrderEntry Nnf v3.5
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End
//   Version: 3.5
//   Date: 12/29/2025
//   Specification: TP_COM_Trimmed_NNF_Protocol_3_5_20251229105314.pdf
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

header system_information_in_message_t {
    bit<32> last_update_portfolio_time;
}

header board_lot_in_message_t {
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
    bit<16> book_type_short_2;
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
    bit<3> reserved_13;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag;
    bit<32> reference;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_mod_in_message_t {
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
    bit<16> book_type_short_2;
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
    bit<3> reserved_13;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag;
    bit<32> reference;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_cancel_in_message_t {
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
    bit<16> book_type_short_2;
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
    bit<3> reserved_13;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag;
    bit<32> reference;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header price_mod_in_message_t {
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

header sp_board_lot_in_message_t {
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
    bit<3> reserved_13;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag_1;
    bit<16> reserved_2;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
    bit<32> price_diff;
    bit<32> token_2;
    bit<48> instrument_name_2;
    bit<80> symbol_2;
    bit<32> expiry_date_2;
    bit<32> strike_price_2;
    bit<16> option_type_2;
    bit<16> ca_level_2;
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
    bit<1> ato_2;
    bit<1> market_2;
    bit<1> sl_2;
    bit<1> mit_2;
    bit<1> day_2;
    bit<1> gtc_2;
    bit<1> ioc_2;
    bit<1> aon_2;
    bit<1> mf_2;
    bit<1> matched_ind_2;
    bit<1> traded_2;
    bit<1> modified_2;
    bit<1> frozen_2;
    bit<3> reserved_13_2;
    bit<8> open_close_2;
    bit<3> additional_order_flags_reserved_68_2;
    bit<1> stpc_2;
    bit<1> additional_order_flags_reserved_4_2;
    bit<1> additional_order_flags_reserved_3_2;
    bit<1> col_2;
    bit<1> boc_2;
    bit<8> giveup_flag_2;
    bit<8> filler_y;
    bit<32> token_2_2;
    bit<48> instrument_name_3;
    bit<80> symbol_3;
    bit<32> expiry_date_3;
    bit<32> strike_price_3;
    bit<16> option_type_3;
    bit<16> ca_level_3;
    bit<40> op_broker_id_2_2;
    bit<8> fillerx_2_2;
    bit<16> order_type_2_2;
    bit<16> buy_sell_2_2;
    bit<32> disclosed_vol_2_2;
    bit<32> disclosed_vol_remaining_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<32> volume_filled_today_2_2;
    bit<32> price_2_2;
    bit<32> trigger_price_2_2;
    bit<32> min_fill_aon_2_2;
    bit<1> ato_3;
    bit<1> market_3;
    bit<1> sl_3;
    bit<1> mit_3;
    bit<1> day_3;
    bit<1> gtc_3;
    bit<1> ioc_3;
    bit<1> aon_3;
    bit<1> mf_3;
    bit<1> matched_ind_3;
    bit<1> traded_3;
    bit<1> modified_3;
    bit<1> frozen_3;
    bit<3> reserved_13_3;
    bit<8> open_close_2_2;
    bit<3> additional_order_flags_reserved_68_3;
    bit<1> stpc_3;
    bit<1> additional_order_flags_reserved_4_3;
    bit<1> additional_order_flags_reserved_3_3;
    bit<1> col_3;
    bit<1> boc_3;
    bit<8> giveup_flag_2_2;
    bit<8> filler_y_2;
}

header twol_board_lot_in_message_t {
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
    bit<3> reserved_13;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag_1;
    bit<16> reserved_2;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
    bit<32> price_diff;
    bit<32> token_2;
    bit<48> instrument_name_2;
    bit<80> symbol_2;
    bit<32> expiry_date_2;
    bit<32> strike_price_2;
    bit<16> option_type_2;
    bit<16> ca_level_2;
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
    bit<1> ato_2;
    bit<1> market_2;
    bit<1> sl_2;
    bit<1> mit_2;
    bit<1> day_2;
    bit<1> gtc_2;
    bit<1> ioc_2;
    bit<1> aon_2;
    bit<1> mf_2;
    bit<1> matched_ind_2;
    bit<1> traded_2;
    bit<1> modified_2;
    bit<1> frozen_2;
    bit<3> reserved_13_2;
    bit<8> open_close_2;
    bit<3> additional_order_flags_reserved_68_2;
    bit<1> stpc_2;
    bit<1> additional_order_flags_reserved_4_2;
    bit<1> additional_order_flags_reserved_3_2;
    bit<1> col_2;
    bit<1> boc_2;
    bit<8> giveup_flag_2;
    bit<8> filler_y;
    bit<32> token_2_2;
    bit<48> instrument_name_3;
    bit<80> symbol_3;
    bit<32> expiry_date_3;
    bit<32> strike_price_3;
    bit<16> option_type_3;
    bit<16> ca_level_3;
    bit<40> op_broker_id_2_2;
    bit<8> fillerx_2_2;
    bit<16> order_type_2_2;
    bit<16> buy_sell_2_2;
    bit<32> disclosed_vol_2_2;
    bit<32> disclosed_vol_remaining_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<32> volume_filled_today_2_2;
    bit<32> price_2_2;
    bit<32> trigger_price_2_2;
    bit<32> min_fill_aon_2_2;
    bit<1> ato_3;
    bit<1> market_3;
    bit<1> sl_3;
    bit<1> mit_3;
    bit<1> day_3;
    bit<1> gtc_3;
    bit<1> ioc_3;
    bit<1> aon_3;
    bit<1> mf_3;
    bit<1> matched_ind_3;
    bit<1> traded_3;
    bit<1> modified_3;
    bit<1> frozen_3;
    bit<3> reserved_13_3;
    bit<8> open_close_2_2;
    bit<3> additional_order_flags_reserved_68_3;
    bit<1> stpc_3;
    bit<1> additional_order_flags_reserved_4_3;
    bit<1> additional_order_flags_reserved_3_3;
    bit<1> col_3;
    bit<1> boc_3;
    bit<8> giveup_flag_2_2;
    bit<8> filler_y_2;
}

header thrl_board_lot_in_message_t {
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
    bit<3> reserved_13;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag_1;
    bit<16> reserved_2;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
    bit<32> price_diff;
    bit<32> token_2;
    bit<48> instrument_name_2;
    bit<80> symbol_2;
    bit<32> expiry_date_2;
    bit<32> strike_price_2;
    bit<16> option_type_2;
    bit<16> ca_level_2;
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
    bit<1> ato_2;
    bit<1> market_2;
    bit<1> sl_2;
    bit<1> mit_2;
    bit<1> day_2;
    bit<1> gtc_2;
    bit<1> ioc_2;
    bit<1> aon_2;
    bit<1> mf_2;
    bit<1> matched_ind_2;
    bit<1> traded_2;
    bit<1> modified_2;
    bit<1> frozen_2;
    bit<3> reserved_13_2;
    bit<8> open_close_2;
    bit<3> additional_order_flags_reserved_68_2;
    bit<1> stpc_2;
    bit<1> additional_order_flags_reserved_4_2;
    bit<1> additional_order_flags_reserved_3_2;
    bit<1> col_2;
    bit<1> boc_2;
    bit<8> giveup_flag_2;
    bit<8> filler_y;
    bit<32> token_2_2;
    bit<48> instrument_name_3;
    bit<80> symbol_3;
    bit<32> expiry_date_3;
    bit<32> strike_price_3;
    bit<16> option_type_3;
    bit<16> ca_level_3;
    bit<40> op_broker_id_2_2;
    bit<8> fillerx_2_2;
    bit<16> order_type_2_2;
    bit<16> buy_sell_2_2;
    bit<32> disclosed_vol_2_2;
    bit<32> disclosed_vol_remaining_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<32> volume_filled_today_2_2;
    bit<32> price_2_2;
    bit<32> trigger_price_2_2;
    bit<32> min_fill_aon_2_2;
    bit<1> ato_3;
    bit<1> market_3;
    bit<1> sl_3;
    bit<1> mit_3;
    bit<1> day_3;
    bit<1> gtc_3;
    bit<1> ioc_3;
    bit<1> aon_3;
    bit<1> mf_3;
    bit<1> matched_ind_3;
    bit<1> traded_3;
    bit<1> modified_3;
    bit<1> frozen_3;
    bit<3> reserved_13_3;
    bit<8> open_close_2_2;
    bit<3> additional_order_flags_reserved_68_3;
    bit<1> stpc_3;
    bit<1> additional_order_flags_reserved_4_3;
    bit<1> additional_order_flags_reserved_3_3;
    bit<1> col_3;
    bit<1> boc_3;
    bit<8> giveup_flag_2_2;
    bit<8> filler_y_2;
}

header sp_order_cancel_in_message_t {
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
    bit<3> reserved_13;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag_1;
    bit<16> reserved_2;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
    bit<32> price_diff;
    bit<32> token_2;
    bit<48> instrument_name_2;
    bit<80> symbol_2;
    bit<32> expiry_date_2;
    bit<32> strike_price_2;
    bit<16> option_type_2;
    bit<16> ca_level_2;
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
    bit<1> ato_2;
    bit<1> market_2;
    bit<1> sl_2;
    bit<1> mit_2;
    bit<1> day_2;
    bit<1> gtc_2;
    bit<1> ioc_2;
    bit<1> aon_2;
    bit<1> mf_2;
    bit<1> matched_ind_2;
    bit<1> traded_2;
    bit<1> modified_2;
    bit<1> frozen_2;
    bit<3> reserved_13_2;
    bit<8> open_close_2;
    bit<3> additional_order_flags_reserved_68_2;
    bit<1> stpc_2;
    bit<1> additional_order_flags_reserved_4_2;
    bit<1> additional_order_flags_reserved_3_2;
    bit<1> col_2;
    bit<1> boc_2;
    bit<8> giveup_flag_2;
    bit<8> filler_y;
    bit<32> token_2_2;
    bit<48> instrument_name_3;
    bit<80> symbol_3;
    bit<32> expiry_date_3;
    bit<32> strike_price_3;
    bit<16> option_type_3;
    bit<16> ca_level_3;
    bit<40> op_broker_id_2_2;
    bit<8> fillerx_2_2;
    bit<16> order_type_2_2;
    bit<16> buy_sell_2_2;
    bit<32> disclosed_vol_2_2;
    bit<32> disclosed_vol_remaining_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<32> volume_filled_today_2_2;
    bit<32> price_2_2;
    bit<32> trigger_price_2_2;
    bit<32> min_fill_aon_2_2;
    bit<1> ato_3;
    bit<1> market_3;
    bit<1> sl_3;
    bit<1> mit_3;
    bit<1> day_3;
    bit<1> gtc_3;
    bit<1> ioc_3;
    bit<1> aon_3;
    bit<1> mf_3;
    bit<1> matched_ind_3;
    bit<1> traded_3;
    bit<1> modified_3;
    bit<1> frozen_3;
    bit<3> reserved_13_3;
    bit<8> open_close_2_2;
    bit<3> additional_order_flags_reserved_68_3;
    bit<1> stpc_3;
    bit<1> additional_order_flags_reserved_4_3;
    bit<1> additional_order_flags_reserved_3_3;
    bit<1> col_3;
    bit<1> boc_3;
    bit<8> giveup_flag_2_2;
    bit<8> filler_y_2;
}

header sp_order_mod_in_message_t {
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
    bit<3> reserved_13;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<3> additional_order_flags_reserved_68;
    bit<1> stpc;
    bit<1> additional_order_flags_reserved_4;
    bit<1> additional_order_flags_reserved_3;
    bit<1> col;
    bit<1> boc;
    bit<8> giveup_flag_1;
    bit<16> reserved_2;
    bit<8> filler_17;
    bit<8> filler_18;
    bit<64> nnf_field;
    bit<64> mkt_replay;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> second_reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
    bit<32> price_diff;
    bit<32> token_2;
    bit<48> instrument_name_2;
    bit<80> symbol_2;
    bit<32> expiry_date_2;
    bit<32> strike_price_2;
    bit<16> option_type_2;
    bit<16> ca_level_2;
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
    bit<1> ato_2;
    bit<1> market_2;
    bit<1> sl_2;
    bit<1> mit_2;
    bit<1> day_2;
    bit<1> gtc_2;
    bit<1> ioc_2;
    bit<1> aon_2;
    bit<1> mf_2;
    bit<1> matched_ind_2;
    bit<1> traded_2;
    bit<1> modified_2;
    bit<1> frozen_2;
    bit<3> reserved_13_2;
    bit<8> open_close_2;
    bit<3> additional_order_flags_reserved_68_2;
    bit<1> stpc_2;
    bit<1> additional_order_flags_reserved_4_2;
    bit<1> additional_order_flags_reserved_3_2;
    bit<1> col_2;
    bit<1> boc_2;
    bit<8> giveup_flag_2;
    bit<8> filler_y;
    bit<32> token_2_2;
    bit<48> instrument_name_3;
    bit<80> symbol_3;
    bit<32> expiry_date_3;
    bit<32> strike_price_3;
    bit<16> option_type_3;
    bit<16> ca_level_3;
    bit<40> op_broker_id_2_2;
    bit<8> fillerx_2_2;
    bit<16> order_type_2_2;
    bit<16> buy_sell_2_2;
    bit<32> disclosed_vol_2_2;
    bit<32> disclosed_vol_remaining_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<32> volume_filled_today_2_2;
    bit<32> price_2_2;
    bit<32> trigger_price_2_2;
    bit<32> min_fill_aon_2_2;
    bit<1> ato_3;
    bit<1> market_3;
    bit<1> sl_3;
    bit<1> mit_3;
    bit<1> day_3;
    bit<1> gtc_3;
    bit<1> ioc_3;
    bit<1> aon_3;
    bit<1> mf_3;
    bit<1> matched_ind_3;
    bit<1> traded_3;
    bit<1> modified_3;
    bit<1> frozen_3;
    bit<3> reserved_13_3;
    bit<8> open_close_2_2;
    bit<3> additional_order_flags_reserved_68_3;
    bit<1> stpc_3;
    bit<1> additional_order_flags_reserved_4_3;
    bit<1> additional_order_flags_reserved_3_3;
    bit<1> col_3;
    bit<1> boc_3;
    bit<8> giveup_flag_2_2;
    bit<8> filler_y_2;
}

header trade_cancel_in_message_t {
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
    bit<32> new_volume;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<8> requested_by;
    bit<8> sell_open_close;
    bit<80> buy_account_number;
    bit<80> sell_account_number;
    bit<96> buy_participant;
    bit<96> sell_participant;
    bit<16> reserved_2;
    bit<8> buy_giveup_flag;
    bit<8> sell_giveup_flag;
    bit<80> buy_pan;
    bit<80> sell_pan;
    bit<480> reserved_60;
}

header trade_mod_in_message_t {
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
    bit<32> new_volume;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<8> requested_by;
    bit<8> sell_open_close;
    bit<80> buy_account_number;
    bit<80> sell_account_number;
    bit<96> buy_participant;
    bit<96> sell_participant;
    bit<16> reserved_2;
    bit<8> buy_giveup_flag;
    bit<8> sell_giveup_flag;
    bit<80> buy_pan;
    bit<80> sell_pan;
    bit<480> reserved_60;
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
    bit<1> auction_market;
    bit<1> spot_market;
    bit<1> oddlot_market;
    bit<12> reserved_112;
    bit<16> member_type;
    bit<8> clearing_status;
    bit<200> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header sign_off_trader_in_message_t {
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
    bit<1> auction_market;
    bit<1> spot_market;
    bit<1> oddlot_market;
    bit<12> reserved_112;
    bit<16> member_type;
    bit<8> clearing_status;
    bit<200> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header gr_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
}

header user_addr_unlock_in_message_t {
    bit<32> user_id;
    bit<560> reserved_70;
}

header branch_ord_val_limit_update_in_message_t {
    bit<40> broker_id;
    bit<200> reserved_25;
    bit<16> branch_id;
    bit<64> branch_buy_value_limit;
    bit<64> branch_sell_value_limit;
    bit<128> reserved_16;
    bit<64> branch_buy_value_limit_2;
    bit<64> branch_sell_value_limit_2;
    bit<128> reserved_16_2;
}

header user_ord_val_limit_update_in_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<16> branch_id;
    bit<208> reserved_26;
    bit<32> user_id;
    bit<16> reserved_2;
    bit<256> reserved_32;
    bit<64> user_order_buy_value_limit;
    bit<64> user_order_sell_value_limit;
    bit<128> reserved_16;
    bit<256> reserved_32_2;
    bit<64> user_order_buy_value_limit_2;
    bit<64> user_order_sell_value_limit_2;
    bit<128> reserved_16_2;
}

header normal_ord_limit_update_in_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> user_id;
    bit<64> order_qty_limit;
    bit<64> order_val_limit;
}

header spread_ord_limit_update_in_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> user_id;
    bit<64> order_qty_limit;
    bit<64> order_val_limit;
}

header reset_user_password_in_message_t {
    bit<32> user_id;
    bit<112> reserved_14;
}

header col_user_status_change_in_message_t {
    bit<32> user_id;
    bit<8> col_user_bit;
    bit<56> reserved_7;
}

header download_request_message_t {
    bit<64> sequence_number;
}

header update_localdb_in_message_t {
    bit<32> last_update_security_time;
    bit<32> last_update_participant_time;
    bit<32> last_update_instrument_time;
    bit<32> last_update_index_time;
    bit<8> request_for_open_orders;
    bit<8> c_filler;
    bit<16> normal;
    bit<16> oddlot;
    bit<16> spot;
    bit<16> auction;
    bit<16> normal_2;
    bit<16> oddlot_2;
    bit<16> spot_2;
    bit<16> auction_2;
    bit<16> normal_3;
    bit<16> oddlot_3;
    bit<16> spot_3;
    bit<16> auction_3;
}

header box_sign_on_request_in_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<40> reserved_5;
    bit<64> session_key;
}

header secure_box_registration_request_in_message_t {
    bit<16> box_id;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    system_information_in_message_t system_information_in_message;
    board_lot_in_message_t board_lot_in_message;
    order_mod_in_message_t order_mod_in_message;
    order_cancel_in_message_t order_cancel_in_message;
    price_mod_in_message_t price_mod_in_message;
    sp_board_lot_in_message_t sp_board_lot_in_message;
    twol_board_lot_in_message_t twol_board_lot_in_message;
    thrl_board_lot_in_message_t thrl_board_lot_in_message;
    sp_order_cancel_in_message_t sp_order_cancel_in_message;
    sp_order_mod_in_message_t sp_order_mod_in_message;
    trade_cancel_in_message_t trade_cancel_in_message;
    trade_mod_in_message_t trade_mod_in_message;
    sign_on_request_in_message_t sign_on_request_in_message;
    sign_off_trader_in_message_t sign_off_trader_in_message;
    gr_request_message_t gr_request_message;
    user_addr_unlock_in_message_t user_addr_unlock_in_message;
    branch_ord_val_limit_update_in_message_t branch_ord_val_limit_update_in_message;
    user_ord_val_limit_update_in_message_t user_ord_val_limit_update_in_message;
    normal_ord_limit_update_in_message_t normal_ord_limit_update_in_message;
    spread_ord_limit_update_in_message_t spread_ord_limit_update_in_message;
    reset_user_password_in_message_t reset_user_password_in_message;
    col_user_status_change_in_message_t col_user_status_change_in_message;
    download_request_message_t download_request_message;
    update_localdb_in_message_t update_localdb_in_message;
    box_sign_on_request_in_message_t box_sign_on_request_in_message;
    secure_box_registration_request_in_message_t secure_box_registration_request_in_message;
}

parser NsecomOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w1600: parse_system_information_in_message;
            16w2000: parse_board_lot_in_message;
            16w2040: parse_order_mod_in_message;
            16w2070: parse_order_cancel_in_message;
            16w2013: parse_price_mod_in_message;
            16w2100: parse_sp_board_lot_in_message;
            16w2102: parse_twol_board_lot_in_message;
            16w2104: parse_thrl_board_lot_in_message;
            16w2106: parse_sp_order_cancel_in_message;
            16w2118: parse_sp_order_mod_in_message;
            16w5440: parse_trade_cancel_in_message;
            16w5445: parse_trade_mod_in_message;
            16w2300: parse_sign_on_request_in_message;
            16w5584: parse_sign_off_trader_in_message;
            16w2400: parse_gr_request_message;
            16w5427: parse_user_addr_unlock_in_message;
            16w5716: parse_branch_ord_val_limit_update_in_message;
            16w5730: parse_user_ord_val_limit_update_in_message;
            16w5732: parse_normal_ord_limit_update_in_message;
            16w5771: parse_spread_ord_limit_update_in_message;
            16w5740: parse_reset_user_password_in_message;
            16w5744: parse_col_user_status_change_in_message;
            16w7000: parse_download_request_message;
            16w7300: parse_update_localdb_in_message;
            16w23000: parse_box_sign_on_request_in_message;
            16w23008: parse_secure_box_registration_request_in_message;
            default: accept;
        }
    }

    state parse_system_information_in_message {
        packet.extract(hdr.system_information_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_board_lot_in_message {
        packet.extract(hdr.board_lot_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mod_in_message {
        packet.extract(hdr.order_mod_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_in_message {
        packet.extract(hdr.order_cancel_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_mod_in_message {
        packet.extract(hdr.price_mod_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_board_lot_in_message {
        packet.extract(hdr.sp_board_lot_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_twol_board_lot_in_message {
        packet.extract(hdr.twol_board_lot_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_thrl_board_lot_in_message {
        packet.extract(hdr.thrl_board_lot_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_cancel_in_message {
        packet.extract(hdr.sp_order_cancel_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_mod_in_message {
        packet.extract(hdr.sp_order_mod_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancel_in_message {
        packet.extract(hdr.trade_cancel_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_mod_in_message {
        packet.extract(hdr.trade_mod_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sign_on_request_in_message {
        packet.extract(hdr.sign_on_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sign_off_trader_in_message {
        packet.extract(hdr.sign_off_trader_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gr_request_message {
        packet.extract(hdr.gr_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_addr_unlock_in_message {
        packet.extract(hdr.user_addr_unlock_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_branch_ord_val_limit_update_in_message {
        packet.extract(hdr.branch_ord_val_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_ord_val_limit_update_in_message {
        packet.extract(hdr.user_ord_val_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_normal_ord_limit_update_in_message {
        packet.extract(hdr.normal_ord_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_ord_limit_update_in_message {
        packet.extract(hdr.spread_ord_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_reset_user_password_in_message {
        packet.extract(hdr.reset_user_password_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_col_user_status_change_in_message {
        packet.extract(hdr.col_user_status_change_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_download_request_message {
        packet.extract(hdr.download_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_localdb_in_message {
        packet.extract(hdr.update_localdb_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_on_request_in_message {
        packet.extract(hdr.box_sign_on_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secure_box_registration_request_in_message {
        packet.extract(hdr.secure_box_registration_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecomOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecomOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecomOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecomOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecomOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.system_information_in_message);
        packet.emit(hdr.board_lot_in_message);
        packet.emit(hdr.order_mod_in_message);
        packet.emit(hdr.order_cancel_in_message);
        packet.emit(hdr.price_mod_in_message);
        packet.emit(hdr.sp_board_lot_in_message);
        packet.emit(hdr.twol_board_lot_in_message);
        packet.emit(hdr.thrl_board_lot_in_message);
        packet.emit(hdr.sp_order_cancel_in_message);
        packet.emit(hdr.sp_order_mod_in_message);
        packet.emit(hdr.trade_cancel_in_message);
        packet.emit(hdr.trade_mod_in_message);
        packet.emit(hdr.sign_on_request_in_message);
        packet.emit(hdr.sign_off_trader_in_message);
        packet.emit(hdr.gr_request_message);
        packet.emit(hdr.user_addr_unlock_in_message);
        packet.emit(hdr.branch_ord_val_limit_update_in_message);
        packet.emit(hdr.user_ord_val_limit_update_in_message);
        packet.emit(hdr.normal_ord_limit_update_in_message);
        packet.emit(hdr.spread_ord_limit_update_in_message);
        packet.emit(hdr.reset_user_password_in_message);
        packet.emit(hdr.col_user_status_change_in_message);
        packet.emit(hdr.download_request_message);
        packet.emit(hdr.update_localdb_in_message);
        packet.emit(hdr.box_sign_on_request_in_message);
        packet.emit(hdr.secure_box_registration_request_in_message);
    }
}

V1Switch(
    NsecomOrderentryClientParser(),
    NsecomOrderentryClientVerifyChecksum(),
    NsecomOrderentryClientIngress(),
    NsecomOrderentryClientEgress(),
    NsecomOrderentryClientComputeChecksum(),
    NsecomOrderentryClientDeparser()
) main;
