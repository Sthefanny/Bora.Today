//
//  ExperienceListView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 05/10/22.
//

import SwiftUI

struct ExperienceListView: View {
    
    let model: TopExperienceModel
    
    var body: some View {
        GeometryReader { screen in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    
                    ForEach(0..<model.experiences.count, id: \.self) { index in
                        let item = model.experiences[index]
                        ExperienceHomeView(model: item, isFirst: index == 0)
                    }
                }
            }
        }
    }
}

struct ExperienceListView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceListView(model: TopExperienceModel.example)
    }
}
