//
//  ExperienceView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 05/10/22.
//

import SwiftUI

struct ExperienceView: View {
    let model: ExperienceModel
    let isFirst: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                _buildImage()
                
                Text(model.name)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                
                
                VStack(alignment: .leading, spacing: 4) {
                    _buildPlaceDetails()
                    _buildDateDetails()
                }
            }
            .padding(.leading, getPadding())
            
            StickerListView(stickerList: model.stickers!)
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
        HStack {
            Image("pin_place")
                .foregroundColor(.black)
                .padding(.horizontal, 4)
            
            Text(model.location)
                .font(.appFootnote)
                .foregroundColor(.appGrayText)
            
        }
    }
    
    func _buildDateDetails() -> some View {
        HStack {
            Image("time")
                .foregroundColor(.black)
            
            Text(model.datetime)
                .font(.appFootnote)
                .foregroundColor(.appGrayText)
            
        }
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(model: ExperienceModel.example1, isFirst: true)
    }
}
