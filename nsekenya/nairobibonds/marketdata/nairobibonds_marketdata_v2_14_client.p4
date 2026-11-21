// P4_16 (v1model) definition for: NseKenya NairobiBonds MarketData Mits v2.14
// 
// Protocol:
//   Organization: Nairobi Securities Exchange
//   Protocol: Nairobi Bonds Market Data
//   Encoding: MITS Exchange System
//   Version: 2.14
//   Date: 08/21/2019
//   Specification: Bonds-and-Derrivatives-MITS-Market-Data-API.pdf
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

header time_t {
    bit<8> start_byte;
    bit<16> message_length;
    bit<8> length_check;
    bit<32> sequence_number;
    bit<8> user_name_length_byte;
    bit<120> user_name_characters;
    bit<32> user_number;
    bit<8> hours;
    bit<8> minutes;
    bit<8> seconds;
    bit<8> unused_1;
    bit<8> client_message_type;
}

header log_in_message_t {
    bit<2048> encrypted_password_chunk0;
    bit<448> encrypted_password_chunk1;
    bit<2048> new_password_chunk0;
    bit<448> new_password_chunk1;
}

header re_request_message_t {
    bit<32> from_sequence;
    bit<32> to_sequence;
    bit<32> market_shard_number_i_4;
}

header request_data_retrieval_message_t {
    bit<8> data_type;
    bit<8> unused_1;
    bit<8> last_piece_of_chunk;
    bit<8> re_request;
    bit<32> action_;
    bit<32> specific_record;
    bit<32> year;
    bit<32> month;
    bit<32> day;
}

header unsubscribe_contract_message_t {
    bit<16> quantity_i_2;
}

header unsubscribe_contract_message_contracts_to_unsubscribe_t {
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
}

header request_daily_trend_message_t {
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
}

header option_contract_subscription_message_t {
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
}

header subscribing_to_indices_service_message_t {
    bit<8> subscribe;
}

header future_contract_subscription_message_t {
    bit<16> quantity_i_2;
}

header future_contract_subscription_message_contracts_requested_for_display_t {
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
}

header option_statistics_request_message_t {
    bit<32> identifier_prefix_i_4;
    bit<32> year;
    bit<32> month;
    bit<32> day;
    bit<8> instrument_name_p_5_length_byte;
    bit<32> instrument_name_p_5_characters;
    bit<64> strike;
    bit<8> call_put_c_1;
    bit<32> year_2;
    bit<32> month_2;
    bit<32> day_2;
    bit<8> secondary_instrument_name_p_5_length_byte;
    bit<32> secondary_instrument_name_p_5_characters;
    bit<8> is_delta_option;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> unsubscribe_contract_message_contracts_to_unsubscribe_remaining;
    bit<16> future_contract_subscription_message_contracts_requested_for_display_remaining;
}

struct headers_t {
    time_t time;
    log_in_message_t log_in_message;
    re_request_message_t re_request_message;
    request_data_retrieval_message_t request_data_retrieval_message;
    unsubscribe_contract_message_t unsubscribe_contract_message;
    unsubscribe_contract_message_contracts_to_unsubscribe_t unsubscribe_contract_message_contracts_to_unsubscribe[MAX_MESSAGES];
    request_daily_trend_message_t request_daily_trend_message;
    option_contract_subscription_message_t option_contract_subscription_message;
    subscribing_to_indices_service_message_t subscribing_to_indices_service_message;
    future_contract_subscription_message_t future_contract_subscription_message;
    future_contract_subscription_message_contracts_requested_for_display_t future_contract_subscription_message_contracts_requested_for_display[MAX_MESSAGES];
    option_statistics_request_message_t option_statistics_request_message;
}

parser NairobibondsMarketdataClientParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.time);
        transition select(hdr.time.client_message_type) {
            8w0: parse_log_in_message;
            8w3: parse_re_request_message;
            8w4: parse_log_out_message;
            8w36: parse_request_data_retrieval_message;
            8w37: parse_request_data_retrieval_message;
            8w42: parse_unsubscribe_contract_message;
            8w61: parse_request_daily_trend_message;
            8w67: parse_option_contract_subscription_message;
            8w84: parse_heart_beats_message;
            8w98: parse_subscribing_to_indices_service_message;
            8w99: parse_future_contract_subscription_message;
            8w135: parse_option_statistics_request_message;
            default: accept;
        }
    }

    state parse_log_in_message {
        packet.extract(hdr.log_in_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_re_request_message {
        packet.extract(hdr.re_request_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_log_out_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_request_data_retrieval_message {
        packet.extract(hdr.request_data_retrieval_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_unsubscribe_contract_message {
        packet.extract(hdr.unsubscribe_contract_message);
        meta.dispatched = 1;
        meta.unsubscribe_contract_message_contracts_to_unsubscribe_remaining = 16w40;
        transition parse_unsubscribe_contract_message_contracts_to_unsubscribe;
    }

    state parse_unsubscribe_contract_message_contracts_to_unsubscribe {
        packet.extract(hdr.unsubscribe_contract_message_contracts_to_unsubscribe.next);
        meta.unsubscribe_contract_message_contracts_to_unsubscribe_remaining = meta.unsubscribe_contract_message_contracts_to_unsubscribe_remaining - 1;
        transition select(meta.unsubscribe_contract_message_contracts_to_unsubscribe_remaining) {
            16w0: accept;
            default: parse_unsubscribe_contract_message_contracts_to_unsubscribe;
        }
    }

    state parse_request_daily_trend_message {
        packet.extract(hdr.request_daily_trend_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_option_contract_subscription_message {
        packet.extract(hdr.option_contract_subscription_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heart_beats_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_subscribing_to_indices_service_message {
        packet.extract(hdr.subscribing_to_indices_service_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_future_contract_subscription_message {
        packet.extract(hdr.future_contract_subscription_message);
        meta.dispatched = 1;
        meta.future_contract_subscription_message_contracts_requested_for_display_remaining = 16w40;
        transition parse_future_contract_subscription_message_contracts_requested_for_display;
    }

    state parse_future_contract_subscription_message_contracts_requested_for_display {
        packet.extract(hdr.future_contract_subscription_message_contracts_requested_for_display.next);
        meta.future_contract_subscription_message_contracts_requested_for_display_remaining = meta.future_contract_subscription_message_contracts_requested_for_display_remaining - 1;
        transition select(meta.future_contract_subscription_message_contracts_requested_for_display_remaining) {
            16w0: accept;
            default: parse_future_contract_subscription_message_contracts_requested_for_display;
        }
    }

    state parse_option_statistics_request_message {
        packet.extract(hdr.option_statistics_request_message);
        meta.dispatched = 1;
        transition accept;
    }

}

control NairobibondsMarketdataClientVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NairobibondsMarketdataClientIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control NairobibondsMarketdataClientEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NairobibondsMarketdataClientComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NairobibondsMarketdataClientDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.time);
        packet.emit(hdr.log_in_message);
        packet.emit(hdr.re_request_message);
        packet.emit(hdr.request_data_retrieval_message);
        packet.emit(hdr.unsubscribe_contract_message);
        packet.emit(hdr.unsubscribe_contract_message_contracts_to_unsubscribe);
        packet.emit(hdr.request_daily_trend_message);
        packet.emit(hdr.option_contract_subscription_message);
        packet.emit(hdr.subscribing_to_indices_service_message);
        packet.emit(hdr.future_contract_subscription_message);
        packet.emit(hdr.future_contract_subscription_message_contracts_requested_for_display);
        packet.emit(hdr.option_statistics_request_message);
    }
}

V1Switch(
    NairobibondsMarketdataClientParser(),
    NairobibondsMarketdataClientVerifyChecksum(),
    NairobibondsMarketdataClientIngress(),
    NairobibondsMarketdataClientEgress(),
    NairobibondsMarketdataClientComputeChecksum(),
    NairobibondsMarketdataClientDeparser()
) main;
