//
//  TagDefaultListView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 21/11/22.
//

import SwiftUI

struct TagDefaultListView: View {
    let model: [TagModel]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 108, maximum: 208)),
    ]

    var body: some View {
        ZStack {
            LazyVGrid(columns: adaptiveColumns,alignment: .leading, spacing: 8) {
                ForEach(0..<model.count, id: \.self) { index in
                    let item = model[index]
                    TagDefaultView(model: item, isSelected: false)
                }
            }

        }
    }
}

struct TagDefaultListView_Previews: PreviewProvider {
    static var previews: some View {
        TagDefaultListView(model: [
            TagModel.familia,
            TagModel.amigos,
            TagModel.romance,
            TagModel.independencia
            ]
            )
    }
}
