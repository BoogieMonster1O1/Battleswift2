import Foundation
import NIO

public class DedicatedServer: GameServer {
    public var properties: ServerProperties

    private var games: [Game] = []
    private let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

    @Lateinit public var thread: Thread
    
    public init(properties: ServerProperties) {
        self.properties = properties
    }        

    public func start() {
        let serverBootstrap = ServerBootstrap(group: eventLoopGroup)
          .serverChannelOption(ChannelOptions.backlog, value: 256)
          .serverChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
          .childChannelInitializer { channel in
              channel.pipeline.addHandler(ServerboundChannelHandler())
          }
          .childChannelOption(ChannelOptions.socket(IPPROTO_TCP, TCP_NODELAY), value: 1)
          .childChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
    }

    public func loop() {
        
    }

    public func stop() {

    }

    public func getGames() -> [Game] {
        return self.games
    }
}
