//
//  EventView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 27/10/22.
//

import SwiftUI

struct EventView: View {
    
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    private let model: [EventModel]
    
    init() {
        model = [EventModel.example1, EventModel.example2]
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
