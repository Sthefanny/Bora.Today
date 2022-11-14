//
//  CornerRadiusShapeModel.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/09/22.
//

import Foundation
import SwiftUI

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
