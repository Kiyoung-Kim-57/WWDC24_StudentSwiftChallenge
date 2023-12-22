//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 12/22/23.
//

import SwiftUI

struct PuzzleView: View {
    var body: some View {
        
        ZStack{
//            Color.bgColorTop
//                .ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.bgColor1, Color.bgColor2]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            
            
        }
    }
}

#Preview {
    PuzzleView()
}
