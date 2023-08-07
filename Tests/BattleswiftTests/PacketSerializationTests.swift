import XCTest
@testable import Battleswift

final class PacketSerializationTests {
    func testSerial() throws {
        let packet: C2SHandshakePacket = .init(protocolVersion: 100)
        let data = try packet.encode()
        let newPacket = try PacketDecoder.decode(type: C2SHandshakePacket.self, data: data) as! C2SHandshakePacket
        XCTAssertEqual(packet.protocolVersion, newPacket.protocolVersion)
    }
}
