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
        HStack(spacing: 4) {
            if model.icon != nil {
                Image(systemName: model.icon!)
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(isSelected ? Color.appWhite : model.color)
            }
            
            Text(model.text)
                .font(.appFootnote)
                .foregroundColor(isSelected ? Color.appWhite : Color.appBlack)
        }
        .DefaultTagStyle(color: model.color, isSelected: isSelected, hasIcon: model.icon != nil)
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
                TagDefaultView(model: TagModel.familia, isSelected: false)
                TagDefaultView(model: TagModel.danca, isSelected: false)
                TagDefaultView(model: TagModel.arLivre, isSelected: false)
                TagDefaultView(model: TagModel.comidas, isSelected: false)
                TagDefaultView(model: TagModel.saude, isSelected: false)
            }
        }
    }
}
