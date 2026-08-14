// P4_16 (v1model) definition for: Aquis AquisEquities TradingProtocol Atp v4.0
// 
// Protocol:
//   Organization: Aquis Exchange
//   Protocol: Aquis Trading Protocol
//   Encoding: Aquis Trading Protocol
//   Version: 4.0
//   Date: 8/1/2025
//   Specification: Production_Aquis_ATP_Technical_Specification_v4_0_f0cd559010.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<16> msg_length;
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
    bit<16> security_id_u_162;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<8> order_capacity;
    bit<8> account;
    bit<64> user_tag;
    bit<1> liq_prov;
    bit<1> algo_trade_flag;
    bit<1> dea_flag;
    bit<5> reserved_5;
    bit<4> party_role;
    bit<4> party_role_qualifier;
    bit<32> short_code_1;
    bit<4> party_role_2;
    bit<4> party_role_qualifier_2;
    bit<32> short_code_2;
    bit<4> party_role_3;
    bit<4> party_role_qualifier_3;
    bit<32> short_code_3;
}

header order_add_extended_message_t {
    bit<16> security_id_u_162;
    bit<8> order_type;
    bit<8> time_in_force;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<8> order_capacity;
    bit<8> account;
    bit<64> user_tag;
    bit<1> liq_prov;
    bit<1> algo_trade_flag;
    bit<1> dea_flag;
    bit<5> reserved_5;
    bit<4> party_role;
    bit<4> party_role_qualifier;
    bit<32> short_code_1;
    bit<4> party_role_2;
    bit<4> party_role_qualifier_2;
    bit<32> short_code_2;
    bit<4> party_role_3;
    bit<4> party_role_qualifier_3;
    bit<32> short_code_3;
    bit<32> display_quantity;
    bit<32> min_qty;
    bit<1> stp_enable;
    bit<1> lis_only;
    bit<1> routetolit;
    bit<3> routing;
    bit<2> reserved_2;
    bit<64> reserved_u_648;
    bit<64> designated_order_id;
    bit<16> reserved_u_162;
    bit<64> peg_difference;
}

header order_cancel_message_t {
    bit<32> order_ref;
    bit<64> user_tag;
    bit<1> liq_prov;
    bit<1> algo_trade_flag;
    bit<1> dea_flag;
    bit<5> reserved_5;
    bit<4> party_role;
    bit<4> party_role_qualifier;
    bit<32> short_code_1;
    bit<4> party_role_2;
    bit<4> party_role_qualifier_2;
    bit<32> short_code_2;
    bit<4> party_role_3;
    bit<4> party_role_qualifier_3;
    bit<32> short_code_3;
}

header order_modify_message_t {
    bit<32> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<64> user_tag;
    bit<1> liq_prov;
    bit<1> algo_trade_flag;
    bit<1> dea_flag;
    bit<5> reserved_5;
    bit<4> party_role;
    bit<4> party_role_qualifier;
    bit<32> short_code_1;
    bit<4> party_role_2;
    bit<4> party_role_qualifier_2;
    bit<32> short_code_2;
    bit<4> party_role_3;
    bit<4> party_role_qualifier_3;
    bit<32> short_code_3;
    bit<8> order_capacity;
}

header order_modify_extended_message_t {
    bit<32> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<64> user_tag;
    bit<1> liq_prov;
    bit<1> algo_trade_flag;
    bit<1> dea_flag;
    bit<5> reserved_5;
    bit<4> party_role;
    bit<4> party_role_qualifier;
    bit<32> short_code_1;
    bit<4> party_role_2;
    bit<4> party_role_qualifier_2;
    bit<32> short_code_2;
    bit<4> party_role_3;
    bit<4> party_role_qualifier_3;
    bit<32> short_code_3;
    bit<8> order_capacity;
    bit<32> display_quantity;
    bit<32> min_qty;
    bit<64> reserved_u_648;
}

header order_add_response_message_t {
    bit<32> order_ref;
    bit<32> market_data_id;
    bit<5> reason_code;
    bit<3> order_status;
    bit<32> traded_quantity;
    bit<64> timestamp;
    bit<64> user_tag;
    bit<6> reserved_6;
    bit<1> lis;
    bit<1> dark_flag;
}

header order_cancel_response_message_t {
    bit<32> order_ref;
    bit<32> request_ref;
    bit<5> reason_code;
    bit<3> order_status;
    bit<64> timestamp;
    bit<64> user_tag;
}

header order_modify_response_message_t {
    bit<32> order_ref;
    bit<32> request_ref;
    bit<5> reason_code;
    bit<3> order_status;
    bit<64> timestamp;
    bit<64> user_tag;
    bit<8> order_modify_response_flags_u_81;
}

header iceberg_order_refresh_message_t {
    bit<32> order_ref;
    bit<32> orig_aqx_ord_id;
    bit<32> new_aqx_ord_id;
    bit<32> quantity;
}

header trade_capture_message_t {
    bit<32> quantity;
    bit<64> price;
    bit<32> security_id_u_324;
    bit<8> trade_capture_type;
    bit<1> reserved_1;
    bit<1> algo_trade_flag;
    bit<6> reserved_6;
    bit<8> account;
    bit<64> user_tag;
}

header trade_capture_response_message_t {
    bit<5> reason_code;
    bit<3> order_status;
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
    bit<16> security_id_u_162;
    bit<64> timestamp;
    bit<64> user_tag;
    bit<6> reserved_6;
    bit<1> lis;
    bit<1> dark_flag;
}

header trade_bust_message_t {
    bit<32> order_ref;
    bit<32> quantity;
    bit<64> price;
    bit<8> side;
    bit<32> trade_ref;
    bit<64> timestamp;
}

header ioi_add_message_t {
    bit<16> security_id_u_162;
    bit<8> ioi_order_type;
    bit<8> time_in_force;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<8> order_capacity;
    bit<8> account;
    bit<64> user_tag;
    bit<1> liq_prov;
    bit<1> algo_trade_flag;
    bit<1> dea_flag;
    bit<5> reserved_5;
    bit<4> party_role;
    bit<4> party_role_qualifier;
    bit<32> short_code_1;
    bit<4> party_role_2;
    bit<4> party_role_qualifier_2;
    bit<32> short_code_2;
    bit<4> party_role_3;
    bit<4> party_role_qualifier_3;
    bit<32> short_code_3;
    bit<32> min_qty;
    bit<1> stp_enable;
    bit<1> lis_only;
    bit<6> reserved_6;
    bit<8> optim_x_universe;
    bit<400> blotter_blacklist;
}

header ioi_invite_message_t {
    bit<32> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<32> min_qty;
    bit<64> timestamp;
    bit<64> user_tag;
}

header ioi_firmup_message_t {
    bit<32> order_ref;
    bit<64> price;
    bit<32> quantity;
    bit<32> min_qty;
    bit<64> user_tag;
}

struct metadata_t {
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
    ioi_add_message_t ioi_add_message;
    ioi_invite_message_t ioi_invite_message;
    ioi_firmup_message_t ioi_firmup_message;
}

parser AquisequitiesTradingprotocolParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.msg_type) {
            8w1: parse_login_message;
            8w2: parse_login_response_message;
            8w4: parse_logout_message;
            8w5: parse_order_add_message;
            8w21: parse_order_add_extended_message;
            8w7: parse_order_cancel_message;
            8w9: parse_order_modify_message;
            8w22: parse_order_modify_extended_message;
            8w6: parse_order_add_response_message;
            8w8: parse_order_cancel_response_message;
            8w10: parse_order_modify_response_message;
            8w23: parse_iceberg_order_refresh_message;
            8w17: parse_trade_capture_message;
            8w18: parse_trade_capture_response_message;
            8w11: parse_trade_message;
            8w12: parse_trade_bust_message;
            8w27: parse_ioi_add_message;
            8w28: parse_ioi_invite_message;
            8w29: parse_ioi_firmup_message;
            default: accept;
        }
    }

    state parse_login_message {
        packet.extract(hdr.login_message);
        transition accept;
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message);
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        transition accept;
    }

    state parse_order_add_message {
        packet.extract(hdr.order_add_message);
        transition accept;
    }

    state parse_order_add_extended_message {
        packet.extract(hdr.order_add_extended_message);
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        transition accept;
    }

    state parse_order_modify_message {
        packet.extract(hdr.order_modify_message);
        transition accept;
    }

    state parse_order_modify_extended_message {
        packet.extract(hdr.order_modify_extended_message);
        transition accept;
    }

    state parse_order_add_response_message {
        packet.extract(hdr.order_add_response_message);
        transition accept;
    }

    state parse_order_cancel_response_message {
        packet.extract(hdr.order_cancel_response_message);
        transition accept;
    }

    state parse_order_modify_response_message {
        packet.extract(hdr.order_modify_response_message);
        transition accept;
    }

    state parse_iceberg_order_refresh_message {
        packet.extract(hdr.iceberg_order_refresh_message);
        transition accept;
    }

    state parse_trade_capture_message {
        packet.extract(hdr.trade_capture_message);
        transition accept;
    }

    state parse_trade_capture_response_message {
        packet.extract(hdr.trade_capture_response_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message);
        transition accept;
    }

    state parse_ioi_add_message {
        packet.extract(hdr.ioi_add_message);
        transition accept;
    }

    state parse_ioi_invite_message {
        packet.extract(hdr.ioi_invite_message);
        transition accept;
    }

    state parse_ioi_firmup_message {
        packet.extract(hdr.ioi_firmup_message);
        transition accept;
    }

}

control AquisequitiesTradingprotocolVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesTradingprotocolIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AquisequitiesTradingprotocolEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AquisequitiesTradingprotocolComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AquisequitiesTradingprotocolDeparser(packet_out packet, in headers_t hdr) {
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
        packet.emit(hdr.ioi_add_message);
        packet.emit(hdr.ioi_invite_message);
        packet.emit(hdr.ioi_firmup_message);
    }
}

V1Switch(
    AquisequitiesTradingprotocolParser(),
    AquisequitiesTradingprotocolVerifyChecksum(),
    AquisequitiesTradingprotocolIngress(),
    AquisequitiesTradingprotocolEgress(),
    AquisequitiesTradingprotocolComputeChecksum(),
    AquisequitiesTradingprotocolDeparser()
) main;
