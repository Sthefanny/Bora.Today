//
//  ReviewCardView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI

struct ReviewCardView: View {
    let model: ReviewModel
    
    var body: some View {
        VStack {
            HStack {
                ProfileImageView(image: model.user.image, country: model.user.originCountry)
                VStack(alignment: .leading) {
                    HStack {
                        Text("@" + model.user.username + " em " + model.location)
                            .font(.appHeadline)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .frame(width: 12, height: 12)
                            Text("\(String(format: "%.1f", model.score))")
                        }
                    }
                    
                    Text(model.text)
                        .lineLimit(3)
                        .font(.appSubheadline)
                    
                    HStack {
                        ForEach(0..<model.tags!.count, id: \.self) { index in
                            let item = model.tags![index]
                            TagDefaultView(model: TagModel(text: item, icon: "", color: Color.red), isSelected: false)
                        }
                    }
                }
            }
        }
    }
}

struct ReviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCardView(model: ReviewModel.example1)
    }
}
