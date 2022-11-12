//
//  LocalExperienceCardView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 08/11/22.
//

import SwiftUI

struct LocalExperienceCardView: View {
    
    var model: ExperienceModel
    
    var body: some View {
        
        Button(action: {
            //Precisa Ir pra Página da Experiência
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .frame(minWidth: 0, maxWidth: 348, minHeight: 119, maxHeight: 119)
                    .foregroundColor(.appWhite)
                    .shadow(color: .appGray, radius: 5, x: 5, y: 5)
                
                HStack(alignment: .top, spacing: 0) {
                    //experience.image
                    Image(model.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 79, height: 78)
                        .clipShape(Circle())
                        .padding(.trailing, 12)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(model.name)
                            .font(.appHeadline)
                            .foregroundColor(.appBlack)
                        
                        Text(model.description)
                            .lineLimit(2)
                            .font(.appSubheadline)
                            .foregroundColor(.appBlack)
                        
                        HStack {
                            Image("pin_place")
                                .foregroundColor(.black)
                            
                            Text(model.location)
                                .font(.appFootnote)
                                .foregroundColor(.appGrayText)
                            
                        }
                    }
                }
                .padding(16)
            }
            .frame(minWidth: 0, maxWidth: 348, minHeight: 119, maxHeight: 119)
        }
    }
}

struct LocalExperienceCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocalExperienceCardView(model: ExperienceModel.example1)
    }
}
