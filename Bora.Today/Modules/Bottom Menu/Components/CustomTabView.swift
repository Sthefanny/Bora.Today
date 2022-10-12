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
        
        GeometryReader { screen in
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
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: .constant(0)) { index in
            ScrollView {
                Text("Unexpected status")
            }
        }
    }
}
