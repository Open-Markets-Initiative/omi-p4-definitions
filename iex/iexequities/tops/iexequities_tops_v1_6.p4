// P4_16 (v1model) definition for: Iex IexEquities Tops Snap v1.6
// 
// Protocol:
//   Organization: Investors Exchange
//   Protocol: Tops
//   Encoding: Investors Exchange Snapshot Protocol
//   Version: 1.6
//   Date: 6/2/2026
//   Specification: IEX TOPS SNAP Specification.pdf
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
    bit<16> message_length;
    bit<8> message_type;
}

header snapshot_request_message_t {
    bit<320> authentication_token;
    bit<32> channel_id;
    bit<32> session_id;
    bit<64> minimum_sequence_number;
}

header error_response_message_t {
    bit<8> reject_reason_code;
}

header snapshot_start_message_t {
    bit<64> snapshot_length;
}

header snapshot_data_message_t {
    bit<8> iex_tp_header;
    bit<16> iex_tp_message_block_length;
    bit<16> iex_tp_message_length;
    bit<8> iex_tp_message_type;
}

header system_event_message_t {
    bit<8> system_event;
    bit<64> timestamp;
}

header security_directory_message_t {
    bit<5> unused_5;
    bit<1> etp;
    bit<1> when_issued;
    bit<1> test_security;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> round_lot_size;
    bit<64> adjusted_poc_price;
    bit<8> luld_tier;
}

header trading_status_message_t {
    bit<8> trading_status;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> reason;
}

header retail_liquidity_indicator_message_t {
    bit<8> retail_liquidity_indicator;
    bit<64> timestamp;
    bit<64> symbol;
}

header operational_halt_status_message_t {
    bit<8> operational_halt_status;
    bit<64> timestamp;
    bit<64> symbol;
}

header short_sale_price_test_status_message_t {
    bit<8> short_sale_price_test_status;
    bit<64> timestamp;
    bit<64> symbol;
    bit<8> detail;
}

header quote_update_message_t {
    bit<6> unused_6;
    bit<1> market_session;
    bit<1> symbol_availability;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> bid_size;
    bit<64> bid_price;
    bit<64> ask_price;
    bit<32> ask_size;
}

header trade_report_message_t {
    bit<3> unused_3;
    bit<1> singleprice_cross_trade;
    bit<1> trade_through_exempt;
    bit<1> odd_lot;
    bit<1> extended_hours;
    bit<1> intermarket_sweep;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> size;
    bit<64> price;
    bit<64> trade_id;
}

header official_price_message_t {
    bit<8> price_type;
    bit<64> timestamp;
    bit<64> symbol;
    bit<64> official_price;
}

header trade_break_message_t {
    bit<3> unused_3;
    bit<1> singleprice_cross_trade;
    bit<1> trade_through_exempt;
    bit<1> odd_lot;
    bit<1> extended_hours;
    bit<1> intermarket_sweep;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> size;
    bit<64> price;
    bit<64> trade_id;
}

header auction_information_message_t {
    bit<8> auction_type;
    bit<64> timestamp;
    bit<64> symbol;
    bit<32> paired_shares;
    bit<64> reference_price;
    bit<64> indicative_clearing_price;
    bit<32> imbalance_shares;
    bit<8> imbalance_side;
    bit<8> extension_number;
    bit<32> scheduled_auction_time;
    bit<64> auction_book_clearing_price;
    bit<64> collar_reference_price;
    bit<64> lower_auction_collar;
    bit<64> upper_auction_collar;
}

header snapshot_end_message_t {
    bit<64> snapshot_sequence_number;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    snapshot_request_message_t snapshot_request_message;
    error_response_message_t error_response_message;
    snapshot_start_message_t snapshot_start_message;
    snapshot_data_message_t snapshot_data_message;
    system_event_message_t system_event_message;
    security_directory_message_t security_directory_message;
    trading_status_message_t trading_status_message;
    retail_liquidity_indicator_message_t retail_liquidity_indicator_message;
    operational_halt_status_message_t operational_halt_status_message;
    short_sale_price_test_status_message_t short_sale_price_test_status_message;
    quote_update_message_t quote_update_message;
    trade_report_message_t trade_report_message;
    official_price_message_t official_price_message;
    trade_break_message_t trade_break_message;
    auction_information_message_t auction_information_message;
    snapshot_end_message_t snapshot_end_message;
}

parser IexequitiesTopsParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_type) {
            8w0x72: parse_snapshot_request_message;
            8w0x65: parse_error_response_message;
            8w0x73: parse_snapshot_start_message;
            8w0x64: parse_snapshot_data_message;
            8w0x78: parse_snapshot_end_message;
            default: accept;
        }
    }

    state parse_snapshot_request_message {
        packet.extract(hdr.snapshot_request_message);
        transition accept;
    }

    state parse_error_response_message {
        packet.extract(hdr.error_response_message);
        transition accept;
    }

    state parse_snapshot_start_message {
        packet.extract(hdr.snapshot_start_message);
        transition accept;
    }

    state parse_snapshot_data_message {
        packet.extract(hdr.snapshot_data_message);
        transition select(hdr.snapshot_data_message.iex_tp_message_type) {
            8w0x53: parse_system_event_message;
            8w0x44: parse_security_directory_message;
            8w0x48: parse_trading_status_message;
            8w0x49: parse_retail_liquidity_indicator_message;
            8w0x4f: parse_operational_halt_status_message;
            8w0x50: parse_short_sale_price_test_status_message;
            8w0x51: parse_quote_update_message;
            8w0x54: parse_trade_report_message;
            8w0x58: parse_official_price_message;
            8w0x42: parse_trade_break_message;
            8w0x41: parse_auction_information_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_security_directory_message {
        packet.extract(hdr.security_directory_message);
        transition accept;
    }

    state parse_trading_status_message {
        packet.extract(hdr.trading_status_message);
        transition accept;
    }

    state parse_retail_liquidity_indicator_message {
        packet.extract(hdr.retail_liquidity_indicator_message);
        transition accept;
    }

    state parse_operational_halt_status_message {
        packet.extract(hdr.operational_halt_status_message);
        transition accept;
    }

    state parse_short_sale_price_test_status_message {
        packet.extract(hdr.short_sale_price_test_status_message);
        transition accept;
    }

    state parse_quote_update_message {
        packet.extract(hdr.quote_update_message);
        transition accept;
    }

    state parse_trade_report_message {
        packet.extract(hdr.trade_report_message);
        transition accept;
    }

    state parse_official_price_message {
        packet.extract(hdr.official_price_message);
        transition accept;
    }

    state parse_trade_break_message {
        packet.extract(hdr.trade_break_message);
        transition accept;
    }

    state parse_auction_information_message {
        packet.extract(hdr.auction_information_message);
        transition accept;
    }

    state parse_snapshot_end_message {
        packet.extract(hdr.snapshot_end_message);
        transition accept;
    }

}

control IexequitiesTopsVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexequitiesTopsIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IexequitiesTopsEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IexequitiesTopsComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexequitiesTopsDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.snapshot_request_message);
        packet.emit(hdr.error_response_message);
        packet.emit(hdr.snapshot_start_message);
        packet.emit(hdr.snapshot_data_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.security_directory_message);
        packet.emit(hdr.trading_status_message);
        packet.emit(hdr.retail_liquidity_indicator_message);
        packet.emit(hdr.operational_halt_status_message);
        packet.emit(hdr.short_sale_price_test_status_message);
        packet.emit(hdr.quote_update_message);
        packet.emit(hdr.trade_report_message);
        packet.emit(hdr.official_price_message);
        packet.emit(hdr.trade_break_message);
        packet.emit(hdr.auction_information_message);
        packet.emit(hdr.snapshot_end_message);
    }
}

V1Switch(
    IexequitiesTopsParser(),
    IexequitiesTopsVerifyChecksum(),
    IexequitiesTopsIngress(),
    IexequitiesTopsEgress(),
    IexequitiesTopsComputeChecksum(),
    IexequitiesTopsDeparser()
) main;
