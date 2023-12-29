//
//  File.swift
//  
//
//  Created by 김기영 on 12/22/23.
//

import Foundation

class TheDipperViewModel: ObservableObject {
    @Published var starsArray:[StarInfo]
    
    init(starsArray: [StarInfo] = [
        .init(name: "Dubhe", ApparentMagnitude: 1.8, distance: 124),
        .init(name: "Merak", ApparentMagnitude: 2.4, distance: 79),
        .init(name: "Phecda", ApparentMagnitude: 2.4, distance: 84),
        .init(name: "Megrez", ApparentMagnitude: 3.3, distance: 58),
        .init(name: "Alioth", ApparentMagnitude: 1.8, distance: 81),
        .init(name: "Mizar", ApparentMagnitude: 2.1, distance: 78),
        .init(name: "Alkaid", ApparentMagnitude: 1.9, distance: 101)
    ]) {
        self.starsArray = starsArray
    }
}
