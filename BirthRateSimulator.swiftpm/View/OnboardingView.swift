//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 2/22/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            Text("Simulator tutorial")
                .tabItem {
                    Image(systemName: "figure.2.arms.open")
                }
            Text("Result Tutorial")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}
