// P4_16 (v1model) definition for: Jpx OseDerivatives GeniumInet Ouch v5.0
// 
// Protocol:
//   Organization: Japan Exchange Group
//   Protocol: Genium Inet
//   Encoding: Ouch
//   Version: 5.0
//   Date: 9/16/2020
//   Specification: OUCH_ProtSpec_OSE_va2656.pdf
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
}

header unsequenced_data_packet_t {
    bit<8> unsequenced_message_type;
}

header enter_order_t {
    bit<112> order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> quantity;
    bit<32> price;
    bit<8> time_in_force;
    bit<8> open_close;
    bit<128> client_account;
    bit<120> customer_info;
    bit<256> exchange_info;
}

header enter_mm_order_t {
    bit<112> order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> quantity;
    bit<32> price;
    bit<128> client_account;
    bit<256> exchange_info;
}

header replace_order_t {
    bit<112> existing_order_token;
    bit<112> replacement_order_token;
    bit<64> quantity;
    bit<32> price;
    bit<8> open_close;
    bit<128> client_account;
    bit<120> customer_info;
    bit<256> exchange_info;
}

header cancel_order_t {
    bit<112> order_token;
}

header cancel_by_order_id_t {
    bit<32> order_book_id;
    bit<8> side;
    bit<64> order_id;
}

header mass_cancel_t {
    bit<112> order_token;
    bit<32> underlying_id;
    bit<8> scope;
    bit<128> client_account;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    enter_order_t enter_order;
    enter_mm_order_t enter_mm_order;
    replace_order_t replace_order;
    cancel_order_t cancel_order;
    cancel_by_order_id_t cancel_by_order_id;
    mass_cancel_t mass_cancel;
}

parser JpxOsederivativesGeniuminetClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat;
            8w0x4f: parse_logout_request;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            8w0x4f: parse_enter_order;
            8w0x50: parse_enter_mm_order;
            8w0x55: parse_replace_order;
            8w0x58: parse_cancel_order;
            8w0x59: parse_cancel_by_order_id;
            8w0x4d: parse_mass_cancel;
            default: accept;
        }
    }

    state parse_enter_order {
        packet.extract(hdr.enter_order);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_enter_mm_order {
        packet.extract(hdr.enter_mm_order);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_replace_order {
        packet.extract(hdr.replace_order);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_order {
        packet.extract(hdr.cancel_order);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_by_order_id {
        packet.extract(hdr.cancel_by_order_id);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel {
        packet.extract(hdr.mass_cancel);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request {
        meta.dispatched = 1;
        transition accept;
    }

}

control JpxOsederivativesGeniuminetClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JpxOsederivativesGeniuminetClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control JpxOsederivativesGeniuminetClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control JpxOsederivativesGeniuminetClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control JpxOsederivativesGeniuminetClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.enter_order);
        packet.emit(hdr.enter_mm_order);
        packet.emit(hdr.replace_order);
        packet.emit(hdr.cancel_order);
        packet.emit(hdr.cancel_by_order_id);
        packet.emit(hdr.mass_cancel);
    }
}

V1Switch(
    JpxOsederivativesGeniuminetClientParser(),
    JpxOsederivativesGeniuminetClientVerifyChecksum(),
    JpxOsederivativesGeniuminetClientIngress(),
    JpxOsederivativesGeniuminetClientEgress(),
    JpxOsederivativesGeniuminetClientComputeChecksum(),
    JpxOsederivativesGeniuminetClientDeparser()
) main;
