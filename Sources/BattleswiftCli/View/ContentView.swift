import SwiftTUI

struct ContentView: View {
    @State var gameMode: GameMode = .no
    
    var body: some View {
        if gameMode == .no {
            MainMenuView() { self.gameMode = $0 }
        } else if gameMode == .singleplayer {
            SingleplayerView()
        } else if gameMode == .lan {
            Text("lan")
        } else if gameMode == .internet {
            Text("internet")
        }
    }
}
