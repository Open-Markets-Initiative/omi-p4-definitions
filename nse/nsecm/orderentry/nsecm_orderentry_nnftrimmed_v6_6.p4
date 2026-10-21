// P4_16 (v1model) definition for: Nse NseCm OrderEntry NnfTrimmed v6.6
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End Trimmed
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

header packet_header_t {
    bit<16> transaction_code;
}

header order_entry_request_trimmed_message_t {
    bit<16> transcode;
    bit<32> trader_id;
    bit<80> symbol;
    bit<16> series;
    bit<80> account_number;
    bit<16> book_type;
    bit<16> buy_sell;
    bit<32> disclosed_vol;
    bit<32> volume;
    bit<32> price;
    bit<32> good_till_date;
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
    bit<1> reserved_3;
    bit<1> stpc;
    bit<1> reserved_1;
    bit<16> branch_id;
    bit<32> user_id;
    bit<40> broker_id;
    bit<8> suspended;
    bit<96> settlor;
    bit<16> pro_client;
    bit<64> nnf_field;
    bit<32> transaction_id;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<256> reserved_32;
}

header order_modify_cancel_request_trimmed_message_t {
    bit<16> transaction_code;
    bit<32> log_time;
    bit<32> user_id;
    bit<16> error_code;
    bit<64> time_stamp_1_long_long_8;
    bit<8> time_stamp_2;
    bit<8> modified_cancelled_by;
    bit<16> reason_code;
    bit<80> symbol;
    bit<16> series;
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
    bit<32> entry_date_time;
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
    bit<1> reserved_3;
    bit<1> stpc;
    bit<1> reserved_1;
    bit<16> branch_id;
    bit<32> second_user_id;
    bit<40> broker_id;
    bit<8> suspended;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_type;
    bit<64> nnf_field;
    bit<32> transaction_id;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<192> reserved_24;
}

header order_modify_cancel_response_trimmed_message_t {
    bit<16> transaction_code;
    bit<32> log_time;
    bit<32> user_id;
    bit<16> error_code;
    bit<64> time_stamp_1_long_long_8;
    bit<8> time_stamp_2;
    bit<8> modified_cancelled_by;
    bit<16> reason_code;
    bit<80> symbol;
    bit<16> series;
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
    bit<32> entry_date_time;
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
    bit<1> reserved_3;
    bit<1> stpc;
    bit<1> reserved_1;
    bit<16> branch_id;
    bit<32> second_user_id;
    bit<40> broker_id;
    bit<8> suspended;
    bit<96> settlor;
    bit<16> pro_client;
    bit<16> settlement_type;
    bit<64> nnf_field;
    bit<32> transaction_id;
    bit<64> timestamp;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header trade_confirmation_trimmed_message_t {
    bit<16> transaction_code;
    bit<32> log_time;
    bit<32> user_id;
    bit<64> timestamp;
    bit<64> time_stamp_1_char_8;
    bit<64> response_order_number;
    bit<8> time_stamp_2;
    bit<40> broker_id;
    bit<32> trader_num;
    bit<16> buy_sell;
    bit<80> account_num;
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
    bit<1> reserved_3;
    bit<1> stpc;
    bit<1> reserved_1;
    bit<32> fill_number;
    bit<32> fill_qty;
    bit<32> fill_price;
    bit<32> vol_filled_today;
    bit<16> activity_type;
    bit<32> activity_time;
    bit<80> symbol;
    bit<16> series;
    bit<16> book_type;
    bit<16> pro_client;
    bit<80> pan;
    bit<32> algo_id;
    bit<16> reserved_2;
    bit<64> last_activity_reference;
    bit<416> reserved_52;
}

header quick_acknowledgement_message_t {
    bit<16> transaction_code;
    bit<32> trader_id;
    bit<64> timestamp;
    bit<32> reference;
    bit<16> error_code;
    bit<16> message_length;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    order_entry_request_trimmed_message_t order_entry_request_trimmed_message;
    order_modify_cancel_request_trimmed_message_t order_modify_cancel_request_trimmed_message;
    order_modify_cancel_response_trimmed_message_t order_modify_cancel_response_trimmed_message;
    trade_confirmation_trimmed_message_t trade_confirmation_trimmed_message;
    quick_acknowledgement_message_t quick_acknowledgement_message;
}

parser NsecmOrderentryParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.transaction_code) {
            16w20000: parse_order_entry_request_trimmed_message;
            16w20400: parse_order_entry_request_trimmed_message;
            16w20040: parse_order_modify_cancel_request_trimmed_message;
            16w20070: parse_order_modify_cancel_request_trimmed_message;
            16w20402: parse_order_modify_cancel_request_trimmed_message;
            16w20404: parse_order_modify_cancel_request_trimmed_message;
            16w20012: parse_order_modify_cancel_response_trimmed_message;
            16w20042: parse_order_modify_cancel_response_trimmed_message;
            16w20072: parse_order_modify_cancel_response_trimmed_message;
            16w20073: parse_order_modify_cancel_response_trimmed_message;
            16w20074: parse_order_modify_cancel_response_trimmed_message;
            16w20075: parse_order_modify_cancel_response_trimmed_message;
            16w20231: parse_order_modify_cancel_response_trimmed_message;
            16w20222: parse_trade_confirmation_trimmed_message;
            16w20401: parse_quick_acknowledgement_message;
            16w20403: parse_quick_acknowledgement_message;
            16w20405: parse_quick_acknowledgement_message;
            default: accept;
        }
    }

    state parse_order_entry_request_trimmed_message {
        packet.extract(hdr.order_entry_request_trimmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_cancel_request_trimmed_message {
        packet.extract(hdr.order_modify_cancel_request_trimmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_cancel_response_trimmed_message {
        packet.extract(hdr.order_modify_cancel_response_trimmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_confirmation_trimmed_message {
        packet.extract(hdr.trade_confirmation_trimmed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quick_acknowledgement_message {
        packet.extract(hdr.quick_acknowledgement_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmOrderentryVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmOrderentryIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmOrderentryEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmOrderentryComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmOrderentryDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.order_entry_request_trimmed_message);
        packet.emit(hdr.order_modify_cancel_request_trimmed_message);
        packet.emit(hdr.order_modify_cancel_response_trimmed_message);
        packet.emit(hdr.trade_confirmation_trimmed_message);
        packet.emit(hdr.quick_acknowledgement_message);
    }
}

V1Switch(
    NsecmOrderentryParser(),
    NsecmOrderentryVerifyChecksum(),
    NsecmOrderentryIngress(),
    NsecmOrderentryEgress(),
    NsecmOrderentryComputeChecksum(),
    NsecmOrderentryDeparser()
) main;
