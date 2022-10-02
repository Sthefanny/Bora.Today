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
            return TabItemData(image: "home", selectedImage: "home_selected", title: "home")
        case .search:
            return TabItemData(image: "search", selectedImage: "search_selected", title: "search")
        case .create:
            return TabItemData(image: "create", selectedImage: "create_selected", title: "create")
        case .history:
            return TabItemData(image: "history", selectedImage: "history_selected", title: "history")
        case .profile:
            return TabItemData(image: "profile", selectedImage: "profile_selected", title: "profile")
        }
    }
}
