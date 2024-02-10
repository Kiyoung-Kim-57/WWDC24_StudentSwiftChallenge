//
//  ResultView.swift
//  BirthRateSimulator
//
//  Created by 김기영 on 2/10/24.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var resultViewModel: ResultViewModel = SimulatorView().resultViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ResultView()
}
