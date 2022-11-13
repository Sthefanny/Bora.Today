//
//  Bora_TodayApp.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 29/08/22.
//

import SwiftUI
import FirebaseCore
import Sentry

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        SentrySDK.start { options in
            options.dsn = "https://7c08c095475a4dc2a718a0edf8f29c8f@o1391982.ingest.sentry.io/6713051"
            options.debug = false // Enabled debug when first installing is always helpful
            
            // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
            // We recommend adjusting this value in production.
            options.tracesSampleRate = 1.0
        }
        
        return true
    }
}

@main
struct BoraTodayApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                BottomMenuView()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
