//
//  ButtonAddPhoto.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 18/10/22.
//

import SwiftUI

struct ButtonAddPhoto: View {
    //var buttonType: ButtonType
    
    var body: some View {
        
        Button() {
            print("ABRIR NEGOCIO DE PEGAR FOTO")
        } label: {
            
        }
        //.buttonStyle(DefaultButtonStyle(buttonType: buttonType))
        .tint(Color.appBlueButton)
    }
}

struct ButtonAddPhoto_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAddPhoto()
    }
}
