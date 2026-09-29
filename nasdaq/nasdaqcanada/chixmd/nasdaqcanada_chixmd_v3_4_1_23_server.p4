// P4_16 (v1model) definition for: Nasdaq NasdaqCanada Chixmd Itch v3.4.1.23
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: CHIXMD Market Data
//   Encoding: Itch
//   Version: 3.4.1.23
//   Date: 10/08/2025
//   Specification: Nasdaq Canada Market Data Specification - CHIXMD 3.4 V1.23.pdf
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

header server_packet_header_t {
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<80> sequence_number;
    bit<8> comma;
    bit<80> messages_total;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<64> timestamp;
    bit<8> message_type;
}

header add_order_message_t {
    bit<72> order_reference;
    bit<8> buy_sell_indicator;
    bit<48> shares;
    bit<80> stock;
    bit<80> price;
    bit<24> broker;
}

header long_form_add_order_message_t {
    bit<72> order_reference;
    bit<8> buy_sell_indicator;
    bit<80> long_shares;
    bit<80> stock;
    bit<152> long_price;
    bit<24> broker;
}

header order_execution_message_t {
    bit<72> order_reference;
    bit<48> executed_shares;
    bit<72> trade_reference;
    bit<72> contra_order_reference;
    bit<8> trade_attribute;
    bit<24> broker;
    bit<24> contra_broker;
}

header long_form_order_execution_message_t {
    bit<72> order_reference;
    bit<80> long_executed_shares;
    bit<72> trade_reference;
    bit<72> contra_order_reference;
    bit<8> trade_attribute;
    bit<24> broker;
    bit<24> contra_broker;
}

header order_cancel_message_t {
    bit<72> order_reference;
    bit<48> canceled_shares;
}

header long_form_order_cancel_message_t {
    bit<72> order_reference;
    bit<80> long_canceled_shares;
}

header trade_message_t {
    bit<72> order_reference;
    bit<8> buy_sell_indicator;
    bit<48> shares;
    bit<80> stock;
    bit<80> price;
    bit<72> trade_reference;
    bit<72> contra_order_reference;
    bit<24> broker;
    bit<24> contra_broker;
    bit<8> trade_attribute;
    bit<8> cross_type;
    bit<8> settlement_terms;
}

header long_form_trade_message_t {
    bit<72> order_reference;
    bit<8> buy_sell_indicator;
    bit<80> long_shares;
    bit<80> stock;
    bit<152> long_price;
    bit<72> trade_reference;
    bit<72> contra_order_reference;
    bit<24> broker;
    bit<24> contra_broker;
    bit<8> trade_attribute;
    bit<8> cross_type;
    bit<8> settlement_terms;
}

header broken_trade_message_t {
    bit<72> trade_reference;
}

header system_event_message_t {
    bit<8> event_code;
}

header stock_status_message_t {
    bit<80> stock;
    bit<8> trading_state;
    bit<8> reserved_1;
    bit<8> listing_market;
    bit<32> board_lot_size;
    bit<24> currency;
    bit<8> gef_eligible;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    add_order_message_t add_order_message;
    long_form_add_order_message_t long_form_add_order_message;
    order_execution_message_t order_execution_message;
    long_form_order_execution_message_t long_form_order_execution_message;
    order_cancel_message_t order_cancel_message;
    long_form_order_cancel_message_t long_form_order_cancel_message;
    trade_message_t trade_message;
    long_form_trade_message_t long_form_trade_message;
    broken_trade_message_t broken_trade_message;
    system_event_message_t system_event_message;
    stock_status_message_t stock_status_message;
}

parser NasdaqcanadaChixmdServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.message_type) {
            8w0x41: parse_add_order_message;
            8w0x61: parse_long_form_add_order_message;
            8w0x45: parse_order_execution_message;
            8w0x65: parse_long_form_order_execution_message;
            8w0x58: parse_order_cancel_message;
            8w0x78: parse_long_form_order_cancel_message;
            8w0x50: parse_trade_message;
            8w0x70: parse_long_form_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x53: parse_system_event_message;
            8w0x48: parse_stock_status_message;
            default: accept;
        }
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_form_add_order_message {
        packet.extract(hdr.long_form_add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_execution_message {
        packet.extract(hdr.order_execution_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_form_order_execution_message {
        packet.extract(hdr.long_form_order_execution_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_form_order_cancel_message {
        packet.extract(hdr.long_form_order_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_long_form_trade_message {
        packet.extract(hdr.long_form_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stock_status_message {
        packet.extract(hdr.stock_status_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NasdaqcanadaChixmdServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqcanadaChixmdServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NasdaqcanadaChixmdServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NasdaqcanadaChixmdServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NasdaqcanadaChixmdServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.long_form_add_order_message);
        packet.emit(hdr.order_execution_message);
        packet.emit(hdr.long_form_order_execution_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.long_form_order_cancel_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.long_form_trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_status_message);
    }
}

V1Switch(
    NasdaqcanadaChixmdServerParser(),
    NasdaqcanadaChixmdServerVerifyChecksum(),
    NasdaqcanadaChixmdServerIngress(),
    NasdaqcanadaChixmdServerEgress(),
    NasdaqcanadaChixmdServerComputeChecksum(),
    NasdaqcanadaChixmdServerDeparser()
) main;
