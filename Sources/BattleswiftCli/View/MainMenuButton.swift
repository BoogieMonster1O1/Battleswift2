import SwiftTUI

struct MainMenuButton: View {
    var mode: GameMode
    var function: (GameMode) -> Void
    
    var body: some View {
        HStack {
            Button(mode.text) {
                function(mode)
            }
              .frame(maxWidth: 2147483647)
              .border()
        }
    }
}
