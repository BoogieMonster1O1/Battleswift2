import Foundation

public protocol GameServer {
    var properties: ServerProperties { get }
    
    func getGames() -> [Game]

    func start()
    
    func loop()

    func stop()
}
