//
//  ProfileHeaderView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var isModelView : Bool
    @Binding var halfButtonHeight: CGFloat
    @Binding var isPresented: Bool
    
    @Binding var isConnected: Bool
    
    let model : UserModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ProfileImageLargeView(image: model.image, country: model.originCountry)
                .padding(.bottom,16)
            
            VStack(alignment: .center, spacing: 4) {
                Text(model.name)
                    .font(.appTitle2)
                    .foregroundColor(.appBlack)
                
                Text("@" + model.username )
                    .font(.caption2)
                    .foregroundColor( isModelView == true ? Color.appGrayText : Color.appWhite )
            }
            //                        .padding(.bottom, 16)
            
            if isModelView == true {
                NavigationLink(destination: SettingsProfileView()) {
                    Text("settings".localized(language))
                        .font(.appButtonText)
                        .padding(.horizontal, 20)
                        .padding(10)
                        .foregroundColor(.appButtonWhiteContent)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .fill(Color.appBlueButton))
                        .cornerRadius(30)
                        .offset(y: halfButtonHeight)
                }
            } else {
                ButtonDefault(buttonType: .textOnlyBigger, text: isConnected ? "disconnect".localized(language) : "connect".localized(language), icon: "", action: {
                    if isConnected {
                        isPresented.toggle()
                    } else {
                        isConnected.toggle()
                    }
                }, isDisabled: .constant(false))
                    .offset(y: halfButtonHeight)
            }
        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(isModelView: .constant(true), halfButtonHeight: .constant(35/2), isPresented: .constant(false), isConnected: .constant(false), model: UserModel.example1)
    }
}
