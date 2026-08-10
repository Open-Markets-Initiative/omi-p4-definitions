// P4_16 (v1model) definition for: Coinbase CoinbaseDerivatives MarketDataApi Sbe v1.2
// 
// Protocol:
//   Organization: Coinbase
//   Protocol: Market Data Api
//   Encoding: Simple Binary Encoding
//   Version: 1.2
//   Date: 7/27/2020
//   Specification: FairX_UDP_MarketData_API_V1.2.pdf
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
    bit<64> sending_time;
    bit<64> seq_num;
    bit<16> channel_id;
    bit<8> packet_flags;
    bit<8> message_count;
    bit<32> snapshot_instrument_id;
    bit<16> frame_length;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header outright_instrument_definition_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<192> symbol;
    bit<64> product_code;
    bit<256> description;
    bit<64> price_increment;
    bit<64> cfi_code;
    bit<64> currency;
    bit<16> first_trading_session_date;
    bit<16> last_trading_session_date;
    bit<32> contract_size;
    bit<64> prior_settlement_price;
    bit<64> settlement_price;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
    bit<32> product_id;
    bit<8> product_group;
    bit<8> trading_status;
    bit<1> is_prior_settlement_theoretical;
    bit<15> reserved_15;
}

header spread_instrument_definition_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<192> symbol;
    bit<64> product_code;
    bit<256> description;
    bit<64> price_increment;
    bit<64> cfi_code;
    bit<64> currency;
    bit<16> first_trading_session_date;
    bit<16> last_trading_session_date;
    bit<32> contract_size;
    bit<64> prior_settlement_price;
    bit<64> settlement_price;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
    bit<32> product_id;
    bit<8> product_group;
    bit<8> trading_status;
    bit<32> leg_1_instrument_id;
    bit<32> leg_2_instrument_id;
    bit<8> spread_buy_convention;
    bit<1> is_prior_settlement_theoretical;
    bit<15> reserved_15;
}

header trading_status_update_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
    bit<8> trading_status;
}

header order_put_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> price;
    bit<32> quantity;
}

header order_delete_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> order_id;
}

header implied_order_update_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> best_price;
    bit<64> next_price;
    bit<32> best_qty;
    bit<32> next_qty;
}

header trade_summary_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> aggressor_order_id;
    bit<64> aggressor_receive_time;
    bit<64> vwap_price;
    bit<64> deepest_price;
    bit<32> quantity;
}

header trade_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> match_id;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<64> price;
    bit<32> quantity;
}

header trade_amend_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> match_id;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<64> old_price;
    bit<64> new_price;
}

header spread_trade_amend_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> match_id;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
    bit<64> old_price;
    bit<64> new_price;
    bit<64> old_leg_1_price;
    bit<64> new_leg_1_price;
    bit<64> old_leg_2_price;
    bit<64> new_leg_2_price;
}

header trade_bust_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> match_id;
    bit<64> buy_order_id;
    bit<64> sell_order_id;
}

header market_stat_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> price;
    bit<8> stat_type;
}

header trade_session_volume_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<64> vwap_price;
    bit<32> trade_volume;
}

header open_interest_message_t {
    bit<8> instrument_flags;
    bit<8> instrument_side;
    bit<32> instrument_id;
    bit<32> instr_seq_num;
    bit<16> trading_session_date;
    bit<16> reserved;
    bit<64> transact_time;
    bit<32> quantity;
}

header start_of_outright_instrument_snapshot_message_t {
    bit<16> snapshot_seq_num;
    bit<32> last_instr_seq_num;
    bit<192> symbol;
    bit<64> product_code;
    bit<256> description;
    bit<64> price_increment;
    bit<64> cfi_code;
    bit<64> currency;
    bit<32> product_id;
    bit<32> contract_size;
    bit<32> order_count;
    bit<16> first_trading_session_date;
    bit<16> last_trading_session_date;
    bit<16> trading_session_date;
    bit<8> product_group;
    bit<8> trading_status;
}

header start_of_spread_instrument_snapshot_message_t {
    bit<16> snapshot_seq_num;
    bit<32> last_instr_seq_num;
    bit<192> symbol;
    bit<64> product_code;
    bit<256> description;
    bit<64> price_increment;
    bit<64> cfi_code;
    bit<64> currency;
    bit<32> product_id;
    bit<32> contract_size;
    bit<32> order_count;
    bit<16> first_trading_session_date;
    bit<16> last_trading_session_date;
    bit<16> trading_session_date;
    bit<8> product_group;
    bit<8> trading_status;
    bit<32> leg_1_instrument_id;
    bit<32> leg_2_instrument_id;
    bit<8> spread_buy_convention;
}

header order_snapshot_message_t {
    bit<16> snapshot_seq_num;
    bit<32> quantity;
    bit<64> transact_time;
    bit<64> order_id;
    bit<64> price;
}

header end_of_snapshot_message_t {
    bit<16> snapshot_seq_num;
    bit<32> trade_volume;
    bit<64> indicative_open_price;
    bit<64> day_open_price;
    bit<64> close_price;
    bit<64> low_price;
    bit<64> high_price;
    bit<64> vwap_price_optional;
    bit<64> settlement_price;
    bit<64> last_trade_price;
    bit<64> last_trade_time;
    bit<64> best_bid_implied_price;
    bit<64> best_ask_implied_price;
    bit<64> next_bid_implied_price;
    bit<64> next_ask_implied_price;
    bit<64> limit_down_price;
    bit<64> limit_up_price;
    bit<32> last_trade_qty;
    bit<32> open_interest;
    bit<32> best_bid_implied_qty;
    bit<32> best_ask_implied_qty;
    bit<32> next_bid_implied_qty;
    bit<32> next_ask_implied_qty;
    bit<64> prior_settlement_price;
    bit<1> is_prior_settlement_theoretical;
    bit<15> reserved_15;
}

header retransmit_request_message_t {
    bit<64> begin_seq_num;
    bit<8> message_count;
}

header retransmit_reject_message_t {
    bit<64> retry_delay_nanos;
    bit<320> details;
    bit<8> reason;
}

struct metadata_t {
}

struct headers_t {
    message_header_t message_header;
    outright_instrument_definition_message_t outright_instrument_definition_message;
    spread_instrument_definition_message_t spread_instrument_definition_message;
    trading_status_update_message_t trading_status_update_message;
    order_put_message_t order_put_message;
    order_delete_message_t order_delete_message;
    implied_order_update_message_t implied_order_update_message;
    trade_summary_message_t trade_summary_message;
    trade_message_t trade_message;
    trade_amend_message_t trade_amend_message;
    spread_trade_amend_message_t spread_trade_amend_message;
    trade_bust_message_t trade_bust_message;
    market_stat_message_t market_stat_message;
    trade_session_volume_message_t trade_session_volume_message;
    open_interest_message_t open_interest_message;
    start_of_outright_instrument_snapshot_message_t start_of_outright_instrument_snapshot_message;
    start_of_spread_instrument_snapshot_message_t start_of_spread_instrument_snapshot_message;
    order_snapshot_message_t order_snapshot_message;
    end_of_snapshot_message_t end_of_snapshot_message;
    retransmit_request_message_t retransmit_request_message;
    retransmit_reject_message_t retransmit_reject_message;
}

parser CoinbasederivativesMarketdataapiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.template_id) {
            16w10: parse_outright_instrument_definition_message;
            16w11: parse_spread_instrument_definition_message;
            16w17: parse_trading_status_update_message;
            16w20: parse_order_put_message;
            16w21: parse_order_delete_message;
            16w22: parse_implied_order_update_message;
            16w33: parse_trade_summary_message;
            16w30: parse_trade_message;
            16w31: parse_trade_amend_message;
            16w34: parse_spread_trade_amend_message;
            16w32: parse_trade_bust_message;
            16w40: parse_market_stat_message;
            16w41: parse_trade_session_volume_message;
            16w42: parse_open_interest_message;
            16w110: parse_start_of_outright_instrument_snapshot_message;
            16w111: parse_start_of_spread_instrument_snapshot_message;
            16w120: parse_order_snapshot_message;
            16w122: parse_end_of_snapshot_message;
            16w200: parse_retransmit_request_message;
            16w202: parse_retransmit_reject_message;
            default: accept;
        }
    }

    state parse_outright_instrument_definition_message {
        packet.extract(hdr.outright_instrument_definition_message);
        transition accept;
    }

    state parse_spread_instrument_definition_message {
        packet.extract(hdr.spread_instrument_definition_message);
        transition accept;
    }

    state parse_trading_status_update_message {
        packet.extract(hdr.trading_status_update_message);
        transition accept;
    }

    state parse_order_put_message {
        packet.extract(hdr.order_put_message);
        transition accept;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message);
        transition accept;
    }

    state parse_implied_order_update_message {
        packet.extract(hdr.implied_order_update_message);
        transition accept;
    }

    state parse_trade_summary_message {
        packet.extract(hdr.trade_summary_message);
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        transition accept;
    }

    state parse_trade_amend_message {
        packet.extract(hdr.trade_amend_message);
        transition accept;
    }

    state parse_spread_trade_amend_message {
        packet.extract(hdr.spread_trade_amend_message);
        transition accept;
    }

    state parse_trade_bust_message {
        packet.extract(hdr.trade_bust_message);
        transition accept;
    }

    state parse_market_stat_message {
        packet.extract(hdr.market_stat_message);
        transition accept;
    }

    state parse_trade_session_volume_message {
        packet.extract(hdr.trade_session_volume_message);
        transition accept;
    }

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message);
        transition accept;
    }

    state parse_start_of_outright_instrument_snapshot_message {
        packet.extract(hdr.start_of_outright_instrument_snapshot_message);
        transition accept;
    }

    state parse_start_of_spread_instrument_snapshot_message {
        packet.extract(hdr.start_of_spread_instrument_snapshot_message);
        transition accept;
    }

    state parse_order_snapshot_message {
        packet.extract(hdr.order_snapshot_message);
        transition accept;
    }

    state parse_end_of_snapshot_message {
        packet.extract(hdr.end_of_snapshot_message);
        transition accept;
    }

    state parse_retransmit_request_message {
        packet.extract(hdr.retransmit_request_message);
        transition accept;
    }

    state parse_retransmit_reject_message {
        packet.extract(hdr.retransmit_reject_message);
        transition accept;
    }

}

control CoinbasederivativesMarketdataapiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CoinbasederivativesMarketdataapiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CoinbasederivativesMarketdataapiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CoinbasederivativesMarketdataapiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CoinbasederivativesMarketdataapiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.outright_instrument_definition_message);
        packet.emit(hdr.spread_instrument_definition_message);
        packet.emit(hdr.trading_status_update_message);
        packet.emit(hdr.order_put_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.implied_order_update_message);
        packet.emit(hdr.trade_summary_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.trade_amend_message);
        packet.emit(hdr.spread_trade_amend_message);
        packet.emit(hdr.trade_bust_message);
        packet.emit(hdr.market_stat_message);
        packet.emit(hdr.trade_session_volume_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.start_of_outright_instrument_snapshot_message);
        packet.emit(hdr.start_of_spread_instrument_snapshot_message);
        packet.emit(hdr.order_snapshot_message);
        packet.emit(hdr.end_of_snapshot_message);
        packet.emit(hdr.retransmit_request_message);
        packet.emit(hdr.retransmit_reject_message);
    }
}

V1Switch(
    CoinbasederivativesMarketdataapiParser(),
    CoinbasederivativesMarketdataapiVerifyChecksum(),
    CoinbasederivativesMarketdataapiIngress(),
    CoinbasederivativesMarketdataapiEgress(),
    CoinbasederivativesMarketdataapiComputeChecksum(),
    CoinbasederivativesMarketdataapiDeparser()
) main;
