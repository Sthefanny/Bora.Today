//
//  CreateDatePickerView.swift
//  Bora.Today
//
//  Created by Larissa Paschoalin on 18/10/22.
//

import SwiftUI

struct CreateDatePickerView: View {
    
    @State var date: Date
    
    var body: some View {
        
        VStack {
            
            DatePicker("Data e hora \(Image("asterisk"))", selection: $date)
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
