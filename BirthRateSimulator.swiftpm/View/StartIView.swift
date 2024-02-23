//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 2/17/24.
//

import SwiftUI

struct StartView: View {
    @Binding var isTutorialOn: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isTutorialOn = true
                } label: {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: UIScreen.width * 0.07))
                        .foregroundStyle(Color.black)
                        
                }
                .padding(.top, -150)
                .padding(.trailing, 30)
                
            }
            Image(systemName: "figure.2.and.child.holdinghands")
                .font(.system(size: UIScreen.width * 0.3))
            Text("Birth Rate Simulator")
                .bold()
                .font(.system(size: UIScreen.width * 0.05))
        }
    }
}

//#Preview {
//    StartView()
//}
