import Foundation

public enum NetworkState: Int {
    case handshake = 0
    case login = 1
    case play = 2

    public func getServerboundPacketRegistry() -> PacketRegistry {
        switch (self) {
        case .handshake:
            return ServerboundPacketRegistry.handshake
        case .login:
            return ServerboundPacketRegistry.login
        case .play:
            return ServerboundPacketRegistry.play
        }
    }
}
