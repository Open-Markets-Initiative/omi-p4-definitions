// P4_16 (v1model) definition for: OtcMarkets LinkAts QuoteBookGlobalOtc Link v4.10.4
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

header security_message_t {
    bit<32> channel_seq_num;
    bit<80> symbol;
    bit<64> last_update_milli;
    bit<8> security_action;
    bit<8> asset_class;
    bit<32> security_id;
    bit<1> proprietary_quote_eligible;
    bit<1> caveat_emptor_warning;
    bit<1> qualified_institutional_buyers_only;
    bit<1> unsolicited_only;
    bit<1> bb_quoted;
    bit<1> otc_link_ecn_eligible;
    bit<1> otc_link_messaging_disabled;
    bit<1> saturation_eligible;
    bit<8> tier;
    bit<8> reporting_status;
    bit<8> security_status;
}

header quote_message_t {
    bit<32> channel_seq_num;
    bit<32> quote_id;
    bit<8> quote_action;
    bit<1> update_side;
    bit<1> state_;
    bit<1> ask_unsolicited;
    bit<1> ask_priced;
    bit<1> ask_bid_wanted;
    bit<1> bid_unsolicited;
    bit<1> bid_priced;
    bit<1> bid_ask_wanted;
    bit<32> security_id;
    bit<32> mpid;
    bit<64> ask_price;
    bit<32> ask_size;
    bit<8> ask_qap;
    bit<64> ask_time_milli;
    bit<64> bid_price;
    bit<32> bid_size;
    bit<8> bid_qap;
    bit<64> bid_time_milli;
    bit<16> quote_reference_id;
    bit<1> quote_saturated;
    bit<1> bid_auto_ex;
    bit<1> offer_auto_ex;
    bit<1> nms_conditional_quote;
    bit<4> reserved_4;
}

header quote_update_message_t {
    bit<32> channel_seq_num;
    bit<32> quote_id;
    bit<1> update_side;
    bit<1> state_;
    bit<1> ask_unsolicited;
    bit<1> ask_priced;
    bit<1> ask_bid_wanted;
    bit<1> bid_unsolicited;
    bit<1> bid_priced;
    bit<1> bid_ask_wanted;
    bit<64> price;
    bit<32> size;
    bit<8> qap;
    bit<64> quote_time_milli;
    bit<16> quote_reference_id;
    bit<1> quote_saturated;
    bit<1> bid_auto_ex;
    bit<1> offer_auto_ex;
    bit<1> nms_conditional_quote;
    bit<4> reserved_4;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    start_of_spin_message_t start_of_spin_message;
    end_of_spin_message_t end_of_spin_message;
    market_open_message_t market_open_message;
    market_close_message_t market_close_message;
    security_message_t security_message;
    quote_message_t quote_message;
    quote_update_message_t quote_update_message;
}

parser LinkatsQuotebookglobalotcParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w11: parse_start_of_spin_message;
            8w12: parse_end_of_spin_message;
            8w13: parse_market_open_message;
            8w14: parse_market_close_message;
            8w9: parse_security_message;
            8w1: parse_quote_message;
            8w2: parse_quote_update_message;
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

    state parse_security_message {
        packet.extract(hdr.security_message);
        transition accept;
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message);
        transition accept;
    }

    state parse_quote_update_message {
        packet.extract(hdr.quote_update_message);
        transition accept;
    }

}

control LinkatsQuotebookglobalotcVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsQuotebookglobalotcIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control LinkatsQuotebookglobalotcEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LinkatsQuotebookglobalotcComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LinkatsQuotebookglobalotcDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.start_of_spin_message);
        packet.emit(hdr.end_of_spin_message);
        packet.emit(hdr.market_open_message);
        packet.emit(hdr.market_close_message);
        packet.emit(hdr.security_message);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.quote_update_message);
    }
}

V1Switch(
    LinkatsQuotebookglobalotcParser(),
    LinkatsQuotebookglobalotcVerifyChecksum(),
    LinkatsQuotebookglobalotcIngress(),
    LinkatsQuotebookglobalotcEgress(),
    LinkatsQuotebookglobalotcComputeChecksum(),
    LinkatsQuotebookglobalotcDeparser()
) main;
