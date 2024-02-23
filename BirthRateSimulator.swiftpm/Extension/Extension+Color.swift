//
//  File.swift
//  
//
//  Created by 김기영 on 2/17/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1){
        self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 08) & 0xff) / 255, blue: Double((hex >> 00) & 0xff) / 255, opacity: alpha
        )
    }
    
    static let boxColor:Color = Color(hex: 0xdfe3ee)
    static let lineColor: Color = Color(hex: 0xd9534f)
    
}
//dfe3ee   e3e4e6  eb6841
