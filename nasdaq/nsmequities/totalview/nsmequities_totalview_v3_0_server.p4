// P4_16 (v1model) definition for: Nasdaq NsmEquities TotalView Itch v3.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: TotalView Itch
//   Encoding: Itch
//   Version: 3.0
//   Date: 09/16/2008
//   Specification: Nasdaq TotalView ITCH (3.0).pdf
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
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<80> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> message_type;
}

header seconds_message_t {
    bit<40> second;
}

header milliseconds_message_t {
    bit<24> millisecond;
}

header system_event_message_t {
    bit<8> event_code;
}

header stock_directory_message_t {
    bit<48> stock_alphabetic_6;
    bit<8> market_category;
    bit<8> financial_status_indicator;
    bit<48> round_lot_size;
    bit<8> round_lots_only;
}

header stock_trading_action_message_t {
    bit<48> stock_alphanumeric_6;
    bit<8> trading_state;
    bit<8> reserved;
    bit<32> reason;
}

header market_participant_position_message_t {
    bit<32> mpid;
    bit<48> stock_alphanumeric_6;
    bit<8> primary_market_maker;
    bit<8> market_maker_mode;
    bit<8> market_participant_state;
}

header add_order_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<48> shares_numeric_6;
    bit<48> stock_alphanumeric_6;
    bit<80> price;
}

header add_order_with_mpid_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<48> shares_numeric_6;
    bit<48> stock_alphanumeric_6;
    bit<80> price;
    bit<32> attribution;
}

header order_executed_message_t {
    bit<72> order_reference_number;
    bit<48> executed_shares;
    bit<72> match_number;
}

header order_executed_with_price_message_t {
    bit<72> order_reference_number;
    bit<48> executed_shares;
    bit<72> match_number;
    bit<8> printable;
    bit<80> execution_price;
}

header order_cancel_message_t {
    bit<72> order_reference_number;
    bit<48> canceled_shares;
}

header order_delete_message_t {
    bit<72> order_reference_number;
}

header trade_message_t {
    bit<72> order_reference_number;
    bit<8> side;
    bit<48> shares_numeric_6;
    bit<48> stock_alphanumeric_6;
    bit<80> price;
    bit<72> match_number;
}

header cross_trade_message_t {
    bit<72> shares_numeric_9;
    bit<48> stock_alphanumeric_6;
    bit<80> cross_price;
    bit<72> match_number;
    bit<8> cross_type;
}

header broken_trade_message_t {
    bit<72> match_number;
}

header net_order_imbalance_indicator_message_t {
    bit<72> paired_shares;
    bit<72> imbalance_shares;
    bit<8> imbalance_direction;
    bit<48> stock_alphanumeric_6;
    bit<80> far_price;
    bit<80> near_price;
    bit<80> current_reference_price;
    bit<8> cross_type;
    bit<8> price_variation_indicator;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    seconds_message_t seconds_message;
    milliseconds_message_t milliseconds_message;
    system_event_message_t system_event_message;
    stock_directory_message_t stock_directory_message;
    stock_trading_action_message_t stock_trading_action_message;
    market_participant_position_message_t market_participant_position_message;
    add_order_message_t add_order_message;
    add_order_with_mpid_message_t add_order_with_mpid_message;
    order_executed_message_t order_executed_message;
    order_executed_with_price_message_t order_executed_with_price_message;
    order_cancel_message_t order_cancel_message;
    order_delete_message_t order_delete_message;
    trade_message_t trade_message;
    cross_trade_message_t cross_trade_message;
    broken_trade_message_t broken_trade_message;
    net_order_imbalance_indicator_message_t net_order_imbalance_indicator_message;
}

parser NsmequitiesTotalviewServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
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
        transition select(hdr.sequenced_data_packet.message_type) {
            8w0x54: parse_seconds_message;
            8w0x4d: parse_milliseconds_message;
            8w0x53: parse_system_event_message;
            8w0x52: parse_stock_directory_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x4c: parse_market_participant_position_message;
            8w0x41: parse_add_order_message;
            8w0x46: parse_add_order_with_mpid_message;
            8w0x45: parse_order_executed_message;
            8w0x43: parse_order_executed_with_price_message;
            8w0x58: parse_order_cancel_message;
            8w0x44: parse_order_delete_message;
            8w0x50: parse_trade_message;
            8w0x51: parse_cross_trade_message;
            8w0x42: parse_broken_trade_message;
            8w0x49: parse_net_order_imbalance_indicator_message;
            default: accept;
        }
    }

    state parse_seconds_message {
        packet.extract(hdr.seconds_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_milliseconds_message {
        packet.extract(hdr.milliseconds_message);
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

    state parse_stock_trading_action_message {
        packet.extract(hdr.stock_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_participant_position_message {
        packet.extract(hdr.market_participant_position_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_with_mpid_message {
        packet.extract(hdr.add_order_with_mpid_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_executed_message {
        packet.extract(hdr.order_executed_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_executed_with_price_message {
        packet.extract(hdr.order_executed_with_price_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_message {
        packet.extract(hdr.order_cancel_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_delete_message {
        packet.extract(hdr.order_delete_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_trade_message {
        packet.extract(hdr.trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_cross_trade_message {
        packet.extract(hdr.cross_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_broken_trade_message {
        packet.extract(hdr.broken_trade_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_net_order_imbalance_indicator_message {
        packet.extract(hdr.net_order_imbalance_indicator_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NsmequitiesTotalviewServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NsmequitiesTotalviewServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NsmequitiesTotalviewServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NsmequitiesTotalviewServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.seconds_message);
        packet.emit(hdr.milliseconds_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.market_participant_position_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.add_order_with_mpid_message);
        packet.emit(hdr.order_executed_message);
        packet.emit(hdr.order_executed_with_price_message);
        packet.emit(hdr.order_cancel_message);
        packet.emit(hdr.order_delete_message);
        packet.emit(hdr.trade_message);
        packet.emit(hdr.cross_trade_message);
        packet.emit(hdr.broken_trade_message);
        packet.emit(hdr.net_order_imbalance_indicator_message);
    }
}

V1Switch(
    NsmequitiesTotalviewServerParser(),
    NsmequitiesTotalviewServerVerifyChecksum(),
    NsmequitiesTotalviewServerIngress(),
    NsmequitiesTotalviewServerEgress(),
    NsmequitiesTotalviewServerComputeChecksum(),
    NsmequitiesTotalviewServerDeparser()
) main;
