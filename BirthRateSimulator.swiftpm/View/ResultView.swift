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
    @State private var screenRatioSize = UIScreen.width * 0.001
    let strideBy: Double = 6
    var maxPopulation: Int {
        return resultViewModel.maxPopulation(resultViewModel.resultArray)
    }
    var maxRate: Double {
        return resultViewModel.maxRate(resultViewModel.resultArray)
    }
    var range: Int {
        do {
            return try resultViewModel.maxGen(resultViewModel.resultArray)
        } catch ResultViewModel.rangeError.rangeNotEnough {
            return 2
        } catch {
            return 2
        }
    }
    
    var body: some View {
        if resultViewModel.resultArray.count > 1 {
            VStack{
                HStack(spacing: 50){
                    Chart{
                        ForEach(resultViewModel.resultArray, id: \.self) { data in
                            BarMark(
                                x: .value("XValue", data.nthGen),
                                y: .value("YValue", data.population),
                                width: 50
                            )
                            .foregroundStyle(Color.blue.opacity(0.7))
                            
                            LineMark(
                                x: .value("XValue2", data.nthGen),
                                y: .value("YValue2", (data.totalFertilityRate * Double(maxPopulation)) / maxRate)
                            )
                            .foregroundStyle(Color.green)
                        }
                    }
                    .chartXScale(domain: 0...range+1)
                    .chartYAxis{
                        AxisMarks(values: .automatic(desiredCount: 4))
                        AxisMarks(position: .leading, values: .automatic(desiredCount: 4)) { value in
                            let DoubleIndex: Double = Double(value.count - 1)
                            let converter: Double = maxRate / DoubleIndex
                            AxisValueLabel("\( String(format: "%.2f", converter * Double(value.index)))")
                        }
                    }
                    .chartYAxisLabel(position: .leading, alignment: .topLeading) {
                        Text("Total Fertility Rate (Line Graph)")
                            .bold()
                            .font(.system(size: 15))
                    }
                    .chartYAxisLabel(position: .trailing, alignment: .topLeading) {
                        Text("Population (Bar Graph)")
                            .bold()
                            .font(.system(size: 15))
                    }
                    .frame(width: UIScreen.width * 0.55, height: UIScreen.height * 0.65)
                    
                    VStack(alignment: .leading, spacing: 30){
                      Text("Result Analysis")
                            .font(.system(size: screenRatioSize * 40))
                            .padding(.top, screenRatioSize * 40)
                        Group{
                            Text("Population Change Trend")
                                .font(.system(size: screenRatioSize * 20))
                                .bold()
                        }
                        Group{
                            Text("Total Fertility Rate(TFR) Change Trend")
                                .font(.system(size: screenRatioSize * 20))
                                .bold()
                        }
                        Group{
                            Text("Required TFR to recover within 10 Generation")
                                .font(.system(size: screenRatioSize * 20))
                                .bold()
                        }
                        Group{
                            Text("Description")
                                .font(.system(size: screenRatioSize * 20))
                                .bold()
                        }
                        Spacer()
                    }
                    .padding(.top, screenRatioSize * 50)
                }
            }
           
        } else {
            Text("No Data\n(At least two results are needed)")
                .multilineTextAlignment(.center)
        }
        
        
        
    }
    
}

#Preview {
    ResultView(resultViewModel: ResultViewModel())
}
