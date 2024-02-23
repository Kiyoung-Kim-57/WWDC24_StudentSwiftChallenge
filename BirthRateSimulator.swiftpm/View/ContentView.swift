import SwiftUI

struct ContentView: View {
    @ObservedObject var resultViewModel: ResultViewModel = ResultViewModel()
    var body: some View {
        
        NavigationSplitView{
            List{
                NavigationLink{
                    SimulatorView(resultViewModel: resultViewModel)
                        .ignoresSafeArea()
                } label: {
                    HStack{
                        Image(systemName: "play.circle")
                        Text("Simulator").font(.system(size: 25))
                    }
                }
                NavigationLink{
                    ResultView(resultViewModel: resultViewModel)
                        .ignoresSafeArea()
                } label: {
                    HStack{
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Result Charts").font(.system(size: 25))
                    }
                }
            }
            
            
        } detail: {
            StartView()
                
        }
        
        
        
        
        
        
        
//        .tint()
        
    }
}

#Preview {
    ContentView()
}
