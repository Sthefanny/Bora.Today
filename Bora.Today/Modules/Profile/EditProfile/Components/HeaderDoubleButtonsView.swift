//
//  HeaderDoubleButtonsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 17/11/22.
//

import SwiftUI

struct HeaderDoubleButtonsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var firstButtonImage: String?
    var firstButtonText: String?
    var headerTitle: String?
    var secondButtonImage: String?
    var secondButtonText: String?
    
    var body: some View {
        ZStack (alignment: .center){
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack(spacing:4){
                    Image(systemName: firstButtonImage ?? "")
                        .font(.system(size: 16))
                    Text(firstButtonText ?? "")
                        .font(.appButtonText)
                    Spacer()
                }.foregroundColor(Color.appBlueButtonDisabled)
            })
            
            Text(headerTitle != nil ? headerTitle!.localized(language) : "")
                .font(.appTitle2)
            
            Button(action: {
                print("clicou")
            }, label: {
                HStack(spacing:4){
                    Spacer()

                    Text(secondButtonText ?? "")
                        .font(.appButtonText)
                    Image(systemName: secondButtonImage ?? "")
                        .font(.system(size: 16))
                }.foregroundColor(Color.appBlueButton)
            })
        }
        .padding(.horizontal, AppConfig.safeAreaHorizontal)
        .padding(.top, 16)
    }
}

struct HeaderDoubleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDoubleButtonsView()
    }
}
