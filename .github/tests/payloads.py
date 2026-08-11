# Generated transport payload extraction for pcap captures (standard library only)

import struct


def of(path):
    result = []

    with open(path, "rb") as capture:
        data = capture.read()

    if len(data) < 24:
        return result

    magic = data[:4]
    order = "<" if magic in (b"\xd4\xc3\xb2\xa1", b"\x4d\x3c\xb2\xa1") else ">" if magic in (b"\xa1\xb2\xc3\xd4", b"\xa1\xb2\x3c\x4d") else None
    if order is None:
        return result

    offset = 24
    while offset + 16 <= len(data):
        _, _, included, _ = struct.unpack(order + "IIII", data[offset:offset + 16])
        offset += 16
        payload = transport(data[offset:offset + included])
        offset += included

        if payload:
            result.append(payload)

    return result


def transport(frame):
    if len(frame) < 14:
        return None

    kind = struct.unpack(">H", frame[12:14])[0]
    packet = frame[14:]

    if kind == 0x8100:
        kind = struct.unpack(">H", frame[16:18])[0]
        packet = frame[18:]

    if kind != 0x0800 or len(packet) < 20:
        return None

    length = (packet[0] & 0x0f) * 4
    protocol = packet[9]
    segment = packet[length:]

    if protocol == 17 and len(segment) >= 8:
        return segment[8:]
    if protocol == 6 and len(segment) >= 20:
        return segment[((segment[12] >> 4) * 4):]

    return None
