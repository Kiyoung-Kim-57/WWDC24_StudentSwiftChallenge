import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink(destination: SimulatorView()
                    .ignoresSafeArea()) { Text("Simulator") }
                
            }
            .navigationTitle("Menu")
        })
    }
}

#Preview {
    ContentView()
}
