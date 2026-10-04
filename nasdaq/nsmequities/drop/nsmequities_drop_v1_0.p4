// P4_16 (v1model) definition for: Nasdaq NsmEquities Drop AsciiDrop v1.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Drop
//   Encoding: Ascii Drop
//   Version: 1.0
//   Date: 01/13/2015
//   Specification: drop_100.pdf
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
    bit<72> time_stamp;
    bit<8> comma;
    bit<8> message_type;
}

header new_order_accepted_message_t {
    bit<48> source;
    bit<8> separator_1;
    bit<32> user;
    bit<8> separator_2;
    bit<80> token;
    bit<8> separator_3;
    bit<8> buy_sell;
    bit<8> separator_4;
    bit<72> shares;
    bit<8> separator_5;
    bit<48> stock;
    bit<8> separator_6;
    bit<160> price;
    bit<8> separator_7;
    bit<32> firm;
    bit<8> separator_8;
    bit<72> reference;
    bit<8> separator_9;
    bit<72> time_in_force;
    bit<8> separator_10;
    bit<8> capacity;
    bit<8> separator_11;
    bit<8> liquidity_code;
    bit<8> separator_12;
    bit<8> clearing_code;
}

header existing_order_executed_message_t {
    bit<48> source;
    bit<8> separator_1;
    bit<32> user;
    bit<8> separator_2;
    bit<80> token;
    bit<8> separator_3;
    bit<8> buy_sell;
    bit<8> separator_4;
    bit<72> shares;
    bit<8> separator_5;
    bit<48> stock;
    bit<8> separator_6;
    bit<160> price;
    bit<8> separator_7;
    bit<32> firm;
    bit<8> separator_8;
    bit<72> reference;
    bit<8> separator_9;
    bit<72> match_number;
    bit<8> separator_10;
    bit<8> capacity;
    bit<8> separator_11;
    bit<8> liquidity_code;
    bit<8> separator_12;
    bit<8> clearing_code;
}

header existing_order_canceled_message_t {
    bit<48> source;
    bit<8> separator_1;
    bit<32> user;
    bit<8> separator_2;
    bit<80> token;
    bit<8> separator_3;
    bit<8> buy_sell;
    bit<8> separator_4;
    bit<72> shares;
    bit<8> separator_5;
    bit<48> stock;
    bit<8> separator_6;
    bit<160> price;
    bit<8> separator_7;
    bit<32> firm;
    bit<8> separator_8;
    bit<72> reference;
    bit<8> separator_9;
    bit<72> time_in_force;
    bit<8> separator_10;
    bit<8> capacity;
    bit<8> separator_11;
    bit<8> cancel_reason;
    bit<8> separator_12;
    bit<8> clearing_code;
}

header previous_execution_broken_message_t {
    bit<48> source;
    bit<8> separator_1;
    bit<32> user;
    bit<8> separator_2;
    bit<80> token;
    bit<8> separator_3;
    bit<8> buy_sell;
    bit<8> separator_4;
    bit<72> shares;
    bit<8> separator_5;
    bit<48> stock;
    bit<8> separator_6;
    bit<160> price;
    bit<8> separator_7;
    bit<32> firm;
    bit<8> separator_8;
    bit<72> reference;
    bit<8> separator_9;
    bit<72> match_number;
    bit<8> separator_10;
    bit<8> capacity;
    bit<8> separator_11;
    bit<8> liquidity_code;
    bit<8> separator_12;
    bit<8> clearing_code;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    new_order_accepted_message_t new_order_accepted_message;
    existing_order_executed_message_t existing_order_executed_message;
    existing_order_canceled_message_t existing_order_canceled_message;
    previous_execution_broken_message_t previous_execution_broken_message;
}

parser NsmequitiesDropParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x41: parse_new_order_accepted_message;
            8w0x45: parse_existing_order_executed_message;
            8w0x58: parse_existing_order_canceled_message;
            8w0x42: parse_previous_execution_broken_message;
            default: accept;
        }
    }

    state parse_new_order_accepted_message {
        packet.extract(hdr.new_order_accepted_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_existing_order_executed_message {
        packet.extract(hdr.existing_order_executed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_existing_order_canceled_message {
        packet.extract(hdr.existing_order_canceled_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_previous_execution_broken_message {
        packet.extract(hdr.previous_execution_broken_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsmequitiesDropVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesDropIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesDropEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesDropComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesDropDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.new_order_accepted_message);
        packet.emit(hdr.existing_order_executed_message);
        packet.emit(hdr.existing_order_canceled_message);
        packet.emit(hdr.previous_execution_broken_message);
    }
}

V1Switch(
    NsmequitiesDropParser(),
    NsmequitiesDropVerifyChecksum(),
    NsmequitiesDropIngress(),
    NsmequitiesDropEgress(),
    NsmequitiesDropComputeChecksum(),
    NsmequitiesDropDeparser()
) main;
