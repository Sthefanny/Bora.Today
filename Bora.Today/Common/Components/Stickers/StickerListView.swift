//
//  StickerListView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 07/10/22.
//

import SwiftUI

struct StickerListView: View {
    let stickerList: [StickerModel]?
    
    var body: some View {
        ZStack {
            if stickerList != nil {
                
                if stickerList!.count == 1 {
                    StickerView(model: stickerList![0], index: CGFloat(0), positionX: CGFloat(-50), positionY: CGFloat(-90))
                }
                
                if stickerList!.count == 2 {
                    StickerView(model: stickerList![0], index: CGFloat(0), positionX: CGFloat(-50), positionY: CGFloat(-90))
                    StickerView(model: stickerList![1], index: CGFloat(0), positionX: CGFloat(-57), positionY: CGFloat(-58))
                }
                
                if stickerList!.count == 3 {
                    StickerView(model: stickerList![0], index: CGFloat(0), positionX: CGFloat(-17), positionY: CGFloat(-58))
                    StickerView(model: stickerList![1], index: CGFloat(0), positionX: CGFloat(-45), positionY: CGFloat(-80))
                    StickerView(model: stickerList![2], index: CGFloat(0), positionX: CGFloat(-10), positionY: CGFloat(-90))
                }
            }
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        StickerListView(stickerList: [StickerModel.top])
    }
}
