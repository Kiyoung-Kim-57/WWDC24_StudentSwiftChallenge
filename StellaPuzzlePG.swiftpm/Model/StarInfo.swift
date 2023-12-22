//
//  File.swift
//  
//
//  Created by 김기영 on 12/22/23.
//

import Foundation

class StarInfo {
    let name: String
    let ApparentMagnitude: CGFloat
    //Light Year Distance
    let distance: CGFloat
    var magnitude: CGFloat {
        return ApparentMagnitude + 5 - 5 * (log(distance/3.26)) //Convert Light Year distance to parsec distance
    }
    
    init(name: String, ApparentMagnitude: CGFloat, distance: CGFloat) {
        self.name = name
        self.ApparentMagnitude = ApparentMagnitude
        self.distance = distance
    }
}

