//
//  TagModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import Foundation
import SwiftUI

struct TagModel {
    let text: String
    let icon: String?
    let color: Color
}

#if DEBUG
// MARK: - Example Item
extension TagModel {
    
    static var example1: TagModel {

        TagModel(
            text: "Arte e Cultura",
            icon: "sparkles",
            color: Color.appOrange
        )
    }
    
    static var example2: TagModel {

        TagModel(
            text: "Happy Hour",
            icon: "fork.knife",
            color: Color.appPink
        )
    }
    
    static var example3: TagModel {

        TagModel(
            text: "Museus",
            icon: "theatermasks.fill",
            color: Color.appGreen
        )
    }
}
#endif
