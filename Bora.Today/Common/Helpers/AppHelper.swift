//
//  AppHelper.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 15/09/22.
//

import FirebaseAnalytics
import Sentry

class AppHelper {
    static func logPage(pageName: String) {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(pageName)",
                                       AnalyticsParameterScreenClass: "\(pageName)"])
    }
    
    static func logError(domain: String, code: Int?, userInfo: [String : Any]? = nil) {
        let error = NSError(domain: domain, code: code ?? 0, userInfo: userInfo)
        SentrySDK.capture(error: error)
    }
}
