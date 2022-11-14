//
//  EmptyStateView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 09/11/22.
//

import SwiftUI

struct EmptyStateView: View {
    
    var showImage: Bool = true
    var text: String
    var buttonText: String
    var page: any View
    
    var body: some View {
    
        VStack(alignment: .center, spacing: 0) {
            
            if showImage {
                Image("EmptyStateIcon")
                    .padding(.bottom, 16)
            }
            
            
            Text(text)
                .font(.appFootnote)
                .foregroundColor(.appGrayText)
                .frame(width: 160, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
                
            
            ButtonDefault(buttonType: .iconAndTextBigger, text: buttonText, icon: "", action: {
                print("mandar para a pagina que ta passando")
            }, isDisabled: .constant(false))
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(text: "Você ainda não criou nenhuma experiência", buttonText: "Criar Experiência", page: CreateView())
    }
}
