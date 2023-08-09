import Foundation
import Battleswift

class LocalServer: GameServer {
    var game: Game?
    
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
