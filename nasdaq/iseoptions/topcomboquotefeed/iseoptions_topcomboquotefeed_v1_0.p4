// P4_16 (v1model) definition for: Nasdaq IseOptions TopComboQuoteFeed Itch v1.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Ise Top Combo Quote Feed
//   Encoding: Itch
//   Version: 1.0
//   Date: 08/23/2017
//   Specification: ISEOrderComboFeedSpecification_tcm5044-41354.pdf
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

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header system_event_message_t {
    bit<48> timestamp;
    bit<8> event_code;
    bit<16> current_year;
    bit<8> current_month;
    bit<8> current_day;
    bit<8> version;
    bit<8> subversion;
}

header complex_strategy_directory_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> strategy_type;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> number_of_legs;
    bit<32> option_id;
    bit<48> security_symbol;
    bit<8> leg_id;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_day;
    bit<64> explicit_strike_price;
    bit<8> option_type;
    bit<8> side;
    bit<32> leg_ratio;
}

header strategy_open_closed_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> open_state;
}

header strategy_trading_action_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> current_trading_state;
}

header strategy_best_bid_and_ask_update_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> quote_condition;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> bid_cust_size;
    bit<32> bid_pro_cust_size;
    bit<32> bid_ntt_size;
    bit<32> bid_market_size;
    bit<32> bid_ntt_market_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<32> ask_cust_size;
    bit<32> ask_pro_cust_size;
    bit<32> ask_ntt_size;
    bit<32> ask_market_size;
    bit<32> ask_ntt_market_size;
}

header strategy_best_bid_update_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> quote_condition;
    bit<32> price;
    bit<32> size;
    bit<32> cust_size;
    bit<32> pro_cust_size;
    bit<32> ntt_size;
    bit<32> market_size;
    bit<32> ntt_market_size;
}

header strategy_best_ask_update_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<8> quote_condition;
    bit<32> price;
    bit<32> size;
    bit<32> cust_size;
    bit<32> pro_cust_size;
    bit<32> ntt_size;
    bit<32> market_size;
    bit<32> ntt_market_size;
}

header complex_strategy_ticker_message_t {
    bit<48> timestamp;
    bit<32> strategy_id;
    bit<64> last_price;
    bit<32> size;
    bit<32> volume;
    bit<64> high;
    bit<64> low;
    bit<64> first;
    bit<8> trade_condition;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    complex_strategy_directory_message_t complex_strategy_directory_message[MAX_MESSAGES];
    strategy_open_closed_message_t strategy_open_closed_message[MAX_MESSAGES];
    strategy_trading_action_message_t strategy_trading_action_message[MAX_MESSAGES];
    strategy_best_bid_and_ask_update_t strategy_best_bid_and_ask_update[MAX_MESSAGES];
    strategy_best_bid_update_t strategy_best_bid_update[MAX_MESSAGES];
    strategy_best_ask_update_t strategy_best_ask_update[MAX_MESSAGES];
    complex_strategy_ticker_message_t complex_strategy_ticker_message[MAX_MESSAGES];
}

parser IseoptionsTopcomboquotefeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_complex_strategy_directory_message;
            8w0x4f: parse_strategy_open_closed_message;
            8w0x48: parse_strategy_trading_action_message;
            8w0x43: parse_strategy_best_bid_and_ask_update;
            8w0x44: parse_strategy_best_bid_update;
            8w0x45: parse_strategy_best_ask_update;
            8w0x74: parse_complex_strategy_ticker_message;
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

    state parse_strategy_open_closed_message {
        packet.extract(hdr.strategy_open_closed_message.next);
        transition parse_message;
    }

    state parse_strategy_trading_action_message {
        packet.extract(hdr.strategy_trading_action_message.next);
        transition parse_message;
    }

    state parse_strategy_best_bid_and_ask_update {
        packet.extract(hdr.strategy_best_bid_and_ask_update.next);
        transition parse_message;
    }

    state parse_strategy_best_bid_update {
        packet.extract(hdr.strategy_best_bid_update.next);
        transition parse_message;
    }

    state parse_strategy_best_ask_update {
        packet.extract(hdr.strategy_best_ask_update.next);
        transition parse_message;
    }

    state parse_complex_strategy_ticker_message {
        packet.extract(hdr.complex_strategy_ticker_message.next);
        transition parse_message;
    }

}

control IseoptionsTopcomboquotefeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsTopcomboquotefeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IseoptionsTopcomboquotefeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IseoptionsTopcomboquotefeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IseoptionsTopcomboquotefeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.complex_strategy_directory_message);
        packet.emit(hdr.strategy_open_closed_message);
        packet.emit(hdr.strategy_trading_action_message);
        packet.emit(hdr.strategy_best_bid_and_ask_update);
        packet.emit(hdr.strategy_best_bid_update);
        packet.emit(hdr.strategy_best_ask_update);
        packet.emit(hdr.complex_strategy_ticker_message);
    }
}

V1Switch(
    IseoptionsTopcomboquotefeedParser(),
    IseoptionsTopcomboquotefeedVerifyChecksum(),
    IseoptionsTopcomboquotefeedIngress(),
    IseoptionsTopcomboquotefeedEgress(),
    IseoptionsTopcomboquotefeedComputeChecksum(),
    IseoptionsTopcomboquotefeedDeparser()
) main;
