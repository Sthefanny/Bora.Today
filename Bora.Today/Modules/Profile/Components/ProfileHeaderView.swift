//
//  ProfileHeaderView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @Binding var isModelView : Bool
    @Binding var halfButtonHeight: CGFloat

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
                ButtonDefault(buttonType: .textOnly, text: "Configurações", icon: "", action: {print("teste")}, isDisabled: .constant(false))
                    .offset(y: halfButtonHeight)
            } else {
                ButtonDefault(buttonType: .textOnly, text: "Conectar", icon: "", action: {print("teste")}, isDisabled: .constant(false))
                    .offset(y: halfButtonHeight)
            }
        }
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(isModelView: .constant(true), halfButtonHeight: .constant(35/2), model: UserModel.example1)
    }
}
