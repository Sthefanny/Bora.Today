//
//  CountriesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 27/10/22.
//

import SwiftUI

struct CountriesListView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var selectedCountry: String?
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            ForEach(CountryHelper.getCountries(), id:\.self) { index in
                LazyVStack(alignment: .leading) {
                    HStack(spacing: 8){
//                        FlagView(countryCode: index, size: 18)
                        Text(index.localized(language))
                            .font(.appButtonText)
                            .foregroundColor(.appGray)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 8)
                    .onTapGesture {
                        selectedCountry = index.localized(language)
                        self.presentationMode.wrappedValue.dismiss()
                    }

                    Divider()
                        .background(Color.appGray)
                }
            }
        }
    }
}


struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView(selectedCountry: .constant(nil))
    }
}
