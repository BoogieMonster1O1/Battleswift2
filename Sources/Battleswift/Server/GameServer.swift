import Foundation

public protocol GameServer {
    func getMaxGames() -> Int

    func getGames() -> [Game]
}
