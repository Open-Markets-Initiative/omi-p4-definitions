// P4_16 (v1model) definition for: Nse NseCm OrderEntry Nnf v6.6
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End
//   Version: 6.6
//   Date: 8/3/2026
//   Specification: TP_CM_Trimmed_NNF_PROTOCOL_6.6_20260803151116.pdf
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

header auction_inquiry_response_message_t {
    bit<16> number_of_records;
}

header auction_inquiry_response_message_inquirydata_t {
    bit<32> token;
    bit<16> auction_number;
    bit<16> auction_status;
    bit<16> initiator_type;
    bit<32> total_buy;
    bit<32> best_buy_price;
    bit<32> total_sell;
    bit<32> best_sell_price;
    bit<32> auctioin_price;
    bit<32> auction_quantity;
    bit<16> settlement_period;
}

header branch_order_value_limit_update_out_message_t {
    bit<40> broker_id;
    bit<200> reserved_25;
    bit<16> branch;
    bit<64> branch_buy_value_limit;
    bit<64> reserved_8;
    bit<64> branch_sell_value_limit;
    bit<64> second_reserved_8;
}

header cancel_on_logout_status_response_message_t {
    bit<32> user_id;
    bit<8> colo_user_bit;
    bit<8> reserved_1;
}

header error_response_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<1024> error_message;
}

header secure_box_registration_request_message_t {
    bit<16> box_id;
}

header box_sign_on_response_message_t {
    bit<16> box_id;
    bit<80> reserved_10;
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

header control_message_to_trader_message_t {
    bit<32> trader_id;
    bit<24> action_code;
    bit<8> reserved_1;
    bit<16> msg_length;
    bit<1920> msg;
}

header trade_confirmation_message_t {
    bit<64> response_order_number;
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
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> preopen;
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
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_entry_out_message_t {
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
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> preopen;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<200> oe_remarks;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_type;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<32> second_reserved_4;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header order_entry_short_message_t {
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
    bit<32> good_till_date;
    bit<32> entry_date_time;
    bit<32> min_fill_aon;
    bit<32> last_modified;
    bit<1> ato;
    bit<1> mkt;
    bit<1> on_stop;
    bit<1> day;
    bit<1> gtc;
    bit<1> ioc;
    bit<1> aon;
    bit<1> mf;
    bit<1> matched_ind;
    bit<1> traded;
    bit<1> modified;
    bit<1> frozen;
    bit<1> preopen;
    bit<1> order_flags_reserved_three;
    bit<1> stpc;
    bit<1> order_flags_reserved_one;
    bit<16> branch_id;
    bit<32> trader_id;
    bit<40> broker_id;
    bit<200> oe_remarks;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_type;
    bit<64> nnf_field;
    bit<64> exec_time_stamp;
    bit<32> second_reserved_4;
}

header order_limit_update_out_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> user_id;
    bit<64> order_qty_limit;
    bit<64> order_val_limit;
    bit<16> reserved_2;
}

header password_reset_out_message_t {
    bit<32> user_id;
    bit<112> reserved_14;
}

header security_status_change_message_t {
    bit<16> number_of_records;
}

header security_status_change_message_token_and_eligibility_t {
    bit<32> token;
}

header security_master_change_message_t {
    bit<32> token;
    bit<80> symbol;
    bit<16> series;
    bit<16> instrument_type;
    bit<16> permitted_to_trade;
    bit<64> issued_capital;
    bit<16> settlement_type;
    bit<16> freeze_percent;
    bit<152> credit_rating;
    bit<8> reserved_1;
}

header security_master_change_message_secuirity_eligibility_per_market_t {
    bit<1> eligibility;
    bit<7> security_eligibility_reserved;
    bit<8> reserved_1;
    bit<16> status;
}

header sign_on_request_out_message_t {
    bit<32> user_id;
    bit<64> reserved_8;
    bit<64> password;
    bit<64> second_reserved_8;
    bit<64> new_password;
    bit<208> trader_name;
    bit<32> last_password_change_date_time;
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<16> branch_id;
    bit<32> version_number;
    bit<448> reserved_56;
    bit<16> user_type;
    bit<64> sequence_number;
    bit<112> workstation_number;
    bit<8> broker_status;
    bit<8> show_index;
    bit<1> normal_market;
    bit<1> oddlot_market;
    bit<1> spot_market;
    bit<1> auction_market;
    bit<1> call_auction_11;
    bit<1> call_auction_21;
    bit<2> broker_eligibility_reserved_lower;
    bit<7> broker_eligibility_reserved_upper;
    bit<1> preopen;
    bit<208> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header sign_on_response_message_t {
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
    bit<1> call_auction_11;
    bit<1> call_auction_21;
    bit<2> broker_eligibility_reserved_lower;
    bit<7> broker_eligibility_reserved_upper;
    bit<1> preopen;
    bit<208> broker_name;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
}

header system_information_message_t {
    bit<16> normal;
    bit<16> oddlot;
    bit<16> spot;
    bit<16> auction;
    bit<16> call_auction_1_short_2;
    bit<16> call_auction_2_short_2;
    bit<32> market_index;
    bit<16> default_settlement_period;
    bit<16> second_default_settlement_period;
    bit<16> third_default_settlement_period;
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
    bit<5> security_eligible_reserved;
    bit<8> reserved_1;
    bit<16> disclosed_quantity_percent_allowed;
    bit<48> reserved_6;
}

header trade_inquiry_out_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<16> market_type;
    bit<32> new_volume;
    bit<192> reserved_24;
    bit<40> buy_broker_id;
    bit<40> sell_broker_id;
    bit<32> trader_id;
    bit<16> requested_by;
    bit<80> buy_account_number;
    bit<80> sell_account_number;
    bit<80> buy_pan;
    bit<80> sell_pan;
    bit<480> reserved_60;
}

header update_local_database_header_message_t {
    bit<16> reserved_2;
}

header update_local_database_trailer_message_t {
    bit<16> reserved_2;
}

header user_unlock_approval_rejection_message_t {
    bit<32> user_id;
}

header user_unlock_requested_response_message_t {
    bit<32> user_id;
}

header user_order_value_limit_update_out_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<16> branch;
    bit<208> reserved_26;
    bit<32> user_id;
    bit<128> reserved_16;
    bit<64> user_order_buy_value_limit;
    bit<192> reserved_24;
    bit<64> user_order_sell_value_limit;
    bit<64> reserved_8;
}

header trade_modification_cancellation_status_response_message_t {
    bit<32> user_id;
    bit<8> trd_mod_cxl_bit;
    bit<8> reserved_1;
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

struct metadata_t {
    bit<1> dispatched;
    bit<16> auction_inquiry_response_message_inquirydata_remaining;
    bit<16> security_status_change_message_token_and_eligibility_remaining;
    bit<16> security_master_change_message_secuirity_eligibility_per_market_remaining;
}

struct headers_t {
    message_header_t message_header;
    auction_inquiry_response_message_t auction_inquiry_response_message;
    auction_inquiry_response_message_inquirydata_t auction_inquiry_response_message_inquirydata[MAX_MESSAGES];
    branch_order_value_limit_update_out_message_t branch_order_value_limit_update_out_message;
    cancel_on_logout_status_response_message_t cancel_on_logout_status_response_message;
    error_response_message_t error_response_message;
    secure_box_registration_request_message_t secure_box_registration_request_message;
    box_sign_on_response_message_t box_sign_on_response_message;
    gateway_router_response_message_t gateway_router_response_message;
    existing_encryption_tail_t existing_encryption_tail;
    new_encryption_tail_t new_encryption_tail;
    control_message_to_trader_message_t control_message_to_trader_message;
    trade_confirmation_message_t trade_confirmation_message;
    order_entry_out_message_t order_entry_out_message;
    order_entry_short_message_t order_entry_short_message;
    order_limit_update_out_message_t order_limit_update_out_message;
    password_reset_out_message_t password_reset_out_message;
    security_status_change_message_t security_status_change_message;
    security_status_change_message_token_and_eligibility_t security_status_change_message_token_and_eligibility[MAX_MESSAGES];
    security_master_change_message_t security_master_change_message;
    security_master_change_message_secuirity_eligibility_per_market_t security_master_change_message_secuirity_eligibility_per_market[MAX_MESSAGES];
    sign_on_request_out_message_t sign_on_request_out_message;
    sign_on_response_message_t sign_on_response_message;
    system_information_message_t system_information_message;
    trade_inquiry_out_message_t trade_inquiry_out_message;
    update_local_database_header_message_t update_local_database_header_message;
    update_local_database_trailer_message_t update_local_database_trailer_message;
    user_unlock_approval_rejection_message_t user_unlock_approval_rejection_message;
    user_unlock_requested_response_message_t user_unlock_requested_response_message;
    user_order_value_limit_update_out_message_t user_order_value_limit_update_out_message;
    trade_modification_cancellation_status_response_message_t trade_modification_cancellation_status_response_message;
    update_local_database_data_message_t update_local_database_data_message;
}

parser NsecmOrderentryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w18017: parse_auction_inquiry_response_message;
            16w5717: parse_branch_order_value_limit_update_out_message;
            16w5791: parse_cancel_on_logout_status_response_message;
            16w2302: parse_error_response_message;
            16w23008: parse_secure_box_registration_request_message;
            16w23001: parse_box_sign_on_response_message;
            16w2401: parse_gateway_router_response_message;
            16w5295: parse_control_message_to_trader_message;
            16w2212: parse_trade_confirmation_message;
            16w2222: parse_trade_confirmation_message;
            16w2282: parse_trade_confirmation_message;
            16w2286: parse_trade_confirmation_message;
            16w2287: parse_trade_confirmation_message;
            16w2012: parse_order_entry_out_message;
            16w2042: parse_order_entry_out_message;
            16w2061: parse_order_entry_out_message;
            16w2072: parse_order_entry_out_message;
            16w2073: parse_order_entry_out_message;
            16w2074: parse_order_entry_out_message;
            16w2075: parse_order_entry_out_message;
            16w2170: parse_order_entry_out_message;
            16w2231: parse_order_entry_out_message;
            16w9002: parse_order_entry_out_message;
            16w2001: parse_order_entry_short_message;
            16w2071: parse_order_entry_short_message;
            16w5722: parse_order_limit_update_out_message;
            16w5739: parse_password_reset_out_message;
            16w18130: parse_security_status_change_message;
            16w18707: parse_security_status_change_message;
            16w18720: parse_security_master_change_message;
            16w5724: parse_sign_on_request_out_message;
            16w2301: parse_sign_on_response_message;
            16w1601: parse_system_information_message;
            16w7321: parse_system_information_message;
            16w2223: parse_trade_inquiry_out_message;
            16w5441: parse_trade_inquiry_out_message;
            16w7307: parse_update_local_database_header_message;
            16w7308: parse_update_local_database_trailer_message;
            16w5575: parse_user_unlock_approval_rejection_message;
            16w5579: parse_user_unlock_approval_rejection_message;
            16w5425: parse_user_unlock_requested_response_message;
            16w5720: parse_user_order_value_limit_update_out_message;
            16w5793: parse_trade_modification_cancellation_status_response_message;
            16w2321: parse_sign_off_confirmation_message;
            16w7011: parse_header_record_message;
            16w7021: parse_message_record_message;
            16w7031: parse_trailer_record_message;
            16w23009: parse_secure_box_registration_response_message;
            16w7304: parse_update_local_database_data_message;
            default: accept;
        }
    }

    state parse_auction_inquiry_response_message {
        packet.extract(hdr.auction_inquiry_response_message);
        meta.dispatched = 1;
        meta.auction_inquiry_response_message_inquirydata_remaining = 16w5;
        transition parse_auction_inquiry_response_message_inquirydata;
    }

    state parse_auction_inquiry_response_message_inquirydata {
        packet.extract(hdr.auction_inquiry_response_message_inquirydata.next);
        meta.auction_inquiry_response_message_inquirydata_remaining = meta.auction_inquiry_response_message_inquirydata_remaining - 1;
        transition select(meta.auction_inquiry_response_message_inquirydata_remaining) {
            16w0: accept;
            default: parse_auction_inquiry_response_message_inquirydata;
        }
    }

    state parse_branch_order_value_limit_update_out_message {
        packet.extract(hdr.branch_order_value_limit_update_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_on_logout_status_response_message {
        packet.extract(hdr.cancel_on_logout_status_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_error_response_message {
        packet.extract(hdr.error_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secure_box_registration_request_message {
        packet.extract(hdr.secure_box_registration_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_on_response_message {
        packet.extract(hdr.box_sign_on_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_router_response_message {
        packet.extract(hdr.gateway_router_response_message);
        meta.dispatched = 1;
        transition select(hdr.message_header.message_length) {
            16w124: parse_existing_encryption_tail;
            16w136: parse_new_encryption_tail;
            default: accept;
        }
    }

    state parse_existing_encryption_tail {
        packet.extract(hdr.existing_encryption_tail);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_encryption_tail {
        packet.extract(hdr.new_encryption_tail);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_control_message_to_trader_message {
        packet.extract(hdr.control_message_to_trader_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_confirmation_message {
        packet.extract(hdr.trade_confirmation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_entry_out_message {
        packet.extract(hdr.order_entry_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_entry_short_message {
        packet.extract(hdr.order_entry_short_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_limit_update_out_message {
        packet.extract(hdr.order_limit_update_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_password_reset_out_message {
        packet.extract(hdr.password_reset_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_status_change_message {
        packet.extract(hdr.security_status_change_message);
        meta.dispatched = 1;
        meta.security_status_change_message_token_and_eligibility_remaining = 16w25;
        transition parse_security_status_change_message_token_and_eligibility;
    }

    state parse_security_status_change_message_token_and_eligibility {
        packet.extract(hdr.security_status_change_message_token_and_eligibility.next);
        meta.security_status_change_message_token_and_eligibility_remaining = meta.security_status_change_message_token_and_eligibility_remaining - 1;
        transition select(meta.security_status_change_message_token_and_eligibility_remaining) {
            16w0: accept;
            default: parse_security_status_change_message_token_and_eligibility;
        }
    }

    state parse_security_master_change_message {
        packet.extract(hdr.security_master_change_message);
        meta.dispatched = 1;
        meta.security_master_change_message_secuirity_eligibility_per_market_remaining = 16w6;
        transition parse_security_master_change_message_secuirity_eligibility_per_market;
    }

    state parse_security_master_change_message_secuirity_eligibility_per_market {
        packet.extract(hdr.security_master_change_message_secuirity_eligibility_per_market.next);
        meta.security_master_change_message_secuirity_eligibility_per_market_remaining = meta.security_master_change_message_secuirity_eligibility_per_market_remaining - 1;
        transition select(meta.security_master_change_message_secuirity_eligibility_per_market_remaining) {
            16w0: accept;
            default: parse_security_master_change_message_secuirity_eligibility_per_market;
        }
    }

    state parse_sign_on_request_out_message {
        packet.extract(hdr.sign_on_request_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sign_on_response_message {
        packet.extract(hdr.sign_on_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_information_message {
        packet.extract(hdr.system_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_inquiry_out_message {
        packet.extract(hdr.trade_inquiry_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_header_message {
        packet.extract(hdr.update_local_database_header_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_trailer_message {
        packet.extract(hdr.update_local_database_trailer_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_unlock_approval_rejection_message {
        packet.extract(hdr.user_unlock_approval_rejection_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_unlock_requested_response_message {
        packet.extract(hdr.user_unlock_requested_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_order_value_limit_update_out_message {
        packet.extract(hdr.user_order_value_limit_update_out_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modification_cancellation_status_response_message {
        packet.extract(hdr.trade_modification_cancellation_status_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sign_off_confirmation_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_header_record_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_record_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trailer_record_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secure_box_registration_response_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_data_message {
        packet.extract(hdr.update_local_database_data_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmOrderentryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmOrderentryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmOrderentryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmOrderentryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmOrderentryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.auction_inquiry_response_message);
        packet.emit(hdr.auction_inquiry_response_message_inquirydata);
        packet.emit(hdr.branch_order_value_limit_update_out_message);
        packet.emit(hdr.cancel_on_logout_status_response_message);
        packet.emit(hdr.error_response_message);
        packet.emit(hdr.secure_box_registration_request_message);
        packet.emit(hdr.box_sign_on_response_message);
        packet.emit(hdr.gateway_router_response_message);
        packet.emit(hdr.existing_encryption_tail);
        packet.emit(hdr.new_encryption_tail);
        packet.emit(hdr.control_message_to_trader_message);
        packet.emit(hdr.trade_confirmation_message);
        packet.emit(hdr.order_entry_out_message);
        packet.emit(hdr.order_entry_short_message);
        packet.emit(hdr.order_limit_update_out_message);
        packet.emit(hdr.password_reset_out_message);
        packet.emit(hdr.security_status_change_message);
        packet.emit(hdr.security_status_change_message_token_and_eligibility);
        packet.emit(hdr.security_master_change_message);
        packet.emit(hdr.security_master_change_message_secuirity_eligibility_per_market);
        packet.emit(hdr.sign_on_request_out_message);
        packet.emit(hdr.sign_on_response_message);
        packet.emit(hdr.system_information_message);
        packet.emit(hdr.trade_inquiry_out_message);
        packet.emit(hdr.update_local_database_header_message);
        packet.emit(hdr.update_local_database_trailer_message);
        packet.emit(hdr.user_unlock_approval_rejection_message);
        packet.emit(hdr.user_unlock_requested_response_message);
        packet.emit(hdr.user_order_value_limit_update_out_message);
        packet.emit(hdr.trade_modification_cancellation_status_response_message);
        packet.emit(hdr.update_local_database_data_message);
    }
}

V1Switch(
    NsecmOrderentryServerParser(),
    NsecmOrderentryServerVerifyChecksum(),
    NsecmOrderentryServerIngress(),
    NsecmOrderentryServerEgress(),
    NsecmOrderentryServerComputeChecksum(),
    NsecmOrderentryServerDeparser()
) main;
