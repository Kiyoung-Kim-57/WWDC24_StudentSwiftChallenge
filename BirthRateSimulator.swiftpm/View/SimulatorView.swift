//
//  SimulatorView.swift
//  BirthRateSimulator
//
//  Created by 김기영 on 1/29/24.
//

import SwiftUI

struct SimulatorView: View {
    @ObservedObject var resultViewModel: ResultViewModel 
    @State var population: CGFloat = 0
    @State var totalFertilityRate: CGFloat = 0
    @State var genCount: Int = 0
    @State var isCalculating: Bool = false
    @State var repeatCount: Int = 0
    
    var body: some View {
        ZStack{
            
            HStack{
                Spacer()
                CalculatorView(
                    resultViewModel: resultViewModel ,
                    population: $population,
                    totalFertilityRate: $totalFertilityRate,
                    isCalculating: $isCalculating,
                    repeatCount: $repeatCount,
                    genCount: $genCount
                )
                
                .onAppear{
                    if resultViewModel.isSimulating == true {
                        population = resultViewModel.tmpPopulation
                        totalFertilityRate = resultViewModel.tmpRate
                        genCount = resultViewModel.tmpGen
                    }
                }
            }
            .frame(height: UIScreen.height)
            
            FigureView(
                population: $population,
                totalFertilityRate: $totalFertilityRate,
                isCalculating: $isCalculating,
                repeatCount: $repeatCount
            )
            .ignoresSafeArea()
            
        }
    }
}

private struct FigureView: View {
    @Binding var population: CGFloat
    @Binding var totalFertilityRate: CGFloat
    @Binding var isCalculating: Bool
    @Binding var repeatCount: Int
    @State var isFirstAction: Bool = false
    @State var isSecondAction: Bool = false
    @State var isThirdAction: Bool = false
    @State var isFourthAction: Bool = false
    @State var isFifthAction: Bool = false
    @State var isSixthAction: Bool = false
    @State var tmpPopulation: CGFloat = 0
    
    
    var body: some View {
        HStack {
            ZStack{
                VStack{
                    Image(systemName: "figure.stand")
                        .font(.system(size: UIScreen.main.bounds.width * 0.25))
                    Text("\(isFirstAction ? Int(population / 2) : Int(ceil(population)))")
                    
                }
                .opacity(isFourthAction ? 0 : 1)
                .offset(x:-10,y:isThirdAction ? -UIScreen.height * 0.25 : 0)
                
                
                
                Text(String(format:"%.2f", totalFertilityRate))
                    .foregroundStyle(Color.white)
                    .background{
                        Image(systemName: "heart.fill")
                            .font(.system(size:150))
                    }
                    .opacity(isSecondAction ?  1 : 0)
                    .opacity(isFifthAction ? 0 : 1)
                    .offset(x: UIScreen.width * 0.1675, y: isThirdAction ? -UIScreen.height * 0.25 : 0)
                    .offset(y:isFourthAction ? UIScreen.height * 0.25 : 0)
                    
                
                VStack{
                    Image(systemName: "figure.stand")
                        .font(.system(size: UIScreen.main.bounds.width * 0.25))
                    Text("\(isFirstAction ?Int(population / 2) : Int(ceil(population)))")
                }
                .opacity(isFourthAction ? 0 : 1)
                .offset(x:isFirstAction ? UIScreen.width * 0.345 : -10, y:isThirdAction ? -UIScreen.height * 0.25 : 0)
                
                VStack{
                    Image(systemName: "figure.stand")
                        .font(.system(size:isSixthAction ? UIScreen.width * 0.25 : UIScreen.width * 0.15))
                    Text("\(Int(ceil(population * 0.5 * totalFertilityRate)))")
                }
                .opacity(isFifthAction ? 1 : 0)
                .offset(x:isSixthAction ? -10 : UIScreen.width * 0.1675)
                
                
                
                
            }
            .padding(.leading, UIScreen.main.bounds.width * 0.25)
            //sequential animation codes
            .onChange(of: isCalculating, perform: { _ in
                
                //The first action of animation
                if repeatCount < 1 { //This condition is for preventing replay of animation when initialize boolean values as false
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isFirstAction = true
                        }
                    })
                    //The second action of animation
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isSecondAction = true
                        }
                    })
                    //The third action of animation
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isThirdAction = true
                        }
                    })
                    //The fourth action of animation
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4, execute: {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isFourthAction = true
                        }
                    })
                    //The fifth action of animation
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isFifthAction = true
                        }
                    })
                    //The sixth action of animation
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6, execute: {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isSixthAction = true
                        }
                    })
                    //Reset Boolean values
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7, execute: {
                        isFirstAction = false
                        isSecondAction = false
                        isThirdAction = false
                        isFourthAction = false
                        isFifthAction = false
                        isSixthAction = false
                    })
                }
            })
            Spacer()
        }
        .background{
            HStack{
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: isCalculating ? UIScreen.width * 1.3 : UIScreen.width * 0.8, height: UIScreen.height * 1.01)
                    .foregroundStyle(Color.gray)
                //TODO: delete opacity and set background color
                    .offset(x: -UIScreen.width * 0.1)
                    .animation(.easeOut, value: isCalculating)
                    
                Spacer()
            }
        }
    }
}

private struct CalculatorView: View {
    @ObservedObject var resultViewModel: ResultViewModel
    @Binding var population: CGFloat
    @Binding var totalFertilityRate: CGFloat
    @Binding var isCalculating: Bool //Trigger of animation
    @Binding var repeatCount: Int
    @Binding var genCount: Int
    @State private var isShowPopulationPopUp: Bool = false
    @State private var isShowTFRPopUp: Bool = false
    @State var result: CGFloat = 0
    @State var screenRatioSize = UIScreen.width * 0.001
    @State var resultModel: ResultModel = .init(nthGen: 0, population: 0, totalFertilityRate: 0)
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }
    
    var numberFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol  = ""
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 20){
            VStack(alignment:.trailing){
                Spacer()
                    .frame(height: screenRatioSize * 50)
                //Default population set value
                Group{
                    HStack{
                        Text("Present Population")
                            .font(.system(size: screenRatioSize * 26))
                            .bold()
                        Button {
                            self.isShowPopulationPopUp = true
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: screenRatioSize * 30))
                                .bold()
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .popover(isPresented: $isShowPopulationPopUp) {
                        Text("The Population of 15 to 49 Years Old\n(Consider this age group as one generation)")
                            .font(.system(size: 20))
                            .padding(5)
                    }
                    
                    
                    
                    TextField(resultViewModel.isSimulating ? "\(Int(resultViewModel.tmpPopulation))" : "Present Population", value: $population, formatter: numberFormatter)
                        .font(.system(size: screenRatioSize * 20))
                        .bold()
                        .multilineTextAlignment(.trailing)
                }
                //TFR value
                Group{
                    HStack{
                        Text("Total Fertility Rate")
                            .font(.system(size: screenRatioSize * 26))
                            .bold()
                        Button {
                            isShowTFRPopUp = true
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: screenRatioSize * 30))
                                .bold()
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .popover(isPresented: $isShowTFRPopUp) {
                        Text("The average number of children that are born to a woman over her lifetime\n(Age 15 ~ 49)")
                            .font(.system(size: 20))
                            .padding(5)
                    }
                    
                    TextField(resultViewModel.isSimulating ? "\(resultViewModel.tmpRate)" :"Total Fertility Rate(0.0~)", value: $totalFertilityRate, formatter: numberFormatter2)
                        .font(.system(size: screenRatioSize * 20))
                        .bold()
                        .multilineTextAlignment(.trailing)
                }
                
            }
            
            Spacer()
            
            Button(action: {
                //Turn on the simulating continuing check
                resultViewModel.isSimulating = true
                //Add generationCount number
                genCount += 1
                //Append present population and TFR value in ViewModel
                resultModel = .init(nthGen: genCount ,population: Int(population), totalFertilityRate: totalFertilityRate)
                resultViewModel.resultArray.append(resultModel)
                //Trigger of start of animation
                isCalculating.toggle()
                //To prevent playing animation twice
                repeatCount = 0
                //After 7 Secs reset values for next step
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7, execute: {
                    repeatCount += 1
                    isCalculating.toggle()
                    result = (population / 2) * totalFertilityRate
                    population = result
                    //Store tmpPopulation and tmpRate value
                    resultViewModel.tmpPopulation = population
                    resultViewModel.tmpRate = totalFertilityRate
                    resultViewModel.tmpGen = genCount
                })
                
            }, label: {
                Text("Start Simulation")
                    .font(.system(size:screenRatioSize * 30))
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(15)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.gray)
                    }
            })
            .padding(.bottom, 30)
            .padding(.leading, UIScreen.width * 0.1)
        }
        .frame(width: UIScreen.main.bounds.width * 0.35)
        .multilineTextAlignment(.center)
        .padding(.trailing, 25)
    }
}


#Preview {
    SimulatorView(resultViewModel: ResultViewModel())
}




