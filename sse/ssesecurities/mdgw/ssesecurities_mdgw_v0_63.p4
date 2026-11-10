// P4_16 (v1model) definition for: Sse SseSecurities Mdgw Is120 v0.63
// 
// Protocol:
//   Organization: Shanghai Stock Exchange
//   Protocol: Market Data Gateway
//   Encoding: IS120 Market Data Gateway Binary
//   Version: 0.63
//   Date: 9/18/2026
//   Specification: 03ec823b9825422ba4c74e2f5cb3c42e.pdf
// 
// Byte order: big (P4 extracts in network/big-endian order)
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
//   https://patents.google.com/patent/US20240129382A1/en
//   https://patents.google.com/patent/US20240419416A1/en
// 
// Open Markets Initiative website: https://openmarketsinitiative.com

#include <core.p4>
#include <v1model.p4>

#define MAX_MESSAGES 64
#define FORWARD_PORT 1

header standard_header_t {
    bit<32> msgtype;
    bit<64> sendingtime;
    bit<64> msgseqnum;
    bit<32> bodylength;
}

header logon_message_t {
    bit<256> sendercompid;
    bit<256> targetcompid;
    bit<16> heartbtint;
    bit<64> applverid;
}

header logout_message_t {
    bit<32> sessionstatus;
    bit<2048> text;
}

header channel_heartbeat_t {
    bit<8> channel_heartbeat_securitytype;
    bit<16> channel_heartbeat_channelno;
    bit<64> appllastseqnum;
    bit<8> endofchannel;
}

header retransmission_message_t {
    bit<16> retransmission_message_channelno;
    bit<8> resendtype;
    bit<64> applbegseqnum;
    bit<64> applendseqnum;
    bit<8> resendstatus;
    bit<256> rejecttext;
}

header market_status_message_t {
    bit<8> market_status_message_securitytype;
    bit<8> tradsesmode;
    bit<64> tradingsessionid;
    bit<32> totnorelatedsym;
}

header market_data_snapshot_message_t {
    bit<8> market_data_snapshot_message_securitytype;
    bit<8> tradsesmode;
    bit<32> tradedate;
    bit<32> lastupdatetime;
    bit<40> mdstreamid;
    bit<64> securityid;
    bit<64> symbol;
    bit<64> preclosepx;
    bit<64> totalvolumetraded;
    bit<64> numtrades;
    bit<64> market_data_snapshot_message_totalvaluetraded;
    bit<64> tradingphasecode;
}

header index_market_data_snapshot_extension_fields_t {
    bit<16> nomdentries;
}

header index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_t {
    bit<16> index_market_data_snapshot_entries_mdentrytype;
    bit<64> index_market_data_snapshot_entries_mdentrypx;
}

header market_data_snapshot_extension_fields_t {
    bit<16> nomdentries;
}

header market_data_snapshot_extension_fields_market_data_snapshot_entries_t {
    bit<16> market_data_snapshot_entries_mdentrytype;
    bit<64> market_data_snapshot_entries_mdentrypx;
    bit<64> mdentrysize;
    bit<8> mdentrypositionno;
}

header tickbytick_market_data_message_t {
    bit<8> tickbytick_market_data_message_securitytype;
    bit<16> tickbytick_market_data_message_channelno;
    bit<64> applseqnum;
    bit<40> mdstreamid;
    bit<64> securityid;
    bit<32> transacttime;
    bit<8> exectype;
    bit<64> price;
    bit<64> orderqty;
}

header tickbytick_order_market_data_extension_fields_t {
    bit<8> side;
    bit<144> quoteid;
    bit<96> memberid;
    bit<96> tradercode;
    bit<8> fullamounttrade;
    bit<8> settltype;
    bit<32> contractmultiplier;
    bit<16> expirationdays;
    bit<64> tickbytick_order_market_data_extension_fields_totalvaluetraded;
    bit<128> basketid;
    bit<256> investorname;
    bit<8> bidtranstype;
    bit<8> bidexecinsttype;
    bit<32> expiredate;
    bit<144> secondaryorderid;
    bit<64> minqty;
}

header tickbytick_trade_market_data_extension_fields_t {
    bit<144> bidapplseqnum;
    bit<144> offerapplseqnum;
    bit<64> tickbytick_trade_market_data_extension_fields_totalvaluetraded;
    bit<8> trademethod;
    bit<64> marginprice;
}

struct metadata_t {
    bit<1> dispatched;
    bit<16> index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_remaining;
    bit<16> market_data_snapshot_extension_fields_market_data_snapshot_entries_remaining;
}

struct headers_t {
    standard_header_t standard_header;
    logon_message_t logon_message;
    logout_message_t logout_message;
    channel_heartbeat_t channel_heartbeat;
    retransmission_message_t retransmission_message;
    market_status_message_t market_status_message;
    market_data_snapshot_message_t market_data_snapshot_message;
    index_market_data_snapshot_extension_fields_t index_market_data_snapshot_extension_fields;
    index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_t index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries[MAX_MESSAGES];
    market_data_snapshot_extension_fields_t market_data_snapshot_extension_fields;
    market_data_snapshot_extension_fields_market_data_snapshot_entries_t market_data_snapshot_extension_fields_market_data_snapshot_entries[MAX_MESSAGES];
    tickbytick_market_data_message_t tickbytick_market_data_message;
    tickbytick_order_market_data_extension_fields_t tickbytick_order_market_data_extension_fields;
    tickbytick_trade_market_data_extension_fields_t tickbytick_trade_market_data_extension_fields;
}

parser SsesecuritiesMdgwParser(packet_in packet, out headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    state start {
        packet.extract(hdr.standard_header);
        transition select(hdr.standard_header.msgtype) {
            32w0x53303031: parse_logon_message;
            32w0x53303032: parse_logout_message;
            32w0x53303033: parse_heartbeat_message;
            32w0x50303031: parse_channel_heartbeat;
            32w0x50303032: parse_retransmission_message;
            32w0x4d313031: parse_market_status_message;
            32w0x4d313032: parse_market_data_snapshot_message;
            32w0x4d323031: parse_tickbytick_market_data_message;
            default: accept;
        }
    }

    state parse_logon_message {
        packet.extract(hdr.logon_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_logout_message {
        packet.extract(hdr.logout_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_heartbeat_message {
        meta.dispatched = 1;
        transition accept;
    }

    state parse_channel_heartbeat {
        packet.extract(hdr.channel_heartbeat);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_retransmission_message {
        packet.extract(hdr.retransmission_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_status_message {
        packet.extract(hdr.market_status_message);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_market_data_snapshot_message {
        packet.extract(hdr.market_data_snapshot_message);
        meta.dispatched = 1;
        transition select(hdr.market_data_snapshot_message.mdstreamid) {
            40w0x4d44303031: parse_index_market_data_snapshot_extension_fields;
            40w0x4d44303032: parse_market_data_snapshot_extension_fields;
            40w0x4d44303033: parse_market_data_snapshot_extension_fields;
            40w0x4d44303034: parse_market_data_snapshot_extension_fields;
            40w0x4d44313031: parse_market_data_snapshot_extension_fields;
            40w0x4d44313032: parse_market_data_snapshot_extension_fields;
            40w0x4d44333031: parse_market_data_snapshot_extension_fields;
            40w0x4d44323031: parse_market_data_snapshot_extension_fields;
            40w0x4d44453031: parse_market_data_snapshot_extension_fields;
            40w0x4d44323130: parse_market_data_snapshot_extension_fields;
            default: accept;
        }
    }

    state parse_index_market_data_snapshot_extension_fields {
        packet.extract(hdr.index_market_data_snapshot_extension_fields);
        meta.dispatched = 1;
        meta.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_remaining = hdr.index_market_data_snapshot_extension_fields.nomdentries;
        transition select(meta.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_remaining) {
            16w0: accept;
            default: parse_index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries;
        }
    }

    state parse_index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries {
        packet.extract(hdr.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries.next);
        meta.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_remaining = meta.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_remaining - 1;
        transition select(meta.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries_remaining) {
            16w0: accept;
            default: parse_index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries;
        }
    }

    state parse_market_data_snapshot_extension_fields {
        packet.extract(hdr.market_data_snapshot_extension_fields);
        meta.dispatched = 1;
        meta.market_data_snapshot_extension_fields_market_data_snapshot_entries_remaining = hdr.market_data_snapshot_extension_fields.nomdentries;
        transition select(meta.market_data_snapshot_extension_fields_market_data_snapshot_entries_remaining) {
            16w0: accept;
            default: parse_market_data_snapshot_extension_fields_market_data_snapshot_entries;
        }
    }

    state parse_market_data_snapshot_extension_fields_market_data_snapshot_entries {
        packet.extract(hdr.market_data_snapshot_extension_fields_market_data_snapshot_entries.next);
        meta.market_data_snapshot_extension_fields_market_data_snapshot_entries_remaining = meta.market_data_snapshot_extension_fields_market_data_snapshot_entries_remaining - 1;
        transition select(meta.market_data_snapshot_extension_fields_market_data_snapshot_entries_remaining) {
            16w0: accept;
            default: parse_market_data_snapshot_extension_fields_market_data_snapshot_entries;
        }
    }

    state parse_tickbytick_market_data_message {
        packet.extract(hdr.tickbytick_market_data_message);
        meta.dispatched = 1;
        transition select(hdr.tickbytick_market_data_message.mdstreamid) {
            40w0x4d44323131: parse_tickbytick_order_market_data_extension_fields;
            40w0x4d44323132: parse_tickbytick_order_market_data_extension_fields;
            40w0x4d44323133: parse_tickbytick_order_market_data_extension_fields;
            40w0x4d44323134: parse_tickbytick_order_market_data_extension_fields;
            40w0x4d44323135: parse_tickbytick_order_market_data_extension_fields;
            40w0x4d44323136: parse_tickbytick_order_market_data_extension_fields;
            40w0x4d44323137: parse_tickbytick_trade_market_data_extension_fields;
            default: accept;
        }
    }

    state parse_tickbytick_order_market_data_extension_fields {
        packet.extract(hdr.tickbytick_order_market_data_extension_fields);
        meta.dispatched = 1;
        transition accept;
    }

    state parse_tickbytick_trade_market_data_extension_fields {
        packet.extract(hdr.tickbytick_trade_market_data_extension_fields);
        meta.dispatched = 1;
        transition accept;
    }

}

control SsesecuritiesMdgwVerifyChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SsesecuritiesMdgwIngress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (meta.dispatched == 1) {
            standard_metadata.egress_spec = FORWARD_PORT;
        }
        else {
            mark_to_drop(standard_metadata);
        }
    }
}

control SsesecuritiesMdgwEgress(inout headers_t hdr, inout metadata_t meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}

control SsesecuritiesMdgwComputeChecksum(inout headers_t hdr, inout metadata_t meta) {
    apply {
    }
}

control SsesecuritiesMdgwDeparser(packet_out packet, in headers_t hdr) {
    apply {
        packet.emit(hdr.standard_header);
        packet.emit(hdr.logon_message);
        packet.emit(hdr.logout_message);
        packet.emit(hdr.channel_heartbeat);
        packet.emit(hdr.retransmission_message);
        packet.emit(hdr.market_status_message);
        packet.emit(hdr.market_data_snapshot_message);
        packet.emit(hdr.index_market_data_snapshot_extension_fields);
        packet.emit(hdr.index_market_data_snapshot_extension_fields_index_market_data_snapshot_entries);
        packet.emit(hdr.market_data_snapshot_extension_fields);
        packet.emit(hdr.market_data_snapshot_extension_fields_market_data_snapshot_entries);
        packet.emit(hdr.tickbytick_market_data_message);
        packet.emit(hdr.tickbytick_order_market_data_extension_fields);
        packet.emit(hdr.tickbytick_trade_market_data_extension_fields);
    }
}

V1Switch(
    SsesecuritiesMdgwParser(),
    SsesecuritiesMdgwVerifyChecksum(),
    SsesecuritiesMdgwIngress(),
    SsesecuritiesMdgwEgress(),
    SsesecuritiesMdgwComputeChecksum(),
    SsesecuritiesMdgwDeparser()
) main;
