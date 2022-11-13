//
//  CreateHostedButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 24/10/22.
//

import SwiftUI

struct CreateHostedButton: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State private var goesToProfile: Bool = false
    
    let model: ReviewModel
    
    var body: some View {
        HStack (alignment: .center ,spacing: 4){
            Image("profilePic")
                .resizable()
                .frame(width: 38, height: 38)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            NavigationLink(destination: ProfileView(isSelfProfile: false, model: model.user, shouldShowBack: true), isActive: $goesToProfile) {
                Button(action: {
                    self.goesToProfile = true
                }) {
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
}

struct CreateHostedButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateHostedButton(model: ReviewModel.example1)
    }
}
