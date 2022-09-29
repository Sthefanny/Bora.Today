//
//  TabTypeEnum.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/09/22.
//

import Foundation

enum TabType: Int, CaseIterable {
    case home = 0
    case search
    case create
    case history
    case profile
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "home", selectedImage: "home_selected", title: "Home")
        case .search:
            return TabItemData(image: "search", selectedImage: "search_selected", title: "Explore")
        case .create:
            return TabItemData(image: "create", selectedImage: "create_selected", title: "Create")
        case .history:
            return TabItemData(image: "history", selectedImage: "history_selected", title: "History")
        case .profile:
            return TabItemData(image: "profile", selectedImage: "profile_selected", title: "Profile")
        }
    }
}
