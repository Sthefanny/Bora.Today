//
//  TextButtonStyle.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 02/10/22.
//

import Foundation
import SwiftUI

struct TextButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    private let buttonType: ButtonType
    
    init(buttonType: ButtonType) {
        self.buttonType = buttonType
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding(10)
            .foregroundColor(isEnabled ? .appButtonBlackContent : .appButtonBlackContentDisabled)
            .background(backgroundView(configuration: configuration))
    }
    
    @ViewBuilder private func backgroundView(configuration: Configuration) -> some View {
        if !isEnabled {
            disabledBackground
        } else if configuration.isPressed {
            pressedBackground
        } else {
            enabledBackground
        }
    }
    
    private var enabledBackground: some View {
        RoundedRectangle(
            cornerRadius: getRadius()
        )
        .fill(.clear)
    }
    
    private var disabledBackground: some View {
        RoundedRectangle(
            cornerRadius: getRadius()
        )
        .fill(.clear)
    }
    
    private var pressedBackground: some View {
        RoundedRectangle(
            cornerRadius: getRadius(),
            style: .continuous
        )
        .strokeBorder(Color.appBlueButtonStrokeDisabled)
        .background(Color.appBlueButtonStrokeDisabled)
        .cornerRadius(getRadius())
    }
    
    func getRadius() -> CGFloat {
        switch self.buttonType {
        case .textOnly:
            return 30
        case .imageOnly:
            return 9
        case .imageAndText:
            return 30
        case .imageAndTextBigger:
            return 30
        }
    }
}
