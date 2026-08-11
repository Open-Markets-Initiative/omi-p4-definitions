// P4_16 (v1model) definition for: Coinbase CoinbaseDerivatives Session Tcp v1.2
// 
// Protocol:
//   Organization: Coinbase
//   Protocol: Session Layer
//   Encoding: Tcp
//   Version: 1.2
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
    bit<512> reason_string_64;
}

header logged_out_message_t {
    bit<512> reason_string_64;
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
    bit<32> padding;
}

header reject_message_t {
    bit<32> ref_sequence_number;
    bit<32> reason_reject_reason;
    bit<512> details;
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
    reject_message_t reject_message;
}

parser CoinbasederivativesSessionParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.flags);
        transition select(hdr.flags.template_id) {
            16w100: parse_logon_message;
            16w200: parse_logon_conf_message;
            16w101: parse_logout_message;
            16w201: parse_logged_out_message;
            16w10: parse_heartbeat_message;
            16w11: parse_test_request_message;
            16w102: parse_resend_request_message;
            16w202: parse_gap_fill_message;
            16w210: parse_reject_message;
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

    state parse_reject_message {
        packet.extract(hdr.reject_message);
        transition accept;
    }

}

control CoinbasederivativesSessionVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CoinbasederivativesSessionIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control CoinbasederivativesSessionEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control CoinbasederivativesSessionComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control CoinbasederivativesSessionDeparser(packet_out packet, in headers_t hdr) {
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
        packet.emit(hdr.reject_message);
    }
}

V1Switch(
    CoinbasederivativesSessionParser(),
    CoinbasederivativesSessionVerifyChecksum(),
    CoinbasederivativesSessionIngress(),
    CoinbasederivativesSessionEgress(),
    CoinbasederivativesSessionComputeChecksum(),
    CoinbasederivativesSessionDeparser()
) main;
