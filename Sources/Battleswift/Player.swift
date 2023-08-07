import Foundation

public class Player {
    var currentGame: Game? = nil

    func isInGame() -> Bool {
        return currentGame != nil;
    }
}
