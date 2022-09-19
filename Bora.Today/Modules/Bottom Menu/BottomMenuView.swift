//
//  BottomMenuView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 19/09/22.
//

import SwiftUI

struct BottomMenuView: View {
    var body: some View {
        ZStack {
            NavigationView {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    
                    CreateView()
                        .tabItem {
                            Image(systemName: "plus")
                            Text("Create")
                        }
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
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
            }
        }
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
    }
}
