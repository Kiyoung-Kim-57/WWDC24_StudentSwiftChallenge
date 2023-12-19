import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView{
                Text("test")
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
