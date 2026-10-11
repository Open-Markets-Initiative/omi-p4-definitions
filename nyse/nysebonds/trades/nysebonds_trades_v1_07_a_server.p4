// P4_16 (v1model) definition for: Nyse NyseBonds Trades Abp v1.07.a
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Trades
//   Encoding: Arca Binary Protocol
//   Version: 1.07.a
//   Date: 09/04/2012
//   Specification: NYSE_Bonds_Trades_Client_Specification_v1.07a.pdf
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

header last_sale_message_t {
    bit<32> last_sale_time;
    bit<32> sequence_number;
    bit<32> trade_reference_number;
    bit<32> quantity;
    bit<32> price;
    bit<8> price_scale_code;
    bit<8> system_code;
    bit<8> exchange_code;
    bit<8> trade_condition;
    bit<8> security_type;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<24> padding_ascii_3;
}

header trade_bust_or_correction_message_t {
    bit<32> last_sale_time;
    bit<32> sequence_number;
    bit<32> trade_reference_number;
    bit<32> quantity;
    bit<32> price;
    bit<8> price_scale_code;
    bit<8> system_code;
    bit<8> event_code;
    bit<8> exchange_code;
    bit<8> trade_condition;
    bit<8> security_type;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<16> padding_ascii_2;
}

header nyse_bond_closing_price_message_t {
    bit<32> closing_time;
    bit<32> sequence_number;
    bit<32> trade_reference_number;
    bit<32> quantity;
    bit<32> closing_price;
    bit<8> price_scale_code;
    bit<8> system_code;
    bit<8> exchange_code;
    bit<8> trade_condition;
    bit<8> security_type;
    bit<176> nyse_bond_symbol;
    bit<112> cusip_isin;
    bit<24> padding_ascii_3;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    login_accepted_message_t login_accepted_message;
    login_rejected_message_t login_rejected_message;
    test_response_message_t test_response_message;
    last_sale_message_t last_sale_message;
    trade_bust_or_correction_message_t trade_bust_or_correction_message;
    nyse_bond_closing_price_message_t nyse_bond_closing_price_message;
}

parser NysebondsTradesServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x51: parse_login_accepted_message;
            8w0x52: parse_login_rejected_message;
            8w0x48: parse_heartbeat_message;
            8w0x53: parse_test_response_message;
            8w0x58: parse_last_sale_message;
            8w0x55: parse_trade_bust_or_correction_message;
            8w0x5a: parse_nyse_bond_closing_price_message;
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

    state parse_last_sale_message {
        packet.extract(hdr.last_sale_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_bust_or_correction_message {
        packet.extract(hdr.trade_bust_or_correction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_nyse_bond_closing_price_message {
        packet.extract(hdr.nyse_bond_closing_price_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NysebondsTradesServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsTradesServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NysebondsTradesServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NysebondsTradesServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NysebondsTradesServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.login_accepted_message);
        packet.emit(hdr.login_rejected_message);
        packet.emit(hdr.test_response_message);
        packet.emit(hdr.last_sale_message);
        packet.emit(hdr.trade_bust_or_correction_message);
        packet.emit(hdr.nyse_bond_closing_price_message);
    }
}

V1Switch(
    NysebondsTradesServerParser(),
    NysebondsTradesServerVerifyChecksum(),
    NysebondsTradesServerIngress(),
    NysebondsTradesServerEgress(),
    NysebondsTradesServerComputeChecksum(),
    NysebondsTradesServerDeparser()
) main;
