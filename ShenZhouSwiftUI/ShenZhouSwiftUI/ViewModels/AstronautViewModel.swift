//
//  AstronautViewModel.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import Foundation

class AstronautViewModel {
    var astronauts: [Astronaut]
    init() {
        astronauts = Bundle.main.decode(kAstronautsJSONFile)
    }
}
