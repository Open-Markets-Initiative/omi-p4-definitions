// P4_16 (v1model) definition for: Cme Globex Mdp3 Sbe v1.9
// 
// Protocol:
//   Organization: CME Group
//   Protocol: Market Data Platform 3
//   Encoding: Simple Binary Encoding
//   Version: 1.9
//   Date: 3/08/2018
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
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
    bit<48> security_group;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<32> security_id;
}

header security_list_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<48> security_group;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<32> security_id;
}

header security_status_request_t {
    bit<32> md_req_id;
    bit<8> subscription_req_type;
    bit<16> block_length;
    bit<8> num_in_group;
    bit<48> security_group;
    bit<16> block_length_2;
    bit<8> num_in_group_2;
    bit<32> security_id;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    negotiate_t negotiate;
    terminate_t terminate;
    market_data_request_t market_data_request;
    security_list_request_t security_list_request;
    security_status_request_t security_status_request;
}

parser CmeGlobexMdp3ClienttcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w200: parse_negotiate;
            16w203: parse_terminate;
            16w205: parse_market_data_request;
            16w208: parse_security_list_request;
            16w209: parse_security_status_request;
            default: accept;
        }
    }

    state parse_negotiate {
        packet.extract(hdr.negotiate);
        transition accept;
    }

    state parse_terminate {
        packet.extract(hdr.terminate);
        transition accept;
    }

    state parse_market_data_request {
        packet.extract(hdr.market_data_request);
        transition accept;
    }

    state parse_security_list_request {
        packet.extract(hdr.security_list_request);
        transition accept;
    }

    state parse_security_status_request {
        packet.extract(hdr.security_status_request);
        transition accept;
    }

}

control CmeGlobexMdp3ClienttcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CmeGlobexMdp3ClienttcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
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
        packet.emit(hdr.security_list_request);
        packet.emit(hdr.security_status_request);
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
