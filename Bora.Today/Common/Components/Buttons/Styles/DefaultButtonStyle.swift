//
//  DefaultButtonStyle.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 02/10/22.
//

import Foundation
import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    private let buttonType: ButtonType

    init(buttonType: ButtonType) {
      self.buttonType = buttonType
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding(10)
            .foregroundColor(isEnabled ? .appButtonWhiteContent : .appButtonBlackContentDisabled)
            .background(backgroundView(configuration: configuration))
            .cornerRadius(getRadius())
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
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.appBlueButton)
    }

    private var disabledBackground: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.appBlueButtonDisabled)
    }

    private var pressedBackground: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.appBlueButtonPressed)
    }
    
    func getRadius() -> CGFloat {
        switch self.buttonType {
        case .textOnly:
            return 30
        case .imageOnly:
            return 30
        case .imageAndText:
            return 30
        case .imageAndTextBigger:
            return 30
        }
    }
}
