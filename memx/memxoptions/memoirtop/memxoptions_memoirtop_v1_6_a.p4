// P4_16 (v1model) definition for: Memx MemxOptions MemoirTop Sbe v1.6.a
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Member Order Information Record Top
//   Encoding: Simple Binary Encoding
//   Version: 1.6.a
//   Date: 11/13/23
//   Specification: MEMOIR Top for US Options-v1_6a.pdf
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

header common_header_t {
    bit<8> message_type;
    bit<8> header_length;
    bit<64> session_id;
    bit<64> sequence_number;
}

header sequenced_message_t {
    bit<16> message_count;
    bit<16> message_length;
    bit<16> block_length;
    bit<8> template_id;
    bit<8> schema_id;
    bit<16> version;
}

header instrument_directory_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> options_product_type;
    bit<48> underlier;
    bit<48> osi_root;
    bit<64> maturity_date;
    bit<8> strike_put_or_call;
    bit<64> strike_price;
    bit<8> closing_only;
    bit<64> closing_time;
    bit<8> is_test_symbol;
}

header options_instrument_status_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> instrument_trading_status;
    bit<8> instrument_trading_status_reason;
    bit<8> trading_session;
}

header underlier_instrument_status_message_t {
    bit<64> timestamp;
    bit<8> trading_session;
    bit<48> underlier;
}

header broken_trade_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<64> trade_id;
    bit<32> original_quantity;
    bit<64> original_price;
}

header corrected_trade_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<64> trade_id;
    bit<32> original_quantity;
    bit<64> original_price;
    bit<32> corrected_quantity;
    bit<64> corrected_price;
}

header snapshot_complete_message_t {
    bit<64> timestamp;
    bit<64> as_of_sequence_number;
}

header best_bid_offer_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> total_bid_size;
    bit<32> cust_bid_size;
    bit<64> bid_price;
    bit<32> total_offer_size;
    bit<32> cust_offer_size;
    bit<64> offer_price;
}

header best_bid_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> total_bid_size;
    bit<32> cust_bid_size;
    bit<64> bid_price;
}

header best_offer_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> total_offer_size;
    bit<32> cust_offer_size;
    bit<64> offer_price;
}

header best_bid_short_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<16> total_bid_size_short;
    bit<16> cust_bid_size_short;
    bit<16> bid_price_short;
}

header best_offer_short_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<16> total_offer_size_short;
    bit<16> cust_offer_size_short;
    bit<16> offer_price_short;
}

header trade_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<64> trade_id;
    bit<1> intermarket_sweep;
    bit<7> reserved_7;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<32> cust_quantity;
    bit<8> capacity;
}

header clear_book_message_t {
    bit<64> timestamp;
    bit<64> symbol;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    sequenced_message_t sequenced_message;
    instrument_directory_message_t instrument_directory_message;
    options_instrument_status_message_t options_instrument_status_message;
    underlier_instrument_status_message_t underlier_instrument_status_message;
    broken_trade_message_t broken_trade_message;
    corrected_trade_message_t corrected_trade_message;
    snapshot_complete_message_t snapshot_complete_message;
    best_bid_offer_message_t best_bid_offer_message;
    best_bid_message_t best_bid_message;
    best_offer_message_t best_offer_message;
    best_bid_short_message_t best_bid_short_message;
    best_offer_short_message_t best_offer_short_message;
    trade_message_t trade_message;
    clear_book_message_t clear_book_message;
}

parser MemxoptionsMemoirtopParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w2: parse_sequenced_message;
            default: accept;
        }
    }

    state parse_sequenced_message {
        packet.extract(hdr.sequenced_message);
        transition select(hdr.sequenced_message.template_id) {
            8w1: parse_instrument_directory_message;
            8w2: parse_options_instrument_status_message;
            8w3: parse_underlier_instrument_status_message;
            8w5: parse_broken_trade_message;
            8w6: parse_corrected_trade_message;
            8w7: parse_snapshot_complete_message;
            8w10: parse_best_bid_offer_message;
            8w11: parse_best_bid_message;
            8w12: parse_best_offer_message;
            8w13: parse_best_bid_short_message;
            8w14: parse_best_offer_short_message;
            8w15: parse_trade_message;
            8w16: parse_clear_book_message;
            default: accept;
        }
    }

    state parse_instrument_directory_message {
        packet.extract(hdr.instrument_directory_message);
        transition accept;
    }

    state parse_options_instrument_status_message {
        packet.extract(hdr.options_instrument_status_message);
        transition accept;
    }

    state parse_underlier_instrument_status_message {
        packet.extract(hdr.underlier_instrument_status_message);
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        transition accept;
    }

    state parse_corrected_trade_message {
        packet.extract(hdr.corrected_trade_message);
        transition accept;
    }

    state parse_snapshot_complete_message {
        packet.extract(hdr.snapshot_complete_message);
        transition accept;
    }

    state parse_best_bid_offer_message {
        packet.extract(hdr.best_bid_offer_message);
        transition accept;
    }

    state parse_best_bid_message {
        packet.extract(hdr.best_bid_message);
        transition accept;
    }

    state parse_best_offer_message {
        packet.extract(hdr.best_offer_message);
        transition accept;
    }

    state parse_best_bid_short_message {
        packet.extract(hdr.best_bid_short_message);
        transition accept;
    }

    state parse_best_offer_short_message {
        packet.extract(hdr.best_offer_short_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_clear_book_message {
        packet.extract(hdr.clear_book_message);
        transition accept;
    }

}

control MemxoptionsMemoirtopVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoirtopIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxoptionsMemoirtopEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxoptionsMemoirtopComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoirtopDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.instrument_directory_message);
        packet.emit(hdr.options_instrument_status_message);
        packet.emit(hdr.underlier_instrument_status_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.corrected_trade_message);
        packet.emit(hdr.snapshot_complete_message);
        packet.emit(hdr.best_bid_offer_message);
        packet.emit(hdr.best_bid_message);
        packet.emit(hdr.best_offer_message);
        packet.emit(hdr.best_bid_short_message);
        packet.emit(hdr.best_offer_short_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.clear_book_message);
    }
}

V1Switch(
    MemxoptionsMemoirtopParser(),
    MemxoptionsMemoirtopVerifyChecksum(),
    MemxoptionsMemoirtopIngress(),
    MemxoptionsMemoirtopEgress(),
    MemxoptionsMemoirtopComputeChecksum(),
    MemxoptionsMemoirtopDeparser()
) main;
