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
    let icon: String
    let color: Color
}

#if DEBUG
// MARK: - Example Item
extension TagModel {
    
    static var example: TagModel {

        TagModel(
            text: "Arte e Cultura",
            icon: "sparkles",
            color: Color.white
        )
    }
}
#endif
