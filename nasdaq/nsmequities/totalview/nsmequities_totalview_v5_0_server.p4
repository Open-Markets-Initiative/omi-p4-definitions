// P4_16 (v1model) definition for: Nasdaq NsmEquities TotalView Glimpse v5.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: TotalView Itch
//   Encoding: Glimpse
//   Version: 5.0
//   Date: 2/13/2026
//   Specification: NQGlimpse_Spec_2-13-26.pdf
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

header debug_packet_t {
    bit<8> text;
}

header login_accepted_packet_t {
    bit<80> session;
    bit<160> sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<8> sequenced_message_type;
}

header system_event_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<8> event_code;
}

header add_order_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
}

header add_order_mpid_attribution_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> order_reference_number;
    bit<8> buy_sell_indicator;
    bit<32> shares;
    bit<64> stock;
    bit<32> price;
    bit<32> attribution;
}

header stock_directory_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> market_category;
    bit<8> financial_status_indicator;
    bit<32> round_lot_size;
    bit<8> round_lots_only;
    bit<8> issue_classification;
    bit<16> issue_sub_type;
    bit<8> authenticity;
    bit<8> short_sale_threshold_indicator;
    bit<8> ipo_flag;
    bit<8> luld_reference_price_tier;
    bit<8> etp_flag;
    bit<32> etp_leverage_factor;
    bit<8> inverse_indicator;
}

header stock_trading_action_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> trading_state;
    bit<8> reserved_1;
    bit<32> reason;
}

header reg_sho_restriction_message_t {
    bit<16> locate_code;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> reg_sho_action;
}

header retail_interest_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> interest_flag;
}

header end_of_snapshot_message_t {
    bit<160> sequence_number;
}

header operational_halt_message_t {
    bit<16> stock_locate;
    bit<16> tracking_number;
    bit<48> timestamp;
    bit<64> stock;
    bit<8> market_code;
    bit<8> operational_halt_action;
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
    system_event_message_t system_event_message;
    add_order_message_t add_order_message;
    add_order_mpid_attribution_message_t add_order_mpid_attribution_message;
    stock_directory_message_t stock_directory_message;
    stock_trading_action_message_t stock_trading_action_message;
    reg_sho_restriction_message_t reg_sho_restriction_message;
    retail_interest_message_t retail_interest_message;
    end_of_snapshot_message_t end_of_snapshot_message;
    operational_halt_message_t operational_halt_message;
}

parser NsmequitiesTotalviewServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
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
        transition select(hdr.sequenced_data_packet.sequenced_message_type) {
            8w0x53: parse_system_event_message;
            8w0x41: parse_add_order_message;
            8w0x46: parse_add_order_mpid_attribution_message;
            8w0x52: parse_stock_directory_message;
            8w0x48: parse_stock_trading_action_message;
            8w0x59: parse_reg_sho_restriction_message;
            8w0x4e: parse_retail_interest_message;
            8w0x47: parse_end_of_snapshot_message;
            8w0x68: parse_operational_halt_message;
            default: accept;
        }
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_message {
        packet.extract(hdr.add_order_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_order_mpid_attribution_message {
        packet.extract(hdr.add_order_mpid_attribution_message);
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

    state parse_reg_sho_restriction_message {
        packet.extract(hdr.reg_sho_restriction_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retail_interest_message {
        packet.extract(hdr.retail_interest_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_snapshot_message {
        packet.extract(hdr.end_of_snapshot_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_operational_halt_message {
        packet.extract(hdr.operational_halt_message);
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
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.add_order_message);
        packet.emit(hdr.add_order_mpid_attribution_message);
        packet.emit(hdr.stock_directory_message);
        packet.emit(hdr.stock_trading_action_message);
        packet.emit(hdr.reg_sho_restriction_message);
        packet.emit(hdr.retail_interest_message);
        packet.emit(hdr.end_of_snapshot_message);
        packet.emit(hdr.operational_halt_message);
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
