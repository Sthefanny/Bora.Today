//
//  TodayBannerView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 02/10/22.
//

import SwiftUI

struct ImageBannerView: View {
    let model: ExperienceModel
    let isFirst: Bool
    let isLast: Bool
    
    var body: some View {
        GeometryReader { screen in
            VStack(spacing: 0) {
                    if isFirst {
                        _buildFirstImage(screen: screen)
                    } else if isLast {
                        _buildLastImage(screen: screen)
                    } else {
                        _buildImage(screen: screen)
                    }
                
                Text(model.name)
                    .font(.appHeadline)
                    .foregroundColor(.appBlack)
                    .frame(width: screen.size.width - AppConfig.todayImageBannerPadding, alignment: .leading)
                    .padding(.leading, AppConfig.todayImageBannerPadding)
                    .padding(.top, 12)
                
                HStack {
                    _buildPlaceDetails(screen: screen)
                    _buildDateDetails(screen: screen)
                }
                .frame(width: screen.size.width - AppConfig.todayImageBannerPadding, alignment: .leading)
                .padding(.top, 12)
                .padding(.leading, AppConfig.todayImageBannerPadding)
            }
            .frame(width: screen.size.width)
        }
    }
    
    func _buildFirstImage(screen: GeometryProxy) -> some View {
        return Image(model.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: screen.size.width - AppConfig.todayImageBannerPadding, height: AppConfig.todayImageBannerHeight, alignment: .trailing)
            .cornerRadius(radius: 18, corners: [.topLeft, .bottomLeft])
            .padding(.leading, AppConfig.todayImageBannerPadding)
    }
    
    func _buildLastImage(screen: GeometryProxy) -> some View {
        return Image(model.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: screen.size.width - AppConfig.todayImageBannerPadding, height: AppConfig.todayImageBannerHeight, alignment: .leading)
            .cornerRadius(radius: 18, corners: [.topRight, .bottomRight])
            .padding(.trailing, AppConfig.todayImageBannerPadding)
    }
    
    func _buildImage(screen: GeometryProxy) -> some View {
        return Image(model.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: screen.size.width, height: AppConfig.todayImageBannerHeight, alignment: .center)
            .cornerRadius(radius: 0, corners: [])
    }
    
    func _buildPlaceDetails(screen: GeometryProxy) -> some View {
        HStack {
            Image("pin_place")
                .foregroundColor(.black)
            
            Text(model.location)
                .font(.appFootnote)
                .foregroundColor(.appGrayText)
            
        }
    }
    
    func _buildDateDetails(screen: GeometryProxy) -> some View {
        HStack {
            Image("time")
                .foregroundColor(.black)
            
            Text(model.datetime)
                .font(.appFootnote)
                .foregroundColor(.appGrayText)
            
        }
    }
}

struct ImageBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBannerView(model: ExperienceModel.example1, isFirst: false, isLast: false)
    }
}
