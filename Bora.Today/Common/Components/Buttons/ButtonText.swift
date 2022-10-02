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
    @Binding var isDisabled: Bool
    
    var body: some View {
        
        Button() {
            self.action()
        } label: {
            switch buttonType {
            case .textOnly:
                Text(text)
                    .font(.appButtonText)
            case .imageOnly:
                Image(systemName: icon)
                    .font(.system(size: 20))
            case .imageAndText:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
                    .padding(.horizontal, 5)
            case .imageAndTextBigger:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
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
        ButtonText(buttonType: .imageAndTextBigger, text: "Teste", icon: "record.circle", action: {print("teste")}, isDisabled: .constant(false))
            .previewDevice("iPhone 12")
    }
}
