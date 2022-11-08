//
//  IconLocationTextButton.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 18/10/22.
//

import SwiftUI
import MapKit

struct IconLocationTextButton: View {
    let model: ExperienceModel
    //var isButton - se for botão ele passa pro Maps, se não a cor é preta.
    
    var body: some View {
        VStack (alignment: .leading){
        _buildPlaceDetails()
        }
    }
    
    func _buildPlaceDetails() -> some View {
        HStack {
            Image("pin_place")
                .foregroundColor(.black)
             
        
            Button(
                model.location,
              action: {
                //codígo de mostrar o mapa MapKit
              }
            )
            .font(.appFootnote)
            .foregroundColor(.appBlueButton)
            
        }
    }
}

struct IconLocationTextButton_Previews: PreviewProvider {
    static var previews: some View {
        IconLocationTextButton(model: ExperienceModel.example1)
    }
}
