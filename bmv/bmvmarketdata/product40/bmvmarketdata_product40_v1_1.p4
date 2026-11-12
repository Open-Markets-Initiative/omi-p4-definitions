// P4_16 (v1model) definition for: Bmv BmvMarketData Product40 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 40
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P40_2_ENG.pdf
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
//   https://patents.google.com/patent/US20240129382A1/en
//   https://patents.google.com/patent/US20240419416A1/en
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

header catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message_t {
    bit<32> instrument_number;
    bit<16> value_type;
    bit<56> issuer;
    bit<48> series;
    bit<64> last_price;
    bit<64> wap;
    bit<64> closing_price;
    bit<64> reference_date;
    bit<16> reference;
    bit<16> current_coupon;
    bit<16> marketability;
    bit<32> numeric_marketability;
    bit<96> isin;
    bit<8> market;
    bit<64> shares_outstanding;
    bit<64> blocks_amount;
    bit<8> exchange;
    bit<160> filler;
}

header catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message_t {
    bit<32> instrument_number;
    bit<16> value_type;
    bit<56> issuer;
    bit<48> issue;
    bit<64> issue_date;
    bit<64> maturity_date;
    bit<64> reference_pricerate;
    bit<64> reference_date;
    bit<16> reference;
    bit<16> term_days;
    bit<16> current_coupon;
    bit<96> isin;
    bit<8> market;
    bit<64> current_nominal_value;
    bit<64> original_nominal_value;
    bit<64> outstanding_shares;
    bit<64> amount_placed;
    bit<8> operate_price_rate;
    bit<8> exchange;
    bit<160> filler;
}

header catalog_for_instruments_belonging_to_the_capital_warrants_market_message_t {
    bit<32> instrument_number;
    bit<16> value_type;
    bit<56> issuer;
    bit<48> series;
    bit<8> warrant_type;
    bit<64> maturity_date;
    bit<64> exercise_price;
    bit<64> reference_price;
    bit<64> reference_date;
    bit<16> reference;
    bit<96> isin;
    bit<8> exchange;
    bit<160> filler;
}

header options_futures_and_swaps_derivatives_market_instruments_catalog_message_t {
    bit<32> instrument_number;
    bit<16> value_type;
    bit<56> class;
    bit<48> maturity;
    bit<8> option_type;
    bit<64> exercise_price;
    bit<64> bid;
    bit<64> prior_day_settlement_price;
    bit<64> last_day_of_operation;
    bit<64> maturity_date;
    bit<32> open_contracts;
    bit<32> contract_size;
    bit<96> product_code;
    bit<8> daily_maturity;
    bit<48> key_exercise_price;
    bit<48> cfi_code;
    bit<160> filler;
}

header catalog_sent_for_instruments_belonging_to_capital_tracs_message_t {
    bit<32> trac_number;
    bit<64> trac_name;
    bit<56> underlying_issuer;
    bit<48> underlying_series;
    bit<64> securities;
    bit<64> excluded_securities;
    bit<64> price;
    bit<64> cash_component;
    bit<64> excluded_value;
    bit<64> number_of_certificates;
    bit<64> theoretical_price;
    bit<160> filler;
}

header catalog_sent_for_instruments_belonging_to_mutual_funds_message_t {
    bit<32> instrument_number;
    bit<16> value_type;
    bit<56> issuer;
    bit<48> series;
    bit<8> sector;
    bit<8> subsector;
    bit<8> business_line;
    bit<8> sub_line;
    bit<80> operating_company;
    bit<64> reference_price;
    bit<64> reference_date;
    bit<16> reference;
    bit<96> isin;
    bit<120> rating;
    bit<160> filler;
}

header catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message_t {
    bit<32> instrument_number;
    bit<16> value_type;
    bit<56> class;
    bit<48> maturity;
    bit<8> type_of_strategy;
    bit<64> bid;
    bit<64> last_date_operation;
    bit<64> maturity_date;
    bit<32> short_leg_instrument_identifier;
    bit<32> long_leg_instruments_id;
    bit<8> frequency;
    bit<8> number_of_maturities;
    bit<160> filler;
}

header underlying_value_on_warrants_catalog_message_t {
    bit<32> instrument_number;
    bit<56> issuer;
    bit<48> series;
    bit<16> value_type;
    bit<56> underlying_issuer;
    bit<48> underlying_series;
    bit<16> underlying_value_type;
    bit<64> number_of_registered_values;
    bit<8> exchange;
    bit<160> filler;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message_t catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message[MAX_MESSAGES];
    catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message_t catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message[MAX_MESSAGES];
    catalog_for_instruments_belonging_to_the_capital_warrants_market_message_t catalog_for_instruments_belonging_to_the_capital_warrants_market_message[MAX_MESSAGES];
    options_futures_and_swaps_derivatives_market_instruments_catalog_message_t options_futures_and_swaps_derivatives_market_instruments_catalog_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_capital_tracs_message_t catalog_sent_for_instruments_belonging_to_capital_tracs_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_mutual_funds_message_t catalog_sent_for_instruments_belonging_to_mutual_funds_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message_t catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message[MAX_MESSAGES];
    underlying_value_on_warrants_catalog_message_t underlying_value_on_warrants_catalog_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct40Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            16w0x6361: parse_catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message;
            16w0x6362: parse_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message;
            16w0x6363: parse_catalog_for_instruments_belonging_to_the_capital_warrants_market_message;
            16w0x6364: parse_options_futures_and_swaps_derivatives_market_instruments_catalog_message;
            16w0x6365: parse_catalog_sent_for_instruments_belonging_to_capital_tracs_message;
            16w0x6366: parse_catalog_sent_for_instruments_belonging_to_mutual_funds_message;
            16w0x6367: parse_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message;
            16w0x6379: parse_underlying_value_on_warrants_catalog_message;
            default: accept;
        }
    }

    state parse_catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message {
        packet.extract(hdr.catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message {
        packet.extract(hdr.catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_for_instruments_belonging_to_the_capital_warrants_market_message {
        packet.extract(hdr.catalog_for_instruments_belonging_to_the_capital_warrants_market_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_options_futures_and_swaps_derivatives_market_instruments_catalog_message {
        packet.extract(hdr.options_futures_and_swaps_derivatives_market_instruments_catalog_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_capital_tracs_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_capital_tracs_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_mutual_funds_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_mutual_funds_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_underlying_value_on_warrants_catalog_message {
        packet.extract(hdr.underlying_value_on_warrants_catalog_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct40VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct40Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct40Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct40ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct40Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message);
        packet.emit(hdr.catalog_of_instruments_that_belong_to_the_debt_metals_and_money_market_message);
        packet.emit(hdr.catalog_for_instruments_belonging_to_the_capital_warrants_market_message);
        packet.emit(hdr.options_futures_and_swaps_derivatives_market_instruments_catalog_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_capital_tracs_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_mutual_funds_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_the_strategy_derivative_market_message);
        packet.emit(hdr.underlying_value_on_warrants_catalog_message);
    }
}

V1Switch(
    BmvmarketdataProduct40Parser(),
    BmvmarketdataProduct40VerifyChecksum(),
    BmvmarketdataProduct40Ingress(),
    BmvmarketdataProduct40Egress(),
    BmvmarketdataProduct40ComputeChecksum(),
    BmvmarketdataProduct40Deparser()
) main;
