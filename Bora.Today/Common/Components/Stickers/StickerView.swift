//
//  StickerView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 06/10/22.
//

import SwiftUI

class StickerManager: ObservableObject {
//
//    @Published var stickersSelected: [StickerModel] = []
//    {
//        didSet {
//
//            if stickersSelected.count >= 3 {
//                stickersSelected = oldValue
//            } else {
//                stickersSelected.append(stickersSelected)
//            print(stickersSelected)
//            }
//        }
//
//    }
    
//    func update(model: StickerModel) {
//            stickersSelected?.append(model)
//        print(stickersSelected)
//    }
}

struct StickerView: View {
    //var callback: (Bool) -> Bool
    
    @StateObject var manager = StickerManager()
    
    let model: StickerModel
    @State private var isSelected: Bool = false
    var index: CGFloat?
    var positionX: CGFloat?
    var positionY: CGFloat?
    
    var body: some View {
        VStack {
            ZStack {
//                if isSelected {
//                    Circle()
//                        .foregroundColor(.clear)
//                        .frame(width: model.size * 1.2, height: model.size * 1.2, alignment: .center)
//                        .background(
//                            Circle()
//                                .stroke(Color.appGray, lineWidth: 2)
//                        )
//                }
                
                Text(model.text)
                    .font(.custom(model.font.name, size: model.fontSize))
                    .foregroundColor(model.fontColor)
                    .frame(width: model.size, height: model.size, alignment: .center)
                    .background(model.bgColor)
                    .clipShape(Circle())
            }
        }
        .padding(4)
        .overlay(
            Circle().stroke(isSelected ? Color.appGray : Color.clear, lineWidth: 2)
        )
        .onTapGesture {
            isSelected.toggle()
           // manager.stickersSelected = model
        }
    }
}



struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StickerView(model: StickerModel.legal)
        }
    }
}
