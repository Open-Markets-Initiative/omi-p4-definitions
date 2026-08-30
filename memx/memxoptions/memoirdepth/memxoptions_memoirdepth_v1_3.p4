// P4_16 (v1model) definition for: Memx MemxOptions MemoirDepth Sbe v1.3
// 
// Protocol:
//   Organization: The Members Exchange
//   Protocol: Member Order Information Record Depth
//   Encoding: Simple Binary Encoding
//   Version: 1.3
//   Date: 6/29/23
//   Specification: MEMOIR Depth for US Options-v1_3.pdf
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

header instrument_trading_status_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> instrument_trading_status;
    bit<8> instrument_trading_status_reason;
}

header trading_session_status_message_t {
    bit<64> timestamp;
    bit<8> trading_session;
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

header order_added_short_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<64> order_id;
    bit<8> side;
    bit<16> quantity_short;
    bit<16> price_short;
}

header order_added_long_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<64> order_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
}

header order_added_extended_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> order_capacity;
    bit<64> order_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
}

header order_deleted_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> order_capacity;
    bit<64> order_id;
}

header order_reduced_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> order_capacity;
    bit<64> order_id;
    bit<8> side;
    bit<32> quantity;
    bit<64> price;
    bit<32> quantity_reduced;
}

header order_executed_message_t {
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> order_capacity;
    bit<1> intermarket_sweep;
    bit<7> reserved_7;
    bit<64> order_id;
    bit<64> trade_id;
    bit<32> quantity;
    bit<64> price;
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
    instrument_trading_status_message_t instrument_trading_status_message;
    trading_session_status_message_t trading_session_status_message;
    broken_trade_message_t broken_trade_message;
    corrected_trade_message_t corrected_trade_message;
    snapshot_complete_message_t snapshot_complete_message;
    order_added_short_message_t order_added_short_message;
    order_added_long_message_t order_added_long_message;
    order_added_extended_message_t order_added_extended_message;
    order_deleted_message_t order_deleted_message;
    order_reduced_message_t order_reduced_message;
    order_executed_message_t order_executed_message;
    clear_book_message_t clear_book_message;
}

parser MemxoptionsMemoirdepthParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
            8w2: parse_instrument_trading_status_message;
            8w3: parse_trading_session_status_message;
            8w5: parse_broken_trade_message;
            8w6: parse_corrected_trade_message;
            8w7: parse_snapshot_complete_message;
            8w10: parse_order_added_short_message;
            8w11: parse_order_added_long_message;
            8w12: parse_order_added_extended_message;
            8w13: parse_order_deleted_message;
            8w14: parse_order_reduced_message;
            8w15: parse_order_executed_message;
            8w18: parse_clear_book_message;
            default: accept;
        }
    }

    state parse_instrument_directory_message {
        packet.extract(hdr.instrument_directory_message);
        transition accept;
    }

    state parse_instrument_trading_status_message {
        packet.extract(hdr.instrument_trading_status_message);
        transition accept;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
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

    state parse_order_added_short_message {
        packet.extract(hdr.order_added_short_message);
        transition accept;
    }

    state parse_order_added_long_message {
        packet.extract(hdr.order_added_long_message);
        transition accept;
    }

    state parse_order_added_extended_message {
        packet.extract(hdr.order_added_extended_message);
        transition accept;
    }

    state parse_order_deleted_message {
        packet.extract(hdr.order_deleted_message);
        transition accept;
    }

    state parse_order_reduced_message {
        packet.extract(hdr.order_reduced_message);
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        transition accept;
    }

    state parse_clear_book_message {
        packet.extract(hdr.clear_book_message);
        transition accept;
    }

}

control MemxoptionsMemoirdepthVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoirdepthIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control MemxoptionsMemoirdepthEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control MemxoptionsMemoirdepthComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control MemxoptionsMemoirdepthDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.instrument_directory_message);
        packet.emit(hdr.instrument_trading_status_message);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.corrected_trade_message);
        packet.emit(hdr.snapshot_complete_message);
        packet.emit(hdr.order_added_short_message);
        packet.emit(hdr.order_added_long_message);
        packet.emit(hdr.order_added_extended_message);
        packet.emit(hdr.order_deleted_message);
        packet.emit(hdr.order_reduced_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.clear_book_message);
    }
}

V1Switch(
    MemxoptionsMemoirdepthParser(),
    MemxoptionsMemoirdepthVerifyChecksum(),
    MemxoptionsMemoirdepthIngress(),
    MemxoptionsMemoirdepthEgress(),
    MemxoptionsMemoirdepthComputeChecksum(),
    MemxoptionsMemoirdepthDeparser()
) main;
