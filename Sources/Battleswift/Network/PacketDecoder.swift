import Foundation
import BinaryCodable

public struct PacketDecoder {
    public static let packetDecoder: ProtobufDecoder = .init()
    
    public static func decode(registry: PacketRegistry, data: Data) throws -> any Packet {
        throw PacketDecodingError.invalidPacketInstance
    }
    
    public static func decode<T: Packet>(type: T.Type, data: Data) throws -> T {
        return try packetDecoder.decode(type, from: data)
    }
}
