//
//  ProfileEmptyAccountView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 10/11/22.
//

import SwiftUI

struct ProfileEmptyAccountView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        GeometryReader { screen in
            VStack(spacing: 0) {
                
                Image("ProfileTop")
                    .frame(width: screen.size.width)
                //.edgesIgnoringSafeArea(.all)
                
                Image("VerticalLogo")
                    .padding(.vertical, 32)
                
                
                Text("discover".localized(language))
                    .font(.appCallout)
                    .foregroundColor(.appGrayText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 32)
                
                ButtonDefault(buttonType: ButtonType.iconAndTextBigger, text: "continueApple".localized(language), icon: "apple.logo", action: {}, isDisabled: .constant(false))
                    .padding(.bottom, 16)
                
                VStack(spacing: 2) {
                    
                    HStack(spacing: 2) {
                        Text("legalText1".localized(language))
                            .font(.appCaption2)
                            .foregroundColor(.appDarkGray)
                        
                        Link("terms".localized(language), destination: URL(string: "https://bora.today/politica-de-privacidade/")!)
                            .font(.appCaption2)
                            .foregroundColor(.appBlueButton)

                    }
                    
                    Text("legalText2".localized(language))
                        .font(.appCaption2)
                        .foregroundColor(.appDarkGray)
                    
                    Link("privacyPolicy".localized(language), destination: URL(string: "https://bora.today/termos-de-servico/")!)
                        .font(.appCaption2)
                        .foregroundColor(.appBlueButton)
                   
                }
                .padding(.bottom, 32)

                
                HStack (spacing: 4) {
                    Text("already".localized(language))
                        .font(.appCallout)
                    
                    Text("logIn".localized(language))
                        .font(.appButtonText)
                        .foregroundColor(.appBlueButton)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        
    }
}

struct ProfileEmptyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEmptyAccountView()
    }
}
