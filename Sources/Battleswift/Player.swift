import Foundation
import Battleswift

public class Player {
    var currentGame: Game? = nil

    func isInGame() -> Bool {
        return currentGame != nil;
    }
}
