//
//  TagInterestsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct TagInterestsView: View {
    let model : UserModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(0..<model.tags!.count, id: \.self) { index in
                    let item = model.tags![index]
                    TagDefaultView(model: TagModel(text: item.text, icon: item.icon, color: item.color), isSelected: false)
                        .padding(1)
                        .disabled(true)
                }
            }
        }
    }
}

struct TagInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        TagInterestsView(model: UserModel.example1)
    }
}
