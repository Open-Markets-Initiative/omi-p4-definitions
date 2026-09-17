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

header order_accepted_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> order_id;
    bit<64> quantity;
    bit<32> price;
    bit<8> time_in_force;
    bit<8> open_close;
    bit<128> client_account;
    bit<8> order_state;
    bit<120> customer_info;
    bit<256> exchange_info;
}

header mass_cancel_accepted_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> status;
}

header order_rejected_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> reject_code;
}

header order_replaced_t {
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
    bit<128> client_account;
    bit<8> order_state;
    bit<120> customer_info;
    bit<256> exchange_info;
}

header order_canceled_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> order_book_id;
    bit<8> side;
    bit<64> order_id;
    bit<8> cancel_reason;
}

header order_executed_t {
    bit<64> timestamp_nanoseconds;
    bit<112> order_token;
    bit<32> order_book_id;
    bit<64> traded_quantity;
    bit<32> trade_price;
    bit<64> match_id;
    bit<32> combo_group_id;
    bit<8> deal_source;
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
    order_accepted_t order_accepted;
    mass_cancel_accepted_t mass_cancel_accepted;
    order_rejected_t order_rejected;
    order_replaced_t order_replaced;
    order_canceled_t order_canceled;
    order_executed_t order_executed;
}

parser OsederivativesGeniuminetServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat;
            8w0x5a: parse_end_of_session;
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
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x41: parse_order_accepted;
            8w0x4d: parse_mass_cancel_accepted;
            8w0x4a: parse_order_rejected;
            8w0x55: parse_order_replaced;
            8w0x43: parse_order_canceled;
            8w0x45: parse_order_executed;
            default: accept;
        }
    }

    state parse_order_accepted {
        packet.extract(hdr.order_accepted);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mass_cancel_accepted {
        packet.extract(hdr.mass_cancel_accepted);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_rejected {
        packet.extract(hdr.order_rejected);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_replaced {
        packet.extract(hdr.order_replaced);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_canceled {
        packet.extract(hdr.order_canceled);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_executed {
        packet.extract(hdr.order_executed);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

}

control OsederivativesGeniuminetServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesGeniuminetServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control OsederivativesGeniuminetServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OsederivativesGeniuminetServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OsederivativesGeniuminetServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.order_accepted);
        packet.emit(hdr.mass_cancel_accepted);
        packet.emit(hdr.order_rejected);
        packet.emit(hdr.order_replaced);
        packet.emit(hdr.order_canceled);
        packet.emit(hdr.order_executed);
    }
}

V1Switch(
    OsederivativesGeniuminetServerParser(),
    OsederivativesGeniuminetServerVerifyChecksum(),
    OsederivativesGeniuminetServerIngress(),
    OsederivativesGeniuminetServerEgress(),
    OsederivativesGeniuminetServerComputeChecksum(),
    OsederivativesGeniuminetServerDeparser()
) main;
