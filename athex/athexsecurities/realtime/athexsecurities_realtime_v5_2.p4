// P4_16 (v1model) definition for: Athex AthexSecurities RealTime Ids v5.2
// 
// Protocol:
//   Organization: Athens Exchange Group
//   Protocol: Athens Exchange Securities Market Real Time Channel
//   Encoding: Information Dissemination System
//   Version: 5.2
//   Date: 11/01/2019
//   Specification: ATHEX OASIS IDS Market Data Feed Specification (5.2).pdf
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
    bit<8> soh;
    bit<16> vendor_identifier;
    bit<8> message_category;
    bit<8> message_subcategory;
    bit<32> venue_id;
    bit<56> message_sequence_number;
    bit<160> publication_timestamp;
}

header control_message_t {
    bit<8> message_type;
}

header trade_message_t {
    bit<120> symbol;
    bit<8> board_id;
    bit<48> trade_number;
    bit<64> buy_order_number;
    bit<64> buy_order_date;
    bit<64> sell_order_number;
    bit<64> sell_order_date;
    bit<72> price;
    bit<136> volume;
    bit<136> total_volume;
    bit<8> trade_type;
    bit<8> trade_source;
    bit<8> buy_order_type;
    bit<8> sell_order_type;
    bit<1> ilqd;
    bit<1> size;
    bit<1> pric;
    bit<1> oilq;
    bit<1> nliq;
    bit<1> rfpt;
    bit<1> ilqd_2;
    bit<1> size_2;
    bit<1> pric_2;
    bit<1> oilq_2;
    bit<1> nliq_2;
    bit<1> rfpt_2;
    bit<112> notional_amount;
    bit<8> buy_algo_flag;
    bit<8> sell_algo_flag;
    bit<8> sdiv_flag;
    bit<8> dupl_flag;
    bit<160> time_stamp;
}

header quote_message_t {
    bit<120> symbol;
    bit<24> quote_levels;
}

header quote_message_quote_level_t {
    bit<72> bid_price;
    bit<136> bid_size;
    bit<56> bid_orders;
    bit<72> ask_price;
    bit<136> ask_size;
    bit<56> ask_orders;
}

header index_message_t {
    bit<120> symbol;
    bit<72> index_price;
}

header instrument_summary_message_t {
    bit<120> symbol;
    bit<72> opening_price;
    bit<72> high;
    bit<72> low;
    bit<72> last;
    bit<72> closing_price;
    bit<72> start_of_day_price;
    bit<136> total_volume;
    bit<136> total_value;
}

header cancelled_trade_message_t {
    bit<120> symbol;
    bit<8> board_id;
    bit<48> trade_number;
    bit<64> buy_order_number;
    bit<64> buy_order_date;
    bit<64> sell_order_number;
    bit<64> sell_order_date;
    bit<72> cancelled_trade_price;
    bit<136> cancelled_volume;
    bit<136> total_volume;
    bit<8> trade_type;
    bit<8> trade_source;
    bit<8> buy_order_type;
    bit<8> sell_order_type;
    bit<1> ilqd;
    bit<1> size;
    bit<1> pric;
    bit<1> oilq;
    bit<1> nliq;
    bit<1> rfpt;
    bit<1> ilqd_2;
    bit<1> size_2;
    bit<1> pric_2;
    bit<1> oilq_2;
    bit<1> nliq_2;
    bit<1> rfpt_2;
    bit<112> notional_amount;
    bit<8> buy_algo_flag;
    bit<8> sell_algo_flag;
    bit<8> sdiv_flag;
    bit<8> dupl_flag;
    bit<160> time_stamp;
}

header closing_price_message_t {
    bit<120> symbol;
    bit<72> closing;
    bit<64> open_interest;
}

header projected_auction_auction_open_projected_close_price_message_t {
    bit<120> symbol;
    bit<8> price_flag;
    bit<72> price;
    bit<136> volume;
    bit<160> time_stamp;
}

header high_low_limit_modification_message_t {
    bit<120> symbol;
    bit<72> ceiling_price;
    bit<72> floor_price;
    bit<72> start_of_day_price;
    bit<112> accrued_interest;
}

header instrument_state_message_t {
    bit<120> symbol;
    bit<8> phase_id;
    bit<8> instrument_status;
    bit<8> halt_suspend_reason;
    bit<160> time_stamp;
}

header market_status_message_t {
    bit<8> market_id;
    bit<8> market_status;
}

header order_message_t {
    bit<120> symbol;
    bit<8> board_id;
    bit<64> order_number;
    bit<64> order_entry_date;
    bit<16> order_status;
    bit<8> side;
    bit<136> volume;
    bit<136> matched_volume;
    bit<72> price;
    bit<8> original_price_type;
    bit<8> order_lifetime;
    bit<8> special_conditions;
    bit<136> condition_volume;
    bit<64> order_release_date;
    bit<96> order_release_time;
    bit<64> last_order_update_date;
    bit<8> order_type;
    bit<160> time_stamp;
}

header cancelled_order_message_t {
    bit<120> symbol;
    bit<8> board_id;
    bit<64> order_number;
    bit<64> order_entry_date;
    bit<8> side;
    bit<136> volume;
    bit<136> matched_volume;
    bit<72> price;
    bit<8> original_price_type;
    bit<8> order_lifetime;
    bit<8> special_conditions;
    bit<136> condition_volume;
    bit<8> order_type;
    bit<160> time_stamp;
}

header exchange_notifications_message_t {
    bit<576> notification_headline_in_english;
    bit<576> notification_headline_in_local;
    bit<40> text_size_in_english;
    bit<40> text_size_in_local;
}

header exchange_notifications_message_english_notification_text_t {
    varbit<2048> english_notification_text;
}

header exchange_notifications_message_local_notification_text_t {
    varbit<2048> local_notification_text;
}

struct metadata_t {
    bit<1> dispatched;
    bit<24> quote_message_quote_level_remaining;
}

struct headers_t {
    message_header_t message_header;
    control_message_t control_message;
    trade_message_t trade_message;
    quote_message_t quote_message;
    quote_message_quote_level_t quote_message_quote_level[MAX_MESSAGES];
    index_message_t index_message;
    instrument_summary_message_t instrument_summary_message;
    cancelled_trade_message_t cancelled_trade_message;
    closing_price_message_t closing_price_message;
    projected_auction_auction_open_projected_close_price_message_t projected_auction_auction_open_projected_close_price_message;
    high_low_limit_modification_message_t high_low_limit_modification_message;
    instrument_state_message_t instrument_state_message;
    market_status_message_t market_status_message;
    order_message_t order_message;
    cancelled_order_message_t cancelled_order_message;
    exchange_notifications_message_t exchange_notifications_message;
    exchange_notifications_message_english_notification_text_t exchange_notifications_message_english_notification_text;
    exchange_notifications_message_local_notification_text_t exchange_notifications_message_local_notification_text;
}

parser AthexsecuritiesRealtimeParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_category) {
            8w0x4b: parse_control_message;
            8w0x41: parse_trade_message;
            8w0x42: parse_quote_message;
            8w0x43: parse_index_message;
            8w0x47: parse_instrument_summary_message;
            8w0x49: parse_cancelled_trade_message;
            8w0x4c: parse_closing_price_message;
            8w0x4d: parse_projected_auction_auction_open_projected_close_price_message;
            8w0x4e: parse_high_low_limit_modification_message;
            8w0x4f: parse_instrument_state_message;
            8w0x50: parse_market_status_message;
            8w0x51: parse_order_message;
            8w0x52: parse_cancelled_order_message;
            8w0x53: parse_exchange_notifications_message;
            default: accept;
        }
    }

    state parse_control_message {
        packet.extract(hdr.control_message);
        meta.dispatched = 1;
        transition select(hdr.control_message.message_type) {
            8w0x41: parse_start_of_day_control_message;
            8w0x46: parse_administrative_message;
            8w0x48: parse_end_of_day_control_message;
            8w0x54: parse_line_verification_control_message;
            default: accept;
        }
    }

    state parse_start_of_day_control_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_administrative_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_day_control_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_line_verification_control_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_message {
        packet.extract(hdr.quote_message);
        meta.dispatched = 1;
        meta.quote_message_quote_level_remaining = hdr.quote_message.quote_levels;
        transition select(meta.quote_message_quote_level_remaining) {
            24w0: accept;
            default: parse_quote_message_quote_level;
        }
    }

    state parse_quote_message_quote_level {
        packet.extract(hdr.quote_message_quote_level.next);
        meta.quote_message_quote_level_remaining = meta.quote_message_quote_level_remaining - 1;
        transition select(meta.quote_message_quote_level_remaining) {
            24w0: accept;
            default: parse_quote_message_quote_level;
        }
    }

    state parse_index_message {
        packet.extract(hdr.index_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_summary_message {
        packet.extract(hdr.instrument_summary_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancelled_trade_message {
        packet.extract(hdr.cancelled_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_closing_price_message {
        packet.extract(hdr.closing_price_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_projected_auction_auction_open_projected_close_price_message {
        packet.extract(hdr.projected_auction_auction_open_projected_close_price_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_high_low_limit_modification_message {
        packet.extract(hdr.high_low_limit_modification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_instrument_state_message {
        packet.extract(hdr.instrument_state_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_status_message {
        packet.extract(hdr.market_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_message {
        packet.extract(hdr.order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancelled_order_message {
        packet.extract(hdr.cancelled_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_exchange_notifications_message {
        packet.extract(hdr.exchange_notifications_message);
        meta.dispatched = 1;
        packet.extract(hdr.exchange_notifications_message_english_notification_text, (bit<32>)hdr.exchange_notifications_message.text_size_in_english * 8);
        packet.extract(hdr.exchange_notifications_message_local_notification_text, (bit<32>)hdr.exchange_notifications_message.text_size_in_local * 8);
        transition accept;
    }

}

control AthexsecuritiesRealtimeVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AthexsecuritiesRealtimeIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control AthexsecuritiesRealtimeEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control AthexsecuritiesRealtimeComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control AthexsecuritiesRealtimeDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.control_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.quote_message);
        packet.emit(hdr.quote_message_quote_level);
        packet.emit(hdr.index_message);
        packet.emit(hdr.instrument_summary_message);
        packet.emit(hdr.cancelled_trade_message);
        packet.emit(hdr.closing_price_message);
        packet.emit(hdr.projected_auction_auction_open_projected_close_price_message);
        packet.emit(hdr.high_low_limit_modification_message);
        packet.emit(hdr.instrument_state_message);
        packet.emit(hdr.market_status_message);
        packet.emit(hdr.order_message);
        packet.emit(hdr.cancelled_order_message);
        packet.emit(hdr.exchange_notifications_message);
        packet.emit(hdr.exchange_notifications_message_english_notification_text);
        packet.emit(hdr.exchange_notifications_message_local_notification_text);
    }
}

V1Switch(
    AthexsecuritiesRealtimeParser(),
    AthexsecuritiesRealtimeVerifyChecksum(),
    AthexsecuritiesRealtimeIngress(),
    AthexsecuritiesRealtimeEgress(),
    AthexsecuritiesRealtimeComputeChecksum(),
    AthexsecuritiesRealtimeDeparser()
) main;
