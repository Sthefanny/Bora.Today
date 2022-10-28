//
//  OnboardingView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 18/10/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                Text("Pular")
                    .font(.appHeadline)
                TabView {
                    OnboardingIntroView(introTitle: "Olá explorador", introSubtitle: "Bora iniciar a sua jornada?", introDescription: "Seja bem vinde a este amado aplicativo de adaptação da sua nova jornada", backgroundColor: .appGreen)
                    OnboardingSelectCountryView(backgroundColor: .appBlue, foregroundColor: .appWhite)
                    OnboardingInterestsView(title: "Escolha até seis interesses", subheadline: "Receba recomendações de experiências", backgroundColor: .appOrange)
                }
                .ignoresSafeArea()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                //.overlay(PageDotsIndexView(numberOfPages: 3, currentIndex: currentIndex, circleSize: 6, circleSpacing: 6, primaryColor: .appWhite))
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
