import Foundation
import BinaryCodable

public protocol Packet: Codable, Hashable {
    static func decode(registry: PacketRegistry, data: Data) throws -> any Packet

    static func decode(type: any Packet.Type, data: Data) throws -> any Packet
}

public typealias PacketRegistry = [UInt8 : any Packet.Type]
public let packetEncoder: ProtobufEncoder = .init()
public let packetDecoder: ProtobufDecoder = .init()

extension Packet {    
    public func encode() throws -> Data {
        return try packetEncoder.encode(self)
    }
}

extension Packet {
    public static func decode(registry: PacketRegistry, data: Data) throws -> any Packet {
        throw PacketDecodingError.invalidPacketInstance
    }
    
    public static func decode(type: any Packet.Type, data: Data) throws -> any Packet {
        return try packetDecoder.decode(type, from: data)
    }
}
