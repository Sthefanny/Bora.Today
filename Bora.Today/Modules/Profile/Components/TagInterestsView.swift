//
//  TagInterestsView.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 08/11/22.
//

import SwiftUI

struct TagInterestsView: View {
    let model : UserModel
    var width = UIScreen.main.bounds.width

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8) {
                ForEach(0..<model.tags!.count, id: \.self) { index in
                    let item = model.tags![index]
                    TagDefaultView(model: TagModel(text: item.text, icon: item.icon, color: item.color), isSelected: false)
                        .disabled(true)
                }
            }
            .frame(width: width, height: 30, alignment: .center)
        }
    }
}

struct TagInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        TagInterestsView(model: UserModel.example1)
    }
}
