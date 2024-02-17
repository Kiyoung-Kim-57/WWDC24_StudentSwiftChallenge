//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 2/17/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack{
            Image(systemName: "figure.2.and.child.holdinghands")
                .font(.system(size: UIScreen.width * 0.3))
            Text("Birth Rate Simulator")
                .bold()
                .font(.system(size: UIScreen.width * 0.05))
        }
    }
}

#Preview {
    StartView()
}
