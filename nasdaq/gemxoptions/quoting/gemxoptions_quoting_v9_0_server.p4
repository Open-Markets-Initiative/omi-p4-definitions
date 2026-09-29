// P4_16 (v1model) definition for: Nasdaq GemxOptions Quoting Sqf v9.0
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

header server_packet_header_t {
    bit<16> packet_length;
    bit<8> server_packet_type;
}

header debug_packet_t {
    bit<8> debug_text;
}

header login_accepted_packet_t {
    bit<80> accepted_session;
    bit<160> accepted_sequence_number;
}

header login_rejected_packet_t {
    bit<8> reject_reason_code;
}

header sequenced_data_packet_t {
    bit<16> sequenced_message_type;
}

header msar_accept_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<8> msar_type;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<32> contracts;
}

header msar_reject_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> status_code;
}

header complex_msar_accept_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<8> msar_type;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<32> contracts;
    bit<8> price_protection;
    bit<32> reserved_4;
}

header complex_msar_reject_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> status_code;
}

header underlying_permission_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<104> underlying;
    bit<8> permitted;
}

header mm_parameter_definition_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<8> instrument_type;
    bit<104> underlying;
    bit<16> interval;
    bit<16> percentage;
    bit<32> cum_qty;
    bit<32> delta;
    bit<32> vega;
    bit<256> reserved_32;
}

header rapid_fire_config_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<104> underlying;
    bit<16> percentage;
    bit<16> interval;
    bit<32> volume;
}

header active_qp_self_replenishment_parameter_definition_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<104> underlying;
    bit<32> set_contract_limit;
    bit<256> reserved_32;
}

header system_event_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> event_code;
    bit<8> version;
    bit<8> subversion;
}

header simple_instrument_directory_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> instrument_id;
    bit<64> security_symbol;
    bit<16> expiration;
    bit<32> strike_price;
    bit<8> option_type;
    bit<104> underlying_symbol;
    bit<8> closing_type;
    bit<8> tradable;
    bit<8> mpv;
    bit<128> reserved_16;
}

header complex_instrument_directory_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> instrument_id;
    bit<104> underlying_symbol;
    bit<8> reserved_1;
    bit<8> number_of_legs;
}

header complex_instrument_directory_message_complex_legs_t {
    bit<32> leg_instrument_id;
    bit<8> leg_side;
    bit<32> leg_ratio;
}

header simple_instrument_trading_action_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> instrument_id;
    bit<8> trading_state;
}

header complex_instrument_trading_action_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> instrument_id;
    bit<8> trading_state;
}

header simple_quote_execution_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<32> instrument_id;
    bit<64> message_id;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<32> contracts;
    bit<8> liquidity_indicator;
    bit<32> cross_id;
    bit<32> match_id;
}

header complex_quote_execution_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<32> auction_id;
    bit<64> price_6;
    bit<8> side;
    bit<32> contracts;
    bit<8> liquidity_indicator;
    bit<32> cross_id;
    bit<32> match_id;
}

header complex_quote_leg_execution_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<32> leg_instrument_id;
    bit<8> leg_id;
    bit<32> auction_id;
    bit<64> price_6;
    bit<8> side;
    bit<32> contracts;
    bit<8> liquidity_indicator;
    bit<32> cross_id;
    bit<32> match_id;
}

header simple_msar_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<32> instrument_id;
    bit<8> notification_type;
    bit<64> message_id;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<32> contracts;
    bit<8> liquidity_indicator;
    bit<32> cross_id;
    bit<32> match_id;
}

header complex_msar_leg_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<32> instrument_id;
    bit<8> leg_id;
    bit<32> leg_instrument_id;
    bit<8> notification_type;
    bit<64> message_id;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<8> leg_side;
    bit<32> contracts;
    bit<8> liquidity_indicator;
    bit<32> cross_id;
    bit<32> match_id;
    bit<64> price_6;
}

header complex_msar_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<32> instrument_id;
    bit<8> notification_type;
    bit<64> message_id;
    bit<32> auction_id;
    bit<32> price;
    bit<8> side;
    bit<32> contracts;
    bit<8> liquidity_indicator;
    bit<32> cross_id;
    bit<32> match_id;
    bit<64> price_6;
}

header opening_rotation_quote_spread_multiplier_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<104> underlying_symbol;
    bit<8> multiplier;
}

header server_unsequenced_data_packet_t {
    bit<16> server_unsequenced_message_type;
}

header notification_subscription_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> status_code;
}

header add_complex_instrument_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> status_code;
}

header mm_parameter_definition_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> status_code;
}

header active_qp_self_replenishment_set_limit_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<104> underlying_symbol;
    bit<32> set_value;
    bit<8> status_code;
}

header rapid_fire_config_reply_message_t {
    bit<32> badge;
    bit<8> status_code;
}

header quote_block_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<8> block_status_code;
    bit<16> quote_count;
    bit<16> valid_quote_count;
}

header quote_block_reply_message_quote_responses_t {
    bit<8> quote_status_code;
    bit<64> sequence;
}

header detailed_quote_block_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<8> block_status_code;
    bit<16> quote_count;
    bit<16> valid_quote_count;
}

header detailed_quote_block_reply_message_detailed_quote_responses_t {
    bit<8> quote_status_code;
    bit<64> sequence;
    bit<64> bid_sequence;
    bit<64> ask_sequence;
}

header underlying_purge_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<64> sent_timestamp;
    bit<8> status_code;
    bit<64> sequence;
}

header market_reentry_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<8> status_code;
    bit<64> reserved_8;
}

header active_qp_self_replenishment_request_reentry_reply_message_t {
    bit<32> badge;
    bit<64> message_id;
    bit<104> underlying_symbol;
    bit<8> status_code;
    bit<32> requested_replenishment_value;
    bit<32> active_counter_value;
    bit<32> set_contract_limit;
}

header auction_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<8> instrument_type;
    bit<32> instrument_id;
    bit<32> auction_id;
    bit<8> order_type;
    bit<8> side;
    bit<32> price;
    bit<32> matched_volume;
    bit<32> volume;
    bit<8> exec_flag;
    bit<8> order_capacity;
    bit<32> firm_id;
    bit<32> occ_account;
    bit<32> cmta;
    bit<8> auction_event;
    bit<8> auction_type;
    bit<32> auction_duration;
    bit<32> best_response_price;
    bit<32> best_response_size;
    bit<72> reserved_9;
    bit<8> number_of_flex_dac_legs;
}

header auction_notification_message_flex_dac_legs_t {
    bit<64> reserved_8;
}

header instrument_purge_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<64> message_id;
    bit<32> instrument_id;
    bit<8> purge_reason;
    bit<64> sequence;
    bit<128> reserved_16;
}

header underlying_purge_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<104> underlying;
    bit<8> purge_reason;
    bit<64> message_id;
    bit<64> sequence;
}

header market_reentry_notification_message_t {
    bit<32> seconds;
    bit<32> nanoseconds;
    bit<32> badge;
    bit<104> underlying_symbol;
    bit<8> reentry_scope;
    bit<64> message_id;
    bit<64> reserved_8;
}

struct metadata_t {
    bit<1> dispatched;
    bit<8> complex_instrument_directory_message_complex_legs_remaining;
    bit<16> quote_block_reply_message_quote_responses_remaining;
    bit<16> detailed_quote_block_reply_message_detailed_quote_responses_remaining;
    bit<8> auction_notification_message_flex_dac_legs_remaining;
}

struct headers_t {
    server_packet_header_t server_packet_header;
    debug_packet_t debug_packet;
    login_accepted_packet_t login_accepted_packet;
    login_rejected_packet_t login_rejected_packet;
    sequenced_data_packet_t sequenced_data_packet;
    msar_accept_message_t msar_accept_message;
    msar_reject_message_t msar_reject_message;
    complex_msar_accept_message_t complex_msar_accept_message;
    complex_msar_reject_message_t complex_msar_reject_message;
    underlying_permission_notification_message_t underlying_permission_notification_message;
    mm_parameter_definition_notification_message_t mm_parameter_definition_notification_message;
    rapid_fire_config_notification_message_t rapid_fire_config_notification_message;
    active_qp_self_replenishment_parameter_definition_notification_message_t active_qp_self_replenishment_parameter_definition_notification_message;
    system_event_message_t system_event_message;
    simple_instrument_directory_message_t simple_instrument_directory_message;
    complex_instrument_directory_message_t complex_instrument_directory_message;
    complex_instrument_directory_message_complex_legs_t complex_instrument_directory_message_complex_legs[MAX_MESSAGES];
    simple_instrument_trading_action_message_t simple_instrument_trading_action_message;
    complex_instrument_trading_action_message_t complex_instrument_trading_action_message;
    simple_quote_execution_notification_message_t simple_quote_execution_notification_message;
    complex_quote_execution_notification_message_t complex_quote_execution_notification_message;
    complex_quote_leg_execution_notification_message_t complex_quote_leg_execution_notification_message;
    simple_msar_notification_message_t simple_msar_notification_message;
    complex_msar_leg_notification_message_t complex_msar_leg_notification_message;
    complex_msar_notification_message_t complex_msar_notification_message;
    opening_rotation_quote_spread_multiplier_notification_message_t opening_rotation_quote_spread_multiplier_notification_message;
    server_unsequenced_data_packet_t server_unsequenced_data_packet;
    notification_subscription_reply_message_t notification_subscription_reply_message;
    add_complex_instrument_reply_message_t add_complex_instrument_reply_message;
    mm_parameter_definition_reply_message_t mm_parameter_definition_reply_message;
    active_qp_self_replenishment_set_limit_reply_message_t active_qp_self_replenishment_set_limit_reply_message;
    rapid_fire_config_reply_message_t rapid_fire_config_reply_message;
    quote_block_reply_message_t quote_block_reply_message;
    quote_block_reply_message_quote_responses_t quote_block_reply_message_quote_responses[MAX_MESSAGES];
    detailed_quote_block_reply_message_t detailed_quote_block_reply_message;
    detailed_quote_block_reply_message_detailed_quote_responses_t detailed_quote_block_reply_message_detailed_quote_responses[MAX_MESSAGES];
    underlying_purge_reply_message_t underlying_purge_reply_message;
    market_reentry_reply_message_t market_reentry_reply_message;
    active_qp_self_replenishment_request_reentry_reply_message_t active_qp_self_replenishment_request_reentry_reply_message;
    auction_notification_message_t auction_notification_message;
    auction_notification_message_flex_dac_legs_t auction_notification_message_flex_dac_legs[MAX_MESSAGES];
    instrument_purge_notification_message_t instrument_purge_notification_message;
    underlying_purge_notification_message_t underlying_purge_notification_message;
    market_reentry_notification_message_t market_reentry_notification_message;
}

parser GemxoptionsQuotingServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.server_packet_header);
        transition select(hdr.server_packet_header.server_packet_type) {
            8w0x2b: parse_debug_packet;
            8w0x41: parse_login_accepted_packet;
            8w0x4a: parse_login_rejected_packet;
            8w0x53: parse_sequenced_data_packet;
            8w0x55: parse_server_unsequenced_data_packet;
            8w0x48: parse_server_heartbeat_packet;
            8w0x5a: parse_end_of_session_packet;
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
            16w0x5341: parse_msar_accept_message;
            16w0x5352: parse_msar_reject_message;
            16w0x5359: parse_complex_msar_accept_message;
            16w0x534e: parse_complex_msar_reject_message;
            16w0x4150: parse_underlying_permission_notification_message;
            16w0x414a: parse_mm_parameter_definition_notification_message;
            16w0x4166: parse_rapid_fire_config_notification_message;
            16w0x414b: parse_active_qp_self_replenishment_parameter_definition_notification_message;
            16w0x4153: parse_system_event_message;
            16w0x4144: parse_simple_instrument_directory_message;
            16w0x4152: parse_complex_instrument_directory_message;
            16w0x4148: parse_simple_instrument_trading_action_message;
            16w0x4149: parse_complex_instrument_trading_action_message;
            16w0x4e45: parse_simple_quote_execution_notification_message;
            16w0x4e56: parse_complex_quote_execution_notification_message;
            16w0x4e57: parse_complex_quote_leg_execution_notification_message;
            16w0x4e53: parse_simple_msar_notification_message;
            16w0x4e4c: parse_complex_msar_leg_notification_message;
            16w0x4e58: parse_complex_msar_notification_message;
            16w0x414d: parse_opening_rotation_quote_spread_multiplier_notification_message;
            default: accept;
        }
    }

    state parse_msar_accept_message {
        packet.extract(hdr.msar_accept_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_msar_reject_message {
        packet.extract(hdr.msar_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_msar_accept_message {
        packet.extract(hdr.complex_msar_accept_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_msar_reject_message {
        packet.extract(hdr.complex_msar_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_underlying_permission_notification_message {
        packet.extract(hdr.underlying_permission_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mm_parameter_definition_notification_message {
        packet.extract(hdr.mm_parameter_definition_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rapid_fire_config_notification_message {
        packet.extract(hdr.rapid_fire_config_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_qp_self_replenishment_parameter_definition_notification_message {
        packet.extract(hdr.active_qp_self_replenishment_parameter_definition_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_instrument_directory_message {
        packet.extract(hdr.simple_instrument_directory_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_instrument_directory_message {
        packet.extract(hdr.complex_instrument_directory_message);
        meta.dispatched = 1;
        meta.complex_instrument_directory_message_complex_legs_remaining = hdr.complex_instrument_directory_message.number_of_legs;
        transition select(meta.complex_instrument_directory_message_complex_legs_remaining) {
            8w0: accept;
            default: parse_complex_instrument_directory_message_complex_legs;
        }
    }

    state parse_complex_instrument_directory_message_complex_legs {
        packet.extract(hdr.complex_instrument_directory_message_complex_legs.next);
        meta.complex_instrument_directory_message_complex_legs_remaining = meta.complex_instrument_directory_message_complex_legs_remaining - 1;
        transition select(meta.complex_instrument_directory_message_complex_legs_remaining) {
            8w0: accept;
            default: parse_complex_instrument_directory_message_complex_legs;
        }
    }

    state parse_simple_instrument_trading_action_message {
        packet.extract(hdr.simple_instrument_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_instrument_trading_action_message {
        packet.extract(hdr.complex_instrument_trading_action_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_quote_execution_notification_message {
        packet.extract(hdr.simple_quote_execution_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_quote_execution_notification_message {
        packet.extract(hdr.complex_quote_execution_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_quote_leg_execution_notification_message {
        packet.extract(hdr.complex_quote_leg_execution_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_simple_msar_notification_message {
        packet.extract(hdr.simple_msar_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_msar_leg_notification_message {
        packet.extract(hdr.complex_msar_leg_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_complex_msar_notification_message {
        packet.extract(hdr.complex_msar_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_opening_rotation_quote_spread_multiplier_notification_message {
        packet.extract(hdr.opening_rotation_quote_spread_multiplier_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_unsequenced_data_packet {
        packet.extract(hdr.server_unsequenced_data_packet);
        meta.dispatched = 1;
        transition select(hdr.server_unsequenced_data_packet.server_unsequenced_message_type) {
            16w0x4162: parse_notification_subscription_reply_message;
            16w0x4163: parse_add_complex_instrument_reply_message;
            16w0x4165: parse_mm_parameter_definition_reply_message;
            16w0x4167: parse_active_qp_self_replenishment_set_limit_reply_message;
            16w0x4141: parse_rapid_fire_config_reply_message;
            16w0x5153: parse_quote_block_reply_message;
            16w0x5173: parse_detailed_quote_block_reply_message;
            16w0x5072: parse_underlying_purge_reply_message;
            16w0x5252: parse_market_reentry_reply_message;
            16w0x5267: parse_active_qp_self_replenishment_request_reentry_reply_message;
            16w0x4e41: parse_auction_notification_message;
            16w0x4e44: parse_instrument_purge_notification_message;
            16w0x4e55: parse_underlying_purge_notification_message;
            16w0x4e52: parse_market_reentry_notification_message;
            default: accept;
        }
    }

    state parse_notification_subscription_reply_message {
        packet.extract(hdr.notification_subscription_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_add_complex_instrument_reply_message {
        packet.extract(hdr.add_complex_instrument_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_mm_parameter_definition_reply_message {
        packet.extract(hdr.mm_parameter_definition_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_qp_self_replenishment_set_limit_reply_message {
        packet.extract(hdr.active_qp_self_replenishment_set_limit_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_rapid_fire_config_reply_message {
        packet.extract(hdr.rapid_fire_config_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_quote_block_reply_message {
        packet.extract(hdr.quote_block_reply_message);
        meta.dispatched = 1;
        meta.quote_block_reply_message_quote_responses_remaining = hdr.quote_block_reply_message.valid_quote_count;
        transition select(meta.quote_block_reply_message_quote_responses_remaining) {
            16w0: accept;
            default: parse_quote_block_reply_message_quote_responses;
        }
    }

    state parse_quote_block_reply_message_quote_responses {
        packet.extract(hdr.quote_block_reply_message_quote_responses.next);
        meta.quote_block_reply_message_quote_responses_remaining = meta.quote_block_reply_message_quote_responses_remaining - 1;
        transition select(meta.quote_block_reply_message_quote_responses_remaining) {
            16w0: accept;
            default: parse_quote_block_reply_message_quote_responses;
        }
    }

    state parse_detailed_quote_block_reply_message {
        packet.extract(hdr.detailed_quote_block_reply_message);
        meta.dispatched = 1;
        meta.detailed_quote_block_reply_message_detailed_quote_responses_remaining = hdr.detailed_quote_block_reply_message.valid_quote_count;
        transition select(meta.detailed_quote_block_reply_message_detailed_quote_responses_remaining) {
            16w0: accept;
            default: parse_detailed_quote_block_reply_message_detailed_quote_responses;
        }
    }

    state parse_detailed_quote_block_reply_message_detailed_quote_responses {
        packet.extract(hdr.detailed_quote_block_reply_message_detailed_quote_responses.next);
        meta.detailed_quote_block_reply_message_detailed_quote_responses_remaining = meta.detailed_quote_block_reply_message_detailed_quote_responses_remaining - 1;
        transition select(meta.detailed_quote_block_reply_message_detailed_quote_responses_remaining) {
            16w0: accept;
            default: parse_detailed_quote_block_reply_message_detailed_quote_responses;
        }
    }

    state parse_underlying_purge_reply_message {
        packet.extract(hdr.underlying_purge_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_reentry_reply_message {
        packet.extract(hdr.market_reentry_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_active_qp_self_replenishment_request_reentry_reply_message {
        packet.extract(hdr.active_qp_self_replenishment_request_reentry_reply_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_auction_notification_message {
        packet.extract(hdr.auction_notification_message);
        meta.dispatched = 1;
        meta.auction_notification_message_flex_dac_legs_remaining = hdr.auction_notification_message.number_of_flex_dac_legs;
        transition select(meta.auction_notification_message_flex_dac_legs_remaining) {
            8w0: accept;
            default: parse_auction_notification_message_flex_dac_legs;
        }
    }

    state parse_auction_notification_message_flex_dac_legs {
        packet.extract(hdr.auction_notification_message_flex_dac_legs.next);
        meta.auction_notification_message_flex_dac_legs_remaining = meta.auction_notification_message_flex_dac_legs_remaining - 1;
        transition select(meta.auction_notification_message_flex_dac_legs_remaining) {
            8w0: accept;
            default: parse_auction_notification_message_flex_dac_legs;
        }
    }

    state parse_instrument_purge_notification_message {
        packet.extract(hdr.instrument_purge_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_underlying_purge_notification_message {
        packet.extract(hdr.underlying_purge_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_reentry_notification_message {
        packet.extract(hdr.market_reentry_notification_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_server_heartbeat_packet {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_end_of_session_packet {
        meta.dispatched = 1;
        transition accept;
    }

}

control GemxoptionsQuotingServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control GemxoptionsQuotingServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control GemxoptionsQuotingServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control GemxoptionsQuotingServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control GemxoptionsQuotingServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.server_packet_header);
        packet.emit(hdr.debug_packet);
        packet.emit(hdr.login_accepted_packet);
        packet.emit(hdr.login_rejected_packet);
        packet.emit(hdr.sequenced_data_packet);
        packet.emit(hdr.msar_accept_message);
        packet.emit(hdr.msar_reject_message);
        packet.emit(hdr.complex_msar_accept_message);
        packet.emit(hdr.complex_msar_reject_message);
        packet.emit(hdr.underlying_permission_notification_message);
        packet.emit(hdr.mm_parameter_definition_notification_message);
        packet.emit(hdr.rapid_fire_config_notification_message);
        packet.emit(hdr.active_qp_self_replenishment_parameter_definition_notification_message);
        packet.emit(hdr.system_event_message);
        packet.emit(hdr.simple_instrument_directory_message);
        packet.emit(hdr.complex_instrument_directory_message);
        packet.emit(hdr.complex_instrument_directory_message_complex_legs);
        packet.emit(hdr.simple_instrument_trading_action_message);
        packet.emit(hdr.complex_instrument_trading_action_message);
        packet.emit(hdr.simple_quote_execution_notification_message);
        packet.emit(hdr.complex_quote_execution_notification_message);
        packet.emit(hdr.complex_quote_leg_execution_notification_message);
        packet.emit(hdr.simple_msar_notification_message);
        packet.emit(hdr.complex_msar_leg_notification_message);
        packet.emit(hdr.complex_msar_notification_message);
        packet.emit(hdr.opening_rotation_quote_spread_multiplier_notification_message);
        packet.emit(hdr.server_unsequenced_data_packet);
        packet.emit(hdr.notification_subscription_reply_message);
        packet.emit(hdr.add_complex_instrument_reply_message);
        packet.emit(hdr.mm_parameter_definition_reply_message);
        packet.emit(hdr.active_qp_self_replenishment_set_limit_reply_message);
        packet.emit(hdr.rapid_fire_config_reply_message);
        packet.emit(hdr.quote_block_reply_message);
        packet.emit(hdr.quote_block_reply_message_quote_responses);
        packet.emit(hdr.detailed_quote_block_reply_message);
        packet.emit(hdr.detailed_quote_block_reply_message_detailed_quote_responses);
        packet.emit(hdr.underlying_purge_reply_message);
        packet.emit(hdr.market_reentry_reply_message);
        packet.emit(hdr.active_qp_self_replenishment_request_reentry_reply_message);
        packet.emit(hdr.auction_notification_message);
        packet.emit(hdr.auction_notification_message_flex_dac_legs);
        packet.emit(hdr.instrument_purge_notification_message);
        packet.emit(hdr.underlying_purge_notification_message);
        packet.emit(hdr.market_reentry_notification_message);
    }
}

V1Switch(
    GemxoptionsQuotingServerParser(),
    GemxoptionsQuotingServerVerifyChecksum(),
    GemxoptionsQuotingServerIngress(),
    GemxoptionsQuotingServerEgress(),
    GemxoptionsQuotingServerComputeChecksum(),
    GemxoptionsQuotingServerDeparser()
) main;
