//
//  File.swift
//  
//
//  Created by 김기영 on 12/22/23.
//

import Foundation

class TheDipperModel: ObservableObject {
    @Published private var Star1: StarInfo = StarInfo(name: "Dubhe", ApparentMagnitude: 1.8, distance: 124)
    @Published private var Star2: StarInfo = StarInfo(name: "Merak", ApparentMagnitude: 2.4, distance: 79)
    @Published private var Star3: StarInfo = StarInfo(name: "Phecda", ApparentMagnitude: 2.4, distance: 84)
    @Published private var Star4: StarInfo = StarInfo(name: "Megrez", ApparentMagnitude: 3.3, distance: 58)
    @Published private var Star5: StarInfo = StarInfo(name: "Alioth", ApparentMagnitude: 1.8, distance: 81)
    @Published private var Star6: StarInfo = StarInfo(name: "Mizar", ApparentMagnitude: 2.1, distance: 78)
    @Published private var Star7: StarInfo = StarInfo(name: "Alkaid", ApparentMagnitude: 1.9, distance: 101)
}
