//
//  TagDefaultView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 09/10/22.
//

import SwiftUI

struct TagDefaultView: View {
    let model: TagModel
    @State var isSelected: Bool
    
    var body: some View {
        HStack {
            if model.icon != nil {
                Image(systemName: model.icon!)
                    .foregroundColor(isSelected ? Color.appWhite : model.color)
            }
            
            Text(model.text)
                .font(.appFootnote)
                .foregroundColor(isSelected ? Color.appWhite : Color.appBlack)
        }
        .DefaultTagStyle(color: model.color, isSelected: isSelected)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct TagDefaultView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
//            Color.orange.edgesIgnoringSafeArea(.all)
            VStack {
                TagDefaultView(model: TagModel.example1, isSelected: false)
                TagDefaultView(model: TagModel.example2, isSelected: false)
                TagDefaultView(model: TagModel.example3, isSelected: false)
            }
        }
    }
}
