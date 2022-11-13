//
//  CreateImagePickerButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 09/11/22.
//

import SwiftUI

struct CreateImagePickerButton: View {
    
    var buttonType: ButtonType
    var text: String
    var icon: String
    var action: () -> Void
    @Binding var isDisabled: Bool
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State private var photoPickerIsPresented = false
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
            Button(action: {
                photoPickerIsPresented = true
            }) {
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
                    VStack {
                        Image(icon)
                        Text(text)
                            .font(.appButtonText)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 85, height: 85)
                    .foregroundColor(.appWhite)
                    .tint(Color.appBlueButton)
                    .cornerRadius(18)
                case .iconAndTextBigger:
                    VStack (alignment: .center, spacing: 4){
                        Image(systemName: icon)
                        Text(text)
                            .font(.appButtonText)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 85, height: 85)
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

struct CreateImagePickerButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateImagePickerButton(buttonType: .iconAndTextBigger, text: "Adicionar Foto", icon: "camera", action:{print("teste")}, isDisabled: .constant(false))
    }
}
