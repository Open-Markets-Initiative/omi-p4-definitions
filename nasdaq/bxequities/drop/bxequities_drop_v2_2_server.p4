// P4_16 (v1model) definition for: Nasdaq BxEquities Drop AsciiDrop v2.2
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Drop
//   Encoding: Ascii Drop
//   Version: 2.2
//   Date: 04/23/2018
//   Specification: NQBXDROP2.2.pdf
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

header server_packet_header_t {
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<160> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<72> time_stamp;
    bit<8> comma;
    bit<8> message_type;
}

header new_order_accepted_message_t {
    bit<8> separator_1;
    bit<48> source;
    bit<8> separator_2;
    bit<32> user;
    bit<8> separator_3;
    bit<80> token;
    bit<8> separator_4;
    bit<80> replaced_token;
    bit<8> separator_5;
    bit<8> buy_sell;
    bit<8> separator_6;
    bit<48> shares;
    bit<8> separator_7;
    bit<64> stock;
    bit<8> separator_8;
    bit<88> price;
    bit<8> separator_9;
    bit<32> firm;
    bit<8> separator_10;
    bit<96> reference;
    bit<8> separator_11;
    bit<96> time_in_force;
    bit<8> separator_12;
    bit<8> capacity;
    bit<8> separator_13;
    bit<8> liquidity_code;
    bit<8> separator_14;
    bit<8> clearing_code;
}

header existing_order_executed_message_t {
    bit<8> separator_1;
    bit<48> source;
    bit<8> separator_2;
    bit<32> user;
    bit<8> separator_3;
    bit<80> token;
    bit<8> separator_4;
    bit<80> replaced_token;
    bit<8> separator_5;
    bit<8> buy_sell;
    bit<8> separator_6;
    bit<48> shares;
    bit<8> separator_7;
    bit<64> stock;
    bit<8> separator_8;
    bit<88> price;
    bit<8> separator_9;
    bit<32> firm;
    bit<8> separator_10;
    bit<96> reference;
    bit<8> separator_11;
    bit<96> match_number;
    bit<8> separator_12;
    bit<8> capacity;
    bit<8> separator_13;
    bit<8> liquidity_code;
    bit<8> separator_14;
    bit<8> clearing_code;
}

header existing_order_canceled_message_t {
    bit<8> separator_1;
    bit<48> source;
    bit<8> separator_2;
    bit<32> user;
    bit<8> separator_3;
    bit<80> token;
    bit<8> separator_4;
    bit<80> replaced_token;
    bit<8> separator_5;
    bit<8> buy_sell;
    bit<8> separator_6;
    bit<48> shares;
    bit<8> separator_7;
    bit<64> stock;
    bit<8> separator_8;
    bit<88> price;
    bit<8> separator_9;
    bit<32> firm;
    bit<8> separator_10;
    bit<96> reference;
    bit<8> separator_11;
    bit<96> time_in_force;
    bit<8> separator_12;
    bit<8> capacity;
    bit<8> separator_13;
    bit<8> liquidity_code;
    bit<8> separator_14;
    bit<8> clearing_code;
}

header previous_execution_broken_message_t {
    bit<8> separator_1;
    bit<48> source;
    bit<8> separator_2;
    bit<32> user;
    bit<8> separator_3;
    bit<80> token;
    bit<8> separator_4;
    bit<80> replaced_token;
    bit<8> separator_5;
    bit<8> buy_sell;
    bit<8> separator_6;
    bit<48> shares;
    bit<8> separator_7;
    bit<64> stock;
    bit<8> separator_8;
    bit<88> price;
    bit<8> separator_9;
    bit<32> firm;
    bit<8> separator_10;
    bit<96> reference;
    bit<8> separator_11;
    bit<96> match_number;
    bit<8> separator_12;
    bit<8> capacity;
    bit<8> separator_13;
    bit<8> liquidity_code;
    bit<8> separator_14;
    bit<8> clearing_code;
}

header existing_order_replaced_message_t {
    bit<8> separator_1;
    bit<48> source;
    bit<8> separator_2;
    bit<32> user;
    bit<8> separator_3;
    bit<80> token;
    bit<8> separator_4;
    bit<80> replaced_token;
    bit<8> separator_5;
    bit<8> buy_sell;
    bit<8> separator_6;
    bit<48> shares;
    bit<8> separator_7;
    bit<64> stock;
    bit<8> separator_8;
    bit<88> price;
    bit<8> separator_9;
    bit<32> firm;
    bit<8> separator_10;
    bit<96> reference;
    bit<8> separator_11;
    bit<96> time_in_force;
    bit<8> separator_12;
    bit<8> capacity;
    bit<8> separator_13;
    bit<8> liquidity_code;
    bit<8> separator_14;
    bit<8> clearing_code;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    new_order_accepted_message_t new_order_accepted_message;
    existing_order_executed_message_t existing_order_executed_message;
    existing_order_canceled_message_t existing_order_canceled_message;
    previous_execution_broken_message_t previous_execution_broken_message;
    existing_order_replaced_message_t existing_order_replaced_message;
}

parser BxequitiesDropServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.message_type) {
            8w0x41: parse_new_order_accepted_message;
            8w0x45: parse_existing_order_executed_message;
            8w0x58: parse_existing_order_canceled_message;
            8w0x42: parse_previous_execution_broken_message;
            8w0x55: parse_existing_order_replaced_message;
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

    state parse_existing_order_replaced_message {
        packet.extract(hdr.existing_order_replaced_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control BxequitiesDropServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BxequitiesDropServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BxequitiesDropServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BxequitiesDropServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BxequitiesDropServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.new_order_accepted_message);
        packet.emit(hdr.existing_order_executed_message);
        packet.emit(hdr.existing_order_canceled_message);
        packet.emit(hdr.previous_execution_broken_message);
        packet.emit(hdr.existing_order_replaced_message);
    }
}

V1Switch(
    BxequitiesDropServerParser(),
    BxequitiesDropServerVerifyChecksum(),
    BxequitiesDropServerIngress(),
    BxequitiesDropServerEgress(),
    BxequitiesDropServerComputeChecksum(),
    BxequitiesDropServerDeparser()
) main;
