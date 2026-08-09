// P4_16 (v1model) definition for: Nasdaq PhlxOptions DepthOfMarket Itch v1.5
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Depth Of Market
//   Encoding: Itch
//   Version: 1.5
//   Date: 09/30/2015
//   Specification: phlxdepth.pdf
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

header packet_header_t {
    bit<80> session;
    bit<64> sequence_number;
    bit<16> message_count;
}

header message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header seconds_message_t {
    bit<32> second;
}

header system_event_message_t {
    bit<32> nanoseconds;
    bit<8> event_code;
}

header base_reference_message_t {
    bit<32> nanoseconds;
    bit<64> base_reference_number;
}

header option_directory_message_t {
    bit<32> nanoseconds;
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
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> current_trading_state;
}

header security_open_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<8> open_state;
}

header add_order_message_short_form_t {
    bit<32> nanoseconds;
    bit<32> order_reference_number_delta;
    bit<8> market_side;
    bit<32> option_id;
    bit<16> short_price;
    bit<16> short_volume;
    bit<32> order_id;
}

header add_order_message_long_form_t {
    bit<32> nanoseconds;
    bit<32> order_reference_number_delta;
    bit<8> market_side;
    bit<32> option_id;
    bit<32> price;
    bit<32> volume;
    bit<32> order_id;
}

header add_quote_message_short_form_t {
    bit<32> nanoseconds;
    bit<32> bid_reference_number_delta;
    bit<32> ask_reference_number_delta;
    bit<32> option_id;
    bit<16> bid_price;
    bit<16> short_bid_size;
    bit<16> ask_price;
    bit<16> short_ask_size;
}

header add_quote_message_long_form_t {
    bit<32> nanoseconds;
    bit<32> bid_reference_number_delta;
    bit<32> ask_reference_number_delta;
    bit<32> option_id;
    bit<32> bid;
    bit<32> bid_size;
    bit<32> ask;
    bit<32> ask_size;
}

header single_side_executed_message_t {
    bit<32> nanoseconds;
    bit<32> reference_number_delta;
    bit<32> executed_contracts;
    bit<32> cross_number;
    bit<32> match_number;
}

header single_side_executed_with_price_message_t {
    bit<32> nanoseconds;
    bit<32> reference_number_delta;
    bit<32> cross_number;
    bit<32> match_number;
    bit<8> printable;
    bit<32> price;
    bit<32> volume;
}

header single_side_cancel_message_t {
    bit<32> nanoseconds;
    bit<32> reference_number_delta;
    bit<32> cancelled_contracts;
}

header single_side_replace_message_short_form_t {
    bit<32> nanoseconds;
    bit<32> original_reference_number_delta;
    bit<32> new_reference_number_delta;
    bit<16> short_price;
    bit<16> short_volume;
}

header single_side_replace_message_long_form_t {
    bit<32> nanoseconds;
    bit<32> original_reference_number_delta;
    bit<32> new_reference_number_delta;
    bit<32> price;
    bit<32> volume;
}

header order_replace_message_short_form_t {
    bit<32> nanoseconds;
    bit<32> original_reference_number_delta;
    bit<32> new_reference_number_delta;
    bit<16> short_price;
    bit<16> short_volume;
    bit<32> order_id;
}

header single_side_replace_long_form_message_t {
    bit<32> nanoseconds;
    bit<32> original_reference_number_delta;
    bit<32> new_reference_number_delta;
    bit<32> price;
    bit<32> volume;
    bit<32> order_id;
}

header single_side_delete_message_t {
    bit<32> nanoseconds;
    bit<32> reference_number_delta;
}

header single_side_update_message_t {
    bit<32> nanoseconds;
    bit<32> reference_number_delta;
    bit<8> change_reason;
    bit<32> price;
    bit<32> volume;
}

header quote_replace_short_form_message_t {
    bit<32> nanoseconds;
    bit<32> original_bid_reference_number_delta;
    bit<32> bid_reference_number_delta;
    bit<32> original_ask_reference_number_delta;
    bit<32> ask_reference_number_delta;
    bit<16> bid_price;
    bit<16> short_bid_size;
    bit<16> ask_price;
    bit<16> short_ask_size;
}

header quote_replace_long_form_message_t {
    bit<32> nanoseconds;
    bit<32> original_bid_reference_number_delta;
    bit<32> bid_reference_number_delta;
    bit<32> original_ask_reference_number_delta;
    bit<32> ask_reference_number_delta;
    bit<32> bid;
    bit<32> bid_size;
    bit<32> ask;
    bit<32> ask_size;
}

header quote_delete_message_t {
    bit<32> nanoseconds;
    bit<32> bid_reference_number_delta;
    bit<32> ask_reference_number_delta;
}

header block_delete_message_t {
    bit<32> nanoseconds;
    bit<16> number_of_reference_number_deltas;
    bit<32> cancelled_reference_number_delta;
}

header non_auction_options_trade_message_t {
    bit<32> nanoseconds;
    bit<8> trade_indicator;
    bit<32> option_id;
    bit<32> cross_number;
    bit<32> match_number;
    bit<32> price;
    bit<32> volume;
}

header options_cross_trade_message_t {
    bit<32> nanoseconds;
    bit<32> option_id;
    bit<32> cross_number;
    bit<32> match_number;
    bit<8> cross_type;
    bit<32> price;
    bit<32> volume;
}

header broken_trade_order_execution_message_t {
    bit<32> nanoseconds;
    bit<32> cross_number;
    bit<32> match_number;
}

header auction_notification_message_t {
    bit<32> nanoseconds;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> paired_contracts;
    bit<8> imbalance_direction;
    bit<32> option_id;
    bit<32> imbalance_price;
    bit<32> imbalance_volume;
    bit<8> customer_indicator;
    bit<24> reserved;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    message_t message[MAX_MESSAGES];
    seconds_message_t seconds_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    base_reference_message_t base_reference_message[MAX_MESSAGES];
    option_directory_message_t option_directory_message[MAX_MESSAGES];
    trading_action_message_t trading_action_message[MAX_MESSAGES];
    security_open_message_t security_open_message[MAX_MESSAGES];
    add_order_message_short_form_t add_order_message_short_form[MAX_MESSAGES];
    add_order_message_long_form_t add_order_message_long_form[MAX_MESSAGES];
    add_quote_message_short_form_t add_quote_message_short_form[MAX_MESSAGES];
    add_quote_message_long_form_t add_quote_message_long_form[MAX_MESSAGES];
    single_side_executed_message_t single_side_executed_message[MAX_MESSAGES];
    single_side_executed_with_price_message_t single_side_executed_with_price_message[MAX_MESSAGES];
    single_side_cancel_message_t single_side_cancel_message[MAX_MESSAGES];
    single_side_replace_message_short_form_t single_side_replace_message_short_form[MAX_MESSAGES];
    single_side_replace_message_long_form_t single_side_replace_message_long_form[MAX_MESSAGES];
    order_replace_message_short_form_t order_replace_message_short_form[MAX_MESSAGES];
    single_side_replace_long_form_message_t single_side_replace_long_form_message[MAX_MESSAGES];
    single_side_delete_message_t single_side_delete_message[MAX_MESSAGES];
    single_side_update_message_t single_side_update_message[MAX_MESSAGES];
    quote_replace_short_form_message_t quote_replace_short_form_message[MAX_MESSAGES];
    quote_replace_long_form_message_t quote_replace_long_form_message[MAX_MESSAGES];
    quote_delete_message_t quote_delete_message[MAX_MESSAGES];
    block_delete_message_t block_delete_message[MAX_MESSAGES];
    non_auction_options_trade_message_t non_auction_options_trade_message[MAX_MESSAGES];
    options_cross_trade_message_t options_cross_trade_message[MAX_MESSAGES];
    broken_trade_order_execution_message_t broken_trade_order_execution_message[MAX_MESSAGES];
    auction_notification_message_t auction_notification_message[MAX_MESSAGES];
}

parser PhlxoptionsDepthofmarketParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition parse_message;
    }

    state parse_message {
        packet.extract(hdr.message.next);
        transition select(hdr.message.last.message_type) {
            8w0x54: parse_seconds_message;
            8w0x53: parse_system_event_message;
            8w0x4c: parse_base_reference_message;
            8w0x52: parse_option_directory_message;
            8w0x48: parse_trading_action_message;
            8w0x4f: parse_security_open_message;
            8w0x61: parse_add_order_message_short_form;
            8w0x41: parse_add_order_message_long_form;
            8w0x6a: parse_add_quote_message_short_form;
            8w0x4a: parse_add_quote_message_long_form;
            8w0x45: parse_single_side_executed_message;
            8w0x43: parse_single_side_executed_with_price_message;
            8w0x58: parse_single_side_cancel_message;
            8w0x75: parse_single_side_replace_message_short_form;
            8w0x55: parse_single_side_replace_message_long_form;
            8w0x76: parse_order_replace_message_short_form;
            8w0x56: parse_single_side_replace_long_form_message;
            8w0x44: parse_single_side_delete_message;
            8w0x47: parse_single_side_update_message;
            8w0x6b: parse_quote_replace_short_form_message;
            8w0x4b: parse_quote_replace_long_form_message;
            8w0x59: parse_quote_delete_message;
            8w0x5a: parse_block_delete_message;
            8w0x50: parse_non_auction_options_trade_message;
            8w0x51: parse_options_cross_trade_message;
            8w0x42: parse_broken_trade_order_execution_message;
            8w0x49: parse_auction_notification_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message.next);
        transition parse_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        transition parse_message;
    }

    state parse_base_reference_message {
        packet.extract(hdr.base_reference_message.next);
        transition parse_message;
    }

    state parse_option_directory_message {
        packet.extract(hdr.option_directory_message.next);
        transition parse_message;
    }

    state parse_trading_action_message {
        packet.extract(hdr.trading_action_message.next);
        transition parse_message;
    }

    state parse_security_open_message {
        packet.extract(hdr.security_open_message.next);
        transition parse_message;
    }

    state parse_add_order_message_short_form {
        packet.extract(hdr.add_order_message_short_form.next);
        transition parse_message;
    }

    state parse_add_order_message_long_form {
        packet.extract(hdr.add_order_message_long_form.next);
        transition parse_message;
    }

    state parse_add_quote_message_short_form {
        packet.extract(hdr.add_quote_message_short_form.next);
        transition parse_message;
    }

    state parse_add_quote_message_long_form {
        packet.extract(hdr.add_quote_message_long_form.next);
        transition parse_message;
    }

    state parse_single_side_executed_message {
        packet.extract(hdr.single_side_executed_message.next);
        transition parse_message;
    }

    state parse_single_side_executed_with_price_message {
        packet.extract(hdr.single_side_executed_with_price_message.next);
        transition parse_message;
    }

    state parse_single_side_cancel_message {
        packet.extract(hdr.single_side_cancel_message.next);
        transition parse_message;
    }

    state parse_single_side_replace_message_short_form {
        packet.extract(hdr.single_side_replace_message_short_form.next);
        transition parse_message;
    }

    state parse_single_side_replace_message_long_form {
        packet.extract(hdr.single_side_replace_message_long_form.next);
        transition parse_message;
    }

    state parse_order_replace_message_short_form {
        packet.extract(hdr.order_replace_message_short_form.next);
        transition parse_message;
    }

    state parse_single_side_replace_long_form_message {
        packet.extract(hdr.single_side_replace_long_form_message.next);
        transition parse_message;
    }

    state parse_single_side_delete_message {
        packet.extract(hdr.single_side_delete_message.next);
        transition parse_message;
    }

    state parse_single_side_update_message {
        packet.extract(hdr.single_side_update_message.next);
        transition parse_message;
    }

    state parse_quote_replace_short_form_message {
        packet.extract(hdr.quote_replace_short_form_message.next);
        transition parse_message;
    }

    state parse_quote_replace_long_form_message {
        packet.extract(hdr.quote_replace_long_form_message.next);
        transition parse_message;
    }

    state parse_quote_delete_message {
        packet.extract(hdr.quote_delete_message.next);
        transition parse_message;
    }

    state parse_block_delete_message {
        packet.extract(hdr.block_delete_message.next);
        transition parse_message;
    }

    state parse_non_auction_options_trade_message {
        packet.extract(hdr.non_auction_options_trade_message.next);
        transition parse_message;
    }

    state parse_options_cross_trade_message {
        packet.extract(hdr.options_cross_trade_message.next);
        transition parse_message;
    }

    state parse_broken_trade_order_execution_message {
        packet.extract(hdr.broken_trade_order_execution_message.next);
        transition parse_message;
    }

    state parse_auction_notification_message {
        packet.extract(hdr.auction_notification_message.next);
        transition parse_message;
    }

}

control PhlxoptionsDepthofmarketVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsDepthofmarketIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control PhlxoptionsDepthofmarketEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsDepthofmarketComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsDepthofmarketDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.message);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.base_reference_message);
        packet.emit(hdr.option_directory_message);
        packet.emit(hdr.trading_action_message);
        packet.emit(hdr.security_open_message);
        packet.emit(hdr.add_order_message_short_form);
        packet.emit(hdr.add_order_message_long_form);
        packet.emit(hdr.add_quote_message_short_form);
        packet.emit(hdr.add_quote_message_long_form);
        packet.emit(hdr.single_side_executed_message);
        packet.emit(hdr.single_side_executed_with_price_message);
        packet.emit(hdr.single_side_cancel_message);
        packet.emit(hdr.single_side_replace_message_short_form);
        packet.emit(hdr.single_side_replace_message_long_form);
        packet.emit(hdr.order_replace_message_short_form);
        packet.emit(hdr.single_side_replace_long_form_message);
        packet.emit(hdr.single_side_delete_message);
        packet.emit(hdr.single_side_update_message);
        packet.emit(hdr.quote_replace_short_form_message);
        packet.emit(hdr.quote_replace_long_form_message);
        packet.emit(hdr.quote_delete_message);
        packet.emit(hdr.block_delete_message);
        packet.emit(hdr.non_auction_options_trade_message);
        packet.emit(hdr.options_cross_trade_message);
        packet.emit(hdr.broken_trade_order_execution_message);
        packet.emit(hdr.auction_notification_message);
    }
}

V1Switch(
    PhlxoptionsDepthofmarketParser(),
    PhlxoptionsDepthofmarketVerifyChecksum(),
    PhlxoptionsDepthofmarketIngress(),
    PhlxoptionsDepthofmarketEgress(),
    PhlxoptionsDepthofmarketComputeChecksum(),
    PhlxoptionsDepthofmarketDeparser()
) main;
