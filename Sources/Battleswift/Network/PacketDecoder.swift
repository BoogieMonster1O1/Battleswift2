import Foundation
import BinaryCodable

public struct PacketDecoder {
    public static let packetDecoder: ProtobufDecoder = .init()
    
    public static func decode(registry: PacketRegistry, data: Data) throws -> any Packet {
        throw PacketDecodingError.invalidPacketInstance
    }
    
    public static func decode(type: any Packet.Type, data: Data) throws -> any Packet {
        return try Self.packetDecoder.decode(type, from: data)
    }
}
