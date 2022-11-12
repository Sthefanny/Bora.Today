//
//  CreateExperienceCornerButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 07/11/22.
//

import SwiftUI

struct CreateExperienceCornerButton: View {
    
    var buttonType: ButtonType
    var text: String
    var icon: String
    var action: () -> Void
    @Binding var isDisabled: Bool
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        
        Button(action: {
            //Precisa Ir pra Página de Criar Experiência
        }) {
            switch buttonType {
            case .textOnly:
                Text(text)
                    .font(.appButtonText)
            case .textOnlyBigger:
                Text(text)
                    .font(.appButtonText)
                    .padding(.horizontal, 20)
            case .imageOnly:
                Image(systemName: icon)
                    .font(.system(size: 20))
            case .imageAndText:
                Label(text, systemImage: icon)
                    .font(.appButtonText)
                    .padding(.horizontal, 5)
            case .imageAndTextBigger:
                VStack {
                    Image(icon)
                    Text(text)
                        .font(.appButtonText)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 101, height: 101)
                .foregroundColor(.appWhite)
                .tint(Color.appBlueButton)
                .cornerRadius(18)
            }
        }
        .buttonStyle(DefaultButtonStyle(buttonType: buttonType))
        .tint(Color.appBlueButton)
        .disabled(isDisabled)
    }
}

struct CreateExperienceCornerButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateExperienceCornerButton(buttonType: ButtonType.imageAndTextBigger, text: "Create Experience", icon: "createIcon2", action: {print("teste")}, isDisabled: .constant(false))
    }
}
