// P4_16 (v1model) definition for: Memx MemxEquities MemoirDepthFeed Sbe v1.3
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Memoir Depth Feed
//   Encoding: Simple Binary Encoding
//   Version: 1.3
//   Date: 4/05/21
//   Specification: MEMOIR Depth Feed-v1_3.pdf
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
    bit<8> reserved;
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

header trading_session_status_message_t {
    bit<64> timestamp;
    bit<8> trading_session;
}

header order_added_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> order_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
}

header order_deleted_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> order_id;
}

header order_reduced_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> order_id;
    bit<32> quantity;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> order_id;
    bit<64> trade_id;
    bit<32> quantity;
    bit<64> price;
}

header trade_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> trade_id;
    bit<32> quantity;
    bit<64> price;
}

header broken_trade_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> trade_id;
    bit<32> original_quantity;
    bit<64> original_price;
}

header corrected_trade_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> trade_id;
    bit<32> original_quantity;
    bit<64> original_price;
    bit<32> corrected_quantity;
    bit<64> corrected_price;
}

header clear_book_message_t {
    bit<64> timestamp;
    bit<16> security_id;
}

header snapshot_complete_message_t {
    bit<64> timestamp;
    bit<64> as_of_sequence_number;
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
    trading_session_status_message_t trading_session_status_message[MAX_MESSAGES];
    order_added_message_t order_added_message[MAX_MESSAGES];
    order_deleted_message_t order_deleted_message[MAX_MESSAGES];
    order_reduced_message_t order_reduced_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    broken_trade_message_t broken_trade_message[MAX_MESSAGES];
    corrected_trade_message_t corrected_trade_message[MAX_MESSAGES];
    clear_book_message_t clear_book_message[MAX_MESSAGES];
    snapshot_complete_message_t snapshot_complete_message[MAX_MESSAGES];
}

parser MemxequitiesMemoirdepthfeedParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w5: parse_trading_session_status_message;
            8w10: parse_order_added_message;
            8w11: parse_order_deleted_message;
            8w12: parse_order_reduced_message;
            8w13: parse_order_executed_message;
            8w14: parse_trade_message;
            8w15: parse_broken_trade_message;
            8w16: parse_corrected_trade_message;
            8w18: parse_clear_book_message;
            8w100: parse_snapshot_complete_message;
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

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_order_added_message {
        packet.extract(hdr.order_added_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_order_deleted_message {
        packet.extract(hdr.order_deleted_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_order_reduced_message {
        packet.extract(hdr.order_reduced_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_corrected_trade_message {
        packet.extract(hdr.corrected_trade_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_clear_book_message {
        packet.extract(hdr.clear_book_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

    state parse_snapshot_complete_message {
        packet.extract(hdr.snapshot_complete_message.next);
        meta.dispatched = 1;
        transition parse_sequenced_message_message;
    }

}

control MemxequitiesMemoirdepthfeedVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesMemoirdepthfeedIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control MemxequitiesMemoirdepthfeedEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxequitiesMemoirdepthfeedComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxequitiesMemoirdepthfeedDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.sequenced_message_message);
        packet.emit(hdr.instrument_directory_message);
        packet.emit(hdr.reg_sho_restriction_message);
        packet.emit(hdr.security_trading_status_message);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.order_added_message);
        packet.emit(hdr.order_deleted_message);
        packet.emit(hdr.order_reduced_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.corrected_trade_message);
        packet.emit(hdr.clear_book_message);
        packet.emit(hdr.snapshot_complete_message);
    }
}

V1Switch(
    MemxequitiesMemoirdepthfeedParser(),
    MemxequitiesMemoirdepthfeedVerifyChecksum(),
    MemxequitiesMemoirdepthfeedIngress(),
    MemxequitiesMemoirdepthfeedEgress(),
    MemxequitiesMemoirdepthfeedComputeChecksum(),
    MemxequitiesMemoirdepthfeedDeparser()
) main;
