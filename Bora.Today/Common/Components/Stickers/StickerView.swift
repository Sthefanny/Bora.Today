//
//  StickerView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 06/10/22.
//

import SwiftUI

struct StickerView: View {
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

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            StickerView(model: StickerModel.legal, index: 1, positionX: -50, positionY: -52)
            StickerView(model: StickerModel.top, index: 0, positionX: -28, positionY: -25)
            StickerView(model: StickerModel.bora, index: 2, positionX: -65, positionY: -22)
            StickerView(model: StickerModel.irado, index: 3, positionX: -15, positionY: -55)
            StickerView(model: StickerModel.delicia, index: 4, positionX: -85, positionY: -55)
        }
    }
}
