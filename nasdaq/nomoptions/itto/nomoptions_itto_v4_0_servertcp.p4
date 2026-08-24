// P4_16 (v1model) definition for: Nasdaq NomOptions Itto Itch v4.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Itch To Trade Options
//   Encoding: Itch
//   Version: 4.0
//   Date: 01/09/2023
//   Specification: itto_spec40.pdf
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

header server_tcp_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> event_code;
}

header options_directory_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> option_id;
    bit<48> security_symbol;
    bit<8> expiration_year;
    bit<8> expiration_month;
    bit<8> expiration_date;
    bit<32> explicit_strike_price;
    bit<8> option_type;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> options_closing_type;
    bit<8> tradable;
    bit<8> mpv;
}

header trading_action_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> option_id;
    bit<8> current_trading_state;
}

header security_open_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> option_id;
    bit<8> open_state;
}

header add_order_message_short_message_form_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> market_side;
    bit<32> option_id;
    bit<16> price_short;
    bit<16> volume_short;
}

header add_order_message_long_form_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> market_side;
    bit<32> option_id;
    bit<32> price_long;
    bit<32> volume_long;
}

header add_quote_message_short_form_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> bid_reference_number;
    bit<64> ask_reference_number;
    bit<32> option_id;
    bit<16> bid_price_short;
    bit<16> bid_size_integer_2;
    bit<16> ask_price_short;
    bit<16> ask_size_integer_2;
}

header add_quote_message_long_form_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> bid_reference_number;
    bit<64> ask_reference_number;
    bit<32> option_id;
    bit<32> bid;
    bit<32> bid_size_integer_4;
    bit<32> ask;
    bit<32> ask_size_integer_4;
}

header single_side_executed_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> reference_number;
    bit<32> executed_contracts;
    bit<32> cross_number;
    bit<32> match_number;
}

header single_side_executed_with_price_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> reference_number;
    bit<32> cross_number;
    bit<32> match_number;
    bit<8> printable;
    bit<32> price_long;
    bit<32> volume_long;
}

header order_cancel_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<32> cancelled_contracts;
}

header single_side_replace_message_short_form_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> original_reference_number;
    bit<64> new_reference_number;
    bit<16> price_short;
    bit<16> volume_short;
}

header single_side_replace_message_long_form_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> original_reference_number;
    bit<64> new_reference_number;
    bit<32> price_long;
    bit<32> volume_long;
}

header single_side_delete_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> reference_number;
}

header single_side_change_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> reference_number;
    bit<8> change_reason;
    bit<32> price_long;
    bit<32> volume_long;
}

header quote_replace_message_short_form_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> original_bid_reference_number;
    bit<64> bid_reference_number;
    bit<64> original_ask_reference_number;
    bit<64> ask_reference_number;
    bit<16> bid_price_short;
    bit<16> bid_size_integer_2;
    bit<16> ask_price_short;
    bit<16> ask_size_integer_2;
}

header quote_replace_message_long_form_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> original_bid_reference_number;
    bit<64> bid_reference_number;
    bit<64> original_ask_reference_number;
    bit<64> ask_reference_number;
    bit<32> bid_price_long;
    bit<32> bid_size_integer_4;
    bit<32> ask_price_long;
    bit<32> ask_size_integer_4;
}

header quote_delete_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> bid_reference_number;
    bit<64> ask_reference_number;
}

header options_trade_messages_non_auction_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> buy_sell_indicator;
    bit<32> option_id;
    bit<32> cross_number;
    bit<32> match_number;
    bit<32> price_long;
    bit<32> volume_long;
}

header options_cross_trade_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> option_id;
    bit<32> cross_number;
    bit<32> match_number;
    bit<8> cross_type;
    bit<32> price_long;
    bit<32> volume_long;
}

header broken_trade_order_executed_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> cross_number;
    bit<32> match_number;
}

header noii_message_t {
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> paired_contracts;
    bit<8> imbalance_direction;
    bit<32> option_id;
    bit<32> imbalance_price;
    bit<32> imbalance_volume;
    bit<8> customer_firm_indicator;
    bit<24> reserved_3;
}

struct metadata_t {
}

struct headers_t {
    server_tcp_packet_header_t server_tcp_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    options_directory_message_t options_directory_message;
    trading_action_message_t trading_action_message;
    security_open_message_t security_open_message;
    add_order_message_short_message_form_t add_order_message_short_message_form;
    add_order_message_long_form_message_t add_order_message_long_form_message;
    add_quote_message_short_form_message_t add_quote_message_short_form_message;
    add_quote_message_long_form_message_t add_quote_message_long_form_message;
    single_side_executed_message_t single_side_executed_message;
    single_side_executed_with_price_message_t single_side_executed_with_price_message;
    order_cancel_message_t order_cancel_message;
    single_side_replace_message_short_form_t single_side_replace_message_short_form;
    single_side_replace_message_long_form_t single_side_replace_message_long_form;
    single_side_delete_message_t single_side_delete_message;
    single_side_change_message_t single_side_change_message;
    quote_replace_message_short_form_t quote_replace_message_short_form;
    quote_replace_message_long_form_t quote_replace_message_long_form;
    quote_delete_message_t quote_delete_message;
    options_trade_messages_non_auction_t options_trade_messages_non_auction;
    options_cross_trade_message_t options_cross_trade_message;
    broken_trade_order_executed_message_t broken_trade_order_executed_message;
    noii_message_t noii_message;
}

parser NomoptionsIttoServertcpParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_tcp_packet_header);
        transition select(hdr.server_tcp_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        transition accept;
    }

    state parse_login_accepted_packet {
        packet.extract(hdr.login_accepted_packet);
        transition accept;
    }

    state parse_login_rejected_packet {
        packet.extract(hdr.login_rejected_packet);
        transition accept;
    }

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x52: parse_options_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x4f: parse_security_open_message;
            8w0x61: parse_add_order_message_short_message_form;
            8w0x41: parse_add_order_message_long_form_message;
            8w0x6a: parse_add_quote_message_short_form_message;
            8w0x4a: parse_add_quote_message_long_form_message;
            8w0x45: parse_single_side_executed_message;
            8w0x43: parse_single_side_executed_with_price_message;
            8w0x58: parse_order_cancel_message;
            8w0x75: parse_single_side_replace_message_short_form;
            8w0x55: parse_single_side_replace_message_long_form;
            8w0x44: parse_single_side_delete_message;
            8w0x47: parse_single_side_change_message;
            8w0x6b: parse_quote_replace_message_short_form;
            8w0x4b: parse_quote_replace_message_long_form;
            8w0x59: parse_quote_delete_message;
            8w0x50: parse_options_trade_messages_non_auction;
            8w0x51: parse_options_cross_trade_message;
            8w0x42: parse_broken_trade_order_executed_message;
            8w0x49: parse_noii_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        transition accept;
    }

    state parse_options_directory_message {
        packet.extract(hdr.options_directory_message);
        transition accept;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message);
        transition accept;
    }

    state parse_security_open_message {
        packet.extract(hdr.security_open_message);
        transition accept;
    }

    state parse_add_order_message_short_message_form {
        packet.extract(hdr.add_order_message_short_message_form);
        transition accept;
    }

    state parse_add_order_message_long_form_message {
        packet.extract(hdr.add_order_message_long_form_message);
        transition accept;
    }

    state parse_add_quote_message_short_form_message {
        packet.extract(hdr.add_quote_message_short_form_message);
        transition accept;
    }

    state parse_add_quote_message_long_form_message {
        packet.extract(hdr.add_quote_message_long_form_message);
        transition accept;
    }

    state parse_single_side_executed_message {
        packet.extract(hdr.single_side_executed_message);
        transition accept;
    }

    state parse_single_side_executed_with_price_message {
        packet.extract(hdr.single_side_executed_with_price_message);
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        transition accept;
    }

    state parse_single_side_replace_message_short_form {
        packet.extract(hdr.single_side_replace_message_short_form);
        transition accept;
    }

    state parse_single_side_replace_message_long_form {
        packet.extract(hdr.single_side_replace_message_long_form);
        transition accept;
    }

    state parse_single_side_delete_message {
        packet.extract(hdr.single_side_delete_message);
        transition accept;
    }

    state parse_single_side_change_message {
        packet.extract(hdr.single_side_change_message);
        transition accept;
    }

    state parse_quote_replace_message_short_form {
        packet.extract(hdr.quote_replace_message_short_form);
        transition accept;
    }

    state parse_quote_replace_message_long_form {
        packet.extract(hdr.quote_replace_message_long_form);
        transition accept;
    }

    state parse_quote_delete_message {
        packet.extract(hdr.quote_delete_message);
        transition accept;
    }

    state parse_options_trade_messages_non_auction {
        packet.extract(hdr.options_trade_messages_non_auction);
        transition accept;
    }

    state parse_options_cross_trade_message {
        packet.extract(hdr.options_cross_trade_message);
        transition accept;
    }

    state parse_broken_trade_order_executed_message {
        packet.extract(hdr.broken_trade_order_executed_message);
        transition accept;
    }

    state parse_noii_message {
        packet.extract(hdr.noii_message);
        transition accept;
    }

}

control NomoptionsIttoServertcpVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsIttoServertcpIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NomoptionsIttoServertcpEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NomoptionsIttoServertcpComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NomoptionsIttoServertcpDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_tcp_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.options_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.security_open_message);
        packet.emit(hdr.add_order_message_short_message_form);
        packet.emit(hdr.add_order_message_long_form_message);
        packet.emit(hdr.add_quote_message_short_form_message);
        packet.emit(hdr.add_quote_message_long_form_message);
        packet.emit(hdr.single_side_executed_message);
        packet.emit(hdr.single_side_executed_with_price_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.single_side_replace_message_short_form);
        packet.emit(hdr.single_side_replace_message_long_form);
        packet.emit(hdr.single_side_delete_message);
        packet.emit(hdr.single_side_change_message);
        packet.emit(hdr.quote_replace_message_short_form);
        packet.emit(hdr.quote_replace_message_long_form);
        packet.emit(hdr.quote_delete_message);
        packet.emit(hdr.options_trade_messages_non_auction);
        packet.emit(hdr.options_cross_trade_message);
        packet.emit(hdr.broken_trade_order_executed_message);
        packet.emit(hdr.noii_message);
    }
}

V1Switch(
    NomoptionsIttoServertcpParser(),
    NomoptionsIttoServertcpVerifyChecksum(),
    NomoptionsIttoServertcpIngress(),
    NomoptionsIttoServertcpEgress(),
    NomoptionsIttoServertcpComputeChecksum(),
    NomoptionsIttoServertcpDeparser()
) main;
