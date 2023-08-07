import Foundation

public struct S2CHandshakePacket: Packet {
    let status: Int

    public enum HandshakeStatus: Int {
        case ok = 0
        case clientOutdated = 1 // ok boomer
        case serverOutdated = 2 // ok zoomer
        case alreadyConnected = 3
    }
}
