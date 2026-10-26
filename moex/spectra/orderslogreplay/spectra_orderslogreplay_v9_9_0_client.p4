// P4_16 (v1model) definition for: Moex Spectra OrdersLogReplay Simba v9.9.0
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: SIMBA Spectra Orders Log Historical Replay
//   Encoding: SIMBA
//   Version: 9.9.0
//   Date: 07/16/2026
//   Specification: MOEX Spectra SIMBA Market Data (SBE) (9.9.0).pdf
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

header sbe_header_t {
    bit<32> msg_seq_num;
    bit<16> msg_size;
    bit<16> msg_flags;
    bit<64> sending_time;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header logout_message_t {
    bit<2048> text;
}

header market_data_request_message_t {
    bit<32> appl_beg_seq_num;
    bit<32> appl_end_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    sbe_header_t sbe_header;
    logout_message_t logout_message;
    market_data_request_message_t market_data_request_message;
}

parser SpectraOrderslogreplayClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.sbe_header);
        transition select(hdr.sbe_header.template_id) {
            16w0xe803: parse_logon_message;
            16w0xe903: parse_logout_message;
            16w0xea03: parse_market_data_request_message;
            default: accept;
        }
    }

    state parse_logon_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_data_request_message {
        packet.extract(hdr.market_data_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SpectraOrderslogreplayClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderslogreplayClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraOrderslogreplayClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraOrderslogreplayClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderslogreplayClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.sbe_header);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.market_data_request_message);
    }
}

V1Switch(
    SpectraOrderslogreplayClientParser(),
    SpectraOrderslogreplayClientVerifyChecksum(),
    SpectraOrderslogreplayClientIngress(),
    SpectraOrderslogreplayClientEgress(),
    SpectraOrderslogreplayClientComputeChecksum(),
    SpectraOrderslogreplayClientDeparser()
) main;
