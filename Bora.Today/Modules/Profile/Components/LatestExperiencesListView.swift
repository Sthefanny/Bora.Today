//
//  LatestExperiencesListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct LatestExperiencesListView: View {
    let model: TopExperienceModel
    let spacing: CGFloat? = 12
    let columns = [
        GridItem(.flexible(),spacing: 12),
        GridItem(.flexible(),spacing: 12),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
            ForEach(0..<model.experiences.count, id: \.self) { index in
                let item = model.experiences[index]
                ExperienceHomeView(model: item, isFirst: false)
            }
        }
    }
}

struct LatestExperiencesListView_Previews: PreviewProvider {
    static var previews: some View {
        LatestExperiencesListView(model: TopExperienceModel.example)
    }
}
