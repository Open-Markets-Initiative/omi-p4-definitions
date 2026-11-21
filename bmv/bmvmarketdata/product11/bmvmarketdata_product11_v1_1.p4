// P4_16 (v1model) definition for: Bmv BmvMarketData Product11 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 11
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P11_1_ENG.pdf
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
    bit<8> message_type;
}

header events_system_message_t {
    bit<32> instrument_number;
    bit<8> event_code;
    bit<8> market;
    bit<64> sending_time;
    bit<64> ending_time;
}

header trade_cancellation_message_t {
    bit<32> instrument_number;
    bit<32> trade_number;
}

header capital_trades_message_t {
    bit<32> instrument_number;
    bit<64> trade_time;
    bit<32> volume;
    bit<64> price;
    bit<8> concertation_type;
    bit<32> trade_number;
    bit<8> price_setter;
    bit<8> operation_type;
    bit<64> amount;
    bit<40> buy;
    bit<40> sell;
    bit<8> settlement;
    bit<8> auction_indicator;
}

header registry_operations_message_t {
    bit<32> instrument_number;
    bit<8> offer_type;
    bit<8> income;
    bit<32> value_type;
    bit<56> issuer;
    bit<48> series;
    bit<64> maximum_volume;
    bit<64> registered_volume;
    bit<64> price_rate;
    bit<64> settlement_date;
    bit<40> firm;
    bit<8> movement;
}

header public_offerings_message_t {
    bit<32> instrument_number;
    bit<32> number;
    bit<64> volume_long;
    bit<64> discount_rate_or_price;
    bit<32> rate_of_return;
    bit<16> term_days;
    bit<8> currency_type;
    bit<8> settlement;
    bit<40> buy;
    bit<40> sell;
    bit<64> placement_date;
    bit<64> issue_date;
    bit<64> maturity_date;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    events_system_message_t events_system_message[MAX_MESSAGES];
    trade_cancellation_message_t trade_cancellation_message[MAX_MESSAGES];
    capital_trades_message_t capital_trades_message[MAX_MESSAGES];
    registry_operations_message_t registry_operations_message[MAX_MESSAGES];
    public_offerings_message_t public_offerings_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct11Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x53: parse_events_system_message;
            8w0x48: parse_trade_cancellation_message;
            8w0x50: parse_capital_trades_message;
            8w0x5A: parse_registry_operations_message;
            8w0x42: parse_public_offerings_message;
            default: accept;
        }
    }

    state parse_events_system_message {
        packet.extract(hdr.events_system_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_trade_cancellation_message {
        packet.extract(hdr.trade_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_capital_trades_message {
        packet.extract(hdr.capital_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_registry_operations_message {
        packet.extract(hdr.registry_operations_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_public_offerings_message {
        packet.extract(hdr.public_offerings_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct11VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct11Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct11Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct11ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct11Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.events_system_message);
        packet.emit(hdr.trade_cancellation_message);
        packet.emit(hdr.capital_trades_message);
        packet.emit(hdr.registry_operations_message);
        packet.emit(hdr.public_offerings_message);
    }
}

V1Switch(
    BmvmarketdataProduct11Parser(),
    BmvmarketdataProduct11VerifyChecksum(),
    BmvmarketdataProduct11Ingress(),
    BmvmarketdataProduct11Egress(),
    BmvmarketdataProduct11ComputeChecksum(),
    BmvmarketdataProduct11Deparser()
) main;
