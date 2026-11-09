// P4_16 (v1model) definition for: AsiaNext AsiaNextDerivatives TradingProtocol Atp v1.2
// 
// Protocol:
//   Organization: AsiaNext
//   Protocol: Aquis Trading Protocol
//   Encoding: Aquis Trading Protocol
//   Version: 1.2
//   Date: 11/6/2026
//   Specification: 251015-AsiaNext-ATP-Technical-Specification-v1.2.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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
//   https://patents.google.com/patent/US20240129382A1/en
//   https://patents.google.com/patent/US20240419416A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<16> msg_length;
    bit<8> msg_type;
    bit<64> msg_seq_no;
}

header login_message_t {
    bit<16> protocol_version;
    bit<128> sender_id;
    bit<128> password;
    bit<16> inactivity_timeout;
    bit<64> atp_seq_no;
}

header login_response_message_t {
    bit<8> result_code;
    bit<64> client_seq_no;
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
    bit<5> unused_5;
    bit<1> dea_flag;
    bit<1> algo_trade_flag;
    bit<1> liq_prov;
    bit<4> party_role_qualifier;
    bit<4> party_role;
    bit<32> short_code_1;
    bit<4> party_role_qualifier_2;
    bit<4> party_role_2;
    bit<32> short_code_2;
    bit<4> party_role_qualifier_3;
    bit<4> party_role_3;
    bit<32> short_code_3;
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
    bit<5> unused_5;
    bit<1> dea_flag;
    bit<1> algo_trade_flag;
    bit<1> liq_prov;
    bit<4> party_role_qualifier;
    bit<4> party_role;
    bit<32> short_code_1;
    bit<4> party_role_qualifier_2;
    bit<4> party_role_2;
    bit<32> short_code_2;
    bit<4> party_role_qualifier_3;
    bit<4> party_role_3;
    bit<32> short_code_3;
    bit<32> display_quantity;
    bit<32> min_qty;
    bit<8> unused_8;
    bit<64> expire_time;
    bit<64> rfq_session_id;
}

header order_cancel_message_t {
    bit<64> order_ref;
    bit<64> user_tag;
    bit<5> unused_5;
    bit<1> dea_flag;
    bit<1> algo_trade_flag;
    bit<1> liq_prov;
    bit<4> party_role_qualifier;
    bit<4> party_role;
    bit<32> short_code_1;
    bit<4> party_role_qualifier_2;
    bit<4> party_role_2;
    bit<32> short_code_2;
    bit<4> party_role_qualifier_3;
    bit<4> party_role_3;
    bit<32> short_code_3;
}

header order_modify_message_t {
    bit<64> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<64> user_tag;
    bit<5> unused_5;
    bit<1> dea_flag;
    bit<1> algo_trade_flag;
    bit<1> liq_prov;
    bit<4> party_role_qualifier;
    bit<4> party_role;
    bit<32> short_code_1;
    bit<4> party_role_qualifier_2;
    bit<4> party_role_2;
    bit<32> short_code_2;
    bit<4> party_role_qualifier_3;
    bit<4> party_role_3;
    bit<32> short_code_3;
    bit<8> order_capacity;
}

header order_modify_extended_message_t {
    bit<64> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<64> user_tag;
    bit<5> unused_5;
    bit<1> dea_flag;
    bit<1> algo_trade_flag;
    bit<1> liq_prov;
    bit<4> party_role_qualifier;
    bit<4> party_role;
    bit<32> short_code_1;
    bit<4> party_role_qualifier_2;
    bit<4> party_role_2;
    bit<32> short_code_2;
    bit<4> party_role_qualifier_3;
    bit<4> party_role_3;
    bit<32> short_code_3;
    bit<8> order_capacity;
    bit<32> display_quantity;
    bit<32> min_qty;
    bit<64> expire_time;
}

header order_add_response_message_t {
    bit<64> order_ref;
    bit<64> market_data_id;
}

header status_cancel_reason_t {
    bit<5> cancel_reason;
    bit<3> order_status;
}

header status_reject_reason_t {
    bit<5> reject_reason;
    bit<3> order_status;
}

header status_t {
    bit<5> reason_code;
    bit<3> order_status;
}

header order_cancel_response_message_t {
    bit<64> order_ref;
    bit<64> request_ref;
}

header order_modify_response_message_t {
    bit<64> order_ref;
    bit<64> request_ref;
}

header status_modification_reason_t {
    bit<5> modification_reason;
    bit<3> order_status;
}

header quote_request_message_t {
    bit<32> security_id_long;
    bit<32> quantity;
    bit<8> side;
    bit<64> user_tag;
    bit<32> market_maker_code_1;
    bit<32> market_maker_code_2;
    bit<32> market_maker_code_3;
    bit<32> market_maker_code_4;
    bit<32> market_maker_code_5;
}

header quote_request_notification_message_t {
    bit<64> rfq_session_id;
    bit<32> security_id_long;
    bit<32> quantity;
    bit<8> side;
    bit<8> quote_request_status;
    bit<8> status_details;
    bit<64> msg_ref;
    bit<64> user_tag;
}

header quote_add_message_t {
    bit<64> aqx_order_id;
    bit<16> security_id_short;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<64> rfq_session_id;
}

header quote_modify_message_t {
    bit<64> aqx_order_id;
    bit<16> security_id_short;
    bit<32> quantity;
    bit<64> price;
}

header quote_cancel_message_t {
    bit<64> aqx_order_id;
    bit<16> security_id_short;
}

header trade_message_t {
    bit<64> order_ref;
    bit<32> quantity;
    bit<64> price;
    bit<8> side;
    bit<64> trade_ref;
    bit<8> ccp_code;
    bit<8> liq_indicator;
    bit<32> security_id_long;
    bit<64> timestamp;
    bit<64> user_tag;
    bit<8> unused_8;
}

header trade_bust_message_t {
    bit<64> order_ref;
    bit<32> quantity;
    bit<64> price;
    bit<8> side;
    bit<64> trade_ref;
    bit<64> timestamp;
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
    status_cancel_reason_t status_cancel_reason;
    status_reject_reason_t status_reject_reason;
    status_t status;
    order_cancel_response_message_t order_cancel_response_message;
    order_modify_response_message_t order_modify_response_message;
    status_modification_reason_t status_modification_reason;
    quote_request_message_t quote_request_message;
    quote_request_notification_message_t quote_request_notification_message;
    quote_add_message_t quote_add_message;
    quote_modify_message_t quote_modify_message;
    quote_cancel_message_t quote_cancel_message;
    trade_message_t trade_message;
    trade_bust_message_t trade_bust_message;
}

parser AsianextderivativesTradingprotocolParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w1: parse_login_message;
            8w2: parse_login_response_message;
            8w0: parse_heartbeat_message;
            8w3: parse_logout_request_message;
            8w4: parse_logout_message;
            8w5: parse_order_add_message;
            8w21: parse_order_add_extended_message;
            8w7: parse_order_cancel_message;
            8w9: parse_order_modify_message;
            8w22: parse_order_modify_extended_message;
            8w6: parse_order_add_response_message;
            8w8: parse_order_cancel_response_message;
            8w10: parse_order_modify_response_message;
            8w30: parse_quote_request_message;
            8w31: parse_quote_request_notification_message;
            8w13: parse_quote_add_message;
            8w14: parse_quote_modify_message;
            8w15: parse_quote_cancel_message;
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

    state parse_heartbeat_message {
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
        transition select(packet.lookahead<bit<8>>()[2:0]) {
            3w3: parse_status_cancel_reason;
            3w4: parse_status_reject_reason;
            default: parse_status;
        }
    }

    state parse_status_cancel_reason {
        packet.extract(hdr.status_cancel_reason);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_status_reject_reason {
        packet.extract(hdr.status_reject_reason);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_status {
        packet.extract(hdr.status);
        transition accept;
    }

    state parse_order_cancel_response_message {
        packet.extract(hdr.order_cancel_response_message);
        meta.dispatched = 1;
        transition select(packet.lookahead<bit<8>>()[2:0]) {
            3w3: parse_status_cancel_reason;
            3w4: parse_status_reject_reason;
            default: parse_status;
        }
    }

    state parse_order_modify_response_message {
        packet.extract(hdr.order_modify_response_message);
        meta.dispatched = 1;
        transition select(packet.lookahead<bit<8>>()[2:0]) {
            3w4: parse_status_reject_reason;
            default: parse_status_modification_reason;
        }
    }

    state parse_status_modification_reason {
        packet.extract(hdr.status_modification_reason);
        transition accept;
    }

    state parse_quote_request_message {
        packet.extract(hdr.quote_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_request_notification_message {
        packet.extract(hdr.quote_request_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_add_message {
        packet.extract(hdr.quote_add_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_modify_message {
        packet.extract(hdr.quote_modify_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_cancel_message {
        packet.extract(hdr.quote_cancel_message);
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

control AsianextderivativesTradingprotocolVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsianextderivativesTradingprotocolIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AsianextderivativesTradingprotocolEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsianextderivativesTradingprotocolComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsianextderivativesTradingprotocolDeparser(packet_out packet, in headers_t hdr) {
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
        packet.emit(hdr.status_cancel_reason);
        packet.emit(hdr.status_reject_reason);
        packet.emit(hdr.status);
        packet.emit(hdr.order_cancel_response_message);
        packet.emit(hdr.order_modify_response_message);
        packet.emit(hdr.status_modification_reason);
        packet.emit(hdr.quote_request_message);
        packet.emit(hdr.quote_request_notification_message);
        packet.emit(hdr.quote_add_message);
        packet.emit(hdr.quote_modify_message);
        packet.emit(hdr.quote_cancel_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_bust_message);
    }
}

V1Switch(
    AsianextderivativesTradingprotocolParser(),
    AsianextderivativesTradingprotocolVerifyChecksum(),
    AsianextderivativesTradingprotocolIngress(),
    AsianextderivativesTradingprotocolEgress(),
    AsianextderivativesTradingprotocolComputeChecksum(),
    AsianextderivativesTradingprotocolDeparser()
) main;
