// P4_16 (v1model) definition for: Bmv BmvMarketData Product22 Intra v1.1
// 
// Protocol:
//   Organization: Bolsa Mexicana de Valores
//   Protocol: Bmv Market Data Product 22
//   Encoding: INTRA Multicast
//   Version: 1.1
//   Date: Unknown
//   Specification: Market Data Multicast_P22_1_ENG.pdf
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

header events_system_message_t {
    bit<32> instrument_number;
    bit<8> event_code;
    bit<8> market;
    bit<64> sending_time;
    bit<64> ending_time;
}

header dollar_buy_sell_message_t {
    bit<64> posture_date;
    bit<40> currency;
    bit<8> dollar_side;
    bit<64> buy;
    bit<64> sell;
    bit<64> last_deal;
}

header short_sales_balances_per_instrument_message_t {
    bit<32> instrument_number;
    bit<64> date;
    bit<64> previous_balance;
    bit<64> amount_traded;
    bit<64> buybacks;
    bit<64> current_balance;
}

header capital_market_multiples_message_t {
    bit<32> instrument_id;
    bit<8> multiple_type;
    bit<8> registry_number;
    bit<8> sector;
    bit<8> subsector;
    bit<8> business_line;
    bit<8> sub_line;
    bit<64> pflepa_multiple;
    bit<64> pfepa_multiple;
    bit<64> ve_uaiida_multiple;
    bit<64> p_u;
    bit<64> p_vl;
    bit<64> f_1_p_unoc;
    bit<64> f_2_p_unoc;
    bit<64> f_1_p_ue;
    bit<64> f_2_p_ue;
    bit<64> f_1_ve_uaiida;
    bit<64> f_2_ve_uaiida;
    bit<64> f_1_p_u;
    bit<64> f_2_p_u;
    bit<64> f_1_p_vl;
    bit<64> f_2_p_vl;
}

header capitalization_rules_message_t {
    bit<32> instrument_number;
    bit<64> date_indicators;
    bit<32> bursatility_indices;
    bit<8> bursatility_indices_sign;
    bit<64> beta_coefficient;
    bit<8> beta_coefficient_sign;
    bit<64> correlation_coefficient;
    bit<8> correlation_coefficient_sign;
    bit<32> delta_difference;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    intra_multicast_header_t intra_multicast_header;
    intra_multicast_header_message_block_t intra_multicast_header_message_block[MAX_MESSAGES];
    events_system_message_t events_system_message[MAX_MESSAGES];
    dollar_buy_sell_message_t dollar_buy_sell_message[MAX_MESSAGES];
    short_sales_balances_per_instrument_message_t short_sales_balances_per_instrument_message[MAX_MESSAGES];
    capital_market_multiples_message_t capital_market_multiples_message[MAX_MESSAGES];
    capitalization_rules_message_t capitalization_rules_message[MAX_MESSAGES];
}

parser BmvmarketdataProduct22Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w0x72: parse_dollar_buy_sell_message;
            8w0x73: parse_short_sales_balances_per_instrument_message;
            8w0x74: parse_capital_market_multiples_message;
            8w0x7A: parse_capitalization_rules_message;
            default: accept;
        }
    }

    state parse_events_system_message {
        packet.extract(hdr.events_system_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_dollar_buy_sell_message {
        packet.extract(hdr.dollar_buy_sell_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_short_sales_balances_per_instrument_message {
        packet.extract(hdr.short_sales_balances_per_instrument_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_capital_market_multiples_message {
        packet.extract(hdr.capital_market_multiples_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_capitalization_rules_message {
        packet.extract(hdr.capitalization_rules_message.next);
        meta.dispatched = 1;
        transition parse_intra_multicast_header_message_block;
    }

    state parse_intra_multicast_header_message_block_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control BmvmarketdataProduct22VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct22Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control BmvmarketdataProduct22Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BmvmarketdataProduct22ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BmvmarketdataProduct22Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.intra_multicast_header);
        packet.emit(hdr.intra_multicast_header_message_block);
        packet.emit(hdr.events_system_message);
        packet.emit(hdr.dollar_buy_sell_message);
        packet.emit(hdr.short_sales_balances_per_instrument_message);
        packet.emit(hdr.capital_market_multiples_message);
        packet.emit(hdr.capitalization_rules_message);
    }
}

V1Switch(
    BmvmarketdataProduct22Parser(),
    BmvmarketdataProduct22VerifyChecksum(),
    BmvmarketdataProduct22Ingress(),
    BmvmarketdataProduct22Egress(),
    BmvmarketdataProduct22ComputeChecksum(),
    BmvmarketdataProduct22Deparser()
) main;
