//
//  DefaultTagStyle.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 12/10/22.
//

import Foundation
import SwiftUI

struct OnboardingTagModifier: ViewModifier {
    var color: Color
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        if isSelected {
            content
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.appWhite)
                )
        } else {
            content
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.appWhite)
                )
        }
    }
}

extension HStack {
    func OnboardingTagStyle(
        color: Color,
        isSelected: Bool
    ) -> some View {
        modifier(OnboardingTagModifier(color: color, isSelected: isSelected))
    }
}
