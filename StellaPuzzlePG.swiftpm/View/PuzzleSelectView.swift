//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 12/19/23.
//

import SwiftUI

struct PuzzleSelectView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack{
            LazyVGrid(columns: columns, content: {
                ForEach((0...7), id: \.self){ value in
                    VStack{
                        Text("\(value)")
                            .foregroundStyle(Color.blue)
                            .frame(width: 250, height: 250)
                            .background(Color.gray)
                            .padding()
                    }
                }
            })
        }
    }
}

#Preview {
    PuzzleSelectView()
}
