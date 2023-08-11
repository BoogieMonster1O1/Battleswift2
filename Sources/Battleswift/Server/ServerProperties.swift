import Foundation

public struct ServerProperties: Codable {
    public static let `default`: ServerProperties = .init(
      address: "::1", // loopback ftw
      port: 54332,
      maxGames: 1
    )
    
    public let address: String
    public let port: Int
    public let maxGames: Int

    public static func loadProperties() -> (ServerProperties, Error?) {
        let fileManager = FileManager.default
        let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        let propertiesURL = currentDirectoryURL.appendingPathComponent("properties.json")

        guard let data = try? Data(contentsOf: propertiesURL) else {
            return (ServerProperties.`default`, PropertiesLoadingError.couldNotRead)
        }
        
        if let properties = try? JSONDecoder().decode(ServerProperties.self, from: data) {
            return (properties, nil)
        } else {
            return (ServerProperties.default, PropertiesLoadingError.malformed)
        }
    }

    public func saveProperties() {
        let fileManager = FileManager.default
        let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        let propertiesURL = currentDirectoryURL.appendingPathComponent("properties.json")
    
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
    
        if let data = try? encoder.encode(self) {
            try? data.write(to: propertiesURL)
        }
    }

    public enum PropertiesLoadingError: Error {
        case notFound
        case couldNotRead
        case malformed
    }
}
