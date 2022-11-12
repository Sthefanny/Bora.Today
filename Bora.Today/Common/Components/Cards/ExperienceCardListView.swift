//
//  ExperienceCardListView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 09/11/22.
//

import SwiftUI

struct ExperienceCardListView: View {
    
    private var model: [ExperienceModel] = [
        .example1,
        .example2,
        .example3
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<model.count, id: \.self) { index in
                        let item = model[index]
                        HStack(spacing: 8) {
                            ExperienceCardView(model: item, isInDiscover: true, isSaved: false)
                        }
                        Divider()
                            .overlay(Color.appGray)
                    }
                }
            }
            .padding(.vertical, 16)
        }
        .padding(.horizontal, AppConfig.safeAreaHorizontal)
    }
}

struct ExperienceCardListView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCardListView()
    }
}
