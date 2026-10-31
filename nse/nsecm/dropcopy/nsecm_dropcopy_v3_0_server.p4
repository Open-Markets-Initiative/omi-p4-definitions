// P4_16 (v1model) definition for: Nse NseCm DropCopy NnfDc v3.0
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Drop Copy
//   Encoding: Non-Neat Front End Drop Copy
//   Version: 3.0
//   Date: 9/1/2025
//   Specification: DC_CM_Normal_DROPCOPY_PROTOCOL_3.0_0.pdf
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
    bit<128> cryptographic_iv;
}

header dc_signon_out_message_t {
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
    bit<1> order_flags_reserved_5;
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
    bit<1> order_flags_reserved_5;
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
    bit<1> order_flags_reserved_5;
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
    bit<1> order_flags_reserved_5;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
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
    bit<1> order_flags_reserved_5;
    bit<1> preopen;
    bit<1> frozen;
    bit<1> modified;
    bit<1> traded;
    bit<1> matched_ind;
    bit<32> trader_id;
    bit<64> nnf_field;
    bit<32> algo_id;
    bit<64> activity_time_in_nanos;
    bit<16> competitor_period;
    bit<16> solicitor_period;
    bit<16> auction_number;
    bit<8> suspended;
    bit<8> filler;
    bit<80> pan;
    bit<8> segment_char_1;
    bit<8> participant_type;
    bit<80> account_number;
    bit<8> pro_client_char_1;
    bit<8> settlement_type;
    bit<96> settlor;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    gr_response_message_t gr_response_message;
    dc_signon_out_message_t dc_signon_out_message;
    dc_error_response_trade_message_t dc_error_response_trade_message;
    dc_error_response_order_message_t dc_error_response_order_message;
    trade_confirmation_message_t trade_confirmation_message;
    trade_cancel_confirm_message_t trade_cancel_confirm_message;
    trade_cancel_reject_message_t trade_cancel_reject_message;
    trade_modify_confirm_message_t trade_modify_confirm_message;
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
}

parser NsecmDropcopyServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w2401: parse_gr_response_message;
            16w23009: parse_gr_secure_user_registration_response_message;
            16w2501: parse_dc_signon_out_message;
            16w8006: parse_dc_error_response_trade_message;
            16w9006: parse_dc_error_response_order_message;
            16w2222: parse_trade_confirmation_message;
            16w2282: parse_trade_cancel_confirm_message;
            16w2286: parse_trade_cancel_reject_message;
            16w2287: parse_trade_modify_confirm_message;
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

}

control NsecmDropcopyServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmDropcopyServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmDropcopyServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmDropcopyServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmDropcopyServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.gr_response_message);
        packet.emit(hdr.dc_signon_out_message);
        packet.emit(hdr.dc_error_response_trade_message);
        packet.emit(hdr.dc_error_response_order_message);
        packet.emit(hdr.trade_confirmation_message);
        packet.emit(hdr.trade_cancel_confirm_message);
        packet.emit(hdr.trade_cancel_reject_message);
        packet.emit(hdr.trade_modify_confirm_message);
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
    }
}

V1Switch(
    NsecmDropcopyServerParser(),
    NsecmDropcopyServerVerifyChecksum(),
    NsecmDropcopyServerIngress(),
    NsecmDropcopyServerEgress(),
    NsecmDropcopyServerComputeChecksum(),
    NsecmDropcopyServerDeparser()
) main;
