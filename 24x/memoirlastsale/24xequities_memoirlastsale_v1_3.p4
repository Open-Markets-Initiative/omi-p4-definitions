// P4_16 (v1model) definition for: 24X 24XEquities MemoirLastSale Sbe v1.3
// 
// Protocol:
//   Organization: 24 National Exchange
//   Protocol: Member Order Information Record Last Sale
//   Encoding: Simple Binary Encoding
//   Version: 1.3
//   Date: 9/1/25
//   Specification: memoir-last-sale-feed-v1_3.pdf
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

header common_header_t {
    bit<8> message_type;
    bit<8> header_length;
    bit<64> session_id;
    bit<64> sequence_number;
}

header sequenced_message_t {
    bit<16> message_count;
    bit<16> message_length;
    bit<16> block_length;
    bit<8> template_id;
    bit<8> schema_id;
    bit<16> version;
}

header instrument_directory_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<48> symbol;
    bit<48> symbol_sfx;
    bit<32> round_lot;
    bit<8> is_test_symbol;
    bit<64> mpv;
}

header reg_sho_restriction_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<8> short_sale_restriction;
}

header security_trading_status_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<8> security_trading_status;
    bit<8> security_trading_status_reason;
}

header trading_session_status_message_t {
    bit<64> timestamp;
    bit<8> trading_session;
}

header trade_report_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> trade_id;
    bit<32> trade_qty;
    bit<64> trade_price;
    bit<8> sale_condition_1;
    bit<8> sale_condition_2;
    bit<8> sale_condition_3;
    bit<8> sale_condition_4;
}

header trade_cancel_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> trade_id;
    bit<32> trade_qty;
    bit<64> last_price;
    bit<8> sale_condition_1;
    bit<8> sale_condition_2;
    bit<8> sale_condition_3;
    bit<8> sale_condition_4;
}

header trade_correct_message_t {
    bit<64> timestamp;
    bit<16> security_id;
    bit<64> trade_id;
    bit<32> original_trade_qty;
    bit<64> original_trade_price;
    bit<8> original_sale_condition_1;
    bit<8> original_sale_condition_2;
    bit<8> original_sale_condition_3;
    bit<8> original_sale_condition_4;
    bit<32> corrected_trade_qty;
    bit<64> corrected_trade_price;
    bit<8> corrected_sale_condition_1;
    bit<8> corrected_sale_condition_2;
    bit<8> corrected_sale_condition_3;
    bit<8> corrected_sale_condition_4;
}

struct metadata_t {
}

struct headers_t {
    common_header_t common_header;
    sequenced_message_t sequenced_message;
    instrument_directory_message_t instrument_directory_message;
    reg_sho_restriction_message_t reg_sho_restriction_message;
    security_trading_status_message_t security_trading_status_message;
    trading_session_status_message_t trading_session_status_message;
    trade_report_message_t trade_report_message;
    trade_cancel_message_t trade_cancel_message;
    trade_correct_message_t trade_correct_message;
}

parser N24x24XequitiesMemoirlastsaleParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.common_header);
        transition select(hdr.common_header.message_type) {
            8w2: parse_sequenced_message;
            default: accept;
        }
    }

    state parse_sequenced_message {
        packet.extract(hdr.sequenced_message);
        transition select(hdr.sequenced_message.template_id) {
            8w1: parse_instrument_directory_message;
            8w2: parse_reg_sho_restriction_message;
            8w3: parse_security_trading_status_message;
            8w5: parse_trading_session_status_message;
            8w10: parse_trade_report_message;
            8w11: parse_trade_cancel_message;
            8w12: parse_trade_correct_message;
            default: accept;
        }
    }

    state parse_instrument_directory_message {
        packet.extract(hdr.instrument_directory_message);
        transition accept;
    }

    state parse_reg_sho_restriction_message {
        packet.extract(hdr.reg_sho_restriction_message);
        transition accept;
    }

    state parse_security_trading_status_message {
        packet.extract(hdr.security_trading_status_message);
        transition accept;
    }

    state parse_trading_session_status_message {
        packet.extract(hdr.trading_session_status_message);
        transition accept;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message);
        transition accept;
    }

    state parse_trade_cancel_message {
        packet.extract(hdr.trade_cancel_message);
        transition accept;
    }

    state parse_trade_correct_message {
        packet.extract(hdr.trade_correct_message);
        transition accept;
    }

}

control N24x24XequitiesMemoirlastsaleVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control N24x24XequitiesMemoirlastsaleIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control N24x24XequitiesMemoirlastsaleEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control N24x24XequitiesMemoirlastsaleComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control N24x24XequitiesMemoirlastsaleDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.common_header);
        packet.emit(hdr.sequenced_message);
        packet.emit(hdr.instrument_directory_message);
        packet.emit(hdr.reg_sho_restriction_message);
        packet.emit(hdr.security_trading_status_message);
        packet.emit(hdr.trading_session_status_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_cancel_message);
        packet.emit(hdr.trade_correct_message);
    }
}

V1Switch(
    N24x24XequitiesMemoirlastsaleParser(),
    N24x24XequitiesMemoirlastsaleVerifyChecksum(),
    N24x24XequitiesMemoirlastsaleIngress(),
    N24x24XequitiesMemoirlastsaleEgress(),
    N24x24XequitiesMemoirlastsaleComputeChecksum(),
    N24x24XequitiesMemoirlastsaleDeparser()
) main;
