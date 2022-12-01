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
                    StickerInImageView(model: stickerList![0], index: CGFloat(0), positionX: CGFloat(10), positionY: CGFloat(-90))
                }
                
                if stickerList!.count == 2 {
                    StickerInImageView(model: stickerList![0], index: CGFloat(0), positionX: CGFloat(10), positionY: CGFloat(-90))
                    StickerInImageView(model: stickerList![1], index: CGFloat(0), positionX: CGFloat(17), positionY: CGFloat(-58))
                }
                
                if stickerList!.count == 3 {
                    StickerInImageView(model: stickerList![0], index: CGFloat(0), positionX: CGFloat(30), positionY: CGFloat(-58))
                    StickerInImageView(model: stickerList![1], index: CGFloat(0), positionX: CGFloat(10), positionY: CGFloat(-80))
                    StickerInImageView(model: stickerList![2], index: CGFloat(0), positionX: CGFloat(43), positionY: CGFloat(-90))
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
