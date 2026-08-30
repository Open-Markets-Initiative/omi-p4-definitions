// P4_16 (v1model) definition for: OtcMarkets LinkAts ReferenceData Link v4.10.4
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
// For full Omi information: https://github.com/Open-Markets-Initiative/Directory
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

header extended_security_message_t {
    bit<32> channel_seq_num;
    bit<80> symbol;
    bit<64> last_update_milli;
    bit<8> security_action;
    bit<32> otc_issuer_id;
    bit<200> security_desc;
    bit<200> short_name;
    bit<8> asset_class;
    bit<40> security_type;
    bit<24> primary_market;
    bit<32> security_id;
    bit<1> piggyback;
    bit<1> caveat_emptor_warning;
    bit<1> qualified_institutional_buyers_only;
    bit<1> unsolicited_only;
    bit<1> sponsored_status;
    bit<1> otc_link_ecn_eligible;
    bit<1> otc_link_messaging_disabled;
    bit<1> saturation_eligible;
    bit<1> investment_grade;
    bit<1> trading_flat;
    bit<1> callable;
    bit<5> reserved_5;
    bit<8> tier;
    bit<8> reporting_status;
    bit<8> disclosure_status;
    bit<8> security_status;
    bit<64> par_value;
    bit<64> coupon;
    bit<64> maturity_date_milli;
    bit<64> callable_date_milli;
    bit<64> adr_ratio;
    bit<120> adr_level;
    bit<8> security_detail_size;
    bit<8> issuer_size;
    bit<72> cusip;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    start_of_spin_message_t start_of_spin_message;
    end_of_spin_message_t end_of_spin_message;
    market_open_message_t market_open_message;
    market_close_message_t market_close_message;
    extended_security_message_t extended_security_message;
}

parser LinkatsReferencedataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w11: parse_start_of_spin_message;
            8w12: parse_end_of_spin_message;
            8w13: parse_market_open_message;
            8w14: parse_market_close_message;
            8w15: parse_extended_security_message;
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

    state parse_extended_security_message {
        packet.extract(hdr.extended_security_message);
        transition accept;
    }

}

control LinkatsReferencedataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsReferencedataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LinkatsReferencedataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LinkatsReferencedataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsReferencedataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.start_of_spin_message);
        packet.emit(hdr.end_of_spin_message);
        packet.emit(hdr.market_open_message);
        packet.emit(hdr.market_close_message);
        packet.emit(hdr.extended_security_message);
    }
}

V1Switch(
    LinkatsReferencedataParser(),
    LinkatsReferencedataVerifyChecksum(),
    LinkatsReferencedataIngress(),
    LinkatsReferencedataEgress(),
    LinkatsReferencedataComputeChecksum(),
    LinkatsReferencedataDeparser()
) main;
