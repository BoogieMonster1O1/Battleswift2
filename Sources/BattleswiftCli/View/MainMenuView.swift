import SwiftTUI

struct MainMenuView: View {
    var function: (GameMode) -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Battleswift")
            
            VStack {
                MainMenuButton(mode: .singleplayer, function: function)
                MainMenuButton(mode: .lan, function: function)
                MainMenuButton(mode: .internet, function: function)
            }
        }
    }
}
