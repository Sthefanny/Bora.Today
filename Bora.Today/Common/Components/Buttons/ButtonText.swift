//
//  ButtonText.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 02/10/22.
//

import SwiftUI

struct ButtonText: View {
    var buttonType: ButtonType
    var text: String
    var icon: String
    var action: () -> Void
    var color: Color
    @Binding var isDisabled: Bool
    
    var body: some View {
        
        Button() {
            self.action()
        } label: {
            switch buttonType {
            case .textOnly:
                Text(text)
                    .font(.appButtonText)
                    .foregroundColor(color)
            case .textOnlyBigger:
                Text(text)
                    .font(.appButtonText)
                    .padding(.horizontal, 20)
            case .iconOnly:
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
            case .iconAndText:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
                    .foregroundColor(color)
                    .padding(.horizontal, 0)
            case .imageAndText:
                HStack(spacing: 4) {
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundColor(color)
                    
                    Text(text)
                        .font(.appButtonText)
                        .foregroundColor(color)
                }
            case .iconAndTextBigger:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
                    .foregroundColor(color)
                    .padding(.horizontal, 20)
            }
        }
        .buttonStyle(TextButtonStyle(buttonType: buttonType))
        .tint(Color.appBlueButton)
        .disabled(isDisabled)
    }
}

struct ButtonText_Previews: PreviewProvider {
    static var previews: some View {
        ButtonText(buttonType: .iconAndTextBigger, text: "Teste", icon: "record.circle", action: {print("teste")}, color: .red, isDisabled: .constant(false))
            .previewDevice("iPhone 12")
    }
}
