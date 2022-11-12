//
//  SaveButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 24/10/22.
//

import SwiftUI

struct SaveButton: View {
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    //O botão é de Salvar na Página Salvos
    var body: some View {
        ButtonStroke(buttonType: .imageAndTextBigger, text: "save".localized(language), icon: "bookmark.fill", action: {print("teste")}, isDisabled: .constant(false))
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}
