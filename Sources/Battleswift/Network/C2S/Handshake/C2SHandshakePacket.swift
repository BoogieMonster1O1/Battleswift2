import Foundation

public struct C2SHandshakePacket: Packet {
    let protocolVersion: Int

    public enum CodingKeys: Int, CodingKey {
        case protocolVersion = 1
    }
}
