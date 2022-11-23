//
//  PlaceCardListView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 09/11/22.
//

import SwiftUI

struct PlaceCardListView: View {
    
    private var model: [PlaceModel] = [
        .place1,
        .place1,
        .place1
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<model.count, id: \.self) { index in
                        let item = model[index]
                        HStack(spacing: 8) {
                            PlaceCardView(model: item, isInDiscover: true, isSaved: false)
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


struct PlaceCardListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardListView()
    }
}
