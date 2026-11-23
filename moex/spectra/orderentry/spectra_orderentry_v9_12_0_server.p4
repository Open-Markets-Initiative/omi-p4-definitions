// P4_16 (v1model) definition for: Moex Spectra OrderEntry Twime v9.12.0
// 
// Protocol:
//   Organization: Moscow Exchange
//   Protocol: TWIME Spectra Order Entry
//   Encoding: TWIME
//   Version: 9.12.0
//   Date: 10/19/2026
//   Specification: MOEX Spectra TWIME Order Entry (9.12.0).pdf
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

header sbe_header_t {
    bit<16> block_length;
    bit<16> template_id;
    bit<16> schema_id;
    bit<16> version;
}

header establishment_ack_message_t {
    bit<64> request_timestamp;
    bit<32> keepalive_interval;
    bit<64> next_seq_no;
}

header establishment_reject_message_t {
    bit<64> request_timestamp;
    bit<8> establishment_reject_code;
}

header terminate_message_t {
    bit<8> termination_code;
}

header retransmission_message_t {
    bit<64> next_seq_no;
    bit<64> request_timestamp;
    bit<32> count;
}

header sequence_message_t {
    bit<64> next_seq_no;
}

header flood_reject_message_t {
    bit<64> cl_ord_id;
    bit<32> queue_size;
    bit<32> penalty_remain;
}

header session_reject_message_t {
    bit<64> cl_ord_id;
    bit<32> ref_tag_id;
    bit<8> session_reject_reason;
}

header business_message_reject_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<32> ord_rej_reason;
}

header new_order_single_response_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<64> expire_date;
    bit<64> order_id;
    bit<64> flags;
    bit<64> flags_2;
    bit<64> price;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> trading_session_id;
    bit<32> cl_ord_link_id;
    bit<8> side;
    bit<8> compliance_id;
}

header new_order_iceberg_response_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<64> expire_date;
    bit<64> order_id;
    bit<64> display_order_id;
    bit<64> flags;
    bit<64> flags_2;
    bit<64> price;
    bit<32> security_id;
    bit<32> order_qty;
    bit<32> display_qty;
    bit<32> display_variance_qty;
    bit<32> trading_session_id;
    bit<32> cl_ord_link_id;
    bit<8> side;
    bit<8> compliance_id;
}

header order_cancel_response_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<64> order_id;
    bit<64> flags;
    bit<64> flags_2;
    bit<32> order_qty;
    bit<32> trading_session_id;
    bit<32> cl_ord_link_id;
}

header order_replace_response_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<64> order_id;
    bit<64> prev_order_id;
    bit<64> flags;
    bit<64> flags_2;
    bit<64> price;
    bit<32> order_qty;
    bit<32> trading_session_id;
    bit<32> cl_ord_link_id;
    bit<8> compliance_id;
}

header order_mass_cancel_response_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<32> total_affected_orders;
}

header execution_single_report_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<64> order_id;
    bit<64> trd_match_id;
    bit<64> flags;
    bit<64> flags_2;
    bit<64> last_px;
    bit<32> last_qty;
    bit<32> order_qty;
    bit<32> trading_session_id;
    bit<32> cl_ord_link_id;
    bit<32> security_id;
    bit<8> side;
}

header execution_multileg_report_message_t {
    bit<64> cl_ord_id;
    bit<64> timestamp;
    bit<64> order_id;
    bit<64> trd_match_id;
    bit<64> flags;
    bit<64> flags_2;
    bit<64> last_px;
    bit<64> leg_price;
    bit<32> last_qty;
    bit<32> order_qty;
    bit<32> trading_session_id;
    bit<32> cl_ord_link_id;
    bit<32> security_id;
    bit<8> side;
}

header empty_book_message_t {
    bit<64> timestamp;
    bit<32> trading_session_id;
}

header system_event_message_t {
    bit<64> timestamp;
    bit<64> event_id;
    bit<32> trading_session_id;
    bit<8> trad_ses_event;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    sbe_header_t sbe_header;
    establishment_ack_message_t establishment_ack_message;
    establishment_reject_message_t establishment_reject_message;
    terminate_message_t terminate_message;
    retransmission_message_t retransmission_message;
    sequence_message_t sequence_message;
    flood_reject_message_t flood_reject_message;
    session_reject_message_t session_reject_message;
    business_message_reject_message_t business_message_reject_message;
    new_order_single_response_message_t new_order_single_response_message;
    new_order_iceberg_response_message_t new_order_iceberg_response_message;
    order_cancel_response_message_t order_cancel_response_message;
    order_replace_response_message_t order_replace_response_message;
    order_mass_cancel_response_message_t order_mass_cancel_response_message;
    execution_single_report_message_t execution_single_report_message;
    execution_multileg_report_message_t execution_multileg_report_message;
    empty_book_message_t empty_book_message;
    system_event_message_t system_event_message;
}

parser SpectraOrderentryServerParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.sbe_header);
        transition select(hdr.sbe_header.template_id) {
            16w0x8913: parse_establishment_ack_message;
            16w0x8a13: parse_establishment_reject_message;
            16w0x8b13: parse_terminate_message;
            16w0x8d13: parse_retransmission_message;
            16w0x8e13: parse_sequence_message;
            16w0x8f13: parse_flood_reject_message;
            16w0x9013: parse_session_reject_message;
            16w0x9113: parse_business_message_reject_message;
            16w0x671b: parse_new_order_single_response_message;
            16w0x681b: parse_new_order_iceberg_response_message;
            16w0x691b: parse_order_cancel_response_message;
            16w0x6a1b: parse_order_replace_response_message;
            16w0x5f1b: parse_order_mass_cancel_response_message;
            16w0x6b1b: parse_execution_single_report_message;
            16w0x6c1b: parse_execution_multileg_report_message;
            16w0x621b: parse_empty_book_message;
            16w0x661b: parse_system_event_message;
            default: accept;
        }
    }

    state parse_establishment_ack_message {
        packet.extract(hdr.establishment_ack_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_establishment_reject_message {
        packet.extract(hdr.establishment_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_terminate_message {
        packet.extract(hdr.terminate_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmission_message {
        packet.extract(hdr.retransmission_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequence_message {
        packet.extract(hdr.sequence_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_flood_reject_message {
        packet.extract(hdr.flood_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_session_reject_message {
        packet.extract(hdr.session_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_business_message_reject_message {
        packet.extract(hdr.business_message_reject_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_single_response_message {
        packet.extract(hdr.new_order_single_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_iceberg_response_message {
        packet.extract(hdr.new_order_iceberg_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_response_message {
        packet.extract(hdr.order_cancel_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_replace_response_message {
        packet.extract(hdr.order_replace_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_cancel_response_message {
        packet.extract(hdr.order_mass_cancel_response_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_single_report_message {
        packet.extract(hdr.execution_single_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_execution_multileg_report_message {
        packet.extract(hdr.execution_multileg_report_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_empty_book_message {
        packet.extract(hdr.empty_book_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_system_event_message {
        packet.extract(hdr.system_event_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SpectraOrderentryServerVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderentryServerIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraOrderentryServerEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraOrderentryServerComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderentryServerDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.sbe_header);
        packet.emit(hdr.establishment_ack_message);
        packet.emit(hdr.establishment_reject_message);
        packet.emit(hdr.terminate_message);
        packet.emit(hdr.retransmission_message);
        packet.emit(hdr.sequence_message);
        packet.emit(hdr.flood_reject_message);
        packet.emit(hdr.session_reject_message);
        packet.emit(hdr.business_message_reject_message);
        packet.emit(hdr.new_order_single_response_message);
        packet.emit(hdr.new_order_iceberg_response_message);
        packet.emit(hdr.order_cancel_response_message);
        packet.emit(hdr.order_replace_response_message);
        packet.emit(hdr.order_mass_cancel_response_message);
        packet.emit(hdr.execution_single_report_message);
        packet.emit(hdr.execution_multileg_report_message);
        packet.emit(hdr.empty_book_message);
        packet.emit(hdr.system_event_message);
    }
}

V1Switch(
    SpectraOrderentryServerParser(),
    SpectraOrderentryServerVerifyChecksum(),
    SpectraOrderentryServerIngress(),
    SpectraOrderentryServerEgress(),
    SpectraOrderentryServerComputeChecksum(),
    SpectraOrderentryServerDeparser()
) main;
