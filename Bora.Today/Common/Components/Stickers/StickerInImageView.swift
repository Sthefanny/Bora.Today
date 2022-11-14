//
//  StickerInImageView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 12/11/22.
//

import SwiftUI

struct StickerInImageView: View {
    let model: StickerModel
    let index: CGFloat
    let positionX: CGFloat
    let positionY: CGFloat

    
    var body: some View {
        Text(model.text)
            .font(.custom(model.font.name, size: model.fontSize))
            .foregroundColor(model.fontColor)
            .frame(width: model.size, height: model.size, alignment: .center)
            .background(model.bgColor)
            .clipShape(Circle())
            .offset(x: positionX, y: positionY)
//            .position(x: positionX, y: positionY)


    }
}

struct StickerInImageView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            StickerInImageView(model: StickerModel.legal, index: 1, positionX: -50, positionY: -52)
            StickerInImageView(model: StickerModel.top, index: 0, positionX: -28, positionY: -25)
            StickerInImageView(model: StickerModel.bora, index: 2, positionX: -65, positionY: -22)
            StickerInImageView(model: StickerModel.irado, index: 3, positionX: -15, positionY: -55)
            StickerInImageView(model: StickerModel.delicia, index: 4, positionX: -85, positionY: -55)
        }
    }
    
}
