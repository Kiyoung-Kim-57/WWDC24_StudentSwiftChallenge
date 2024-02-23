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
//        .init(nthGen: 1, population: 10000, totalFertilityRate: 0.7),
//        .init(nthGen: 2, population: 3500, totalFertilityRate: 0.6),
//        .init(nthGen: 3, population: 3300, totalFertilityRate: 0.4),
//        .init(nthGen: 4, population: 10000, totalFertilityRate: 0.7),
//        .init(nthGen: 5, population: 3500, totalFertilityRate: 0.6),
//        .init(nthGen: 6, population: 3300, totalFertilityRate: 0.4),
//        .init(nthGen: 7, population: 10000, totalFertilityRate: 0.7),
//        .init(nthGen: 8, population: 3500, totalFertilityRate: 0.6),
//        .init(nthGen: 9, population: 3300, totalFertilityRate: 0.4),
//        .init(nthGen: 10, population: 10000, totalFertilityRate: 0.7)
//
    ]
    @Published var tmpPopulation: Double = .zero
    @Published var tmpGen: Int = 0
    @Published var tmpRate: CGFloat = .zero
    @Published var isSimulating: Bool = false
    var TFRArray: [Double] {
        var tmp = resultArray.map { $0.totalFertilityRate }
        tmp.removeLast()
        return tmp
    }
    
    enum rangeError: Error {
        case rangeNotEnough
    }
    
    class analyzedData {
        var analyzedString: String
        var isIncrease: Bool
        init(analyzedString: String, isIncrease: Bool) {
            self.analyzedString = analyzedString
            self.isIncrease = isIncrease
        }
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
    
    func analyzePopulation(_ array: [ResultModel]) -> analyzedData {
        let firstPopulation = Double(array[0].population)
        let lastPopulation = Double(array[array.count - 1].population)
        let change = (lastPopulation - firstPopulation) / firstPopulation * 100
        if change < 0 {
            return .init(analyzedString: "Decreased " + String(format: "%.f", change) + "%", isIncrease: false)
            
        } else if change == 0 {
            return .init(analyzedString: "No Change", isIncrease: false)
        } else {
            return .init(analyzedString: "Increased " + String(format: "%.f", change) + "%", isIncrease: true)
        }
    }
    
    func analyzeTFR(_ array: [ResultModel]) -> analyzedData {
        let firstTFR = Double(array[0].totalFertilityRate)
        var lastTFR: Double {
            if array.count > 1 {
                return Double(array[array.count - 2].totalFertilityRate)
            } else {
                return 0
            }
        }
        let change = (lastTFR - firstTFR) / firstTFR * 100
        
        if array.count < 3 {
            return .init(analyzedString: "Need More Data", isIncrease: false)
        }
        
        if change < 0 {
            return .init(analyzedString: "Decreased " + String(format: "%.f", change) + "%", isIncrease: false)
            
        } else if change == 0 {
            return .init(analyzedString: "No change", isIncrease: false)
        } else {
            return .init(analyzedString: "Increased +" + String(format: "%.f", change) + "%", isIncrease: true)
        }
    }
    
    func TFRToRecover(_ array: [ResultModel]) -> Double {
        let firstPopulation = Double(array[0].population)
        let lastPopulation = Double(array[array.count - 1].population)
        
        return pow(1024 * (firstPopulation / lastPopulation), 1/10)
    }
}


