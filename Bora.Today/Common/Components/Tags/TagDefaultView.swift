//
//  TagDefaultView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI

struct TagDefaultView: View {
    let model: TagModel
    let isSelected: Bool
    
    var body: some View {
        HStack {
            if model.icon != nil {
                Image(systemName: model.icon)
                    .foregroundColor(isSelected ? Color.clear : model.color)
            }
            
            Text(model.text)
                .font(.appFootnote)
                .foregroundColor(isSelected ? Color.clear : model.color)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color.clear : model.color)
        )
    }
}

struct TagDefaultView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
            TagDefaultView(model: TagModel.example, isSelected: false)
        }
    }
}
