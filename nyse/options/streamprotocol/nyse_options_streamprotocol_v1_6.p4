// P4_16 (v1model) definition for: Nyse Options StreamProtocol PillarStream v1.6
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Stream Protocol
//   Encoding: Pillar Stream Protocol
//   Version: 1.6
//   Date: 9/26/2019
//   Specification: NYSE_Pillar_Stream_Protocol_Specification.pdf
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

header packet_header_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<128> username;
    bit<256> password;
    bit<32> mic;
    bit<160> version;
    bit<16> msg_type_2;
    bit<16> msg_length_2;
    bit<128> username_2;
    bit<8> status;
    bit<16> msg_type_3;
    bit<16> msg_length_3;
    bit<32> sess;
    bit<32> user;
    bit<64> next_seq;
    bit<8> access;
    bit<16> msg_type_4;
    bit<16> msg_length_4;
    bit<16> msg_type_5;
    bit<16> msg_length_5;
    bit<32> sess_2;
    bit<32> user_2;
    bit<64> start_seq;
    bit<64> end_seq;
    bit<8> access_2;
    bit<8> mode;
    bit<16> msg_type_6;
    bit<16> msg_length_6;
    bit<32> sess_3;
    bit<32> user_3;
    bit<8> status_2;
    bit<8> access_3;
    bit<16> msg_type_7;
    bit<16> msg_length_7;
    bit<32> sess_4;
    bit<32> user_4;
    bit<16> msg_type_8;
    bit<16> msg_length_8;
    bit<32> sess_5;
    bit<32> user_5;
    bit<8> status_3;
    bit<16> msg_type_9;
    bit<16> msg_length_9;
    bit<32> sess_6;
    bit<32> user_6;
    bit<64> seq;
    bit<32> reserved_4;
    bit<64> timestamp;
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
    bit<16> seq_msg_type_2;
    bit<16> seq_msg_length_2;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
}

parser NyseOptionsStreamprotocolParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition accept;
    }

}

control NyseOptionsStreamprotocolVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseOptionsStreamprotocolIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NyseOptionsStreamprotocolEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NyseOptionsStreamprotocolComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NyseOptionsStreamprotocolDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
    }
}

V1Switch(
    NyseOptionsStreamprotocolParser(),
    NyseOptionsStreamprotocolVerifyChecksum(),
    NyseOptionsStreamprotocolIngress(),
    NyseOptionsStreamprotocolEgress(),
    NyseOptionsStreamprotocolComputeChecksum(),
    NyseOptionsStreamprotocolDeparser()
) main;
