// P4_16 (v1model) definition for: Lme LmeSelect DrSignal LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource DrSignal
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

header packet_header_messages_t {
    bit<16> msg_size;
    bit<16> msg_type;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header disaster_recovery_signal_message_t {
    bit<32> dr_status;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_messages_t packet_header_messages[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    disaster_recovery_signal_message_t disaster_recovery_signal_message[MAX_MESSAGES];
}

parser LmeselectDrsignalParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.msg_count) {
            8w0: parse_packet_header_messages_empty;
            default: parse_packet_header_messages;
        }
    }

    state parse_packet_header_messages {
        packet.extract(hdr.packet_header_messages.next);
        transition select(hdr.packet_header_messages.last.msg_type) {
            16w0x6400: parse_sequence_reset_message;
            16w0x6900: parse_disaster_recovery_signal_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_disaster_recovery_signal_message {
        packet.extract(hdr.disaster_recovery_signal_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_packet_header_messages_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectDrsignalVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectDrsignalIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectDrsignalEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectDrsignalComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectDrsignalDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_messages);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.disaster_recovery_signal_message);
    }
}

V1Switch(
    LmeselectDrsignalParser(),
    LmeselectDrsignalVerifyChecksum(),
    LmeselectDrsignalIngress(),
    LmeselectDrsignalEgress(),
    LmeselectDrsignalComputeChecksum(),
    LmeselectDrsignalDeparser()
) main;
