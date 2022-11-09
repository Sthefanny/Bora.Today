//
//  ExperienceCardView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 03/11/22.
//

import SwiftUI

struct ExperienceCardView: View {
    let model: ExperienceModel
    
    var body: some View {
        
        HStack(spacing: 0) {
            //experience.image
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .cornerRadius(18)
                .padding(.trailing, 12)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(model.name)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                    .padding(.bottom, 8)
                
                Text(model.description)
                    .lineLimit(2)
                    .font(.appSubheadline)
                    .foregroundColor(.appBlack)
                    .padding(.bottom, 8)
    
                
                HStack {
                    Image("pin_place")
                        .foregroundColor(.black)

                    
                    Text(model.location)
                        .font(.appFootnote)
                        .foregroundColor(.appGrayText)
                    
                }
                .padding(.bottom, 4)
                
                HStack {
                    Image("time")
                        .foregroundColor(.black)
                    
                    Text(model.datetime)
                        .font(.appFootnote)
                        .foregroundColor(.appGrayText)
                    
                }
                
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.appBlueButton)
            
        }
    
    }
}

struct ExperienceCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCardView(model: .example1)
    }
}
