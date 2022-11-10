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
    
    @StateObject var locationManager = LocationManager()
    
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
                case .imageOnly:
                    Image(systemName: icon)
                        .font(.system(size: 20))
                case .imageAndText:
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
                case .imageAndTextBigger:
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
        CreateImagePickerButton(buttonType: .imageAndTextBigger, text: "Adicionar Foto", icon: "camera", action:{print("teste")}, isDisabled: .constant(false))
    }
}
