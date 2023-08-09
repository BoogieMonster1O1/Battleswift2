import Foundation

public class Game {
    public let player1: Player
    public let player2: Player
    public let player1Board: Board
    public let player2Board: Board
    
    public init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.player1Board = Board()
        self.player2Board = Board()
    }
}
