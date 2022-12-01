//
//  OnboardingCountriesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 04/11/22.
//

import SwiftUI

struct OnboardingCountriesListView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var selectedCountry: String?
    
    var body: some View {
        ZStack {
            Color.appWhite
                .ignoresSafeArea()
            
            VStack{
                HeaderView(headerTitle: "selectCountry".localized(language))
                    .padding(.bottom, 32)
                CountriesListView(selectedCountry: $selectedCountry)
                    .padding(.horizontal, 21)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct OnboardingCountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCountriesListView(selectedCountry: .constant(nil))
    }
}
