//
//  CalendarEventView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 03/11/22.
//

import SwiftUI

struct CalendarEventView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    var model: EventModel
    
    var body: some View {
        GeometryReader { screen in
            VStack {
                HStack(spacing: 0) {
                    VStack (alignment: .leading, spacing: 4) {
                        HStack (spacing: 16) {
                            Text("from".localized(language) + " " + DateHelper.getHour(model.initialDate))
                                .font(.appCallout)
                                .foregroundColor(.appBlack)
                                .frame(width: screen.size.width * 0.22, alignment: .leading)
                            
                            Text(model.name)
                                .font(.appHeadline)
                        }
                        
                        HStack (spacing: 16) {
                            Text("to".localized(language) + " " + DateHelper.getHour(model.finalDate))
                                .font(.appSubheadline)
                                .foregroundColor(.appGray)
                                .frame(width: screen.size.width * 0.22, alignment: .leading)
                            
                            HStack(spacing: 4) {
                                Image("pin_place")
                                
                                Text(model.location)
                                    .font(.appFootnote)
                                .foregroundColor(.appDarkGray)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.appBlueButton)
                }
                
                Divider()
            }
            .padding(.horizontal, 21)
        }
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView(model: EventModel.example1)
    }
}
