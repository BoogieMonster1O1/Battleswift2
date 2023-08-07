import Foundation
import BinaryCodable

public protocol Packet: Codable, Hashable {
}

let packetEncoder: BinaryEncoder = .init()

extension Packet {
    func encode() throws -> Data {
        return try packetEncoder.encode(self)
    }
}
