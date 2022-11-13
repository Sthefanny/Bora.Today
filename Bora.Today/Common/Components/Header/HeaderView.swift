//
//  HeaderView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 12/11/22.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var headerTitle: String?
    
    var body: some View {
        ZStack (alignment: .center){
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack(spacing:4){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                    Text("back".localized(language))
                        .font(.appButtonText)
                    Spacer()
                }.foregroundColor(Color.appBlueButton)
            })
            
            Text(headerTitle != nil ? headerTitle!.localized(language) : "")
                .font(.appTitle2)
        }
        .padding(.horizontal, AppConfig.safeAreaHorizontal)
        .padding(.top, 16)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
