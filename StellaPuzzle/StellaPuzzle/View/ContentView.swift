//
//  ContentView.swift
//  StellaPuzzle
//
//  Created by 김기영 on 12/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("Hi")
                .tabItem {
                    Image(systemName: "moon.stars")
                        .foregroundStyle(
                            LinearGradient(
                                    colors: [.teal, .indigo],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ))
                        
                        
                        
                }
        }
    }
}

#Preview {
    ContentView()
}
