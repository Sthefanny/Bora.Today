//
//  ButtonDefaultBig.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 24/10/22.
//

import SwiftUI

struct ButtonDefaultBig: View {
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
                    .frame(maxWidth: .infinity)
//                    .padding(.horizontal, 82)
            }
        }
        .buttonStyle(DefaultButtonStyle(buttonType: buttonType))
        .tint(Color.appBlueButton)
        .disabled(isDisabled)
    }
}

struct ButtonDefaultBig_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDefaultBig(buttonType: .iconAndTextBigger, text: "Bora!", icon: "seal.fill", action: {print("teste")}, isDisabled: .constant(false))

    }
}
