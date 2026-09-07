// P4_16 (v1model) definition for: Cme Globex Mdp3 Sbe v1.10
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Market Data Platform 3
//   Encoding: Simple Binary Encoding
//   Version: 1.10
//   Date: 7/26/2019
//   Specification: Unknown
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
    bit<16> encoding_type;
    bit<32> message_sequence_number;
    bit<64> tcp_sending_time;
    bit<16> tcp_message_size;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header negotiate_t {
    bit<256> hmac_signature;
    bit<160> access_key_id;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<40> session;
    bit<40> firm;
}

header terminate_t {
    bit<384> reason;
    bit<64> uuid;
    bit<64> request_timestamp;
    bit<8> error_codes;
    bit<40> padding_5;
}

header market_data_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header market_data_request_market_data_request_security_group_t {
    bit<48> security_group;
}

header market_data_request_market_data_request_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header market_data_request_market_data_request_related_symbol_group_t {
    bit<32> security_id;
}

header security_list_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_list_request_security_list_request_security_group_t {
    bit<48> security_group;
}

header security_list_request_security_list_request_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_list_request_security_list_request_related_symbol_group_t {
    bit<32> security_id;
}

header security_status_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_status_request_security_status_request_security_group_t {
    bit<48> security_group;
}

header security_status_request_security_status_request_related_symbol_group_header_t {
    bit<16> block_length;
    bit<8> num_in_group;
}

header security_status_request_security_status_request_related_symbol_group_t {
    bit<32> security_id;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> market_data_request_market_data_request_security_group_remaining;
    bit<8> market_data_request_market_data_request_related_symbol_group_remaining;
    bit<8> security_list_request_security_list_request_security_group_remaining;
    bit<8> security_list_request_security_list_request_related_symbol_group_remaining;
    bit<8> security_status_request_security_status_request_security_group_remaining;
    bit<8> security_status_request_security_status_request_related_symbol_group_remaining;
}

struct headers_t {
    message_header_t message_header;
    negotiate_t negotiate;
    terminate_t terminate;
    market_data_request_t market_data_request;
    market_data_request_market_data_request_security_group_t market_data_request_market_data_request_security_group[MAX_MESSAGES];
    market_data_request_market_data_request_related_symbol_group_header_t market_data_request_market_data_request_related_symbol_group_header;
    market_data_request_market_data_request_related_symbol_group_t market_data_request_market_data_request_related_symbol_group[MAX_MESSAGES];
    security_list_request_t security_list_request;
    security_list_request_security_list_request_security_group_t security_list_request_security_list_request_security_group[MAX_MESSAGES];
    security_list_request_security_list_request_related_symbol_group_header_t security_list_request_security_list_request_related_symbol_group_header;
    security_list_request_security_list_request_related_symbol_group_t security_list_request_security_list_request_related_symbol_group[MAX_MESSAGES];
    security_status_request_t security_status_request;
    security_status_request_security_status_request_security_group_t security_status_request_security_status_request_security_group[MAX_MESSAGES];
    security_status_request_security_status_request_related_symbol_group_header_t security_status_request_security_status_request_related_symbol_group_header;
    security_status_request_security_status_request_related_symbol_group_t security_status_request_security_status_request_related_symbol_group[MAX_MESSAGES];
}

parser CmeGlobexMdp3ClienttcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w0xc800: parse_negotiate;
            16w0xcb00: parse_terminate;
            16w0xcd00: parse_market_data_request;
            16w0xd000: parse_security_list_request;
            16w0xd100: parse_security_status_request;
            default: accept;
        }
    }

    state parse_negotiate {
        packet.extract(hdr.negotiate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_terminate {
        packet.extract(hdr.terminate);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_data_request {
        packet.extract(hdr.market_data_request);
        meta.dispatched = 1;
        meta.market_data_request_market_data_request_security_group_remaining = hdr.market_data_request.num_in_group;
        transition select(meta.market_data_request_market_data_request_security_group_remaining) {
            8w0: read_market_data_request_market_data_request_related_symbol_group;
            default: parse_market_data_request_market_data_request_security_group;
        }
    }

    state parse_market_data_request_market_data_request_security_group {
        packet.extract(hdr.market_data_request_market_data_request_security_group.next);
        meta.market_data_request_market_data_request_security_group_remaining = meta.market_data_request_market_data_request_security_group_remaining - 1;
        transition select(meta.market_data_request_market_data_request_security_group_remaining) {
            8w0: read_market_data_request_market_data_request_related_symbol_group;
            default: parse_market_data_request_market_data_request_security_group;
        }
    }

    state read_market_data_request_market_data_request_related_symbol_group {
        packet.extract(hdr.market_data_request_market_data_request_related_symbol_group_header);
        meta.market_data_request_market_data_request_related_symbol_group_remaining = hdr.market_data_request_market_data_request_related_symbol_group_header.num_in_group;
        transition select(meta.market_data_request_market_data_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_market_data_request_market_data_request_related_symbol_group;
        }
    }

    state parse_market_data_request_market_data_request_related_symbol_group {
        packet.extract(hdr.market_data_request_market_data_request_related_symbol_group.next);
        meta.market_data_request_market_data_request_related_symbol_group_remaining = meta.market_data_request_market_data_request_related_symbol_group_remaining - 1;
        transition select(meta.market_data_request_market_data_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_market_data_request_market_data_request_related_symbol_group;
        }
    }

    state parse_security_list_request {
        packet.extract(hdr.security_list_request);
        meta.dispatched = 1;
        meta.security_list_request_security_list_request_security_group_remaining = hdr.security_list_request.num_in_group;
        transition select(meta.security_list_request_security_list_request_security_group_remaining) {
            8w0: read_security_list_request_security_list_request_related_symbol_group;
            default: parse_security_list_request_security_list_request_security_group;
        }
    }

    state parse_security_list_request_security_list_request_security_group {
        packet.extract(hdr.security_list_request_security_list_request_security_group.next);
        meta.security_list_request_security_list_request_security_group_remaining = meta.security_list_request_security_list_request_security_group_remaining - 1;
        transition select(meta.security_list_request_security_list_request_security_group_remaining) {
            8w0: read_security_list_request_security_list_request_related_symbol_group;
            default: parse_security_list_request_security_list_request_security_group;
        }
    }

    state read_security_list_request_security_list_request_related_symbol_group {
        packet.extract(hdr.security_list_request_security_list_request_related_symbol_group_header);
        meta.security_list_request_security_list_request_related_symbol_group_remaining = hdr.security_list_request_security_list_request_related_symbol_group_header.num_in_group;
        transition select(meta.security_list_request_security_list_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_list_request_security_list_request_related_symbol_group;
        }
    }

    state parse_security_list_request_security_list_request_related_symbol_group {
        packet.extract(hdr.security_list_request_security_list_request_related_symbol_group.next);
        meta.security_list_request_security_list_request_related_symbol_group_remaining = meta.security_list_request_security_list_request_related_symbol_group_remaining - 1;
        transition select(meta.security_list_request_security_list_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_list_request_security_list_request_related_symbol_group;
        }
    }

    state parse_security_status_request {
        packet.extract(hdr.security_status_request);
        meta.dispatched = 1;
        meta.security_status_request_security_status_request_security_group_remaining = hdr.security_status_request.num_in_group;
        transition select(meta.security_status_request_security_status_request_security_group_remaining) {
            8w0: read_security_status_request_security_status_request_related_symbol_group;
            default: parse_security_status_request_security_status_request_security_group;
        }
    }

    state parse_security_status_request_security_status_request_security_group {
        packet.extract(hdr.security_status_request_security_status_request_security_group.next);
        meta.security_status_request_security_status_request_security_group_remaining = meta.security_status_request_security_status_request_security_group_remaining - 1;
        transition select(meta.security_status_request_security_status_request_security_group_remaining) {
            8w0: read_security_status_request_security_status_request_related_symbol_group;
            default: parse_security_status_request_security_status_request_security_group;
        }
    }

    state read_security_status_request_security_status_request_related_symbol_group {
        packet.extract(hdr.security_status_request_security_status_request_related_symbol_group_header);
        meta.security_status_request_security_status_request_related_symbol_group_remaining = hdr.security_status_request_security_status_request_related_symbol_group_header.num_in_group;
        transition select(meta.security_status_request_security_status_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_status_request_security_status_request_related_symbol_group;
        }
    }

    state parse_security_status_request_security_status_request_related_symbol_group {
        packet.extract(hdr.security_status_request_security_status_request_related_symbol_group.next);
        meta.security_status_request_security_status_request_related_symbol_group_remaining = meta.security_status_request_security_status_request_related_symbol_group_remaining - 1;
        transition select(meta.security_status_request_security_status_request_related_symbol_group_remaining) {
            8w0: accept;
            default: parse_security_status_request_security_status_request_related_symbol_group;
        }
    }

}

control CmeGlobexMdp3ClienttcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexMdp3ClienttcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control CmeGlobexMdp3ClienttcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CmeGlobexMdp3ClienttcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexMdp3ClienttcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.negotiate);
        packet.emit(hdr.terminate);
        packet.emit(hdr.market_data_request);
        packet.emit(hdr.market_data_request_market_data_request_security_group);
        packet.emit(hdr.market_data_request_market_data_request_related_symbol_group_header);
        packet.emit(hdr.market_data_request_market_data_request_related_symbol_group);
        packet.emit(hdr.security_list_request);
        packet.emit(hdr.security_list_request_security_list_request_security_group);
        packet.emit(hdr.security_list_request_security_list_request_related_symbol_group_header);
        packet.emit(hdr.security_list_request_security_list_request_related_symbol_group);
        packet.emit(hdr.security_status_request);
        packet.emit(hdr.security_status_request_security_status_request_security_group);
        packet.emit(hdr.security_status_request_security_status_request_related_symbol_group_header);
        packet.emit(hdr.security_status_request_security_status_request_related_symbol_group);
    }
}

V1Switch(
    CmeGlobexMdp3ClienttcpParser(),
    CmeGlobexMdp3ClienttcpVerifyChecksum(),
    CmeGlobexMdp3ClienttcpIngress(),
    CmeGlobexMdp3ClienttcpEgress(),
    CmeGlobexMdp3ClienttcpComputeChecksum(),
    CmeGlobexMdp3ClienttcpDeparser()
) main;
