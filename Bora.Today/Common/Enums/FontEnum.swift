//
//  FontEnum.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 30/09/22.
//

import Foundation

enum AppFont: String {
    case figtree = "Figtree"
    case palmerLakeScript = "PalmerLakeScript-Regular"
    case palmerLakePrint = "PalmerLakePrint-Regular"

    var name: String {
        return self.rawValue
    }
}
