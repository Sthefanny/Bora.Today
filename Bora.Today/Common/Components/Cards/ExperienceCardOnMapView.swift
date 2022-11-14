//
//  ExperienceCardOnMapView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 13/11/22.
//

import SwiftUI

struct ExperienceCardOnMapView: View {
    let model: ExperienceModel
    
    @State private var goesToExperience: Bool = false
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 78, height: 78)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text(model.name)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                
                Text(model.description)
                    .lineLimit(2)
                    .font(.appSubheadline)
                    .foregroundColor(.appBlack)
                
                HStack {
                    Image("time")
                        .foregroundColor(.black)
                    
                    Text(model.datetime)
                        .font(.appFootnote)
                        .foregroundColor(.appGrayText)
                    
                }
            }
            
            NavigationLink(destination: ExperienceView(model: model), isActive: $goesToExperience) {}
        }
        .onTapGesture {
            goesToExperience = true
        }
        .padding(16)
        .background(Color.appWhite)
        .cornerRadius(18)
        .shadow(color: .appGray, radius: 4, x: 0, y: 0)
        .frame(minWidth: 0, maxWidth: 348, minHeight: 119, maxHeight: 119)
    }
}

struct ExperienceCardOnMapView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ExperienceCardOnMapView(model: ExperienceModel.example1)
        }
    }
}
