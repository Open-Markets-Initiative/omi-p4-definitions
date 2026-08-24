// P4_16 (v1model) definition for: Nyse NationalEquities BinaryGateway PillarStream v5.17
// 
// Protocol:
//   Organization: New York Stock Exchange
//   Protocol: Binary Gateway
//   Encoding: Pillar Stream Protocol
//   Version: 5.17
//   Date: 10/17/2025
//   Specification: NYSE_Pillar_Gateway_Binary_Protocol_Specification.pdf
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

header packet_header_t {
    bit<16> msg_type;
    bit<16> msg_length;
    bit<128> username;
    bit<256> password;
    bit<32> mic;
    bit<160> version;
    bit<16> msg_type_2;
    bit<16> msg_length_2;
    bit<128> username_2;
    bit<8> status;
    bit<16> msg_type_3;
    bit<16> msg_length_3;
    bit<32> sess;
    bit<32> value;
    bit<64> next_seq;
    bit<8> access;
    bit<16> msg_type_4;
    bit<16> msg_length_4;
    bit<16> msg_type_5;
    bit<16> msg_length_5;
    bit<32> sess_2;
    bit<32> value_2;
    bit<64> start_seq;
    bit<64> end_seq;
    bit<8> access_2;
    bit<8> mode;
    bit<16> msg_type_6;
    bit<16> msg_length_6;
    bit<32> sess_3;
    bit<32> value_3;
    bit<8> status_2;
    bit<8> access_3;
    bit<16> msg_type_7;
    bit<16> msg_length_7;
    bit<32> sess_4;
    bit<32> value_4;
    bit<16> msg_type_8;
    bit<16> msg_length_8;
    bit<32> sess_5;
    bit<32> value_5;
    bit<8> status_3;
    bit<16> msg_type_9;
    bit<16> msg_length_9;
    bit<32> sess_6;
    bit<32> value_6;
    bit<64> seq;
    bit<32> reserved_4;
    bit<64> timestamp;
    bit<16> seq_msg_type;
    bit<16> seq_msg_length;
}

header session_configuration_request_message_t {
    bit<128> username;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header new_order_single_and_cancel_replace_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<32> mmid;
    bit<8> mpsubid_1;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<12> unused_12;
    bit<1> sub_id_indicator;
    bit<4> special_ord_type;
    bit<1> locate_reqd;
    bit<1> retail_indicator;
    bit<3> attributed_quote;
    bit<3> order_capacity;
    bit<3> interest_type;
    bit<3> trading_session_id;
    bit<3> time_in_force;
    bit<3> proactive_if_locked;
    bit<3> self_trade_type;
    bit<4> cancel_instead_of_reprice;
    bit<4> routing_inst;
    bit<4> extended_exec_inst;
    bit<4> exec_inst;
    bit<4> ord_type;
    bit<4> side_bits;
    bit<64> price;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<64> user_data;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<40> deliver_to_comp_id;
    bit<32> max_floor;
    bit<32> locate_broker;
    bit<64> reserved_8;
    bit<64> offset_price;
    bit<64> effective_time;
    bit<16> sub_msg_type_2;
    bit<16> sub_msg_length_2;
    bit<8> routing_strategy;
    bit<216> reserved_27;
}

header order_cancel_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
}

header order_modify_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<32> order_qty;
    bit<8> side;
    bit<8> locate_reqd_u_81;
}

header bulk_cancel_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<32> mmid;
    bit<64> cl_ord_id;
    bit<40> deliver_to_comp_id;
    bit<8> bulk_cancel_type;
    bit<8> side;
}

header symbol_subscription_request_message_t {
    bit<32> symbol_id;
    bit<128> username;
}

header manual_action_response_message_t {
    bit<32> symbol_id;
    bit<64> cl_ord_id;
    bit<32> sess;
    bit<32> value;
    bit<64> seq;
    bit<8> sell_indicator;
    bit<32> intraday_sell_short_qty;
    bit<8> mpsubid_1;
    bit<8> locate_reqd_u_81;
    bit<8> self_trade_type_bits;
    bit<64> user_data;
    bit<8> manual_response_type;
    bit<160> dmm_reject_reason;
}

header risk_limit_update_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker_nul;
    bit<32> mpsubid_4;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_request;
    bit<8> ioc_attribution;
    bit<8> risk_range_id;
    bit<64> risk_minimum_value;
    bit<8> price_scale;
    bit<1520> reserved_190;
}

header risk_action_request_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker_nul;
    bit<32> mpsubid_4;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_action_type;
    bit<8> risk_range_id;
    bit<1592> reserved_199;
}

header equities_symbol_reference_data_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<192> nyse_symbol;
    bit<32> listed_mic;
    bit<8> round_lot_size;
    bit<8> adv_risk_range_id;
    bit<56> reserved_7;
    bit<16> mpv_class_id;
    bit<8> test_symbol_indicator;
}

header dmm_symbol_reference_data_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<192> nyse_symbol;
    bit<64> book;
    bit<32> mpid;
    bit<24> dmm_unit_num;
    bit<16> post;
    bit<64> median_volume;
    bit<64> rd_seq;
    bit<64> ridge_price;
    bit<64> ppp_1;
    bit<64> ppp_2;
    bit<64> ppp_3;
    bit<64> open_on_trade_max_qty;
    bit<64> close_on_trade_max_qty;
    bit<64> lmocp;
}

header minimum_price_variant_class_reference_data_message_t {
    bit<64> transact_time;
    bit<160> mpv_class_name;
    bit<16> mpv_class_id;
    bit<64> rpimpv;
    bit<64> luldmpv;
}

header minimum_price_variant_level_reference_data_message_t {
    bit<64> transact_time;
    bit<192> mpv_level_name;
    bit<64> price;
    bit<64> quoting_mpv;
    bit<64> trading_mpv;
    bit<16> mpv_class_id;
}

header mpid_configuration_message_t {
    bit<64> transact_time;
    bit<8> mpid_status;
    bit<32> mpid;
    bit<128> username;
    bit<400> reserved_50;
}

header mmid_configuration_message_t {
    bit<64> transact_time;
    bit<80> market_maker;
    bit<32> mmid;
    bit<128> username;
    bit<800> reserved_100;
}

header session_configuration_acknowledgement_message_t {
    bit<64> transact_time;
    bit<8> user_session_type;
    bit<8> user_session_status;
    bit<128> username;
    bit<32> mic;
    bit<8> cancel_on_disconnect;
    bit<8> throttle_preference;
    bit<16> throttle_window;
    bit<16> throttle_threshold;
    bit<8> symbol_eligibility;
    bit<32> max_order_quantity;
    bit<8> self_trade_prevention;
    bit<8> order_priority_update_ack_subscription;
    bit<8> ack_status;
    bit<8> bold_designation;
    bit<392> reserved_49;
}

header order_and_cancel_replace_acknowledgement_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<32> mmid;
    bit<8> mpsubid_1;
    bit<64> cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<12> unused_12;
    bit<1> sub_id_indicator;
    bit<4> special_ord_type;
    bit<1> locate_reqd;
    bit<1> retail_indicator;
    bit<3> attributed_quote;
    bit<3> order_capacity;
    bit<3> interest_type;
    bit<3> trading_session_id;
    bit<3> time_in_force;
    bit<3> proactive_if_locked;
    bit<3> self_trade_type;
    bit<4> cancel_instead_of_reprice;
    bit<4> routing_inst;
    bit<4> extended_exec_inst;
    bit<4> exec_inst;
    bit<4> ord_type;
    bit<4> side_bits;
    bit<64> price;
    bit<32> order_qty;
    bit<32> min_qty;
    bit<64> order_id;
    bit<32> leaves_qty;
    bit<64> working_price;
    bit<8> working_away_from_display;
    bit<32> pre_liquidity_indicator;
    bit<16> reason_code;
    bit<8> ack_type;
    bit<1> throttled;
    bit<7> unused_7;
    bit<64> user_data;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<40> deliver_to_comp_id;
    bit<32> max_floor;
    bit<32> locate_broker;
    bit<64> reserved_8;
    bit<64> offset_price;
    bit<64> effective_time;
}

header order_modify_cancel_request_acknowledgment_and_urout_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> ref_cl_ord_id;
    bit<64> orig_cl_ord_id;
    bit<64> price;
    bit<32> order_qty;
    bit<32> leaves_qty;
    bit<8> side;
    bit<8> locate_reqd_u_81;
    bit<16> reason_code;
    bit<8> ack_type;
    bit<1> throttled;
    bit<7> unused_7;
    bit<64> user_data;
}

header order_priority_update_acknowledgment_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> working_price;
    bit<32> order_qty;
    bit<8> working_away_from_display;
    bit<32> pre_liquidity_indicator;
    bit<8> ack_type;
    bit<64> user_data;
}

header execution_report_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<64> deal_id;
    bit<64> last_px;
    bit<32> leaves_qty;
    bit<32> cum_qty;
    bit<32> last_qty;
    bit<32> liquidity_indicator;
    bit<32> displayed_liquidity_indicator;
    bit<8> locate_reqd_u_81;
    bit<8> participant_type;
    bit<16> reason_code;
    bit<64> user_data;
    bit<16> sub_msg_type;
    bit<16> sub_msg_length;
    bit<64> stop_px;
    bit<40> deliver_to_comp_id;
    bit<32> max_floor;
    bit<32> locate_broker;
    bit<64> reserved_8;
    bit<64> offset_price;
    bit<64> effective_time;
    bit<16> sub_msg_type_2;
    bit<16> sub_msg_length_2;
    bit<8> routing_strategy;
    bit<216> reserved_27;
}

header trade_bust_correct_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> order_id;
    bit<64> cl_ord_id;
    bit<32> sess;
    bit<32> value;
    bit<64> seq;
    bit<64> deal_id;
    bit<64> last_px;
    bit<32> last_qty;
    bit<16> reason_code;
    bit<64> user_data;
}

header application_layer_reject_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> mpid;
    bit<64> cl_ord_id;
    bit<16> reason_code;
    bit<8> reject_type;
    bit<64> user_data;
    bit<32> reserved_4;
}

header symbol_subscription_acknowledgement_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<128> username;
    bit<8> subscription_status;
}

header gt_begin_message_t {
    bit<64> transact_time;
}

header gt_end_message_t {
    bit<64> transact_time;
}

header auction_price_data_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<8> imbalance_side;
    bit<8> side_of_unpaired_qty;
    bit<32> imbalance_volume;
    bit<64> price;
    bit<32> paired_qty;
    bit<32> unpaired_qty;
    bit<32> buy_dmm_available_qty;
    bit<32> sell_dmm_available_qty;
}

header auction_request_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<8> auction_type;
    bit<64> ssr_filing_price;
}

header manual_action_request_message_t {
    bit<64> transact_time;
    bit<32> symbol_id;
    bit<32> introducing_badge_id;
    bit<32> mpid;
    bit<32> mmid;
    bit<32> sess;
    bit<32> value;
    bit<64> seq;
    bit<8> side;
    bit<64> price;
    bit<32> dmm_requested_qty;
    bit<32> dmm_available_qty;
    bit<32> dmm_allocated_qty;
    bit<64> ssr_filing_price;
    bit<8> manual_override;
    bit<160> manual_override_reason;
    bit<8> manual_action_type;
}

header risk_control_acknowledgement_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker_nul;
    bit<32> mpsubid_4;
    bit<32> reserved_4;
    bit<40> clearing_number;
    bit<64> cl_ord_id;
    bit<8> risk_ack_type;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<8> risk_control_activation;
    bit<8> risk_action_type;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_response;
    bit<8> ioc_attribution;
    bit<64> usd_calculation_1;
    bit<64> usd_calculation_2;
    bit<64> usd_calculation_3;
    bit<64> usd_calculation_4;
    bit<32> count_calculation;
    bit<8> blocked_by_breach_indicator;
    bit<8> blocked_by_kill_switch_indicator;
    bit<8> reinstatement_required_by_self;
    bit<8> reinstatement_required_by_other;
    bit<8> risk_range_id;
    bit<64> risk_minimum_value;
    bit<8> price_scale;
    bit<1520> reserved_190;
}

header risk_control_alert_message_t {
    bit<32> symbol_id;
    bit<32> mpid;
    bit<80> market_maker_nul;
    bit<32> mpsubid_4;
    bit<40> clearing_number;
    bit<32> risk_user_crd;
    bit<8> risk_user_type;
    bit<8> risk_control_type;
    bit<64> usd_limit;
    bit<32> time_limit;
    bit<32> percentage_limit;
    bit<32> count_limit;
    bit<8> breach_action_response;
    bit<8> ioc_attribution;
    bit<64> usd_calculation_1;
    bit<64> usd_calculation_2;
    bit<64> usd_calculation_3;
    bit<64> usd_calculation_4;
    bit<32> count_calculation;
    bit<8> risk_action_type;
    bit<8> threshold_breach_level;
    bit<8> blocked_by_breach_indicator;
    bit<8> blocked_by_kill_switch_indicator;
    bit<8> reinstatement_required_by_self;
    bit<8> reinstatement_required_by_other;
    bit<1600> reserved_200;
}

struct metadata_t {
}

struct headers_t {
    packet_header_t packet_header;
    session_configuration_request_message_t session_configuration_request_message;
    new_order_single_and_cancel_replace_request_message_t new_order_single_and_cancel_replace_request_message;
    order_cancel_request_message_t order_cancel_request_message;
    order_modify_request_message_t order_modify_request_message;
    bulk_cancel_request_message_t bulk_cancel_request_message;
    symbol_subscription_request_message_t symbol_subscription_request_message;
    manual_action_response_message_t manual_action_response_message;
    risk_limit_update_request_message_t risk_limit_update_request_message;
    risk_action_request_message_t risk_action_request_message;
    equities_symbol_reference_data_message_t equities_symbol_reference_data_message;
    dmm_symbol_reference_data_message_t dmm_symbol_reference_data_message;
    minimum_price_variant_class_reference_data_message_t minimum_price_variant_class_reference_data_message;
    minimum_price_variant_level_reference_data_message_t minimum_price_variant_level_reference_data_message;
    mpid_configuration_message_t mpid_configuration_message;
    mmid_configuration_message_t mmid_configuration_message;
    session_configuration_acknowledgement_message_t session_configuration_acknowledgement_message;
    order_and_cancel_replace_acknowledgement_message_t order_and_cancel_replace_acknowledgement_message;
    order_modify_cancel_request_acknowledgment_and_urout_message_t order_modify_cancel_request_acknowledgment_and_urout_message;
    order_priority_update_acknowledgment_message_t order_priority_update_acknowledgment_message;
    execution_report_message_t execution_report_message;
    trade_bust_correct_message_t trade_bust_correct_message;
    application_layer_reject_message_t application_layer_reject_message;
    symbol_subscription_acknowledgement_message_t symbol_subscription_acknowledgement_message;
    gt_begin_message_t gt_begin_message;
    gt_end_message_t gt_end_message;
    auction_price_data_message_t auction_price_data_message;
    auction_request_message_t auction_request_message;
    manual_action_request_message_t manual_action_request_message;
    risk_control_acknowledgement_message_t risk_control_acknowledgement_message;
    risk_control_alert_message_t risk_control_alert_message;
}

parser NationalequitiesBinarygatewayParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.packet_header);
        transition select(hdr.packet_header.seq_msg_type) {
            16w0x0220: parse_session_configuration_request_message;
            16w0x0240: parse_new_order_single_and_cancel_replace_request_message;
            16w0x0280: parse_order_cancel_request_message;
            16w0x0270: parse_order_modify_request_message;
            16w0x0281: parse_bulk_cancel_request_message;
            16w0x0346: parse_symbol_subscription_request_message;
            16w0x0354: parse_manual_action_response_message;
            16w0x0330: parse_risk_limit_update_request_message;
            16w0x0331: parse_risk_action_request_message;
            16w0x0232: parse_equities_symbol_reference_data_message;
            16w0x0832: parse_dmm_symbol_reference_data_message;
            16w0x0230: parse_minimum_price_variant_class_reference_data_message;
            16w0x0231: parse_minimum_price_variant_level_reference_data_message;
            16w0x0272: parse_mpid_configuration_message;
            16w0x0273: parse_mmid_configuration_message;
            16w0x0221: parse_session_configuration_acknowledgement_message;
            16w0x0260: parse_order_and_cancel_replace_acknowledgement_message;
            16w0x0271: parse_order_modify_cancel_request_acknowledgment_and_urout_message;
            16w0x0262: parse_order_priority_update_acknowledgment_message;
            16w0x0290: parse_execution_report_message;
            16w0x0292: parse_trade_bust_correct_message;
            16w0x0263: parse_application_layer_reject_message;
            16w0x0347: parse_symbol_subscription_acknowledgement_message;
            16w0x0349: parse_gt_begin_message;
            16w0x0350: parse_gt_end_message;
            16w0x0352: parse_auction_price_data_message;
            16w0x0348: parse_auction_request_message;
            16w0x0353: parse_manual_action_request_message;
            16w0x0332: parse_risk_control_acknowledgement_message;
            16w0x0333: parse_risk_control_alert_message;
            default: accept;
        }
    }

    state parse_session_configuration_request_message {
        packet.extract(hdr.session_configuration_request_message);
        transition accept;
    }

    state parse_new_order_single_and_cancel_replace_request_message {
        packet.extract(hdr.new_order_single_and_cancel_replace_request_message);
        transition accept;
    }

    state parse_order_cancel_request_message {
        packet.extract(hdr.order_cancel_request_message);
        transition accept;
    }

    state parse_order_modify_request_message {
        packet.extract(hdr.order_modify_request_message);
        transition accept;
    }

    state parse_bulk_cancel_request_message {
        packet.extract(hdr.bulk_cancel_request_message);
        transition accept;
    }

    state parse_symbol_subscription_request_message {
        packet.extract(hdr.symbol_subscription_request_message);
        transition accept;
    }

    state parse_manual_action_response_message {
        packet.extract(hdr.manual_action_response_message);
        transition accept;
    }

    state parse_risk_limit_update_request_message {
        packet.extract(hdr.risk_limit_update_request_message);
        transition accept;
    }

    state parse_risk_action_request_message {
        packet.extract(hdr.risk_action_request_message);
        transition accept;
    }

    state parse_equities_symbol_reference_data_message {
        packet.extract(hdr.equities_symbol_reference_data_message);
        transition accept;
    }

    state parse_dmm_symbol_reference_data_message {
        packet.extract(hdr.dmm_symbol_reference_data_message);
        transition accept;
    }

    state parse_minimum_price_variant_class_reference_data_message {
        packet.extract(hdr.minimum_price_variant_class_reference_data_message);
        transition accept;
    }

    state parse_minimum_price_variant_level_reference_data_message {
        packet.extract(hdr.minimum_price_variant_level_reference_data_message);
        transition accept;
    }

    state parse_mpid_configuration_message {
        packet.extract(hdr.mpid_configuration_message);
        transition accept;
    }

    state parse_mmid_configuration_message {
        packet.extract(hdr.mmid_configuration_message);
        transition accept;
    }

    state parse_session_configuration_acknowledgement_message {
        packet.extract(hdr.session_configuration_acknowledgement_message);
        transition accept;
    }

    state parse_order_and_cancel_replace_acknowledgement_message {
        packet.extract(hdr.order_and_cancel_replace_acknowledgement_message);
        transition accept;
    }

    state parse_order_modify_cancel_request_acknowledgment_and_urout_message {
        packet.extract(hdr.order_modify_cancel_request_acknowledgment_and_urout_message);
        transition accept;
    }

    state parse_order_priority_update_acknowledgment_message {
        packet.extract(hdr.order_priority_update_acknowledgment_message);
        transition accept;
    }

    state parse_execution_report_message {
        packet.extract(hdr.execution_report_message);
        transition accept;
    }

    state parse_trade_bust_correct_message {
        packet.extract(hdr.trade_bust_correct_message);
        transition accept;
    }

    state parse_application_layer_reject_message {
        packet.extract(hdr.application_layer_reject_message);
        transition accept;
    }

    state parse_symbol_subscription_acknowledgement_message {
        packet.extract(hdr.symbol_subscription_acknowledgement_message);
        transition accept;
    }

    state parse_gt_begin_message {
        packet.extract(hdr.gt_begin_message);
        transition accept;
    }

    state parse_gt_end_message {
        packet.extract(hdr.gt_end_message);
        transition accept;
    }

    state parse_auction_price_data_message {
        packet.extract(hdr.auction_price_data_message);
        transition accept;
    }

    state parse_auction_request_message {
        packet.extract(hdr.auction_request_message);
        transition accept;
    }

    state parse_manual_action_request_message {
        packet.extract(hdr.manual_action_request_message);
        transition accept;
    }

    state parse_risk_control_acknowledgement_message {
        packet.extract(hdr.risk_control_acknowledgement_message);
        transition accept;
    }

    state parse_risk_control_alert_message {
        packet.extract(hdr.risk_control_alert_message);
        transition accept;
    }

}

control NationalequitiesBinarygatewayVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NationalequitiesBinarygatewayIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        standard_metadata.egress_spec = FORWARD_PORT;
    }
}

control NationalequitiesBinarygatewayEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control NationalequitiesBinarygatewayComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control NationalequitiesBinarygatewayDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.packet_header);
        packet.emit(hdr.session_configuration_request_message);
        packet.emit(hdr.new_order_single_and_cancel_replace_request_message);
        packet.emit(hdr.order_cancel_request_message);
        packet.emit(hdr.order_modify_request_message);
        packet.emit(hdr.bulk_cancel_request_message);
        packet.emit(hdr.symbol_subscription_request_message);
        packet.emit(hdr.manual_action_response_message);
        packet.emit(hdr.risk_limit_update_request_message);
        packet.emit(hdr.risk_action_request_message);
        packet.emit(hdr.equities_symbol_reference_data_message);
        packet.emit(hdr.dmm_symbol_reference_data_message);
        packet.emit(hdr.minimum_price_variant_class_reference_data_message);
        packet.emit(hdr.minimum_price_variant_level_reference_data_message);
        packet.emit(hdr.mpid_configuration_message);
        packet.emit(hdr.mmid_configuration_message);
        packet.emit(hdr.session_configuration_acknowledgement_message);
        packet.emit(hdr.order_and_cancel_replace_acknowledgement_message);
        packet.emit(hdr.order_modify_cancel_request_acknowledgment_and_urout_message);
        packet.emit(hdr.order_priority_update_acknowledgment_message);
        packet.emit(hdr.execution_report_message);
        packet.emit(hdr.trade_bust_correct_message);
        packet.emit(hdr.application_layer_reject_message);
        packet.emit(hdr.symbol_subscription_acknowledgement_message);
        packet.emit(hdr.gt_begin_message);
        packet.emit(hdr.gt_end_message);
        packet.emit(hdr.auction_price_data_message);
        packet.emit(hdr.auction_request_message);
        packet.emit(hdr.manual_action_request_message);
        packet.emit(hdr.risk_control_acknowledgement_message);
        packet.emit(hdr.risk_control_alert_message);
    }
}

V1Switch(
    NationalequitiesBinarygatewayParser(),
    NationalequitiesBinarygatewayVerifyChecksum(),
    NationalequitiesBinarygatewayIngress(),
    NationalequitiesBinarygatewayEgress(),
    NationalequitiesBinarygatewayComputeChecksum(),
    NationalequitiesBinarygatewayDeparser()
) main;
