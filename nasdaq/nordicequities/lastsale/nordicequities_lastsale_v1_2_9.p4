// P4_16 (v1model) definition for: Nasdaq NordicEquities LastSale Itch v1.2.9
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Nordic Equity Last Sale
//   Encoding: Itch
//   Version: 1.2.9
//   Date: 07/18/2025
//   Specification: Nasdaq Nordic INET Equity Last Sale NLS (1.2.9).pdf
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

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header adjusted_closing_price_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> order_book;
    bit<64> adjusted_closing_price;
}

header on_exchange_trade_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> order_book;
    bit<32> execution_date;
    bit<64> execution_time;
    bit<32> agreement_date;
    bit<64> agreement_time;
    bit<64> price_on_exchange;
    bit<64> quantity;
    bit<32> venue_of_execution;
    bit<80> transaction_identifier_code;
    bit<112> mmt_trade_flags;
    bit<8> trade_type;
    bit<32> mpid_buyer;
    bit<32> mpid_seller;
    bit<8> transaction_to_be_cleared;
}

header otc_trade_message_t {
    bit<64> timestamp;
    bit<16> tracking_number;
    bit<32> instrument_identification_code_type;
    bit<96> instrument_identification_code;
    bit<32> agreement_date;
    bit<64> agreement_time;
    bit<64> price_otc;
    bit<8> price_fraction;
    bit<32> price_notation;
    bit<24> price_currency;
    bit<64> quantity;
    bit<8> quantity_fraction;
    bit<200> notation_of_the_quantity_in_measurement_unit;
    bit<64> quantity_in_measurement_unit;
    bit<8> quantity_in_measurement_unit_fraction;
    bit<32> venue_of_execution;
    bit<64> notional_amount;
    bit<8> notional_amount_fraction;
    bit<24> notional_currency;
    bit<32> type_;
    bit<80> transaction_identifier_code;
    bit<112> mmt_trade_flags;
    bit<8> transaction_to_be_cleared;
    bit<8> trade_type;
    bit<32> third_country_trading_venue_of_execution;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    adjusted_closing_price_message_t adjusted_closing_price_message[MAX_MESSAGES];
    on_exchange_trade_message_t on_exchange_trade_message[MAX_MESSAGES];
    otc_trade_message_t otc_trade_message[MAX_MESSAGES];
}

parser NordicequitiesLastsaleParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.message_count) {
            16w0: parse_heartbeat;
            16w65535: parse_end_of_session;
            default: parse_message;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x47: parse_adjusted_closing_price_message;
            8w0x54: parse_on_exchange_trade_message;
            8w0x5a: parse_otc_trade_message;
            default: accept;
        }
    }

    state parse_adjusted_closing_price_message {
        packet.extract(hdr.adjusted_closing_price_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_on_exchange_trade_message {
        packet.extract(hdr.on_exchange_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

    state parse_otc_trade_message {
        packet.extract(hdr.otc_trade_message.next);
        meta.dispatched = 1;
        transition parse_message;
    }

}

control NordicequitiesLastsaleVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesLastsaleIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NordicequitiesLastsaleEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NordicequitiesLastsaleComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NordicequitiesLastsaleDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.adjusted_closing_price_message);
        packet.emit(hdr.on_exchange_trade_message);
        packet.emit(hdr.otc_trade_message);
    }
}

V1Switch(
    NordicequitiesLastsaleParser(),
    NordicequitiesLastsaleVerifyChecksum(),
    NordicequitiesLastsaleIngress(),
    NordicequitiesLastsaleEgress(),
    NordicequitiesLastsaleComputeChecksum(),
    NordicequitiesLastsaleDeparser()
) main;
