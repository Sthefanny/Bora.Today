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
    
    var showCreateButton: Bool = false
    
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
            .padding(.leading, AppConfig.safeAreaHorizontal)
            
            Text(headerTitle != nil ? headerTitle!.localized(language) : "")
                .font(.appTitle2)
                .foregroundColor(.appBlack)
            
            if showCreateButton {
                NavigationLink(destination: CreateView(shouldShowBack: true)) {
                    ButtonText(buttonType: .imageAndText, text: "createButton".localized(language), icon: "create", action: {}, color: .appBlueButton, isDisabled: .constant(false))
                        .disabled(true)
                }
                .frame(width: UIScreen.main.bounds.width - AppConfig.safeAreaHorizontal, alignment: .trailing)
            }
        }
        .padding(.top, 16)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerTitle: "Teste", showCreateButton: true)
    }
}
