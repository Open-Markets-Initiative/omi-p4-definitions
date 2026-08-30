// P4_16 (v1model) definition for: Nyse ArcaEquities ArcaBook Pillar v2.1
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: ArcaBook
//   Encoding: Pillar
//   Version: 2.1
//   Date: 10/23/2025
//   Specification: ArcaBook_Client_Specification.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
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

header message_header_t {
    bit<16> pkt_size;
    bit<8> delivery_flag;
    bit<8> number_msgs;
    bit<32> seq_num;
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<16> message_size;
    bit<16> message_type;
}

header add_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<8> order_idgtc_indicator;
    bit<8> trade_session;
}

header modify_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<8> order_idgtc_indicator;
    bit<8> reason_code;
}

header delete_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<8> side;
    bit<8> order_idgtc_indicator;
    bit<8> reason_code;
}

header execution_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> order_idgtc_indicator;
    bit<8> reason_code;
    bit<32> trade_id;
}

header imbalance_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> indicative_match_price;
    bit<32> paired_qty;
    bit<32> total_imbalance_qty;
    bit<32> market_imbalance_qty;
    bit<16> auction_time;
    bit<8> auction_type;
    bit<8> imbalance_side;
    bit<32> continuous_book_clearing_price;
    bit<32> closing_only_clearing_price;
    bit<32> ssr_filing_price;
}

header add_order_refresh_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<8> order_idgtc_indicator;
    bit<8> trade_session;
}

header attributed_add_order_message_t {
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<8> order_idgtc_indicator;
    bit<8> trade_session;
    bit<40> firm_id;
}

header attributed_add_order_refresh_message_t {
    bit<32> source_time;
    bit<32> source_time_ns;
    bit<32> symbol_index;
    bit<32> symbol_seq_num;
    bit<32> order_id;
    bit<32> price;
    bit<32> volume;
    bit<8> side;
    bit<8> order_idgtc_indicator;
    bit<8> trade_session;
    bit<40> firm_id;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    add_order_message_t add_order_message;
    modify_order_message_t modify_order_message;
    delete_order_message_t delete_order_message;
    execution_message_t execution_message;
    imbalance_message_t imbalance_message;
    add_order_refresh_message_t add_order_refresh_message;
    attributed_add_order_message_t attributed_add_order_message;
    attributed_add_order_refresh_message_t attributed_add_order_refresh_message;
}

parser ArcaequitiesArcabookParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            16w100: parse_add_order_message;
            16w101: parse_modify_order_message;
            16w102: parse_delete_order_message;
            16w103: parse_execution_message;
            16w105: parse_imbalance_message;
            16w106: parse_add_order_refresh_message;
            16w107: parse_attributed_add_order_message;
            16w108: parse_attributed_add_order_refresh_message;
            default: accept;
        }
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        transition accept;
    }

    state parse_modify_order_message {
        packet.extract(hdr.modify_order_message);
        transition accept;
    }

    state parse_delete_order_message {
        packet.extract(hdr.delete_order_message);
        transition accept;
    }

    state parse_execution_message {
        packet.extract(hdr.execution_message);
        transition accept;
    }

    state parse_imbalance_message {
        packet.extract(hdr.imbalance_message);
        transition accept;
    }

    state parse_add_order_refresh_message {
        packet.extract(hdr.add_order_refresh_message);
        transition accept;
    }

    state parse_attributed_add_order_message {
        packet.extract(hdr.attributed_add_order_message);
        transition accept;
    }

    state parse_attributed_add_order_refresh_message {
        packet.extract(hdr.attributed_add_order_refresh_message);
        transition accept;
    }

}

control ArcaequitiesArcabookVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaequitiesArcabookIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control ArcaequitiesArcabookEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control ArcaequitiesArcabookComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control ArcaequitiesArcabookDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.modify_order_message);
        packet.emit(hdr.delete_order_message);
        packet.emit(hdr.execution_message);
        packet.emit(hdr.imbalance_message);
        packet.emit(hdr.add_order_refresh_message);
        packet.emit(hdr.attributed_add_order_message);
        packet.emit(hdr.attributed_add_order_refresh_message);
    }
}

V1Switch(
    ArcaequitiesArcabookParser(),
    ArcaequitiesArcabookVerifyChecksum(),
    ArcaequitiesArcabookIngress(),
    ArcaequitiesArcabookEgress(),
    ArcaequitiesArcabookComputeChecksum(),
    ArcaequitiesArcabookDeparser()
) main;
