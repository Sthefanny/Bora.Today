//
//  BannerListView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/10/22.
//

import SwiftUI

struct BannerListView: View {
    let model: TopExperienceModel
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex.animation()) {
                ForEach(0..<model.experiences.count, id: \.self) { index in
                    let item = model.experiences[index]
                    NavigationLink(destination: ExperienceView(model: item)) {
                        ImageBannerView(model: item, isFirst: index == 0, isLast: index == model.experiences.count-1)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .overlay(PageDotsIndexView(numberOfPages: model.experiences.count, currentIndex: currentIndex))
        }
    }
}

struct BannerListView_Previews: PreviewProvider {
    static var previews: some View {
        BannerListView(model: TopExperienceModel.example)
    }
}
