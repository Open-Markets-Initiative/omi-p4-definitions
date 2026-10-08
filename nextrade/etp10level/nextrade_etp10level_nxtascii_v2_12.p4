// P4_16 (v1model) definition for: Nextrade Etp10Level NxtAscii v2.12
// 
// Protocol:
//   Organization: Nextrade
//   Protocol: Nextrade Etp Market Data 10 Level
//   Encoding: Nextrade Ascii Standard Message
//   Version: 2.12
//   Date: 08/13/2026
//   Specification: Unknown
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

header packet_header_t {
    bit<40> tr_code;
}

header polling_data_message_t {
    bit<32> current_time_1_minute_interval;
    bit<8> end_keyword;
}

header securities_quote_mm_lp_quotes_included_10_level_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<88> ask_level_1_price;
    bit<88> bid_level_1_price;
    bit<96> ask_level_1_volume;
    bit<96> bid_level_1_volume;
    bit<96> lp_ask_level_1_volume;
    bit<96> lp_bid_level_1_volume;
    bit<88> ask_level_2_price;
    bit<88> bid_level_2_price;
    bit<96> ask_level_2_volume;
    bit<96> bid_level_2_volume;
    bit<96> lp_ask_level_2_volume;
    bit<96> lp_bid_level_2_volume;
    bit<88> ask_level_3_price;
    bit<88> bid_level_3_price;
    bit<96> ask_level_3_volume;
    bit<96> bid_level_3_volume;
    bit<96> lp_ask_level_3_volume;
    bit<96> lp_bid_level_3_volume;
    bit<88> ask_level_4_price;
    bit<88> bid_level_4_price;
    bit<96> ask_level_4_volume;
    bit<96> bid_level_4_volume;
    bit<96> lp_ask_level_4_volume;
    bit<96> lp_bid_level_4_volume;
    bit<88> ask_level_5_price;
    bit<88> bid_level_5_price;
    bit<96> ask_level_5_volume;
    bit<96> bid_level_5_volume;
    bit<96> lp_ask_level_5_volume;
    bit<96> lp_bid_level_5_volume;
    bit<88> ask_level_6_price;
    bit<88> bid_level_6_price;
    bit<96> ask_level_6_volume;
    bit<96> bid_level_6_volume;
    bit<96> lp_ask_level_6_volume;
    bit<96> lp_bid_level_6_volume;
    bit<88> ask_level_7_price;
    bit<88> bid_level_7_price;
    bit<96> ask_level_7_volume;
    bit<96> bid_level_7_volume;
    bit<96> lp_ask_level_7_volume;
    bit<96> lp_bid_level_7_volume;
    bit<88> ask_level_8_price;
    bit<88> bid_level_8_price;
    bit<96> ask_level_8_volume;
    bit<96> bid_level_8_volume;
    bit<96> lp_ask_level_8_volume;
    bit<96> lp_bid_level_8_volume;
    bit<88> ask_level_9_price;
    bit<88> bid_level_9_price;
    bit<96> ask_level_9_volume;
    bit<96> bid_level_9_volume;
    bit<96> lp_ask_level_9_volume;
    bit<96> lp_bid_level_9_volume;
    bit<88> ask_level_10_price;
    bit<88> bid_level_10_price;
    bit<96> ask_level_10_volume;
    bit<96> bid_level_10_volume;
    bit<96> lp_ask_level_10_volume;
    bit<96> lp_bid_level_10_volume;
    bit<96> total_ask_volume;
    bit<96> total_bid_volume;
    bit<88> estimated_trading_price;
    bit<96> estimated_trading_volume;
    bit<88> mid_price;
    bit<96> total_mid_price_ask_volume_total_ask_volume_on_mid_price;
    bit<96> total_mid_price_bid_volume_total_bid_volume_on_mid_price;
    bit<8> end_keyword;
}

header securities_order_filled_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<8> price_change_against_previous_day;
    bit<88> a_price_change_against_the_previous_day;
    bit<88> trading_price;
    bit<80> trading_volume;
    bit<88> opening_price;
    bit<88> todays_high;
    bit<88> todays_low;
    bit<96> accumulated_trading_volume;
    bit<176> accumulated_trading_value;
    bit<8> final_ask_bid_type_code;
    bit<120> lp_holding_quantity;
    bit<88> the_best_ask;
    bit<88> the_best_bid;
    bit<8> end_keyword;
}

header market_operation_ts_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<16> session_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<24> board_event_id;
    bit<72> start_time_of_a_board_event;
    bit<40> board_event_group_code;
    bit<24> trading_halt_reason_code;
    bit<8> end_keyword;
}

header issue_closing_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<88> closing_price;
    bit<8> closing_price_type_code;
    bit<88> upper_limit_price_on_the_single_price_trade_in_the_off_hours_session;
    bit<88> lower_limit_price_on_the_single_price_trade_in_the_off_hours_session;
    bit<88> closing_price_weighted_stock_price_average;
    bit<88> closing_price_base_price_of_buy_in;
    bit<88> closing_price_upper_limit_of_buy_in;
    bit<88> closing_price_lower_limit_of_buy_in;
    bit<8> end_keyword;
}

header triggering_removing_vi_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> processing_time_of_trading_system;
    bit<72> the_time_ending_vi;
    bit<8> vi_status_code;
    bit<8> vi_type_code;
    bit<88> a_base_price_to_trigger_static_vi;
    bit<88> a_base_price_to_trigger_dynamic_vi;
    bit<88> vi_triggering_price;
    bit<104> disparate_ratio_to_trigger_static_vi;
    bit<104> disparate_ratio_to_trigger_dynamic_vi;
    bit<8> end_keyword;
}

header closing_price_trading_quote_message_t {
    bit<64> message_sequence_number;
    bit<16> board_id;
    bit<96> isin_code;
    bit<48> a_designated_number_for_an_issue_from_krx;
    bit<96> total_ask_volume;
    bit<96> total_bid_volume;
    bit<8> end_keyword;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    packet_header_t packet_header;
    polling_data_message_t polling_data_message;
    securities_quote_mm_lp_quotes_included_10_level_message_t securities_quote_mm_lp_quotes_included_10_level_message;
    securities_order_filled_message_t securities_order_filled_message;
    market_operation_ts_message_t market_operation_ts_message;
    issue_closing_message_t issue_closing_message;
    triggering_removing_vi_message_t triggering_removing_vi_message;
    closing_price_trading_quote_message_t closing_price_trading_quote_message;
}

parser NextradeEtp10levelParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.tr_code) {
            40w0x4932353030: parse_polling_data_message;
            40w0x4237353353: parse_securities_quote_mm_lp_quotes_included_10_level_message;
            40w0x4133353353: parse_securities_order_filled_message;
            40w0x4137353353: parse_market_operation_ts_message;
            40w0x4136353353: parse_issue_closing_message;
            40w0x5238353353: parse_triggering_removing_vi_message;
            40w0x4531353353: parse_closing_price_trading_quote_message;
            default: accept;
        }
    }

    state parse_polling_data_message {
        packet.extract(hdr.polling_data_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_securities_quote_mm_lp_quotes_included_10_level_message {
        packet.extract(hdr.securities_quote_mm_lp_quotes_included_10_level_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_securities_order_filled_message {
        packet.extract(hdr.securities_order_filled_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_operation_ts_message {
        packet.extract(hdr.market_operation_ts_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_issue_closing_message {
        packet.extract(hdr.issue_closing_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_triggering_removing_vi_message {
        packet.extract(hdr.triggering_removing_vi_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_closing_price_trading_quote_message {
        packet.extract(hdr.closing_price_trading_quote_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NextradeEtp10levelVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NextradeEtp10levelIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NextradeEtp10levelEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NextradeEtp10levelComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NextradeEtp10levelDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.polling_data_message);
        packet.emit(hdr.securities_quote_mm_lp_quotes_included_10_level_message);
        packet.emit(hdr.securities_order_filled_message);
        packet.emit(hdr.market_operation_ts_message);
        packet.emit(hdr.issue_closing_message);
        packet.emit(hdr.triggering_removing_vi_message);
        packet.emit(hdr.closing_price_trading_quote_message);
    }
}

V1Switch(
    NextradeEtp10levelParser(),
    NextradeEtp10levelVerifyChecksum(),
    NextradeEtp10levelIngress(),
    NextradeEtp10levelEgress(),
    NextradeEtp10levelComputeChecksum(),
    NextradeEtp10levelDeparser()
) main;
