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
    
    @State private var goesToSettings: Bool = false
    @State private var goesToConnection: Bool = false

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
                NavigationLink(destination: SettingsProfileView(), isActive: $goesToSettings) {
                    ButtonDefault(buttonType: .textOnlyBigger, text: "settings".localized(language), icon: "", action: {goesToSettings = true}, isDisabled: .constant(false))
                        .offset(y: halfButtonHeight)
                }
            } else {
                NavigationLink(destination: SettingsProfileView(), isActive: $goesToConnection) {
                    ButtonDefault(buttonType: .textOnlyBigger, text: "connect".localized(language), icon: "", action: {goesToConnection = true}, isDisabled: .constant(false))
                        .offset(y: halfButtonHeight)
                }
            }
        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(isModelView: .constant(true), halfButtonHeight: .constant(35/2), model: UserModel.example1)
    }
}
