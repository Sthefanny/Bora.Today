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
    
    @State var selectedTab: TabType = .home
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.appWhite)
        UITabBar.appearance().backgroundColor = UIColor(Color.appWhite)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.appBlack)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: AppFont.figtree.name, size: 12)! ], for: .normal)
    }
    
    var body: some View {
        
        GeometryReader { screen in
            switch locationManager.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                RequestLocationView()
            case .authorizedAlways, .authorizedWhenInUse:
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Image(selectedTab == .home ? "home_selected" : "home")
                            Text("home".localized(language))
                        }
                        .tag(TabType.home)
                    
                    DiscoverView()
                        .tabItem {
                            Image(selectedTab == .discover ? "search_selected" : "search")
                            Text("discoverTitle".localized(language))
                        }
                        .tag(TabType.discover)
                    
                    CreateView()
                        .tabItem {
                            Image(selectedTab == .create ? "create_selected" : "create")
                            Text("create".localized(language))
                        }
                        .tag(TabType.create)
                    
                    HistoryView()
                        .tabItem {
                            Image(selectedTab == .history ? "history_selected" : "history")
                            Text("history".localized(language))
                        }
                        .tag(TabType.history)
                    
                    ProfileView(isSelfProfile: true, model: UserModel.example1)                        .tabItem {
                        Image(selectedTab == .profile ? "profile_selected" : "profile")
                        Text("profile".localized(language))
                    }
                    .tag(TabType.profile)
                }
                .ignoresSafeArea()
                .frame(height: screen.size.height)
                .accentColor(.appBlack)
                .padding(.top, 20)
                .preferredColorScheme(.light)
            default:
                Text("Unexpected status")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
