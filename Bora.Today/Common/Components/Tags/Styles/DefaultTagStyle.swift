//
//  DefaultTagStyle.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 12/10/22.
//

import Foundation
import SwiftUI

struct DefaultTagModifier: ViewModifier {
    var color: Color
    var isSelected: Bool
    var hasIcon: Bool
    
    func body(content: Content) -> some View {
        if isSelected {
            content
                .padding(.horizontal, hasIcon ? 15 : 10)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(color)
                )
        } else {
            content
                .padding(.horizontal, hasIcon ? 15 : 10)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(color, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.appWhite)
                        )
                )
        }
    }
}

extension HStack {
    func DefaultTagStyle(
        color: Color,
        isSelected: Bool,
        hasIcon: Bool
    ) -> some View {
        modifier(DefaultTagModifier(color: color, isSelected: isSelected, hasIcon: hasIcon))
    }
}
