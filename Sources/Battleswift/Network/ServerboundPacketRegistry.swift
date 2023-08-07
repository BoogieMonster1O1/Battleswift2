import Foundation

class ServerboundPacketRegistry {
    let handshake: [UInt8 : any Packet.Type] = [
      0x01: C2SHandshakePacket.self
    ]
}
