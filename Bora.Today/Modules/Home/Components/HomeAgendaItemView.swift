//
//  HomeAgendaItemView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 18/11/22.
//

import SwiftUI

struct HomeAgendaItemView: View {
    let model: ExperienceModel
    
    var body: some View {
        
        NavigationLink(destination: CalendarView()) {
            HStack {
                
                HStack(spacing: 40) {
                    ZStack {
                        Image(model.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 67, height: 67)
                        .clipShape(Circle())
                        
                        ZStack {
                            if model.stickers != nil {
                                
                                if model.stickers!.count == 1 {
                                    StickerInImageView(model: model.stickers![0], index: CGFloat(0), positionX: CGFloat(35), positionY: CGFloat(-15))
                                }
                                
                                if model.stickers!.count == 2 || model.stickers!.count == 3 {
                                    StickerInImageView(model: model.stickers![0], index: CGFloat(0), positionX: CGFloat(20), positionY: CGFloat(-25))
                                    StickerInImageView(model: model.stickers![1], index: CGFloat(0), positionX: CGFloat(35), positionY: CGFloat(5))
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(model.name)
                            .font(.appHeadline)
                            .foregroundColor(.appBlack)
                        
                        HStack {
                            Image("pin_place")
                                .foregroundColor(.black)
                            
                            Text(model.event.location.name)
                                .font(.appFootnote)
                                .foregroundColor(.appGrayText)
                        }
                        
                        HStack {
                            Image("time")
                                .foregroundColor(.black)
                            
                            Text(DateHelper.getFormattedDate(model.event.initialDate, format: "MMM dd, HH:mm"))
                                .font(.appFootnote)
                                .foregroundColor(.appGrayText)
                        }
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .foregroundColor(.appBlueButton)
            }
            .padding(16)
            .frame(width: UIScreen.main.bounds.width - 42, height: 100)
            .background(Color.appWhite)
            .cornerRadius(18)
            .shadow(color: .appGray, radius: 4, x: 0, y: 0)
        }
    }
}

struct HomeAgendaItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAgendaItemView(model: ExperienceModel.example3)
    }
}
