//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 2/22/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isTutorialOn: Bool
    var body: some View {
        ZStack{
            Color.white
            TabView{
                SimulatorTutorialView()
                ResultTutorialView(isTutorialOn: $isTutorialOn)
                
                
                
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct SimulatorTutorialView: View {
    var body: some View {
        ZStack{
            Image("SimulatorHelp")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width)
                .padding(.top, UIScreen.height * 0.1)
            Text("Simulator Tutorial")
                .font(.system(size: UIScreen.width * 0.05))
                .bold()
                .padding(.bottom, UIScreen.height * 0.85)
        }
    }
}

struct ResultTutorialView: View {
    @Binding var isTutorialOn: Bool
    var body: some View {
        ZStack{
            Image("ChartHelp")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width)
                .padding(.top, UIScreen.height * 0.1)
            Text("Result Chart Tutorial")
                .font(.system(size: UIScreen.width * 0.05))
                .bold()
                .padding(.bottom, UIScreen.height * 0.85)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        isTutorialOn = false
                    } label: {
                        Image(systemName: "house")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom, 15)
                }
            }
            
        }
    }
}

//#Preview {
//    OnboardingView()
//}
