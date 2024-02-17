//
//  ResultViewModel.swift
//  BirthRateSimulator
//
//  Created by 김기영 on 2/13/24.
//

import Foundation

class ResultViewModel: ObservableObject {
    
    @Published var resultArray: [ResultModel] = [
        //Sample
        .init(nthGen: 1, population: 10000, totalFertilityRate: 0.7),
        .init(nthGen: 2, population: 3500, totalFertilityRate: 0.6),
        .init(nthGen: 3, population: 1200, totalFertilityRate: 0.4)
    
    ]
    @Published var tmpPopulation: CGFloat = .zero
    @Published var tmpGen: Int = 0
    @Published var tmpRate: CGFloat = .zero
    @Published var isSimulating: Bool = false
    
    enum rangeError: Error {
        case rangeNotEnough
    }
    
    func maxGen(_ array: [ResultModel]) throws -> Int {
        let tmp: [Int] =  array.map{ $0.nthGen }
        guard tmp.count > 2 else {
            throw rangeError.rangeNotEnough
        }
        return tmp.max() ?? 0
    }
    
    func maxPopulation(_ array: [ResultModel]) -> Int {
        let tmp: [Int] = array.map{ $0.population }
        return tmp.max() ?? 0
    }
    
    func maxRate(_ array: [ResultModel]) -> Double {
        let tmp: [Double] = array.map{ $0.totalFertilityRate }
        return tmp.max() ?? 0
    }
}


