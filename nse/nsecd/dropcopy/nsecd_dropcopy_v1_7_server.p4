// P4_16 (v1model) definition for: Nse NseCd DropCopy NnfDirect v1.7
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Drop Copy
//   Encoding: Non-Neat Front End Direct Interface
//   Version: 1.7
//   Date: 9/1/2022
//   Specification: DC_CUR_Normal_DROPCOPY_PROTOCOL_1.7_1.pdf
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

header sign_on_out_message_t {
    bit<32> user_id;
    bit<64> reserved_8;
    bit<96> password;
    bit<32> reserved_4;
    bit<304> reserved_38;
    bit<40> broker_id;
    bit<952> reserved_119;
    bit<128> reserved_16;
    bit<128> second_reserved_16;
    bit<128> third_reserved_16;
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
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
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
    bit<8> book_type_char_1;
    bit<8> third_reserved_1;
    bit<32> new_volume;
    bit<80> old_account_number;
    bit<96> participant;
    bit<96> old_participant;
    bit<6> additional_order_flags_reserved_38;
    bit<1> col;
    bit<1> additional_order_flags_reserved_1;
    bit<8> fourth_reserved_1;
    bit<8> give_up_trade;
    bit<8> fifth_reserved_1;
    bit<80> pan;
    bit<80> old_pan;
    bit<32> algo_id;
    bit<16> algo_category;
    bit<64> last_activity_reference;
    bit<64> nnf_field;
    bit<352> reserved_44;
}

header trade_cancel_confirm_message_t {
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
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
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
    bit<8> book_type_char_1;
    bit<8> third_reserved_1;
    bit<32> new_volume;
    bit<80> old_account_number;
    bit<96> participant;
    bit<96> old_participant;
    bit<6> additional_order_flags_reserved_38;
    bit<1> col;
    bit<1> additional_order_flags_reserved_1;
    bit<8> fourth_reserved_1;
    bit<8> give_up_trade;
    bit<8> fifth_reserved_1;
    bit<80> pan;
    bit<80> old_pan;
    bit<32> algo_id;
    bit<16> algo_category;
    bit<64> last_activity_reference;
    bit<64> nnf_field;
    bit<352> reserved_44;
}

header trade_cancel_reject_message_t {
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
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
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
    bit<8> book_type_char_1;
    bit<8> third_reserved_1;
    bit<32> new_volume;
    bit<80> old_account_number;
    bit<96> participant;
    bit<96> old_participant;
    bit<6> additional_order_flags_reserved_38;
    bit<1> col;
    bit<1> additional_order_flags_reserved_1;
    bit<8> fourth_reserved_1;
    bit<8> give_up_trade;
    bit<8> fifth_reserved_1;
    bit<80> pan;
    bit<80> old_pan;
    bit<32> algo_id;
    bit<16> algo_category;
    bit<64> last_activity_reference;
    bit<64> nnf_field;
    bit<352> reserved_44;
}

header trade_modify_confirm_message_t {
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
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
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
    bit<8> book_type_char_1;
    bit<8> third_reserved_1;
    bit<32> new_volume;
    bit<80> old_account_number;
    bit<96> participant;
    bit<96> old_participant;
    bit<6> additional_order_flags_reserved_38;
    bit<1> col;
    bit<1> additional_order_flags_reserved_1;
    bit<8> fourth_reserved_1;
    bit<8> give_up_trade;
    bit<8> fifth_reserved_1;
    bit<80> pan;
    bit<80> old_pan;
    bit<32> algo_id;
    bit<16> algo_category;
    bit<64> last_activity_reference;
    bit<64> nnf_field;
    bit<352> reserved_44;
}

header trade_modify_reject_message_t {
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
    bit<32> gtd;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<64> op_order_number;
    bit<40> op_broker_id;
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
    bit<8> book_type_char_1;
    bit<8> third_reserved_1;
    bit<32> new_volume;
    bit<80> old_account_number;
    bit<96> participant;
    bit<96> old_participant;
    bit<6> additional_order_flags_reserved_38;
    bit<1> col;
    bit<1> additional_order_flags_reserved_1;
    bit<8> fourth_reserved_1;
    bit<8> give_up_trade;
    bit<8> fifth_reserved_1;
    bit<80> pan;
    bit<80> old_pan;
    bit<32> algo_id;
    bit<16> algo_category;
    bit<64> last_activity_reference;
    bit<64> nnf_field;
    bit<352> reserved_44;
}

header giveup_app_confirm_tm_message_t {
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
    bit<16> book_type_short_2;
    bit<32> last_modified_date_time;
    bit<8> initiated_by_control;
    bit<8> open_close;
    bit<8> reserved_1;
    bit<96> participant;
    bit<8> giveup_flag;
    bit<8> deleted;
    bit<8> second_reserved_1;
}

header giveup_rej_confirm_tm_message_t {
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
    bit<16> book_type_short_2;
    bit<32> last_modified_date_time;
    bit<8> initiated_by_control;
    bit<8> open_close;
    bit<8> reserved_1;
    bit<96> participant;
    bit<8> giveup_flag;
    bit<8> deleted;
    bit<8> second_reserved_1;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    sign_on_out_message_t sign_on_out_message;
    trade_confirmation_message_t trade_confirmation_message;
    trade_cancel_confirm_message_t trade_cancel_confirm_message;
    trade_cancel_reject_message_t trade_cancel_reject_message;
    trade_modify_confirm_message_t trade_modify_confirm_message;
    trade_modify_reject_message_t trade_modify_reject_message;
    giveup_app_confirm_tm_message_t giveup_app_confirm_tm_message;
    giveup_rej_confirm_tm_message_t giveup_rej_confirm_tm_message;
}

parser NsecdDropcopyServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w2301: parse_sign_on_out_message;
            16w2222: parse_trade_confirmation_message;
            16w2282: parse_trade_cancel_confirm_message;
            16w2286: parse_trade_cancel_reject_message;
            16w2287: parse_trade_modify_confirm_message;
            16w2288: parse_trade_modify_reject_message;
            16w4506: parse_giveup_app_confirm_tm_message;
            16w4507: parse_giveup_rej_confirm_tm_message;
            default: accept;
        }
    }

    state parse_sign_on_out_message {
        packet.extract(hdr.sign_on_out_message);
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

    state parse_trade_modify_reject_message {
        packet.extract(hdr.trade_modify_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_giveup_app_confirm_tm_message {
        packet.extract(hdr.giveup_app_confirm_tm_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_giveup_rej_confirm_tm_message {
        packet.extract(hdr.giveup_rej_confirm_tm_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecdDropcopyServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecdDropcopyServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecdDropcopyServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecdDropcopyServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecdDropcopyServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.sign_on_out_message);
        packet.emit(hdr.trade_confirmation_message);
        packet.emit(hdr.trade_cancel_confirm_message);
        packet.emit(hdr.trade_cancel_reject_message);
        packet.emit(hdr.trade_modify_confirm_message);
        packet.emit(hdr.trade_modify_reject_message);
        packet.emit(hdr.giveup_app_confirm_tm_message);
        packet.emit(hdr.giveup_rej_confirm_tm_message);
    }
}

V1Switch(
    NsecdDropcopyServerParser(),
    NsecdDropcopyServerVerifyChecksum(),
    NsecdDropcopyServerIngress(),
    NsecdDropcopyServerEgress(),
    NsecdDropcopyServerComputeChecksum(),
    NsecdDropcopyServerDeparser()
) main;
