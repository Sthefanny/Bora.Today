//
//  OnboardingIntroView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 19/10/22.
//

import SwiftUI

struct OnboardingIntroView: View {
    
    let introTitle: String
    let introSubtitle: String
    let introDescription: String
    
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0){
                
                Text(introTitle)
                    .font(.custom(AppFont.coveredByYourGrace.name, size: 40))
                    .padding(.top, 0)
                    .padding(.bottom, 16)
                
                Text(introSubtitle)
                    .font(.appTitle3)
                    .padding(.top, 0)
                    .padding(.bottom, 8)
                
                Text(introDescription)
                    .font(.appSubheadline)
            }
            .foregroundColor(.appWhite)
            .multilineTextAlignment(.center)
            .padding(.horizontal,21)
        }
    }
}

struct OnboardingIntroView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingIntroView(introTitle: "Olá explorador", introSubtitle: "Bora iniciar a sua jornada?", introDescription: "Seja bem vinde a este amado aplicativo de adaptação da sua nova jornada", backgroundColor: .appGreen)
    }
}
