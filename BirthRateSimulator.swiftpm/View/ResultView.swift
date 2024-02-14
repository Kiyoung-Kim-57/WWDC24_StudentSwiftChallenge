//
//  ResultView.swift
//  BirthRateSimulator
//
//  Created by 김기영 on 2/10/24.
//

import SwiftUI
import Charts

struct ResultView: View {
    @ObservedObject var resultViewModel: ResultViewModel
    var body: some View {
        if resultViewModel.resultArray.count > 1 {
            Chart{
                ForEach(resultViewModel.resultArray, id: \.self) { data in
                    LineMark(
                        x: .value("XValue", data.nthGen),
                             y: .value("YValue", data.population)
    //                    width: 50
                    )
                }
            }
            .chartXScale(domain: resultViewModel.maxGen(resultViewModel.resultArray) < 2 ? 0...1  : 1...resultViewModel.maxGen(resultViewModel.resultArray))
            .frame(width: UIScreen.width * 0.7, height: UIScreen.height * 0.5)
        } else {
            Text("No Data\n(At least two results are needed)")
                .multilineTextAlignment(.center)
        }
        
        
        
    }
}

//#Preview {
//    ResultView()
//}
