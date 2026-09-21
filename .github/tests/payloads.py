# Generated transport payload extraction for pcap captures (standard library only)

import struct


def of(path):
    result = []

    with open(path, "rb") as capture:
        data = capture.read()

    for link, frame in frames(data):
        payload = transport(link, frame)

        if payload:
            result.append(payload)

    return result


def frames(data):
    """The frames of a capture with the link type each was taken on: a classic pcap records, or a pcapng packet blocks, told apart by the first four bytes."""
    if data[:4] == b"\x0a\x0d\x0d\x0a":
        yield from blocks(data)
        return

    magic = data[:4]
    order = "<" if magic in (b"\xd4\xc3\xb2\xa1", b"\x4d\x3c\xb2\xa1") else ">" if magic in (b"\xa1\xb2\xc3\xd4", b"\xa1\xb2\x3c\x4d") else None
    if order is None or len(data) < 24:
        return

    link = struct.unpack(order + "I", data[20:24])[0] & 0x0fffffff
    offset = 24
    while offset + 16 <= len(data):
        _, _, included, _ = struct.unpack(order + "IIII", data[offset:offset + 16])
        yield link, data[offset + 16:offset + 16 + included]
        offset += 16 + included


def blocks(data):
    """Pcapng: blocks of a type, a length, a body and the length again. The section header states the byte order, an interface description its link type, and an enhanced (6) or simple (3) packet block holds one frame."""
    order = "<"
    links = []
    offset = 0

    while offset + 12 <= len(data):
        kind = struct.unpack("<I", data[offset:offset + 4])[0]

        if kind == 0x0a0d0d0a:
            order = "<" if data[offset + 8:offset + 12] == b"\x4d\x3c\x2b\x1a" else ">"
            links = []

        length = struct.unpack(order + "I", data[offset + 4:offset + 8])[0]

        if length < 12 or offset + length > len(data):
            return

        if kind == 1:
            links.append(struct.unpack(order + "H", data[offset + 8:offset + 10])[0])
        elif kind == 6:
            interface, _, _, captured = struct.unpack(order + "IIII", data[offset + 8:offset + 24])
            yield (links[interface] if interface < len(links) else 1), data[offset + 28:offset + 28 + captured]
        elif kind == 3:
            original = struct.unpack(order + "I", data[offset + 8:offset + 12])[0]
            yield (links[0] if links else 1), data[offset + 12:offset + 12 + min(original, length - 16)]

        offset += length


def transport(link, frame):
    """The transport payload of a frame: the ip packet its link type carries, cut to the length ip states, then the udp or tcp data."""
    if link == 113:
        packet = frame[16:] if len(frame) >= 16 and frame[14:16] == b"\x08\x00" else None
    elif link == 276:
        packet = frame[20:] if len(frame) >= 20 and frame[0:2] == b"\x08\x00" else None
    elif link == 0:
        packet = frame[4:] if len(frame) >= 4 else None
    elif link == 101:
        packet = frame
    else:
        packet = ethernet(frame)

    if packet is None or len(packet) < 20 or packet[0] >> 4 != 4:
        return None

    total = struct.unpack(">H", packet[2:4])[0]
    packet = packet[:total] if 20 <= total <= len(packet) else packet
    length = (packet[0] & 0x0f) * 4
    protocol = packet[9]
    segment = packet[length:]

    if protocol == 17 and len(segment) >= 8:
        return segment[8:]
    if protocol == 6 and len(segment) >= 20:
        return segment[((segment[12] >> 4) * 4):]

    return None


def ethernet(frame):
    """The ip packet of an ethernet frame, stepping over any 802.1Q vlan tags; None when the frame carries something else."""
    if len(frame) < 14:
        return None

    kind = struct.unpack(">H", frame[12:14])[0]
    packet = frame[14:]

    while kind in (0x8100, 0x88a8) and len(packet) >= 4:
        kind = struct.unpack(">H", packet[2:4])[0]
        packet = packet[4:]

    return packet if kind == 0x0800 else None
