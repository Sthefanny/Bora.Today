//
//  NotificationSystemImageView.swift
//  Bora.Today
//
//  Created by Sthefanny Gonzaga on 24/10/22.
//

import SwiftUI

struct NotificationSystemImageView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.appBlueButton)
                .frame(width: 54, height: 54)
            
            Image(systemName: "star.fill")
                .font(.system(size: 30))
                .foregroundColor(.appWhite)
        }
    }
}

struct NotificationSystemImageView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSystemImageView()
    }
}
