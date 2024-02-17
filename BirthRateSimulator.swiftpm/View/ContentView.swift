import SwiftUI

struct ContentView: View {
    @ObservedObject var resultViewModel: ResultViewModel = ResultViewModel()
    var body: some View {
        HStack{
            NavigationSplitView{
                List{
                    NavigationLink{
                        SimulatorView(resultViewModel: resultViewModel)
                            .ignoresSafeArea()
                    } label: { Text("Simulator") }
                    NavigationLink{
                        ResultView(resultViewModel: resultViewModel)
                            .ignoresSafeArea()
                    } label: { Text("Result Charts") }
                }
            } detail: {
                StartView()
            }
        }
    }
}

#Preview {
    ContentView()
}
