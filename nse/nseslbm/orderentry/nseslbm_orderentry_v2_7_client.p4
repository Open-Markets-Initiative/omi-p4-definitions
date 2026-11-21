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

header client_registration_packet_t {
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

header logon_request_message_t {
    bit<32> user_id;
    bit<64> password;
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
    bit<12> reserved_112;
    bit<208> logon_request_broker_name;
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
}

header message_download_request_message_t {
    bit<64> sequence_number;
}

header order_entry_request_message_t {
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

header order_modification_request_message_t {
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

header order_cancellation_request_message_t {
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

header trade_cancellation_request_message_t {
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

header trade_modification_request_message_t {
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

header gateway_router_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<8> filler;
}

header secure_box_registration_request_message_t {
    bit<16> box_id;
}

header box_sign_on_request_message_t {
    bit<16> box_id;
    bit<40> broker_id;
    bit<40> reserved_5;
    bit<64> session_key;
}

header client_session_packet_t {
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
    client_registration_packet_t client_registration_packet;
    logon_request_message_t logon_request_message;
    update_local_database_request_message_t update_local_database_request_message;
    message_download_request_message_t message_download_request_message;
    order_entry_request_message_t order_entry_request_message;
    order_modification_request_message_t order_modification_request_message;
    order_cancellation_request_message_t order_cancellation_request_message;
    trade_cancellation_request_message_t trade_cancellation_request_message;
    trade_modification_request_message_t trade_modification_request_message;
    gateway_router_request_message_t gateway_router_request_message;
    secure_box_registration_request_message_t secure_box_registration_request_message;
    box_sign_on_request_message_t box_sign_on_request_message;
    client_session_packet_t client_session_packet;
}

parser NseslbmOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(packet.lookahead<bit<144>>()[15:0]) {
            16w23008: parse_client_registration_packet;
            default: parse_client_session_packet;
        }
    }

    state parse_client_registration_packet {
        packet.extract(hdr.client_registration_packet);
        meta.dispatched = 1;
        transition select(hdr.client_registration_packet.transaction_code) {
            16w2300: parse_logon_request_message;
            16w1600: parse_system_information_request_message;
            16w7300: parse_update_local_database_request_message;
            16w7000: parse_message_download_request_message;
            16w2320: parse_logoff_request_message;
            16w2000: parse_order_entry_request_message;
            16w2040: parse_order_modification_request_message;
            16w2070: parse_order_cancellation_request_message;
            16w5440: parse_trade_cancellation_request_message;
            16w5445: parse_trade_modification_request_message;
            16w2400: parse_gateway_router_request_message;
            16w23008: parse_secure_box_registration_request_message;
            16w23000: parse_box_sign_on_request_message;
            16w23506: parse_heartbeat_message;
            default: accept;
        }
    }

    state parse_logon_request_message {
        packet.extract(hdr.logon_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_information_request_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_update_local_database_request_message {
        packet.extract(hdr.update_local_database_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message_download_request_message {
        packet.extract(hdr.message_download_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logoff_request_message {
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

    state parse_trade_cancellation_request_message {
        packet.extract(hdr.trade_cancellation_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_modification_request_message {
        packet.extract(hdr.trade_modification_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_gateway_router_request_message {
        packet.extract(hdr.gateway_router_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_secure_box_registration_request_message {
        packet.extract(hdr.secure_box_registration_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_box_sign_on_request_message {
        packet.extract(hdr.box_sign_on_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_session_packet {
        packet.extract(hdr.client_session_packet);
        transition select(hdr.client_session_packet.transaction_code) {
            16w2300: parse_logon_request_message;
            16w1600: parse_system_information_request_message;
            16w7300: parse_update_local_database_request_message;
            16w7000: parse_message_download_request_message;
            16w2320: parse_logoff_request_message;
            16w2000: parse_order_entry_request_message;
            16w2040: parse_order_modification_request_message;
            16w2070: parse_order_cancellation_request_message;
            16w5440: parse_trade_cancellation_request_message;
            16w5445: parse_trade_modification_request_message;
            16w2400: parse_gateway_router_request_message;
            16w23008: parse_secure_box_registration_request_message;
            16w23000: parse_box_sign_on_request_message;
            16w23506: parse_heartbeat_message;
            default: accept;
        }
    }

}

control NseslbmOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseslbmOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NseslbmOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NseslbmOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseslbmOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.client_registration_packet);
        packet.emit(hdr.logon_request_message);
        packet.emit(hdr.update_local_database_request_message);
        packet.emit(hdr.message_download_request_message);
        packet.emit(hdr.order_entry_request_message);
        packet.emit(hdr.order_modification_request_message);
        packet.emit(hdr.order_cancellation_request_message);
        packet.emit(hdr.trade_cancellation_request_message);
        packet.emit(hdr.trade_modification_request_message);
        packet.emit(hdr.gateway_router_request_message);
        packet.emit(hdr.secure_box_registration_request_message);
        packet.emit(hdr.box_sign_on_request_message);
        packet.emit(hdr.client_session_packet);
    }
}

V1Switch(
    NseslbmOrderentryClientParser(),
    NseslbmOrderentryClientVerifyChecksum(),
    NseslbmOrderentryClientIngress(),
    NseslbmOrderentryClientEgress(),
    NseslbmOrderentryClientComputeChecksum(),
    NseslbmOrderentryClientDeparser()
) main;
