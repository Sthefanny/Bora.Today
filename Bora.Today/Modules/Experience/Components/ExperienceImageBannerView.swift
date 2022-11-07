//
//  ExperienceImageBannerView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 24/10/22.
//

import SwiftUI

struct ExperienceImageBannerView: View {
    let model: ExperienceModel
    
    var body: some View {
            VStack {
                Image(model.image)
                //imagem chamada do formulário
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 234)
                    .scaledToFill()
            }
            .padding(.bottom, 16)
            .padding(.top, 16)
        }
    }

struct ExperienceImageBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceImageBannerView(model: ExperienceModel.example1)
    }
}
