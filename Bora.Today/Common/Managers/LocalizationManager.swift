//
//  LocalizationManager.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/09/22.
//

import Foundation

class LocalizationManager {

    static let shared = LocalizationManager()
    static let changedLanguage = Notification.Name("changedLanguage")

    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .english
            }
            return Language(rawValue: languageString) ?? .english
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationManager.changedLanguage, object: nil)
            }
        }
    }
}
