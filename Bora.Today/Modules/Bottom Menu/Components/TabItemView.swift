//
//  TabItemView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/09/22.
//

import SwiftUI

struct TabItemView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    let data: TabItemData
    let isSelected: Bool
    
    @State private var offset: CGFloat = 200.0
    
    var body: some View {
        VStack {
            Image(isSelected ? data.selectedImage : data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .animation(Animation.easeInOut(duration: 1.0), value: offset)
            
            Spacer().frame(height: 4)
            
            Text(data.title.localized(language))
                .foregroundColor(.black)
                .font(.system(size: 14))
        }
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TabItemView(data: TabItemData(image: "home", selectedImage: "home_selected", title: "Home"), isSelected: false)
            TabItemView(data: TabItemData(image: "home", selectedImage: "home_selected", title: "Home"), isSelected: true)

        }
    }
}
