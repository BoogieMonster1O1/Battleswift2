import Foundation
import BinaryCodable

public protocol Packet: Codable, Hashable {
}

public typealias PacketRegistry = [UInt8 : any Packet.Type]
public let packetEncoder: ProtobufEncoder = .init()

extension Packet {
    public func encode() throws -> Data {
        return try packetEncoder.encode(self)
    }
}
