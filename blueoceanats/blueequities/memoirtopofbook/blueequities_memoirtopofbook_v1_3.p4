// P4_16 (v1model) definition for: BlueOceanAts BlueEquities MemoirTopOfBook Sbe v1.3
// 
// Protocol:
//   Organization: Blue Ocean Technologies
//   Protocol: Member Order Information Record Top Of Book
//   Encoding: Simple Binary Encoding
//   Version: 1.3
//   Date: 1/1/24
//   Specification: MEMOIR Top of Book Feed (v1.3).pdf
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
    bit<16> security_id;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<32> round_lot;
    bit<8> is_test_symbol;
    bit<64> mpv;
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
}

header best_bid_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<32> bid_size;
    bit<64> bid_price;
}

header best_offer_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<32> offer_size;
    bit<64> offer_price;
}

header best_bid_short_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<16> bid_size_short;
    bit<16> bid_price_short;
}

header best_offer_short_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<16> offer_size_uint_16;
    bit<16> offer_price_short;
}

header clear_book_message_t {
    bit<64> timestamp;
    bit<16> security_id;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    sequenced_message_t sequenced_message;
    instrument_directory_message_t instrument_directory_message;
    reg_sho_restriction_message_t reg_sho_restriction_message;
    security_trading_status_message_t security_trading_status_message;
    snapshot_complete_message_t snapshot_complete_message;
    trading_session_status_message_t trading_session_status_message;
    best_bid_offer_message_t best_bid_offer_message;
    best_bid_message_t best_bid_message;
    best_offer_message_t best_offer_message;
    best_bid_short_message_t best_bid_short_message;
    best_offer_short_message_t best_offer_short_message;
    clear_book_message_t clear_book_message;
}

parser BlueequitiesMemoirtopofbookParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            default: accept;
        }
    }

    state parse_instrument_directory_message {
        packet.extract(hdr.instrument_directory_message);
        transition accept;
    }

    state parse_reg_sho_restriction_message {
        packet.extract(hdr.reg_sho_restriction_message);
        transition accept;
    }

    state parse_security_trading_status_message {
        packet.extract(hdr.security_trading_status_message);
        transition accept;
    }

    state parse_snapshot_complete_message {
        packet.extract(hdr.snapshot_complete_message);
        transition accept;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
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

    state parse_clear_book_message {
        packet.extract(hdr.clear_book_message);
        transition accept;
    }

}

control BlueequitiesMemoirtopofbookVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BlueequitiesMemoirtopofbookIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control BlueequitiesMemoirtopofbookEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control BlueequitiesMemoirtopofbookComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control BlueequitiesMemoirtopofbookDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
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
    }
}

V1Switch(
    BlueequitiesMemoirtopofbookParser(),
    BlueequitiesMemoirtopofbookVerifyChecksum(),
    BlueequitiesMemoirtopofbookIngress(),
    BlueequitiesMemoirtopofbookEgress(),
    BlueequitiesMemoirtopofbookComputeChecksum(),
    BlueequitiesMemoirtopofbookDeparser()
) main;
