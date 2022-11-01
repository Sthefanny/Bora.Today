//
//  CreateHostedButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 24/10/22.
//

import SwiftUI

struct CreateHostedButton: View {
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    let model: ReviewModel
    
    var body: some View {
            HStack (alignment: .center ,spacing: 4){
                Image("profilePic")
                    .resizable()
                    .frame(width: 38, height: 38)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
                Button(action: {}) {
                    //ESSE BOTÃO PRECISA IR PRO PERFIL DA PESSOA
                VStack (alignment: .leading){
                    Text("hosted".localized(language))
                        .font(.appCaption1)
                        .foregroundColor(.appGrayText)
                    
                    Text("@" + model.user.username)
                        .font(.appCaption1)
                        .foregroundColor(.appBlueButton)
                }
            }
        }
    }
}

struct CreateHostedButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateHostedButton(model: ReviewModel.example1)
    }
}