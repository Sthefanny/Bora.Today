//
//  BottomMenuView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 19/09/22.
//

import SwiftUI

struct BottomMenuView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @StateObject var locationManager = LocationManager()
    @State var selectedIndex: Int = 0
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.appWhite)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.appBlack)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: AppFont.figtree.name, size: 12)! ], for: .normal)
    }
    
    var body: some View {
        
        
        
        GeometryReader { screen in
            switch locationManager.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                RequestLocationView()
            case .authorizedAlways, .authorizedWhenInUse:
                TabView(selection: $selection) {
                    HomeView()
                        .tabItem {
                            Image(selection == 0 ? "home_selected" : "home")
                            Text("home".localized(language))
                        }
                        .tag(0)
                    
                    SearchView()
                        .tabItem {
                            Image(selection == 1 ? "search_selected" : "search")
                            Text("search".localized(language))
                        }
                        .tag(1)
                    
                    CreateView()
                        .tabItem {
                            Image(selection == 2 ? "create_selected" : "create")
                            Text("create".localized(language))
                        }
                        .tag(2)
                    
                    HistoryView()
                        .tabItem {
                            Image(selection == 3 ? "history_selected" : "history")
                            Text("history".localized(language))
                        }
                        .tag(3)
                    
                    HomeView()
                        .tabItem {
                            Image(selection == 4 ? "profile_selected" : "profile")
                            Text("profile".localized(language))
                        }
                        .tag(4)
                }
                .accentColor(.appBlack)
                .padding(.top, 20)
                .preferredColorScheme(.light)
            default:
                Text("Unexpected status")
            }
        }
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
        HistoryView()
    case .profile:
        HomeView()
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
