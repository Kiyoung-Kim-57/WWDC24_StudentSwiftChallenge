//
//  ResultViewModel.swift
//  BirthRateSimulator
//
//  Created by 김기영 on 2/13/24.
//

import Foundation

class ResultViewModel: ObservableObject {
    
    @Published var resultArray: [ResultModel] = []
    @Published var tmpPopulation: CGFloat = .zero
    @Published var tmpGen: Int = 0
    @Published var tmpRate: CGFloat = .zero
    @Published var isSimulating: Bool = false
    
    func maxGen(_ array: [ResultModel]) -> Int {
        let tmp: [Int] =  array.map{ $0.nthGen }
        return tmp.max() ?? 0
    }
}


