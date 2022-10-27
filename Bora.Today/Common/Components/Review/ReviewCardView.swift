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
            HStack(alignment: .top) {
                ProfileImageView()
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("@" + model.user.username + " em " + model.location)
                            .font(.appHeadline)
                        
                        Spacer()
                        
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.appBlueButton)
                                .frame(width: 10, height: 10)
                            
                            Text("\(String(format: "%.1f", model.score))")
                                .font(.appCaption1)
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
        .frame(height: 131)
        .padding(10)
        .background(Color.appWhite)
        .cornerRadius(18)
    }
}

struct ReviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.background()
            ReviewCardView(model: ReviewModel.example1)
        }
        .ignoresSafeArea()
    }
}
