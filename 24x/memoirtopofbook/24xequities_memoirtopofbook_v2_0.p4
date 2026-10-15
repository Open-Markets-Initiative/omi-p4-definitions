// P4_16 (v1model) definition for: 24X MemoirTopOfBook Sbe v2.0
// 
// Protocol:
//   Organization: 24 National Exchange
//   Protocol: Member Order Information Record Top Of Book
//   Encoding: Simple Binary Encoding
//   Version: 2.0
//   Date: 9/25/2026
//   Specification: MEMOIR Top of Book Feed-v2.0a.pdf
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
}

header sequenced_message_message_t {
    bit<16> message_length;
    bit<16> block_length;
    bit<8> template_id;
    bit<8> schema_id;
    bit<16> version;
}

header instrument_directory_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<32> round_lot;
    bit<8> is_test_symbol;
}

header reg_sho_restriction_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<8> short_sale_restriction;
}

header security_trading_status_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<8> security_trading_status;
    bit<8> security_trading_status_reason;
    bit<8> halt_reason;
}

header snapshot_complete_message_t {
    bit<64> timestamp;
    bit<64> as_of_sequence_number;
}

header trading_session_status_message_t {
    bit<64> timestamp;
    bit<8> trading_session;
}

header best_bid_offer_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<32> bid_size;
    bit<64> bid_price;
    bit<32> offer_size;
    bit<64> offer_price;
    bit<7> reserved_7;
    bit<1> retail_present_on_bid;
    bit<7> reserved_7_2;
    bit<1> retail_present_on_offer;
}

header best_bid_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<32> bid_size;
    bit<64> bid_price;
    bit<7> reserved_7;
    bit<1> retail_present_on_bid;
}

header best_offer_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<32> offer_size;
    bit<64> offer_price;
    bit<7> reserved_7;
    bit<1> retail_present_on_offer;
}

header best_bid_short_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<16> bid_size_short;
    bit<16> bid_price_short;
    bit<7> reserved_7;
    bit<1> retail_present_on_bid;
}

header best_offer_short_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<16> offer_size_short;
    bit<16> offer_price_short;
    bit<7> reserved_7;
    bit<1> retail_present_on_offer;
}

header clear_book_message_t {
    bit<64> timestamp;
    bit<16> security_id;
}

header auction_trade_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> auction_id;
    bit<8> auction_type;
    bit<64> auction_quantity;
    bit<64> auction_price;
    bit<64> trade_id;
    bit<8> sale_condition_1;
    bit<8> sale_condition_2;
    bit<8> sale_condition_3;
    bit<8> sale_condition_4;
}

header broken_auction_trade_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> auction_id;
    bit<64> trade_id;
    bit<64> original_auction_quantity;
    bit<64> original_auction_price;
}

header corrected_auction_trade_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> auction_id;
    bit<64> trade_id;
    bit<64> original_auction_quantity;
    bit<64> original_auction_price;
    bit<8> original_sale_condition_1;
    bit<8> original_sale_condition_2;
    bit<8> original_sale_condition_3;
    bit<8> original_sale_condition_4;
    bit<64> corrected_auction_quantity;
    bit<64> corrected_auction_price;
    bit<8> corrected_sale_condition_1;
    bit<8> corrected_sale_condition_2;
    bit<8> corrected_sale_condition_3;
    bit<8> corrected_sale_condition_4;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    common_header_t common_header;
    sequenced_message_t sequenced_message;
    sequenced_message_message_t sequenced_message_message[MAX_MESSAGES];
    instrument_directory_message_t instrument_directory_message[MAX_MESSAGES];
    reg_sho_restriction_message_t reg_sho_restriction_message[MAX_MESSAGES];
    security_trading_status_message_t security_trading_status_message[MAX_MESSAGES];
    snapshot_complete_message_t snapshot_complete_message[MAX_MESSAGES];
    trading_session_status_message_t trading_session_status_message[MAX_MESSAGES];
    best_bid_offer_message_t best_bid_offer_message[MAX_MESSAGES];
    best_bid_message_t best_bid_message[MAX_MESSAGES];
    best_offer_message_t best_offer_message[MAX_MESSAGES];
    best_bid_short_message_t best_bid_short_message[MAX_MESSAGES];
    best_offer_short_message_t best_offer_short_message[MAX_MESSAGES];
    clear_book_message_t clear_book_message[MAX_MESSAGES];
    auction_trade_message_t auction_trade_message[MAX_MESSAGES];
    broken_auction_trade_message_t broken_auction_trade_message[MAX_MESSAGES];
    corrected_auction_trade_message_t corrected_auction_trade_message[MAX_MESSAGES];
}

parser N24x24XequitiesMemoirtopofbookParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w0: parse_heartbeat;
            8w1: parse_session_shutdown;
            8w2: parse_sequenced_message;
            default: accept;
        }
    }

    state parse_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_shutdown {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_message {
        packet.extract(hdr.sequenced_message);
        meta.dispatched = 1;
        transition select(hdr.sequenced_message.message_count) {
            16w0: accept;
            default: parse_sequenced_message_message;
        }
    }

    state parse_sequenced_message_message {
        packet.extract(hdr.sequenced_message_message.next);
        transition select(hdr.sequenced_message_message.last.template_id) {
            8w1: parse_instrument_directory_message;
            8w2: parse_reg_sho_restriction_message;
            8w3: parse_security_trading_status_message;
            8w4: parse_snapshot_complete_message;
            8w5: parse_trading_session_status_message;
            8w10: parse_best_bid_offer_message;
            8w11: parse_best_bid_message;
            8w12: parse_best_offer_message;
            8w13: parse_best_bid_short_message;
            8w14: parse_best_offer_short_message;
            8w15: parse_clear_book_message;
            8w16: parse_auction_trade_message;
            8w17: parse_broken_auction_trade_message;
            8w18: parse_corrected_auction_trade_message;
            default: accept;
        }
    }

    state parse_instrument_directory_message {
        packet.extract(hdr.instrument_directory_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_reg_sho_restriction_message {
        packet.extract(hdr.reg_sho_restriction_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_security_trading_status_message {
        packet.extract(hdr.security_trading_status_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_snapshot_complete_message {
        packet.extract(hdr.snapshot_complete_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_best_bid_offer_message {
        packet.extract(hdr.best_bid_offer_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_best_bid_message {
        packet.extract(hdr.best_bid_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_best_offer_message {
        packet.extract(hdr.best_offer_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_best_bid_short_message {
        packet.extract(hdr.best_bid_short_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_best_offer_short_message {
        packet.extract(hdr.best_offer_short_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_clear_book_message {
        packet.extract(hdr.clear_book_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_auction_trade_message {
        packet.extract(hdr.auction_trade_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_broken_auction_trade_message {
        packet.extract(hdr.broken_auction_trade_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_corrected_auction_trade_message {
        packet.extract(hdr.corrected_auction_trade_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

}

control N24x24XequitiesMemoirtopofbookVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control N24x24XequitiesMemoirtopofbookIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control N24x24XequitiesMemoirtopofbookEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control N24x24XequitiesMemoirtopofbookComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control N24x24XequitiesMemoirtopofbookDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.sequenced_message_message);
        packet.emit(hdr.instrument_directory_message);
        packet.emit(hdr.reg_sho_restriction_message);
        packet.emit(hdr.security_trading_status_message);
        packet.emit(hdr.snapshot_complete_message);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.best_bid_offer_message);
        packet.emit(hdr.best_bid_message);
        packet.emit(hdr.best_offer_message);
        packet.emit(hdr.best_bid_short_message);
        packet.emit(hdr.best_offer_short_message);
        packet.emit(hdr.clear_book_message);
        packet.emit(hdr.auction_trade_message);
        packet.emit(hdr.broken_auction_trade_message);
        packet.emit(hdr.corrected_auction_trade_message);
    }
}

V1Switch(
    N24x24XequitiesMemoirtopofbookParser(),
    N24x24XequitiesMemoirtopofbookVerifyChecksum(),
    N24x24XequitiesMemoirtopofbookIngress(),
    N24x24XequitiesMemoirtopofbookEgress(),
    N24x24XequitiesMemoirtopofbookComputeChecksum(),
    N24x24XequitiesMemoirtopofbookDeparser()
) main;
