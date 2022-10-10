//
//  SettingsView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/09/22.
//

import SwiftUI

struct SettingsView: View {
    // Step #1
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
                Menu {
                    Button {
                        LocalizationManager.shared.language = .english
                    } label: {
                        Text("English (US)")
                        FlagView(countryCode: "US", size: CGFloat(40))
                    }
                    Button {
                        LocalizationManager.shared.language = .portuguese
                    } label: {
                        Text("Português")
                        FlagView(countryCode: "BR", size: CGFloat(40))
                    }
                } label: {
                    Spacer()
                    FlagView(countryCode: language.userSymbol.uppercased(), size: CGFloat(40))
                }.padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
