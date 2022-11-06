//
//  CountryHelper.swift
//  Bora.Today
//
//  Created by Ana Luisa Duda Stege on 28/10/22.
//

import Foundation

class CountryHelper {
    static func getCountries() -> [String] {
        
        var arrayOfCountries: [String] = []
        
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            arrayOfCountries.sort()
            arrayOfCountries.append(name)
        }
        return arrayOfCountries
    }
}
