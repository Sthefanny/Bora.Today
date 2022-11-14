//
//  CreateDatePickerView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 18/10/22.
//

import SwiftUI

struct CreateDatePickerView: View {
    @AppStorage("language")
    private var language = LocalizationManager.shared.language
    
    @State var date: Date
    
    var body: some View {
        
        VStack {
            
            DatePicker("\(Text("datePickerTitle".localized(language))) \(Image("asterisk"))", selection: $date, in: .now...)
                .font(.appHeadline)
                .foregroundColor(.appBlack)
        }
    }
}

struct CreateDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDatePickerView(date: .now)
    }
}
