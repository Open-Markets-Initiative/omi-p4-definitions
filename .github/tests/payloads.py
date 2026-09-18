# Generated transport payload extraction for pcap captures (standard library only)

import struct


def of(path):
    result = []

    with open(path, "rb") as capture:
        data = capture.read()

    for frame in frames(data):
        payload = transport(frame)

        if payload:
            result.append(payload)

    return result


def frames(data):
    """The frames of a capture: a classic pcap records, or a pcapng packet blocks, told apart by the first four bytes."""
    if data[:4] == b"\x0a\x0d\x0d\x0a":
        yield from blocks(data)
        return

    magic = data[:4]
    order = "<" if magic in (b"\xd4\xc3\xb2\xa1", b"\x4d\x3c\xb2\xa1") else ">" if magic in (b"\xa1\xb2\xc3\xd4", b"\xa1\xb2\x3c\x4d") else None
    if order is None or len(data) < 24:
        return

    offset = 24
    while offset + 16 <= len(data):
        _, _, included, _ = struct.unpack(order + "IIII", data[offset:offset + 16])
        yield data[offset + 16:offset + 16 + included]
        offset += 16 + included


def blocks(data):
    """Pcapng: blocks of a type, a length, a body and the length again. The section header states the byte order; an enhanced (6) or simple (3) packet block holds one frame."""
    order = "<"
    offset = 0

    while offset + 12 <= len(data):
        kind = struct.unpack("<I", data[offset:offset + 4])[0]

        if kind == 0x0a0d0d0a:
            order = "<" if data[offset + 8:offset + 12] == b"\x4d\x3c\x2b\x1a" else ">"

        length = struct.unpack(order + "I", data[offset + 4:offset + 8])[0]

        if length < 12 or offset + length > len(data):
            return

        if kind == 6:
            captured = struct.unpack(order + "I", data[offset + 20:offset + 24])[0]
            yield data[offset + 28:offset + 28 + captured]
        elif kind == 3:
            original = struct.unpack(order + "I", data[offset + 8:offset + 12])[0]
            yield data[offset + 12:offset + 12 + min(original, length - 16)]

        offset += length


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
