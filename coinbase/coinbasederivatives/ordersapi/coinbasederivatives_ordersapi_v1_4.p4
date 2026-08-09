// P4_16 (v1model) definition for: Coinbase CoinbaseDerivatives OrdersApi Sbe v1.4
// 
// Protocol:
//   Organization: Coinbase
//   Protocol: Orders Api
//   Encoding: Simple Binary Encoding
//   Version: 1.4
//   Date: 7/27/2020
//   Specification: Unknown
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

header flags_t {
    bit<8> protocol_id;
    bit<1> is_resend;
    bit<7> reserved_bits;
    bit<16> message_length;
    bit<32> sequence_number;
    bit<32> last_processed_seq_no;
    bit<32> reserved;
    bit<64> send_time_epoch_nanos;
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header logon_message_t {
    bit<128> username;
    bit<256> password;
    bit<8> reset_seq_num;
}

header logon_conf_message_t {
    bit<32> heartbeat_interval_seconds;
}

header logout_message_t {
    bit<512> reason;
}

header logged_out_message_t {
    bit<512> reason;
}

header heartbeat_message_t {
    bit<64> correlation_id;
}

header test_request_message_t {
    bit<64> correlation_id;
}

header resend_request_message_t {
    bit<32> from_sequence_number;
    bit<32> to_sequence_number;
}

header gap_fill_message_t {
    bit<32> new_sequence_number;
    bit<32> gap_fill_padding;
}

header instrument_info_request_message_t {
    bit<64> correlation_id;
}

header instrument_info_message_t {
    bit<64> correlation_id;
    bit<32> instrument_id;
    bit<8> security_type;
    bit<8> instrument_status;
    bit<8> is_last_message;
    bit<8> reserved_byte;
    bit<256> symbol;
}

header set_account_message_t {
    bit<64> correlation_id;
    bit<128> account;
}

header set_trader_message_t {
    bit<64> correlation_id;
    bit<128> trader;
}

header set_ack_message_t {
    bit<64> correlation_id;
}

header new_order_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> limit_price;
    bit<32> quantity;
    bit<32> instrument_id;
    bit<8> side;
}

header order_entered_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> receive_time;
}

header replace_order_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> new_limit_price;
    bit<32> new_quantity;
    bit<32> instrument_id;
}

header stream_order_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> last_processed_fill_id;
    bit<64> limit_price;
    bit<32> quantity;
    bit<32> instrument_id;
    bit<8> side;
}

header order_reject_message_t {
    bit<64> timestamp;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id_optional;
    bit<8> order_reject_reason;
    bit<376> order_reject_details;
}

header order_replaced_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> receive_time;
    bit<32> total_filled;
    bit<32> available_qty;
    bit<32> instrument_id;
}

header cancel_order_message_t {
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<32> instrument_id;
}

header order_canceled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> receive_time;
    bit<32> total_filled;
    bit<32> instrument_id;
    bit<8> cancel_reason;
}

header cancel_order_reject_message_t {
    bit<64> timestamp;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id_optional;
    bit<8> cancel_order_reject_reason;
    bit<248> cancel_order_reject_details;
}

header mass_cancel_order_message_t {
    bit<64> correlation_id;
    bit<64> limit_price;
    bit<32> instrument_id;
    bit<8> side;
    bit<8> current_session_only;
    bit<8> request_trading_lock;
}

header mass_cancel_order_ack_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> correlation_id;
    bit<32> canceled_count;
    bit<8> only_current_session;
    bit<8> trading_lock_applied;
}

header mass_cancel_order_reject_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<256> error_message;
}

header unlock_trading_message_t {
    bit<64> correlation_id;
    bit<8> current_session_only;
}

header unlock_trading_ack_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<32> num_users_affected;
}

header unlock_trading_reject_message_t {
    bit<64> timestamp;
    bit<64> correlation_id;
    bit<256> error_message;
}

header order_filled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> match_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> filled_vwap;
    bit<32> total_filled;
    bit<32> available_qty;
    bit<64> fill_price;
    bit<32> fill_qty;
    bit<32> instrument_id;
    bit<8> is_aggressor;
}

header spread_order_filled_message_t {
    bit<64> timestamp;
    bit<64> exec_id;
    bit<64> match_id;
    bit<64> client_order_id;
    bit<64> correlation_id;
    bit<64> order_id;
    bit<64> filled_vwap;
    bit<32> total_filled;
    bit<32> available_qty;
    bit<64> fill_price;
    bit<64> leg_1_fill_price;
    bit<64> leg_2_fill_price;
    bit<32> fill_qty;
    bit<32> instrument_id;
    bit<8> is_aggressor;
}

header last_exec_id_request_message_t {
    bit<64> correlation_id;
}

header last_exec_id_message_t {
    bit<64> timestamp;
    bit<64> last_exec_id;
    bit<64> correlation_id;
}

header event_resend_request_message_t {
    bit<64> correlation_id;
    bit<64> begin_exec_id;
    bit<64> end_exec_id;
}

header event_resend_complete_message_t {
    bit<64> correlation_id;
    bit<32> resent_event_count;
}

header event_resend_reject_message_t {
    bit<64> correlation_id;
    bit<8> resend_reject_reason;
    bit<184> event_resend_reject_details;
}

struct metadata_t {
}

struct headers_t {
    flags_t flags;
    logon_message_t logon_message;
    logon_conf_message_t logon_conf_message;
    logout_message_t logout_message;
    logged_out_message_t logged_out_message;
    heartbeat_message_t heartbeat_message;
    test_request_message_t test_request_message;
    resend_request_message_t resend_request_message;
    gap_fill_message_t gap_fill_message;
    instrument_info_request_message_t instrument_info_request_message;
    instrument_info_message_t instrument_info_message;
    set_account_message_t set_account_message;
    set_trader_message_t set_trader_message;
    set_ack_message_t set_ack_message;
    new_order_message_t new_order_message;
    order_entered_message_t order_entered_message;
    replace_order_message_t replace_order_message;
    stream_order_message_t stream_order_message;
    order_reject_message_t order_reject_message;
    order_replaced_message_t order_replaced_message;
    cancel_order_message_t cancel_order_message;
    order_canceled_message_t order_canceled_message;
    cancel_order_reject_message_t cancel_order_reject_message;
    mass_cancel_order_message_t mass_cancel_order_message;
    mass_cancel_order_ack_message_t mass_cancel_order_ack_message;
    mass_cancel_order_reject_message_t mass_cancel_order_reject_message;
    unlock_trading_message_t unlock_trading_message;
    unlock_trading_ack_message_t unlock_trading_ack_message;
    unlock_trading_reject_message_t unlock_trading_reject_message;
    order_filled_message_t order_filled_message;
    spread_order_filled_message_t spread_order_filled_message;
    last_exec_id_request_message_t last_exec_id_request_message;
    last_exec_id_message_t last_exec_id_message;
    event_resend_request_message_t event_resend_request_message;
    event_resend_complete_message_t event_resend_complete_message;
    event_resend_reject_message_t event_resend_reject_message;
}

parser CoinbasederivativesOrdersapiParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.flags);
        transition select(hdr.flags.template_id) {
            16w0x100: parse_logon_message;
            16w0x200: parse_logon_conf_message;
            16w0x101: parse_logout_message;
            16w0x201: parse_logged_out_message;
            16w0x10: parse_heartbeat_message;
            16w0x11: parse_test_request_message;
            16w0x102: parse_resend_request_message;
            16w0x202: parse_gap_fill_message;
            16w0x103: parse_instrument_info_request_message;
            16w0x203: parse_instrument_info_message;
            16w0x105: parse_set_account_message;
            16w0x106: parse_set_trader_message;
            16w0x205: parse_set_ack_message;
            16w0x110: parse_new_order_message;
            16w0x210: parse_order_entered_message;
            16w0x120: parse_replace_order_message;
            16w0x121: parse_stream_order_message;
            16w0x221: parse_order_reject_message;
            16w0x220: parse_order_replaced_message;
            16w0x130: parse_cancel_order_message;
            16w0x230: parse_order_canceled_message;
            16w0x233: parse_cancel_order_reject_message;
            16w0x131: parse_mass_cancel_order_message;
            16w0x231: parse_mass_cancel_order_ack_message;
            16w0x232: parse_mass_cancel_order_reject_message;
            16w0x132: parse_unlock_trading_message;
            16w0x234: parse_unlock_trading_ack_message;
            16w0x235: parse_unlock_trading_reject_message;
            16w0x240: parse_order_filled_message;
            16w0x241: parse_spread_order_filled_message;
            16w0x150: parse_last_exec_id_request_message;
            16w0x250: parse_last_exec_id_message;
            16w0x152: parse_event_resend_request_message;
            16w0x252: parse_event_resend_complete_message;
            16w0x253: parse_event_resend_reject_message;
            default: accept;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        transition accept;
    }

    state parse_logon_conf_message {
        packet.extract(hdr.logon_conf_message);
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        transition accept;
    }

    state parse_logged_out_message {
        packet.extract(hdr.logged_out_message);
        transition accept;
    }

    state parse_heartbeat_message {
        packet.extract(hdr.heartbeat_message);
        transition accept;
    }

    state parse_test_request_message {
        packet.extract(hdr.test_request_message);
        transition accept;
    }

    state parse_resend_request_message {
        packet.extract(hdr.resend_request_message);
        transition accept;
    }

    state parse_gap_fill_message {
        packet.extract(hdr.gap_fill_message);
        transition accept;
    }

    state parse_instrument_info_request_message {
        packet.extract(hdr.instrument_info_request_message);
        transition accept;
    }

    state parse_instrument_info_message {
        packet.extract(hdr.instrument_info_message);
        transition accept;
    }

    state parse_set_account_message {
        packet.extract(hdr.set_account_message);
        transition accept;
    }

    state parse_set_trader_message {
        packet.extract(hdr.set_trader_message);
        transition accept;
    }

    state parse_set_ack_message {
        packet.extract(hdr.set_ack_message);
        transition accept;
    }

    state parse_new_order_message {
        packet.extract(hdr.new_order_message);
        transition accept;
    }

    state parse_order_entered_message {
        packet.extract(hdr.order_entered_message);
        transition accept;
    }

    state parse_replace_order_message {
        packet.extract(hdr.replace_order_message);
        transition accept;
    }

    state parse_stream_order_message {
        packet.extract(hdr.stream_order_message);
        transition accept;
    }

    state parse_order_reject_message {
        packet.extract(hdr.order_reject_message);
        transition accept;
    }

    state parse_order_replaced_message {
        packet.extract(hdr.order_replaced_message);
        transition accept;
    }

    state parse_cancel_order_message {
        packet.extract(hdr.cancel_order_message);
        transition accept;
    }

    state parse_order_canceled_message {
        packet.extract(hdr.order_canceled_message);
        transition accept;
    }

    state parse_cancel_order_reject_message {
        packet.extract(hdr.cancel_order_reject_message);
        transition accept;
    }

    state parse_mass_cancel_order_message {
        packet.extract(hdr.mass_cancel_order_message);
        transition accept;
    }

    state parse_mass_cancel_order_ack_message {
        packet.extract(hdr.mass_cancel_order_ack_message);
        transition accept;
    }

    state parse_mass_cancel_order_reject_message {
        packet.extract(hdr.mass_cancel_order_reject_message);
        transition accept;
    }

    state parse_unlock_trading_message {
        packet.extract(hdr.unlock_trading_message);
        transition accept;
    }

    state parse_unlock_trading_ack_message {
        packet.extract(hdr.unlock_trading_ack_message);
        transition accept;
    }

    state parse_unlock_trading_reject_message {
        packet.extract(hdr.unlock_trading_reject_message);
        transition accept;
    }

    state parse_order_filled_message {
        packet.extract(hdr.order_filled_message);
        transition accept;
    }

    state parse_spread_order_filled_message {
        packet.extract(hdr.spread_order_filled_message);
        transition accept;
    }

    state parse_last_exec_id_request_message {
        packet.extract(hdr.last_exec_id_request_message);
        transition accept;
    }

    state parse_last_exec_id_message {
        packet.extract(hdr.last_exec_id_message);
        transition accept;
    }

    state parse_event_resend_request_message {
        packet.extract(hdr.event_resend_request_message);
        transition accept;
    }

    state parse_event_resend_complete_message {
        packet.extract(hdr.event_resend_complete_message);
        transition accept;
    }

    state parse_event_resend_reject_message {
        packet.extract(hdr.event_resend_reject_message);
        transition accept;
    }

}

control CoinbasederivativesOrdersapiVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CoinbasederivativesOrdersapiIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CoinbasederivativesOrdersapiEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CoinbasederivativesOrdersapiComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CoinbasederivativesOrdersapiDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.flags);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logon_conf_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.logged_out_message);
        packet.emit(hdr.heartbeat_message);
        packet.emit(hdr.test_request_message);
        packet.emit(hdr.resend_request_message);
        packet.emit(hdr.gap_fill_message);
        packet.emit(hdr.instrument_info_request_message);
        packet.emit(hdr.instrument_info_message);
        packet.emit(hdr.set_account_message);
        packet.emit(hdr.set_trader_message);
        packet.emit(hdr.set_ack_message);
        packet.emit(hdr.new_order_message);
        packet.emit(hdr.order_entered_message);
        packet.emit(hdr.replace_order_message);
        packet.emit(hdr.stream_order_message);
        packet.emit(hdr.order_reject_message);
        packet.emit(hdr.order_replaced_message);
        packet.emit(hdr.cancel_order_message);
        packet.emit(hdr.order_canceled_message);
        packet.emit(hdr.cancel_order_reject_message);
        packet.emit(hdr.mass_cancel_order_message);
        packet.emit(hdr.mass_cancel_order_ack_message);
        packet.emit(hdr.mass_cancel_order_reject_message);
        packet.emit(hdr.unlock_trading_message);
        packet.emit(hdr.unlock_trading_ack_message);
        packet.emit(hdr.unlock_trading_reject_message);
        packet.emit(hdr.order_filled_message);
        packet.emit(hdr.spread_order_filled_message);
        packet.emit(hdr.last_exec_id_request_message);
        packet.emit(hdr.last_exec_id_message);
        packet.emit(hdr.event_resend_request_message);
        packet.emit(hdr.event_resend_complete_message);
        packet.emit(hdr.event_resend_reject_message);
    }
}

V1Switch(
    CoinbasederivativesOrdersapiParser(),
    CoinbasederivativesOrdersapiVerifyChecksum(),
    CoinbasederivativesOrdersapiIngress(),
    CoinbasederivativesOrdersapiEgress(),
    CoinbasederivativesOrdersapiComputeChecksum(),
    CoinbasederivativesOrdersapiDeparser()
) main;
