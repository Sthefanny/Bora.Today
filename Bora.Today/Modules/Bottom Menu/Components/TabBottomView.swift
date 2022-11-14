//
//  TabBottomView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/09/22.
//

import SwiftUI

struct TabBottomView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    let tabbarItems: [TabItemData]
    var width: CGFloat = UIScreen.main.bounds.width
    @Binding var selectedIndex: Int
    
    
    var body: some View {
        
            HStack {
                Spacer()
                
                ForEach(tabbarItems.indices) { index in
                    let item = tabbarItems[index]
                    Button {
                        self.selectedIndex = index
                    } label: {
                        let isSelected = selectedIndex == index
                        TabItemView(data: item, isSelected: isSelected)
                    }
                    Spacer()
                }
            }
            .frame(width: width, height: AppConfig.bottomMenuHeight)
            .padding(.top, 0)
            .padding(.bottom, 15)
            .background(Color.appWhite)
            .cornerRadius(radius: 10.0, corners: [.topLeft, .topRight])
            .shadow(radius: 12, x: 0, y: -7)
    }
}

struct TabBottomView_Previews: PreviewProvider {
    static var previews: some View {
        TabBottomView(tabbarItems: [
            TabItemData(image: "home", selectedImage: "home_selected", title: "Home"),
            TabItemData(image: "search", selectedImage: "search_selected", title: "Explore"),
            TabItemData(image: "create", selectedImage: "create_selected", title: "Create"),
            TabItemData(image: "history", selectedImage: "history_selected", title: "History"),
            TabItemData(image: "profile", selectedImage: "profile_selected", title: "Profile")
        ], selectedIndex: .constant(0))
    }
}
