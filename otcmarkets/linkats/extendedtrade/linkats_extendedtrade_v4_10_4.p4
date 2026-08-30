// P4_16 (v1model) definition for: OtcMarkets LinkAts ExtendedTrade Link v4.10.4
// 
// Protocol:
//   Organization: OTC Markets Group
//   Protocol: 
//   Encoding: Otc Link
//   Version: 4.10.4
//   Date: 6/16/2026
//   Specification: OTC Markets Multicast Data Feeds.pdf
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

header message_header_t {
    bit<16> packet_size;
    bit<32> seq_num;
    bit<1> heartbeat;
    bit<1> seq_num_reset;
    bit<4> reserved_4;
    bit<1> replay;
    bit<1> test;
    bit<8> messages;
    bit<32> packet_milli;
    bit<16> message_size;
    bit<8> message_type;
}

header start_of_spin_message_t {
    bit<32> channel_seq_num;
    bit<8> spin_type;
    bit<64> spin_start_time_milli;
    bit<32> spin_last_seq_num;
}

header end_of_spin_message_t {
    bit<32> channel_seq_num;
    bit<8> spin_type;
    bit<32> spin_msg_ct;
    bit<64> spin_end_time_milli;
    bit<32> spin_last_seq_num;
}

header market_open_message_t {
    bit<32> channel_seq_num;
    bit<64> market_open;
    bit<64> market_close;
}

header market_close_message_t {
    bit<32> channel_seq_num;
    bit<64> market_close_time_milli;
    bit<32> market_msg_ct;
}

header extended_trade_message_t {
    bit<32> channel_seq_num;
    bit<64> trade_id;
    bit<8> trade_action;
    bit<8> trade_flags;
    bit<32> security_id;
    bit<1> irregular;
    bit<7> reserved_7;
    bit<24> venue;
    bit<40> deprecated_utf_85;
    bit<64> trade_price;
    bit<64> trade_size;
    bit<64> trade_time_milli;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    start_of_spin_message_t start_of_spin_message;
    end_of_spin_message_t end_of_spin_message;
    market_open_message_t market_open_message;
    market_close_message_t market_close_message;
    extended_trade_message_t extended_trade_message;
}

parser LinkatsExtendedtradeParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w11: parse_start_of_spin_message;
            8w12: parse_end_of_spin_message;
            8w13: parse_market_open_message;
            8w14: parse_market_close_message;
            8w18: parse_extended_trade_message;
            default: accept;
        }
    }

    state parse_start_of_spin_message {
        packet.extract(hdr.start_of_spin_message);
        transition accept;
    }

    state parse_end_of_spin_message {
        packet.extract(hdr.end_of_spin_message);
        transition accept;
    }

    state parse_market_open_message {
        packet.extract(hdr.market_open_message);
        transition accept;
    }

    state parse_market_close_message {
        packet.extract(hdr.market_close_message);
        transition accept;
    }

    state parse_extended_trade_message {
        packet.extract(hdr.extended_trade_message);
        transition accept;
    }

}

control LinkatsExtendedtradeVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsExtendedtradeIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LinkatsExtendedtradeEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LinkatsExtendedtradeComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsExtendedtradeDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.start_of_spin_message);
        packet.emit(hdr.end_of_spin_message);
        packet.emit(hdr.market_open_message);
        packet.emit(hdr.market_close_message);
        packet.emit(hdr.extended_trade_message);
    }
}

V1Switch(
    LinkatsExtendedtradeParser(),
    LinkatsExtendedtradeVerifyChecksum(),
    LinkatsExtendedtradeIngress(),
    LinkatsExtendedtradeEgress(),
    LinkatsExtendedtradeComputeChecksum(),
    LinkatsExtendedtradeDeparser()
) main;
