//
//  CreateSelectStickerView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 19/10/22.
//

import SwiftUI

struct CreateSelectStickerView: View {

    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
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
            VStack(alignment: .leading, spacing: 0) {
                
                Text("selectStickerTitle".localized(language))
                    .font(.appHeadline)
                    .padding(.horizontal, 21)
                    
                
                Text("selectStickerFootnote".localized(language))
                    .font(.appFootnote)
                    .padding(.horizontal, 21)
                    .padding(.bottom, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<stickers.count, id: \.self) { index in
                            let item = stickers[index]
                            StickerView(model: item)
                                .padding(.leading, index == 0 ? 21 : 0)
                                .padding(.trailing, index == stickers.count - 1 ? 21 : 0)
                        }
                        
                    }
                    .padding(.vertical, 2)
                }
            }
    }
}


struct CreateSelectStickerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSelectStickerView()
    }
}
