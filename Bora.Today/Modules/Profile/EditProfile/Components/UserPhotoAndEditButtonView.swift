//
//  UserPhotoAndEditButtonView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 17/11/22.
//

import SwiftUI

struct UserPhotoAndEditButtonView: View {
    
    let model : UserModel
    
    var body: some View {
        VStack (spacing: 8){
            Image(model.image)
                .resizable()
                .clipShape(Circle(), style: FillStyle())
                .frame(width: 118, height: 118, alignment: .center)
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 0)
                )
                .shadow(radius: 7)
            
            Button(action: {
                
            }, label: {
                Text("Alterar foto de perfil")
                    .font(.appButtonText)
                    .foregroundColor(.appBlueButton)
            })
        }
    }
}

struct UserPhotoAndEditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoAndEditButtonView(model: .example3)
    }
}
