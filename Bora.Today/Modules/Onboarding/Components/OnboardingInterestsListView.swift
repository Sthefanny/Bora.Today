//
//  OnboardingInterestsListView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 21/10/22.
//

import SwiftUI

struct OnboardingInterestsListView: View {
    let model: [TagModel]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 108, maximum: 208)),
    ]

    var body: some View {
        ZStack {
            LazyVGrid(columns: adaptiveColumns,alignment: .leading, spacing: 8) {
                ForEach(0..<model.count, id: \.self) { index in
                    let item = model[index]
                    TagOnBoardingView(model: item,isSelected: false)
                }
            }

        }
    }
}

struct OnboardingInterestsListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.appBlue.edgesIgnoringSafeArea(.all)
            OnboardingInterestsListView(model: [
                TagModel.familia,
                TagModel.amigos,
                TagModel.romance,
                TagModel.independencia,
            ])
        }
        .previewInterfaceOrientation(.portrait)
    }
}
