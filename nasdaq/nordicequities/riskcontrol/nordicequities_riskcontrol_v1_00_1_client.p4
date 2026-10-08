// P4_16 (v1model) definition for: Nasdaq NordicEquities RiskControl Binary v1.00.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nordic Pre-Trade Risk Management
//   Encoding: Binary
//   Version: 1.00.1
//   Date: 02/10/2026
//   Specification: Nasdaq-Nordic---PRM-v.1.00.1.pdf
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_t {
    bit<8> unsequenced_message_type;
}

header modify_account_settings_message_t {
    bit<32> user_ref_num;
    bit<48> prm_account;
    bit<32> repeated_order_generation;
    bit<8> trigger_restrict_symbol_on_repeated_order_generation;
    bit<8> in_auction_market_order_prevention;
    bit<8> in_auction_fat_finger_protection;
    bit<8> in_auction_market_order_protection;
    bit<8> block_and_cancel;
}

header modify_order_book_restriction_message_t {
    bit<32> user_ref_num;
    bit<48> prm_account;
    bit<32> order_book;
    bit<8> state_;
}

header modify_market_segment_restriction_message_t {
    bit<32> user_ref_num;
    bit<48> prm_account;
    bit<16> market_segment;
    bit<8> state_;
}

header modify_limit_settings_message_t {
    bit<32> user_ref_num;
    bit<48> prm_account;
    bit<24> currency;
    bit<64> max_quantity;
    bit<64> max_value;
    bit<64> unused;
    bit<64> total_risk_value;
    bit<64> trade_buy_value;
    bit<64> trade_sell_value;
    bit<64> trade_net_value;
    bit<64> open_order_buy_value;
    bit<64> open_order_sell_value;
    bit<64> open_order_net_value;
    bit<64> max_quantity_auction;
    bit<64> max_value_auction;
}

header modify_account_currency_setting_message_t {
    bit<32> user_ref_num;
    bit<48> prm_account;
    bit<24> currency;
    bit<8> reject_all_flag;
    bit<8> blow_through_protection;
}

header debug_packet_debug_text_t {
    varbit<2048> debug_text;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    modify_account_settings_message_t modify_account_settings_message;
    modify_order_book_restriction_message_t modify_order_book_restriction_message;
    modify_market_segment_restriction_message_t modify_market_segment_restriction_message;
    modify_limit_settings_message_t modify_limit_settings_message;
    modify_account_currency_setting_message_t modify_account_currency_setting_message;
    debug_packet_debug_text_t debug_packet_debug_text;
}

parser NordicequitiesRiskcontrolClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat;
            8w0x4f: parse_logout_request;
            default: accept;
        }
    }

    state parse_debug_packet {
        meta.dispatched = 1;
        packet.extract(hdr.debug_packet_debug_text, (bit<32>)hdr.client_packet_header.packet_length * 8);
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            8w0x51: parse_account_query_message;
            8w0x43: parse_modify_account_settings_message;
            8w0x52: parse_modify_order_book_restriction_message;
            8w0x53: parse_modify_market_segment_restriction_message;
            8w0x4c: parse_modify_limit_settings_message;
            8w0x46: parse_modify_account_currency_setting_message;
            default: accept;
        }
    }

    state parse_account_query_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_account_settings_message {
        packet.extract(hdr.modify_account_settings_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_order_book_restriction_message {
        packet.extract(hdr.modify_order_book_restriction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_market_segment_restriction_message {
        packet.extract(hdr.modify_market_segment_restriction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_limit_settings_message {
        packet.extract(hdr.modify_limit_settings_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_account_currency_setting_message {
        packet.extract(hdr.modify_account_currency_setting_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        meta.dispatched = 1;
        transition accept;
    }

}

control NordicequitiesRiskcontrolClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesRiskcontrolClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicequitiesRiskcontrolClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicequitiesRiskcontrolClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesRiskcontrolClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet_debug_text);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.modify_account_settings_message);
        packet.emit(hdr.modify_order_book_restriction_message);
        packet.emit(hdr.modify_market_segment_restriction_message);
        packet.emit(hdr.modify_limit_settings_message);
        packet.emit(hdr.modify_account_currency_setting_message);
    }
}

V1Switch(
    NordicequitiesRiskcontrolClientParser(),
    NordicequitiesRiskcontrolClientVerifyChecksum(),
    NordicequitiesRiskcontrolClientIngress(),
    NordicequitiesRiskcontrolClientEgress(),
    NordicequitiesRiskcontrolClientComputeChecksum(),
    NordicequitiesRiskcontrolClientDeparser()
) main;
