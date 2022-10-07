//
//  SettingsView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/09/22.
//

import SwiftUI
import FlagKit

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
                        flagBy(countryCode: "US")
                    }
                    Button {
                        LocalizationManager.shared.language = .portuguese
                    } label: {
                        Text("Português")
                        flagBy(countryCode: "BR")
                    }
                } label: {
                    Spacer()
                    flagBy(countryCode: language.userSymbol.uppercased())
                        .resizable()
                        .frame(width: 40, height: 40)
                }.padding()
    }
}

private extension SettingsView {
    
    func flagBy(countryCode: String) -> Image {
        guard let flag = Flag(countryCode: countryCode) else {
            return Image(systemName: "questionmark.circle")
        }
        return Image(uiImage: flag.image(style: .square))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
