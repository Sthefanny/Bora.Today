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
                TabView(selection: $currentIndex) {
                    OnboardingIntroView(introTitle: "Olá \nexplorador!", introSubtitle: "Bora se aventurar?", introDescription: "Descubra novos lugares e experiências, faça novas amizades e crie uma rede de apoio!", backgroundColor: .appGreen)
                        .tag(0)
                    OnboardingSelectCountryView(boraMeaningTitle: "bo.ra.", boraMeaningSubheadline: "Substantivo feminino", boraMeaningText: "Expressão que incentiva a saída de outra pessoa ou que faça algo.\nPra gente, é como se fosse o pontapé inicial pra novas aventuras.", boraMeaningCallToAction: "então bora começar?",backgroundColor: .appBlue, foregroundColor: .appWhite)
                    OnboardingInterestsView(title: "Escolha até seis interesses", subheadline: "E receba recomendações personalizadas", backgroundColor: .appOrange)
                        .tag(2)
                }
                .ignoresSafeArea()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            //end onboarding
                            currentIndex -= 1
                        }) {
                            Text("Pular")
                                .font(.appHeadline)
                                .foregroundColor(.appWhite)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal,AppConfig.safeAreaHorizontal)
                    Spacer()
                    ChangeScreenButtons()
                }
                
               
                
                
               
                //                .animation(.easeOut, value: 0.2)
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

struct ChangeScreenButtons: View {
    @State private var currentIndex = 0

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            if currentIndex > 0 {
                Button(action: {
                    currentIndex -= 1
                }) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.system(size: 38))
//                            .resizable()
//                            .frame(width: screen.size.width * 0.09, height: screen.size.width * 0.09)
                }
            }
            Spacer()
            Button(action: {
                if currentIndex != 2 {
                    currentIndex += 1
                }
            }) {
                HStack{
                    if currentIndex == 2 {
                        Text("Concluir")
                    } else {
                        Image(systemName: "chevron.forward.circle.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                    }
                }
            }
        }
        .foregroundColor(.appWhite)
        .padding(.horizontal,AppConfig.safeAreaHorizontal)
        .padding(.vertical, 10)
    }
}
