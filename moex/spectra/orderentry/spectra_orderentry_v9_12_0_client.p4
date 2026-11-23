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

header establish_message_t {
    bit<64> timestamp;
    bit<32> keepalive_interval;
    bit<160> credentials;
}

header terminate_message_t {
    bit<8> termination_code;
}

header retransmit_request_message_t {
    bit<64> timestamp;
    bit<64> from_seq_no;
    bit<32> count;
}

header sequence_message_t {
    bit<64> next_seq_no;
}

header new_order_single_message_t {
    bit<64> cl_ord_id;
    bit<64> expire_date;
    bit<64> price;
    bit<32> security_id;
    bit<32> cl_ord_link_id;
    bit<32> order_qty;
    bit<8> compliance_id;
    bit<8> time_in_force;
    bit<8> side;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header new_order_iceberg_message_t {
    bit<64> cl_ord_id;
    bit<64> expire_date;
    bit<64> price;
    bit<32> security_id;
    bit<32> cl_ord_link_id;
    bit<32> display_qty;
    bit<32> display_variance_qty;
    bit<32> order_qty;
    bit<8> compliance_id;
    bit<8> side;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header new_order_iceberg_x_message_t {
    bit<64> cl_ord_id;
    bit<64> expire_date;
    bit<64> price;
    bit<32> security_id;
    bit<32> cl_ord_link_id;
    bit<32> display_qty;
    bit<32> display_variance_qty;
    bit<32> order_qty;
    bit<8> compliance_id;
    bit<8> time_in_force;
    bit<8> side;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header order_cancel_request_message_t {
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<32> security_id;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header order_iceberg_cancel_request_message_t {
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<32> security_id;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header order_replace_request_message_t {
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<64> price;
    bit<32> order_qty;
    bit<32> cl_ord_link_id;
    bit<32> security_id;
    bit<8> compliance_id;
    bit<8> mode;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header order_iceberg_replace_request_message_t {
    bit<64> cl_ord_id;
    bit<64> order_id;
    bit<64> price;
    bit<32> cl_ord_link_id;
    bit<32> security_id;
    bit<8> compliance_id;
    bit<6> reserved_3_to_8;
    bit<1> ncc_request_client_flags;
    bit<1> dont_check_limits_client_flags;
    bit<56> account;
}

header order_mass_cancel_request_message_t {
    bit<64> cl_ord_id;
    bit<32> cl_ord_link_id;
    bit<32> security_id;
    bit<5> reserved_4_to_8;
    bit<1> multileg_security_type;
    bit<1> option;
    bit<1> future;
    bit<8> side;
    bit<56> account;
    bit<200> security_group;
}

header order_mass_cancel_by_bf_limit_request_message_t {
    bit<64> cl_ord_id;
    bit<56> account;
}

struct metadata_t {
    bit<1> dispatched;
}

struct headers_t {
    sbe_header_t sbe_header;
    establish_message_t establish_message;
    terminate_message_t terminate_message;
    retransmit_request_message_t retransmit_request_message;
    sequence_message_t sequence_message;
    new_order_single_message_t new_order_single_message;
    new_order_iceberg_message_t new_order_iceberg_message;
    new_order_iceberg_x_message_t new_order_iceberg_x_message;
    order_cancel_request_message_t order_cancel_request_message;
    order_iceberg_cancel_request_message_t order_iceberg_cancel_request_message;
    order_replace_request_message_t order_replace_request_message;
    order_iceberg_replace_request_message_t order_iceberg_replace_request_message;
    order_mass_cancel_request_message_t order_mass_cancel_request_message;
    order_mass_cancel_by_bf_limit_request_message_t order_mass_cancel_by_bf_limit_request_message;
}

parser SpectraOrderentryClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.sbe_header);
        transition select(hdr.sbe_header.template_id) {
            16w0x8813: parse_establish_message;
            16w0x8b13: parse_terminate_message;
            16w0x8c13: parse_retransmit_request_message;
            16w0x8e13: parse_sequence_message;
            16w0x7017: parse_new_order_single_message;
            16w0x7817: parse_new_order_iceberg_message;
            16w0x7b17: parse_new_order_iceberg_x_message;
            16w0x7617: parse_order_cancel_request_message;
            16w0x7917: parse_order_iceberg_cancel_request_message;
            16w0x7717: parse_order_replace_request_message;
            16w0x7a17: parse_order_iceberg_replace_request_message;
            16w0x7417: parse_order_mass_cancel_request_message;
            16w0x7517: parse_order_mass_cancel_by_bf_limit_request_message;
            default: accept;
        }
    }

    state parse_establish_message {
        packet.extract(hdr.establish_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_terminate_message {
        packet.extract(hdr.terminate_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmit_request_message {
        packet.extract(hdr.retransmit_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_sequence_message {
        packet.extract(hdr.sequence_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_single_message {
        packet.extract(hdr.new_order_single_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_iceberg_message {
        packet.extract(hdr.new_order_iceberg_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_new_order_iceberg_x_message {
        packet.extract(hdr.new_order_iceberg_x_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_iceberg_cancel_request_message {
        packet.extract(hdr.order_iceberg_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_replace_request_message {
        packet.extract(hdr.order_replace_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_iceberg_replace_request_message {
        packet.extract(hdr.order_iceberg_replace_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_cancel_request_message {
        packet.extract(hdr.order_mass_cancel_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_order_mass_cancel_by_bf_limit_request_message {
        packet.extract(hdr.order_mass_cancel_by_bf_limit_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control SpectraOrderentryClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderentryClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SpectraOrderentryClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SpectraOrderentryClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SpectraOrderentryClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.sbe_header);
        packet.emit(hdr.establish_message);
        packet.emit(hdr.terminate_message);
        packet.emit(hdr.retransmit_request_message);
        packet.emit(hdr.sequence_message);
        packet.emit(hdr.new_order_single_message);
        packet.emit(hdr.new_order_iceberg_message);
        packet.emit(hdr.new_order_iceberg_x_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.order_iceberg_cancel_request_message);
        packet.emit(hdr.order_replace_request_message);
        packet.emit(hdr.order_iceberg_replace_request_message);
        packet.emit(hdr.order_mass_cancel_request_message);
        packet.emit(hdr.order_mass_cancel_by_bf_limit_request_message);
    }
}

V1Switch(
    SpectraOrderentryClientParser(),
    SpectraOrderentryClientVerifyChecksum(),
    SpectraOrderentryClientIngress(),
    SpectraOrderentryClientEgress(),
    SpectraOrderentryClientComputeChecksum(),
    SpectraOrderentryClientDeparser()
) main;
