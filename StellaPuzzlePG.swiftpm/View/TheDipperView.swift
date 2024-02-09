//
//  SwiftUIView.swift
//  
//
//  Created by 김기영 on 12/22/23.
//

import SwiftUI

struct TheDipperView: View {
    @ObservedObject var theDipper: TheDipperViewModel
    var body: some View {
        List{
            ForEach(theDipper.starsArray, id: \.self){ value in
                Text("\(value.name) " + "거리는 \(value.distance) " + "겉보기 등급은 <\(value.ApparentMagnitude)> " + "절대 등급은 " + value.magnitude)
            }
        }
    }
}

#Preview {
    TheDipperView(theDipper: TheDipperViewModel())
        .previewInterfaceOrientation(.landscapeLeft)
}
