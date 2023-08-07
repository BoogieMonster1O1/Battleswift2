import Foundation
import BinaryCodable

public protocol Packet: Codable, Hashable {
    func encode() -> BinaryInteger
}
