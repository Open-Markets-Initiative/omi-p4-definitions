// P4_16 (v1model) definition for: Nasdaq NtxOptions Cti Itch v2.1
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Clearing Trade Interface
//   Encoding: Itch
//   Version: 2.1
//   Date: 01/23/2024
//   Specification: 0299-Q24_BX-Options-Clearing-Trade-Interface-V2.1.pdf
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
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> version;
    bit<8> event_code;
}

header options_directory_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> version;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<7> expiration_year;
    bit<4> expiration_month;
    bit<5> expiration_day;
    bit<32> strike_price;
    bit<8> option_kind;
    bit<8> source;
    bit<104> underlying_symbol;
    bit<8> option_closing_type;
    bit<8> tradable;
    bit<8> mpv;
    bit<8> closing_only;
    bit<32> contract_size;
}

header security_trading_action_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> version;
    bit<32> option_id;
    bit<40> security_symbol;
    bit<7> expiration_year;
    bit<4> expiration_month;
    bit<5> expiration_day;
    bit<32> strike_price;
    bit<8> option_kind;
    bit<8> current_trading_state;
}

header trade_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> version;
    bit<8> send_type;
    bit<32> option_id;
    bit<104> underlying_symbol;
    bit<40> security_symbol;
    bit<7> expiration_year;
    bit<4> expiration_month;
    bit<5> expiration_day;
    bit<32> strike_price;
    bit<8> option_kind;
    bit<1> penny_pilot;
    bit<1> make_take_program;
    bit<1> single_listed;
    bit<1> weekly_expiration;
    bit<1> monthly_expiration;
    bit<1> quarterly_expiration;
    bit<10> reserved_trade_flags;
    bit<8> transaction_type;
    bit<8> liquidity;
    bit<32> trade_id;
    bit<16> correction_number;
    bit<32> cross_id;
    bit<32> match_id;
    bit<32> auction_id;
    bit<8> auction_type;
    bit<32> ref_trade_id;
    bit<16> ref_correction_number;
    bit<32> ref_match_id;
    bit<8> execution_type;
    bit<8> execution_market;
    bit<8> trade_side;
    bit<64> trade_price;
    bit<32> trade_contracts;
    bit<8> side_changed;
    bit<32> strategy_id;
    bit<16> strategy_leg;
    bit<64> reserved_8;
    bit<32> occ_clearing_number;
    bit<32> give_up_occ_clearing_number;
    bit<32> exchange_clearing_number;
    bit<32> exchange_house;
    bit<8> exchange_suffix;
    bit<8> capacity;
    bit<40> multi_account;
    bit<32> broker;
    bit<32> second_broker;
    bit<8> origin_market;
    bit<256> account;
    bit<32> nscc;
    bit<40> mpid;
    bit<1> priority_market_maker;
    bit<15> reserved_clearing_flags;
    bit<32> executing_broker;
    bit<48> reserved_6;
    bit<32> contra_occ_clearing_number;
    bit<32> contra_give_up_occ_clearing_number;
    bit<32> contra_exchange_clearing_number;
    bit<32> contra_exchange_house;
    bit<8> contra_capacity;
    bit<32> contra_broker;
    bit<32> contra_second_broker;
    bit<32> contra_nscc;
    bit<40> contra_mpid;
    bit<64> second_reserved_8;
    bit<32> firm;
    bit<7> order_date_year;
    bit<4> order_date_month;
    bit<5> order_date_day;
    bit<240> order_id;
    bit<64> quote_id;
    bit<64> sqf_sweep_id;
    bit<8> open_close_indicator;
    bit<80> customer_strategy_leg;
    bit<8> short_sell;
    bit<8> principal_agent;
    bit<120> supplementary_id;
    bit<1> fbms_order;
    bit<1> directed_preferenced;
    bit<1> post_only_alo;
    bit<1> mkt_order;
    bit<1> ise_directed_order;
    bit<11> reserved_order_indicators;
    bit<8> origin_type;
    bit<32> order_size;
    bit<32> order_price;
    bit<8> tif;
    bit<64> third_reserved_8;
}

header cancel_trade_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> version;
    bit<8> send_type;
    bit<32> option_id;
    bit<104> underlying_symbol;
    bit<40> security_symbol;
    bit<7> expiration_year;
    bit<4> expiration_month;
    bit<5> expiration_day;
    bit<32> strike_price;
    bit<8> option_kind;
    bit<32> trade_id;
    bit<16> correction_number;
    bit<32> cross_id;
    bit<8> trade_side;
    bit<32> match_id;
}

header debug_packet_debug_text_t {
    varbit<2048> debug_text;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    system_event_message_t system_event_message;
    options_directory_message_t options_directory_message;
    security_trading_action_message_t security_trading_action_message;
    trade_message_t trade_message;
    cancel_trade_message_t cancel_trade_message;
    debug_packet_debug_text_t debug_packet_debug_text;
}

parser NtxoptionsCtiServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x48: parse_server_heartbeat;
            8w0x5a: parse_end_of_session;
            default: accept;
        }
    }

    state parse_debug_packet {
        meta.dispatched = 1;
        packet.extract(hdr.debug_packet_debug_text, (bit<32>)hdr.server_packet_header.packet_length * 8);
        transition accept;
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

    state parse_sequenced_data_packet {
        packet.extract(hdr.sequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x44: parse_options_directory_message;
            8w0x48: parse_security_trading_action_message;
            8w0x54: parse_trade_message;
            8w0x56: parse_cancel_trade_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_options_directory_message {
        packet.extract(hdr.options_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_security_trading_action_message {
        packet.extract(hdr.security_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cancel_trade_message {
        packet.extract(hdr.cancel_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session {
        meta.dispatched = 1;
        transition accept;
    }

}

control NtxoptionsCtiServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxoptionsCtiServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NtxoptionsCtiServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NtxoptionsCtiServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NtxoptionsCtiServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet_debug_text);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.options_directory_message);
        packet.emit(hdr.security_trading_action_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.cancel_trade_message);
    }
}

V1Switch(
    NtxoptionsCtiServerParser(),
    NtxoptionsCtiServerVerifyChecksum(),
    NtxoptionsCtiServerIngress(),
    NtxoptionsCtiServerEgress(),
    NtxoptionsCtiServerComputeChecksum(),
    NtxoptionsCtiServerDeparser()
) main;
