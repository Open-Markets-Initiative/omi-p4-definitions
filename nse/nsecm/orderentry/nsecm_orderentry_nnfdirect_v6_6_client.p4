// P4_16 (v1model) definition for: Nse NseCm OrderEntry NnfDirect v6.6
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Order Entry
//   Encoding: Non-Neat Front End Direct Interface
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

header branch_order_value_limit_update_in_message_t {
    bit<40> broker_id;
    bit<200> reserved_25;
    bit<16> branch;
    bit<64> branch_buy_value_limit;
    bit<64> reserved_8;
    bit<64> branch_sell_value_limit;
    bit<64> second_reserved_8;
}

header cancel_on_logout_status_request_message_t {
    bit<32> user_id;
    bit<8> colo_user_bit;
    bit<56> reserved_7;
}

header message_download_request_message_t {
    bit<64> sequence_number;
}

header auction_inquiry_request_message_t {
    bit<80> symbol;
    bit<16> series;
    bit<16> auction_no;
    bit<8> page_indicator;
    bit<8> filler;
}

header box_sign_off_message_t {
    bit<16> box_id;
}

header box_sign_on_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<40> reserved_5;
    bit<64> session_key;
}

header gateway_router_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
}

header order_entry_in_message_t {
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

header order_limit_update_in_message_t {
    bit<40> broker_id;
    bit<8> reserved_1;
    bit<32> user_id;
    bit<64> order_qty_limit;
    bit<64> order_val_limit;
    bit<16> reserved_2;
}

header password_reset_in_message_t {
    bit<32> user_id;
    bit<112> reserved_14;
}

header sign_on_request_in_message_t {
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

header trade_inquiry_in_message_t {
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

header update_local_database_request_message_t {
    bit<32> last_update_security_time;
    bit<32> last_update_participant_time;
    bit<8> request_for_open_orders;
    bit<8> reserved_1;
    bit<16> normal_market_status;
    bit<16> odd_lot_market_status;
    bit<16> spot_market_status;
    bit<16> auction_market_status;
    bit<16> call_auction_1_market_status;
    bit<16> call_auction_2_market_status;
}

header trade_modification_cancellation_status_request_message_t {
    bit<32> user_id;
    bit<8> trd_mod_cxl_bit;
    bit<56> reserved_7;
}

header user_unlock_request_message_t {
    bit<32> user_id;
    bit<192> reserved_24;
}

header user_order_value_limit_update_in_message_t {
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

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    branch_order_value_limit_update_in_message_t branch_order_value_limit_update_in_message;
    cancel_on_logout_status_request_message_t cancel_on_logout_status_request_message;
    message_download_request_message_t message_download_request_message;
    auction_inquiry_request_message_t auction_inquiry_request_message;
    box_sign_off_message_t box_sign_off_message;
    box_sign_on_request_message_t box_sign_on_request_message;
    gateway_router_request_message_t gateway_router_request_message;
    order_entry_in_message_t order_entry_in_message;
    order_limit_update_in_message_t order_limit_update_in_message;
    password_reset_in_message_t password_reset_in_message;
    sign_on_request_in_message_t sign_on_request_in_message;
    trade_inquiry_in_message_t trade_inquiry_in_message;
    update_local_database_request_message_t update_local_database_request_message;
    trade_modification_cancellation_status_request_message_t trade_modification_cancellation_status_request_message;
    user_unlock_request_message_t user_unlock_request_message;
    user_order_value_limit_update_in_message_t user_order_value_limit_update_in_message;
}

parser NsecmOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.transaction_code) {
            16w5716: parse_branch_order_value_limit_update_in_message;
            16w5790: parse_cancel_on_logout_status_request_message;
            16w7000: parse_message_download_request_message;
            16w18016: parse_auction_inquiry_request_message;
            16w20322: parse_box_sign_off_message;
            16w23000: parse_box_sign_on_request_message;
            16w2400: parse_gateway_router_request_message;
            16w2000: parse_order_entry_in_message;
            16w2040: parse_order_entry_in_message;
            16w2062: parse_order_entry_in_message;
            16w2070: parse_order_entry_in_message;
            16w5721: parse_order_limit_update_in_message;
            16w5738: parse_password_reset_in_message;
            16w2300: parse_sign_on_request_in_message;
            16w5723: parse_sign_on_request_in_message;
            16w5440: parse_trade_inquiry_in_message;
            16w5445: parse_trade_inquiry_in_message;
            16w7300: parse_update_local_database_request_message;
            16w5792: parse_trade_modification_cancellation_status_request_message;
            16w5424: parse_user_unlock_request_message;
            16w5719: parse_user_order_value_limit_update_in_message;
            16w1600: parse_system_information_request_message;
            default: accept;
        }
    }

    state parse_branch_order_value_limit_update_in_message {
        packet.extract(hdr.branch_order_value_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_on_logout_status_request_message {
        packet.extract(hdr.cancel_on_logout_status_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_download_request_message {
        packet.extract(hdr.message_download_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_inquiry_request_message {
        packet.extract(hdr.auction_inquiry_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_off_message {
        packet.extract(hdr.box_sign_off_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_on_request_message {
        packet.extract(hdr.box_sign_on_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_router_request_message {
        packet.extract(hdr.gateway_router_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_entry_in_message {
        packet.extract(hdr.order_entry_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_limit_update_in_message {
        packet.extract(hdr.order_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_password_reset_in_message {
        packet.extract(hdr.password_reset_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sign_on_request_in_message {
        packet.extract(hdr.sign_on_request_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_inquiry_in_message {
        packet.extract(hdr.trade_inquiry_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_request_message {
        packet.extract(hdr.update_local_database_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modification_cancellation_status_request_message {
        packet.extract(hdr.trade_modification_cancellation_status_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_unlock_request_message {
        packet.extract(hdr.user_unlock_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_user_order_value_limit_update_in_message {
        packet.extract(hdr.user_order_value_limit_update_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_information_request_message {
        meta.dispatched = 1;
        transition accept;
    }

}

control NsecmOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsecmOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsecmOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsecmOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.branch_order_value_limit_update_in_message);
        packet.emit(hdr.cancel_on_logout_status_request_message);
        packet.emit(hdr.message_download_request_message);
        packet.emit(hdr.auction_inquiry_request_message);
        packet.emit(hdr.box_sign_off_message);
        packet.emit(hdr.box_sign_on_request_message);
        packet.emit(hdr.gateway_router_request_message);
        packet.emit(hdr.order_entry_in_message);
        packet.emit(hdr.order_limit_update_in_message);
        packet.emit(hdr.password_reset_in_message);
        packet.emit(hdr.sign_on_request_in_message);
        packet.emit(hdr.trade_inquiry_in_message);
        packet.emit(hdr.update_local_database_request_message);
        packet.emit(hdr.trade_modification_cancellation_status_request_message);
        packet.emit(hdr.user_unlock_request_message);
        packet.emit(hdr.user_order_value_limit_update_in_message);
    }
}

V1Switch(
    NsecmOrderentryClientParser(),
    NsecmOrderentryClientVerifyChecksum(),
    NsecmOrderentryClientIngress(),
    NsecmOrderentryClientEgress(),
    NsecmOrderentryClientComputeChecksum(),
    NsecmOrderentryClientDeparser()
) main;
