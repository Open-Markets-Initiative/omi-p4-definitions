// P4_16 (v1model) definition for: Lme LmeSelect WarehouseStockSnapshot LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource WarehouseStock Refresh
//   Encoding: LMEsource
//   Version: 4.18
//   Date: 08/18/2026
//   Specification: LMEsource Client Interface Specification v4 18.pdf
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

header packet_header_t {
    bit<16> pkt_size;
    bit<8> msg_count;
    bit<8> filler;
    bit<32> seq_num;
    bit<64> send_time;
}

header packet_header_message_t {
    bit<16> msg_size;
    bit<16> msg_type;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header warehouse_stock_movement_message_t {
    bit<32> report_date;
    bit<96> report_level;
    bit<16> remaining_records;
    bit<16> record_count;
}

header warehouse_stock_movement_message_stock_records_t {
    bit<16> product_code;
    bit<32> location;
    bit<32> grade_code;
    bit<24> stock_status;
    bit<32> stock_quantity;
}

header refresh_complete_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> warehouse_stock_movement_message_stock_records_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_message_t packet_header_message[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    warehouse_stock_movement_message_t warehouse_stock_movement_message[MAX_MESSAGES];
    warehouse_stock_movement_message_stock_records_t warehouse_stock_movement_message_stock_records[MAX_MESSAGES];
    refresh_complete_message_t refresh_complete_message[MAX_MESSAGES];
}

parser LmeselectWarehousestocksnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.msg_count) {
            8w0: parse_packet_header_message_empty;
            default: parse_packet_header_message;
        }
    }

    state parse_packet_header_message {
        packet.extract(hdr.packet_header_message.next);
        transition select(hdr.packet_header_message.last.msg_type) {
            16w0x6400: parse_sequence_reset_message;
            16w0xaa01: parse_warehouse_stock_movement_message;
            16w0xcb00: parse_refresh_complete_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_warehouse_stock_movement_message {
        packet.extract(hdr.warehouse_stock_movement_message.next);
        meta.dispatched = 1;
        meta.warehouse_stock_movement_message_stock_records_remaining = hdr.warehouse_stock_movement_message.last.record_count;
        transition select(meta.warehouse_stock_movement_message_stock_records_remaining) {
            16w0: parse_packet_header_message;
            default: parse_warehouse_stock_movement_message_stock_records;
        }
    }

    state parse_warehouse_stock_movement_message_stock_records {
        packet.extract(hdr.warehouse_stock_movement_message_stock_records.next);
        meta.warehouse_stock_movement_message_stock_records_remaining = meta.warehouse_stock_movement_message_stock_records_remaining - 1;
        transition select(meta.warehouse_stock_movement_message_stock_records_remaining) {
            16w0: parse_packet_header_message;
            default: parse_warehouse_stock_movement_message_stock_records;
        }
    }

    state parse_refresh_complete_message {
        packet.extract(hdr.refresh_complete_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_message;
    }

    state parse_packet_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectWarehousestocksnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectWarehousestocksnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectWarehousestocksnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectWarehousestocksnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectWarehousestocksnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_message);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.warehouse_stock_movement_message);
        packet.emit(hdr.warehouse_stock_movement_message_stock_records);
        packet.emit(hdr.refresh_complete_message);
    }
}

V1Switch(
    LmeselectWarehousestocksnapshotParser(),
    LmeselectWarehousestocksnapshotVerifyChecksum(),
    LmeselectWarehousestocksnapshotIngress(),
    LmeselectWarehousestocksnapshotEgress(),
    LmeselectWarehousestocksnapshotComputeChecksum(),
    LmeselectWarehousestocksnapshotDeparser()
) main;
