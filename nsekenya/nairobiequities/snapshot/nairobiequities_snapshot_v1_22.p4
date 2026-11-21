// P4_16 (v1model) definition for: NseKenya NairobiEquities Snapshot Mitch v1.22
// 
// Protocol:
//   Organization: Nairobi Securities Exchange
//   Protocol: Nairobi Equities Snapshot
//   Encoding: Millennium Itch
//   Version: 1.22
//   Date: 11/24/2020
//   Specification: Equities-Market-Data-Feed-MITCH-UDP_v1.22.pdf
// 
// Byte order: little (P4 extracts in network/big-endian order)
// 
// Script:
//   Generator: 1.0.0.0
//   License: MIT No Attribution
//   Authors: Omi Developers
// 
// Copyright (c) 2026 Scaled Sources LLC.  https://www.scaledsources.com
// 
// The protocol compiler technologies used to produce this file are the subject of
// patents owned by Scaled Sources LLC.  Those patent rights are retained and are
// not transferred by this contribution:
//   https://patents.google.com/patent/US12101388B2/en
//   https://patents.google.com/patent/US20240419416A1/en
//   https://patents.google.com/patent/US20260368281A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header message_header_t {
    bit<16> length;
    bit<8> message_count;
    bit<8> market_data_group;
    bit<32> sequence_number;
}

header message_header_message_t {
    bit<16> message_length;
    bit<8> message_type;
}

header login_request_message_t {
    bit<48> username;
    bit<80> password;
}

header login_response_message_t {
    bit<8> login_status;
}

header snapshot_request_message_t {
    bit<32> sequence_number;
    bit<48> segment;
    bit<96> symbol;
    bit<1> all_or_none;
    bit<1> auction;
    bit<1> bulletin_board;
    bit<1> early_settlement;
    bit<1> odd_lot;
    bit<1> block_trade;
    bit<1> off_book;
    bit<1> regular;
    bit<8> snapshot_type;
    bit<64> recover_from_time;
    bit<32> request_id;
}

header snapshot_response_message_t {
    bit<32> sequence_number;
    bit<32> order_count;
    bit<8> snapshot_status;
    bit<8> snapshot_type;
    bit<32> request_id;
}

header snapshot_complete_message_t {
    bit<32> sequence_number;
    bit<48> segment;
    bit<96> symbol;
    bit<1> all_or_none;
    bit<1> auction;
    bit<1> bulletin_board;
    bit<1> early_settlement;
    bit<1> odd_lot;
    bit<1> block_trade;
    bit<1> off_book;
    bit<1> regular;
    bit<8> trading_status;
    bit<8> snapshot_type;
    bit<32> request_id;
}

header time_message_t {
    bit<32> seconds;
}

header system_event_message_t {
    bit<32> nanosecond;
    bit<8> event_code;
}

header symbol_directory_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<8> symbol_status;
    bit<96> identification_number;
    bit<48> segment;
    bit<64> expiration_date;
    bit<48> underlying;
    bit<32> strike_price;
    bit<8> option_type;
    bit<48> issuer;
    bit<64> issue_date;
    bit<32> coupon;
    bit<7> reserved_17;
    bit<1> inverse_order_book;
    bit<1> all_or_none;
    bit<1> auction;
    bit<1> bulletin_board;
    bit<1> early_settlement;
    bit<1> odd_lot;
    bit<1> block_trade;
    bit<1> off_book;
    bit<1> regular;
    bit<40> corporate_action;
    bit<64> issued_quantity;
}

header symbol_status_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<8> trading_status;
    bit<8> reserved_07;
    bit<32> halt_reason;
    bit<8> session_change_reason;
    bit<64> new_end_time;
    bit<8> sub_book;
}

header add_order_message_t {
    bit<32> nanosecond;
    bit<64> order_id;
    bit<8> side;
    bit<32> quantity;
    bit<96> symbol;
    bit<32> price;
    bit<2> reserved_67;
    bit<1> bulletin_board;
    bit<1> market_order;
    bit<4> reserved_03;
    bit<8> sub_book;
    bit<8> settlement_type;
    bit<32> interest_rate;
    bit<8> term;
}

header add_attributed_order_message_t {
    bit<32> nanosecond;
    bit<64> order_id;
    bit<8> side;
    bit<32> quantity;
    bit<96> symbol;
    bit<32> price;
    bit<48> attribution;
    bit<2> reserved_67;
    bit<1> bulletin_board;
    bit<5> reserved_04;
    bit<8> sub_book;
}

header order_deleted_message_t {
    bit<32> nanosecond;
    bit<64> order_id;
}

header order_modified_message_t {
    bit<32> nanosecond;
    bit<64> order_id;
    bit<32> new_quantity;
    bit<32> new_price;
    bit<7> reserved_17;
    bit<1> priority_flag;
    bit<8> settlement_type;
    bit<32> interest_rate;
    bit<8> term;
}

header order_book_clear_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<8> sub_book;
    bit<8> book_type;
}

header order_executed_message_t {
    bit<32> nanosecond;
    bit<64> order_id;
    bit<32> executed_quantity;
    bit<64> trade_id;
    bit<48> buy_firm;
    bit<48> sell_firm;
    bit<64> last_opt_px;
    bit<64> volatility;
    bit<64> underlying_reference_price;
}

header order_executed_with_price_size_message_t {
    bit<32> nanosecond;
    bit<64> order_id;
    bit<32> executed_quantity;
    bit<32> display_quantity;
    bit<64> trade_id;
    bit<8> printable;
    bit<32> price;
    bit<48> buy_firm;
    bit<48> sell_firm;
    bit<64> last_opt_px;
    bit<64> volatility;
    bit<64> underlying_reference_price;
}

header trade_message_t {
    bit<32> nanosecond;
    bit<32> executed_quantity;
    bit<96> symbol;
    bit<32> price;
    bit<64> trade_id;
    bit<8> sub_book;
    bit<48> buy_firm;
    bit<48> sell_firm;
    bit<64> last_opt_px;
    bit<64> volatility;
    bit<64> underlying_reference_price;
}

header auction_trade_message_t {
    bit<32> nanosecond;
    bit<32> executed_quantity;
    bit<96> symbol;
    bit<32> price;
    bit<64> trade_id;
    bit<8> auction_type;
    bit<64> last_opt_px;
    bit<64> volatility;
    bit<64> underlying_reference_price;
}

header off_book_trade_message_t {
    bit<32> nanosecond;
    bit<32> executed_quantity;
    bit<96> symbol;
    bit<32> price;
    bit<64> trade_id;
    bit<32> off_book_trade_type;
    bit<64> trade_time;
    bit<64> trade_date;
    bit<64> last_opt_px;
    bit<64> volatility;
    bit<64> underlying_reference_price;
}

header trade_break_message_t {
    bit<32> nanosecond;
    bit<64> trade_id;
    bit<8> trade_type;
}

header trade_correction_message_t {
    bit<32> nanosecond;
    bit<64> trade_id;
    bit<96> symbol;
    bit<32> price;
    bit<32> quantity;
    bit<8> sub_book;
    bit<48> buy_firm;
    bit<48> sell_firm;
}

header recovery_trade_message_t {
    bit<32> nanosecond;
    bit<32> executed_quantity;
    bit<96> symbol;
    bit<32> price;
    bit<64> trade_id;
    bit<8> auction_type;
    bit<32> off_book_trade_type;
    bit<64> trade_time;
    bit<64> trade_date;
    bit<8> action_type;
    bit<8> sub_book;
    bit<48> buy_firm;
    bit<48> sell_firm;
    bit<64> last_opt_px;
    bit<64> volatility;
    bit<64> underlying_reference_price;
    bit<8> auction_trade_type;
}

header auction_info_message_t {
    bit<32> nanosecond;
    bit<32> paired_quantity;
    bit<32> imbalance_quantity;
    bit<8> imbalance_direction;
    bit<96> symbol;
    bit<32> price;
    bit<8> auction_type;
}

header statistics_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<8> statistic_type;
    bit<32> price;
    bit<8> open_close_indicator;
    bit<8> sub_book;
}

header extended_statistics_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<32> high_price;
    bit<32> low_price;
    bit<32> vwap;
    bit<32> volume;
    bit<64> turnover;
    bit<32> trades;
    bit<64> reserved_8;
    bit<8> sub_book;
    bit<64> notional_exposure;
    bit<64> notional_delta_exposure;
    bit<64> daily_foreign_buy_value;
    bit<64> daily_foreign_sell_value;
    bit<64> market_capitalization;
}

header consolidated_statistics_message_t {
    bit<32> nanosecond;
    bit<8> statistics_type;
    bit<96> symbol;
    bit<32> volume;
    bit<64> turnover;
    bit<32> trades;
    bit<64> daily_foreign_buy_value;
    bit<64> daily_foreign_sell_value;
    bit<64> market_capitalization;
}

header index_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<32> index_value;
    bit<8> update_type;
    bit<32> perctg_diff_from_closing;
}

header aon_info_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<32> price;
    bit<8> side;
    bit<32> quantity;
    bit<8> aon_status;
    bit<64> date;
}

header news_message_t {
    bit<32> nanosecond;
    bit<64> time;
    bit<8> urgency;
    bit<800> headline;
    bit<2048> text_chunk0;
    bit<2048> text_chunk1;
    bit<1904> text_chunk2;
    bit<800> instruments;
    bit<800> underlyings;
}

header update_price_point_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<1> reserved_7;
    bit<1> default_auction;
    bit<1> bulletin_board;
    bit<1> early_settlement;
    bit<1> odd_lot;
    bit<1> block_trade;
    bit<1> reserved_11;
    bit<1> regular;
    bit<8> price_point_action;
    bit<8> side;
    bit<8> price_level;
    bit<32> price;
    bit<32> quantity;
    bit<32> splits;
    bit<3> reserved_57;
    bit<1> market_order;
    bit<4> reserved_03;
    bit<8> reserved_1;
}

header delete_price_point_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<1> reserved_7;
    bit<1> default_auction;
    bit<1> bulletin_board;
    bit<1> early_settlement;
    bit<1> odd_lot;
    bit<1> block_trade;
    bit<1> reserved_11;
    bit<1> regular;
    bit<8> side;
    bit<8> price_level;
    bit<8> reserved_1;
}

header top_of_book_message_t {
    bit<32> nanosecond;
    bit<96> symbol;
    bit<1> reserved_7;
    bit<1> default_auction;
    bit<1> bulletin_board;
    bit<1> early_settlement;
    bit<1> odd_lot;
    bit<1> block_trade;
    bit<1> reserved_11;
    bit<1> regular;
    bit<8> top_of_book_action;
    bit<8> side;
    bit<32> price;
    bit<32> quantity;
    bit<32> market_order_quantity;
    bit<16> reserved_2;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    message_header_t message_header;
    message_header_message_t message_header_message[MAX_MESSAGES];
    login_request_message_t login_request_message[MAX_MESSAGES];
    login_response_message_t login_response_message[MAX_MESSAGES];
    snapshot_request_message_t snapshot_request_message[MAX_MESSAGES];
    snapshot_response_message_t snapshot_response_message[MAX_MESSAGES];
    snapshot_complete_message_t snapshot_complete_message[MAX_MESSAGES];
    time_message_t time_message[MAX_MESSAGES];
    system_event_message_t system_event_message[MAX_MESSAGES];
    symbol_directory_message_t symbol_directory_message[MAX_MESSAGES];
    symbol_status_message_t symbol_status_message[MAX_MESSAGES];
    add_order_message_t add_order_message[MAX_MESSAGES];
    add_attributed_order_message_t add_attributed_order_message[MAX_MESSAGES];
    order_deleted_message_t order_deleted_message[MAX_MESSAGES];
    order_modified_message_t order_modified_message[MAX_MESSAGES];
    order_book_clear_message_t order_book_clear_message[MAX_MESSAGES];
    order_executed_message_t order_executed_message[MAX_MESSAGES];
    order_executed_with_price_size_message_t order_executed_with_price_size_message[MAX_MESSAGES];
    trade_message_t trade_message[MAX_MESSAGES];
    auction_trade_message_t auction_trade_message[MAX_MESSAGES];
    off_book_trade_message_t off_book_trade_message[MAX_MESSAGES];
    trade_break_message_t trade_break_message[MAX_MESSAGES];
    trade_correction_message_t trade_correction_message[MAX_MESSAGES];
    recovery_trade_message_t recovery_trade_message[MAX_MESSAGES];
    auction_info_message_t auction_info_message[MAX_MESSAGES];
    statistics_message_t statistics_message[MAX_MESSAGES];
    extended_statistics_message_t extended_statistics_message[MAX_MESSAGES];
    consolidated_statistics_message_t consolidated_statistics_message[MAX_MESSAGES];
    index_message_t index_message[MAX_MESSAGES];
    aon_info_message_t aon_info_message[MAX_MESSAGES];
    news_message_t news_message[MAX_MESSAGES];
    update_price_point_message_t update_price_point_message[MAX_MESSAGES];
    delete_price_point_message_t delete_price_point_message[MAX_MESSAGES];
    top_of_book_message_t top_of_book_message[MAX_MESSAGES];
}

parser NairobiequitiesSnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.message_header);
        transition select(hdr.message_header.message_count) {
            8w0: parse_message_header_message_empty;
            default: parse_message_header_message;
        }
    }

    state parse_message_header_message {
        packet.extract(hdr.message_header_message.next);
        transition select(hdr.message_header_message.last.message_type) {
            8w0x01: parse_login_request_message;
            8w0x02: parse_login_response_message;
            8w0x81: parse_snapshot_request_message;
            8w0x82: parse_snapshot_response_message;
            8w0x83: parse_snapshot_complete_message;
            8w0x05: parse_logout_request_message;
            8w0x54: parse_time_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_symbol_directory_message;
            8w0x48: parse_symbol_status_message;
            8w0x41: parse_add_order_message;
            8w0x46: parse_add_attributed_order_message;
            8w0x44: parse_order_deleted_message;
            8w0x55: parse_order_modified_message;
            8w0x79: parse_order_book_clear_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_size_message;
            8w0x50: parse_trade_message;
            8w0x51: parse_auction_trade_message;
            8w0x78: parse_off_book_trade_message;
            8w0x42: parse_trade_break_message;
            8w0x60: parse_trade_correction_message;
            8w0x76: parse_recovery_trade_message;
            8w0x49: parse_auction_info_message;
            8w0x77: parse_statistics_message;
            8w0x80: parse_extended_statistics_message;
            8w0x64: parse_consolidated_statistics_message;
            8w0x62: parse_index_message;
            8w0x65: parse_aon_info_message;
            8w0x75: parse_news_message;
            8w0x73: parse_update_price_point_message;
            8w0x72: parse_delete_price_point_message;
            8w0x71: parse_top_of_book_message;
            default: accept;
        }
    }

    state parse_login_request_message {
        packet.extract(hdr.login_request_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_login_response_message {
        packet.extract(hdr.login_response_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_snapshot_request_message {
        packet.extract(hdr.snapshot_request_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_snapshot_response_message {
        packet.extract(hdr.snapshot_response_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_snapshot_complete_message {
        packet.extract(hdr.snapshot_complete_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_logout_request_message {
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_time_message {
        packet.extract(hdr.time_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_symbol_directory_message {
        packet.extract(hdr.symbol_directory_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_symbol_status_message {
        packet.extract(hdr.symbol_status_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_add_attributed_order_message {
        packet.extract(hdr.add_attributed_order_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_order_deleted_message {
        packet.extract(hdr.order_deleted_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_order_modified_message {
        packet.extract(hdr.order_modified_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_order_book_clear_message {
        packet.extract(hdr.order_book_clear_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_order_executed_with_price_size_message {
        packet.extract(hdr.order_executed_with_price_size_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_auction_trade_message {
        packet.extract(hdr.auction_trade_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_off_book_trade_message {
        packet.extract(hdr.off_book_trade_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_trade_break_message {
        packet.extract(hdr.trade_break_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_trade_correction_message {
        packet.extract(hdr.trade_correction_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_recovery_trade_message {
        packet.extract(hdr.recovery_trade_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_auction_info_message {
        packet.extract(hdr.auction_info_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_statistics_message {
        packet.extract(hdr.statistics_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_extended_statistics_message {
        packet.extract(hdr.extended_statistics_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_consolidated_statistics_message {
        packet.extract(hdr.consolidated_statistics_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_index_message {
        packet.extract(hdr.index_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_aon_info_message {
        packet.extract(hdr.aon_info_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_news_message {
        packet.extract(hdr.news_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_update_price_point_message {
        packet.extract(hdr.update_price_point_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_delete_price_point_message {
        packet.extract(hdr.delete_price_point_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_top_of_book_message {
        packet.extract(hdr.top_of_book_message.next);
        meta.dispatched = 1;
        transition parse_message_header_message;
    }

    state parse_message_header_message_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control NairobiequitiesSnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NairobiequitiesSnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NairobiequitiesSnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NairobiequitiesSnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NairobiequitiesSnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.message_header);
        packet.emit(hdr.message_header_message);
        packet.emit(hdr.login_request_message);
        packet.emit(hdr.login_response_message);
        packet.emit(hdr.snapshot_request_message);
        packet.emit(hdr.snapshot_response_message);
        packet.emit(hdr.snapshot_complete_message);
        packet.emit(hdr.time_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.symbol_directory_message);
        packet.emit(hdr.symbol_status_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.add_attributed_order_message);
        packet.emit(hdr.order_deleted_message);
        packet.emit(hdr.order_modified_message);
        packet.emit(hdr.order_book_clear_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_size_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.auction_trade_message);
        packet.emit(hdr.off_book_trade_message);
        packet.emit(hdr.trade_break_message);
        packet.emit(hdr.trade_correction_message);
        packet.emit(hdr.recovery_trade_message);
        packet.emit(hdr.auction_info_message);
        packet.emit(hdr.statistics_message);
        packet.emit(hdr.extended_statistics_message);
        packet.emit(hdr.consolidated_statistics_message);
        packet.emit(hdr.index_message);
        packet.emit(hdr.aon_info_message);
        packet.emit(hdr.news_message);
        packet.emit(hdr.update_price_point_message);
        packet.emit(hdr.delete_price_point_message);
        packet.emit(hdr.top_of_book_message);
    }
}

V1Switch(
    NairobiequitiesSnapshotParser(),
    NairobiequitiesSnapshotVerifyChecksum(),
    NairobiequitiesSnapshotIngress(),
    NairobiequitiesSnapshotEgress(),
    NairobiequitiesSnapshotComputeChecksum(),
    NairobiequitiesSnapshotDeparser()
) main;
