//
//  OnboardingCountriesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 04/11/22.
//

import SwiftUI

struct OnboardingCountriesListView: View {
    var body: some View {
        VStack{
            HeaderView(headerTitle: "Selecionar país")
            Spacer(minLength: 32)
            CountriesListView()
        }
    }
}

struct OnboardingCountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCountriesListView()
    }
}
