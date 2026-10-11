// P4_16 (v1model) definition for: Nyse NyseBonds DepthOfBook Abp v4.01.b
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: DepthOfBook
//   Encoding: Arca Binary Protocol
//   Version: 4.01.b
//   Date: 10/13/2015
//   Specification: NYSE_Bonds_Depth_of_Book_Client_Spec.pdf
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
    bit<16> message_body_length;
    bit<8> message_type;
    bit<8> padding;
}

header login_accepted_message_t {
    bit<40> version_id;
    bit<8> padding_ascii_1;
}

header login_rejected_message_t {
    bit<8> reject_code;
    bit<8> padding_ascii_1;
}

header test_response_message_t {
    bit<160> test_message;
}

header add_order_message_t {
    bit<32> time;
    bit<32> sequence_number;
    bit<32> order_reference_number;
    bit<32> quantity;
    bit<32> price;
    bit<8> price_scale_code;
    bit<8> exchange_code;
    bit<8> system_code;
    bit<8> buy_sell_indicator;
    bit<8> flat_pricing;
    bit<8> trading_action;
    bit<8> security_type;
    bit<8> order_type;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<40> quote_id;
    bit<24> padding_ascii_3;
    bit<32> minimum_quantity;
}

header modify_order_message_t {
    bit<32> time;
    bit<32> sequence_number;
    bit<32> order_reference_number;
    bit<32> quantity;
    bit<32> price;
    bit<8> price_scale_code;
    bit<8> exchange_code;
    bit<8> system_code;
    bit<8> buy_sell_indicator;
    bit<8> flat_pricing;
    bit<8> trading_action;
    bit<8> security_type;
    bit<8> order_type;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<40> quote_id;
    bit<24> padding_ascii_3;
    bit<32> minimum_quantity;
}

header delete_order_message_t {
    bit<32> time;
    bit<32> sequence_number;
    bit<32> order_reference_number;
    bit<8> exchange_code;
    bit<8> system_code;
    bit<8> buy_sell_indicator;
    bit<8> flat_pricing;
    bit<8> trading_action;
    bit<8> security_type;
    bit<8> order_type;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<40> quote_id;
}

header imbalance_message_t {
    bit<32> time;
    bit<32> sequence_number;
    bit<32> match_quantity;
    bit<32> total_imbalance;
    bit<32> market_imbalance;
    bit<32> price;
    bit<8> price_scale_code;
    bit<8> exchange_code;
    bit<8> system_code;
    bit<8> auction_type;
    bit<8> flat_pricing;
    bit<8> trading_action;
    bit<8> security_type;
    bit<8> quote_condition;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<32> auction_time;
}

header system_event_message_t {
    bit<32> time;
    bit<32> sequence_number;
    bit<32> next_expected_sequence_number;
    bit<8> event_code;
    bit<8> system_code;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<16> padding_ascii_2;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    login_accepted_message_t login_accepted_message;
    login_rejected_message_t login_rejected_message;
    test_response_message_t test_response_message;
    add_order_message_t add_order_message;
    modify_order_message_t modify_order_message;
    delete_order_message_t delete_order_message;
    imbalance_message_t imbalance_message;
    system_event_message_t system_event_message;
}

parser NysebondsDepthofbookServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x51: parse_login_accepted_message;
            8w0x52: parse_login_rejected_message;
            8w0x48: parse_heartbeat_message;
            8w0x53: parse_test_response_message;
            8w0x4e: parse_add_order_message;
            8w0x43: parse_modify_order_message;
            8w0x4b: parse_delete_order_message;
            8w0x57: parse_imbalance_message;
            8w0x59: parse_system_event_message;
            default: accept;
        }
    }

    state parse_login_accepted_message {
        packet.extract(hdr.login_accepted_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_message {
        packet.extract(hdr.login_rejected_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_test_response_message {
        packet.extract(hdr.test_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_modify_order_message {
        packet.extract(hdr.modify_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_delete_order_message {
        packet.extract(hdr.delete_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_imbalance_message {
        packet.extract(hdr.imbalance_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NysebondsDepthofbookServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsDepthofbookServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NysebondsDepthofbookServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NysebondsDepthofbookServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsDepthofbookServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_accepted_message);
        packet.emit(hdr.login_rejected_message);
        packet.emit(hdr.test_response_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.modify_order_message);
        packet.emit(hdr.delete_order_message);
        packet.emit(hdr.imbalance_message);
        packet.emit(hdr.system_event_message);
    }
}

V1Switch(
    NysebondsDepthofbookServerParser(),
    NysebondsDepthofbookServerVerifyChecksum(),
    NysebondsDepthofbookServerIngress(),
    NysebondsDepthofbookServerEgress(),
    NysebondsDepthofbookServerComputeChecksum(),
    NysebondsDepthofbookServerDeparser()
) main;
