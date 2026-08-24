// P4_16 (v1model) definition for: Asx AsxSecurities Trade Ouch v3.6
// 
// Protocol:
//   Organization: Australian Securities Exchange
//   Protocol: Asx Trade
//   Encoding: Ouch
//   Version: 3.6
//   Date: 2/1/2023
//   Specification: asx-trade-ouch-message-specification.pdf
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

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<160> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header order_accepted_message_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> order_id;
    bit<64> quantity;
    bit<32> price;
    bit<8> time_in_force;
    bit<8> open_close;
    bit<80> client_account;
    bit<8> order_state;
    bit<120> customer_info;
    bit<256> exchange_info;
    bit<8> clearing_participant;
    bit<32> crossing_key;
    bit<8> capacity_of_participant;
    bit<8> directed_wholesale;
    bit<32> execution_venue;
    bit<80> intermediary_id;
    bit<160> order_origin;
    bit<64> filler;
    bit<8> ouch_order_type;
    bit<64> short_sell_quantity;
    bit<64> minimum_acceptable_quantity;
}

header order_rejected_message_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> reject_code;
}

header order_replaced_message_t {
    bit<64> timestamp_nanoseconds;
    bit<112> replacement_order_token;
    bit<112> previous_order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> order_id;
    bit<64> quantity;
    bit<32> price;
    bit<8> time_in_force;
    bit<8> open_close;
    bit<80> client_account;
    bit<8> order_state;
    bit<120> customer_info;
    bit<256> exchange_info;
    bit<8> clearing_participant;
    bit<32> crossing_key;
    bit<8> capacity_of_participant;
    bit<8> directed_wholesale;
    bit<32> execution_venue;
    bit<80> intermediary_id;
    bit<160> order_origin;
    bit<64> filler;
    bit<8> ouch_order_type;
    bit<64> short_sell_quantity;
    bit<64> minimum_acceptable_quantity;
}

header order_cancelled_message_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> order_id;
    bit<8> reason;
}

header order_executed_message_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> order_book_id;
    bit<64> traded_quantity;
    bit<32> trade_price;
    bit<96> match_id;
    bit<16> deal_source;
    bit<1> passive_aggressive_indicator;
    bit<2> crossing_dealing_capacity;
    bit<5> reserved;
}

struct metadata_t {
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    order_accepted_message_t order_accepted_message;
    order_rejected_message_t order_rejected_message;
    order_replaced_message_t order_replaced_message;
    order_cancelled_message_t order_cancelled_message;
    order_executed_message_t order_executed_message;
}

parser AsxsecuritiesTradeServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x41: parse_order_accepted_message;
            8w0x4a: parse_order_rejected_message;
            8w0x55: parse_order_replaced_message;
            8w0x43: parse_order_cancelled_message;
            8w0x45: parse_order_executed_message;
            default: accept;
        }
    }

    state parse_order_accepted_message {
        packet.extract(hdr.order_accepted_message);
        transition accept;
    }

    state parse_order_rejected_message {
        packet.extract(hdr.order_rejected_message);
        transition accept;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        transition accept;
    }

    state parse_order_cancelled_message {
        packet.extract(hdr.order_cancelled_message);
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        transition accept;
    }

}

control AsxsecuritiesTradeServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxsecuritiesTradeServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control AsxsecuritiesTradeServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AsxsecuritiesTradeServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AsxsecuritiesTradeServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.order_accepted_message);
        packet.emit(hdr.order_rejected_message);
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.order_cancelled_message);
        packet.emit(hdr.order_executed_message);
    }
}

V1Switch(
    AsxsecuritiesTradeServerParser(),
    AsxsecuritiesTradeServerVerifyChecksum(),
    AsxsecuritiesTradeServerIngress(),
    AsxsecuritiesTradeServerEgress(),
    AsxsecuritiesTradeServerComputeChecksum(),
    AsxsecuritiesTradeServerDeparser()
) main;
