// P4_16 (v1model) definition for: Nse NseFo DropCopy NnfDc v3.0
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Drop Copy
//   Encoding: Non-Neat Front End Drop Copy
//   Version: 3.0
//   Date: 9/2/2026
//   Specification: DC_FO_Normal_DROPCOPY_PROTOCOL_3.0_20260902172916.pdf
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
    bit<8> environment_type;
    bit<8> compression_indicator;
    bit<16> transaction_code;
    bit<16> error_code;
    bit<64> sequence_number;
    bit<16> message_length;
}

header gr_response_message_t {
    bit<16> message_indicator;
    bit<16> partition_count;
    bit<128> ip_address;
    bit<32> port;
    bit<48> partition_id;
    bit<64> session_key;
    bit<256> cryptographic_key;
    bit<64> static_cryptographic_iv;
    bit<64> dynamic_cryptographic_iv;
    bit<96> cryptographic_additional_key;
}

header dc_signon_out_message_t {
    bit<32> user_id;
    bit<48> partition_id;
    bit<16> concurrent_login_id;
}

header dc_sign_off_message_t {
    bit<32> user_id;
    bit<48> partition_id;
    bit<16> concurrent_login_id;
}

header dc_error_response_trade_message_t {
    bit<1024> error_message;
}

header dc_error_response_order_message_t {
    bit<1024> error_message;
}

header trade_confirmation_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header trade_cancel_confirm_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header trade_cancel_reject_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header trade_modify_confirm_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header trade_modify_rejected_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header giveup_app_confirm_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header giveup_rej_confirm_message_t {
    bit<64> order_number;
    bit<32> trader_number;
    bit<16> buy_sell;
    bit<32> original_volume;
    bit<32> disclosed_volume;
    bit<32> remaining_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> token;
    bit<16> book_type;
    bit<16> pro_client_short_2;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<64> nnf_field;
    bit<16> segment_short_2;
    bit<40> broker_id;
    bit<8> filler;
    bit<80> pan;
    bit<80> account_number;
    bit<96> settlor;
    bit<8> giveup_flag;
    bit<8> open_close;
    bit<96> participant;
    bit<16> reason_code;
}

header price_confirmation_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header order_mod_reject_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header order_cancel_reject_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header order_confirmation_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header order_mod_confirmation_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header order_cancel_confirmation_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header freeze_to_control_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header on_stop_notification_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header order_error_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header batch_order_cancel_message_t {
    bit<16> reason_code;
    bit<32> token;
    bit<64> order_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_volume;
    bit<32> disclosed_vol_remaining;
    bit<32> total_vol_remaining;
    bit<32> volume;
    bit<32> price;
    bit<32> trigger_price;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> reserved_2;
    bit<16> second_reserved_2;
    bit<16> third_reserved_2;
    bit<8> suspended;
    bit<8> open_close;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> reserved_1;
    bit<96> settlor;
    bit<32> reference_id;
}

header sp_order_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header twol_order_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header thrl_order_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header sp_order_cxl_rejected_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header sp_order_cxl_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header twol_order_cxl_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header thrl_order_cxl_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header sp_order_mod_reject_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header sp_order_mod_confirmation_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header sp_order_rejected_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header twol_order_error_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header thrl_order_error_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

header batch_spread_cxl_out_message_t {
    bit<32> token_1;
    bit<64> order_number_1;
    bit<16> book_type_1;
    bit<16> buy_sell_1;
    bit<32> total_vol_remaining_1;
    bit<32> volume_1;
    bit<1> mf;
    bit<1> aon;
    bit<1> ioc;
    bit<1> gtc;
    bit<1> day;
    bit<1> on_stop;
    bit<1> mkt;
    bit<1> ato;
    bit<1> order_flags_reserved_7;
    bit<1> stpc;
    bit<1> boc;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id_1;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<80> pan;
    bit<80> account_number_1;
    bit<8> pro_client_1;
    bit<8> segment_char_1;
    bit<8> open_close_1;
    bit<8> reserved_1;
    bit<96> settlor_1;
    bit<32> price_diff;
    bit<32> reference_id;
    bit<16> reason_code;
    bit<32> token_2;
    bit<16> buy_sell_2;
    bit<32> total_vol_remaining_2;
    bit<32> volume_2;
    bit<1> mf_2;
    bit<1> aon_2;
    bit<1> ioc_2;
    bit<1> gtc_2;
    bit<1> day_2;
    bit<1> on_stop_2;
    bit<1> mkt_2;
    bit<1> ato_2;
    bit<1> order_flags_reserved_7_2;
    bit<1> stpc_2;
    bit<1> boc_2;
    bit<1> preopen_2;
    bit<1> frozen_2;
    bit<1> modified_2;
    bit<1> traded_2;
    bit<1> matched_ind_2;
    bit<8> open_close_2;
    bit<8> reserved_1_2;
    bit<32> token_2_2;
    bit<16> buy_sell_2_2;
    bit<32> total_vol_remaining_2_2;
    bit<32> volume_2_2;
    bit<1> mf_3;
    bit<1> aon_3;
    bit<1> ioc_3;
    bit<1> gtc_3;
    bit<1> day_3;
    bit<1> on_stop_3;
    bit<1> mkt_3;
    bit<1> ato_3;
    bit<1> order_flags_reserved_7_3;
    bit<1> stpc_3;
    bit<1> boc_3;
    bit<1> preopen_3;
    bit<1> frozen_3;
    bit<1> modified_3;
    bit<1> traded_3;
    bit<1> matched_ind_3;
    bit<8> open_close_2_2;
    bit<8> reserved_1_3;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    gr_response_message_t gr_response_message;
    dc_signon_out_message_t dc_signon_out_message;
    dc_sign_off_message_t dc_sign_off_message;
    dc_error_response_trade_message_t dc_error_response_trade_message;
    dc_error_response_order_message_t dc_error_response_order_message;
    trade_confirmation_message_t trade_confirmation_message;
    trade_cancel_confirm_message_t trade_cancel_confirm_message;
    trade_cancel_reject_message_t trade_cancel_reject_message;
    trade_modify_confirm_message_t trade_modify_confirm_message;
    trade_modify_rejected_message_t trade_modify_rejected_message;
    giveup_app_confirm_message_t giveup_app_confirm_message;
    giveup_rej_confirm_message_t giveup_rej_confirm_message;
    price_confirmation_message_t price_confirmation_message;
    order_mod_reject_message_t order_mod_reject_message;
    order_cancel_reject_message_t order_cancel_reject_message;
    order_confirmation_message_t order_confirmation_message;
    order_mod_confirmation_message_t order_mod_confirmation_message;
    order_cancel_confirmation_message_t order_cancel_confirmation_message;
    freeze_to_control_message_t freeze_to_control_message;
    on_stop_notification_message_t on_stop_notification_message;
    order_error_message_t order_error_message;
    batch_order_cancel_message_t batch_order_cancel_message;
    sp_order_confirmation_message_t sp_order_confirmation_message;
    twol_order_confirmation_message_t twol_order_confirmation_message;
    thrl_order_confirmation_message_t thrl_order_confirmation_message;
    sp_order_cxl_rejected_message_t sp_order_cxl_rejected_message;
    sp_order_cxl_confirmation_message_t sp_order_cxl_confirmation_message;
    twol_order_cxl_confirmation_message_t twol_order_cxl_confirmation_message;
    thrl_order_cxl_confirmation_message_t thrl_order_cxl_confirmation_message;
    sp_order_mod_reject_message_t sp_order_mod_reject_message;
    sp_order_mod_confirmation_message_t sp_order_mod_confirmation_message;
    sp_order_rejected_message_t sp_order_rejected_message;
    twol_order_error_message_t twol_order_error_message;
    thrl_order_error_message_t thrl_order_error_message;
    batch_spread_cxl_out_message_t batch_spread_cxl_out_message;
}

parser NsefoDropcopyServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w2401: parse_gr_response_message;
            16w23009: parse_gr_secure_user_registration_response_message;
            16w2501: parse_dc_signon_out_message;
            16w2320: parse_dc_sign_off_message;
            16w8006: parse_dc_error_response_trade_message;
            16w9006: parse_dc_error_response_order_message;
            16w2222: parse_trade_confirmation_message;
            16w2282: parse_trade_cancel_confirm_message;
            16w2286: parse_trade_cancel_reject_message;
            16w2287: parse_trade_modify_confirm_message;
            16w2288: parse_trade_modify_rejected_message;
            16w4506: parse_giveup_app_confirm_message;
            16w4507: parse_giveup_rej_confirm_message;
            16w2012: parse_price_confirmation_message;
            16w2042: parse_order_mod_reject_message;
            16w2072: parse_order_cancel_reject_message;
            16w2073: parse_order_confirmation_message;
            16w2074: parse_order_mod_confirmation_message;
            16w2075: parse_order_cancel_confirmation_message;
            16w2170: parse_freeze_to_control_message;
            16w2212: parse_on_stop_notification_message;
            16w2231: parse_order_error_message;
            16w9002: parse_batch_order_cancel_message;
            16w2124: parse_sp_order_confirmation_message;
            16w2125: parse_twol_order_confirmation_message;
            16w2126: parse_thrl_order_confirmation_message;
            16w2127: parse_sp_order_cxl_rejected_message;
            16w2130: parse_sp_order_cxl_confirmation_message;
            16w2131: parse_twol_order_cxl_confirmation_message;
            16w2132: parse_thrl_order_cxl_confirmation_message;
            16w2133: parse_sp_order_mod_reject_message;
            16w2136: parse_sp_order_mod_confirmation_message;
            16w2154: parse_sp_order_rejected_message;
            16w2155: parse_twol_order_error_message;
            16w2156: parse_thrl_order_error_message;
            16w9004: parse_batch_spread_cxl_out_message;
            default: accept;
        }
    }

    state parse_gr_response_message {
        packet.extract(hdr.gr_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gr_secure_user_registration_response_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_signon_out_message {
        packet.extract(hdr.dc_signon_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_sign_off_message {
        packet.extract(hdr.dc_sign_off_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_error_response_trade_message {
        packet.extract(hdr.dc_error_response_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_dc_error_response_order_message {
        packet.extract(hdr.dc_error_response_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_confirmation_message {
        packet.extract(hdr.trade_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancel_confirm_message {
        packet.extract(hdr.trade_cancel_confirm_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_cancel_reject_message {
        packet.extract(hdr.trade_cancel_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modify_confirm_message {
        packet.extract(hdr.trade_modify_confirm_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modify_rejected_message {
        packet.extract(hdr.trade_modify_rejected_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_giveup_app_confirm_message {
        packet.extract(hdr.giveup_app_confirm_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_giveup_rej_confirm_message {
        packet.extract(hdr.giveup_rej_confirm_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_price_confirmation_message {
        packet.extract(hdr.price_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mod_reject_message {
        packet.extract(hdr.order_mod_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_reject_message {
        packet.extract(hdr.order_cancel_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_confirmation_message {
        packet.extract(hdr.order_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mod_confirmation_message {
        packet.extract(hdr.order_mod_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_confirmation_message {
        packet.extract(hdr.order_cancel_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_freeze_to_control_message {
        packet.extract(hdr.freeze_to_control_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_on_stop_notification_message {
        packet.extract(hdr.on_stop_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_error_message {
        packet.extract(hdr.order_error_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_batch_order_cancel_message {
        packet.extract(hdr.batch_order_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_confirmation_message {
        packet.extract(hdr.sp_order_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_twol_order_confirmation_message {
        packet.extract(hdr.twol_order_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_thrl_order_confirmation_message {
        packet.extract(hdr.thrl_order_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_cxl_rejected_message {
        packet.extract(hdr.sp_order_cxl_rejected_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_cxl_confirmation_message {
        packet.extract(hdr.sp_order_cxl_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_twol_order_cxl_confirmation_message {
        packet.extract(hdr.twol_order_cxl_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_thrl_order_cxl_confirmation_message {
        packet.extract(hdr.thrl_order_cxl_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_mod_reject_message {
        packet.extract(hdr.sp_order_mod_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_mod_confirmation_message {
        packet.extract(hdr.sp_order_mod_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sp_order_rejected_message {
        packet.extract(hdr.sp_order_rejected_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_twol_order_error_message {
        packet.extract(hdr.twol_order_error_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_thrl_order_error_message {
        packet.extract(hdr.thrl_order_error_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_batch_spread_cxl_out_message {
        packet.extract(hdr.batch_spread_cxl_out_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsefoDropcopyServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoDropcopyServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsefoDropcopyServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsefoDropcopyServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsefoDropcopyServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.gr_response_message);
        packet.emit(hdr.dc_signon_out_message);
        packet.emit(hdr.dc_sign_off_message);
        packet.emit(hdr.dc_error_response_trade_message);
        packet.emit(hdr.dc_error_response_order_message);
        packet.emit(hdr.trade_confirmation_message);
        packet.emit(hdr.trade_cancel_confirm_message);
        packet.emit(hdr.trade_cancel_reject_message);
        packet.emit(hdr.trade_modify_confirm_message);
        packet.emit(hdr.trade_modify_rejected_message);
        packet.emit(hdr.giveup_app_confirm_message);
        packet.emit(hdr.giveup_rej_confirm_message);
        packet.emit(hdr.price_confirmation_message);
        packet.emit(hdr.order_mod_reject_message);
        packet.emit(hdr.order_cancel_reject_message);
        packet.emit(hdr.order_confirmation_message);
        packet.emit(hdr.order_mod_confirmation_message);
        packet.emit(hdr.order_cancel_confirmation_message);
        packet.emit(hdr.freeze_to_control_message);
        packet.emit(hdr.on_stop_notification_message);
        packet.emit(hdr.order_error_message);
        packet.emit(hdr.batch_order_cancel_message);
        packet.emit(hdr.sp_order_confirmation_message);
        packet.emit(hdr.twol_order_confirmation_message);
        packet.emit(hdr.thrl_order_confirmation_message);
        packet.emit(hdr.sp_order_cxl_rejected_message);
        packet.emit(hdr.sp_order_cxl_confirmation_message);
        packet.emit(hdr.twol_order_cxl_confirmation_message);
        packet.emit(hdr.thrl_order_cxl_confirmation_message);
        packet.emit(hdr.sp_order_mod_reject_message);
        packet.emit(hdr.sp_order_mod_confirmation_message);
        packet.emit(hdr.sp_order_rejected_message);
        packet.emit(hdr.twol_order_error_message);
        packet.emit(hdr.thrl_order_error_message);
        packet.emit(hdr.batch_spread_cxl_out_message);
    }
}

V1Switch(
    NsefoDropcopyServerParser(),
    NsefoDropcopyServerVerifyChecksum(),
    NsefoDropcopyServerIngress(),
    NsefoDropcopyServerEgress(),
    NsefoDropcopyServerComputeChecksum(),
    NsefoDropcopyServerDeparser()
) main;
