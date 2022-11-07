//
//  CountriesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 27/10/22.
//

import SwiftUI

struct CountriesListView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        
        ScrollView{
            ForEach(CountryHelper.getCountries(), id:\.self) { index in
                VStack(alignment: .leading) {
                    HStack(spacing: 8){
//                        FlagView(countryCode: index, size: 18)
                        Text(index.localized(language))
                            .font(.appButtonText)
                            .foregroundColor(.appGray)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 8)

                    Divider()
                        .background(Color.appGray)
                }
            }
        }
    }
}
        // não ficou em ordem alfabética
        
//        List(NSLocale.isoCountryCodes.sorted(), id: \.self) { countryCode in
//            HStack {
//                FlagView(countryCode: countryCode, size: 18)
//                Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
//                Spacer()
//            }
//        }


struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
