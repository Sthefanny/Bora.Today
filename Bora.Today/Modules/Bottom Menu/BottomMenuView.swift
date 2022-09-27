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
    
    var body: some View {
        ZStack(alignment: .top) {
//            NavigationView {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("home".localized(language))
                        }
                    
                    CreateView()
                        .tabItem {
                            Image(systemName: "plus")
                            Text("create".localized(language))
                        }
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("search".localized(language))
                        }
                }
                .onAppear() {
                    let appearance = UITabBarAppearance()
                    appearance.configureWithTransparentBackground()
                    appearance.shadowColor = .black
                    appearance.shadowImage = UIImage(named: "tab-shadow")?.withRenderingMode(.alwaysTemplate)
                    appearance.backgroundColor = UIColor.white

                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
                .accentColor(.purple)
                .shadow(color: .red.opacity(0.5), radius: 6, x: 0, y: 0)
            
                SettingsView()
//            }
        }
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
    }
}
