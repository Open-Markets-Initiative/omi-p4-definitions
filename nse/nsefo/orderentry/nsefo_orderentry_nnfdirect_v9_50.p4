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
    bit<1> pre_open;
    bit<11> reserved_212;
    bit<1> auction_market;
    bit<1> spot_market;
    bit<1> oddlot_market;
    bit<1> normal_market;
    bit<16> member_type;
    bit<8> clearing_status;
    bit<200> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header sign_on_request_out_message_t {
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
    bit<32> end_time;
    bit<8> second_reserved_1;
    bit<400> colour;
    bit<8> third_reserved_1;
    bit<16> user_type;
    bit<64> sequence_number;
    bit<112> reserved_14;
    bit<8> broker_status;
    bit<8> show_index;
    bit<1> pre_open;
    bit<11> reserved_212;
    bit<1> auction_market;
    bit<1> spot_market;
    bit<1> oddlot_market;
    bit<1> normal_market;
    bit<16> member_type;
    bit<8> clearing_status;
    bit<200> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header sign_off_request_out_message_t {
    bit<32> user_id;
    bit<1160> reserved_145;
}

header system_information_in_message_t {
    bit<32> last_update_portfolio_t_ime;
}

header system_information_out_message_t {
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
    bit<8> update_portfolio;
    bit<32> market_index;
    bit<16> default_settlement_period_normal;
    bit<16> default_settlement_period_spot;
    bit<16> default_settlement_period_auction;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> warning_percent;
    bit<16> volume_freeze_percent;
    bit<16> snap_quote_time;
    bit<16> reserved_2;
    bit<32> board_lot_quantity;
    bit<32> tick_size;
    bit<16> maximum_gtc_days;
    bit<13> reserved_113;
    bit<1> books_merged;
    bit<1> minimum_fill;
    bit<1> eligible_aon;
    bit<16> disclosed_quantity_percent_allowed;
    bit<32> risk_free_interest_rate;
}

header gateway_router_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
}

header gateway_router_response_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
    bit<128> ip_address;
    bit<32> port;
    bit<64> session_key;
    bit<256> cryptographic_key;
}

header existing_encryption_tail_t {
    bit<128> cryptographic_iv;
}

header new_encryption_tail_t {
    bit<64> static_cryptographic_iv;
    bit<64> dynamic_cryptographic_iv;
    bit<96> cryptographic_additional_key;
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

header update_local_database_header_message_t {
    bit<16> reserved_2;
}

header update_local_database_trailer_message_t {
    bit<16> reserved_2;
}

header download_request_message_t {
    bit<64> sequence_number;
}

header update_local_database_data_message_t {
    bit<32> inner_trader_id;
    bit<32> inner_log_time;
    bit<16> inner_alpha_char;
    bit<16> inner_transaction_code;
    bit<16> inner_error_code;
    bit<64> inner_timestamp;
    bit<64> inner_time_stamp_1;
    bit<64> inner_time_stamp_2;
    bit<16> inner_message_length;
}

header message_record_message_t {
    bit<32> inner_trader_id;
    bit<32> inner_log_time;
    bit<16> inner_alpha_char;
    bit<16> inner_transaction_code;
    bit<16> inner_error_code;
    bit<64> inner_timestamp;
    bit<64> inner_time_stamp_1;
    bit<64> inner_time_stamp_2;
    bit<16> inner_message_length;
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
    bit<2> reserved_12;
    bit<1> order_pre_open;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> mit;
    bit<1> sl;
    bit<1> market;
    bit<1> ato;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<1> boc;
    bit<1> col;
    bit<2> reserved_34;
    bit<1> stpc;
    bit<3> reserved_68;
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
    bit<2> reserved_12;
    bit<1> order_pre_open;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> mit;
    bit<1> sl;
    bit<1> market;
    bit<1> ato;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<1> boc;
    bit<1> col;
    bit<2> reserved_34;
    bit<1> stpc;
    bit<3> reserved_68;
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
    bit<2> reserved_12_2;
    bit<1> order_pre_open_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> mit_2;
    bit<1> sl_2;
    bit<1> market_2;
    bit<1> ato_2;
    bit<8> open_close_2;
    bit<1> boc_2;
    bit<1> col_2;
    bit<2> reserved_34_2;
    bit<1> stpc_2;
    bit<3> reserved_68_2;
    bit<8> reserved_1_2;
    bit<8> filler_y;
}

header trade_confirmation_message_t {
    bit<64> response_order_number;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_number;
    bit<80> account_number;
    bit<16> buy_sell_indicator;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_volume_remaining;
    bit<32> price;
    bit<2> reserved_12;
    bit<1> order_pre_open;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> mit;
    bit<1> sl;
    bit<1> market;
    bit<1> ato;
    bit<32> good_till_date;
    bit<32> fill_number;
    bit<32> fill_quantity;
    bit<32> fill_price;
    bit<32> volume_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> counter_trader_order_number;
    bit<40> counter_broker_id;
    bit<8> second_reserved_1;
    bit<32> token;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<8> open_close;
    bit<8> old_open_close;
    bit<8> trade_book_type;
    bit<8> third_reserved_1;
    bit<32> reserved_4;
    bit<80> old_account_number;
    bit<96> participant;
    bit<96> old_participant;
    bit<1> boc;
    bit<1> col;
    bit<2> reserved_34;
    bit<1> stpc;
    bit<3> reserved_68;
    bit<8> fourth_reserved_1;
    bit<8> fifth_reserved_1;
    bit<8> sixth_reserved_1;
    bit<80> pan;
    bit<80> old_pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header user_order_limit_update_message_t {
    bit<40> broker_id;
    bit<16> branch_id;
    bit<200> user_name;
    bit<32> user_id;
    bit<16> user_type;
    bit<64> branch_buy_value_limit;
    bit<64> branch_sell_value_limit;
    bit<64> branch_used_buy_value_limit;
    bit<64> branch_used_sell_value_limit;
    bit<64> user_order_buy_value_limit;
    bit<64> user_order_sell_value_limit;
    bit<64> user_order_used_buy_value_limit;
    bit<64> user_order_used_sell_value_limit;
}

header dealer_limit_update_message_t {
    bit<40> broker_id;
    bit<32> user_id;
    bit<64> ord_qty_buff;
    bit<64> ord_val_buff;
}

header spread_order_limit_update_message_t {
    bit<40> broker_id;
    bit<32> user_id;
    bit<64> spd_ord_qty_buff;
    bit<64> spd_ord_val_buff;
}

header control_message_to_trader_message_t {
    bit<32> trader_id;
    bit<24> action_code;
    bit<8> reserved_1;
    bit<16> broad_cast_message_length;
    bit<1912> broad_cast_message;
}

header market_statistics_report_message_t {
    bit<8> message_type;
}

header report_header_body_t {
    bit<8> org_scope;
    bit<32> report_date;
    bit<16> user_type;
    bit<40> broker_id;
    bit<200> firm_name;
    bit<32> trader_number;
    bit<208> trader_name;
}

header report_statistics_body_t {
    bit<8> reserved_1;
    bit<16> number_of_records;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<16> market_type;
    bit<32> open_price;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> closing_price;
    bit<64> total_quantity_traded_long;
    bit<64> total_value_traded;
    bit<32> previous_close_price;
    bit<64> open_interest_long;
    bit<64> chg_open_interest;
    bit<32> indicator;
}

header report_trailer_body_t {
    bit<32> number_of_packets;
    bit<8> reserved_1;
}

header enhanced_market_statistics_report_message_t {
    bit<8> message_type;
    bit<8> reserved_1;
    bit<16> number_of_records;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<16> market_type;
    bit<32> open_price;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> closing_price;
    bit<32> total_quantity_traded_short;
    bit<64> total_value_traded;
    bit<32> previous_close_price;
    bit<64> open_interest_long;
    bit<64> chg_open_interest;
    bit<32> indicator;
}

header market_index_report_message_t {
    bit<8> message_type;
    bit<120> index_name;
    bit<16> market_opening_index;
    bit<16> market_high_index;
    bit<16> market_low_index;
    bit<16> market_closing_index;
    bit<16> market_start_index;
}

header industry_index_report_message_t {
    bit<8> message_type;
    bit<8> reserved_1;
    bit<16> number_of_industry_records;
    bit<120> industry_name;
    bit<32> opening;
    bit<32> high;
    bit<32> low;
    bit<32> closing;
    bit<32> start;
}

header sector_index_report_message_t {
    bit<8> message_type;
    bit<120> industry_name;
    bit<16> number_of_industry_records;
    bit<120> sector_name;
    bit<32> index_value;
}

header spread_bhavcopy_message_t {
    bit<8> message_type;
}

header spread_report_header_body_t {
    bit<8> org_scope;
    bit<32> report_date;
    bit<16> user_type;
    bit<40> brokernumber;
    bit<200> broker_name;
    bit<32> trader_number;
    bit<208> trader_name;
}

header spread_report_statistics_body_t {
    bit<8> reserved_1;
    bit<16> no_of_records;
    bit<16> market_type;
    bit<48> instrumentname_1;
    bit<80> symbol_1;
    bit<32> expirydate_1;
    bit<32> strikeprice_1;
    bit<16> optiontype_1;
    bit<16> calevel_1;
    bit<48> instrumentname_2;
    bit<80> symbol_2;
    bit<32> expirydate_2;
    bit<32> strikeprice_2;
    bit<16> optiontype_2;
    bit<16> calevel_2;
    bit<32> openpd;
    bit<32> hipd;
    bit<32> lowpd;
    bit<32> lasttradedpd;
    bit<32> noofcontractstraded;
}

header global_indices_message_t {
    bit<32> token;
    bit<400> name;
    bit<32> open;
    bit<32> high;
    bit<32> low;
    bit<32> last;
    bit<32> close;
    bit<32> prev_close;
    bit<32> life_high;
    bit<32> life_low;
    bit<32> filler_4;
    bit<32> filler_2;
    bit<32> filler_3;
}

header global_contracts_message_t {
    bit<32> token;
    bit<128> nse_symbol;
    bit<48> instrument_name;
    bit<16> exp_day;
    bit<16> exp_month;
    bit<16> exp_year;
    bit<16> option_type;
    bit<32> strike_price;
    bit<32> bid_price;
    bit<32> ask_price;
    bit<64> bid_size;
    bit<64> ask_size;
    bit<32> open;
    bit<32> high;
    bit<32> low;
    bit<32> last;
    bit<32> close;
    bit<32> prev_close;
    bit<32> limit_high;
    bit<32> limit_low;
    bit<64> total_trades;
    bit<64> open_interest_double;
    bit<32> filler_4;
    bit<32> filler_2;
    bit<32> filler_3;
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

header box_sign_on_request_out_message_t {
    bit<16> box_id;
    bit<80> reserved_10;
}

header box_sign_off_message_t {
    bit<16> box_id;
}

header contingency_broadcast_message_t {
    bit<16> stream_number;
    bit<16> status;
    bit<1600> reserved_200;
}

header branch_order_value_limit_update_message_t {
    bit<40> broker_id;
    bit<200> reserved_25;
    bit<16> branch_id;
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

header collateral_user_status_change_response_message_t {
    bit<32> user_id;
    bit<8> col_user_bit;
    bit<8> reserved_1;
}

header user_trade_modify_cancel_status_change_request_message_t {
    bit<32> user_id;
    bit<8> trd_mod_cxl_bit;
    bit<56> reserved_7;
}

header user_trade_modify_cancel_status_change_response_message_t {
    bit<32> user_id;
    bit<8> trd_mod_cxl_bit;
    bit<8> reserved_1;
}

header user_address_unlock_request_message_t {
    bit<32> user_id;
    bit<560> reserved_70;
}

header user_address_unlock_confirm_message_t {
    bit<32> user_id;
    bit<288> reserved_36;
}

header user_address_unlock_approve_message_t {
    bit<32> user_id;
    bit<288> reserved_36;
}

header giveup_confirmation_message_t {
    bit<16> reason_code;
    bit<64> order_number;
    bit<32> fill_number;
    bit<48> instrument_name;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<16> ca_level;
    bit<32> fill_volume;
    bit<32> fill_price;
    bit<40> broker_id;
    bit<8> filler;
    bit<16> buy_sell;
    bit<16> book_type;
    bit<32> last_modified_date_time;
    bit<8> initiated_by_control;
    bit<8> open_close;
    bit<8> reserved_1;
    bit<96> participant;
    bit<8> giveup_flag;
    bit<8> deleted;
}

header order_entry_body_t {
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
    bit<2> reserved_12;
    bit<1> order_pre_open;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> mit;
    bit<1> sl;
    bit<1> market;
    bit<1> ato;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<192> c_ord_filler;
    bit<8> open_close;
    bit<96> settlor;
    bit<16> pro_client_indicator;
    bit<16> settlement_period;
    bit<1> boc;
    bit<1> col;
    bit<2> reserved_34;
    bit<1> stpc;
    bit<3> reserved_68;
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

header spread_order_body_t {
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
    bit<2> reserved_12;
    bit<1> order_pre_open;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> mit;
    bit<1> sl;
    bit<1> market;
    bit<1> ato;
    bit<16> branch_id_1;
    bit<32> trader_id_1;
    bit<40> broker_id_1;
    bit<192> c_ord_filler;
    bit<8> open_close_1;
    bit<96> settlor_1;
    bit<16> pro_client_1;
    bit<16> settlement_period_1;
    bit<1> boc;
    bit<1> col;
    bit<2> reserved_34;
    bit<1> stpc;
    bit<3> reserved_68;
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
    bit<2> reserved_12_2;
    bit<1> order_pre_open_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> mit_2;
    bit<1> sl_2;
    bit<1> market_2;
    bit<1> ato_2;
    bit<8> open_close_2;
    bit<1> boc_2;
    bit<1> col_2;
    bit<2> reserved_34_2;
    bit<1> stpc_2;
    bit<3> reserved_68_2;
    bit<8> reserved_1_2;
    bit<8> filler_y;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    sign_on_request_in_message_t sign_on_request_in_message;
    sign_on_request_out_message_t sign_on_request_out_message;
    sign_off_request_out_message_t sign_off_request_out_message;
    system_information_in_message_t system_information_in_message;
    system_information_out_message_t system_information_out_message;
    gateway_router_request_message_t gateway_router_request_message;
    gateway_router_response_message_t gateway_router_response_message;
    existing_encryption_tail_t existing_encryption_tail;
    new_encryption_tail_t new_encryption_tail;
    update_local_database_in_message_t update_local_database_in_message;
    update_local_database_header_message_t update_local_database_header_message;
    update_local_database_trailer_message_t update_local_database_trailer_message;
    download_request_message_t download_request_message;
    update_local_database_data_message_t update_local_database_data_message;
    message_record_message_t message_record_message;
    order_entry_message_t order_entry_message;
    price_modification_message_t price_modification_message;
    trade_inquiry_message_t trade_inquiry_message;
    spread_order_entry_message_t spread_order_entry_message;
    trade_confirmation_message_t trade_confirmation_message;
    user_order_limit_update_message_t user_order_limit_update_message;
    dealer_limit_update_message_t dealer_limit_update_message;
    spread_order_limit_update_message_t spread_order_limit_update_message;
    control_message_to_trader_message_t control_message_to_trader_message;
    market_statistics_report_message_t market_statistics_report_message;
    report_header_body_t report_header_body;
    report_statistics_body_t report_statistics_body;
    report_trailer_body_t report_trailer_body;
    enhanced_market_statistics_report_message_t enhanced_market_statistics_report_message;
    market_index_report_message_t market_index_report_message;
    industry_index_report_message_t industry_index_report_message;
    sector_index_report_message_t sector_index_report_message;
    spread_bhavcopy_message_t spread_bhavcopy_message;
    spread_report_header_body_t spread_report_header_body;
    spread_report_statistics_body_t spread_report_statistics_body;
    global_indices_message_t global_indices_message;
    global_contracts_message_t global_contracts_message;
    secure_box_registration_request_in_message_t secure_box_registration_request_in_message;
    box_sign_on_request_in_message_t box_sign_on_request_in_message;
    box_sign_on_request_out_message_t box_sign_on_request_out_message;
    box_sign_off_message_t box_sign_off_message;
    contingency_broadcast_message_t contingency_broadcast_message;
    branch_order_value_limit_update_message_t branch_order_value_limit_update_message;
    user_order_value_limit_update_message_t user_order_value_limit_update_message;
    normal_order_limit_update_message_t normal_order_limit_update_message;
    reset_user_password_message_t reset_user_password_message;
    collateral_user_status_change_request_message_t collateral_user_status_change_request_message;
    collateral_user_status_change_response_message_t collateral_user_status_change_response_message;
    user_trade_modify_cancel_status_change_request_message_t user_trade_modify_cancel_status_change_request_message;
    user_trade_modify_cancel_status_change_response_message_t user_trade_modify_cancel_status_change_response_message;
    user_address_unlock_request_message_t user_address_unlock_request_message;
    user_address_unlock_confirm_message_t user_address_unlock_confirm_message;
    user_address_unlock_approve_message_t user_address_unlock_approve_message;
    giveup_confirmation_message_t giveup_confirmation_message;
    order_entry_body_t order_entry_body;
    spread_order_body_t spread_order_body;
}

parser NsefoOrderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w2300: parse_sign_on_request_in_message;
            16w2301: parse_sign_on_request_out_message;
            16w2321: parse_sign_off_request_out_message;
            16w1600: parse_system_information_in_message;
            16w1601: parse_system_information_out_message;
            16w2400: parse_gateway_router_request_message;
            16w2401: parse_gateway_router_response_message;
            16w7300: parse_update_local_database_in_message;
            16w7307: parse_update_local_database_header_message;
            16w7308: parse_update_local_database_trailer_message;
            16w7000: parse_download_request_message;
            16w7304: parse_update_local_database_data_message;
            16w7021: parse_message_record_message;
            16w2000: parse_order_entry_message;
            16w2012: parse_order_entry_message;
            16w2040: parse_order_entry_message;
            16w2042: parse_order_entry_message;
            16w2062: parse_order_entry_message;
            16w2070: parse_order_entry_message;
            16w2072: parse_order_entry_message;
            16w2073: parse_order_entry_message;
            16w2074: parse_order_entry_message;
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
            16w2222: parse_trade_confirmation_message;
            16w2212: parse_trade_confirmation_message;
            16w2282: parse_trade_confirmation_message;
            16w2286: parse_trade_confirmation_message;
            16w2287: parse_trade_confirmation_message;
            16w2288: parse_trade_confirmation_message;
            16w5731: parse_user_order_limit_update_message;
            16w5733: parse_dealer_limit_update_message;
            16w5772: parse_spread_order_limit_update_message;
            16w5295: parse_control_message_to_trader_message;
            16w1833: parse_market_statistics_report_message;
            16w11833: parse_enhanced_market_statistics_report_message;
            16w1836: parse_market_index_report_message;
            16w1837: parse_industry_index_report_message;
            16w1838: parse_sector_index_report_message;
            16w1862: parse_spread_bhavcopy_message;
            16w7732: parse_global_indices_message;
            16w7733: parse_global_contracts_message;
            16w23008: parse_secure_box_registration_request_in_message;
            16w23000: parse_box_sign_on_request_in_message;
            16w23001: parse_box_sign_on_request_out_message;
            16w20322: parse_box_sign_off_message;
            16w5294: parse_contingency_broadcast_message;
            16w5716: parse_branch_order_value_limit_update_message;
            16w5730: parse_user_order_value_limit_update_message;
            16w5732: parse_normal_order_limit_update_message;
            16w5740: parse_reset_user_password_message;
            16w5744: parse_collateral_user_status_change_request_message;
            16w5745: parse_collateral_user_status_change_response_message;
            16w5738: parse_user_trade_modify_cancel_status_change_request_message;
            16w5739: parse_user_trade_modify_cancel_status_change_response_message;
            16w5427: parse_user_address_unlock_request_message;
            16w5428: parse_user_address_unlock_confirm_message;
            16w5483: parse_user_address_unlock_approve_message;
            16w4506: parse_giveup_confirmation_message;
            16w4507: parse_giveup_confirmation_message;
            16w2075: parse_order_cancellation_confirmation_message;
            default: accept;
        }
    }

    state parse_sign_on_request_in_message {
        packet.extract(hdr.sign_on_request_in_message);
        transition accept;
    }

    state parse_sign_on_request_out_message {
        packet.extract(hdr.sign_on_request_out_message);
        transition accept;
    }

    state parse_sign_off_request_out_message {
        packet.extract(hdr.sign_off_request_out_message);
        transition accept;
    }

    state parse_system_information_in_message {
        packet.extract(hdr.system_information_in_message);
        transition accept;
    }

    state parse_system_information_out_message {
        packet.extract(hdr.system_information_out_message);
        transition accept;
    }

    state parse_gateway_router_request_message {
        packet.extract(hdr.gateway_router_request_message);
        transition accept;
    }

    state parse_gateway_router_response_message {
        packet.extract(hdr.gateway_router_response_message);
        transition select(hdr.message_header.message_length) {
            16w124: parse_existing_encryption_tail;
            16w136: parse_new_encryption_tail;
            default: accept;
        }
    }

    state parse_existing_encryption_tail {
        packet.extract(hdr.existing_encryption_tail);
        transition accept;
    }

    state parse_new_encryption_tail {
        packet.extract(hdr.new_encryption_tail);
        transition accept;
    }

    state parse_update_local_database_in_message {
        packet.extract(hdr.update_local_database_in_message);
        transition accept;
    }

    state parse_update_local_database_header_message {
        packet.extract(hdr.update_local_database_header_message);
        transition accept;
    }

    state parse_update_local_database_trailer_message {
        packet.extract(hdr.update_local_database_trailer_message);
        transition accept;
    }

    state parse_download_request_message {
        packet.extract(hdr.download_request_message);
        transition accept;
    }

    state parse_update_local_database_data_message {
        packet.extract(hdr.update_local_database_data_message);
        transition accept;
    }

    state parse_message_record_message {
        packet.extract(hdr.message_record_message);
        transition accept;
    }

    state parse_order_entry_message {
        packet.extract(hdr.order_entry_message);
        transition accept;
    }

    state parse_price_modification_message {
        packet.extract(hdr.price_modification_message);
        transition accept;
    }

    state parse_trade_inquiry_message {
        packet.extract(hdr.trade_inquiry_message);
        transition accept;
    }

    state parse_spread_order_entry_message {
        packet.extract(hdr.spread_order_entry_message);
        transition accept;
    }

    state parse_trade_confirmation_message {
        packet.extract(hdr.trade_confirmation_message);
        transition accept;
    }

    state parse_user_order_limit_update_message {
        packet.extract(hdr.user_order_limit_update_message);
        transition accept;
    }

    state parse_dealer_limit_update_message {
        packet.extract(hdr.dealer_limit_update_message);
        transition accept;
    }

    state parse_spread_order_limit_update_message {
        packet.extract(hdr.spread_order_limit_update_message);
        transition accept;
    }

    state parse_control_message_to_trader_message {
        packet.extract(hdr.control_message_to_trader_message);
        transition accept;
    }

    state parse_market_statistics_report_message {
        packet.extract(hdr.market_statistics_report_message);
        transition select(hdr.market_statistics_report_message.message_type) {
            8w0x48: parse_report_header_body;
            8w0x58: parse_report_header_body;
            8w0x4c: parse_report_header_body;
            8w0x52: parse_report_statistics_body;
            8w0x59: parse_report_statistics_body;
            8w0x4d: parse_report_statistics_body;
            8w0x54: parse_report_trailer_body;
            8w0x5a: parse_report_trailer_body;
            8w0x4e: parse_report_trailer_body;
            default: accept;
        }
    }

    state parse_report_header_body {
        packet.extract(hdr.report_header_body);
        transition accept;
    }

    state parse_report_statistics_body {
        packet.extract(hdr.report_statistics_body);
        transition accept;
    }

    state parse_report_trailer_body {
        packet.extract(hdr.report_trailer_body);
        transition accept;
    }

    state parse_enhanced_market_statistics_report_message {
        packet.extract(hdr.enhanced_market_statistics_report_message);
        transition accept;
    }

    state parse_market_index_report_message {
        packet.extract(hdr.market_index_report_message);
        transition accept;
    }

    state parse_industry_index_report_message {
        packet.extract(hdr.industry_index_report_message);
        transition accept;
    }

    state parse_sector_index_report_message {
        packet.extract(hdr.sector_index_report_message);
        transition accept;
    }

    state parse_spread_bhavcopy_message {
        packet.extract(hdr.spread_bhavcopy_message);
        transition select(hdr.spread_bhavcopy_message.message_type) {
            8w0x48: parse_spread_report_header_body;
            8w0x58: parse_spread_report_header_body;
            8w0x4c: parse_spread_report_header_body;
            8w0x52: parse_spread_report_statistics_body;
            8w0x59: parse_spread_report_statistics_body;
            8w0x4d: parse_spread_report_statistics_body;
            8w0x54: parse_report_trailer_body;
            8w0x5a: parse_report_trailer_body;
            8w0x4e: parse_report_trailer_body;
            default: accept;
        }
    }

    state parse_spread_report_header_body {
        packet.extract(hdr.spread_report_header_body);
        transition accept;
    }

    state parse_spread_report_statistics_body {
        packet.extract(hdr.spread_report_statistics_body);
        transition accept;
    }

    state parse_global_indices_message {
        packet.extract(hdr.global_indices_message);
        transition accept;
    }

    state parse_global_contracts_message {
        packet.extract(hdr.global_contracts_message);
        transition accept;
    }

    state parse_secure_box_registration_request_in_message {
        packet.extract(hdr.secure_box_registration_request_in_message);
        transition accept;
    }

    state parse_box_sign_on_request_in_message {
        packet.extract(hdr.box_sign_on_request_in_message);
        transition accept;
    }

    state parse_box_sign_on_request_out_message {
        packet.extract(hdr.box_sign_on_request_out_message);
        transition accept;
    }

    state parse_box_sign_off_message {
        packet.extract(hdr.box_sign_off_message);
        transition accept;
    }

    state parse_contingency_broadcast_message {
        packet.extract(hdr.contingency_broadcast_message);
        transition accept;
    }

    state parse_branch_order_value_limit_update_message {
        packet.extract(hdr.branch_order_value_limit_update_message);
        transition accept;
    }

    state parse_user_order_value_limit_update_message {
        packet.extract(hdr.user_order_value_limit_update_message);
        transition accept;
    }

    state parse_normal_order_limit_update_message {
        packet.extract(hdr.normal_order_limit_update_message);
        transition accept;
    }

    state parse_reset_user_password_message {
        packet.extract(hdr.reset_user_password_message);
        transition accept;
    }

    state parse_collateral_user_status_change_request_message {
        packet.extract(hdr.collateral_user_status_change_request_message);
        transition accept;
    }

    state parse_collateral_user_status_change_response_message {
        packet.extract(hdr.collateral_user_status_change_response_message);
        transition accept;
    }

    state parse_user_trade_modify_cancel_status_change_request_message {
        packet.extract(hdr.user_trade_modify_cancel_status_change_request_message);
        transition accept;
    }

    state parse_user_trade_modify_cancel_status_change_response_message {
        packet.extract(hdr.user_trade_modify_cancel_status_change_response_message);
        transition accept;
    }

    state parse_user_address_unlock_request_message {
        packet.extract(hdr.user_address_unlock_request_message);
        transition accept;
    }

    state parse_user_address_unlock_confirm_message {
        packet.extract(hdr.user_address_unlock_confirm_message);
        transition accept;
    }

    state parse_user_address_unlock_approve_message {
        packet.extract(hdr.user_address_unlock_approve_message);
        transition accept;
    }

    state parse_giveup_confirmation_message {
        packet.extract(hdr.giveup_confirmation_message);
        transition accept;
    }

    state parse_order_cancellation_confirmation_message {
        transition select(hdr.message_header.message_length) {
            16w316: parse_order_entry_body;
            16w480: parse_spread_order_body;
            default: accept;
        }
    }

    state parse_order_entry_body {
        packet.extract(hdr.order_entry_body);
        transition accept;
    }

    state parse_spread_order_body {
        packet.extract(hdr.spread_order_body);
        transition accept;
    }

}

control NsefoOrderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoOrderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NsefoOrderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsefoOrderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoOrderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.sign_on_request_in_message);
        packet.emit(hdr.sign_on_request_out_message);
        packet.emit(hdr.sign_off_request_out_message);
        packet.emit(hdr.system_information_in_message);
        packet.emit(hdr.system_information_out_message);
        packet.emit(hdr.gateway_router_request_message);
        packet.emit(hdr.gateway_router_response_message);
        packet.emit(hdr.existing_encryption_tail);
        packet.emit(hdr.new_encryption_tail);
        packet.emit(hdr.update_local_database_in_message);
        packet.emit(hdr.update_local_database_header_message);
        packet.emit(hdr.update_local_database_trailer_message);
        packet.emit(hdr.download_request_message);
        packet.emit(hdr.update_local_database_data_message);
        packet.emit(hdr.message_record_message);
        packet.emit(hdr.order_entry_message);
        packet.emit(hdr.price_modification_message);
        packet.emit(hdr.trade_inquiry_message);
        packet.emit(hdr.spread_order_entry_message);
        packet.emit(hdr.trade_confirmation_message);
        packet.emit(hdr.user_order_limit_update_message);
        packet.emit(hdr.dealer_limit_update_message);
        packet.emit(hdr.spread_order_limit_update_message);
        packet.emit(hdr.control_message_to_trader_message);
        packet.emit(hdr.market_statistics_report_message);
        packet.emit(hdr.report_header_body);
        packet.emit(hdr.report_statistics_body);
        packet.emit(hdr.report_trailer_body);
        packet.emit(hdr.enhanced_market_statistics_report_message);
        packet.emit(hdr.market_index_report_message);
        packet.emit(hdr.industry_index_report_message);
        packet.emit(hdr.sector_index_report_message);
        packet.emit(hdr.spread_bhavcopy_message);
        packet.emit(hdr.spread_report_header_body);
        packet.emit(hdr.spread_report_statistics_body);
        packet.emit(hdr.global_indices_message);
        packet.emit(hdr.global_contracts_message);
        packet.emit(hdr.secure_box_registration_request_in_message);
        packet.emit(hdr.box_sign_on_request_in_message);
        packet.emit(hdr.box_sign_on_request_out_message);
        packet.emit(hdr.box_sign_off_message);
        packet.emit(hdr.contingency_broadcast_message);
        packet.emit(hdr.branch_order_value_limit_update_message);
        packet.emit(hdr.user_order_value_limit_update_message);
        packet.emit(hdr.normal_order_limit_update_message);
        packet.emit(hdr.reset_user_password_message);
        packet.emit(hdr.collateral_user_status_change_request_message);
        packet.emit(hdr.collateral_user_status_change_response_message);
        packet.emit(hdr.user_trade_modify_cancel_status_change_request_message);
        packet.emit(hdr.user_trade_modify_cancel_status_change_response_message);
        packet.emit(hdr.user_address_unlock_request_message);
        packet.emit(hdr.user_address_unlock_confirm_message);
        packet.emit(hdr.user_address_unlock_approve_message);
        packet.emit(hdr.giveup_confirmation_message);
        packet.emit(hdr.order_entry_body);
        packet.emit(hdr.spread_order_body);
    }
}

V1Switch(
    NsefoOrderentryParser(),
    NsefoOrderentryVerifyChecksum(),
    NsefoOrderentryIngress(),
    NsefoOrderentryEgress(),
    NsefoOrderentryComputeChecksum(),
    NsefoOrderentryDeparser()
) main;
