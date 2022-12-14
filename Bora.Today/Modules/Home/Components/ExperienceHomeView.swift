//
//  ExperienceView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 05/10/22.
//

import SwiftUI

struct ExperienceHomeView: View {
    let model: ExperienceModel
    let isFirst: Bool
    
    var body: some View {
        ZStack {
            
            NavigationLink(destination: ExperienceView(model: model)) {
                VStack(alignment: .leading, spacing: 0) {
                    _buildImage()
                    
                    Text(model.name)
                        .font(.appHeadline)
                        .foregroundColor(.appBlack)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 12)
                        .padding(.bottom, 8)
                        .frame(maxWidth: 150, alignment: .leading)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        _buildPlaceDetails()
                        _buildDateDetails()
                    }
                }
                .padding(.leading, getPadding())
            }
            
            StickerListView(stickerList: model.stickers!)
                .frame(maxWidth: 150, alignment: .leading)
            
        }
    }
    
    func getPadding() -> CGFloat {
        if isFirst {
            return CGFloat(21)
        }
        
        return CGFloat(0)
    }
    
    func _buildImage() -> some View {
        return Image(model.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 170, height: 170)
            .cornerRadius(18)
    }
    
    func _buildPlaceDetails() -> some View {
        HStack(spacing: 4) {
            Image("pin_place")
                .foregroundColor(.black)
            
            Text(model.event.location.name)
                .font(.appFootnote)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .foregroundColor(.appGrayText)
                .frame(maxWidth: 150, alignment: .leading)
            
        }
    }
    
    func _buildDateDetails() -> some View {
        HStack(spacing: 4) {
            Image("time")
                .foregroundColor(.black)
            
            Text(DateHelper.getFormattedDate(model.event.initialDate, format: "MMM dd, HH:mm"))
                .font(.appFootnote)
                .foregroundColor(.appGrayText)
            
        }
    }
}

struct ExperienceHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceHomeView(model: ExperienceModel.example3, isFirst: true)
    }
}
