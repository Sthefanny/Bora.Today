//
//  CustomTabView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/09/22.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            Spacer()
            TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
        }
        .ignoresSafeArea()
    }
}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView<HomeView>(tabs: [TabItemData(image: "home" selectedImage: "home_selected", title: "Home")], selectedIndex: .constant(0), content: (Int) -> HomeView())
//    }
//}
