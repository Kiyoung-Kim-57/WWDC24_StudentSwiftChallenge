import SwiftUI

struct ContentView: View {
    @ObservedObject var resultViewModel: ResultViewModel = ResultViewModel()
    @State var isTutorialOn = false
    var body: some View {
        ZStack{
            NavigationSplitView{
                List{
                    NavigationLink{
                        StartView(isTutorialOn: $isTutorialOn)
                            .ignoresSafeArea()
                    } label: {
                        HStack{
                            Image(systemName: "house")
                            Text("Home").font(.system(size: 25))
                        }
                    }
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
                StartView(isTutorialOn: $isTutorialOn)
            }
            if isTutorialOn {
                OnboardingView(isTutorialOn: $isTutorialOn)
                    .ignoresSafeArea()
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
