// P4_16 (v1model) definition for: Athex AthexDerivatives Relaxed Ids v5.2
// 
// Protocol:
//   Organization: Athens Exchange Group
//   Protocol: Athens Exchange Derivatives Market Relaxed Channel
//   Encoding: Information Dissemination System
//   Version: 5.2
//   Date: 11/01/2019
//   Specification: ATHEX OASIS IDS Market Data Feed Specification (5.2).pdf
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
    bit<8> soh;
    bit<16> vendor_identifier;
    bit<8> message_category;
    bit<8> message_subcategory;
    bit<32> venue_id;
    bit<56> message_sequence_number;
    bit<160> publication_timestamp;
}

header apa_post_trade_message_t {
    bit<32> report_status;
    bit<160> trading_date_and_time;
    bit<8> trade_id_indicator;
    bit<416> trade_id;
    bit<32> venue;
    bit<8> transaction_to_be_cleared;
    bit<32> price_notation;
    bit<144> price;
    bit<24> price_currency;
    bit<144> quantity;
    bit<24> quantity_currency;
    bit<200> notation_of_the_quantity_in_measurement_unit;
    bit<144> quantity_in_measurement_unit;
    bit<144> notional_amount;
    bit<24> notional_currency;
    bit<32> instrument_id_type;
    bit<96> instrument_id;
    bit<2048> instrument_full_name_chunk0;
    bit<752> instrument_full_name_chunk1;
    bit<48> instrument_classification;
    bit<144> price_multiplier;
    bit<96> underlying_instrument_code;
    bit<200> underlying_index_name;
    bit<56> term_of_the_underlying_index;
    bit<32> option_type;
    bit<144> strike_price;
    bit<24> strike_price_currency;
    bit<32> strike_price_notation;
    bit<32> option_exercise_style;
    bit<64> maturity_date;
    bit<64> expiry_date;
    bit<32> delivery_type;
    bit<32> type_emission_allowance;
    bit<32> otc_posttrade_indicator;
    bit<8> deferral_indicator;
    bit<8> lmtf;
    bit<8> fulf;
    bit<8> datf;
    bit<8> fula;
    bit<8> volo;
    bit<8> fulv;
    bit<8> fwaf;
    bit<8> fulj;
    bit<8> idaf;
    bit<8> volw;
    bit<8> coaf;
}

header apa_pre_trade_message_t {
    bit<32> report_status;
    bit<8> quote_type;
    bit<416> quote_id;
    bit<160> event_time;
    bit<8> quote_liquidity;
    bit<32> venue_mic;
    bit<160> submitting_entity_identification_code;
    bit<32> price_notation;
    bit<144> price;
    bit<24> price_currency;
    bit<144> quantity;
    bit<24> quantity_currency;
    bit<200> notation_of_the_quantity_in_measurement_unit;
    bit<144> quantity_in_measurement_unit;
    bit<144> notional_amount;
    bit<24> notional_currency;
    bit<32> instrument_id_type;
    bit<96> instrument_id;
    bit<2048> instrument_full_name_chunk0;
    bit<752> instrument_full_name_chunk1;
    bit<48> instrument_classification;
    bit<144> price_multiplier;
    bit<96> underlying_instrument_code;
    bit<200> underlying_index_name;
    bit<56> term_of_the_underlying_index;
    bit<32> option_type;
    bit<144> strike_price;
    bit<24> strike_price_currency;
    bit<32> strike_price_notation;
    bit<32> option_exercise_style;
    bit<64> maturity_date;
    bit<64> expiry_date;
    bit<32> delivery_type;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    apa_post_trade_message_t apa_post_trade_message;
    apa_pre_trade_message_t apa_pre_trade_message;
}

parser AthexderivativesRelaxedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_category) {
            8w0x55: parse_apa_post_trade_message;
            8w0x56: parse_apa_pre_trade_message;
            default: accept;
        }
    }

    state parse_apa_post_trade_message {
        packet.extract(hdr.apa_post_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_apa_pre_trade_message {
        packet.extract(hdr.apa_pre_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control AthexderivativesRelaxedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AthexderivativesRelaxedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AthexderivativesRelaxedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AthexderivativesRelaxedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AthexderivativesRelaxedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.apa_post_trade_message);
        packet.emit(hdr.apa_pre_trade_message);
    }
}

V1Switch(
    AthexderivativesRelaxedParser(),
    AthexderivativesRelaxedVerifyChecksum(),
    AthexderivativesRelaxedIngress(),
    AthexderivativesRelaxedEgress(),
    AthexderivativesRelaxedComputeChecksum(),
    AthexderivativesRelaxedDeparser()
) main;
