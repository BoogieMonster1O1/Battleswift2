import Foundation

public struct ServerboundPacketRegistry {
    public static let handshake: PacketRegistry = [
      0x01: C2SHandshakePacket.self
    ]
    public static let login: PacketRegistry = [:]
    public static let play: PacketRegistry = [:]
}
