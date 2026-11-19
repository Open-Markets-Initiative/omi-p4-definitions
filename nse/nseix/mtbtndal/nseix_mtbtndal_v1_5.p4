// P4_16 (v1model) definition for: Nse NseIx MtbtNdal Tbt v1.5
// 
// Protocol:
//   Organization: National Stock Exchange of India Ltd
//   Protocol: Multicast Tick By Tick Data Feed
//   Encoding: Tbt
//   Version: 1.5
//   Date: 10/13/2025
//   Specification: NDAL_NSEIXMTBTAPIv1_20260324142257.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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

header stream_header_t {
    bit<16> message_length;
    bit<16> stream_id;
    bit<32> sequence_number;
    bit<8> message_type;
}

header contract_information_message_t {
    bit<64> timestamp;
    bit<16> contract_stream_id;
    bit<32> token_number;
    bit<48> instrument;
    bit<80> symbol;
    bit<32> expiry_date;
    bit<32> strike_price;
    bit<16> option_type;
    bit<32> low_price_range;
    bit<32> high_price_range;
    bit<8> daily_contract_indicator;
}

header spread_contract_information_message_t {
    bit<64> timestamp;
    bit<16> contract_stream_id;
    bit<32> token_1;
    bit<32> token_2;
    bit<32> day_low_price_diff_range;
    bit<32> day_high_price_diff_range;
    bit<32> operating_range_low_price_diff_range;
    bit<32> operating_range_high_price_diff_range;
}

header new_order_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header order_modification_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header order_cancellation_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header trade_message_t {
    bit<64> timestamp;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<32> token;
    bit<32> trade_price;
    bit<32> trade_quantity;
}

header new_spread_order_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header spread_order_modification_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header spread_order_cancellation_message_t {
    bit<64> timestamp;
    bit<64> order_id;
    bit<32> token;
    bit<8> order_type;
    bit<32> price;
    bit<32> quantity;
}

header spread_trade_message_t {
    bit<64> timestamp;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<32> token;
    bit<32> trade_price;
    bit<32> quantity;
}

header market_status_message_t {
    bit<64> timestamp;
    bit<48> instrument;
    bit<16> status;
    bit<16> session_indicator;
}

header indicative_price_and_quantity_message_t {
    bit<64> timestamp;
    bit<32> token;
    bit<8> identifier;
    bit<32> indicative_price;
    bit<32> indicative_quantity;
}

header market_statistics_information_message_t {
    bit<64> timestamp;
    bit<32> token;
    bit<64> opening_price;
    bit<64> trade_high_price;
    bit<64> trade_low_price;
    bit<64> closing_price;
    bit<64> last_traded_price;
    bit<64> previous_close_price;
    bit<64> settlement_price;
    bit<32> total_traded_quantity;
    bit<64> total_traded_value;
    bit<32> statistics_open_interest;
    bit<32> change_in_open_interest;
    bit<16> session_indicator;
}

header open_interest_message_t {
    bit<64> timestamp;
    bit<32> token;
    bit<32> open_interest;
}

header heartbeat_message_t {
    bit<32> last_sequence_no;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    stream_header_t stream_header;
    contract_information_message_t contract_information_message;
    spread_contract_information_message_t spread_contract_information_message;
    new_order_message_t new_order_message;
    order_modification_message_t order_modification_message;
    order_cancellation_message_t order_cancellation_message;
    trade_message_t trade_message;
    new_spread_order_message_t new_spread_order_message;
    spread_order_modification_message_t spread_order_modification_message;
    spread_order_cancellation_message_t spread_order_cancellation_message;
    spread_trade_message_t spread_trade_message;
    market_status_message_t market_status_message;
    indicative_price_and_quantity_message_t indicative_price_and_quantity_message;
    market_statistics_information_message_t market_statistics_information_message;
    open_interest_message_t open_interest_message;
    heartbeat_message_t heartbeat_message;
}

parser NseixMtbtndalParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.stream_header);
        transition select(hdr.stream_header.message_type) {
            8w0x63: parse_contract_information_message;
            8w0x64: parse_spread_contract_information_message;
            8w0x4e: parse_new_order_message;
            8w0x4d: parse_order_modification_message;
            8w0x58: parse_order_cancellation_message;
            8w0x54: parse_trade_message;
            8w0x47: parse_new_spread_order_message;
            8w0x48: parse_spread_order_modification_message;
            8w0x4a: parse_spread_order_cancellation_message;
            8w0x4b: parse_spread_trade_message;
            8w0x53: parse_market_status_message;
            8w0x50: parse_indicative_price_and_quantity_message;
            8w0x66: parse_market_statistics_information_message;
            8w0x6f: parse_open_interest_message;
            8w0x5a: parse_heartbeat_message;
            default: accept;
        }
    }

    state parse_contract_information_message {
        packet.extract(hdr.contract_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_contract_information_message {
        packet.extract(hdr.spread_contract_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_modification_message {
        packet.extract(hdr.order_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancellation_message {
        packet.extract(hdr.order_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_spread_order_message {
        packet.extract(hdr.new_spread_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_order_modification_message {
        packet.extract(hdr.spread_order_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_order_cancellation_message {
        packet.extract(hdr.spread_order_cancellation_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_spread_trade_message {
        packet.extract(hdr.spread_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_status_message {
        packet.extract(hdr.market_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_indicative_price_and_quantity_message {
        packet.extract(hdr.indicative_price_and_quantity_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_statistics_information_message {
        packet.extract(hdr.market_statistics_information_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NseixMtbtndalVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseixMtbtndalIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NseixMtbtndalEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NseixMtbtndalComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NseixMtbtndalDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.stream_header);
        packet.emit(hdr.contract_information_message);
        packet.emit(hdr.spread_contract_information_message);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.order_modification_message);
        packet.emit(hdr.order_cancellation_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.new_spread_order_message);
        packet.emit(hdr.spread_order_modification_message);
        packet.emit(hdr.spread_order_cancellation_message);
        packet.emit(hdr.spread_trade_message);
        packet.emit(hdr.market_status_message);
        packet.emit(hdr.indicative_price_and_quantity_message);
        packet.emit(hdr.market_statistics_information_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.heartbeat_message);
    }
}

V1Switch(
    NseixMtbtndalParser(),
    NseixMtbtndalVerifyChecksum(),
    NseixMtbtndalIngress(),
    NseixMtbtndalEgress(),
    NseixMtbtndalComputeChecksum(),
    NseixMtbtndalDeparser()
) main;
