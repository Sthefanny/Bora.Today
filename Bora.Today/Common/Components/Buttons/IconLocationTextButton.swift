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
        NavigationLink(destination: LocalsView(model: model.event.location)) {
            HStack {
                Image("pin_place")
                    .foregroundColor(.black)
                
                Text(model.event.location.name)
                    .font(.appFootnote)
                    .foregroundColor(.appBlueButton)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

struct IconLocationTextButton_Previews: PreviewProvider {
    static var previews: some View {
        IconLocationTextButton(model: ExperienceModel.example2)
    }
}
