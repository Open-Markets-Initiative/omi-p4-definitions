// P4_16 (v1model) definition for: A2X TradingProtocol Atp v2.9
// 
// Protocol:
//   Organization: A2X Markets
//   Protocol: A2X Binary Protocol
//   Encoding: A2X Binary Protocol
//   Version: 2.9
//   Date: 5/24/2023
//   Specification: A2X ATP Binary Protocol Specification v2.9.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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
    bit<16> length;
    bit<8> msg_type;
    bit<32> msg_seq_no;
}

header login_message_t {
    bit<16> protocol_version;
    bit<128> sender_id;
    bit<128> password;
    bit<16> inactivity_timeout;
    bit<32> atp_seq_no;
}

header login_response_message_t {
    bit<8> result_code;
    bit<32> client_seq_no;
}

header logout_message_t {
    bit<8> logout_reason_code;
    bit<256> reason_text;
}

header order_add_message_t {
    bit<32> security_id_long;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<8> order_capacity;
    bit<16> account;
    bit<64> user_tag;
    bit<8> reserved_1;
    bit<8> reserved_byte_2;
    bit<32> reserved_4;
    bit<8> reserved_byte_3;
    bit<32> reserved_int_2;
    bit<8> reserved_byte_4;
    bit<32> reserved_int_3;
}

header order_add_extended_message_t {
    bit<32> security_id_long;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<8> order_capacity;
    bit<16> account;
    bit<64> user_tag;
    bit<8> reserved_1;
    bit<8> reserved_byte_2;
    bit<32> reserved_4;
    bit<8> reserved_byte_3;
    bit<32> reserved_int_2;
    bit<8> reserved_byte_4;
    bit<32> reserved_int_3;
    bit<32> display_quantity;
    bit<32> min_qty;
    bit<8> reserved_byte_5;
}

header order_cancel_message_t {
    bit<32> order_ref;
    bit<64> user_tag;
}

header order_modify_message_t {
    bit<32> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<64> user_tag;
}

header order_modify_extended_message_t {
    bit<32> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<64> user_tag;
    bit<8> reserved_1;
    bit<8> reserved_byte_2;
    bit<32> reserved_4;
    bit<8> reserved_byte_3;
    bit<32> reserved_int_2;
    bit<8> reserved_byte_4;
    bit<32> reserved_int_3;
    bit<8> order_capacity;
    bit<32> display_quantity;
    bit<32> reserved_int_4;
}

header order_add_response_message_t {
    bit<32> order_ref;
    bit<32> market_data_id;
    bit<3> order_status;
    bit<5> reason_code;
    bit<32> traded_quantity;
    bit<64> timestamp;
    bit<64> user_tag;
    bit<8> reserved_1;
}

header order_cancel_response_message_t {
    bit<32> order_ref;
    bit<32> request_ref;
    bit<3> order_status;
    bit<5> reason_code;
    bit<64> cancellation_timestamp;
    bit<64> user_tag;
}

header order_modify_response_message_t {
    bit<32> order_ref;
    bit<32> request_ref;
    bit<3> order_status;
    bit<5> reason_code;
    bit<64> modification_timestamp;
    bit<64> user_tag;
    bit<8> reserved_1;
}

header iceberg_order_refresh_message_t {
    bit<32> order_ref;
    bit<32> orig_a2x_ord_id;
    bit<32> new_a2x_ord_id;
    bit<32> quantity;
}

header trade_capture_message_t {
    bit<32> quantity;
    bit<64> price;
    bit<32> security_id_long;
    bit<8> trade_capture_type;
    bit<8> reserved_1;
    bit<64> user_tag;
    bit<64> reserved_8;
    bit<16> buy_account;
    bit<8> buy_order_capacity;
    bit<64> reserved_long_2;
    bit<16> sell_account;
    bit<8> sell_order_capacity;
}

header trade_capture_response_message_t {
    bit<3> order_status;
    bit<5> reason_code;
    bit<32> trade_ref;
    bit<32> request_ref;
    bit<64> user_tag;
}

header trade_message_t {
    bit<32> order_ref;
    bit<32> quantity;
    bit<64> price;
    bit<8> side;
    bit<32> trade_ref;
    bit<8> ccp_code;
    bit<8> liq_indicator;
    bit<16> security_id_short;
    bit<64> trade_timestamp;
    bit<64> user_tag;
    bit<8> reserved_1;
}

header trade_bust_message_t {
    bit<32> order_ref;
    bit<32> quantity;
    bit<64> price;
    bit<8> side;
    bit<32> trade_ref;
    bit<64> bust_timestamp;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    login_message_t login_message;
    login_response_message_t login_response_message;
    logout_message_t logout_message;
    order_add_message_t order_add_message;
    order_add_extended_message_t order_add_extended_message;
    order_cancel_message_t order_cancel_message;
    order_modify_message_t order_modify_message;
    order_modify_extended_message_t order_modify_extended_message;
    order_add_response_message_t order_add_response_message;
    order_cancel_response_message_t order_cancel_response_message;
    order_modify_response_message_t order_modify_response_message;
    iceberg_order_refresh_message_t iceberg_order_refresh_message;
    trade_capture_message_t trade_capture_message;
    trade_capture_response_message_t trade_capture_response_message;
    trade_message_t trade_message;
    trade_bust_message_t trade_bust_message;
}

parser A2xequitiesTradingprotocolParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w1: parse_login_message;
            8w2: parse_login_response_message;
            8w0: parse_heartbeat;
            8w3: parse_logout_request_message;
            8w4: parse_logout_message;
            8w24: parse_order_add_message;
            8w25: parse_order_add_extended_message;
            8w7: parse_order_cancel_message;
            8w9: parse_order_modify_message;
            8w22: parse_order_modify_extended_message;
            8w6: parse_order_add_response_message;
            8w8: parse_order_cancel_response_message;
            8w10: parse_order_modify_response_message;
            8w23: parse_iceberg_order_refresh_message;
            8w26: parse_trade_capture_message;
            8w18: parse_trade_capture_response_message;
            8w11: parse_trade_message;
            8w12: parse_trade_bust_message;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_add_message {
        packet.extract(hdr.order_add_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_add_extended_message {
        packet.extract(hdr.order_add_extended_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_message {
        packet.extract(hdr.order_modify_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_extended_message {
        packet.extract(hdr.order_modify_extended_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_add_response_message {
        packet.extract(hdr.order_add_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_response_message {
        packet.extract(hdr.order_cancel_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modify_response_message {
        packet.extract(hdr.order_modify_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_iceberg_order_refresh_message {
        packet.extract(hdr.iceberg_order_refresh_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_capture_message {
        packet.extract(hdr.trade_capture_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_capture_response_message {
        packet.extract(hdr.trade_capture_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control A2xequitiesTradingprotocolVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xequitiesTradingprotocolIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control A2xequitiesTradingprotocolEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control A2xequitiesTradingprotocolComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control A2xequitiesTradingprotocolDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_message);
        packet.emit(hdr.login_response_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.order_add_message);
        packet.emit(hdr.order_add_extended_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_modify_message);
        packet.emit(hdr.order_modify_extended_message);
        packet.emit(hdr.order_add_response_message);
        packet.emit(hdr.order_cancel_response_message);
        packet.emit(hdr.order_modify_response_message);
        packet.emit(hdr.iceberg_order_refresh_message);
        packet.emit(hdr.trade_capture_message);
        packet.emit(hdr.trade_capture_response_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_bust_message);
    }
}

V1Switch(
    A2xequitiesTradingprotocolParser(),
    A2xequitiesTradingprotocolVerifyChecksum(),
    A2xequitiesTradingprotocolIngress(),
    A2xequitiesTradingprotocolEgress(),
    A2xequitiesTradingprotocolComputeChecksum(),
    A2xequitiesTradingprotocolDeparser()
) main;
