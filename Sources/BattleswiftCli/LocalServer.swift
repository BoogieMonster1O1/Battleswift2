import Foundation
import Battleswift

class LocalServer: GameServer {
    var game: Game?
    var serverPlayer: Player

    init(username: String) {
        self.serverPlayer = Player(username: username)
    }
    
    func getMaxGames() -> Int {
        return 1
    }

    func getGames() -> [Game] {
        if let game = game {
            return [game]
        }

        return []
    }
}
