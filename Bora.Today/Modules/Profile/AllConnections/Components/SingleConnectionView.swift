//
//  SingleConnectionView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 11/11/22.
//

import SwiftUI

struct SingleConnectionView: View {
    
    var model: UserModel
    
    var body: some View {
        NavigationLink(destination: ProfileView(isSelfProfile: false, model: model, shouldShowBack: true)) {
            VStack(alignment: .center, spacing: 0){
                ProfileImageView(model: model)
                    .padding(.bottom,8)
                
                Text(model.name)
                    .font(.appCallout)
                    .foregroundColor(.appBlack)
                    .padding(.bottom,4)
                
                Text("@" + model.username)
                    .font(.appCaption1)
                    .foregroundColor(.appGray)
            }
        }
    }
}

struct SingleConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleConnectionView(model: UserModel.example7)
    }
}
