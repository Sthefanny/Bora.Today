//
//  ReportButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 24/10/22.
//

import SwiftUI

struct ReportButton: View {
    var buttonType: ButtonType
    var text: String
    var icon: String
    var color: Color
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
                        .foregroundColor(color)
                case .textOnlyBigger:
                    Text(text)
                        .font(.appButtonText)
                        .padding(.horizontal, 20)
                case .imageOnly:
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(color)
                case .imageAndText:
                    Label(text, systemImage: icon)
                        .font(.appButtonText)
                        .foregroundColor(color)
                        .padding(.horizontal, 5)
                case .imageAndTextBigger:
                    Label(text, systemImage: icon)
                        .font(.appButtonText)
                        .foregroundColor(color)
                        .padding(10)
                }
            }
            .disabled(isDisabled)
    }
}

struct ReportButton_Previews: PreviewProvider {
    static var previews: some View {
        ReportButton(buttonType: .imageAndTextBigger, text: "Report", icon: "exclamationmark.bubble", color: Color.appRed,  action: {print("teste")}, isDisabled: .constant(false))
    }
}
