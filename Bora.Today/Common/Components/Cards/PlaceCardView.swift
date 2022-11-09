//
//  PlaceCardView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 03/11/22.
//

import SwiftUI

struct PlaceCardView: View {
    let model: PlaceModel
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                Text(model.name)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                    .padding(.bottom, 8)
                
                
                HStack {
                    Image("pin_place")
                        .foregroundColor(.black)
                        .padding(.horizontal, 4)
                    
                    Text(model.address)
                        .font(.appFootnote)
                        .foregroundColor(.appGrayText)
                    
                }
                .padding(.bottom, 4)
                
            }
            .padding(.trailing, 32)
            
            Spacer()
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.appBlue)
                
                Text(String(format: "%.1f", model.rating))
        
            }
        }
        
    }
}

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(model: .place2)
    }
}
