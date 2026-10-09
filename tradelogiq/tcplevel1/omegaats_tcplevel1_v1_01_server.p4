// P4_16 (v1model) definition for: Tradelogiq TcpLevel1 Itch v1.01
// 
// Protocol:
//   Organization: Tradelogiq Markets Inc.
//   Protocol: Omega Tcp Level 1
//   Encoding: Itch
//   Version: 1.01
//   Date: 01/30/2022
//   Specification: TradelogiQ-Level-1-ITCH-5.0-Specification-v1.01.pdf
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

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> message_type;
}

header quote_message_t {
    bit<8> reserved_1;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<64> best_bid_price;
    bit<32> best_bid_size;
    bit<64> best_ask_price;
    bit<32> best_ask_size;
}

header trade_report_message_t {
    bit<40> conditions;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<32> trade_id;
    bit<64> trade_price;
    bit<32> trade_size;
    bit<16> buy_broker;
    bit<16> sell_broker;
}

header trade_bust_message_t {
    bit<8> reserved_1;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<32> trade_id;
}

header trade_correction_message_t {
    bit<8> reserved_1;
    bit<80> stock_symbol;
    bit<64> timestamp;
    bit<32> original_trade_id;
    bit<64> original_trade_price;
    bit<32> original_trade_size;
    bit<64> corrected_trade_price;
    bit<32> corrected_trade_size;
}

header system_event_message_t {
    bit<8> event_code;
    bit<16> reserved_2;
    bit<64> timestamp;
}

header stock_directory_message_t {
    bit<8> market;
    bit<80> stock;
    bit<64> timestamp;
    bit<32> board_lot_size;
    bit<16> instrument_id;
    bit<8> shortable;
    bit<8> dividend_indicator;
    bit<72> reserved_9;
    bit<24> currency;
}

header extended_stock_directory_message_t {
    bit<8> market;
    bit<80> stock;
    bit<64> timestamp;
    bit<32> board_lot_size;
    bit<16> instrument_id;
    bit<8> shortable;
    bit<8> frequency;
    bit<72> reserved_9;
    bit<24> currency;
    bit<8> security_type;
    bit<64> expiry_date;
    bit<160> description;
    bit<24> reserved_3;
}

header stock_status_message_t {
    bit<8> trading_state;
    bit<80> stock;
    bit<64> timestamp;
    bit<32> reason;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    quote_message_t quote_message;
    trade_report_message_t trade_report_message;
    trade_bust_message_t trade_bust_message;
    trade_correction_message_t trade_correction_message;
    system_event_message_t system_event_message;
    stock_directory_message_t stock_directory_message;
    extended_stock_directory_message_t extended_stock_directory_message;
    stock_status_message_t stock_status_message;
}

parser OmegaatsTcplevel1ServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x48: parse_server_heartbeat;
            8w0x53: parse_sequenced_data_packet;
            default: accept;
        }
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

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.message_type) {
            8w0x57: parse_quote_message;
            8w0x54: parse_trade_report_message;
            8w0x4e: parse_trade_bust_message;
            8w0x4d: parse_trade_correction_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x72: parse_extended_stock_directory_message;
            8w0x48: parse_stock_status_message;
            default: accept;
        }
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stock_directory_message {
        packet.extract(hdr.stock_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_extended_stock_directory_message {
        packet.extract(hdr.extended_stock_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_stock_status_message {
        packet.extract(hdr.stock_status_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control OmegaatsTcplevel1ServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OmegaatsTcplevel1ServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control OmegaatsTcplevel1ServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control OmegaatsTcplevel1ServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control OmegaatsTcplevel1ServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.trade_bust_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.extended_stock_directory_message);
        packet.emit(hdr.stock_status_message);
    }
}

V1Switch(
    OmegaatsTcplevel1ServerParser(),
    OmegaatsTcplevel1ServerVerifyChecksum(),
    OmegaatsTcplevel1ServerIngress(),
    OmegaatsTcplevel1ServerEgress(),
    OmegaatsTcplevel1ServerComputeChecksum(),
    OmegaatsTcplevel1ServerDeparser()
) main;
