//
//  ReviewListView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 06/10/22.
//

import SwiftUI

struct ReviewListView: View {
    let model: [ReviewModel]
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                Color.appPink.background()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("reviewsTitle".localized(language))
                            .font(.appTitle3)
                        .foregroundColor(.appWhite)
                        
                        Text("reviewsText".localized(language))
                            .font(.appFootnote)
                            .foregroundColor(.appWhite)
                    }
                    .padding(.leading, 21)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            
                            ForEach(0..<model.count, id: \.self) { index in
                                let item = model[index]
                                ReviewCardView(model: item)
                                    .frame(width: screen.size.width - 40, alignment: .center)
                                    .padding(.leading, index == 0 ? 21 : 0)
                                    .padding(.trailing, index == model.count - 1 ? 21 : 0)
                            }
                        }
                    }
                }
                .padding(.vertical, 24)
            }
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView(model: [ReviewModel.example1, ReviewModel.example2, ReviewModel.example3])
    }
}
