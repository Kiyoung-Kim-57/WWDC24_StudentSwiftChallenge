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
                Text("setting")
                    .tabItem { 
                        Image(systemName: "gearshape")
                        Text("Setting")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
