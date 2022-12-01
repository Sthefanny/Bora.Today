//
//  ReviewDynamicListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 10/11/22.
//

import SwiftUI
import SwiftFlags

struct ReviewDynamicListView: View {
    
    var model: [ReviewModel]
    
    var body: some View {
            LazyVStack {
                ForEach(0..<model.count) {index in
                    let item = model[index]
                    ExperienceReviewView(model: item)
                    Divider()
                        .overlay(Color.appGray)
                }
            }
    }
}

struct ReviewDynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDynamicListView(model: [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3])
    }
}
