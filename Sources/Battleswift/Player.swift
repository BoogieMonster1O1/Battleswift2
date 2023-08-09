import Foundation

open class Player {
    public let username: String
    public var currentGame: Game? = nil

    public init(username: String) {
        self.username = username
    }
    
    public func isInGame() -> Bool {
        return currentGame != nil;
    }
}
