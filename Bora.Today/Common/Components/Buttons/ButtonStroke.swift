//
//  ButtonStroke.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 02/10/22.
//

import SwiftUI

struct ButtonStroke: View {
    var buttonType: ButtonType
    var text: String
    var icon: String
    var action: () -> Void
    @Binding var isDisabled: Bool
    
    var body: some View {
        
        Button() {
            self.action()
        } label: {
            switch buttonType {
            case .textOnly:
                Text(text)
                    .font(.appButtonText)
            case .textOnlyBigger:
                Text(text)
                    .font(.appButtonText)
                    .padding(.horizontal, 20)
            case .iconOnly:
                Image(systemName: icon)
                    .font(.system(size: 20))
            case .iconAndText, .imageAndText:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
                    .padding(.horizontal, 5)
            case .iconAndTextBigger:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
                    .padding(.horizontal, 20)
            }
        }
        .buttonStyle(StrokeButtonStyle(buttonType: buttonType))
        .tint(Color.appBlueButton)
        .disabled(isDisabled)
    }
}

struct ButtonStroke_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStroke(buttonType: .iconAndTextBigger, text: "Teste", icon: "record.circle", action: {print("teste")}, isDisabled: .constant(false))
            .previewDevice("iPhone 12")
    }
}
