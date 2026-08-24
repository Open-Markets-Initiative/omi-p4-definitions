// P4_16 (v1model) definition for: Nasdaq MrxOptions SpreadTopOfMarket Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Phlx Options Spread Top Of Market
//   Encoding: Itch
//   Version: 2.1
//   Date: 09/15/2025
//   Specification: Options_Spread_Feed_2.1.pdf
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header udp_packet_header_t {
    bit<80> udp_session;
    bit<64> udp_sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header system_event_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<8> event_code;
}

header complex_strategy_directory_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> strategy_type;
    bit<104> underlying_symbol;
    bit<128> reserved_16;
    bit<8> number_of_legs;
    bit<32> option_id;
    bit<64> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> side;
    bit<32> leg_ratio;
}

header strategy_trading_action_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> current_trading_state;
}

header strategy_best_bid_and_ask_update_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> quote_condition;
    bit<32> bid_market_size;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> bid_cust_size;
    bit<32> bid_pro_cust_size;
    bit<32> bid_dntt_size;
    bit<32> bid_dntt_market_size;
    bit<32> ask_market_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<32> ask_cust_size;
    bit<32> ask_pro_cust_size;
    bit<32> ask_dntt_size;
    bit<32> ask_dntt_market_size;
}

header strategy_best_bid_update_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> quote_condition;
    bit<32> market_size;
    bit<32> price;
    bit<32> size;
    bit<32> cust_size;
    bit<32> pro_cust_size;
    bit<32> dntt_size;
    bit<32> dntt_market_size;
}

header strategy_best_ask_update_message_t {
    bit<16> tracking_number;
    bit<64> timestamp;
    bit<32> strategy_id;
    bit<8> quote_condition;
    bit<32> market_size;
    bit<32> price;
    bit<32> size;
    bit<32> cust_size;
    bit<32> pro_cust_size;
    bit<32> dntt_size;
    bit<32> dntt_market_size;
}

struct metadata_t {
}

struct headers_t {
    udp_packet_header_t udp_packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    complex_strategy_directory_message_t complex_strategy_directory_message[MAX_MESSAGES];
    strategy_trading_action_message_t strategy_trading_action_message[MAX_MESSAGES];
    strategy_best_bid_and_ask_update_message_t strategy_best_bid_and_ask_update_message[MAX_MESSAGES];
    strategy_best_bid_update_message_t strategy_best_bid_update_message[MAX_MESSAGES];
    strategy_best_ask_update_message_t strategy_best_ask_update_message[MAX_MESSAGES];
}

parser MrxoptionsSpreadtopofmarketMoldudp64Parser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.udp_packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x73: parse_complex_strategy_directory_message;
            8w0x48: parse_strategy_trading_action_message;
            8w0x45: parse_strategy_best_bid_and_ask_update_message;
            8w0x63: parse_strategy_best_bid_update_message;
            8w0x64: parse_strategy_best_ask_update_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_complex_strategy_directory_message {
        packet.extract(hdr.complex_strategy_directory_message.next);
        transition parse_message;
    }

    state parse_strategy_trading_action_message {
        packet.extract(hdr.strategy_trading_action_message.next);
        transition parse_message;
    }

    state parse_strategy_best_bid_and_ask_update_message {
        packet.extract(hdr.strategy_best_bid_and_ask_update_message.next);
        transition parse_message;
    }

    state parse_strategy_best_bid_update_message {
        packet.extract(hdr.strategy_best_bid_update_message.next);
        transition parse_message;
    }

    state parse_strategy_best_ask_update_message {
        packet.extract(hdr.strategy_best_ask_update_message.next);
        transition parse_message;
    }

}

control MrxoptionsSpreadtopofmarketMoldudp64VerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MrxoptionsSpreadtopofmarketMoldudp64Ingress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MrxoptionsSpreadtopofmarketMoldudp64Egress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MrxoptionsSpreadtopofmarketMoldudp64ComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MrxoptionsSpreadtopofmarketMoldudp64Deparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.udp_packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.complex_strategy_directory_message);
        packet.emit(hdr.strategy_trading_action_message);
        packet.emit(hdr.strategy_best_bid_and_ask_update_message);
        packet.emit(hdr.strategy_best_bid_update_message);
        packet.emit(hdr.strategy_best_ask_update_message);
    }
}

V1Switch(
    MrxoptionsSpreadtopofmarketMoldudp64Parser(),
    MrxoptionsSpreadtopofmarketMoldudp64VerifyChecksum(),
    MrxoptionsSpreadtopofmarketMoldudp64Ingress(),
    MrxoptionsSpreadtopofmarketMoldudp64Egress(),
    MrxoptionsSpreadtopofmarketMoldudp64ComputeChecksum(),
    MrxoptionsSpreadtopofmarketMoldudp64Deparser()
) main;
