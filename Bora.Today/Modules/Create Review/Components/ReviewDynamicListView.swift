//
//  ReviewDynamicListView.swift
//  Bora.Today
//
//  Created by Jessica Akemi Meguro on 10/11/22.
//

import SwiftUI
import SwiftFlags

struct ReviewDynamicListView: View {
    
    private let model: [ReviewModel]
    
    init() {
        model = [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3, ReviewModel.example1, ReviewModel.example2, ReviewModel.example3]

    }
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                ForEach(0..<model.count) {index in
                    let item = model[index]
                    ExperienceReviewView(model: ReviewModel.example2)
                }
            }
            .padding(.leading, 21)
        }
        
    }
}

struct ReviewDynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDynamicListView()
    }
}
