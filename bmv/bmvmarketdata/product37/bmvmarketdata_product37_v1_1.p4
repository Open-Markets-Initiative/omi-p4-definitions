// P4_16 (v1model) definition for: Bmv BmvMarketData Product37 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 37
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P37_eng.pdf
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

header intra_multicast_header_t {
    bit<16> length;
    bit<8> total_messages;
    bit<8> market_data_group;
    bit<8> session;
    bit<32> sequence_number;
    bit<64> datetime;
}

header intra_multicast_header_message_block_t {
    bit<16> message_length;
    bit<16> message_type;
}

header order_adition_message_t {
    bit<32> id_instrument;
    bit<64> date_and_hour;
    bit<32> folio;
    bit<8> direction;
    bit<32> volume;
    bit<64> price;
    bit<40> participant;
    bit<8> operation_type;
}

header execution_of_orders_message_t {
    bit<32> id_instrument;
    bit<64> date;
    bit<32> folio;
    bit<32> volume;
    bit<32> trade_number;
    bit<64> execution_price;
    bit<8> operation_type;
}

header order_cancellation_message_t {
    bit<32> id_instrument;
    bit<64> date;
    bit<32> folio;
    bit<8> operation_type;
}

header order_change_message_t {
    bit<32> id_instrument;
    bit<64> original_date;
    bit<32> original_folio;
    bit<64> new_date;
    bit<32> new_folio;
    bit<8> direction;
    bit<32> volume;
    bit<64> price;
    bit<8> operation_type;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    order_adition_message_t order_adition_message[MAX_MESSAGES];
    execution_of_orders_message_t execution_of_orders_message[MAX_MESSAGES];
    order_cancellation_message_t order_cancellation_message[MAX_MESSAGES];
    order_change_message_t order_change_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct37Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.intra_multicast_header);
        transition select(hdr.intra_multicast_header.total_messages) {
            8w0: parse_intra_multicast_header_message_block_empty;
            default: parse_intra_multicast_header_message_block;
        }
    }

    state parse_intra_multicast_header_message_block {
        packet.extract(hdr.intra_multicast_header_message_block.next);
        transition select(hdr.intra_multicast_header_message_block.last.message_type) {
            16w0x4143: parse_order_adition_message;
            16w0x4343: parse_execution_of_orders_message;
            16w0x4443: parse_order_cancellation_message;
            16w0x4643: parse_order_change_message;
            default: accept;
        }
    }

    state parse_order_adition_message {
        packet.extract(hdr.order_adition_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_execution_of_orders_message {
        packet.extract(hdr.execution_of_orders_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_order_cancellation_message {
        packet.extract(hdr.order_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_order_change_message {
        packet.extract(hdr.order_change_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct37VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct37Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct37Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct37ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct37Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.order_adition_message);
        packet.emit(hdr.execution_of_orders_message);
        packet.emit(hdr.order_cancellation_message);
        packet.emit(hdr.order_change_message);
    }
}

V1Switch(
    BmvmarketdataProduct37Parser(),
    BmvmarketdataProduct37VerifyChecksum(),
    BmvmarketdataProduct37Ingress(),
    BmvmarketdataProduct37Egress(),
    BmvmarketdataProduct37ComputeChecksum(),
    BmvmarketdataProduct37Deparser()
) main;
