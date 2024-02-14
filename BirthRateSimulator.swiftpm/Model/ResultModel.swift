//
//  File.swift
//  
//
//  Created by 김기영 on 2/10/24.
//

import Foundation

class ResultModel {
    var nthGen: Int
    var population: Int
    var totalFertilityRate: CGFloat
    
    init(nthGen: Int, population: Int, totalFertilityRate: CGFloat) {
        self.nthGen = nthGen
        self.population = population
        self.totalFertilityRate = totalFertilityRate
    }
}

extension ResultModel: Hashable {
    static func == (lhs: ResultModel, rhs: ResultModel) -> Bool {
        if lhs.nthGen == rhs.nthGen && lhs.population == rhs.population && lhs.totalFertilityRate == rhs.totalFertilityRate {
            return true
        } else {
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(nthGen)
        hasher.combine(population)
        hasher.combine(totalFertilityRate)
    }
}




