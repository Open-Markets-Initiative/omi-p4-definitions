// P4_16 (v1model) definition for: Nse NseSlbm OrderEntry NnfDirect v2.7
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End Direct Interface
//   Version: 2.7
//   Date: 11/10/2024
//   Specification: Proto_SLBM_NNF_PROTOCOL_2.7.pdf
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
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<16> packet_length;
    bit<32> packet_sequence_number;
}

header server_registration_packet_t {
    bit<128> registration_checksum;
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

header logon_confirmation_body_t {
    bit<32> user_id;
    bit<64> password;
    bit<64> new_password;
    bit<208> trader_name;
    bit<32> last_password_change_date;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<16> branch_id;
    bit<32> version_number;
    bit<32> end_time;
    bit<416> reserved_52;
    bit<16> user_type;
    bit<64> sequence_number;
    bit<112> reserved_14;
    bit<8> broker_status;
    bit<8> second_reserved_1;
    bit<1> normal_market;
    bit<1> oddlot_market;
    bit<1> spot_market;
    bit<1> auction_market;
    bit<12> reserved_112;
    bit<200> broker_name;
    bit<8> char_filler_3;
}

header logon_error_body_t {
    bit<80> symbol;
    bit<16> series;
    bit<1024> error_message;
}

header system_information_response_message_t {
    bit<16> normal;
    bit<16> oddlot;
    bit<16> spot;
    bit<16> auction;
    bit<32> market_index;
    bit<16> default_settlement_period_normal;
    bit<16> default_settlement_period_spot;
    bit<16> default_settlement_period_auction;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> warning_percent;
    bit<16> volume_freeze_percent;
    bit<16> reserved_2;
    bit<16> terminal_idle_time;
    bit<32> board_lot_quantity;
    bit<32> tick_size;
    bit<16> maximum_gtc_days;
    bit<1> aon;
    bit<1> minimum_fill;
    bit<1> books_merged;
    bit<13> reserved_113;
    bit<16> disclosed_quantity_percent_allowed;
    bit<32> reserved_4;
}

header partial_system_information_response_message_t {
    bit<16> normal;
    bit<16> oddlot;
    bit<16> spot;
    bit<16> auction;
    bit<32> market_index;
    bit<16> default_settlement_period_normal;
    bit<16> default_settlement_period_spot;
    bit<16> default_settlement_period_auction;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> warning_percent;
    bit<16> volume_freeze_percent;
    bit<16> reserved_2;
    bit<16> terminal_idle_time;
    bit<32> board_lot_quantity;
    bit<32> tick_size;
    bit<16> maximum_gtc_days;
    bit<1> aon;
    bit<1> minimum_fill;
    bit<1> books_merged;
    bit<13> reserved_113;
    bit<16> disclosed_quantity_percent_allowed;
    bit<32> reserved_4;
}

header update_local_database_header_message_t {
    bit<16> reserved_2;
}

header update_local_database_data_message_t {
    bit<2048> data_chunk0;
    bit<1728> data_chunk1;
}

header update_local_database_trailer_message_t {
    bit<16> reserved_2;
}

header message_download_data_message_t {
    bit<2048> data_chunk0;
    bit<1728> data_chunk1;
}

header board_lot_out_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_confirmation_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header market_price_confirmation_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_freeze_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_error_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_modification_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_modification_confirmation_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_modification_error_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_cancellation_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_cancellation_confirmation_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header order_cancellation_error_response_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header cancellation_of_orders_in_batch_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header negotiated_order_entered_by_counter_party_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header negotiated_order_to_regular_lot_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header cancel_negotiated_order_message_t {
    bit<8> participant_type;
    bit<8> reserved_1;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<8> mod_cxl_by;
    bit<8> filler_9;
    bit<16> reason_code;
    bit<32> reserved_4;
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_number;
    bit<40> op_broker_id;
    bit<8> suspended;
    bit<64> order_number;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> volume_filled_today;
    bit<32> price;
    bit<32> trigger_price;
    bit<32> reverse_leg_settl_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<168> oe_remarks;
    bit<32> transaction_id;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_period;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<16> reserved_2;
    bit<16> order_type;
}

header trade_cancellation_requested_response_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> reverse_leg_settl_date;
    bit<32> l_fill_number;
    bit<32> l_fill_qty;
    bit<32> l_fill_price;
    bit<16> i_mkt_type;
    bit<32> l_new_volume;
    bit<96> buy_participant_id;
    bit<96> sell_participant_id;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<16> requested_by;
}

header trade_cancellation_error_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> reverse_leg_settl_date;
    bit<32> l_fill_number;
    bit<32> l_fill_qty;
    bit<32> l_fill_price;
    bit<16> i_mkt_type;
    bit<32> l_new_volume;
    bit<96> buy_participant_id;
    bit<96> sell_participant_id;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<16> requested_by;
}

header trade_modification_requested_response_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> reverse_leg_settl_date;
    bit<32> l_fill_number;
    bit<32> l_fill_qty;
    bit<32> l_fill_price;
    bit<16> i_mkt_type;
    bit<32> l_new_volume;
    bit<96> buy_participant_id;
    bit<96> sell_participant_id;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<16> requested_by;
}

header trade_confirmation_message_t {
    bit<64> response_order_number;
    bit<16> order_type;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_num;
    bit<80> account_num;
    bit<16> buy_sell;
    bit<32> original_vol;
    bit<32> disclosed_vol;
    bit<32> remaining_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
    bit<80> symbol;
    bit<16> series;
    bit<8> second_reserved_1;
    bit<16> book_type;
    bit<32> new_volume;
    bit<16> pro_client;
}

header stop_loss_order_triggering_message_t {
    bit<64> response_order_number;
    bit<16> order_type;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_num;
    bit<80> account_num;
    bit<16> buy_sell;
    bit<32> original_vol;
    bit<32> disclosed_vol;
    bit<32> remaining_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
    bit<80> symbol;
    bit<16> series;
    bit<8> second_reserved_1;
    bit<16> book_type;
    bit<32> new_volume;
    bit<16> pro_client;
}

header trade_cancellation_confirmation_response_message_t {
    bit<64> response_order_number;
    bit<16> order_type;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_num;
    bit<80> account_num;
    bit<16> buy_sell;
    bit<32> original_vol;
    bit<32> disclosed_vol;
    bit<32> remaining_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
    bit<80> symbol;
    bit<16> series;
    bit<8> second_reserved_1;
    bit<16> book_type;
    bit<32> new_volume;
    bit<16> pro_client;
}

header trade_cancellation_rejection_message_t {
    bit<64> response_order_number;
    bit<16> order_type;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_num;
    bit<80> account_num;
    bit<16> buy_sell;
    bit<32> original_vol;
    bit<32> disclosed_vol;
    bit<32> remaining_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
    bit<80> symbol;
    bit<16> series;
    bit<8> second_reserved_1;
    bit<16> book_type;
    bit<32> new_volume;
    bit<16> pro_client;
}

header trade_modification_confirmation_message_t {
    bit<64> response_order_number;
    bit<16> order_type;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_num;
    bit<80> account_num;
    bit<16> buy_sell;
    bit<32> original_vol;
    bit<32> disclosed_vol;
    bit<32> remaining_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
    bit<80> symbol;
    bit<16> series;
    bit<8> second_reserved_1;
    bit<16> book_type;
    bit<32> new_volume;
    bit<16> pro_client;
}

header trade_modification_rejection_message_t {
    bit<64> response_order_number;
    bit<16> order_type;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> trader_num;
    bit<80> account_num;
    bit<16> buy_sell;
    bit<32> original_vol;
    bit<32> disclosed_vol;
    bit<32> remaining_vol;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> fok;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> filler_1;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
    bit<80> symbol;
    bit<16> series;
    bit<8> second_reserved_1;
    bit<16> book_type;
    bit<32> new_volume;
    bit<16> pro_client;
}

header control_message_to_trader_message_t {
    bit<32> trader_id;
    bit<24> action_code;
    bit<8> reserved_1;
    bit<16> msg_length;
    bit<1912> msg;
}

header error_response_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<1024> error_message;
}

header gateway_router_response_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
    bit<128> ip_address;
    bit<32> port;
    bit<64> session_key;
    bit<256> cryptographic_key;
    bit<128> cryptographic_iv_initialization_vector;
}

header box_sign_on_response_message_t {
    bit<16> box_id;
    bit<80> reserved_10;
}

header box_sign_off_message_t {
    bit<16> box_id;
}

header server_session_packet_t {
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

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    server_registration_packet_t server_registration_packet;
    logon_confirmation_body_t logon_confirmation_body;
    logon_error_body_t logon_error_body;
    system_information_response_message_t system_information_response_message;
    partial_system_information_response_message_t partial_system_information_response_message;
    update_local_database_header_message_t update_local_database_header_message;
    update_local_database_data_message_t update_local_database_data_message;
    update_local_database_trailer_message_t update_local_database_trailer_message;
    message_download_data_message_t message_download_data_message;
    board_lot_out_message_t board_lot_out_message;
    order_confirmation_response_message_t order_confirmation_response_message;
    market_price_confirmation_response_message_t market_price_confirmation_response_message;
    order_freeze_response_message_t order_freeze_response_message;
    order_error_response_message_t order_error_response_message;
    order_modification_response_message_t order_modification_response_message;
    order_modification_confirmation_response_message_t order_modification_confirmation_response_message;
    order_modification_error_response_message_t order_modification_error_response_message;
    order_cancellation_response_message_t order_cancellation_response_message;
    order_cancellation_confirmation_response_message_t order_cancellation_confirmation_response_message;
    order_cancellation_error_response_message_t order_cancellation_error_response_message;
    cancellation_of_orders_in_batch_message_t cancellation_of_orders_in_batch_message;
    negotiated_order_entered_by_counter_party_message_t negotiated_order_entered_by_counter_party_message;
    negotiated_order_to_regular_lot_message_t negotiated_order_to_regular_lot_message;
    cancel_negotiated_order_message_t cancel_negotiated_order_message;
    trade_cancellation_requested_response_message_t trade_cancellation_requested_response_message;
    trade_cancellation_error_message_t trade_cancellation_error_message;
    trade_modification_requested_response_message_t trade_modification_requested_response_message;
    trade_confirmation_message_t trade_confirmation_message;
    stop_loss_order_triggering_message_t stop_loss_order_triggering_message;
    trade_cancellation_confirmation_response_message_t trade_cancellation_confirmation_response_message;
    trade_cancellation_rejection_message_t trade_cancellation_rejection_message;
    trade_modification_confirmation_message_t trade_modification_confirmation_message;
    trade_modification_rejection_message_t trade_modification_rejection_message;
    control_message_to_trader_message_t control_message_to_trader_message;
    error_response_message_t error_response_message;
    gateway_router_response_message_t gateway_router_response_message;
    box_sign_on_response_message_t box_sign_on_response_message;
    box_sign_off_message_t box_sign_off_message;
    server_session_packet_t server_session_packet;
}

parser NseslbmOrderentryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(packet.lookahead<bit<144>>()[15:0]) {
            16w23009: parse_server_registration_packet;
            default: parse_server_session_packet;
        }
    }

    state parse_server_registration_packet {
        packet.extract(hdr.server_registration_packet);
        meta.dispatched = 1;
        transition select(hdr.server_registration_packet.transaction_code) {
            16w2301: parse_logon_response_message;
            16w1601: parse_system_information_response_message;
            16w7321: parse_partial_system_information_response_message;
            16w7307: parse_update_local_database_header_message;
            16w7304: parse_update_local_database_data_message;
            16w7308: parse_update_local_database_trailer_message;
            16w7011: parse_message_download_header_message;
            16w7021: parse_message_download_data_message;
            16w7031: parse_message_download_trailer_message;
            16w2321: parse_logoff_confirmation_response_message;
            16w2001: parse_board_lot_out_message;
            16w2073: parse_order_confirmation_response_message;
            16w2012: parse_market_price_confirmation_response_message;
            16w2170: parse_order_freeze_response_message;
            16w2231: parse_order_error_response_message;
            16w2041: parse_order_modification_response_message;
            16w2074: parse_order_modification_confirmation_response_message;
            16w2042: parse_order_modification_error_response_message;
            16w2071: parse_order_cancellation_response_message;
            16w2075: parse_order_cancellation_confirmation_response_message;
            16w2072: parse_order_cancellation_error_response_message;
            16w9002: parse_cancellation_of_orders_in_batch_message;
            16w2009: parse_negotiated_order_entered_by_counter_party_message;
            16w2008: parse_negotiated_order_to_regular_lot_message;
            16w2076: parse_cancel_negotiated_order_message;
            16w5441: parse_trade_cancellation_requested_response_message;
            16w2223: parse_trade_cancellation_error_message;
            16w5446: parse_trade_modification_requested_response_message;
            16w2222: parse_trade_confirmation_message;
            16w2212: parse_stop_loss_order_triggering_message;
            16w2282: parse_trade_cancellation_confirmation_response_message;
            16w2286: parse_trade_cancellation_rejection_message;
            16w2287: parse_trade_modification_confirmation_message;
            16w2288: parse_trade_modification_rejection_message;
            16w5295: parse_control_message_to_trader_message;
            16w2302: parse_error_response_message;
            16w2401: parse_gateway_router_response_message;
            16w23009: parse_secure_box_registration_response_message;
            16w23001: parse_box_sign_on_response_message;
            16w20322: parse_box_sign_off_message;
            default: accept;
        }
    }

    state parse_logon_response_message {
        meta.dispatched = 1;
        transition select(hdr.server_registration_packet.message_length) {
            16w212: parse_logon_confirmation_body;
            16w180: parse_logon_error_body;
            default: accept;
        }
    }

    state parse_logon_confirmation_body {
        packet.extract(hdr.logon_confirmation_body);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logon_error_body {
        packet.extract(hdr.logon_error_body);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_information_response_message {
        packet.extract(hdr.system_information_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_partial_system_information_response_message {
        packet.extract(hdr.partial_system_information_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_header_message {
        packet.extract(hdr.update_local_database_header_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_data_message {
        packet.extract(hdr.update_local_database_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_trailer_message {
        packet.extract(hdr.update_local_database_trailer_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_download_header_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_download_data_message {
        packet.extract(hdr.message_download_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_download_trailer_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logoff_confirmation_response_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_board_lot_out_message {
        packet.extract(hdr.board_lot_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_confirmation_response_message {
        packet.extract(hdr.order_confirmation_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_price_confirmation_response_message {
        packet.extract(hdr.market_price_confirmation_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_freeze_response_message {
        packet.extract(hdr.order_freeze_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_error_response_message {
        packet.extract(hdr.order_error_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_response_message {
        packet.extract(hdr.order_modification_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_confirmation_response_message {
        packet.extract(hdr.order_modification_confirmation_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_error_response_message {
        packet.extract(hdr.order_modification_error_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_response_message {
        packet.extract(hdr.order_cancellation_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_confirmation_response_message {
        packet.extract(hdr.order_cancellation_confirmation_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_error_response_message {
        packet.extract(hdr.order_cancellation_error_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancellation_of_orders_in_batch_message {
        packet.extract(hdr.cancellation_of_orders_in_batch_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_negotiated_order_entered_by_counter_party_message {
        packet.extract(hdr.negotiated_order_entered_by_counter_party_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_negotiated_order_to_regular_lot_message {
        packet.extract(hdr.negotiated_order_to_regular_lot_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_negotiated_order_message {
        packet.extract(hdr.cancel_negotiated_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancellation_requested_response_message {
        packet.extract(hdr.trade_cancellation_requested_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancellation_error_message {
        packet.extract(hdr.trade_cancellation_error_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modification_requested_response_message {
        packet.extract(hdr.trade_modification_requested_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_confirmation_message {
        packet.extract(hdr.trade_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stop_loss_order_triggering_message {
        packet.extract(hdr.stop_loss_order_triggering_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancellation_confirmation_response_message {
        packet.extract(hdr.trade_cancellation_confirmation_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancellation_rejection_message {
        packet.extract(hdr.trade_cancellation_rejection_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modification_confirmation_message {
        packet.extract(hdr.trade_modification_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modification_rejection_message {
        packet.extract(hdr.trade_modification_rejection_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_control_message_to_trader_message {
        packet.extract(hdr.control_message_to_trader_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_error_response_message {
        packet.extract(hdr.error_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_router_response_message {
        packet.extract(hdr.gateway_router_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secure_box_registration_response_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_on_response_message {
        packet.extract(hdr.box_sign_on_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_off_message {
        packet.extract(hdr.box_sign_off_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_session_packet {
        packet.extract(hdr.server_session_packet);
        transition select(hdr.server_session_packet.transaction_code) {
            16w2301: parse_logon_response_message;
            16w1601: parse_system_information_response_message;
            16w7321: parse_partial_system_information_response_message;
            16w7307: parse_update_local_database_header_message;
            16w7304: parse_update_local_database_data_message;
            16w7308: parse_update_local_database_trailer_message;
            16w7011: parse_message_download_header_message;
            16w7021: parse_message_download_data_message;
            16w7031: parse_message_download_trailer_message;
            16w2321: parse_logoff_confirmation_response_message;
            16w2001: parse_board_lot_out_message;
            16w2073: parse_order_confirmation_response_message;
            16w2012: parse_market_price_confirmation_response_message;
            16w2170: parse_order_freeze_response_message;
            16w2231: parse_order_error_response_message;
            16w2041: parse_order_modification_response_message;
            16w2074: parse_order_modification_confirmation_response_message;
            16w2042: parse_order_modification_error_response_message;
            16w2071: parse_order_cancellation_response_message;
            16w2075: parse_order_cancellation_confirmation_response_message;
            16w2072: parse_order_cancellation_error_response_message;
            16w9002: parse_cancellation_of_orders_in_batch_message;
            16w2009: parse_negotiated_order_entered_by_counter_party_message;
            16w2008: parse_negotiated_order_to_regular_lot_message;
            16w2076: parse_cancel_negotiated_order_message;
            16w5441: parse_trade_cancellation_requested_response_message;
            16w2223: parse_trade_cancellation_error_message;
            16w5446: parse_trade_modification_requested_response_message;
            16w2222: parse_trade_confirmation_message;
            16w2212: parse_stop_loss_order_triggering_message;
            16w2282: parse_trade_cancellation_confirmation_response_message;
            16w2286: parse_trade_cancellation_rejection_message;
            16w2287: parse_trade_modification_confirmation_message;
            16w2288: parse_trade_modification_rejection_message;
            16w5295: parse_control_message_to_trader_message;
            16w2302: parse_error_response_message;
            16w2401: parse_gateway_router_response_message;
            16w23009: parse_secure_box_registration_response_message;
            16w23001: parse_box_sign_on_response_message;
            16w20322: parse_box_sign_off_message;
            default: accept;
        }
    }

}

control NseslbmOrderentryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseslbmOrderentryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NseslbmOrderentryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NseslbmOrderentryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseslbmOrderentryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.server_registration_packet);
        packet.emit(hdr.logon_confirmation_body);
        packet.emit(hdr.logon_error_body);
        packet.emit(hdr.system_information_response_message);
        packet.emit(hdr.partial_system_information_response_message);
        packet.emit(hdr.update_local_database_header_message);
        packet.emit(hdr.update_local_database_data_message);
        packet.emit(hdr.update_local_database_trailer_message);
        packet.emit(hdr.message_download_data_message);
        packet.emit(hdr.board_lot_out_message);
        packet.emit(hdr.order_confirmation_response_message);
        packet.emit(hdr.market_price_confirmation_response_message);
        packet.emit(hdr.order_freeze_response_message);
        packet.emit(hdr.order_error_response_message);
        packet.emit(hdr.order_modification_response_message);
        packet.emit(hdr.order_modification_confirmation_response_message);
        packet.emit(hdr.order_modification_error_response_message);
        packet.emit(hdr.order_cancellation_response_message);
        packet.emit(hdr.order_cancellation_confirmation_response_message);
        packet.emit(hdr.order_cancellation_error_response_message);
        packet.emit(hdr.cancellation_of_orders_in_batch_message);
        packet.emit(hdr.negotiated_order_entered_by_counter_party_message);
        packet.emit(hdr.negotiated_order_to_regular_lot_message);
        packet.emit(hdr.cancel_negotiated_order_message);
        packet.emit(hdr.trade_cancellation_requested_response_message);
        packet.emit(hdr.trade_cancellation_error_message);
        packet.emit(hdr.trade_modification_requested_response_message);
        packet.emit(hdr.trade_confirmation_message);
        packet.emit(hdr.stop_loss_order_triggering_message);
        packet.emit(hdr.trade_cancellation_confirmation_response_message);
        packet.emit(hdr.trade_cancellation_rejection_message);
        packet.emit(hdr.trade_modification_confirmation_message);
        packet.emit(hdr.trade_modification_rejection_message);
        packet.emit(hdr.control_message_to_trader_message);
        packet.emit(hdr.error_response_message);
        packet.emit(hdr.gateway_router_response_message);
        packet.emit(hdr.box_sign_on_response_message);
        packet.emit(hdr.box_sign_off_message);
        packet.emit(hdr.server_session_packet);
    }
}

V1Switch(
    NseslbmOrderentryServerParser(),
    NseslbmOrderentryServerVerifyChecksum(),
    NseslbmOrderentryServerIngress(),
    NseslbmOrderentryServerEgress(),
    NseslbmOrderentryServerComputeChecksum(),
    NseslbmOrderentryServerDeparser()
) main;
