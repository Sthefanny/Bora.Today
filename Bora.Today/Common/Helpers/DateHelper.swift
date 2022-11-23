//
//  DateHelper.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/11/22.
//

import Foundation
import SwiftUI

class DateHelper {
    
    static func getDate(_ stringDate: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatted = dateFormatter.date(from: stringDate) ?? Date()
        return dateFormatted
    }
    
    static func getDateAsString(_ date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatted = dateFormatter.string(from: date)
        return dateFormatted
    }
    
    static func getHour(_ stringDate: String) -> String {
        
        let dateToChange = getDate(stringDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "HH:mm"
        let dateFormatted = dateFormatter.string(from: dateToChange)
        return dateFormatted
    }
    
    static func getFormattedDate(_ stringDate: String, format: String) -> String {
        
        let dateToChange = getDate(stringDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = format
        let dateFormatted = dateFormatter.string(from: dateToChange)
        return dateFormatted
    }

    static func getDateString(_ dateToChange: Date) -> String? {
        @AppStorage("language")
        var language = LocalizationManager.shared.language
        
        var message: String?
        
        if Calendar.current.isDateInToday(dateToChange) {
            message = "today".localized(language)
        } else if Calendar.current.isDateInTomorrow(dateToChange) {
            message = "tomorrow".localized(language)
        } else if Calendar.current.isDateInYesterday(dateToChange) {
            message = "yesterday".localized(language)
        }
        
        return message
    }
}
