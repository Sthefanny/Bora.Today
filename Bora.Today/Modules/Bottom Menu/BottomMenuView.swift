//
//  BottomMenuView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 19/09/22.
//

import SwiftUI

struct BottomMenuView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeView()
        case .search:
            SearchView()
        case .create:
            CreateView()
        case .history:
            HomeView()
        case .profile:
            HomeView()
        }
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
