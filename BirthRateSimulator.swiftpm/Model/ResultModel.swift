//
//  File.swift
//  
//
//  Created by 김기영 on 2/10/24.
//

import Foundation

class ResultModel {
    var population: Int
    var totalFertilityRate: CGFloat
    
    init(population: Int, totalFertilityRate: CGFloat) {
        self.population = population
        self.totalFertilityRate = totalFertilityRate
    }
}

class ResultViewModel: ObservableObject {
    @Published var resultArray: [ResultModel] = []
}
