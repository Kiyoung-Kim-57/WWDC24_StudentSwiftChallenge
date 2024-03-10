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
    
    var chartWidth: Int {
        return Int(UIScreen.width) / range
    }
    
    var numberFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol  = ""
        return formatter
    }
    
    var body: some View {
        if resultViewModel.resultArray.count > 1 {
            
            ZStack{
                HStack{
                    Spacer()
//
                    VStack(alignment: .leading, spacing: 15){
                      Text("Result Analysis")
                            .font(.system(size: screenRatioSize * 30))
                            .fontWeight(.heavy)
                            .padding(.top, screenRatioSize * 25)
                            .padding(.bottom, screenRatioSize * 15)
                            
                        Divider()
                            .frame(width: screenRatioSize * 300)
                            .padding(.bottom, screenRatioSize * 15)
                        Group{
                            Text("Population Change Trend")
                                .font(.system(size: screenRatioSize * 20))
                                .bold()
                            Text(resultViewModel.analyzePopulation(resultViewModel.resultArray).analyzedString)
                                .font(.system(size: screenRatioSize * 15))
                                .foregroundStyle(resultViewModel.analyzePopulation(resultViewModel.resultArray).isIncrease ? Color.green : Color.lineColor)
                                .bold()
                                .padding(.bottom, screenRatioSize * 20)
                       
                            Text("Total Fertility Rate(TFR) Change Trend")
                                .font(.system(size: screenRatioSize * 20))
                                .bold()
                            Text(resultViewModel.analyzeTFR(resultViewModel.resultArray).analyzedString)
                                .font(.system(size: screenRatioSize * 15))
                                .foregroundStyle(resultViewModel.analyzeTFR(resultViewModel.resultArray).isIncrease ? Color.green : Color.lineColor)
                                .bold()
                                .padding(.bottom, screenRatioSize * 20)
                       
                            Text("Required Minimum TFR \nTo Recover First Population \nWithin 10 Generations")
                                .font(.system(size: screenRatioSize * 19))
                                .bold()
                            Text(String(format:"%.1f", resultViewModel.TFRToRecover(resultViewModel.resultArray)))
                                .foregroundStyle(Color.green)
                                .bold()
                                .font(.system(size: screenRatioSize * 18))
                                .padding(.bottom, screenRatioSize * 50)
                        }
                        
                        
                        Group{
                            Text("Additional Information")
                                .font(.system(size: screenRatioSize * 30))
                                .bold()
                            Text("In general, 2.1 is required TFR to maintain \npopulation considering death rate and else \nin developed countries.\nThis value called Replacement Fertility Rate.\nThis can be higher than 2.1 depends on each\ncountries various conditions")
                                .font(.system(size: screenRatioSize * 16))
                                .lineSpacing(screenRatioSize * 3)
                        }
                        Spacer()
                    }
                    .padding(.trailing, 10)
                }
                
                HStack{
                    VStack{
                        Chart{
                            ForEach(resultViewModel.resultArray, id: \.self) { data in
                                
                                LineMark(
                                    x: .value("XValue2", data.nthGen),
                                    y: .value("YValue2", (data.totalFertilityRate * (1/maxRate) * Double(maxPopulation)) )
                                )
                                .foregroundStyle(Color.lineColor)
                                
                                BarMark(
                                    x: .value("XValue", data.nthGen),
                                    y: .value("YValue", data.population),
                                    width: .inset(15)
                                )
                                .annotation(position: .trailing){
                                    VStack(alignment: .leading){
                                        Text(String(format:"%.2f", data.totalFertilityRate))
                                            .foregroundStyle(Color.lineColor)
                                            .font(.system(size: screenRatioSize * 10))
                                            .padding(.bottom, 5)
                                        Text("\(data.population)")
                                            .foregroundStyle(Color.cyan)
                                            .font(.system(size: screenRatioSize * 10))
                                    }
                                }
                                .foregroundStyle(Color.cyan.opacity(0.6))
                                
                               
                                
                            }
                            
                            
                            
                        }
                        .chartForegroundStyleScale(["Total Fertility Rate" : Color.lineColor, "Population": Color.cyan])
                        .chartLegend(.visible)
                        .chartXScale(domain: 0...range+1)
                        .chartYAxis{
                            AxisMarks(values: .automatic(desiredCount: 4)) {
                                value in
                                let DoubleIndex: Double = Double(value.count - 1)
                                let converter: Double = Double(maxPopulation) / DoubleIndex
                                AxisValueLabel(numberFormatter2.string(for: Int(converter * Double(value.index)))!)
                            }
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
                        .background{
                            HStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width:  UIScreen.width * 0.9, height: UIScreen.height * 1.07)
                                    .foregroundStyle(Color.boxColor)
                                //TODO: delete opacity and set background color
                                    .offset(x: -UIScreen.width * 0.1)
                                Spacer()
                            }
                        }
                        .padding(.leading, screenRatioSize * 18)
                        Text("⚠️ Last Value of TFR is always 0.0 because there is no input data for last TFR")
                            .padding(.top, 30)
                            
                    }
                    Spacer()
                   
                    
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
