import Foundation
import Battleswift

public class Game {
    let player1: Player
    let player2: Player
    let player1Board: Board
    let player2Board: Board
    
    public init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.player1Board = Board()
        self.player2Board = Board()
    }
}
