//
//  CalendarView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 07/10/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .background(Color.appYellow)
            .font(.custom(AppFont.palmerLakeScript.rawValue, size: 32))
            .accentColor(Color.appPink)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
