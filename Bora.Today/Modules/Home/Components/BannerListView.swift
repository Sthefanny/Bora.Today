//
//  BannerListView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/10/22.
//

import SwiftUI

struct BannerListView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemCyan
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray2
    }
    
    var body: some View {
        GeometryReader { screen in
            TabView {
                ImageBannerView(image: "today_bg", isFirst: true, isLast: false)
                ImageBannerView(image: "today_bg", isFirst: false, isLast: false)
                ImageBannerView(image: "today_bg", isFirst: false, isLast: true)
            }
            .frame(width: screen.size.width, height: AppConfig.todayImageBannerHeight)
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        
    }
}

struct BannerListView_Previews: PreviewProvider {
    static var previews: some View {
        BannerListView()
    }
}
