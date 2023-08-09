enum GameMode: Int {
    case no = -1
    case singleplayer = 0
    case lan = 1
    case internet = 2

    var text: String {
        switch (self) {
        case .no:
            return "no"
        case .singleplayer:
            return "Singleplayer - Play against AI"
        case .lan:
            return "Multiplayer - Play on LAN"
        case .internet:
            return "Multiplayer - Play on internet"
        }
    }
}
