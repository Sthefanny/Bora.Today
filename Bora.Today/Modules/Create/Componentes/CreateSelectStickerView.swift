//
//  CreateSelectStickerView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 19/10/22.
//

import SwiftUI

struct CreateSelectStickerView: View {
    //@State private var isSelected = false
    
    private let stickers: [StickerModel] = [
        .bora,
        .top,
        .legal,
        .delicia,
        .relax,
        .hmmm,
        .irado,
        .fofo,
        .wow
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Selecione até 3 adesivos")
                    .font(.appHeadline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(stickers, id: \.self) { sticker in
                            
                            StickerView(model: sticker)
                                .padding(.horizontal, -2)
                                .padding(.vertical, 2)
                            
                        }
                    }
                }
            }
        }
    }
}


struct CreateSelectStickerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSelectStickerView()
    }
}
