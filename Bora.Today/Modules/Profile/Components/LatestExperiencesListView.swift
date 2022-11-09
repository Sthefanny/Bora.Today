//
//  LatestExperiencesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct LatestExperiencesListView: View {
    let model: TopExperienceModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { screen in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<model.experiences.count, id: \.self) { index in
                        let item = model.experiences[index]
                        ExperienceHomeView(model: item, isFirst: index == 0)
                    }
                }
                HStack(spacing: 12) {
                    
                    
                }
            }
        }
    }
}

struct LatestExperiencesListView_Previews: PreviewProvider {
    static var previews: some View {
        LatestExperiencesListView(model: TopExperienceModel.example)
    }
}
