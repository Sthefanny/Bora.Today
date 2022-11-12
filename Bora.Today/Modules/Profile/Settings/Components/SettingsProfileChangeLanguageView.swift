//
//  SettingsProfileChangeLanguageView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 12/11/22.
//

import SwiftUI

struct SettingsProfileChangeLanguageView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @Binding var isPresented: Bool
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                if isPresented {
                    Color.black.opacity(isPresented ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        _buildHeader
                        
                        ScrollView {
                            VStack(spacing: 0) {
                                LazyVStack(alignment: .leading, spacing: 8) {
                                    _buildLanguageOption(countryCode: "BR", lang: "portuguese".localized(language))
                                    _buildLanguageOption(countryCode: "US", lang: "english".localized(language))
                                }
                            }
                        }
                        .padding(.vertical, 32)
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 21)
                    .frame(width: screen.size.width * 0.8 , height: screen.size.height * 0.5)
                    .background(Color.appWhite)
                    .cornerRadius(18)
                    .padding(.vertical, 0)
                }
            }
        }
    }
    
    private var _buildHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
            Spacer()
            
            Image(systemName: "xmark")
                .font(.system(size: 20))
                .onTapGesture {
                    isPresented.toggle()
                }
            }
            
            Text("settingsLanguageTitle".localized(language))
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appBlack)
        }
        .padding(.bottom, 8)
    }
    
    func _buildLanguageOption(countryCode: String, lang: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                FlagView(countryCode: countryCode, size: CGFloat(40))
                
                Text(lang)
                    .font(.appFootnote)
                    .foregroundColor(.appBlueButton)
                
            }
            .onTapGesture {
                if (lang.localized(language) == "english".localized(language)) {
                    LocalizationManager.shared.language = .english
                } else {
                    LocalizationManager.shared.language = .portuguese
                }
            }
            
            Divider()
        }
    }
}

struct SettingsProfileChangeLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileChangeLanguageView(isPresented: .constant(true))
    }
}
