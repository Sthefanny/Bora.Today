//
//  HistoryCardView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 18/10/22.
//

import SwiftUI

struct HistoryCardView: View {
    let model: HistoryCardModel
    
    var body: some View {
        if model.isBig {
            _buildBigCard
        } else {
            _buildSmallCard
        }
    }
    
    private var _buildSmallCard: some View{
        VStack (alignment: .leading, spacing: 0) {
            Text(model.title)
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appWhite)
                .padding(.bottom, 24)
            
            HStack (spacing: 0) {
                Text(model.number)
                    .font(.custom(AppFont.figtree.name, size: 42))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                
                Spacer()
                
                Image(model.image)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 12)
        .padding(.horizontal, 12)
        .background(model.color)
        .cornerRadius(18)
    }
    
    private var _buildBigCard: some View{
        VStack (alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.appTitle3)
                .fontWeight(.semibold)
                .foregroundColor(.appWhite)
            
            Text(model.subtitle ?? "")
                .font(.appSubheadline)
                .foregroundColor(.appWhite)
            
            Text(model.number)
                .font(.custom(AppFont.figtree.name, size: 68))
                .fontWeight(.semibold)
                .foregroundColor(.appWhite)
                .padding(.bottom, 64)
            
            HStack {
                Text(model.additionalText ?? "")
                    .font(.custom(AppFont.figtree.name, size: 14))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.appWhite)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                Spacer()
                
                Image(model.image)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 12)
        .padding(.horizontal, 12)
        .background(model.color)
        .cornerRadius(18)
    }
}

struct HistoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HistoryCardView(model: HistoryCardModel.example1)
            HistoryCardView(model: HistoryCardModel.example2)
            HistoryCardView(model: HistoryCardModel.example3)
        }
    }
}
