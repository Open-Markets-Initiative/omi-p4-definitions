// P4_16 (v1model) definition for: Iex IexOptions MarketData Sbe v1.03
// 
// Protocol:
//   Organization: Investors Exchange
//   Protocol: Market Data
//   Encoding: Simple Binary Encoding
//   Version: 1.03
//   Date: 6/1/2026
//   Specification: IEX Options Market Data Transport Protocol Specification
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
    bit<16> packet_length;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header underlying_ref_data_message_t {
    bit<64> time;
    bit<32> underlying_id;
    bit<128> underlying_symbol;
    bit<8> exchange_code;
    bit<8> mpv_group;
    bit<8> close_indicator;
}

header symbol_mapping_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<256> osi_symbol;
    bit<8> trading_ring;
    bit<8> closing_only_series;
    bit<32> underlying_id;
    bit<64> maturity_date;
    bit<8> option_type;
    bit<64> strike_price;
    bit<8> orp_enablement;
}

header instrument_clear_message_t {
    bit<64> time;
    bit<32> instrument_id;
}

header trading_status_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<8> trading_status;
}

header options_auction_summary_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<8> auction_summary_type;
    bit<64> price;
    bit<32> contracts;
}

header options_auction_width_update_message_t {
    bit<64> time;
    bit<32> underlying_id;
    bit<8> quote_relief_multiplier;
}

header liquidity_event_notification_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<32> event_id;
    bit<8> liquidity_event_type;
    bit<8> side;
    bit<64> price;
    bit<32> contracts;
    bit<8> capacity;
    bit<32> participant_id;
    bit<32> event_end_offset;
}

header liquidity_event_execution_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<32> event_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> contracts;
}

header liquidity_event_cancel_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<32> event_id;
}

header add_order_non_customer_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<8> side;
    bit<64> price;
    bit<32> contracts;
}

header add_order_customer_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<8> side;
    bit<64> price;
    bit<32> contracts;
    bit<8> customer_indicator;
}

header modify_order_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<64> price;
    bit<32> contracts;
    bit<8> mod_flag;
}

header delete_order_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> order_id;
}

header order_execution_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> order_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> executed_contracts;
    bit<32> remaining_contracts;
    bit<8> trade_condition;
}

header deep_trade_break_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> trade_id;
}

header quote_update_no_customer_interest_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<32> bid_size;
    bit<64> bid_price;
    bit<32> ask_size;
    bit<64> ask_price;
    bit<8> status_status_type;
}

header quote_update_customer_interest_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<32> bid_size;
    bit<32> bid_customer_size;
    bit<64> bid_price;
    bit<32> ask_size;
    bit<32> ask_customer_size;
    bit<64> ask_price;
    bit<8> status_status_type;
}

header trade_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> contracts;
    bit<8> trade_condition;
}

header trade_correction_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> original_trade_id;
    bit<64> trade_id;
    bit<64> price;
    bit<32> contracts;
    bit<8> trade_condition;
}

header tops_trade_break_message_t {
    bit<64> time;
    bit<32> instrument_id;
    bit<64> trade_id;
    bit<8> trade_condition;
}

header heartbeat_message_t {
    bit<32> channel_id;
    bit<64> sequence_number;
}

header sequenced_packet_message_t {
    bit<32> channel_id;
    bit<64> sequence_number;
    bit<8> block_length_uint_8;
    bit<8> num_in_group;
}

header session_shutdown_message_t {
    bit<32> channel_id;
    bit<64> sequence_number;
}

header retransmission_request_message_t {
    bit<64> begin_sequence;
    bit<64> end_sequence;
    bit<128> logon_id;
    bit<32> request_id;
    bit<32> channel_id;
    bit<8> feed;
}

header retransmission_response_message_t {
    bit<128> logon_id;
    bit<32> request_id;
    bit<32> channel_id;
    bit<8> feed;
    bit<8> status_retransmission_status_type;
}

header snapshot_header_message_t {
    bit<32> snapshot_id;
    bit<32> current_packet_number;
    bit<32> total_packet_count;
    bit<64> as_of_sequence_number;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    underlying_ref_data_message_t underlying_ref_data_message;
    symbol_mapping_message_t symbol_mapping_message;
    instrument_clear_message_t instrument_clear_message;
    trading_status_message_t trading_status_message;
    options_auction_summary_message_t options_auction_summary_message;
    options_auction_width_update_message_t options_auction_width_update_message;
    liquidity_event_notification_message_t liquidity_event_notification_message;
    liquidity_event_execution_message_t liquidity_event_execution_message;
    liquidity_event_cancel_message_t liquidity_event_cancel_message;
    add_order_non_customer_message_t add_order_non_customer_message;
    add_order_customer_message_t add_order_customer_message;
    modify_order_message_t modify_order_message;
    delete_order_message_t delete_order_message;
    order_execution_message_t order_execution_message;
    deep_trade_break_message_t deep_trade_break_message;
    quote_update_no_customer_interest_message_t quote_update_no_customer_interest_message;
    quote_update_customer_interest_message_t quote_update_customer_interest_message;
    trade_message_t trade_message;
    trade_correction_message_t trade_correction_message;
    tops_trade_break_message_t tops_trade_break_message;
    heartbeat_message_t heartbeat_message;
    sequenced_packet_message_t sequenced_packet_message;
    session_shutdown_message_t session_shutdown_message;
    retransmission_request_message_t retransmission_request_message;
    retransmission_response_message_t retransmission_response_message;
    snapshot_header_message_t snapshot_header_message;
}

parser IexoptionsMarketdataParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w1: parse_underlying_ref_data_message;
            16w2: parse_symbol_mapping_message;
            16w3: parse_instrument_clear_message;
            16w4: parse_trading_status_message;
            16w5: parse_options_auction_summary_message;
            16w6: parse_options_auction_width_update_message;
            16w7: parse_liquidity_event_notification_message;
            16w8: parse_liquidity_event_execution_message;
            16w9: parse_liquidity_event_cancel_message;
            16w100: parse_add_order_non_customer_message;
            16w101: parse_add_order_customer_message;
            16w102: parse_modify_order_message;
            16w103: parse_delete_order_message;
            16w104: parse_order_execution_message;
            16w105: parse_deep_trade_break_message;
            16w200: parse_quote_update_no_customer_interest_message;
            16w201: parse_quote_update_customer_interest_message;
            16w202: parse_trade_message;
            16w203: parse_trade_correction_message;
            16w204: parse_tops_trade_break_message;
            16w300: parse_heartbeat_message;
            16w301: parse_sequenced_packet_message;
            16w302: parse_session_shutdown_message;
            16w402: parse_retransmission_request_message;
            16w403: parse_retransmission_response_message;
            16w601: parse_snapshot_header_message;
            default: accept;
        }
    }

    state parse_underlying_ref_data_message {
        packet.extract(hdr.underlying_ref_data_message);
        transition accept;
    }

    state parse_symbol_mapping_message {
        packet.extract(hdr.symbol_mapping_message);
        transition accept;
    }

    state parse_instrument_clear_message {
        packet.extract(hdr.instrument_clear_message);
        transition accept;
    }

    state parse_trading_status_message {
        packet.extract(hdr.trading_status_message);
        transition accept;
    }

    state parse_options_auction_summary_message {
        packet.extract(hdr.options_auction_summary_message);
        transition accept;
    }

    state parse_options_auction_width_update_message {
        packet.extract(hdr.options_auction_width_update_message);
        transition accept;
    }

    state parse_liquidity_event_notification_message {
        packet.extract(hdr.liquidity_event_notification_message);
        transition accept;
    }

    state parse_liquidity_event_execution_message {
        packet.extract(hdr.liquidity_event_execution_message);
        transition accept;
    }

    state parse_liquidity_event_cancel_message {
        packet.extract(hdr.liquidity_event_cancel_message);
        transition accept;
    }

    state parse_add_order_non_customer_message {
        packet.extract(hdr.add_order_non_customer_message);
        transition accept;
    }

    state parse_add_order_customer_message {
        packet.extract(hdr.add_order_customer_message);
        transition accept;
    }

    state parse_modify_order_message {
        packet.extract(hdr.modify_order_message);
        transition accept;
    }

    state parse_delete_order_message {
        packet.extract(hdr.delete_order_message);
        transition accept;
    }

    state parse_order_execution_message {
        packet.extract(hdr.order_execution_message);
        transition accept;
    }

    state parse_deep_trade_break_message {
        packet.extract(hdr.deep_trade_break_message);
        transition accept;
    }

    state parse_quote_update_no_customer_interest_message {
        packet.extract(hdr.quote_update_no_customer_interest_message);
        transition accept;
    }

    state parse_quote_update_customer_interest_message {
        packet.extract(hdr.quote_update_customer_interest_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message);
        transition accept;
    }

    state parse_tops_trade_break_message {
        packet.extract(hdr.tops_trade_break_message);
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        transition accept;
    }

    state parse_sequenced_packet_message {
        packet.extract(hdr.sequenced_packet_message);
        transition accept;
    }

    state parse_session_shutdown_message {
        packet.extract(hdr.session_shutdown_message);
        transition accept;
    }

    state parse_retransmission_request_message {
        packet.extract(hdr.retransmission_request_message);
        transition accept;
    }

    state parse_retransmission_response_message {
        packet.extract(hdr.retransmission_response_message);
        transition accept;
    }

    state parse_snapshot_header_message {
        packet.extract(hdr.snapshot_header_message);
        transition accept;
    }

}

control IexoptionsMarketdataVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsMarketdataIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control IexoptionsMarketdataEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control IexoptionsMarketdataComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control IexoptionsMarketdataDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.underlying_ref_data_message);
        packet.emit(hdr.symbol_mapping_message);
        packet.emit(hdr.instrument_clear_message);
        packet.emit(hdr.trading_status_message);
        packet.emit(hdr.options_auction_summary_message);
        packet.emit(hdr.options_auction_width_update_message);
        packet.emit(hdr.liquidity_event_notification_message);
        packet.emit(hdr.liquidity_event_execution_message);
        packet.emit(hdr.liquidity_event_cancel_message);
        packet.emit(hdr.add_order_non_customer_message);
        packet.emit(hdr.add_order_customer_message);
        packet.emit(hdr.modify_order_message);
        packet.emit(hdr.delete_order_message);
        packet.emit(hdr.order_execution_message);
        packet.emit(hdr.deep_trade_break_message);
        packet.emit(hdr.quote_update_no_customer_interest_message);
        packet.emit(hdr.quote_update_customer_interest_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.tops_trade_break_message);
        packet.emit(hdr.heartbeat_message);
        packet.emit(hdr.sequenced_packet_message);
        packet.emit(hdr.session_shutdown_message);
        packet.emit(hdr.retransmission_request_message);
        packet.emit(hdr.retransmission_response_message);
        packet.emit(hdr.snapshot_header_message);
    }
}

V1Switch(
    IexoptionsMarketdataParser(),
    IexoptionsMarketdataVerifyChecksum(),
    IexoptionsMarketdataIngress(),
    IexoptionsMarketdataEgress(),
    IexoptionsMarketdataComputeChecksum(),
    IexoptionsMarketdataDeparser()
) main;
