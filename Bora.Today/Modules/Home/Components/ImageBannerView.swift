//
//  TodayBannerView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 02/10/22.
//

import SwiftUI

struct ImageBannerView: View {
    let image: String
    let isFirst: Bool
    let isLast: Bool
    
    var body: some View {
        if isFirst {
            _buildFirstImage
        } else if isLast {
            _buildLastImage
        } else {
            _buildImage
        }
    }
    
    var _buildFirstImage: some View {
        GeometryReader { screen in
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen.size.width - AppConfig.todayImageBannerPadding, height: AppConfig.todayImageBannerHeight, alignment: .trailing)
                .cornerRadius(radius: 18, corners: [.topLeft, .bottomLeft])
                .padding(.leading, AppConfig.todayImageBannerPadding)
        }
    }
    
    var _buildLastImage: some View {
        GeometryReader { screen in
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen.size.width - AppConfig.todayImageBannerPadding, height: AppConfig.todayImageBannerHeight, alignment: .leading)
                .cornerRadius(radius: 18, corners: [.topRight, .bottomRight])
                .padding(.trailing, AppConfig.todayImageBannerPadding)
        }
    }
    
    var _buildImage: some View {
        GeometryReader { screen in
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screen.size.width, height: AppConfig.todayImageBannerHeight, alignment: .center)
        }
    }
}

struct ImageBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBannerView(image: "today_bg", isFirst: false, isLast: true)
    }
}
