//
//  OnboardingView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 18/10/22.
//

import SwiftUI

class OnboardingData: ObservableObject{
    
    @Published var currentIndex : Int = 0
    
}

struct OnboardingView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @ObservedObject private var onboardingData = OnboardingData()
    @State private var color: Color = Color.appGreen
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                switch onboardingData.currentIndex {
                case 0:
                    Color.appGreen
                case 1:
                    Color.appBlue
                case 2:
                    Color.appOrange
                default:
                    Color.appGreen
                }
                
                TabView(selection: $onboardingData.currentIndex) {
                    OnboardingIntroView(introTitle: "introTitle".localized(language), introSubtitle: "introSubtitle".localized(language), introDescription: "introDescription".localized(language), backgroundColor: .appGreen)
                        .tag(0)
                        .contentShape(Rectangle()).gesture(DragGesture())
                    OnboardingSelectCountryView(boraMeaningTitle: "boraMeaningTitle".localized(language), boraMeaningSubheadline: "boraMeaningSubheadline".localized(language), boraMeaningText: "boraMeaningText".localized(language), boraMeaningCallToAction: "boraMeaningCallToAction".localized(language), backgroundColor: .appBlue, foregroundColor: .appWhite)
                        .tag(1)
                        .contentShape(Rectangle()).gesture(DragGesture())
                    OnboardingInterestsView(title: "onboardingInterestsTitle".localized(language), subheadline: "onboardingInterestsSubheadline".localized(language), backgroundColor: .appOrange)
                        .tag(2)
                        .contentShape(Rectangle()).gesture(DragGesture())
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding(.bottom, 32)
                
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: BottomMenuView()) {
                            
                            Text("skip".localized(language))
                                .font(.appHeadline)
                                .foregroundColor(.appWhite)
                                .opacity(0.5)
                        }
                    }
                    .padding(.horizontal,AppConfig.safeAreaHorizontal)
                    Spacer()
                    HStack(alignment: .center, spacing: 0) {
                        if onboardingData.currentIndex > 0 {
                            Button(action: {
                                onboardingData.currentIndex -= 1
                            }) {
                                Image(systemName: "chevron.backward.circle.fill")
                                    .font(.system(size: 38))
                            }
                        }
                        Spacer()
                        HStack{
                            if onboardingData.currentIndex == 2 {
                                NavigationLink(destination: BottomMenuView()) {
                                    Text("complete".localized(language))
                                }
                            } else {
                                Button(action: {
                                    if onboardingData.currentIndex != 2 {
                                        onboardingData.currentIndex += 1
                                    }
                                }) {
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
                .padding(.bottom, 32)
                .padding(.top, 64)
            }
        }
        .ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
