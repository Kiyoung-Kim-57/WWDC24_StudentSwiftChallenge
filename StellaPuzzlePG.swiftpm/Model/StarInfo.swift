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
    var parsecDistance: CGFloat {
        return round((distance/3.26) * 1000) / 1000
    }
    var magnitude: String {
        return String(format:"%.3f", ApparentMagnitude + 5 - 5 * (log10(parsecDistance)))
//        return ApparentMagnitude + 5 - 5 * (log(distance/3.26)) //Convert Light Year distance to parsec distance
    }
    
    init(name: String, ApparentMagnitude: CGFloat, distance: CGFloat) {
        self.name = name
        self.ApparentMagnitude = ApparentMagnitude
        self.distance = distance
    }
    

}

extension StarInfo: Hashable{
    static func == (lhs: StarInfo, rhs: StarInfo) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}



