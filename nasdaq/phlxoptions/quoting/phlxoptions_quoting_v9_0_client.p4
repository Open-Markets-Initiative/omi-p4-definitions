// P4_16 (v1model) definition for: Nasdaq PhlxOptions Quoting Sqf v9.0
// 
// Protocol:
//   Organization: National Association of Securities Dealers Automated Quotations (Nasdaq)
//   Protocol: Specialized Quote Interface
//   Encoding: Specialized Quote Interface
//   Version: 9.0
//   Date: 09/22/2026
//   Specification: Options_ETH_SQF.pdf
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

header client_packet_header_t {
    bit<16> packet_length;
    bit<8> client_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_request_packet_t {
    bit<48> username;
    bit<80> password;
    bit<80> requested_session;
    bit<160> requested_sequence_number;
    bit<40> heartbeat_timeout;
}

header unsequenced_data_packet_t {
    bit<16> unsequenced_message_type;
}

header notification_subscription_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<192> subscription;
}

header add_complex_instrument_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<104> underlying_symbol;
    bit<8> number_of_legs;
}

header add_complex_instrument_request_message_complex_legs_t {
    bit<32> leg_instrument_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header mm_parameter_definition_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> instrument_type;
    bit<104> underlying;
    bit<16> interval;
    bit<16> percentage;
    bit<32> cum_qty;
    bit<32> delta;
    bit<32> vega;
    bit<256> reserved_32;
}

header active_qp_self_replenishment_set_limit_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<104> underlying_symbol;
    bit<32> set_value;
}

header rapid_fire_config_request_message_t {
    bit<32> badge;
    bit<104> underlying_symbol;
    bit<16> percentage;
    bit<16> interval;
    bit<32> cum_qty;
}

header simple_quote_block_short_form_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<16> quote_count;
}

header simple_quote_block_short_form_message_simple_quotes_t {
    bit<32> instrument_id;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<8> reentry_indicator;
}

header simple_quote_block_short_form_detailed_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<16> quote_count;
}

header simple_quote_block_short_form_detailed_message_simple_quotes_t {
    bit<32> instrument_id;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<8> reentry_indicator;
}

header simple_quote_block_long_form_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<16> quote_count;
}

header simple_quote_block_long_form_message_simple_quotes_long_form_t {
    bit<64> quote_id;
    bit<32> instrument_id;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<8> reentry_indicator;
}

header simple_quote_block_long_form_detailed_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<16> quote_count;
}

header simple_quote_block_long_form_detailed_message_simple_quotes_long_form_t {
    bit<64> quote_id;
    bit<32> instrument_id;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<8> reentry_indicator;
}

header complex_quote_block_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<16> quote_count;
}

header complex_quote_block_message_complex_quotes_t {
    bit<64> quote_id;
    bit<32> instrument_id;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<8> reentry_indicator;
    bit<8> stock_leg_short_sale;
    bit<32> reserved_4;
}

header complex_quote_block_detailed_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<16> quote_count;
}

header complex_quote_block_detailed_message_complex_quotes_t {
    bit<64> quote_id;
    bit<32> instrument_id;
    bit<32> bid_price;
    bit<32> bid_size;
    bit<32> ask_price;
    bit<32> ask_size;
    bit<8> reentry_indicator;
    bit<8> stock_leg_short_sale;
    bit<32> reserved_4;
}

header underlying_purge_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<104> underlying_symbol;
    bit<8> instrument_type;
}

header market_reentry_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<104> underlying_symbol;
    bit<8> instrument_type;
}

header active_qp_self_replenishment_request_reentry_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<104> underlying_symbol;
    bit<32> replenishment_value;
}

header simple_msar_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<8> msar_type;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<32> contracts;
}

header complex_msar_request_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<8> msar_type;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<8> debit_credit;
    bit<32> contracts;
    bit<8> price_protection;
    bit<32> reserved_4;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> add_complex_instrument_request_message_complex_legs_remaining;
    bit<16> simple_quote_block_short_form_message_simple_quotes_remaining;
    bit<16> simple_quote_block_short_form_detailed_message_simple_quotes_remaining;
    bit<16> simple_quote_block_long_form_message_simple_quotes_long_form_remaining;
    bit<16> simple_quote_block_long_form_detailed_message_simple_quotes_long_form_remaining;
    bit<16> complex_quote_block_message_complex_quotes_remaining;
    bit<16> complex_quote_block_detailed_message_complex_quotes_remaining;
}

struct headers_t {
    client_packet_header_t client_packet_header;
    debug_packet_t debug_packet;
    login_request_packet_t login_request_packet;
    unsequenced_data_packet_t unsequenced_data_packet;
    notification_subscription_request_message_t notification_subscription_request_message;
    add_complex_instrument_request_message_t add_complex_instrument_request_message;
    add_complex_instrument_request_message_complex_legs_t add_complex_instrument_request_message_complex_legs[MAX_MESSAGES];
    mm_parameter_definition_request_message_t mm_parameter_definition_request_message;
    active_qp_self_replenishment_set_limit_message_t active_qp_self_replenishment_set_limit_message;
    rapid_fire_config_request_message_t rapid_fire_config_request_message;
    simple_quote_block_short_form_message_t simple_quote_block_short_form_message;
    simple_quote_block_short_form_message_simple_quotes_t simple_quote_block_short_form_message_simple_quotes[MAX_MESSAGES];
    simple_quote_block_short_form_detailed_message_t simple_quote_block_short_form_detailed_message;
    simple_quote_block_short_form_detailed_message_simple_quotes_t simple_quote_block_short_form_detailed_message_simple_quotes[MAX_MESSAGES];
    simple_quote_block_long_form_message_t simple_quote_block_long_form_message;
    simple_quote_block_long_form_message_simple_quotes_long_form_t simple_quote_block_long_form_message_simple_quotes_long_form[MAX_MESSAGES];
    simple_quote_block_long_form_detailed_message_t simple_quote_block_long_form_detailed_message;
    simple_quote_block_long_form_detailed_message_simple_quotes_long_form_t simple_quote_block_long_form_detailed_message_simple_quotes_long_form[MAX_MESSAGES];
    complex_quote_block_message_t complex_quote_block_message;
    complex_quote_block_message_complex_quotes_t complex_quote_block_message_complex_quotes[MAX_MESSAGES];
    complex_quote_block_detailed_message_t complex_quote_block_detailed_message;
    complex_quote_block_detailed_message_complex_quotes_t complex_quote_block_detailed_message_complex_quotes[MAX_MESSAGES];
    underlying_purge_request_message_t underlying_purge_request_message;
    market_reentry_request_message_t market_reentry_request_message;
    active_qp_self_replenishment_request_reentry_message_t active_qp_self_replenishment_request_reentry_message;
    simple_msar_request_message_t simple_msar_request_message;
    complex_msar_request_message_t complex_msar_request_message;
}

parser PhlxoptionsQuotingClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.client_packet_header);
        transition select(hdr.client_packet_header.client_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x4c: parse_login_request_packet;
            8w0x55: parse_unsequenced_data_packet;
            8w0x52: parse_client_heartbeat_packet;
            8w0x4f: parse_logout_request_packet;
            default: accept;
        }
    }

    state parse_debug_packet {
        packet.extract(hdr.debug_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_login_request_packet {
        packet.extract(hdr.login_request_packet);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsequenced_data_packet {
        packet.extract(hdr.unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.unsequenced_data_packet.unsequenced_message_type) {
            16w0x4142: parse_notification_subscription_request_message;
            16w0x4143: parse_add_complex_instrument_request_message;
            16w0x4145: parse_mm_parameter_definition_request_message;
            16w0x4147: parse_active_qp_self_replenishment_set_limit_message;
            16w0x4146: parse_rapid_fire_config_request_message;
            16w0x5141: parse_simple_quote_block_short_form_message;
            16w0x5161: parse_simple_quote_block_short_form_detailed_message;
            16w0x514d: parse_simple_quote_block_long_form_message;
            16w0x516d: parse_simple_quote_block_long_form_detailed_message;
            16w0x5144: parse_complex_quote_block_message;
            16w0x5164: parse_complex_quote_block_detailed_message;
            16w0x5075: parse_underlying_purge_request_message;
            16w0x5255: parse_market_reentry_request_message;
            16w0x5247: parse_active_qp_self_replenishment_request_reentry_message;
            16w0x5342: parse_simple_msar_request_message;
            16w0x5358: parse_complex_msar_request_message;
            default: accept;
        }
    }

    state parse_notification_subscription_request_message {
        packet.extract(hdr.notification_subscription_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_complex_instrument_request_message {
        packet.extract(hdr.add_complex_instrument_request_message);
        meta.dispatched = 1;
        meta.add_complex_instrument_request_message_complex_legs_remaining = hdr.add_complex_instrument_request_message.number_of_legs;
        transition select(meta.add_complex_instrument_request_message_complex_legs_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_request_message_complex_legs;
        }
    }

    state parse_add_complex_instrument_request_message_complex_legs {
        packet.extract(hdr.add_complex_instrument_request_message_complex_legs.next);
        meta.add_complex_instrument_request_message_complex_legs_remaining = meta.add_complex_instrument_request_message_complex_legs_remaining - 1;
        transition select(meta.add_complex_instrument_request_message_complex_legs_remaining) {
            8w0: accept;
            default: parse_add_complex_instrument_request_message_complex_legs;
        }
    }

    state parse_mm_parameter_definition_request_message {
        packet.extract(hdr.mm_parameter_definition_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_qp_self_replenishment_set_limit_message {
        packet.extract(hdr.active_qp_self_replenishment_set_limit_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rapid_fire_config_request_message {
        packet.extract(hdr.rapid_fire_config_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_quote_block_short_form_message {
        packet.extract(hdr.simple_quote_block_short_form_message);
        meta.dispatched = 1;
        meta.simple_quote_block_short_form_message_simple_quotes_remaining = hdr.simple_quote_block_short_form_message.quote_count;
        transition select(meta.simple_quote_block_short_form_message_simple_quotes_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_short_form_message_simple_quotes;
        }
    }

    state parse_simple_quote_block_short_form_message_simple_quotes {
        packet.extract(hdr.simple_quote_block_short_form_message_simple_quotes.next);
        meta.simple_quote_block_short_form_message_simple_quotes_remaining = meta.simple_quote_block_short_form_message_simple_quotes_remaining - 1;
        transition select(meta.simple_quote_block_short_form_message_simple_quotes_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_short_form_message_simple_quotes;
        }
    }

    state parse_simple_quote_block_short_form_detailed_message {
        packet.extract(hdr.simple_quote_block_short_form_detailed_message);
        meta.dispatched = 1;
        meta.simple_quote_block_short_form_detailed_message_simple_quotes_remaining = hdr.simple_quote_block_short_form_detailed_message.quote_count;
        transition select(meta.simple_quote_block_short_form_detailed_message_simple_quotes_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_short_form_detailed_message_simple_quotes;
        }
    }

    state parse_simple_quote_block_short_form_detailed_message_simple_quotes {
        packet.extract(hdr.simple_quote_block_short_form_detailed_message_simple_quotes.next);
        meta.simple_quote_block_short_form_detailed_message_simple_quotes_remaining = meta.simple_quote_block_short_form_detailed_message_simple_quotes_remaining - 1;
        transition select(meta.simple_quote_block_short_form_detailed_message_simple_quotes_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_short_form_detailed_message_simple_quotes;
        }
    }

    state parse_simple_quote_block_long_form_message {
        packet.extract(hdr.simple_quote_block_long_form_message);
        meta.dispatched = 1;
        meta.simple_quote_block_long_form_message_simple_quotes_long_form_remaining = hdr.simple_quote_block_long_form_message.quote_count;
        transition select(meta.simple_quote_block_long_form_message_simple_quotes_long_form_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_long_form_message_simple_quotes_long_form;
        }
    }

    state parse_simple_quote_block_long_form_message_simple_quotes_long_form {
        packet.extract(hdr.simple_quote_block_long_form_message_simple_quotes_long_form.next);
        meta.simple_quote_block_long_form_message_simple_quotes_long_form_remaining = meta.simple_quote_block_long_form_message_simple_quotes_long_form_remaining - 1;
        transition select(meta.simple_quote_block_long_form_message_simple_quotes_long_form_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_long_form_message_simple_quotes_long_form;
        }
    }

    state parse_simple_quote_block_long_form_detailed_message {
        packet.extract(hdr.simple_quote_block_long_form_detailed_message);
        meta.dispatched = 1;
        meta.simple_quote_block_long_form_detailed_message_simple_quotes_long_form_remaining = hdr.simple_quote_block_long_form_detailed_message.quote_count;
        transition select(meta.simple_quote_block_long_form_detailed_message_simple_quotes_long_form_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_long_form_detailed_message_simple_quotes_long_form;
        }
    }

    state parse_simple_quote_block_long_form_detailed_message_simple_quotes_long_form {
        packet.extract(hdr.simple_quote_block_long_form_detailed_message_simple_quotes_long_form.next);
        meta.simple_quote_block_long_form_detailed_message_simple_quotes_long_form_remaining = meta.simple_quote_block_long_form_detailed_message_simple_quotes_long_form_remaining - 1;
        transition select(meta.simple_quote_block_long_form_detailed_message_simple_quotes_long_form_remaining) {
            16w0: accept;
            default: parse_simple_quote_block_long_form_detailed_message_simple_quotes_long_form;
        }
    }

    state parse_complex_quote_block_message {
        packet.extract(hdr.complex_quote_block_message);
        meta.dispatched = 1;
        meta.complex_quote_block_message_complex_quotes_remaining = hdr.complex_quote_block_message.quote_count;
        transition select(meta.complex_quote_block_message_complex_quotes_remaining) {
            16w0: accept;
            default: parse_complex_quote_block_message_complex_quotes;
        }
    }

    state parse_complex_quote_block_message_complex_quotes {
        packet.extract(hdr.complex_quote_block_message_complex_quotes.next);
        meta.complex_quote_block_message_complex_quotes_remaining = meta.complex_quote_block_message_complex_quotes_remaining - 1;
        transition select(meta.complex_quote_block_message_complex_quotes_remaining) {
            16w0: accept;
            default: parse_complex_quote_block_message_complex_quotes;
        }
    }

    state parse_complex_quote_block_detailed_message {
        packet.extract(hdr.complex_quote_block_detailed_message);
        meta.dispatched = 1;
        meta.complex_quote_block_detailed_message_complex_quotes_remaining = hdr.complex_quote_block_detailed_message.quote_count;
        transition select(meta.complex_quote_block_detailed_message_complex_quotes_remaining) {
            16w0: accept;
            default: parse_complex_quote_block_detailed_message_complex_quotes;
        }
    }

    state parse_complex_quote_block_detailed_message_complex_quotes {
        packet.extract(hdr.complex_quote_block_detailed_message_complex_quotes.next);
        meta.complex_quote_block_detailed_message_complex_quotes_remaining = meta.complex_quote_block_detailed_message_complex_quotes_remaining - 1;
        transition select(meta.complex_quote_block_detailed_message_complex_quotes_remaining) {
            16w0: accept;
            default: parse_complex_quote_block_detailed_message_complex_quotes;
        }
    }

    state parse_underlying_purge_request_message {
        packet.extract(hdr.underlying_purge_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_reentry_request_message {
        packet.extract(hdr.market_reentry_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_qp_self_replenishment_request_reentry_message {
        packet.extract(hdr.active_qp_self_replenishment_request_reentry_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_msar_request_message {
        packet.extract(hdr.simple_msar_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_msar_request_message {
        packet.extract(hdr.complex_msar_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_client_heartbeat_packet {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_request_packet {
        meta.dispatched = 1;
        transition accept;
    }

}

control PhlxoptionsQuotingClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsQuotingClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control PhlxoptionsQuotingClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control PhlxoptionsQuotingClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control PhlxoptionsQuotingClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.client_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_request_packet);
        packet.emit(hdr.unsequenced_data_packet);
        packet.emit(hdr.notification_subscription_request_message);
        packet.emit(hdr.add_complex_instrument_request_message);
        packet.emit(hdr.add_complex_instrument_request_message_complex_legs);
        packet.emit(hdr.mm_parameter_definition_request_message);
        packet.emit(hdr.active_qp_self_replenishment_set_limit_message);
        packet.emit(hdr.rapid_fire_config_request_message);
        packet.emit(hdr.simple_quote_block_short_form_message);
        packet.emit(hdr.simple_quote_block_short_form_message_simple_quotes);
        packet.emit(hdr.simple_quote_block_short_form_detailed_message);
        packet.emit(hdr.simple_quote_block_short_form_detailed_message_simple_quotes);
        packet.emit(hdr.simple_quote_block_long_form_message);
        packet.emit(hdr.simple_quote_block_long_form_message_simple_quotes_long_form);
        packet.emit(hdr.simple_quote_block_long_form_detailed_message);
        packet.emit(hdr.simple_quote_block_long_form_detailed_message_simple_quotes_long_form);
        packet.emit(hdr.complex_quote_block_message);
        packet.emit(hdr.complex_quote_block_message_complex_quotes);
        packet.emit(hdr.complex_quote_block_detailed_message);
        packet.emit(hdr.complex_quote_block_detailed_message_complex_quotes);
        packet.emit(hdr.underlying_purge_request_message);
        packet.emit(hdr.market_reentry_request_message);
        packet.emit(hdr.active_qp_self_replenishment_request_reentry_message);
        packet.emit(hdr.simple_msar_request_message);
        packet.emit(hdr.complex_msar_request_message);
    }
}

V1Switch(
    PhlxoptionsQuotingClientParser(),
    PhlxoptionsQuotingClientVerifyChecksum(),
    PhlxoptionsQuotingClientIngress(),
    PhlxoptionsQuotingClientEgress(),
    PhlxoptionsQuotingClientComputeChecksum(),
    PhlxoptionsQuotingClientDeparser()
) main;
