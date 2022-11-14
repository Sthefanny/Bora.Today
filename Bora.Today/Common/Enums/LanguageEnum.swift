//
//  LanguageEnum.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/09/22.
//

import Foundation

enum Language: String {
    case english = "en"
    case portuguese = "pt-BR"
    
    var userSymbol: String {
        switch self {
        case .english:
            return "us"
        case .portuguese:
            return "br"
        default:
            return rawValue
        }
    }
}
