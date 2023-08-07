import Foundation

public struct C2SHandshakePacket: Codable, Hashable {
    let protocolVersion: Int

    public enum CodingKeys: Int, CodingKey {
        case protocolVersion = 1
    }
}
