//
//  BottomMenuView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 19/09/22.
//

import SwiftUI

struct BottomMenuView: View {
    @StateObject var locationManager = LocationManager()
    @State var selectedIndex: Int = 0
    
    var body: some View {
        
//        TabView {
//            HomeView()
//                .tabItem {
//                    Image("home")
//                    Text("tab1")
//                }
//
//            SearchView()
//                .tabItem {
//                    Label("Order", systemImage: "square.and.pencil")
//                }
//        }
        
        GeometryReader { screen in
            CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                switch locationManager.authorizationStatus {
                case .notDetermined, .restricted, .denied:
                    RequestLocationView()
                case .authorizedAlways, .authorizedWhenInUse:
                    let type = TabType(rawValue: index) ?? .home
                    getTabView(type: type)
                        .frame(width: screen.size.width, height: screen.size.height - AppConfig.bottomMenuHeight)
                        .padding(.vertical, 30)
                        .environmentObject(locationManager)
                default:
                    Text("Unexpected status")
                }
            }
            .frame(height: screen.size.height)
        }
        .ignoresSafeArea()
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
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
