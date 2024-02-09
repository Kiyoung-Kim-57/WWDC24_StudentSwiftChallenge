import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView{
                PuzzleSelectView()
                    .tabItem {
                        Image(systemName: "moon.stars")
                        Text("Star Puzzle")
                    }
                Text("Info")
                    .tabItem {
                        Image(systemName: "quote.bubble")
                        Text("Information")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

