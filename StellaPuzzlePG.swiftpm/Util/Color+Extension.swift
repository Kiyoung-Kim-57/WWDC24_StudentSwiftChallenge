//
//  File.swift
//  
//
//  Created by 김기영 on 12/22/23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1){
        self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 08) & 0xff) / 255, blue: Double((hex >> 00) & 0xff) / 255, opacity: alpha
        )
    }
    
    
    static let bgColor1:Color = Color(hex: 0x4FA4E9)
    static let bgColor2:Color = Color(hex:0x2F4FF1)
    
}
