// P4_16 (v1model) definition for: Bmv BmvMarketData Product27 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 27
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P27_1_ENG.pdf
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
    bit<8> message_type;
}

header mutual_funds_trades_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date_of_the_trade;
    bit<64> price;
    bit<64> book_value;
    bit<32> number_of_sales_trades;
    bit<64> sales_volume;
    bit<32> number_of_purchase_trades;
    bit<64> purchase_volume;
}

header opening_of_continuous_auctions_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> auction_session_startup_time;
    bit<64> auction_session_end_time;
}

header existence_of_bids_at_mid_price_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<8> bids_existing;
}

header catalogue_of_debt_and_metals_instruments_message_t {
    bit<32> number_of_the_instrument;
    bit<8> origin;
    bit<16> type_of_value;
    bit<56> issuing_company;
    bit<48> issuance;
    bit<64> date_of_issuance;
    bit<64> date_of_maturity;
    bit<64> price_rate_of_reference;
    bit<64> date_of_reference;
    bit<8> reference;
    bit<16> term_days;
    bit<16> coupon_period;
    bit<96> isin;
    bit<8> market;
    bit<64> current_nominal_value;
    bit<64> original_nominal_value;
    bit<64> outstanding_shares;
    bit<64> amount_placed;
    bit<8> trades_rate_price;
}

header catalog_sent_for_instruments_belonging_to_mutual_funds_message_t {
    bit<32> number_of_the_instrument;
    bit<8> origin;
    bit<16> type_of_value;
    bit<56> issuing_company;
    bit<48> series;
    bit<8> sector;
    bit<8> sub_sector;
    bit<8> industry;
    bit<8> sub_industry;
    bit<80> trading_company;
    bit<64> reference_price;
    bit<64> reference_date;
    bit<8> reference;
    bit<96> isin;
    bit<120> rating;
}

header weighted_average_price_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> weighted_average_price;
    bit<64> volatility;
}

header system_events_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<8> code_of_event;
    bit<8> market;
    bit<64> send_time;
    bit<64> end_time;
    bit<64> group;
}

header reference_price_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> price;
    bit<8> price_type;
}

header changes_in_status_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<8> status;
    bit<8> reason;
}

header catalog_for_instruments_belonging_to_the_capital_warrants_market_message_t {
    bit<32> number_of_the_instrument;
    bit<8> origin;
    bit<16> type_of_value;
    bit<56> issuing_company;
    bit<48> series;
    bit<8> type_of_warrant;
    bit<64> date_of_maturity;
    bit<64> price_of_exercise;
    bit<64> reference_price;
    bit<64> reference_date;
    bit<8> reference;
    bit<96> isin;
}

header catalog_sent_for_instruments_belonging_to_capital_tracs_message_t {
    bit<32> number_of_the_trac;
    bit<8> origin;
    bit<64> name_of_the_trac;
    bit<56> underlying_issuing_company;
    bit<48> underlying_series;
    bit<64> securities;
    bit<64> excluded_securities;
    bit<64> price;
    bit<64> component_in_cash;
    bit<64> excluded_value;
    bit<64> number_of_certificates;
    bit<64> theoretical_price;
}

header consolidated_inav_message_t {
    bit<32> number_of_the_trac;
    bit<8> origin;
    bit<64> current_theoretical_price;
}

header catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message_t {
    bit<32> mse_instrument_number;
    bit<16> value_of_type;
    bit<56> issuing_company;
    bit<48> series;
    bit<64> last_price;
    bit<64> ppp_weighted_average_price;
    bit<64> reference_date;
    bit<8> reference;
    bit<16> coupon_in_effect;
    bit<8> marketability;
    bit<32> numerical_marketability;
    bit<96> isin;
    bit<8> market;
    bit<64> registered_values;
    bit<8> exchange;
}

header probable_price_of_allocation_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> probable_price_of_allocation;
    bit<64> volume;
}

header relation_between_bmvbiva_instruments_message_t {
    bit<32> number_of_the_bmv_instrument;
    bit<32> biva_instrument;
    bit<8> type_of_trading;
}

header equities_market_trades_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> time_of_the_trade;
    bit<64> volume;
    bit<64> price;
    bit<8> type_of_agreement;
    bit<64> consecutive_number_of_the_trade;
    bit<8> sets_price;
    bit<8> type_of_trading;
    bit<64> amount;
    bit<40> purchases;
    bit<40> sells;
    bit<8> settlement;
    bit<8> auction_indicator;
    bit<8> indicator;
}

header consolidated_trade_cancellation_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> consecutive_number_of_the_trade;
}

header pricevolume_indicator_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> probable_price_of_allotment;
    bit<64> volume;
    bit<64> best_selling_price;
    bit<64> best_purchasing_price;
    bit<8> type_of_cross_trading;
}

header consolidated_execution_of_orders_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date;
    bit<64> consecutive_number;
    bit<64> volume;
    bit<64> consecutive_number_of_the_trade;
    bit<64> execution_price;
    bit<8> indicator;
    bit<8> sets_price;
    bit<40> participant;
}

header registration_of_order_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date_and_time;
    bit<64> consecutive_number;
    bit<8> direction;
    bit<64> volume;
    bit<64> price;
    bit<40> participant;
}

header cancellations_of_orders_message_t {
    bit<32> instrument_number;
    bit<8> origin;
    bit<64> date;
    bit<64> consecutive_number;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    mutual_funds_trades_message_t mutual_funds_trades_message[MAX_MESSAGES];
    opening_of_continuous_auctions_message_t opening_of_continuous_auctions_message[MAX_MESSAGES];
    existence_of_bids_at_mid_price_message_t existence_of_bids_at_mid_price_message[MAX_MESSAGES];
    catalogue_of_debt_and_metals_instruments_message_t catalogue_of_debt_and_metals_instruments_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_mutual_funds_message_t catalog_sent_for_instruments_belonging_to_mutual_funds_message[MAX_MESSAGES];
    weighted_average_price_message_t weighted_average_price_message[MAX_MESSAGES];
    system_events_message_t system_events_message[MAX_MESSAGES];
    reference_price_message_t reference_price_message[MAX_MESSAGES];
    changes_in_status_message_t changes_in_status_message[MAX_MESSAGES];
    catalog_for_instruments_belonging_to_the_capital_warrants_market_message_t catalog_for_instruments_belonging_to_the_capital_warrants_market_message[MAX_MESSAGES];
    catalog_sent_for_instruments_belonging_to_capital_tracs_message_t catalog_sent_for_instruments_belonging_to_capital_tracs_message[MAX_MESSAGES];
    consolidated_inav_message_t consolidated_inav_message[MAX_MESSAGES];
    catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message_t catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message[MAX_MESSAGES];
    probable_price_of_allocation_message_t probable_price_of_allocation_message[MAX_MESSAGES];
    relation_between_bmvbiva_instruments_message_t relation_between_bmvbiva_instruments_message[MAX_MESSAGES];
    equities_market_trades_message_t equities_market_trades_message[MAX_MESSAGES];
    consolidated_trade_cancellation_message_t consolidated_trade_cancellation_message[MAX_MESSAGES];
    pricevolume_indicator_message_t pricevolume_indicator_message[MAX_MESSAGES];
    consolidated_execution_of_orders_message_t consolidated_execution_of_orders_message[MAX_MESSAGES];
    registration_of_order_message_t registration_of_order_message[MAX_MESSAGES];
    cancellations_of_orders_message_t cancellations_of_orders_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct27Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x28: parse_mutual_funds_trades_message;
            8w0x29: parse_opening_of_continuous_auctions_message;
            8w0x2C: parse_existence_of_bids_at_mid_price_message;
            8w0x2E: parse_catalogue_of_debt_and_metals_instruments_message;
            8w0x30: parse_catalog_sent_for_instruments_belonging_to_mutual_funds_message;
            8w0x36: parse_weighted_average_price_message;
            8w0x37: parse_system_events_message;
            8w0x38: parse_reference_price_message;
            8w0x39: parse_changes_in_status_message;
            8w0x54: parse_catalog_for_instruments_belonging_to_the_capital_warrants_market_message;
            8w0x5B: parse_catalog_sent_for_instruments_belonging_to_capital_tracs_message;
            8w0x5D: parse_consolidated_inav_message;
            8w0x68: parse_catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message;
            8w0x69: parse_probable_price_of_allocation_message;
            8w0x6A: parse_relation_between_bmvbiva_instruments_message;
            8w0x70: parse_equities_market_trades_message;
            8w0x71: parse_consolidated_trade_cancellation_message;
            8w0x5C: parse_pricevolume_indicator_message;
            8w0x6B: parse_consolidated_execution_of_orders_message;
            8w0x6E: parse_registration_of_order_message;
            8w0x75: parse_cancellations_of_orders_message;
            default: accept;
        }
    }

    state parse_mutual_funds_trades_message {
        packet.extract(hdr.mutual_funds_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_opening_of_continuous_auctions_message {
        packet.extract(hdr.opening_of_continuous_auctions_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_existence_of_bids_at_mid_price_message {
        packet.extract(hdr.existence_of_bids_at_mid_price_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalogue_of_debt_and_metals_instruments_message {
        packet.extract(hdr.catalogue_of_debt_and_metals_instruments_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_mutual_funds_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_mutual_funds_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_weighted_average_price_message {
        packet.extract(hdr.weighted_average_price_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_system_events_message {
        packet.extract(hdr.system_events_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_reference_price_message {
        packet.extract(hdr.reference_price_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_changes_in_status_message {
        packet.extract(hdr.changes_in_status_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_for_instruments_belonging_to_the_capital_warrants_market_message {
        packet.extract(hdr.catalog_for_instruments_belonging_to_the_capital_warrants_market_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_sent_for_instruments_belonging_to_capital_tracs_message {
        packet.extract(hdr.catalog_sent_for_instruments_belonging_to_capital_tracs_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_consolidated_inav_message {
        packet.extract(hdr.consolidated_inav_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message {
        packet.extract(hdr.catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_probable_price_of_allocation_message {
        packet.extract(hdr.probable_price_of_allocation_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_relation_between_bmvbiva_instruments_message {
        packet.extract(hdr.relation_between_bmvbiva_instruments_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_equities_market_trades_message {
        packet.extract(hdr.equities_market_trades_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_consolidated_trade_cancellation_message {
        packet.extract(hdr.consolidated_trade_cancellation_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_pricevolume_indicator_message {
        packet.extract(hdr.pricevolume_indicator_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_consolidated_execution_of_orders_message {
        packet.extract(hdr.consolidated_execution_of_orders_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_registration_of_order_message {
        packet.extract(hdr.registration_of_order_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_cancellations_of_orders_message {
        packet.extract(hdr.cancellations_of_orders_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct27VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct27Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct27Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct27ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct27Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.mutual_funds_trades_message);
        packet.emit(hdr.opening_of_continuous_auctions_message);
        packet.emit(hdr.existence_of_bids_at_mid_price_message);
        packet.emit(hdr.catalogue_of_debt_and_metals_instruments_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_mutual_funds_message);
        packet.emit(hdr.weighted_average_price_message);
        packet.emit(hdr.system_events_message);
        packet.emit(hdr.reference_price_message);
        packet.emit(hdr.changes_in_status_message);
        packet.emit(hdr.catalog_for_instruments_belonging_to_the_capital_warrants_market_message);
        packet.emit(hdr.catalog_sent_for_instruments_belonging_to_capital_tracs_message);
        packet.emit(hdr.consolidated_inav_message);
        packet.emit(hdr.catalog_for_instruments_belonging_to_the_local_and_global_stock_market_message);
        packet.emit(hdr.probable_price_of_allocation_message);
        packet.emit(hdr.relation_between_bmvbiva_instruments_message);
        packet.emit(hdr.equities_market_trades_message);
        packet.emit(hdr.consolidated_trade_cancellation_message);
        packet.emit(hdr.pricevolume_indicator_message);
        packet.emit(hdr.consolidated_execution_of_orders_message);
        packet.emit(hdr.registration_of_order_message);
        packet.emit(hdr.cancellations_of_orders_message);
    }
}

V1Switch(
    BmvmarketdataProduct27Parser(),
    BmvmarketdataProduct27VerifyChecksum(),
    BmvmarketdataProduct27Ingress(),
    BmvmarketdataProduct27Egress(),
    BmvmarketdataProduct27ComputeChecksum(),
    BmvmarketdataProduct27Deparser()
) main;
