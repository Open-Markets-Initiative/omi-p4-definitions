// P4_16 (v1model) definition for: Lme LmeSelect DailySummariesSnapshot LmeSource v4.18
// 
// Protocol:
//   Organization: The London Metal Exchange
//   Protocol: LMEsource DailySummaries Refresh
//   Encoding: LMEsource
//   Version: 4.18
//   Date: 08/18/2026
//   Specification: LMEsource Client Interface Specification v4 18.pdf
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
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header packet_header_t {
    bit<16> pkt_size;
    bit<8> msg_count;
    bit<8> filler;
    bit<32> seq_num;
    bit<64> send_time;
}

header packet_header_messages_t {
    bit<16> msg_size;
    bit<16> msg_type;
}

header sequence_reset_message_t {
    bit<32> new_seq_no;
}

header open_interest_message_t {
    bit<32> business_date;
    bit<8> open_interest_type;
    bit<64> instrument_id;
    bit<16> product_code;
    bit<96> contract_code;
    bit<8> contract_type;
    bit<32> volume;
}

header open_interest_band_message_t {
    bit<32> business_date;
    bit<16> product_code;
    bit<96> contract_code;
    bit<8> contract_type;
    bit<24> currency_code;
    bit<32> date_band_count;
}

header open_interest_band_message_date_bands_t {
    bit<32> from_date;
    bit<32> to_date;
    bit<32> volume;
}

header position_band_message_t {
    bit<32> business_date;
    bit<16> product_code;
    bit<32> long_position_band_count;
    bit<32> short_position_band_count;
}

header position_band_message_long_position_bands_t {
    bit<64> long_position_lower_value;
    bit<64> long_position_upper_value;
    bit<32> long_position_prompt_date_count;
}

header position_band_message_short_position_bands_t {
    bit<64> short_position_lower_value;
    bit<64> short_position_upper_value;
    bit<32> short_position_prompt_date_count;
}

header warrant_band_message_t {
    bit<32> business_date;
    bit<32> warrant_band_type;
    bit<16> product_code;
    bit<64> unreported_warrants;
    bit<32> band_count;
}

header warrant_band_message_warrant_bands_t {
    bit<64> lower_value;
    bit<64> upper_value;
    bit<32> participant_count;
}

header trading_volume_message_t {
    bit<32> business_date;
    bit<32> trade_date;
    bit<8> calculation_type;
    bit<64> instrument_id;
    bit<16> product_code;
    bit<96> contract_code;
    bit<8> contract_type;
    bit<32> volume;
}

header refresh_complete_message_t {
    bit<32> last_seq_num;
}

struct metadata_t {
    bit<1> dispatched;
    bit<32> open_interest_band_message_date_bands_remaining;
    bit<32> position_band_message_long_position_bands_remaining;
    bit<32> position_band_message_short_position_bands_remaining;
    bit<32> warrant_band_message_warrant_bands_remaining;
}

struct headers_t {
    packet_header_t packet_header;
    packet_header_messages_t packet_header_messages[MAX_MESSAGES];
    sequence_reset_message_t sequence_reset_message[MAX_MESSAGES];
    open_interest_message_t open_interest_message[MAX_MESSAGES];
    open_interest_band_message_t open_interest_band_message[MAX_MESSAGES];
    open_interest_band_message_date_bands_t open_interest_band_message_date_bands[MAX_MESSAGES];
    position_band_message_t position_band_message[MAX_MESSAGES];
    position_band_message_long_position_bands_t position_band_message_long_position_bands[MAX_MESSAGES];
    position_band_message_short_position_bands_t position_band_message_short_position_bands[MAX_MESSAGES];
    warrant_band_message_t warrant_band_message[MAX_MESSAGES];
    warrant_band_message_warrant_bands_t warrant_band_message_warrant_bands[MAX_MESSAGES];
    trading_volume_message_t trading_volume_message[MAX_MESSAGES];
    refresh_complete_message_t refresh_complete_message[MAX_MESSAGES];
}

parser LmeselectDailysummariessnapshotParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.msg_count) {
            8w0: parse_packet_header_messages_empty;
            default: parse_packet_header_messages;
        }
    }

    state parse_packet_header_messages {
        packet.extract(hdr.packet_header_messages.next);
        transition select(hdr.packet_header_messages.last.msg_type) {
            16w0x6400: parse_sequence_reset_message;
            16w0xa401: parse_open_interest_message;
            16w0xa501: parse_open_interest_band_message;
            16w0xa601: parse_position_band_message;
            16w0xa701: parse_warrant_band_message;
            16w0xa801: parse_trading_volume_message;
            16w0xcb00: parse_refresh_complete_message;
            default: accept;
        }
    }

    state parse_sequence_reset_message {
        packet.extract(hdr.sequence_reset_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_open_interest_message {
        packet.extract(hdr.open_interest_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_open_interest_band_message {
        packet.extract(hdr.open_interest_band_message.next);
        meta.dispatched = 1;
        meta.open_interest_band_message_date_bands_remaining = hdr.open_interest_band_message.last.date_band_count;
        transition select(meta.open_interest_band_message_date_bands_remaining) {
            32w0: parse_packet_header_messages;
            default: parse_open_interest_band_message_date_bands;
        }
    }

    state parse_open_interest_band_message_date_bands {
        packet.extract(hdr.open_interest_band_message_date_bands.next);
        meta.open_interest_band_message_date_bands_remaining = meta.open_interest_band_message_date_bands_remaining - 1;
        transition select(meta.open_interest_band_message_date_bands_remaining) {
            32w0: parse_packet_header_messages;
            default: parse_open_interest_band_message_date_bands;
        }
    }

    state parse_position_band_message {
        packet.extract(hdr.position_band_message.next);
        meta.dispatched = 1;
        meta.position_band_message_long_position_bands_remaining = hdr.position_band_message.last.long_position_band_count;
        transition select(meta.position_band_message_long_position_bands_remaining) {
            32w0: read_position_band_message_short_position_bands;
            default: parse_position_band_message_long_position_bands;
        }
    }

    state parse_position_band_message_long_position_bands {
        packet.extract(hdr.position_band_message_long_position_bands.next);
        meta.position_band_message_long_position_bands_remaining = meta.position_band_message_long_position_bands_remaining - 1;
        transition select(meta.position_band_message_long_position_bands_remaining) {
            32w0: read_position_band_message_short_position_bands;
            default: parse_position_band_message_long_position_bands;
        }
    }

    state read_position_band_message_short_position_bands {
        meta.position_band_message_short_position_bands_remaining = hdr.position_band_message.last.short_position_band_count;
        transition select(meta.position_band_message_short_position_bands_remaining) {
            32w0: parse_packet_header_messages;
            default: parse_position_band_message_short_position_bands;
        }
    }

    state parse_position_band_message_short_position_bands {
        packet.extract(hdr.position_band_message_short_position_bands.next);
        meta.position_band_message_short_position_bands_remaining = meta.position_band_message_short_position_bands_remaining - 1;
        transition select(meta.position_band_message_short_position_bands_remaining) {
            32w0: parse_packet_header_messages;
            default: parse_position_band_message_short_position_bands;
        }
    }

    state parse_warrant_band_message {
        packet.extract(hdr.warrant_band_message.next);
        meta.dispatched = 1;
        meta.warrant_band_message_warrant_bands_remaining = hdr.warrant_band_message.last.band_count;
        transition select(meta.warrant_band_message_warrant_bands_remaining) {
            32w0: parse_packet_header_messages;
            default: parse_warrant_band_message_warrant_bands;
        }
    }

    state parse_warrant_band_message_warrant_bands {
        packet.extract(hdr.warrant_band_message_warrant_bands.next);
        meta.warrant_band_message_warrant_bands_remaining = meta.warrant_band_message_warrant_bands_remaining - 1;
        transition select(meta.warrant_band_message_warrant_bands_remaining) {
            32w0: parse_packet_header_messages;
            default: parse_warrant_band_message_warrant_bands;
        }
    }

    state parse_trading_volume_message {
        packet.extract(hdr.trading_volume_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_refresh_complete_message {
        packet.extract(hdr.refresh_complete_message.next);
        meta.dispatched = 1;
        transition parse_packet_header_messages;
    }

    state parse_packet_header_messages_empty {
        meta.dispatched = 1;
        transition accept;
    }

}

control LmeselectDailysummariessnapshotVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectDailysummariessnapshotIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control LmeselectDailysummariessnapshotEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control LmeselectDailysummariessnapshotComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control LmeselectDailysummariessnapshotDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.packet_header_messages);
        packet.emit(hdr.sequence_reset_message);
        packet.emit(hdr.open_interest_message);
        packet.emit(hdr.open_interest_band_message);
        packet.emit(hdr.open_interest_band_message_date_bands);
        packet.emit(hdr.position_band_message);
        packet.emit(hdr.position_band_message_long_position_bands);
        packet.emit(hdr.position_band_message_short_position_bands);
        packet.emit(hdr.warrant_band_message);
        packet.emit(hdr.warrant_band_message_warrant_bands);
        packet.emit(hdr.trading_volume_message);
        packet.emit(hdr.refresh_complete_message);
    }
}

V1Switch(
    LmeselectDailysummariessnapshotParser(),
    LmeselectDailysummariessnapshotVerifyChecksum(),
    LmeselectDailysummariessnapshotIngress(),
    LmeselectDailysummariessnapshotEgress(),
    LmeselectDailysummariessnapshotComputeChecksum(),
    LmeselectDailysummariessnapshotDeparser()
) main;
