// P4_16 (v1model) definition for: OtcMarkets LinkNqb Retransmission Link v1.18
// 
// Protocol:
//   Organization: OTC Markets Group
//   Protocol: OTC Retransmission
//   Encoding: Otc Link
//   Version: 1.18
//   Date: 5/1/2026
//   Specification: OTC-Link-NQB-MD-Specification.pdf
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
    bit<16> message_size;
    bit<8> message_type;
}

header start_of_spin_message_t {
    bit<8> spin_type;
    bit<64> spin_start_time_milli;
    bit<32> spin_last_seq_num;
}

header end_of_spin_message_t {
    bit<8> spin_type;
    bit<32> spin_msg_ct;
    bit<64> spin_end_time_milli;
    bit<32> spin_last_seq_num;
}

header trading_session_message_t {
    bit<64> session_time;
    bit<8> trading_session;
}

header security_message_t {
    bit<112> symbol;
    bit<64> last_update_milli;
    bit<8> security_action;
    bit<8> asset_class;
    bit<32> security_id;
    bit<1> piggyback_flag;
    bit<1> caveat_flag;
    bit<1> qib_only_144_a;
    bit<1> unsolicited_only_flag;
    bit<1> closing_cross_auction;
    bit<11> reserved_11;
    bit<8> tier;
    bit<8> reporting_status;
    bit<8> security_status;
}

header order_add_message_t {
    bit<32> time;
    bit<112> order_id;
    bit<8> side_indicator;
    bit<32> quantity;
    bit<112> symbol;
    bit<64> price;
    bit<32> firm_id;
    bit<8> unsolicited;
    bit<16> order_flags;
}

header order_update_message_t {
    bit<32> time;
    bit<112> order_id;
    bit<32> quantity;
    bit<64> price;
    bit<16> order_flags;
}

header order_delete_message_t {
    bit<32> time;
    bit<112> order_id;
}

header order_execution_message_t {
    bit<32> time;
    bit<112> order_id;
    bit<32> executed_quantity;
    bit<32> remaining_quantity;
    bit<64> execution_id;
}

header order_execution_with_price_message_t {
    bit<32> time;
    bit<112> order_id;
    bit<32> executed_quantity;
    bit<32> remaining_quantity;
    bit<64> execution_id;
    bit<64> price;
}

header trade_message_t {
    bit<32> time;
    bit<8> side_indicator;
    bit<32> quantity;
    bit<112> symbol;
    bit<64> price;
    bit<64> execution_id;
    bit<64> reserved_binary_long_8;
}

header top_of_book_message_t {
    bit<32> time;
    bit<112> symbol;
    bit<64> ask_price;
    bit<32> ask_volume;
    bit<64> bid_price;
    bit<32> bid_volume;
    bit<8> unsolicited;
}

header imbalance_message_t {
    bit<32> time;
    bit<112> symbol;
    bit<32> current_inside_paired_shares;
    bit<64> current_inside_closing_price;
    bit<32> current_inside_imbalance_quantity;
    bit<8> current_inside_imbalance_side;
    bit<64> full_closing_price;
    bit<64> ocio_only_closing_price;
    bit<8> moc_shares_unmatched;
}

header system_recovery_event_message_t {
    bit<32> deprecated;
    bit<8> recovery_type;
    bit<32> next_sequence_number;
    bit<64> recovery_start_time;
}

header login_request_message_t {
    bit<128> user_id;
    bit<128> password;
}

header login_response_message_t {
    bit<128> user_id;
    bit<8> login_status;
}

header retransmission_request_message_t {
    bit<32> start_sequence;
    bit<32> number_of_messages;
    bit<8> retran_via_tcp;
}

header retransmission_response_message_t {
    bit<32> start_sequence;
    bit<32> number_of_messages;
    bit<8> retransmission_status;
}

header spin_request_message_t {
    bit<32> client_identifier;
}

header spin_response_message_t {
    bit<32> client_identifier;
    bit<8> spin_status;
}

header enhanced_spin_request_message_t {
    bit<32> client_identifier;
}

header enhanced_spin_response_message_t {
    bit<32> client_identifier;
    bit<8> enhanced_spin_status;
    bit<32> last_seq_num;
}

header heartbeat_message_t {
    bit<32> client_identifier;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    start_of_spin_message_t start_of_spin_message;
    end_of_spin_message_t end_of_spin_message;
    trading_session_message_t trading_session_message;
    security_message_t security_message;
    order_add_message_t order_add_message;
    order_update_message_t order_update_message;
    order_delete_message_t order_delete_message;
    order_execution_message_t order_execution_message;
    order_execution_with_price_message_t order_execution_with_price_message;
    trade_message_t trade_message;
    top_of_book_message_t top_of_book_message;
    imbalance_message_t imbalance_message;
    system_recovery_event_message_t system_recovery_event_message;
    login_request_message_t login_request_message;
    login_response_message_t login_response_message;
    retransmission_request_message_t retransmission_request_message;
    retransmission_response_message_t retransmission_response_message;
    spin_request_message_t spin_request_message;
    spin_response_message_t spin_response_message;
    enhanced_spin_request_message_t enhanced_spin_request_message;
    enhanced_spin_response_message_t enhanced_spin_response_message;
    heartbeat_message_t heartbeat_message;
}

parser LinknqbRetransmissionParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w11: parse_start_of_spin_message;
            8w12: parse_end_of_spin_message;
            8w20: parse_trading_session_message;
            8w9: parse_security_message;
            8w21: parse_order_add_message;
            8w22: parse_order_update_message;
            8w23: parse_order_delete_message;
            8w24: parse_order_execution_message;
            8w25: parse_order_execution_with_price_message;
            8w26: parse_trade_message;
            8w27: parse_top_of_book_message;
            8w28: parse_imbalance_message;
            8w74: parse_system_recovery_event_message;
            8w108: parse_login_request_message;
            8w97: parse_login_response_message;
            8w114: parse_retransmission_request_message;
            8w98: parse_retransmission_response_message;
            8w115: parse_spin_request_message;
            8w99: parse_spin_response_message;
            8w116: parse_enhanced_spin_request_message;
            8w100: parse_enhanced_spin_response_message;
            8w104: parse_heartbeat_message;
            default: accept;
        }
    }

    state parse_start_of_spin_message {
        packet.extract(hdr.start_of_spin_message);
        transition accept;
    }

    state parse_end_of_spin_message {
        packet.extract(hdr.end_of_spin_message);
        transition accept;
    }

    state parse_trading_session_message {
        packet.extract(hdr.trading_session_message);
        transition accept;
    }

    state parse_security_message {
        packet.extract(hdr.security_message);
        transition accept;
    }

    state parse_order_add_message {
        packet.extract(hdr.order_add_message);
        transition accept;
    }

    state parse_order_update_message {
        packet.extract(hdr.order_update_message);
        transition accept;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message);
        transition accept;
    }

    state parse_order_execution_message {
        packet.extract(hdr.order_execution_message);
        transition accept;
    }

    state parse_order_execution_with_price_message {
        packet.extract(hdr.order_execution_with_price_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_top_of_book_message {
        packet.extract(hdr.top_of_book_message);
        transition accept;
    }

    state parse_imbalance_message {
        packet.extract(hdr.imbalance_message);
        transition accept;
    }

    state parse_system_recovery_event_message {
        packet.extract(hdr.system_recovery_event_message);
        transition accept;
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message);
        transition accept;
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message);
        transition accept;
    }

    state parse_retransmission_request_message {
        packet.extract(hdr.retransmission_request_message);
        transition accept;
    }

    state parse_retransmission_response_message {
        packet.extract(hdr.retransmission_response_message);
        transition accept;
    }

    state parse_spin_request_message {
        packet.extract(hdr.spin_request_message);
        transition accept;
    }

    state parse_spin_response_message {
        packet.extract(hdr.spin_response_message);
        transition accept;
    }

    state parse_enhanced_spin_request_message {
        packet.extract(hdr.enhanced_spin_request_message);
        transition accept;
    }

    state parse_enhanced_spin_response_message {
        packet.extract(hdr.enhanced_spin_response_message);
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        transition accept;
    }

}

control LinknqbRetransmissionVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinknqbRetransmissionIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LinknqbRetransmissionEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LinknqbRetransmissionComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinknqbRetransmissionDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.start_of_spin_message);
        packet.emit(hdr.end_of_spin_message);
        packet.emit(hdr.trading_session_message);
        packet.emit(hdr.security_message);
        packet.emit(hdr.order_add_message);
        packet.emit(hdr.order_update_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.order_execution_message);
        packet.emit(hdr.order_execution_with_price_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.top_of_book_message);
        packet.emit(hdr.imbalance_message);
        packet.emit(hdr.system_recovery_event_message);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.login_response_message);
        packet.emit(hdr.retransmission_request_message);
        packet.emit(hdr.retransmission_response_message);
        packet.emit(hdr.spin_request_message);
        packet.emit(hdr.spin_response_message);
        packet.emit(hdr.enhanced_spin_request_message);
        packet.emit(hdr.enhanced_spin_response_message);
        packet.emit(hdr.heartbeat_message);
    }
}

V1Switch(
    LinknqbRetransmissionParser(),
    LinknqbRetransmissionVerifyChecksum(),
    LinknqbRetransmissionIngress(),
    LinknqbRetransmissionEgress(),
    LinknqbRetransmissionComputeChecksum(),
    LinknqbRetransmissionDeparser()
) main;
