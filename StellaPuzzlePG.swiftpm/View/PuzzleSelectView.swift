//
//  SwiftUIView.swift
//
//
//  Created by 김기영 on 12/19/23.
//

import SwiftUI

struct PuzzleSelectView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: -UIScreen.width * 0.2), count: 2)
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                RoundedRectangle(cornerSize: CGSize(width: UIScreen.width * 0.02, height: UIScreen.height * 0.01))
                    .foregroundStyle(Color.gray)
                    .frame(width: UIScreen.width * 0.7, height: UIScreen.height * 0.2)
                    .padding(50)
            }
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach((0...3), id: \.self){ value in
                        VStack{
                            //                        Text("\(value)")
                            //                            .foregroundStyle(Color.blue)
                            //                            .frame(width: 250, height: 250)
                            //                            .background(Color.gray)
                            //                            .padding()
                            RoundedRectangle(cornerSize: CGSize(width: UIScreen.width * 0.02, height: UIScreen.height * 0.01))
                                .frame(width: UIScreen.width * 0.3, height: UIScreen.width * 0.3)
                                .foregroundStyle(Color.gray)
                                .padding()
                        }
                    }
                })
            }
         
        }
    }
}

#Preview {
    PuzzleSelectView()
}
