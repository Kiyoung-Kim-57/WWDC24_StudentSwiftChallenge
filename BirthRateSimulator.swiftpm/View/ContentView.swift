import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView{
            List{
                NavigationLink{
                    SimulatorView()
                        .ignoresSafeArea()
                } label: { Text("Simulator") }
            }
        } detail: {
            Text("Birth Rate Simulator")
        }
            
            
    }
}

#Preview {
    ContentView()
}
